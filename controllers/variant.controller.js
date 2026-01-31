/**
 * controllers/variant.controller.js - Product Variant HTTP Handlers
 */

const variantService = require('../services/variant.service');
const logger = require('../utils/logger');

// ==========================================
// VARIANT CRUD
// ==========================================

/**
 * POST /api/v1/products/:productId/variants
 * Create variant for product (Admin only)
 */
const createVariant = async (req, res, next) => {
  try {
    const { productId } = req.params;
    const variantData = req.body;

    const variant = await variantService.createVariant(productId, variantData);

    res.status(201).json({
      success: true,
      message: 'Variant created successfully',
      data: { variant }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * GET /api/v1/products/:productId/variants
 * Get all variants for a product (Public)
 */
const getVariantsByProduct = async (req, res, next) => {
  try {
    const { productId } = req.params;
    const variants = await variantService.getVariantsByProduct(productId);

    res.status(200).json({
      success: true,
      data: { variants }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * GET /api/v1/variants/:id
 * Get single variant (Public)
 */
const getVariantById = async (req, res, next) => {
  try {
    const { id } = req.params;
    const variant = await variantService.getVariantById(id);

    res.status(200).json({
      success: true,
      data: { variant }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * PUT /api/v1/variants/:id
 * Update variant (Admin only)
 */
const updateVariant = async (req, res, next) => {
  try {
    const { id } = req.params;
    const updateData = req.body;

    const variant = await variantService.updateVariant(id, updateData);

    res.status(200).json({
      success: true,
      message: 'Variant updated successfully',
      data: { variant }
    });

  } catch (error) {
    next(error);
  }
};

/**
 * DELETE /api/v1/variants/:id
 * Delete variant (Admin only)
 */
const deleteVariant = async (req, res, next) => {
  try {
    const { id } = req.params;
    const result = await variantService.deleteVariant(id);

    res.status(200).json({
      success: true,
      message: 'Variant deleted successfully',
      data: result
    });

  } catch (error) {
    next(error);
  }
};

// ==========================================
// INVENTORY MANAGEMENT
// ==========================================

/**
 * PATCH /api/v1/variants/:id/inventory
 * Update variant inventory (Admin only)
 */
const updateInventory = async (req, res, next) => {
  try {
    const { id } = req.params;
    const { quantity, operation = 'set' } = req.body;

    if (quantity === undefined || isNaN(quantity)) {
      return res.status(400).json({
        success: false,
        message: 'Valid quantity is required'
      });
    }

    const variant = await variantService.updateInventory(id, parseInt(quantity), operation);

    res.status(200).json({
      success: true,
      message: `Inventory ${operation === 'set' ? 'set to' : 'adjusted by'} ${quantity}`,
      data: { variant }
    });

  } catch (error) {
    next(error);
  }
};

module.exports = {
  createVariant,
  getVariantsByProduct,
  getVariantById,
  updateVariant,
  deleteVariant,
  updateInventory
};
