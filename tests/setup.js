/**
 * tests/setup.js - Test Setup
 * 
 * This file runs before all tests to set up the test environment
 */

// Set test environment
process.env.NODE_ENV = 'test';

// Set test database configuration
// These can be overridden by a test.env file or CI environment variables
process.env.DB_HOST = process.env.DB_HOST || 'localhost';
process.env.DB_PORT = process.env.DB_PORT || '5432';
process.env.DB_NAME = process.env.DB_NAME || 'ecommerce_test';
process.env.DB_USER = process.env.DB_USER || 'postgres';
process.env.DB_PASSWORD = process.env.DB_PASSWORD || 'postgres';
process.env.DB_SSL = 'false';

// JWT configuration for tests
process.env.JWT_SECRET = 'test-secret-key-for-jwt-signing';
process.env.JWT_EXPIRES_IN = '1h';
process.env.JWT_REFRESH_EXPIRES_IN = '7d';

// Disable rate limiting for tests
process.env.RATE_LIMIT_WINDOW_MS = '0';
process.env.RATE_LIMIT_MAX_REQUESTS = '10000';

// Disable logging during tests (or set to error only)
process.env.LOG_LEVEL = 'error';

// Log test environment
console.log('🧪 Test Environment Setup Complete');
console.log(`   Database: ${process.env.DB_HOST}:${process.env.DB_PORT}/${process.env.DB_NAME}`);