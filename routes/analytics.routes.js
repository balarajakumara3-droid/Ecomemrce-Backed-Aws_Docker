/**
 * routes/analytics.routes.js - Analytics Routes
 */

const express = require('express');
const router = express.Router();
const analyticsController = require('../controllers/analytics.controller');
const { requireAdmin, authenticateToken } = require('../middleware/auth.middleware');

// All routes are admin only
router.use(authenticateToken, requireAdmin);

router.get('/dashboard', analyticsController.getDashboard);
router.get('/sales', analyticsController.getSalesReport);
router.get('/top-products', analyticsController.getTopProducts);
router.get('/recent-orders', analyticsController.getRecentOrders);
router.get('/inventory-alerts', analyticsController.getInventoryAlerts);

module.exports = router;