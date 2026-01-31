/**
 * routes/collection.routes.js - Collection Routes
 * 
 * Routes:
 * - Public: GET /api/v1/collections (list all)
 * - Public: GET /api/v1/collections/:id (get by ID with products)
 * - Public: GET /api/v1/collections/slug/:slug (get by slug)
 * - Admin: POST /api/v1/collections (create)
 * - Admin: PUT /api/v1/collections/:id (update)
 * - Admin: DELETE /api/v1/collections/:id (delete)
 * - Admin: POST /api/v1/collections/:id/products (add product)
 * - Admin: DELETE /api/v1/collections/:collectionId/products/:productId (remove)
 * - Admin: PUT /api/v1/collections/:id/reorder (reorder products)
 */

const express = require('express');
const router = express.Router();

// Controllers
const collectionController = require('../controllers/collection.controller');

// Middleware
const { authenticateToken, requireAdmin } = require('../middleware/auth.middleware');
const { 
  validateCollectionCreate, 
  validateAddToCollection,
  validateReorderCollection,
  validateUUID 
} = require('../middleware/validation.middleware');
const { uploadSingle, handleUploadError } = require('../middleware/upload.middleware');

// ==========================================
// PUBLIC ROUTES
// ==========================================

// Get all collections
router.get('/', collectionController.getAllCollections);

// Get collection by slug
router.get('/slug/:slug', collectionController.getCollectionBySlug);

// Get collection by ID
router.get('/:id', validateUUID, collectionController.getCollectionById);

// ==========================================
// PROTECTED ADMIN ROUTES
// ==========================================

// All routes below require authentication + admin role
router.use(authenticateToken, requireAdmin);

// Create collection (with image upload)
router.post('/', 
  uploadSingle, 
  handleUploadError, 
  validateCollectionCreate, 
  collectionController.createCollection
);

// Update collection (with image upload)
router.put('/:id', 
  validateUUID,
  uploadSingle, 
  handleUploadError, 
  collectionController.updateCollection
);

// Delete collection
router.delete('/:id', validateUUID, collectionController.deleteCollection);

// Add product to collection
router.post('/:id/products', 
  validateUUID,
  validateAddToCollection, 
  collectionController.addProductToCollection
);

// Remove product from collection
router.delete('/:collectionId/products/:productId', collectionController.removeProductFromCollection);

// Reorder products in collection
router.put('/:id/reorder', 
  validateUUID,
  validateReorderCollection, 
  collectionController.reorderProducts
);

module.exports = router;
