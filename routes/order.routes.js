/**
 * routes/order.routes.js - Order Routes
 */

const express = require('express');
const router = express.Router();
const orderController = require('../controllers/order.controller');
const { authenticateToken, requireAdmin } = require('../middleware/auth.middleware');

// All routes below are authenticated
router.use(authenticateToken);

router.post('/', orderController.createOrder);
router.get('/', orderController.getMyOrders);
router.get('/:id', orderController.getOrder);

// Admin routes
router.get('/admin/all', requireAdmin, orderController.getAllOrders);
router.patch('/:id/status', requireAdmin, orderController.updateStatus);

module.exports = router;