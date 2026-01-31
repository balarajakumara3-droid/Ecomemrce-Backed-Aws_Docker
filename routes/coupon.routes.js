/**
 * routes/coupon.routes.js - Coupon Routes
 */

const express = require('express');
const router = express.Router();
const couponController = require('../controllers/coupon.controller');
const { authenticateToken, requireAdmin } = require('../middleware/auth.middleware');

// Public route for validation
router.post('/validate', authenticateToken, couponController.validateCoupon);

// All other routes are admin only
router.use(authenticateToken, requireAdmin);

router.post('/', couponController.createCoupon);
router.get('/', couponController.getCoupons);
router.get('/:code', couponController.getCoupon);
router.put('/:id', couponController.updateCoupon);
router.delete('/:id', couponController.deleteCoupon);

module.exports = router;