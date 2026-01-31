/**
 * routes/tamil-classics.routes.js - Tamil Classics Routes
 */

const express = require('express');
const router = express.Router();
const tamilClassicsController = require('../controllers/tamil-classics.controller');
const { authenticateToken, requireAdmin } = require('../middleware/auth.middleware');

// Public routes
router.get('/:classicType', tamilClassicsController.getProducts);

// Admin routes
router.use(authenticateToken, requireAdmin);
router.post('/:classicType', tamilClassicsController.createProduct);

module.exports = router;