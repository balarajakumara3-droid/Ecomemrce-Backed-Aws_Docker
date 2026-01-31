/**
 * middleware/auth.middleware.js - JWT Authentication Middleware
 * 
 * This middleware verifies JSON Web Tokens (JWT) on protected routes.
 * It checks the Authorization header, validates the token,
 * and attaches the decoded user data to the request object.
 * 
 * JWT Structure:
 * Header.Payload.Signature
 * 
 * Flow:
 * 1. Extract token from Authorization header
 * 2. Verify token signature and expiration
 * 3. Decode payload (contains user id, email, etc.)
 * 4. Attach user to req.user
 * 5. Call next() to proceed to the route handler
 */

const jwt = require('jsonwebtoken');
const logger = require('../utils/logger');

// Get JWT secret from environment
const JWT_SECRET = process.env.JWT_SECRET;

if (!JWT_SECRET) {
  logger.error('⚠️  JWT_SECRET not set in environment variables!');
  logger.error('Authentication will fail. Set JWT_SECRET in your .env file.');
}

/**
 * Verify JWT token from Authorization header
 * @param {Object} req - Express request object
 * @param {Object} res - Express response object  
 * @param {Function} next - Express next function
 */
const authenticateToken = (req, res, next) => {
  try {
    // 1. Get Authorization header
    const authHeader = req.headers['authorization'];
    
    // 2. Check if header exists
    if (!authHeader) {
      return res.status(401).json({
        success: false,
        message: 'Access denied. No authorization header provided.'
      });
    }
    
    // 3. Extract token (format: "Bearer <token>")
    const parts = authHeader.split(' ');
    
    if (parts.length !== 2 || parts[0] !== 'Bearer') {
      return res.status(401).json({
        success: false,
        message: 'Invalid authorization format. Use: Bearer <token>'
      });
    }
    
    const token = parts[1];
    
    // 4. Verify token
    jwt.verify(token, JWT_SECRET, (err, decoded) => {
      if (err) {
        // Different errors for different scenarios
        if (err.name === 'TokenExpiredError') {
          return res.status(401).json({
            success: false,
            message: 'Token expired. Please login again.',
            error: 'TOKEN_EXPIRED'
          });
        }
        
        if (err.name === 'JsonWebTokenError') {
          return res.status(401).json({
            success: false,
            message: 'Invalid token.',
            error: 'INVALID_TOKEN'
          });
        }
        
        return res.status(403).json({
          success: false,
          message: 'Token verification failed.',
          error: err.message
        });
      }
      
      // 5. Attach decoded user data to request
      // decoded contains: { userId, email, isAdmin, iat, exp }
      req.user = decoded;
      
      logger.debug(`Authenticated user: ${decoded.email} (${decoded.userId})`);
      
      // 6. Proceed to next middleware/route handler
      next();
    });
    
  } catch (error) {
    logger.error('Authentication middleware error:', error);
    return res.status(500).json({
      success: false,
      message: 'Authentication error occurred.'
    });
  }
};

/**
 * Optional authentication - doesn't fail if no token
 * Useful for routes that work for both logged-in and guest users
 */
const optionalAuth = (req, res, next) => {
  try {
    const authHeader = req.headers['authorization'];
    
    if (!authHeader) {
      // No token, but that's ok - continue as guest
      req.user = null;
      return next();
    }
    
    const parts = authHeader.split(' ');
    if (parts.length !== 2 || parts[0] !== 'Bearer') {
      req.user = null;
      return next();
    }
    
    const token = parts[1];
    
    jwt.verify(token, JWT_SECRET, (err, decoded) => {
      if (err) {
        // Invalid token, but continue as guest
        req.user = null;
        return next();
      }
      
      // Valid token
      req.user = decoded;
      next();
    });
    
  } catch (error) {
    // Any error, continue as guest
    req.user = null;
    next();
  }
};

/**
 * Admin-only middleware
 * Must be used AFTER authenticateToken
 * Checks if user has isAdmin flag
 */
const requireAdmin = (req, res, next) => {
  if (!req.user) {
    return res.status(401).json({
      success: false,
      message: 'Authentication required.'
    });
  }
  
  if (!req.user.isAdmin) {
    logger.warn(`Non-admin user ${req.user.email} attempted admin action`);
    return res.status(403).json({
      success: false,
      message: 'Admin access required.'
    });
  }
  
  next();
};

module.exports = {
  authenticateToken,
  optionalAuth,
  requireAdmin
};
