/**
 * routes/review.routes.js - Review Routes
 */

const express = require('express');
const router = express.Router();
const reviewController = require('../controllers/review.controller');
const { authenticateToken, requireAdmin } = require('../middleware/auth.middleware');

// Public route
router.get('/product/:productId', reviewController.getProductReviews);

// Authenticated routes
router.use(authenticateToken);

router.post('/product/:productId', reviewController.createReview);
router.get('/my-reviews', reviewController.getMyReviews);
router.put('/:id', reviewController.updateReview);
router.delete('/:id', reviewController.deleteReview);

// Admin routes
router.patch('/:id/approve', requireAdmin, reviewController.approveReview);

module.exports = router;