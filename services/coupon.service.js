/**
 * services/coupon.service.js - Coupon Business Logic
 */

const { query } = require('../utils/db');
const { v4: uuidv4 } = require('uuid');
const logger = require('../utils/logger');

const createCoupon = async (couponData) => {
  const {
    code,
    type,
    value,
    description = null,
    minimum_order_amount = 0,
    usage_limit = null,
    usage_limit_per_user = null,
    starts_at = null,
    expires_at = null,
    is_active = true,
    applies_to = 'all',
    product_ids = [],
    category_ids = []
  } = couponData;

  const upperCaseCode = code.toUpperCase();

  const result = await query(
    `INSERT INTO coupons (
      id, code, type, value, description, minimum_order_amount, usage_limit,
      usage_limit_per_user, starts_at, expires_at, is_active, applies_to,
      product_ids, category_ids
    ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
    RETURNING *`,
    [
      uuidv4(), upperCaseCode, type, value, description, minimum_order_amount,
      usage_limit, usage_limit_per_user, starts_at, expires_at, is_active,
      applies_to, product_ids, category_ids
    ]
  );
  logger.info(`Coupon created: ${upperCaseCode}`);
  return result.rows[0];
};

const getCoupons = async (filters = {}) => {
  // Basic filtering, can be expanded
  const { is_active } = filters;
  let queryText = 'SELECT * FROM coupons WHERE deleted_at IS NULL';
  const values = [];

  if (is_active !== undefined) {
    queryText += ' AND is_active = $1';
    values.push(is_active);
  }

  const result = await query(queryText, values);
  return result.rows;
};

const getCouponByCode = async (code) => {
  const upperCaseCode = code.toUpperCase();
  const result = await query('SELECT * FROM coupons WHERE code = $1 AND deleted_at IS NULL', [upperCaseCode]);
  return result.rows[0];
};

const updateCoupon = async (couponId, updateData) => {
    const fields = [
        'code', 'type', 'value', 'description', 'minimum_order_amount',
        'usage_limit', 'usage_limit_per_user', 'starts_at', 'expires_at', 'is_active',
        'applies_to', 'product_ids', 'category_ids'
    ];
    
    const updates = [];
    const values = [];
    let paramCount = 1;

    for (const field of fields) {
        if (updateData[field] !== undefined) {
            updates.push(`${field} = $${paramCount}`);
            values.push(field === 'code' ? updateData[field].toUpperCase() : updateData[field]);
            paramCount++;
        }
    }

    if (updates.length === 0) {
        throw new Error('No fields to update');
    }

    updates.push('updated_at = NOW()');
    values.push(couponId);

    const queryText = `UPDATE coupons SET ${updates.join(', ')} WHERE id = $${paramCount} RETURNING *`;
    const result = await query(queryText, values);
    
    logger.info(`Coupon updated: ${result.rows[0].code}`);
    return result.rows[0];
};

const deleteCoupon = async (couponId) => {
  await query('UPDATE coupons SET deleted_at = NOW() WHERE id = $1', [couponId]);
  logger.info(`Coupon deleted: ${couponId}`);
  return { id: couponId, deleted: true };
};

const validateCoupon = async (code, userId, cartTotal, cartItems) => {
    const coupon = await getCouponByCode(code);

    if (!coupon || !coupon.is_active || coupon.deleted_at) {
        throw new Error('Coupon not found or is inactive');
    }

    // Check expiration
    const now = new Date();
    if (coupon.starts_at && new Date(coupon.starts_at) > now) {
        throw new Error('Coupon is not yet active');
    }
    if (coupon.expires_at && new Date(coupon.expires_at) < now) {
        throw new Error('Coupon has expired');
    }

    // Check minimum order amount
    if (cartTotal < coupon.minimum_order_amount) {
        throw new Error(`Minimum order amount of ${coupon.minimum_order_amount} is required`);
    }

    // check usage limits
    if (coupon.usage_limit) {
        const usageResult = await query('SELECT COUNT(*) FROM coupon_usage WHERE coupon_id = $1', [coupon.id]);
        if (usageResult.rows[0].count >= coupon.usage_limit) {
            throw new Error('Coupon usage limit reached');
        }
    }

    if (userId && coupon.usage_limit_per_user) {
        const userUsageResult = await query('SELECT COUNT(*) FROM coupon_usage WHERE coupon_id = $1 AND user_id = $2', [coupon.id, userId]);
        if (userUsageResult.rows[0].count >= coupon.usage_limit_per_user) {
            throw new Error('You have already used this coupon the maximum number of times');
        }
    }
    
    // check product/category restrictions
    if (coupon.applies_to === 'specific_products') {
        const itemProductIds = cartItems.map(item => item.product_id);
        const applicable = itemProductIds.some(id => coupon.product_ids.includes(id));
        if (!applicable) throw new Error('Coupon not valid for items in cart');
    }

    return coupon;
};

const applyCoupon = (coupon, orderTotal) => {
    let discount = 0;
    if (coupon.type === 'percentage') {
        discount = orderTotal * (coupon.value / 100);
    } else if (coupon.type === 'fixed') {
        discount = coupon.value;
    }
    return Math.min(discount, orderTotal); // Discount can't be more than total
};


module.exports = {
  createCoupon,
  getCoupons,
  getCouponByCode,
  updateCoupon,
  deleteCoupon,
  validateCoupon,
  applyCoupon
};