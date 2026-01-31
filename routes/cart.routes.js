/**
 * routes/cart.routes.js - Cart Routes
 */

const express = require('express');
const router = express.Router();
const cartController = require('../controllers/cart.controller');
const { authenticateToken } = require('../middleware/auth.middleware');
const { validateCartItem } = require('../middleware/validation.middleware');

// All cart routes can be accessed by authenticated users or guest sessions
// We use a middleware to softly authenticate
const softAuthenticate = (req, res, next) => {
    if (req.headers.authorization) {
        return authenticateToken(req, res, next);
    }
    next();
};

router.use(softAuthenticate);

// GET /api/v1/cart - Get current cart
router.get('/', cartController.getCart);

// POST /api/v1/cart/items - Add item to cart
router.post('/items', validateCartItem, cartController.addItem);

// PUT /api/v1/cart/items/:itemId - Update item quantity
router.put('/items/:itemId', cartController.updateItem);

// DELETE /api/v1/cart/items/:itemId - Remove item from cart
router.delete('/items/:itemId', cartController.removeItem);

// DELETE /api/v1/cart - Clear cart
router.delete('/', cartController.clearCart);

// POST /api/v1/cart/sync - Sync cart and merge if needed
router.post('/sync', cartController.syncCart);

module.exports = router;
