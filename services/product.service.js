/**
 * services/product.service.js - Product Business Logic
 * 
 * Handles all product-related operations:
 * - CRUD operations for products
 * - Search and filtering
 * - Slug generation
 * - Inventory management
 */

const { query, getClient } = require('../utils/db');
const { v4: uuidv4 } = require('uuid');
const logger = require('../utils/logger');

// ==========================================
// HELPER FUNCTIONS
// ==========================================

/**
 * Generate URL-friendly slug from product name
 * @param {string} name - Product name
 * @returns {string} - Slug
 */
const generateSlug = (name) => {
  return name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-') // Replace non-alphanumeric with hyphens
    .replace(/^-+|-+$/g, '') // Remove leading/trailing hyphens
    .substring(0, 100); // Limit length
};

/**
 * Ensure slug is unique by appending number if needed
 * @param {string} slug - Base slug
 * @param {string} excludeId - Product ID to exclude (for updates)
 * @returns {string} - Unique slug
 */
const ensureUniqueSlug = async (slug, excludeId = null) => {
  let uniqueSlug = slug;
  let counter = 1;

  while (true) {
    const checkQuery = excludeId
      ? 'SELECT id FROM products WHERE slug = $1 AND id != $2'
      : 'SELECT id FROM products WHERE slug = $1';
    const checkValues = excludeId ? [uniqueSlug, excludeId] : [uniqueSlug];

    const existing = await query(checkQuery, checkValues);

    if (existing.rows.length === 0) {
      break;
    }

    uniqueSlug = `${slug}-${counter}`;
    counter++;
  }

  return uniqueSlug;
};

// ==========================================
// PRODUCT CRUD OPERATIONS
// ==========================================

/**
 * Create a new product
 * @param {Object} productData - Product data
 * @returns {Object} - Created product
 */
const createProduct = async (productData) => {
  const client = await getClient();

  try {
    await client.query('BEGIN');

    // Generate slug
    const baseSlug = generateSlug(productData.name);
    const slug = await ensureUniqueSlug(baseSlug);

    const productId = uuidv4();

    const result = await client.query(
      `INSERT INTO products (
        id, name, slug, description, short_description, price,
        compare_at_price, cost_price, sku, barcode, inventory_quantity,
        inventory_policy, weight, weight_unit, is_active, is_featured,
        category_id, tags, images, seo_title, seo_description
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21)
      RETURNING *`,
      [
        productId,
        productData.name,
        slug,
        productData.description || null,
        productData.short_description || null,
        productData.price,
        productData.compare_at_price || null,
        productData.cost_price || null,
        productData.sku || null,
        productData.barcode || null,
        productData.inventory_quantity || 0,
        productData.inventory_policy || 'deny',
        productData.weight || null,
        productData.weight_unit || 'kg',
        productData.is_active !== false, // Default true
        productData.is_featured || false,
        productData.category_id || null,
        productData.tags || [],
        productData.images ? JSON.stringify(productData.images) : '[]',
        productData.seo_title || null,
        productData.seo_description || null
      ]
    );

    await client.query('COMMIT');

    logger.info(`Product created: ${productData.name} (${productId})`);
    return result.rows[0];

  } catch (error) {
    await client.query('ROLLBACK');
    logger.error('Create product error:', error);
    throw error;
  } finally {
    client.release();
  }
};

/**
 * Get all products with filtering and pagination
 * @param {Object} filters - Query filters
 * @returns {Object} - Products array and pagination info
 */
const getAllProducts = async (filters = {}) => {
  const {
    page = 1,
    limit = 20,
    category_id,
    is_active,
    is_featured,
    search,
    min_price,
    max_price,
    sort_by = 'created_at',
    sort_order = 'desc'
  } = filters;

  const offset = (page - 1) * limit;
  const conditions = ['deleted_at IS NULL'];
  const values = [];
  let paramCount = 1;

  // Build WHERE clause
  if (category_id) {
    conditions.push(`category_id = $${paramCount}`);
    values.push(category_id);
    paramCount++;
  }

  if (is_active !== undefined) {
    conditions.push(`is_active = $${paramCount}`);
    values.push(is_active);
    paramCount++;
  }

  if (is_featured !== undefined) {
    conditions.push(`is_featured = $${paramCount}`);
    values.push(is_featured);
    paramCount++;
  }

  if (search) {
    conditions.push(`(name ILIKE $${paramCount} OR description ILIKE $${paramCount} OR slug ILIKE $${paramCount})`);
    values.push(`%${search}%`);
    paramCount++;
  }

  if (min_price !== undefined) {
    conditions.push(`price >= $${paramCount}`);
    values.push(min_price);
    paramCount++;
  }

  if (max_price !== undefined) {
    conditions.push(`price <= $${paramCount}`);
    values.push(max_price);
    paramCount++;
  }

  // Validate sort column
  const allowedSortColumns = ['created_at', 'updated_at', 'price', 'name', 'inventory_quantity'];
  const sortColumn = allowedSortColumns.includes(sort_by) ? sort_by : 'created_at';
  const order = sort_order.toLowerCase() === 'asc' ? 'ASC' : 'DESC';

  // Build queries
  const whereClause = conditions.join(' AND ');
  
  // Count total
  const countQuery = `SELECT COUNT(*) FROM products WHERE ${whereClause}`;
  const countResult = await query(countQuery, values);
  const total = parseInt(countResult.rows[0].count);

  // Get products
  const dataQuery = `
    SELECT 
      p.*,
      c.name as category_name
    FROM products p
    LEFT JOIN categories c ON p.category_id = c.id
    WHERE ${whereClause}
    ORDER BY p.${sortColumn} ${order}
    LIMIT $${paramCount} OFFSET $${paramCount + 1}
  `;
  
  values.push(limit, offset);
  const result = await query(dataQuery, values);

  return {
    products: result.rows,
    pagination: {
      page: parseInt(page),
      limit: parseInt(limit),
      total,
      total_pages: Math.ceil(total / limit)
    }
  };
};

/**
 * Get product by ID
 * @param {string} productId - Product UUID
 * @returns {Object} - Product data
 */
const getProductById = async (productId) => {
  const result = await query(
    `SELECT 
      p.*,
      c.name as category_name,
      c.slug as category_slug
    FROM products p
    LEFT JOIN categories c ON p.category_id = c.id
    WHERE p.id = $1 AND p.deleted_at IS NULL`,
    [productId]
  );

  if (result.rows.length === 0) {
    const error = new Error('Product not found');
    error.statusCode = 404;
    throw error;
  }

  return result.rows[0];
};

/**
 * Get product by slug
 * @param {string} slug - Product slug
 * @returns {Object} - Product data
 */
const getProductBySlug = async (slug) => {
  const result = await query(
    `SELECT 
      p.*,
      c.name as category_name,
      c.slug as category_slug
    FROM products p
    LEFT JOIN categories c ON p.category_id = c.id
    WHERE p.slug = $1 AND p.is_active = true AND p.deleted_at IS NULL`,
    [slug]
  );

  if (result.rows.length === 0) {
    const error = new Error('Product not found');
    error.statusCode = 404;
    throw error;
  }

  return result.rows[0];
};

/**
 * Update product
 * @param {string} productId - Product UUID
 * @param {Object} updateData - Fields to update
 * @returns {Object} - Updated product
 */
const updateProduct = async (productId, updateData) => {
  const client = await getClient();

  try {
    await client.query('BEGIN');

    // Check if product exists
    const existing = await client.query(
      'SELECT * FROM products WHERE id = $1 AND deleted_at IS NULL',
      [productId]
    );

    if (existing.rows.length === 0) {
      const error = new Error('Product not found');
      error.statusCode = 404;
      throw error;
    }

    // If name is being updated, regenerate slug
    let slug = existing.rows[0].slug;
    if (updateData.name && updateData.name !== existing.rows[0].name) {
      const baseSlug = generateSlug(updateData.name);
      slug = await ensureUniqueSlug(baseSlug, productId);
    }

    // Build dynamic update
    const allowedFields = [
      'name', 'description', 'short_description', 'price', 'compare_at_price',
      'cost_price', 'sku', 'barcode', 'inventory_quantity', 'inventory_policy',
      'weight', 'weight_unit', 'is_active', 'is_featured', 'category_id',
      'tags', 'images', 'seo_title', 'seo_description'
    ];

    const updates = [];
    const values = [];
    let paramCount = 1;

    // Always update slug if name changed
    if (updateData.name) {
      updates.push(`slug = $${paramCount}`);
      values.push(slug);
      paramCount++;
    }

    for (const [key, value] of Object.entries(updateData)) {
      if (allowedFields.includes(key) && value !== undefined) {
        updates.push(`${key} = $${paramCount}`);
        
        // Handle JSON fields
        if (key === 'tags' && Array.isArray(value)) {
          values.push(value);
        } else if (key === 'images' && Array.isArray(value)) {
          values.push(JSON.stringify(value));
        } else {
          values.push(value);
        }
        
        paramCount++;
      }
    }

    updates.push('updated_at = NOW()');
    values.push(productId);

    const query_text = `
      UPDATE products 
      SET ${updates.join(', ')}
      WHERE id = $${paramCount} AND deleted_at IS NULL
      RETURNING *
    `;

    const result = await client.query(query_text, values);
    await client.query('COMMIT');

    logger.info(`Product updated: ${productId}`);
    return result.rows[0];

  } catch (error) {
    await client.query('ROLLBACK');
    throw error;
  } finally {
    client.release();
  }
};

/**
 * Delete product (soft delete)
 * @param {string} productId - Product UUID
 */
const deleteProduct = async (productId) => {
  const result = await query(
    `UPDATE products 
     SET deleted_at = NOW(), updated_at = NOW() 
     WHERE id = $1 AND deleted_at IS NULL
     RETURNING id`,
    [productId]
  );

  if (result.rows.length === 0) {
    const error = new Error('Product not found');
    error.statusCode = 404;
    throw error;
  }

  logger.info(`Product soft deleted: ${productId}`);
  return { id: productId, deleted: true };
};

/**
 * Add image to product
 * @param {string} productId - Product UUID
 * @param {string} imageUrl - Image URL
 * @returns {Object} - Updated product
 */
const addProductImage = async (productId, imageUrl) => {
  const result = await query(
    `UPDATE products 
     SET images = COALESCE(images, '[]'::jsonb) || $2::jsonb,
         updated_at = NOW()
     WHERE id = $1 AND deleted_at IS NULL
     RETURNING *`,
    [productId, JSON.stringify([imageUrl])]
  );

  if (result.rows.length === 0) {
    const error = new Error('Product not found');
    error.statusCode = 404;
    throw error;
  }

  return result.rows[0];
};

/**
 * Remove image from product
 * @param {string} productId - Product UUID
 * @param {string} imageUrl - Image URL to remove
 */
const removeProductImage = async (productId, imageUrl) => {
  const result = await query(
    `UPDATE products 
     SET images = (
       SELECT jsonb_agg(elem)
       FROM jsonb_array_elements(COALESCE(images, '[]'::jsonb)) elem
       WHERE elem != $2::jsonb
     ),
     updated_at = NOW()
     WHERE id = $1 AND deleted_at IS NULL
     RETURNING *`,
    [productId, JSON.stringify(imageUrl)]
  );

  if (result.rows.length === 0) {
    const error = new Error('Product not found');
    error.statusCode = 404;
    throw error;
  }

  return result.rows[0];
};

module.exports = {
  createProduct,
  getAllProducts,
  getProductById,
  getProductBySlug,
  updateProduct,
  deleteProduct,
  addProductImage,
  removeProductImage,
  generateSlug
};
