/**
 * controllers/tamil-classics.controller.js - Tamil Classics HTTP Handlers
 */

const tamilClassicsService = require('../services/tamil-classics.service');

const getProducts = async (req, res, next) => {
    try {
        const { classicType } = req.params;
        const products = await tamilClassicsService.getProducts(classicType);
        res.status(200).json({ success: true, data: products });
    } catch (error) {
        next(error);
    }
};

const createProduct = async (req, res, next) => {
    try {
        const { classicType } = req.params;
        const product = await tamilClassicsService.createProduct(classicType, req.body);
        res.status(201).json({ success: true, data: product });
    } catch (error) {
        next(error);
    }
};

module.exports = {
    getProducts,
    createProduct
};