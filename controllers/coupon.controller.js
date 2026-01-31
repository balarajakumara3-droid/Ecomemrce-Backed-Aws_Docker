/**
 * controllers/coupon.controller.js - Coupon HTTP Handlers
 */

const couponService = require('../services/coupon.service');

const createCoupon = async (req, res, next) => {
  try {
    const coupon = await couponService.createCoupon(req.body);
    res.status(201).json({ success: true, data: { coupon } });
  } catch (error) {
    next(error);
  }
};

const getCoupons = async (req, res, next) => {
  try {
    const coupons = await couponService.getCoupons(req.query);
    res.status(200).json({ success: true, data: { coupons } });
  } catch (error) {
    next(error);
  }
};

const getCoupon = async (req, res, next) => {
  try {
    const coupon = await couponService.getCouponByCode(req.params.code);
    if (!coupon) {
      return res.status(404).json({ success: false, message: 'Coupon not found' });
    }
    res.status(200).json({ success: true, data: { coupon } });
  } catch (error) {
    next(error);
  }
};

const updateCoupon = async (req, res, next) => {
  try {
    const coupon = await couponService.updateCoupon(req.params.id, req.body);
    res.status(200).json({ success: true, data: { coupon } });
  } catch (error) {
    next(error);
  }
};

const deleteCoupon = async (req, res, next) => {
  try {
    await couponService.deleteCoupon(req.params.id);
    res.status(200).json({ success: true, message: 'Coupon deleted' });
  } catch (error) {
    next(error);
  }
};

const validateCoupon = async (req, res, next) => {
    try {
        const { code, cart_total, cart_items } = req.body;
        const userId = req.user ? req.user.id : null;
        const coupon = await couponService.validateCoupon(code, userId, cart_total, cart_items);
        const discount = couponService.applyCoupon(coupon, cart_total);

        res.status(200).json({
            success: true,
            message: 'Coupon is valid',
            data: {
                code: coupon.code,
                discount_amount: discount
            }
        });
    } catch (error) {
        next(error);
    }
};

module.exports = {
  createCoupon,
  getCoupons,
  getCoupon,
  updateCoupon,
  deleteCoupon,
  validateCoupon,
};