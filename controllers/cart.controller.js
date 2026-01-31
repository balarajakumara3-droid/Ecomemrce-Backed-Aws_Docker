/**
 * controllers/cart.controller.js - Cart HTTP Handlers
 */

const cartService = require('../services/cart.service');
const { v4: uuidv4 } = require('uuid');

const getCart = async (req, res, next) => {
  try {
    const userId = req.user ? req.user.id : null;
    let sessionId = req.session.id;

    if (!userId && !sessionId) {
      sessionId = uuidv4();
      req.session.id = sessionId;
    }
    
    const cart = await cartService.getOrCreateCart(userId, sessionId);
    const detailedCart = await cartService.getCartWithDetails(cart.id);

    res.status(200).json({
      success: true,
      data: { cart: detailedCart }
    });
  } catch (error) {
    next(error);
  }
};

const addItem = async (req, res, next) => {
  try {
    const { product_id, variant_id, quantity } = req.body;
    const userId = req.user ? req.user.id : null;
    let sessionId = req.session.id;

    if (!userId && !sessionId) {
        sessionId = uuidv4();
        req.session.id = sessionId;
    }

    const cart = await cartService.getOrCreateCart(userId, sessionId);
    const updatedCart = await cartService.addToCart(cart.id, product_id, variant_id, quantity);

    res.status(200).json({
      success: true,
      message: 'Item added to cart',
      data: { cart: updatedCart }
    });
  } catch (error) {
    next(error);
  }
};

const updateItem = async (req, res, next) => {
  try {
    const { itemId } = req.params;
    const { quantity } = req.body;
    const userId = req.user ? req.user.id : null;
    const sessionId = req.session.id;

    const cart = await cartService.getOrCreateCart(userId, sessionId);
    const updatedCart = await cartService.updateCartItem(cart.id, itemId, quantity);

    res.status(200).json({
      success: true,
      message: 'Cart item updated',
      data: { cart: updatedCart }
    });
  } catch (error) {
    next(error);
  }
};

const removeItem = async (req, res, next) => {
  try {
    const { itemId } = req.params;
    const userId = req.user ? req.user.id : null;
    const sessionId = req.session.id;

    const cart = await cartService.getOrCreateCart(userId, sessionId);
    const updatedCart = await cartService.removeFromCart(cart.id, itemId);

    res.status(200).json({
      success: true,
      message: 'Item removed from cart',
      data: { cart: updatedCart }
    });
  } catch (error) {
    next(error);
  }
};

const clearCart = async (req, res, next) => {
  try {
    const userId = req.user ? req.user.id : null;
    const sessionId = req.session.id;

    const cart = await cartService.getOrCreateCart(userId, sessionId);
    const updatedCart = await cartService.clearCart(cart.id);

    res.status(200).json({
      success: true,
      message: 'Cart cleared',
      data: { cart: updatedCart }
    });
  } catch (error) {
    next(error);
  }
};

const syncCart = async (req, res, next) => {
    try {
        const userId = req.user ? req.user.id : null;
        let sessionId = req.session.id;

        if (userId && req.body.session_id) {
            const mergedCart = await cartService.mergeCarts(req.body.session_id, userId);
            sessionId = null; // clear session id after merge
            req.session.id = null;
            return res.status(200).json({
                success: true,
                message: 'Carts merged and synced',
                data: { cart: mergedCart }
              });
        }
        
        const cart = await cartService.getOrCreateCart(userId, sessionId);
        const detailedCart = await cartService.getCartWithDetails(cart.id);
    
        res.status(200).json({
          success: true,
          data: { cart: detailedCart }
        });
      } catch (error) {
        next(error);
      }
};

module.exports = {
  getCart,
  addItem,
  updateItem,
  removeItem,
  clearCart,
  syncCart
};