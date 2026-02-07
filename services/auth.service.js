/**
 * services/auth.service.js - Authentication Business Logic
 * 
 * This service layer handles all authentication-related business logic.
 * It keeps the controllers thin by encapsulating database operations,
 * password hashing, JWT generation, etc.
 * 
 * Why a service layer?
 * - Separates business logic from HTTP handling
 * - Makes code reusable and testable
 * - Easier to maintain and modify
 */

const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { v4: uuidv4 } = require('uuid');
const { query, enhanceConnectionError } = require('../utils/db');
const logger = require('../utils/logger');

// Configuration
const JWT_SECRET = process.env.JWT_SECRET;
const JWT_EXPIRES_IN = process.env.JWT_EXPIRES_IN || '7d';
const BCRYPT_SALT_ROUNDS = parseInt(process.env.BCRYPT_SALT_ROUNDS) || 12;

/**
 * Register a new user
 * @param {Object} userData - User registration data
 * @returns {Object} - Created user (without password) and JWT token
 */
const register = async (userData) => {
  const { email, password, first_name, last_name } = userData;
  
  try {
    // 1. Check if email already exists
    const existingUser = await query(
      'SELECT id FROM profiles WHERE email = $1',
      [email]
    );
    
    if (existingUser.rows.length > 0) {
      throw { code: '23505', detail: 'Key (email)=(' + email + ') already exists.' };
    }
    
    // 2. Hash the password
    const hashedPassword = await bcrypt.hash(password, BCRYPT_SALT_ROUNDS);
    
    // 3. Generate UUID for new user
    const userId = uuidv4();
    
    // 4. Insert new user into database
    // Note: We're using the profiles table for both user data and auth
    const result = await query(
      `INSERT INTO profiles (
        id, email, password_hash, first_name, last_name, 
        role, is_admin, created_at, updated_at
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, NOW(), NOW())
      RETURNING id, email, first_name, last_name, role, is_admin, created_at`,
      [
        userId,
        email,
        hashedPassword,
        first_name,
        last_name,
        'customer',     // Default role
        false           // Not admin by default
      ]
    );
    
    const newUser = result.rows[0];
    
    // 5. Generate JWT token
    const token = generateToken(newUser);
    
    logger.info(`New user registered: ${email} (${userId})`);
    
    return {
      user: newUser,
      token
    };
    
  } catch (error) {
    logger.error(`Registration error for ${email}:`, error.message);
    throw enhanceConnectionError(error);
  }
};

/**
 * Login existing user
 * @param {string} email - User email
 * @param {string} password - Plain text password
 * @returns {Object} - User data and JWT token
 */
const login = async (email, password) => {
  try {
    // 1. Find user by email
    const result = await query(
      `SELECT id, email, password_hash, first_name, last_name, 
              role, is_admin, created_at, updated_at, deleted_at
       FROM profiles 
       WHERE email = $1`,
      [email]
    );
    
    if (result.rows.length === 0) {
      // User not found - but don't reveal this (security best practice)
      const error = new Error('Invalid email or password');
      error.statusCode = 401;
      throw error;
    }
    
    const user = result.rows[0];
    
    // 2. Check if account is deleted/deactivated
    if (user.deleted_at) {
      const error = new Error('Account has been deactivated');
      error.statusCode = 401;
      throw error;
    }
    
    // 3. Verify password
    const isPasswordValid = await bcrypt.compare(password, user.password_hash);
    
    if (!isPasswordValid) {
      // Wrong password
      logger.warn(`Failed login attempt for ${email}`);
      const error = new Error('Invalid email or password');
      error.statusCode = 401;
      throw error;
    }
    
    // 4. Remove password_hash from user object before returning
    const { password_hash, deleted_at, ...safeUser } = user;
    
    // 5. Generate JWT token
    const token = generateToken(safeUser);
    
    logger.info(`User logged in: ${email} (${user.id})`);
    
    return {
      user: safeUser,
      token
    };
    
  } catch (error) {
    logger.error(`Login error for ${email}:`, error.message);
    throw enhanceConnectionError(error);
  }
};

/**
 * Get user profile by ID
 * @param {string} userId - User UUID
 * @returns {Object} - User profile (without password)
 */
const getProfile = async (userId) => {
  try {
    const result = await query(
      `SELECT id, email, first_name, last_name, phone, address,
              avatar_url, role, is_admin, created_at, updated_at
       FROM profiles 
       WHERE id = $1 AND deleted_at IS NULL`,
      [userId]
    );
    
    if (result.rows.length === 0) {
      const error = new Error('User not found');
      error.statusCode = 404;
      throw error;
    }
    
    return result.rows[0];
    
  } catch (error) {
    logger.error(`Get profile error for ${userId}:`, error.message);
    throw error;
  }
};

/**
 * Update user profile
 * @param {string} userId - User UUID
 * @param {Object} updateData - Fields to update
 * @returns {Object} - Updated user profile
 */
const updateProfile = async (userId, updateData) => {
  try {
    // Build dynamic update query
    const allowedFields = ['first_name', 'last_name', 'phone', 'address', 'avatar_url'];
    const updates = [];
    const values = [];
    let paramCount = 1;
    
    // Only update fields that are provided and allowed
    for (const [key, value] of Object.entries(updateData)) {
      if (allowedFields.includes(key) && value !== undefined) {
        updates.push(`${key} = $${paramCount}`);
        
        // JSON fields need special handling
        if (key === 'address' && typeof value === 'object') {
          values.push(JSON.stringify(value));
        } else {
          values.push(value);
        }
        
        paramCount++;
      }
    }
    
    // Always update the updated_at timestamp
    updates.push(`updated_at = NOW()`);
    
    // Add userId to values array
    values.push(userId);
    
    // Construct and execute query
    const query_text = `
      UPDATE profiles 
      SET ${updates.join(', ')}
      WHERE id = $${paramCount} AND deleted_at IS NULL
      RETURNING id, email, first_name, last_name, phone, address,
                avatar_url, role, is_admin, created_at, updated_at
    `;
    
    const result = await query(query_text, values);
    
    if (result.rows.length === 0) {
      const error = new Error('User not found');
      error.statusCode = 404;
      throw error;
    }
    
    logger.info(`Profile updated for user: ${userId}`);
    
    return result.rows[0];
    
  } catch (error) {
    logger.error(`Update profile error for ${userId}:`, error.message);
    throw error;
  }
};

/**
 * Generate JWT token
 * @param {Object} user - User object
 * @returns {string} - JWT token
 */
const generateToken = (user) => {
  const payload = {
    userId: user.id,
    email: user.email,
    isAdmin: user.is_admin,
    role: user.role
  };
  
  return jwt.sign(payload, JWT_SECRET, {
    expiresIn: JWT_EXPIRES_IN
  });
};

/**
 * Verify JWT token
 * @param {string} token - JWT token
 * @returns {Object} - Decoded token payload
 */
const verifyToken = (token) => {
  return jwt.verify(token, JWT_SECRET);
};

module.exports = {
  register,
  login,
  getProfile,
  updateProfile,
  generateToken,
  verifyToken
};
