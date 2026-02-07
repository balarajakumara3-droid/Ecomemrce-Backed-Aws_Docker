/**
 * services/order.service.js - Order Business Logic
 */

const { query, getClient, enhanceConnectionError } = require('../utils/db');
const { v4: uuidv4 } = require('uuid');
const logger = require('../utils/logger');
const couponService = require('./coupon.service');

const generateOrderNumber = async () => {
    const date = new Date();
    const year = date.getFullYear();
    const result = await query('SELECT COUNT(*) FROM orders WHERE EXTRACT(YEAR FROM created_at) = $1', [year]);
    const count = parseInt(result.rows[0].count) + 1;
    return `ORD-${year}-${count.toString().padStart(4, '0')}`;
};

const createOrder = async (userId, orderData) => {
    const client = await getClient();
    try {
        await client.query('BEGIN');

        const { cartId, shipping_address, billing_address, coupon_code } = orderData;
        
        // Get cart items
        const cartItemsResult = await client.query('SELECT * FROM cart_items WHERE cart_id = $1', [cartId]);
        const cartItems = cartItemsResult.rows;
        if (cartItems.length === 0) throw new Error('Cart is empty');

        let subtotal = cartItems.reduce((sum, item) => sum + (item.price * item.quantity), 0);
        let discount = 0;
        let couponId = null;

        if (coupon_code) {
            const coupon = await couponService.validateCoupon(coupon_code, userId, subtotal, cartItems);
            discount = couponService.applyCoupon(coupon, subtotal);
            couponId = coupon.id;
        }

        const total = subtotal - discount;

        // Create order
        const orderId = uuidv4();
        const orderNumber = await generateOrderNumber();
        const orderResult = await client.query(
            `INSERT INTO orders (id, order_number, user_id, subtotal, discount, total, coupon_id, shipping_address, billing_address, status)
             VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, 'pending') RETURNING *`,
            [orderId, orderNumber, userId, subtotal, discount, total, couponId, shipping_address, billing_address || shipping_address]
        );
        const order = orderResult.rows[0];

        // Create order items and decrease inventory
        for (const item of cartItems) {
            await client.query(
                `INSERT INTO order_items (id, order_id, product_id, variant_id, quantity, price)
                 VALUES ($1, $2, $3, $4, $5, $6)`,
                [uuidv4(), orderId, item.product_id, item.variant_id, item.quantity, item.price]
            );

            const inventoryField = item.variant_id ? 'variants' : 'products';
            const idField = item.variant_id ? 'id' : 'id';
            const idValue = item.variant_id || item.product_id;
            await client.query(`UPDATE ${inventoryField} SET inventory_quantity = inventory_quantity - $1 WHERE ${idField} = $2`, [item.quantity, idValue]);
        }

        // Clear the cart
        await client.query('DELETE FROM cart_items WHERE cart_id = $1', [cartId]);
        await client.query('UPDATE carts SET is_active = false WHERE id = $1', [cartId]);
        
        // Log coupon usage
        if (couponId) {
            await client.query('INSERT INTO coupon_usage (coupon_id, user_id, order_id) VALUES ($1, $2, $3)', [couponId, userId, orderId]);
        }

        await client.query('COMMIT');
        logger.info(`Order created: ${order.order_number}`);
        return order;
    } catch (error) {
        await client.query('ROLLBACK');
        logger.error('Create order error:', error);
        throw enhanceConnectionError(error);
    } finally {
        client.release();
    }
};

const getOrderById = async (orderId, userId) => {
    const orderResult = await query('SELECT * FROM orders WHERE id = $1 AND user_id = $2', [orderId, userId]);
    if (orderResult.rows.length === 0) throw new Error('Order not found');
    const order = orderResult.rows[0];

    const itemsResult = await query('SELECT * FROM order_items WHERE order_id = $1', [orderId]);
    order.items = itemsResult.rows;

    return order;
};

const getUserOrders = async (userId) => {
    const result = await query('SELECT * FROM orders WHERE user_id = $1 ORDER BY created_at DESC', [userId]);
    return result.rows;
};

const getAllOrders = async (filters = {}) => {
    const result = await query('SELECT * FROM orders ORDER BY created_at DESC');
    return result.rows;
};

const updateOrderStatus = async (orderId, status) => {
    const result = await query('UPDATE orders SET status = $1, updated_at = NOW() WHERE id = $2 RETURNING *', [status, orderId]);
    logger.info(`Order status updated: ${orderId} to ${status}`);
    return result.rows[0];
};

module.exports = {
    createOrder,
    getOrderById,
    getUserOrders,
    getAllOrders,
    updateOrderStatus
};