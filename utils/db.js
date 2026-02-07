/**
 * utils/db.js - PostgreSQL Database Connection Pool
 * 
 * This file creates a connection pool to PostgreSQL using the 'pg' library.
 * Using a pool is more efficient than creating new connections for each request.
 * 
 * Why pg Pool?
 * - Reuses connections (faster)
 * - Handles multiple concurrent requests
 * - Automatically manages connection limits
 * - Built-in error handling
 */

const { Pool } = require('pg');
const logger = require('./logger');

// ==========================================
// DATABASE CONFIGURATION
// ==========================================

const dbConfig = {
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT) || 5432,
  database: process.env.DB_NAME || 'ecommerce_db',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || '',
  
  // Connection pool settings
  min: parseInt(process.env.DB_POOL_MIN) || 2,    // Minimum connections
  max: parseInt(process.env.DB_POOL_MAX) || 10,   // Maximum connections
  
  // SSL configuration (required for AWS RDS, optional for local)
  ssl: process.env.DB_SSL === 'true' ? {
    rejectUnauthorized: false // Required for some cloud providers
  } : false,
  
  // Connection timeout (30 seconds)
  connectionTimeoutMillis: 30000,
  
  // How long a client can be idle before being closed (10 seconds)
  idleTimeoutMillis: 10000
};

// ==========================================
// CREATE CONNECTION POOL
// ==========================================

const pool = new Pool(dbConfig);

// ==========================================
// EVENT HANDLERS (for monitoring)
// ==========================================

// When a new client connects to the pool
pool.on('connect', () => {
  logger.debug('New client connected to PostgreSQL pool');
});

// When an error occurs on an idle client
pool.on('error', (err) => {
  logger.error('Unexpected PostgreSQL pool error:', err);
  // Don't exit - let the pool recover
});

// ==========================================
// HELPER FUNCTIONS
// ==========================================

/**
 * Execute a SQL query using the pool
 * @param {string} text - SQL query text
 * @param {array} params - Query parameters (prevents SQL injection)
 * @returns {Promise} - Query result
 * 
 * Usage:
 *   const result = await query('SELECT * FROM users WHERE id = $1', [userId]);
 *   const users = result.rows;
 */
const query = async (text, params) => {
  const start = Date.now();
  try {
    const result = await pool.query(text, params);
    const duration = Date.now() - start;
    
    // Log slow queries (over 1 second) for debugging
    if (duration > 1000) {
      logger.warn(`Slow query (${duration}ms): ${text.substring(0, 100)}...`);
    } else {
      logger.debug(`Query executed in ${duration}ms`);
    }
    
    return result;
  } catch (error) {
    logger.error(`Database query error: ${error.message}`);
    logger.error(`Query: ${text}`);
    throw error;
  }
};

/**
 * Get a single client from the pool (for transactions)
 * @returns {Promise<Client>} - Database client
 * 
 * Usage (for transactions):
 *   const client = await getClient();
 *   try {
 *     await client.query('BEGIN');
 *     await client.query('INSERT...');
 *     await client.query('COMMIT');
 *   } catch (e) {
 *     await client.query('ROLLBACK');
 *     throw e;
 *   } finally {
 *     client.release();
 *   }
 */
const getClient = async () => {
  const client = await pool.connect();
  
  // Add query tracking to the client
  const originalQuery = client.query.bind(client);
  client.query = async (text, params) => {
    const start = Date.now();
    try {
      const result = await originalQuery(text, params);
      const duration = Date.now() - start;
      logger.debug(`Client query executed in ${duration}ms`);
      return result;
    } catch (error) {
      logger.error(`Client query error: ${error.message}`);
      throw error;
    }
  };
  
  return client;
};

/**
 * Test database connection
 * Useful for health checks during startup
 */
const testConnection = async () => {
  try {
    const result = await query('SELECT NOW() as current_time');
    logger.info(`✅ Database connected successfully at ${result.rows[0].current_time}`);
    return true;
  } catch (error) {
    logger.error('❌ Database connection failed:', error.message);
    return false;
  }
};

/**
 * Close all pool connections
 * Call this during graceful shutdown
 */
const closePool = async () => {
  await pool.end();
  logger.info('Database pool closed');
};

/**
 * Check if an error is a database connection error
 * @param {Error} error - The error to check
 * @returns {boolean} - True if it's a connection error
 */
const isConnectionError = (error) => {
  if (!error) return false;
  
  const connectionErrorPatterns = [
    'getaddrinfo',
    'ECONNREFUSED',
    'ENOTFOUND',
    'does not exist',
    'Connection terminated',
    'connect ETIMEDOUT',
    'database does not exist',
    'role "postgres" does not exist'
  ];
  
  return connectionErrorPatterns.some(pattern => 
    error.message && error.message.includes(pattern)
  );
};

/**
 * Enhance error with proper status code for database connection errors
 * @param {Error} error - The error to enhance
 * @returns {Error} - The enhanced error
 */
const enhanceConnectionError = (error) => {
  if (isConnectionError(error)) {
    error.statusCode = 503;
    error.message = 'Database connection failed. Please ensure the database server is running and properly configured.';
  }
  return error;
};

// ==========================================
// EXPORT
// ==========================================

module.exports = {
  pool,
  query,
  getClient,
  testConnection,
  closePool,
  isConnectionError,
  enhanceConnectionError
};
