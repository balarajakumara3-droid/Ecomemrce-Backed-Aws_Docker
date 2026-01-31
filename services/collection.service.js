/**
 * services/collection.service.js - Collection Business Logic
 * 
 * Collections are groups of products (like "Summer Sale" or "New Arrivals").
 * Can be manual (admin picks products) or automatic (based on conditions).
 */

const { query, getClient } = require('../utils/db');
const { v4: uuidv4 } = require('uuid');
const logger = require('../utils/logger');

// ==========================================
// HELPER FUNCTIONS
// ==========================================

const generateSlug = (name) => {
  return name
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, '-')
    .replace(/^-+|-+$/g, '')
    .substring(0, 100);
};

const ensureUniqueSlug = async (slug, excludeId = null) => {
  let uniqueSlug = slug;
  let counter = 1;

  while (true) {
    const checkQuery = excludeId
      ? 'SELECT id FROM collections WHERE slug = $1 AND id != $2'
      : 'SELECT id FROM collections WHERE slug = $1';
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
// COLLECTION CRUD OPERATIONS
// ==========================================

/**
 * Create a new collection
 * @param {Object} collectionData - Collection data
 */
const createCollection = async (collectionData) => {
  const baseSlug = generateSlug(collectionData.name);
  const slug = await ensureUniqueSlug(baseSlug);

  const collectionId = uuidv4();

  const result = await query(
    `INSERT INTO collections (
      id, name, slug, description, image_url, type,
      conditions, sort_order, is_active
    ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)
    RETURNING *`,
    [
      collectionId,
      collectionData.name,
      slug,
      collectionData.description || null,
      collectionData.image_url || null,
      collectionData.type || 'manual', // manual or automatic
      collectionData.conditions ? JSON.stringify(collectionData.conditions) : null,
      collectionData.sort_order || 'manual',
      collectionData.is_active !== false
    ]
  );

  logger.info(`Collection created: ${collectionData.name} (${collectionId})`);
  return result.rows[0];
};

/**
 * Get all collections
 * @param {Object} filters - Query filters
 */
const getAllCollections = async (filters = {}) => {
  const { page = 1, limit = 20, is_active, type } = filters;
  const offset = (page - 1) * limit;

  const conditions = [];
  const values = [];
  let paramCount = 1;

  if (is_active !== undefined) {
    conditions.push(`is_active = $${paramCount}`);
    values.push(is_active);
    paramCount++;
  }

  if (type) {
    conditions.push(`type = $${paramCount}`);
    values.push(type);
    paramCount++;
  }

  const whereClause = conditions.length > 0 ? 'WHERE ' + conditions.join(' AND ') : '';

  // Count
  const countQuery = `SELECT COUNT(*) FROM collections ${whereClause}`;
  const countResult = await query(countQuery, values);
  const total = parseInt(countResult.rows[0].count);

  // Get collections with product count
  const dataQuery = `
    SELECT 
      c.*,
      COUNT(cp.product_id) as product_count
    FROM collections c
    LEFT JOIN collection_products cp ON c.id = cp.collection_id
    ${whereClause}
    GROUP BY c.id
    ORDER BY c.created_at DESC
    LIMIT $${paramCount} OFFSET $${paramCount + 1}
  `;

  values.push(limit, offset);
  const result = await query(dataQuery, values);

  return {
    collections: result.rows,
    pagination: {
      page: parseInt(page),
      limit: parseInt(limit),
      total,
      total_pages: Math.ceil(total / limit)
    }
  };
};

/**
 * Get collection by ID with its products
 * @param {string} collectionId - Collection UUID
 */
const getCollectionById = async (collectionId) => {
  // Get collection
  const collectionResult = await query(
    'SELECT * FROM collections WHERE id = $1',
    [collectionId]
  );

  if (collectionResult.rows.length === 0) {
    const error = new Error('Collection not found');
    error.statusCode = 404;
    throw error;
  }

  const collection = collectionResult.rows[0];

  // Get products in collection
  const productsResult = await query(
    `SELECT 
      p.id, p.name, p.slug, p.price, p.compare_at_price,
      p.images, p.is_active, p.inventory_quantity,
      cp.sort_order as collection_sort
    FROM products p
    JOIN collection_products cp ON p.id = cp.product_id
    WHERE cp.collection_id = $1 AND p.deleted_at IS NULL AND p.is_active = true
    ORDER BY cp.sort_order ASC, p.created_at DESC`,
    [collectionId]
  );

  collection.products = productsResult.rows;

  return collection;
};

/**
 * Get collection by slug
 * @param {string} slug - Collection slug
 */
const getCollectionBySlug = async (slug) => {
  const collectionResult = await query(
    'SELECT * FROM collections WHERE slug = $1 AND is_active = true',
    [slug]
  );

  if (collectionResult.rows.length === 0) {
    const error = new Error('Collection not found');
    error.statusCode = 404;
    throw error;
  }

  const collection = collectionResult.rows[0];

  const productsResult = await query(
    `SELECT 
      p.id, p.name, p.slug, p.price, p.compare_at_price,
      p.images, p.is_active, p.inventory_quantity,
      cp.sort_order as collection_sort
    FROM products p
    JOIN collection_products cp ON p.id = cp.product_id
    WHERE cp.collection_id = $1 AND p.deleted_at IS NULL AND p.is_active = true
    ORDER BY cp.sort_order ASC, p.created_at DESC`,
    [collection.id]
  );

  collection.products = productsResult.rows;

  return collection;
};

/**
 * Update collection
 * @param {string} collectionId - Collection UUID
 * @param {Object} updateData - Fields to update
 */
const updateCollection = async (collectionId, updateData) => {
  const existing = await query(
    'SELECT * FROM collections WHERE id = $1',
    [collectionId]
  );

  if (existing.rows.length === 0) {
    const error = new Error('Collection not found');
    error.statusCode = 404;
    throw error;
  }

  let slug = existing.rows[0].slug;
  if (updateData.name && updateData.name !== existing.rows[0].name) {
    const baseSlug = generateSlug(updateData.name);
    slug = await ensureUniqueSlug(baseSlug, collectionId);
  }

  const allowedFields = [
    'name', 'description', 'image_url', 'type', 'conditions',
    'sort_order', 'is_active'
  ];

  const updates = [];
  const values = [];
  let paramCount = 1;

  if (updateData.name) {
    updates.push(`slug = $${paramCount}`);
    values.push(slug);
    paramCount++;
  }

  for (const [key, value] of Object.entries(updateData)) {
    if (allowedFields.includes(key) && value !== undefined) {
      updates.push(`${key} = $${paramCount}`);
      
      if (key === 'conditions' && typeof value === 'object') {
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
  values.push(collectionId);

  const query_text = `
    UPDATE collections 
    SET ${updates.join(', ')}
    WHERE id = $${paramCount}
    RETURNING *
  `;

  const result = await query(query_text, values);

  logger.info(`Collection updated: ${collectionId}`);
  return result.rows[0];
};

/**
 * Delete collection
 * @param {string} collectionId - Collection UUID
 */
const deleteCollection = async (collectionId) => {
  const client = await getClient();

  try {
    await client.query('BEGIN');

    // Delete collection_products first (foreign key constraint)
    await client.query(
      'DELETE FROM collection_products WHERE collection_id = $1',
      [collectionId]
    );

    // Delete collection
    const result = await client.query(
      'DELETE FROM collections WHERE id = $1 RETURNING id',
      [collectionId]
    );

    if (result.rows.length === 0) {
      const error = new Error('Collection not found');
      error.statusCode = 404;
      throw error;
    }

    await client.query('COMMIT');

    logger.info(`Collection deleted: ${collectionId}`);
    return { id: collectionId, deleted: true };

  } catch (error) {
    await client.query('ROLLBACK');
    throw error;
  } finally {
    client.release();
  }
};

// ==========================================
// COLLECTION-PRODUCT RELATIONSHIP
// ==========================================

/**
 * Add product to collection
 * @param {string} collectionId - Collection UUID
 * @param {string} productId - Product UUID
 * @param {number} sortOrder - Display order
 */
const addProductToCollection = async (collectionId, productId, sortOrder = 0) => {
  // Verify both exist
  const collection = await query('SELECT id FROM collections WHERE id = $1', [collectionId]);
  if (collection.rows.length === 0) {
    const error = new Error('Collection not found');
    error.statusCode = 404;
    throw error;
  }

  const product = await query(
    'SELECT id FROM products WHERE id = $1 AND deleted_at IS NULL',
    [productId]
  );
  if (product.rows.length === 0) {
    const error = new Error('Product not found');
    error.statusCode = 404;
    throw error;
  }

  try {
    const result = await query(
      `INSERT INTO collection_products (collection_id, product_id, sort_order)
       VALUES ($1, $2, $3)
       ON CONFLICT (collection_id, product_id) 
       DO UPDATE SET sort_order = $3
       RETURNING *`,
      [collectionId, productId, sortOrder]
    );

    logger.info(`Product ${productId} added to collection ${collectionId}`);
    return result.rows[0];

  } catch (error) {
    throw error;
  }
};

/**
 * Remove product from collection
 * @param {string} collectionId - Collection UUID
 * @param {string} productId - Product UUID
 */
const removeProductFromCollection = async (collectionId, productId) => {
  const result = await query(
    `DELETE FROM collection_products 
     WHERE collection_id = $1 AND product_id = $2
     RETURNING *`,
    [collectionId, productId]
  );

  if (result.rows.length === 0) {
    const error = new Error('Product not found in collection');
    error.statusCode = 404;
    throw error;
  }

  logger.info(`Product ${productId} removed from collection ${collectionId}`);
  return { success: true };
};

/**
 * Reorder products in collection
 * @param {string} collectionId - Collection UUID
 * @param {Array} productOrders - [{product_id, sort_order}]
 */
const reorderCollectionProducts = async (collectionId, productOrders) => {
  const client = await getClient();

  try {
    await client.query('BEGIN');

    for (const item of productOrders) {
      await client.query(
        `UPDATE collection_products 
         SET sort_order = $1
         WHERE collection_id = $2 AND product_id = $3`,
        [item.sort_order, collectionId, item.product_id]
      );
    }

    await client.query('COMMIT');

    logger.info(`Collection ${collectionId} products reordered`);
    return { success: true, reordered: productOrders.length };

  } catch (error) {
    await client.query('ROLLBACK');
    throw error;
  } finally {
    client.release();
  }
};

module.exports = {
  createCollection,
  getAllCollections,
  getCollectionById,
  getCollectionBySlug,
  updateCollection,
  deleteCollection,
  addProductToCollection,
  removeProductFromCollection,
  reorderCollectionProducts
};
