/**
 * services/tamil-classics.service.js - Tamil Classics Business Logic
 */

const { query, enhanceConnectionError } = require('../utils/db');
const { v4: uuidv4 } = require('uuid');

const getProducts = async (classicType) => {
    const tableName = `tamilnadu_${classicType}_classics`;
    const result = await query(`SELECT * FROM ${tableName}`);
    return result.rows;
};

const createProduct = async (classicType, productData) => {
    const tableName = `tamilnadu_${classicType}_classics`;
    const { product_name, weight, price, discounted_price, description, image_url } = productData;
    const result = await query(
        `INSERT INTO ${tableName} (id, product_name, weight, price, discounted_price, description, image_url) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *`,
        [uuidv4(), product_name, weight, price, discounted_price, description, image_url]
    );
    return result.rows[0];
};

module.exports = {
    getProducts,
    createProduct
};