/**
 * scripts/init-db.js - Database Initialization Script
 * 
 * Run this script to test database connection and initialize tables
 * Usage: node scripts/init-db.js
 * Or: npm run db:init
 */

const fs = require('fs');
const path = require('path');
const { query, testConnection } = require('../utils/db');
const logger = require('../utils/logger');

// Load environment variables
require('dotenv').config();

const initDatabase = async () => {
  try {
    logger.info('🔄 Starting database initialization...');
    
    // 1. Test connection
    logger.info('Testing database connection...');
    const connected = await testConnection();
    
    if (!connected) {
      logger.error('❌ Failed to connect to database. Check your .env configuration.');
      process.exit(1);
    }
    
    // 2. Read SQL file
    const sqlPath = path.join(__dirname, 'init-db.sql');
    logger.info(`Reading SQL file: ${sqlPath}`);
    
    if (!fs.existsSync(sqlPath)) {
      logger.error(`❌ SQL file not found: ${sqlPath}`);
      process.exit(1);
    }
    
    const sql = fs.readFileSync(sqlPath, 'utf8');
    
    // 3. Execute SQL commands
    logger.info('Executing database schema...');
    
    // Split SQL into individual statements
    const statements = sql
      .split(';')
      .map(s => s.trim())
      .filter(s => s.length > 0);
    
    for (let i = 0; i < statements.length; i++) {
      const statement = statements[i] + ';';
      try {
        await query(statement);
        logger.debug(`✅ Executed statement ${i + 1}/${statements.length}`);
      } catch (error) {
        // Ignore "already exists" errors
        if (error.message.includes('already exists')) {
          logger.debug(`⚠️  Statement ${i + 1} skipped (already exists)`);
        } else {
          logger.error(`❌ Error executing statement ${i + 1}:`, error.message);
          // Continue with next statement
        }
      }
    }
    
    logger.info('✅ Database initialization complete!');
    logger.info('🎉 Your e-commerce API is ready to use.');
    logger.info('');
    logger.info('Default admin credentials:');
    logger.info('  Email: admin@example.com');
    logger.info('  Password: admin123');
    logger.info('  ⚠️  CHANGE THESE IN PRODUCTION!');
    
    process.exit(0);
    
  } catch (error) {
    logger.error('❌ Database initialization failed:', error);
    process.exit(1);
  }
};

// Run if called directly
if (require.main === module) {
  initDatabase();
}

module.exports = initDatabase;
