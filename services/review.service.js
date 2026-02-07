/**
 * services/review.service.js - Review Business Logic
 */

const { query, enhanceConnectionError } = require('../utils/db');
const { v4: uuidv4 } = require('uuid');
const logger = require('../utils/logger');

const createReview = async (userId, productId, reviewData) => {
    const { rating, title, body } = reviewData;

    // Check if user has purchased the product
    const orderResult = await query(
        `SELECT o.id FROM orders o
         JOIN order_items oi ON o.id = oi.order_id
         WHERE o.user_id = $1 AND oi.product_id = $2 AND o.status = 'delivered'`,
        [userId, productId]
    );
    const isVerifiedPurchase = orderResult.rows.length > 0;

    const result = await query(
        `INSERT INTO reviews (id, user_id, product_id, rating, title, body, is_verified_purchase)
         VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *`,
        [uuidv4(), userId, productId, rating, title, body, isVerifiedPurchase]
    );

    await calculateProductRating(productId);
    logger.info(`Review created for product ${productId} by user ${userId}`);
    return result.rows[0];
};

const getProductReviews = async (productId, filters = {}) => {
    const result = await query('SELECT * FROM reviews WHERE product_id = $1 AND is_approved = true AND deleted_at IS NULL ORDER BY created_at DESC', [productId]);
    return result.rows;
};

const getUserReviews = async (userId) => {
    const result = await query('SELECT * FROM reviews WHERE user_id = $1 AND deleted_at IS NULL ORDER BY created_at DESC', [userId]);
    return result.rows;
};

const updateReview = async (reviewId, userId, reviewData) => {
    const { rating, title, body } = reviewData;
    const result = await query(
        `UPDATE reviews SET rating = $1, title = $2, body = $3, updated_at = NOW()
         WHERE id = $4 AND user_id = $5 AND deleted_at IS NULL RETURNING *`,
        [rating, title, body, reviewId, userId]
    );
    if(result.rows.length > 0) {
        await calculateProductRating(result.rows[0].product_id);
    }
    return result.rows[0];
};

const deleteReview = async (reviewId, userId) => {
    const result = await query('UPDATE reviews SET deleted_at = NOW() WHERE id = $1 AND user_id = $2 RETURNING *', [reviewId, userId]);
    if(result.rows.length > 0) {
        await calculateProductRating(result.rows[0].product_id);
    }
    logger.info(`Review deleted: ${reviewId}`);
    return { id: reviewId, deleted: true };
};

const approveReview = async (reviewId) => {
    const result = await query('UPDATE reviews SET is_approved = true, updated_at = NOW() WHERE id = $1 RETURNING *', [reviewId]);
    return result.rows[0];
};

const calculateProductRating = async (productId) => {
    const result = await query(
        `SELECT AVG(rating) as avg_rating, COUNT(id) as review_count
         FROM reviews WHERE product_id = $1 AND is_approved = true AND deleted_at IS NULL`,
        [productId]
    );
    const { avg_rating, review_count } = result.rows[0];
    await query('UPDATE products SET average_rating = $1, sales_count = $2 WHERE id = $3', [avg_rating || 0, review_count, productId]);
};

module.exports = {
    createReview,
    getProductReviews,
    getUserReviews,
    updateReview,
    deleteReview,
    approveReview
};