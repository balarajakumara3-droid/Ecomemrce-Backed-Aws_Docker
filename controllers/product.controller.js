/**
 * controllers/product.controller.js - Product HTTP Handlers
 */

const productService = require('../services/product.service');
const variantService = require('../services/variant.service');
const { uploadFile, deleteFile } = require('../utils/s3');
const logger = require('../utils/logger');

// ==========================================
// PRODUCT CRUD
// ==========================================

/**
 * POST /api/v1/products
 * Create new product (Admin only)
 */
const createProduct = async (req, res, next) => {
  try {
    const productData = req.body;

    // Handle image uploads if files provided
    if (req.files && req.files.length > 0) {
      const uploadResults = await Promise.all(
        req.files.map(file => uploadFile(file, 'products'))
      );
      productData.images = uploadResults.map(r => r.url);
    }

    const product = await productService.createProduct(productData);

    res.status(201).json({
      success: true,
      message: 'Product created successfully',
      data: { product }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * GET /api/v1/products
 * Get all products (Public)
 */
const getAllProducts = async (req, res, next) => {
  try {
    const filters = {
      page: req.query.page,
      limit: req.query.limit,
      category_id: req.query.category_id,
      is_active: req.query.is_active !== undefined ? req.query.is_active === 'true' : true,
      is_featured: req.query.is_featured === 'true' ? true : undefined,
      search: req.query.search,
      min_price: req.query.min_price,
      max_price: req.query.max_price,
      tags: req.query.tags,
      is_in_stock: req.query.is_in_stock !== undefined ? req.query.is_in_stock === 'true' : undefined,
      sort_by: req.query.sort_by,
      sort_order: req.query.sort_order
    };

    const result = await productService.getAllProducts(filters);

    res.status(200).json({
      success: true,
      data: result
    });

  } catch (error) {
    next(error);
  }
};

/**
 * GET /api/v1/products/:id
 * Get product by ID (Public)
 */
const getProductById = async (req, res, next) => {
  try {
    const { id } = req.params;
    const product = await productService.getProductById(id);

    // Get variants
    const variants = await variantService.getVariantsByProduct(id);
    product.variants = variants;

    res.status(200).json({
      success: true,
      data: { product }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * GET /api/v1/products/slug/:slug
 * Get product by slug (Public)
 */
const getProductBySlug = async (req, res, next) => {
  try {
    const { slug } = req.params;
    const product = await productService.getProductBySlug(slug);

    // Get variants
    const variants = await variantService.getVariantsByProduct(product.id);
    product.variants = variants;

    // Get variant options for selectors
    const variantOptions = await variantService.getVariantOptions(product.id);
    product.variant_options = variantOptions;

    res.status(200).json({
      success: true,
      data: { product }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * PUT /api/v1/products/:id
 * Update product (Admin only)
 */
const updateProduct = async (req, res, next) => {
  try {
    const { id } = req.params;
    const updateData = req.body;

    // Handle new image uploads
    if (req.files && req.files.length > 0) {
      const uploadResults = await Promise.all(
        req.files.map(file => uploadFile(file, 'products'))
      );
      
      // Merge with existing images or replace
      const newImages = uploadResults.map(r => r.url);
      if (updateData.images && Array.isArray(updateData.images)) {
        updateData.images = [...updateData.images, ...newImages];
      } else {
        updateData.images = newImages;
      }
    }

    const product = await productService.updateProduct(id, updateData);

    res.status(200).json({
      success: true,
      message: 'Product updated successfully',
      data: { product }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * DELETE /api/v1/products/:id
 * Delete product (Admin only)
 */
const deleteProduct = async (req, res, next) => {
  try {
    const { id } = req.params;
    const result = await productService.deleteProduct(id);

    res.status(200).json({
      success: true,
      message: 'Product deleted successfully',
      data: result
    });

  } catch (error) {
    next(error);
  }
};

// ==========================================
// PRODUCT IMAGES
// ==========================================

/**
 * POST /api/v1/products/:id/images
 * Upload image to product (Admin only)
 */
const uploadProductImage = async (req, res, next) => {
  try {
    const { id } = req.params;

    if (!req.file) {
      return res.status(400).json({
        success: false,
        message: 'No image file provided'
      });
    }

    const uploadResult = await uploadFile(req.file, 'products');
    const product = await productService.addProductImage(id, uploadResult.url);

    res.status(200).json({
      success: true,
      message: 'Image uploaded successfully',
      data: {
        image: uploadResult,
        product
      }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * DELETE /api/v1/products/:id/images
 * Remove image from product (Admin only)
 */
const removeProductImage = async (req, res, next) => {
  try {
    const { id } = req.params;
    const { image_url } = req.body;

    if (!image_url) {
      return res.status(400).json({
        success: false,
        message: 'image_url is required'
      });
    }

    // Extract key from URL and delete from S3
    try {
      const urlParts = image_url.split('/');
      const key = urlParts.slice(3).join('/'); // Extract path after bucket
      await deleteFile(key);
    } catch (s3Error) {
      logger.warn('Failed to delete image from S3:', s3Error.message);
      // Continue even if S3 delete fails
    }

    const product = await productService.removeProductImage(id, image_url);

    res.status(200).json({
      success: true,
      message: 'Image removed successfully',
      data: { product }
    });

  } catch (error) {
    next(error);
  }
};

module.exports = {
  createProduct,
  getAllProducts,
  getProductById,
  getProductBySlug,
  updateProduct,
  deleteProduct,
  uploadProductImage,
  removeProductImage
};
