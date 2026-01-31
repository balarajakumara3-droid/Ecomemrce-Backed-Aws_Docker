/**
 * middleware/error.middleware.js - Global Error Handler
 * 
 * This middleware catches all errors thrown in the application
 * and returns a consistent, safe response to the client.
 * 
 * IMPORTANT: Never expose internal error details to the client in production!
 * Log detailed errors server-side, send generic messages to client.
 */

const logger = require('../utils/logger');

/**
 * Custom API Error class
 * Allows us to create errors with specific status codes
 */
class ApiError extends Error {
  constructor(message, statusCode = 500, errors = []) {
    super(message);
    this.statusCode = statusCode;
    this.errors = errors;
    this.isOperational = true; // Distinguish operational vs programming errors
    
    Error.captureStackTrace(this, this.constructor);
  }
}

/**
 * Global error handling middleware
 * Express recognizes this as error middleware because it has 4 parameters
 */
const errorHandler = (err, req, res, next) => {
  // Default error values
  let statusCode = err.statusCode || 500;
  let message = err.message || 'Internal Server Error';
  let errors = err.errors || [];
  
  // Log the error (with full details for debugging)
  logger.error({
    message: err.message,
    stack: err.stack,
    statusCode: statusCode,
    path: req.path,
    method: req.method,
    ip: req.ip,
    user: req.user?.userId || 'anonymous'
  });
  
  // ==========================================
  // HANDLE SPECIFIC ERROR TYPES
  // ==========================================
  
  // PostgreSQL errors
  if (err.code === '23505') {
    // Unique violation (duplicate key)
    statusCode = 409;
    message = 'Resource already exists.';
    // Extract field name from error detail if possible
    const match = err.detail?.match(/Key \((.*)\)=/);
    if (match) {
      message = `${match[1]} already exists.`;
    }
  }
  
  if (err.code === '23503') {
    // Foreign key violation
    statusCode = 400;
    message = 'Referenced resource does not exist.';
  }
  
  if (err.code === '23502') {
    // Not null violation
    statusCode = 400;
    message = 'Required field is missing.';
  }
  
  // JWT errors (should be caught in auth middleware, but just in case)
  if (err.name === 'TokenExpiredError') {
    statusCode = 401;
    message = 'Token expired.';
  }
  
  if (err.name === 'JsonWebTokenError') {
    statusCode = 401;
    message = 'Invalid token.';
  }
  
  // Validation errors (from express-validator)
  if (err.errors && Array.isArray(err.errors)) {
    statusCode = 400;
    message = 'Validation failed.';
    errors = err.errors;
  }
  
  // Syntax errors (malformed JSON)
  if (err instanceof SyntaxError && err.status === 400 && 'body' in err) {
    statusCode = 400;
    message = 'Invalid JSON in request body.';
  }
  
  // ==========================================
  // PREPARE RESPONSE
  // ==========================================
  
  // In production, hide internal error details
  if (process.env.NODE_ENV === 'production') {
    // Don't expose stack traces or internal details
    if (statusCode === 500) {
      message = 'An unexpected error occurred.';
    }
  }
  
  // Build response object
  const response = {
    success: false,
    message: message,
    ...(errors.length > 0 && { errors }), // Only include if there are errors
    ...(process.env.NODE_ENV !== 'production' && { 
      // Include stack trace in development only
      stack: err.stack 
    })
  };
  
  // Send response
  res.status(statusCode).json(response);
};

/**
 * Handle unhandled promise rejections
 * These occur when a Promise is rejected but not caught
 */
process.on('unhandledRejection', (err) => {
  logger.error('Unhandled Promise Rejection:', err);
  // In production, you might want to restart the process
  // process.exit(1);
});

/**
 * Handle uncaught exceptions
 * These are synchronous errors not caught by try-catch
 */
process.on('uncaughtException', (err) => {
  logger.error('Uncaught Exception:', err);
  // Always exit on uncaught exceptions - the process is in an undefined state
  process.exit(1);
});

module.exports = errorHandler;
module.exports.ApiError = ApiError;
