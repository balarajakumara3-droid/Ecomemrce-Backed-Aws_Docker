/**
 * routes/auth.routes.js - Authentication Routes
 * 
 * This file defines all authentication-related API endpoints.
 * Routes map URLs to controller functions and apply middleware.
 * 
 * URL Pattern: /api/v1/auth/...
 * 
 * Middleware order matters:
 * 1. Validation (check input format)
 * 2. Authentication (check if user is logged in)
 * 3. Controller (handle the request)
 */

const express = require('express');
const router = express.Router();

// Import controllers
const authController = require('../controllers/auth.controller');

// Import middleware
const { authenticateToken } = require('../middleware/auth.middleware');
const { 
  validateRegistration, 
  validateLogin,
  validateProfileUpdate 
} = require('../middleware/validation.middleware');

// ==========================================
// PUBLIC ROUTES (No authentication required)
// ==========================================

/**
 * POST /api/v1/auth/register
 * Register a new user account
 * 
 * Body: { email, password, first_name, last_name }
 * Response: { success, message, data: { user, token } }
 */
router.post('/register', validateRegistration, authController.register);

/**
 * POST /api/v1/auth/login
 * Login with email and password
 * 
 * Body: { email, password }
 * Response: { success, message, data: { user, token } }
 */
router.post('/login', validateLogin, authController.login);

// ==========================================
// PROTECTED ROUTES (Authentication required)
// ==========================================

// Apply authentication middleware to all routes below
router.use(authenticateToken);

/**
 * GET /api/v1/auth/profile
 * Get current user's profile
 * 
 * Headers: Authorization: Bearer <token>
 * Response: { success, data: { user } }
 */
router.get('/profile', authController.getProfile);

/**
 * PUT /api/v1/auth/profile
 * Update current user's profile
 * 
 * Headers: Authorization: Bearer <token>
 * Body: { first_name?, last_name?, phone?, address? }
 * Response: { success, message, data: { user } }
 */
router.put('/profile', validateProfileUpdate, authController.updateProfile);

/**
 * POST /api/v1/auth/logout
 * Logout current user
 * 
 * Headers: Authorization: Bearer <token>
 * Response: { success, message }
 */
router.post('/logout', authController.logout);

// ==========================================
// EXPORT ROUTER
// ==========================================

module.exports = router;
