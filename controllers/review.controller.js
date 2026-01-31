/**
 * controllers/review.controller.js - Review HTTP Handlers
 */

const reviewService = require('../services/review.service');

const createReview = async (req, res, next) => {
    try {
        const review = await reviewService.createReview(req.user.id, req.params.productId, req.body);
        res.status(201).json({ success: true, data: { review } });
    } catch (error) {
        next(error);
    }
};

const getProductReviews = async (req, res, next) => {
    try {
        const reviews = await reviewService.getProductReviews(req.params.productId, req.query);
        res.status(200).json({ success: true, data: { reviews } });
    } catch (error) {
        next(error);
    }
};

const getMyReviews = async (req, res, next) => {
    try {
        const reviews = await reviewService.getUserReviews(req.user.id);
        res.status(200).json({ success: true, data: { reviews } });
    } catch (error) {
        next(error);
    }
};

const updateReview = async (req, res, next) => {
    try {
        const review = await reviewService.updateReview(req.params.id, req.user.id, req.body);
        if (!review) {
            return res.status(404).json({ success: false, message: 'Review not found or you do not have permission to update it' });
        }
        res.status(200).json({ success: true, data: { review } });
    } catch (error) {
        next(error);
    }
};

const deleteReview = async (req, res, next) => {
    try {
        await reviewService.deleteReview(req.params.id, req.user.id);
        res.status(200).json({ success: true, message: 'Review deleted' });
    } catch (error) {
        next(error);
    }
};

const approveReview = async (req, res, next) => {
    try {
        const review = await reviewService.approveReview(req.params.id);
        res.status(200).json({ success: true, data: { review } });
    } catch (error) {
        next(error);
    }
};

module.exports = {
    createReview,
    getProductReviews,
    getMyReviews,
    updateReview,
    deleteReview,
    approveReview
};