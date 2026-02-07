// Load environment variables
require('dotenv').config();

const { query, closePool } = require('../utils/db');
const logger = require('../utils/logger');
const initDatabase = require('./init-db');

const resetDatabase = async () => {
  try {
    logger.info('🗑️  Dropping all tables...');
    
    // Drop the extension first (to clear uuid_generate_v4 if it's there)
    await query(`DROP EXTENSION IF EXISTS "uuid-ossp" CASCADE`);

    // Drop all tables in public schema
    await query(`
      DO $$ DECLARE
          r RECORD;
      BEGIN
          FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = 'public') LOOP
              EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
          END LOOP;
      END $$;
    `);

    // Drop types if needed (optional, but good for clean slate)
    await query(`
      DO $$ DECLARE
          r RECORD;
      BEGIN
          FOR r IN (SELECT typname FROM pg_type WHERE typnamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public') AND typtype = 'e') LOOP
              EXECUTE 'DROP TYPE IF EXISTS ' || quote_ident(r.typname) || ' CASCADE';
          END LOOP;
      END $$;
    `);

    logger.info('✅ Database reset complete.');
    
    // Now initialize the database
    await initDatabase();
    
  } catch (error) {
    logger.error('❌ Database reset failed:', error);
    process.exit(1);
  } finally {
    // Ensure pool is closed if initDatabase didn't already exit
    // initDatabase calls process.exit(0) on success, so this might not run
    await closePool();
  }
};

if (require.main === module) {
  resetDatabase();
}

module.exports = resetDatabase;
