/**
 * controllers/analytics.controller.js - Analytics HTTP Handlers
 */

const analyticsService = require('../services/analytics.service');

const getDashboard = async (req, res, next) => {
    try {
        const stats = await analyticsService.getDashboardStats();
        res.status(200).json({ success: true, data: stats });
    } catch (error) {
        next(error);
    }
};

const getSalesReport = async (req, res, next) => {
    try {
        const { start_date, end_date } = req.query;
        if (!start_date || !end_date) {
            return res.status(400).json({ success: false, message: 'start_date and end_date are required' });
        }
        const report = await analyticsService.getSalesReport(start_date, end_date);
        res.status(200).json({ success: true, data: report });
    } catch (error) {
        next(error);
    }
};

const getTopProducts = async (req, res, next) => {
    try {
        const products = await analyticsService.getTopProducts(req.query.limit);
        res.status(200).json({ success: true, data: products });
    } catch (error) {
        next(error);
    }
};

const getRecentOrders = async (req, res, next) => {
    try {
        const orders = await analyticsService.getRecentOrders(req.query.limit);
        res.status(200).json({ success: true, data: orders });
    } catch (error) {
        next(error);
    }
};

const getInventoryAlerts = async (req, res, next) => {
    try {
        const alerts = await analyticsService.getInventoryAlerts();
        res.status(200).json({ success: true, data: alerts });
    } catch (error) {
        next(error);
    }
};

module.exports = {
    getDashboard,
    getSalesReport,
    getTopProducts,
    getRecentOrders,
    getInventoryAlerts
};