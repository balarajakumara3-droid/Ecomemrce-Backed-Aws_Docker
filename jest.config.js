/**
 * Jest Configuration
 * 
 * This configures Jest for testing the e-commerce API
 */

module.exports = {
  // Test environment
  testEnvironment: 'node',
  
  // Test timeout (10 seconds)
  testTimeout: 10000,
  
  // Setup files
  setupFiles: ['<rootDir>/tests/setup.js'],
  
  // Test match patterns
  testMatch: [
    '**/tests/**/*.test.js'
  ],
  
  // Coverage configuration
  collectCoverageFrom: [
    'controllers/**/*.js',
    'services/**/*.js',
    'middleware/**/*.js',
    'routes/**/*.js',
    '!**/node_modules/**'
  ],
  
  coverageDirectory: 'coverage',
  
  // Verbose output
  verbose: true,
  
  // Force exit after all tests complete (prevents hanging)
  forceExit: true,
  
  // Detect open handles
  detectOpenHandles: true
};