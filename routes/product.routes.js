/**
 * routes/product.routes.js - Product Routes
 * 
 * Routes:
 * - Public: GET /api/v1/products (list all)
 * - Public: GET /api/v1/products/:id (get by ID)
 * - Public: GET /api/v1/products/slug/:slug (get by slug)
 * - Admin: POST /api/v1/products (create)
 * - Admin: PUT /api/v1/products/:id (update)
 * - Admin: DELETE /api/v1/products/:id (delete)
 * - Admin: POST /api/v1/products/:id/images (upload image)
 * - Admin: DELETE /api/v1/products/:id/images (remove image)
 */

const express = require('express');
const router = express.Router();

// Controllers
const productController = require('../controllers/product.controller');

// Middleware
const { authenticateToken, requireAdmin } = require('../middleware/auth.middleware');
const { 
  validateProductCreate, 
  validateProductUpdate, 
  validateUUID 
} = require('../middleware/validation.middleware');
const { uploadMultiple, uploadSingle, handleUploadError } = require('../middleware/upload.middleware');
const { audit } = require('../middleware/audit.middleware');

// ==========================================
// PUBLIC ROUTES
// ==========================================

// Get all products (with filters)
router.get('/', productController.getAllProducts);

// Get product by slug
router.get('/slug/:slug', productController.getProductBySlug);

// Get single product by ID
router.get('/:id', validateUUID, productController.getProductById);

// ==========================================
// PROTECTED ADMIN ROUTES
// ==========================================

// All routes below require authentication + admin role
router.use(authenticateToken, requireAdmin);

// Create product (with image uploads)
router.post('/', 
  uploadMultiple, 
  handleUploadError, 
  validateProductCreate, 
  productController.createProduct
);

// Update product (with new images)
router.put('/:id', 
  validateUUID,
  uploadMultiple, 
  handleUploadError, 
  validateProductUpdate,
  audit('product', 'update'),
  productController.updateProduct
);

// Delete product
router.delete('/:id', validateUUID, productController.deleteProduct);

// Upload single image to product
router.post('/:id/images', 
  validateUUID,
  uploadSingle, 
  handleUploadError, 
  productController.uploadProductImage
);

// Remove image from product
router.delete('/:id/images', validateUUID, productController.removeProductImage);

module.exports = router;
