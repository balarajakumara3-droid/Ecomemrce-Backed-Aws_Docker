/**
 * controllers/collection.controller.js - Collection HTTP Handlers
 */

const collectionService = require('../services/collection.service');
const { uploadFile } = require('../utils/s3');
const logger = require('../utils/logger');

// ==========================================
// COLLECTION CRUD
// ==========================================

/**
 * POST /api/v1/collections
 * Create new collection (Admin only)
 */
const createCollection = async (req, res, next) => {
  try {
    const collectionData = req.body;

    // Handle image upload
    if (req.file) {
      const uploadResult = await uploadFile(req.file, 'collections');
      collectionData.image_url = uploadResult.url;
    }

    const collection = await collectionService.createCollection(collectionData);

    res.status(201).json({
      success: true,
      message: 'Collection created successfully',
      data: { collection }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * GET /api/v1/collections
 * Get all collections (Public)
 */
const getAllCollections = async (req, res, next) => {
  try {
    const filters = {
      page: req.query.page,
      limit: req.query.limit,
      is_active: req.query.is_active === 'false' ? false : true,
      type: req.query.type
    };

    const result = await collectionService.getAllCollections(filters);

    res.status(200).json({
      success: true,
      data: result
    });

  } catch (error) {
    next(error);
  }
};

/**
 * GET /api/v1/collections/:id
 * Get collection by ID (Public)
 */
const getCollectionById = async (req, res, next) => {
  try {
    const { id } = req.params;
    const collection = await collectionService.getCollectionById(id);

    res.status(200).json({
      success: true,
      data: { collection }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * GET /api/v1/collections/slug/:slug
 * Get collection by slug (Public)
 */
const getCollectionBySlug = async (req, res, next) => {
  try {
    const { slug } = req.params;
    const collection = await collectionService.getCollectionBySlug(slug);

    res.status(200).json({
      success: true,
      data: { collection }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * PUT /api/v1/collections/:id
 * Update collection (Admin only)
 */
const updateCollection = async (req, res, next) => {
  try {
    const { id } = req.params;
    const updateData = req.body;

    // Handle image upload
    if (req.file) {
      const uploadResult = await uploadFile(req.file, 'collections');
      updateData.image_url = uploadResult.url;
    }

    const collection = await collectionService.updateCollection(id, updateData);

    res.status(200).json({
      success: true,
      message: 'Collection updated successfully',
      data: { collection }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * DELETE /api/v1/collections/:id
 * Delete collection (Admin only)
 */
const deleteCollection = async (req, res, next) => {
  try {
    const { id } = req.params;
    const result = await collectionService.deleteCollection(id);

    res.status(200).json({
      success: true,
      message: 'Collection deleted successfully',
      data: result
    });

  } catch (error) {
    next(error);
  }
};

// ==========================================
// COLLECTION-PRODUCT RELATIONSHIP
// ==========================================

/**
 * POST /api/v1/collections/:id/products
 * Add product to collection (Admin only)
 */
const addProductToCollection = async (req, res, next) => {
  try {
    const { id: collectionId } = req.params;
    const { product_id, sort_order = 0 } = req.body;

    if (!product_id) {
      return res.status(400).json({
        success: false,
        message: 'product_id is required'
      });
    }

    const result = await collectionService.addProductToCollection(
      collectionId,
      product_id,
      sort_order
    );

    res.status(200).json({
      success: true,
      message: 'Product added to collection',
      data: { collection_product: result }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * DELETE /api/v1/collections/:collectionId/products/:productId
 * Remove product from collection (Admin only)
 */
const removeProductFromCollection = async (req, res, next) => {
  try {
    const { collectionId, productId } = req.params;

    await collectionService.removeProductFromCollection(collectionId, productId);

    res.status(200).json({
      success: true,
      message: 'Product removed from collection'
    });

  } catch (error) {
    next(error);
  }
};

/**
 * PUT /api/v1/collections/:id/reorder
 * Reorder products in collection (Admin only)
 */
const reorderProducts = async (req, res, next) => {
  try {
    const { id } = req.params;
    const { products } = req.body; // [{product_id, sort_order}]

    if (!Array.isArray(products) || products.length === 0) {
      return res.status(400).json({
        success: false,
        message: 'products array is required'
      });
    }

    const result = await collectionService.reorderCollectionProducts(id, products);

    res.status(200).json({
      success: true,
      message: 'Products reordered successfully',
      data: result
    });

  } catch (error) {
    next(error);
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
  reorderProducts
};
