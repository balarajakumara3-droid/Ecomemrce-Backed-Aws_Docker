/**
 * services/cart.service.js - Cart Business Logic
 */

const { query, getClient, enhanceConnectionError } = require('../utils/db');
const logger = require('../utils/logger');
const { v4: uuidv4 } = require('uuid');

/**
 * Get or create a cart for a user or session.
 * @param {string} userId - The user's ID (optional).
 * @param {string} sessionId - The guest session ID (optional).
 * @returns {Object} - The cart.
 */
const getOrCreateCart = async (userId, sessionId) => {
  if (!userId && !sessionId) {
    throw new Error('User ID or Session ID is required');
  }

  let cart;
  if (userId) {
    const result = await query('SELECT * FROM carts WHERE user_id = $1 AND is_active = true', [userId]);
    cart = result.rows[0];
  } else {
    const result = await query('SELECT * FROM carts WHERE session_id = $1 AND is_active = true', [sessionId]);
    cart = result.rows[0];
  }

  if (!cart) {
    const newCartId = uuidv4();
    const result = await query(
      'INSERT INTO carts (id, user_id, session_id) VALUES ($1, $2, $3) RETURNING *',
      [newCartId, userId, sessionId]
    );
    cart = result.rows[0];
    logger.info(`New cart created: ${newCartId}`);
  }

  return cart;
};

/**
 * Add an item to the cart.
 * @param {string} cartId - The cart's ID.
 * @param {string} productId - The product's ID.
 * @param {string} variantId - The variant's ID (optional).
 * @param {number} quantity - The quantity to add.
 * @returns {Object} - The updated cart.
 */
const addToCart = async (cartId, productId, variantId, quantity) => {
  const client = await getClient();
  try {
    await client.query('BEGIN');

    // Get product/variant details
    let itemQuery, itemValues;
    if (variantId) {
      itemQuery = 'SELECT price, inventory_quantity FROM variants WHERE id = $1 AND product_id = $2 AND is_active = true';
      itemValues = [variantId, productId];
    } else {
      itemQuery = 'SELECT price, inventory_quantity FROM products WHERE id = $1 AND is_active = true';
      itemValues = [productId];
    }
    const itemResult = await client.query(itemQuery, itemValues);
    if (itemResult.rows.length === 0) {
      throw new Error('Product or variant not found or not active');
    }
    const { price, inventory_quantity } = itemResult.rows[0];
    
    // check inventory
    if (inventory_quantity < quantity) {
        throw new Error('Not enough inventory');
    }

    // Check if item already in cart
    const existingItemResult = await client.query(
      'SELECT * FROM cart_items WHERE cart_id = $1 AND product_id = $2 AND (variant_id = $3 OR ($3 IS NULL AND variant_id IS NULL))',
      [cartId, productId, variantId]
    );

    if (existingItemResult.rows.length > 0) {
      // Update quantity
      const existingItem = existingItemResult.rows[0];
      const newQuantity = existingItem.quantity + quantity;
      if (inventory_quantity < newQuantity) {
        throw new Error('Not enough inventory');
      }
      await client.query('UPDATE cart_items SET quantity = $1 WHERE id = $2', [newQuantity, existingItem.id]);
    } else {
      // Add new item
      await client.query(
        'INSERT INTO cart_items (id, cart_id, product_id, variant_id, quantity, price) VALUES ($1, $2, $3, $4, $5, $6)',
        [uuidv4(), cartId, productId, variantId, quantity, price]
      );
    }

    await client.query('COMMIT');
    return getCartWithDetails(cartId);
  } catch (error) {
    await client.query('ROLLBACK');
    logger.error('Add to cart error:', error);
    throw enhanceConnectionError(error);
  } finally {
    client.release();
  }
};

/**
 * Get cart with all details and totals.
 * @param {string} cartId - The cart's ID.
 * @returns {Object} - The detailed cart.
 */
const getCartWithDetails = async (cartId) => {
    const cartResult = await query('SELECT * FROM carts WHERE id = $1', [cartId]);
    if (cartResult.rows.length === 0) {
      return null;
    }
    const cart = cartResult.rows[0];
  
    const itemsResult = await query(
      `SELECT
        ci.id,
        ci.product_id,
        ci.variant_id,
        ci.quantity,
        ci.price,
        p.name as product_name,
        p.images
      FROM cart_items ci
      JOIN products p ON ci.product_id = p.id
      WHERE ci.cart_id = $1`,
      [cartId]
    );
  
    cart.items = itemsResult.rows;
    cart.total_price = cart.items.reduce((total, item) => total + (item.price * item.quantity), 0);
    cart.item_count = cart.items.reduce((count, item) => count + item.quantity, 0);

    // Update cart totals in DB
    await query('UPDATE carts SET total_price = $1, item_count = $2 WHERE id = $3', [cart.total_price, cart.item_count, cartId]);
  
    return cart;
};

/**
 * Update a cart item's quantity.
 * @param {string} cartId - The cart's ID.
 * @param {string} itemId - The cart item's ID.
 * @param {number} quantity - The new quantity.
 * @returns {Object} - The updated cart.
 */
const updateCartItem = async (cartId, itemId, quantity) => {
    if (quantity <= 0) {
      return removeFromCart(cartId, itemId);
    }
  
    const itemResult = await query('UPDATE cart_items SET quantity = $1 WHERE id = $2 AND cart_id = $3 RETURNING *', [quantity, itemId, cartId]);
    if (itemResult.rows.length === 0) {
        throw new Error('Item not found in cart');
    }
    return getCartWithDetails(cartId);
};

/**
 * Remove an item from the cart.
 * @param {string} cartId - The cart's ID.
 * @param {string} itemId - The cart item's ID.
 * @returns {Object} - The updated cart.
 */
const removeFromCart = async (cartId, itemId) => {
    await query('DELETE FROM cart_items WHERE id = $1 AND cart_id = $2', [itemId, cartId]);
    return getCartWithDetails(cartId);
};

/**
 * Clear all items from the cart.
 * @param {string} cartId - The cart's ID.
 * @returns {Object} - The empty cart.
 */
const clearCart = async (cartId) => {
    await query('DELETE FROM cart_items WHERE cart_id = $1', [cartId]);
    return getCartWithDetails(cartId);
};

/**
 * Merge guest cart into user cart on login.
 * @param {string} guestSessionId - The guest session ID.
 * @param {string} userId - The user's ID.
 * @returns {Object} - The merged cart.
 */
const mergeCarts = async (guestSessionId, userId) => {
    const guestCartResult = await query('SELECT * FROM carts WHERE session_id = $1 AND is_active = true', [guestSessionId]);
    const guestCart = guestCartResult.rows[0];
    if (!guestCart) return getOrCreateCart(userId, null);

    const userCart = await getOrCreateCart(userId, null);

    const guestItemsResult = await query('SELECT * FROM cart_items WHERE cart_id = $1', [guestCart.id]);

    for (const item of guestItemsResult.rows) {
        await addToCart(userCart.id, item.product_id, item.variant_id, item.quantity);
    }

    // Deactivate guest cart
    await query('UPDATE carts SET is_active = false WHERE id = $1', [guestCart.id]);
    logger.info(`Merged guest cart ${guestCart.id} into user cart ${userCart.id}`);

    return getCartWithDetails(userCart.id);
};

module.exports = {
  getOrCreateCart,
  addToCart,
  updateCartItem,
  removeFromCart,
  clearCart,
  getCartWithDetails,
  mergeCarts
};