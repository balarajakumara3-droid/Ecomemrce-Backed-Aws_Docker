/**
 * routes/variant.routes.js - Product Variant Routes
 * 
 * Routes:
 * - Public: GET /api/v1/products/:productId/variants (list by product)
 * - Public: GET /api/v1/variants/:id (get single)
 * - Admin: POST /api/v1/products/:productId/variants (create)
 * - Admin: PUT /api/v1/variants/:id (update)
 * - Admin: DELETE /api/v1/variants/:id (delete)
 * - Admin: PATCH /api/v1/variants/:id/inventory (update inventory)
 */

const express = require('express');
const router = express.Router();

// Controllers
const variantController = require('../controllers/variant.controller');

// Middleware
const { authenticateToken, requireAdmin } = require('../middleware/auth.middleware');
const { 
  validateVariantCreate, 
  validateInventoryUpdate,
  validateUUID 
} = require('../middleware/validation.middleware');

// ==========================================
// PUBLIC ROUTES
// ==========================================

// Get all variants for a product
router.get('/products/:productId/variants', variantController.getVariantsByProduct);

// Get single variant by ID
router.get('/:id', validateUUID, variantController.getVariantById);

// ==========================================
// PROTECTED ADMIN ROUTES
// ==========================================

// All routes below require authentication + admin role
router.use(authenticateToken, requireAdmin);

// Create variant for product
router.post('/products/:productId/variants', 
  validateVariantCreate, 
  variantController.createVariant
);

// Update variant
router.put('/:id', validateUUID, variantController.updateVariant);

// Delete variant
router.delete('/:id', validateUUID, variantController.deleteVariant);

// Update inventory
router.patch('/:id/inventory', 
  validateUUID, 
  validateInventoryUpdate, 
  variantController.updateInventory
);

module.exports = router;
