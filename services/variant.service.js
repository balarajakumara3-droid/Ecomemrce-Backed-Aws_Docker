/**
 * services/variant.service.js - Product Variant Business Logic
 * 
 * Handles product variants (e.g., Size: Large, Color: Red)
 * Each product can have multiple variants with different:
 * - Prices
 * - Inventory quantities
 * - SKUs
 * - Option combinations (size, color, etc.)
 */

const { query, getClient } = require('../utils/db');
const { v4: uuidv4 } = require('uuid');
const logger = require('../utils/logger');

// ==========================================
// VARIANT CRUD OPERATIONS
// ==========================================

/**
 * Create a new product variant
 * @param {string} productId - Parent product UUID
 * @param {Object} variantData - Variant data
 * @returns {Object} - Created variant
 */
const createVariant = async (productId, variantData) => {
  const client = await getClient();

  try {
    await client.query('BEGIN');

    // Verify product exists
    const product = await client.query(
      'SELECT id, price FROM products WHERE id = $1 AND deleted_at IS NULL',
      [productId]
    );

    if (product.rows.length === 0) {
      const error = new Error('Product not found');
      error.statusCode = 404;
      throw error;
    }

    const variantId = uuidv4();

    const result = await client.query(
      `INSERT INTO product_variants (
        id, product_id, title, sku, barcode, price,
        compare_at_price, inventory_quantity, weight,
        options, image_url, is_active
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)
      RETURNING *`,
      [
        variantId,
        productId,
        variantData.title,
        variantData.sku || null,
        variantData.barcode || null,
        variantData.price || product.rows[0].price, // Use product price if not specified
        variantData.compare_at_price || null,
        variantData.inventory_quantity || 0,
        variantData.weight || null,
        JSON.stringify(variantData.options || {}), // {size: "Large", color: "Red"}
        variantData.image_url || null,
        variantData.is_active !== false
      ]
    );

    await client.query('COMMIT');

    logger.info(`Variant created for product ${productId}: ${variantData.title}`);
    return result.rows[0];

  } catch (error) {
    await client.query('ROLLBACK');
    throw error;
  } finally {
    client.release();
  }
};

/**
 * Get all variants for a product
 * @param {string} productId - Product UUID
 * @returns {Array} - Array of variants
 */
const getVariantsByProduct = async (productId) => {
  const result = await query(
    `SELECT * FROM product_variants 
     WHERE product_id = $1 AND is_active = true
     ORDER BY created_at ASC`,
    [productId]
  );

  return result.rows;
};

/**
 * Get single variant by ID
 * @param {string} variantId - Variant UUID
 * @returns {Object} - Variant data
 */
const getVariantById = async (variantId) => {
  const result = await query(
    `SELECT v.*, p.name as product_name, p.slug as product_slug
     FROM product_variants v
     JOIN products p ON v.product_id = p.id
     WHERE v.id = $1 AND v.is_active = true AND p.deleted_at IS NULL`,
    [variantId]
  );

  if (result.rows.length === 0) {
    const error = new Error('Variant not found');
    error.statusCode = 404;
    throw error;
  }

  return result.rows[0];
};

/**
 * Update variant
 * @param {string} variantId - Variant UUID
 * @param {Object} updateData - Fields to update
 * @returns {Object} - Updated variant
 */
const updateVariant = async (variantId, updateData) => {
  const allowedFields = [
    'title', 'sku', 'barcode', 'price', 'compare_at_price',
    'inventory_quantity', 'weight', 'options', 'image_url', 'is_active'
  ];

  const updates = [];
  const values = [];
  let paramCount = 1;

  for (const [key, value] of Object.entries(updateData)) {
    if (allowedFields.includes(key) && value !== undefined) {
      updates.push(`${key} = $${paramCount}`);
      
      // Handle JSON fields
      if (key === 'options' && typeof value === 'object') {
        values.push(JSON.stringify(value));
      } else {
        values.push(value);
      }
      
      paramCount++;
    }
  }

  if (updates.length === 0) {
    const error = new Error('No valid fields to update');
    error.statusCode = 400;
    throw error;
  }

  updates.push('updated_at = NOW()');
  values.push(variantId);

  const query_text = `
    UPDATE product_variants 
    SET ${updates.join(', ')}
    WHERE id = $${paramCount}
    RETURNING *
  `;

  const result = await query(query_text, values);

  if (result.rows.length === 0) {
    const error = new Error('Variant not found');
    error.statusCode = 404;
    throw error;
  }

  logger.info(`Variant updated: ${variantId}`);
  return result.rows[0];
};

/**
 * Delete variant
 * @param {string} variantId - Variant UUID
 */
const deleteVariant = async (variantId) => {
  // Check if variant is used in any orders
  const orderCheck = await query(
    'SELECT id FROM order_items WHERE variant_id = $1 LIMIT 1',
    [variantId]
  );

  if (orderCheck.rows.length > 0) {
    // Soft delete by marking inactive
    const result = await query(
      `UPDATE product_variants 
       SET is_active = false, updated_at = NOW()
       WHERE id = $1
       RETURNING id`,
      [variantId]
    );

    if (result.rows.length === 0) {
      const error = new Error('Variant not found');
      error.statusCode = 404;
      throw error;
    }

    logger.info(`Variant soft deleted (in orders): ${variantId}`);
    return { id: variantId, deleted: true, message: 'Variant marked as inactive (referenced in orders)' };
  }

  // Hard delete if not used in orders
  const result = await query(
    'DELETE FROM product_variants WHERE id = $1 RETURNING id',
    [variantId]
  );

  if (result.rows.length === 0) {
    const error = new Error('Variant not found');
    error.statusCode = 404;
    throw error;
  }

  logger.info(`Variant deleted: ${variantId}`);
  return { id: variantId, deleted: true };
};

/**
 * Update variant inventory
 * @param {string} variantId - Variant UUID
 * @param {number} quantity - New quantity or adjustment
 * @param {string} operation - 'set' or 'adjust'
 */
const updateInventory = async (variantId, quantity, operation = 'set') => {
  let query_text;
  
  if (operation === 'set') {
    query_text = `
      UPDATE product_variants 
      SET inventory_quantity = $1, updated_at = NOW()
      WHERE id = $2
      RETURNING *
    `;
  } else if (operation === 'adjust') {
    query_text = `
      UPDATE product_variants 
      SET inventory_quantity = inventory_quantity + $1, updated_at = NOW()
      WHERE id = $2
      RETURNING *
    `;
  } else {
    const error = new Error('Invalid operation. Use "set" or "adjust"');
    error.statusCode = 400;
    throw error;
  }

  const result = await query(query_text, [quantity, variantId]);

  if (result.rows.length === 0) {
    const error = new Error('Variant not found');
    error.statusCode = 404;
    throw error;
  }

  logger.info(`Variant inventory updated: ${variantId}, qty: ${quantity}, op: ${operation}`);
  return result.rows[0];
};

/**
 * Get all variant options for a product
 * Useful for displaying size/color selectors
 * @param {string} productId - Product UUID
 * @returns {Object} - { sizes: [], colors: [], all_options: {} }
 */
const getVariantOptions = async (productId) => {
  const result = await query(
    `SELECT options FROM product_variants 
     WHERE product_id = $1 AND is_active = true`,
    [productId]
  );

  const options = {
    all_options: {},
    variants: []
  };

  result.rows.forEach(row => {
    const opts = row.options || {};
    options.variants.push(opts);
    
    // Collect all unique option values
    Object.entries(opts).forEach(([key, value]) => {
      if (!options.all_options[key]) {
        options.all_options[key] = new Set();
      }
      options.all_options[key].add(value);
    });
  });

  // Convert Sets to Arrays
  Object.keys(options.all_options).forEach(key => {
    options.all_options[key] = Array.from(options.all_options[key]);
  });

  return options;
};

module.exports = {
  createVariant,
  getVariantsByProduct,
  getVariantById,
  updateVariant,
  deleteVariant,
  updateInventory,
  getVariantOptions
};
