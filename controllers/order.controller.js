/**
 * controllers/order.controller.js - Order HTTP Handlers
 */

const orderService = require('../services/order.service');
const cartService = require('../services/cart.service');

const createOrder = async (req, res, next) => {
    try {
        const userId = req.user.id;
        const { shipping_address, billing_address, coupon_code } = req.body;

        const cart = await cartService.getOrCreateCart(userId, null);
        if (!cart || cart.item_count === 0) {
            return res.status(400).json({ success: false, message: 'Cart is empty' });
        }

        const orderData = {
            cartId: cart.id,
            shipping_address,
            billing_address,
            coupon_code
        };

        const order = await orderService.createOrder(userId, orderData);
        res.status(201).json({ success: true, data: { order } });
    } catch (error) {
        next(error);
    }
};

const getOrder = async (req, res, next) => {
    try {
        const order = await orderService.getOrderById(req.params.id, req.user.id);
        res.status(200).json({ success: true, data: { order } });
    } catch (error) {
        next(error);
    }
};

const getMyOrders = async (req, res, next) => {
    try {
        const orders = await orderService.getUserOrders(req.user.id);
        res.status(200).json({ success: true, data: { orders } });
    } catch (error) {
        next(error);
    }
};

const getAllOrders = async (req, res, next) => {
    try {
        const orders = await orderService.getAllOrders(req.query);
        res.status(200).json({ success: true, data: { orders } });
    } catch (error) {
        next(error);
    }
};

const updateStatus = async (req, res, next) => {
    try {
        const { status } = req.body;
        const order = await orderService.updateOrderStatus(req.params.id, status);
        res.status(200).json({ success: true, data: { order } });
    } catch (error) {
        next(error);
    }
};

module.exports = {
    createOrder,
    getOrder,
    getMyOrders,
    getAllOrders,
    updateStatus
};