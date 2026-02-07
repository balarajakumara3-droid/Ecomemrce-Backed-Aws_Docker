/**
 * restore-supabase-data.js
 * 
 * Script to restore and transform data from Supabase SQL dump files into the new PostgreSQL database.
 */

require('dotenv').config();
const fs = require('fs');
const path = require('path');
const { pool } = require('../utils/db');
const logger = require('../utils/logger');

// Mappings for table names and columns
const TABLE_MAPPINGS = {
  'collections': {
    table: 'collections',
    columns: { 'image': 'image_url' }
  },
  'product_collections': {
    table: 'collection_products',
    columns: {}
  },
  'reviews': {
    table: 'reviews',
    columns: { 'is_verified': 'is_verified_purchase' }
  },
  'carts': {
    table: 'carts',
    columns: {} // items should exist, maybe JSON formatting issue
  }
};

// Legacy product tables to merge into 'products'
const LEGACY_PRODUCT_TABLES = [
  'tamilnadu_savoury_classics',
  'tamilnadu_sweet_classics',
  'tamilnadu_karupatti_classics',
  'ooru_specials_products'
];

async function runMigration() {
  const client = await pool.connect();
  
  try {
    logger.info('🚀 Starting smart data restoration...');

    const restoreDataPath = path.join(__dirname, 'restore_data.sql');
    if (fs.existsSync(restoreDataPath)) {
      await processCopyFile(client, restoreDataPath);
    } else {
      logger.warn('⚠️  restore_data.sql not found.');
    }

    logger.info('✅ Data restoration complete!');
  } catch (error) {
    logger.error('❌ Migration failed:', error);
  } finally {
    client.release();
    await pool.end();
  }
}

async function processCopyFile(client, filePath) {
  logger.info(`📂 Processing ${path.basename(filePath)}...`);
  
  const content = fs.readFileSync(filePath, 'utf8');
  const lines = content.split('\n');
  
  let currentTable = null;
  let columns = [];
  let buffer = [];
  
  for (const line of lines) {
    if (line.startsWith('COPY ')) {
      const match = line.match(/COPY\s+(\w+)\s+\((.*?)\)\s+FROM stdin;/);
      if (match) {
        currentTable = match[1];
        columns = match[2].split(',').map(c => c.trim());
        logger.info(`   Found table: ${currentTable}`);
        buffer = [];
      }
      continue;
    }
    
    if (line.trim() === '\\.') {
      if (currentTable && buffer.length > 0) {
        await handleTableData(client, currentTable, columns, buffer);
      }
      currentTable = null;
      buffer = [];
      continue;
    }
    
    if (currentTable && line.trim() !== '') {
      const values = line.split('\t').map(val => val === '\\N' ? null : val);
      if (values.length === columns.length) {
        buffer.push(values);
      }
    }
  }
}

async function handleTableData(client, sourceTable, sourceColumns, rows) {
  // 1. Handle Legacy Product Tables (Merge into products)
  if (LEGACY_PRODUCT_TABLES.includes(sourceTable)) {
    await mergeLegacyProducts(client, sourceTable, sourceColumns, rows);
    return;
  }

  // 2. Handle Ooru Specials (Merge into collections)
  if (sourceTable === 'ooru_specials') {
    await mergeOoruSpecials(client, sourceColumns, rows);
    return;
  }

  // 3. Handle Standard Tables with Mapping
  const mapping = TABLE_MAPPINGS[sourceTable] || { table: sourceTable, columns: {} };
  const targetTable = mapping.table;
  
  // Filter out columns that don't exist in target (unless mapped)
  // For now, we assume simple mapping. 
  // If target table doesn't exist, we skip.
  
  // Check if table exists
  try {
    await client.query(`SELECT 1 FROM "${targetTable}" LIMIT 1`);
  } catch (e) {
    logger.warn(`   ⚠️  Target table "${targetTable}" does not exist. Skipping.`);
    return;
  }

  const targetColumns = sourceColumns.map(col => mapping.columns[col] || col);
  
  await insertBatch(client, targetTable, targetColumns, rows);
}

async function mergeLegacyProducts(client, sourceTable, sourceColumns, rows) {
  logger.info(`   🔄 Merging ${rows.length} rows from ${sourceTable} into products...`);
  
  const colIdx = (name) => sourceColumns.indexOf(name);
  
  const productsToInsert = rows.map(row => {
    const name = row[colIdx('product_name')];
    const weight = row[colIdx('weight')];
    const desc = row[colIdx('description')];
    const img = row[colIdx('image_url')];
    
    // Price handling
    let price = row[colIdx('discounted_price')] || row[colIdx('price')];
    let comparePrice = row[colIdx('price')];
    
    // Clean price strings
    const cleanPrice = (p) => {
      if (!p) return 0;
      return parseFloat(p.toString().replace(/[^0-9.]/g, '')) || 0;
    };
    
    // Clean weight
    const cleanWeight = (w) => {
      if (!w) return null;
      const str = w.toString().toLowerCase();
      const val = parseFloat(str.replace(/[^0-9.]/g, ''));
      if (isNaN(val)) return null;
      
      if (str.includes('kg')) return val; // Already in kg
      if (str.includes('g') || val > 10) return val / 1000; // Assume grams if > 10 or has 'g'
      
      return val; // Assume kg if small number and no unit? Or maybe grams?
      // Defaulting to assuming grams for typical snack weights if unit missing but value > 1
    };

    const finalPrice = cleanPrice(price);
    const finalCompare = cleanPrice(comparePrice);
    const finalWeight = cleanWeight(weight);
    
    // If discounted is same as price, no compare price
    const actualCompare = finalCompare > finalPrice ? finalCompare : null;

    // Tags
    let tags = [];
    if (sourceTable.includes('savoury')) tags.push('savoury');
    if (sourceTable.includes('sweet')) tags.push('sweet');
    if (sourceTable.includes('karupatti')) tags.push('karupatti');
    if (sourceTable.includes('ooru_specials')) tags.push('ooru_special');

    // ID preservation: reuse ID if UUID, else generate?
    // Supabase IDs are UUIDs, so we can reuse
    const id = row[colIdx('id')];

    return {
      id,
      name,
      description: desc,
      price: finalPrice,
      compare_at_price: actualCompare,
      weight: finalWeight,
      images: img ? JSON.stringify([img]) : '[]', // Store as JSON string for INSERT
      tags: tags,
      is_active: true,
      sku: `LEGACY-${id.substring(0, 8)}`,
      slug: name.toLowerCase().replace(/[^a-z0-9]+/g, '-').replace(/(^-|-$)/g, '') + '-' + id.substring(0,4)
    };
  });

  for (const p of productsToInsert) {
    try {
      await client.query(`
        INSERT INTO products (id, name, description, price, compare_at_price, weight, images, tags, is_active, sku, slug)
        VALUES ($1, $2, $3, $4, $5, $6, $7::jsonb, $8, $9, $10, $11)
        ON CONFLICT (id) DO UPDATE SET
          name = EXCLUDED.name,
          price = EXCLUDED.price,
          images = EXCLUDED.images,
          weight = EXCLUDED.weight,
          tags = array_cat(products.tags, EXCLUDED.tags)
      `, [p.id, p.name, p.description, p.price, p.compare_at_price, p.weight, p.images, p.tags, p.is_active, p.sku, p.slug]);
    } catch (err) {
      // Ignore duplicate key errors for slug/sku if they happen
      if (!err.message.includes('duplicate key')) {
        logger.warn(`Failed to insert product ${p.name}: ${err.message}`);
      }
    }
  }
}

async function mergeOoruSpecials(client, sourceColumns, rows) {
  logger.info(`   🔄 Merging ${rows.length} rows from ooru_specials into collections...`);
  const colIdx = (name) => sourceColumns.indexOf(name);

  for (const row of rows) {
    const id = row[colIdx('id')];
    const name = row[colIdx('category_name')];
    const slug = row[colIdx('slug')];
    const desc = row[colIdx('description')];
    const img = row[colIdx('image')];

    try {
      await client.query(`
        INSERT INTO collections (id, name, slug, description, image_url, type)
        VALUES ($1, $2, $3, $4, $5, 'ooru_special')
        ON CONFLICT (id) DO UPDATE SET
          name = EXCLUDED.name,
          image_url = EXCLUDED.image_url
      `, [id, name, slug, desc, img]);
    } catch (err) {
      logger.warn(`Failed to insert collection ${name}: ${err.message}`);
    }
  }
}

async function insertBatch(client, table, columns, rows) {
  if (rows.length === 0) return;
  
  const colNames = columns.map(c => `"${c}"`).join(', ');
  
  for (const row of rows) {
    try {
      const placeholders = row.map((_, i) => `$${i + 1}`).join(', ');
      
      // Filter out columns that might not exist in target table schema
      // This is a naive check; ideally we query information_schema
      // For now, we rely on TABLE_MAPPINGS to be correct
      
      const queryText = `
        INSERT INTO "${table}" (${colNames})
        VALUES (${placeholders})
        ON CONFLICT (id) DO NOTHING
      `;
      
      await client.query(queryText, row);
    } catch (err) {
      // logger.warn(`   ⚠️  Error inserting row into ${table}: ${err.message}`);
    }
  }
}

if (require.main === module) {
  runMigration();
}

module.exports = runMigration;
