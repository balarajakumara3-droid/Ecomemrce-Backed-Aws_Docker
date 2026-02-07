/**
 * scripts/run-migrations.js - Migration Runner
 */

const fs = require('fs');
const path = require('path');
require('dotenv').config();
const { query } = require('../utils/db');
const logger = require('../utils/logger');

const runMigrations = async () => {
    try {
        logger.info('Running migrations...');
        const migrationDir = path.join(__dirname, 'migrations');
        const files = fs.readdirSync(migrationDir).sort();

        for (const file of files) {
            if (file.endsWith('.sql')) {
                logger.info(`Running migration: ${file}`);
                const sql = fs.readFileSync(path.join(migrationDir, file), 'utf8');
                await query(sql);
            }
        }
        logger.info('Migrations complete.');
    } catch (error) {
        logger.error('Migration failed:', error);
        process.exit(1);
    }
};

if (require.main === module) {
    runMigrations().then(() => process.exit(0));
}

module.exports = runMigrations;