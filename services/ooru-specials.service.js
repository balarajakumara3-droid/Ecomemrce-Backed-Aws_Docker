/**
 * services/ooru-specials.service.js - Ooru Specials Business Logic
 */

const { query, enhanceConnectionError } = require('../utils/db');
const { v4: uuidv4 } = require('uuid');
const logger = require('../utils/logger');

const getAllSpecials = async () => {
    const result = await query('SELECT * FROM ooru_specials');
    return result.rows;
};

const getSpecialBySlug = async (slug) => {
    const specialResult = await query('SELECT * FROM ooru_specials WHERE slug = $1', [slug]);
    if (specialResult.rows.length === 0) {
        return null;
    }
    const special = specialResult.rows[0];
    const productsResult = await query('SELECT * FROM ooru_specials_products WHERE ooru_special_id = $1', [special.id]);
    special.products = productsResult.rows;
    return special;
};

const createSpecial = async (specialData) => {
    const { category_name, slug, description, image } = specialData;
    const result = await query(
        'INSERT INTO ooru_specials (id, category_name, slug, description, image) VALUES ($1, $2, $3, $4, $5) RETURNING *',
        [uuidv4(), category_name, slug, description, image]
    );
    logger.info(`Ooru Special created: ${slug}`);
    return result.rows[0];
};

const updateSpecial = async (id, specialData) => {
    const { category_name, slug, description, image } = specialData;
    const result = await query(
        'UPDATE ooru_specials SET category_name = $1, slug = $2, description = $3, image = $4, updated_at = NOW() WHERE id = $5 RETURNING *',
        [category_name, slug, description, image, id]
    );
    return result.rows[0];
};

const deleteSpecial = async (id) => {
    await query('DELETE FROM ooru_specials WHERE id = $1', [id]);
    logger.info(`Ooru Special deleted: ${id}`);
    return { id, deleted: true };
};

module.exports = {
    getAllSpecials,
    getSpecialBySlug,
    createSpecial,
    updateSpecial,
    deleteSpecial
};