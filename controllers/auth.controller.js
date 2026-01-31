/**
 * controllers/auth.controller.js - Authentication HTTP Handlers
 * 
 * Controllers handle HTTP requests and responses. They:
 * 1. Extract data from requests (body, params, query, headers)
 * 2. Call service layer to perform business logic
 * 3. Format and send responses
 * 4. Handle errors by passing them to error middleware
 * 
 * Keep controllers thin - business logic belongs in services!
 */

const authService = require('../services/auth.service');
const logger = require('../utils/logger');

/**
 * POST /api/v1/auth/register
 * Register a new user account
 */
const register = async (req, res, next) => {
  try {
    // Extract data from request body
    const { email, password, first_name, last_name } = req.body;
    
    // Call service to create user
    const result = await authService.register({
      email,
      password,
      first_name,
      last_name
    });
    
    // Send success response
    res.status(201).json({
      success: true,
      message: 'User registered successfully',
      data: {
        user: result.user,
        token: result.token
      }
    });
    
  } catch (error) {
    // Pass error to global error handler
    next(error);
  }
};

/**
 * POST /api/v1/auth/login
 * Authenticate user and return JWT
 */
const login = async (req, res, next) => {
  try {
    // Extract credentials from request body
    const { email, password } = req.body;
    
    // Call service to authenticate
    const result = await authService.login(email, password);
    
    // Send success response
    res.status(200).json({
      success: true,
      message: 'Login successful',
      data: {
        user: result.user,
        token: result.token
      }
    });
    
  } catch (error) {
    next(error);
  }
};

/**
 * GET /api/v1/auth/profile
 * Get current user's profile (requires authentication)
 */
const getProfile = async (req, res, next) => {
  try {
    // req.user is set by auth middleware (contains userId, email, etc.)
    const userId = req.user.userId;
    
    // Call service to get profile
    const profile = await authService.getProfile(userId);
    
    res.status(200).json({
      success: true,
      data: {
        user: profile
      }
    });
    
  } catch (error) {
    next(error);
  }
};

/**
 * PUT /api/v1/auth/profile
 * Update current user's profile (requires authentication)
 */
const updateProfile = async (req, res, next) => {
  try {
    const userId = req.user.userId;
    const updateData = req.body;
    
    // Call service to update profile
    const updatedProfile = await authService.updateProfile(userId, updateData);
    
    res.status(200).json({
      success: true,
      message: 'Profile updated successfully',
      data: {
        user: updatedProfile
      }
    });
    
  } catch (error) {
    next(error);
  }
};

/**
 * POST /api/v1/auth/logout
 * Logout user (client-side token removal)
 * Note: JWT is stateless, so we can't truly "logout" server-side
 * This endpoint is for consistency and any future session tracking
 */
const logout = async (req, res, next) => {
  try {
    // In a stateless JWT system, logout is handled client-side
    // by removing the token from storage
    // Here we just acknowledge the request
    
    logger.info(`User logged out: ${req.user?.email || 'unknown'}`);
    
    res.status(200).json({
      success: true,
      message: 'Logged out successfully'
    });
    
  } catch (error) {
    next(error);
  }
};

module.exports = {
  register,
  login,
  getProfile,
  updateProfile,
  logout
};
