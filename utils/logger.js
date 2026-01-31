/**
 * utils/logger.js - Application Logging Utility
 * 
 * This module provides logging functionality using Winston.
 * It logs both to console (for development) and to files (for production).
 * 
 * Log Levels (least to most severe):
 * error: 0, warn: 1, info: 2, http: 3, verbose: 4, debug: 5, silly: 6
 */

const winston = require('winston');
const path = require('path');

// Define log format
const logFormat = winston.format.combine(
  // Add timestamp
  winston.format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
  
  // Add colors (only for console)
  winston.format.colorize({ all: true }),
  
  // Format: TIMESTAMP [LEVEL]: MESSAGE
  winston.format.printf(
    (info) => `${info.timestamp} [${info.level}]: ${info.message}`
  )
);

// File format (without colors)
const fileFormat = winston.format.combine(
  winston.format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),
  winston.format.json()
);

// ==========================================
// CREATE LOGGER INSTANCE
// ==========================================

const logger = winston.createLogger({
  // Default log level from env, fallback to 'info'
  level: process.env.LOG_LEVEL || 'info',
  
  // Default metadata included in all logs
  defaultMeta: {
    service: 'ecommerce-api',
    environment: process.env.NODE_ENV || 'development'
  },
  
  // Transports (where logs go)
  transports: [
    // 1. Console output (always enabled)
    new winston.transports.Console({
      format: logFormat
    })
  ]
});

// ==========================================
// FILE LOGGING (Production only)
// ==========================================

if (process.env.NODE_ENV === 'production') {
  // Add file transports in production
  
  // All logs to combined.log
  logger.add(new winston.transports.File({
    filename: process.env.LOG_FILE || 'logs/app.log',
    format: fileFormat,
    maxsize: 5242880, // 5MB
    maxFiles: 5
  }));
  
  // Error-only logs to error.log
  logger.add(new winston.transports.File({
    filename: 'logs/error.log',
    level: 'error',
    format: fileFormat,
    maxsize: 5242880,
    maxFiles: 5
  }));
}

// ==========================================
// STREAM FOR MORGAN (HTTP logging)
// ==========================================

// If we add Morgan later for HTTP request logging
logger.stream = {
  write: (message) => {
    logger.http(message.trim());
  }
};

// ==========================================
// EXPORT
// ==========================================

module.exports = logger;
