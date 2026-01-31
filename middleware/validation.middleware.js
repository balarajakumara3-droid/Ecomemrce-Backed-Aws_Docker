/**
 * middleware/validation.middleware.js - Enhanced with Product Validation
 */

const { body, param, validationResult } = require('express-validator');
const { ApiError } = require('./error.middleware');

/**
 * Helper function to handle validation errors
 */
const handleValidationErrors = (req, res, next) => {
  const errors = validationResult(req);
  
  if (!errors.isEmpty()) {
    const formattedErrors = errors.array().map(err => ({
      field: err.path,
      message: err.msg,
      value: err.value
    }));
    
    const error = new ApiError('Validation failed', 400, formattedErrors);
    return next(error);
  }
  
  next();
};

// ==========================================
// AUTH VALIDATION RULES
// ==========================================

const validateRegistration = [
  body('email')
    .isEmail()
    .withMessage('Please provide a valid email address')
    .normalizeEmail()
    .trim(),
  
  body('password')
    .isLength({ min: 8 })
    .withMessage('Password must be at least 8 characters long')
    .matches(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]/)
    .withMessage('Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character'),
  
  body('first_name')
    .trim()
    .isLength({ min: 1, max: 100 })
    .withMessage('First name is required and must be less than 100 characters')
    .matches(/^[a-zA-Z\s'-]+$/)
    .withMessage('First name contains invalid characters'),
  
  body('last_name')
    .trim()
    .isLength({ min: 1, max: 100 })
    .withMessage('Last name is required and must be less than 100 characters')
    .matches(/^[a-zA-Z\s'-]+$/)
    .withMessage('Last name contains invalid characters'),
  
  handleValidationErrors
];

const validateLogin = [
  body('email')
    .isEmail()
    .withMessage('Please provide a valid email address')
    .normalizeEmail()
    .trim(),
  
  body('password')
    .notEmpty()
    .withMessage('Password is required'),
  
  handleValidationErrors
];

const validateProfileUpdate = [
  body('first_name')
    .optional()
    .trim()
    .isLength({ min: 1, max: 100 })
    .withMessage('First name must be less than 100 characters')
    .matches(/^[a-zA-Z\s'-]+$/)
    .withMessage('First name contains invalid characters'),
  
  body('last_name')
    .optional()
    .trim()
    .isLength({ min: 1, max: 100 })
    .withMessage('Last name must be less than 100 characters')
    .matches(/^[a-zA-Z\s'-]+$/)
    .withMessage('Last name contains invalid characters'),
  
  body('phone')
    .optional()
    .trim()
    .isMobilePhone()
    .withMessage('Please provide a valid phone number'),
  
  body('address')
    .optional()
    .isObject()
    .withMessage('Address must be an object'),
  
  handleValidationErrors
];

// ==========================================
// PRODUCT VALIDATION RULES
// ==========================================

const validateProductCreate = [
  body('name')
    .trim()
    .isLength({ min: 1, max: 255 })
    .withMessage('Product name is required and must be less than 255 characters'),
  
  body('price')
    .isFloat({ min: 0 })
    .withMessage('Price must be a positive number'),
  
  body('description')
    .optional()
    .trim()
    .isLength({ max: 5000 })
    .withMessage('Description must be less than 5000 characters'),
  
  body('inventory_quantity')
    .optional()
    .isInt({ min: 0 })
    .withMessage('Inventory quantity must be a non-negative integer'),
  
  body('category_id')
    .optional()
    .isUUID()
    .withMessage('Category ID must be a valid UUID'),
  
  body('is_active')
    .optional()
    .isBoolean()
    .withMessage('is_active must be a boolean'),
  
  body('is_featured')
    .optional()
    .isBoolean()
    .withMessage('is_featured must be a boolean'),
  
  body('tags')
    .optional()
    .isArray()
    .withMessage('Tags must be an array'),
  
  handleValidationErrors
];

const validateProductUpdate = [
  body('name')
    .optional()
    .trim()
    .isLength({ min: 1, max: 255 })
    .withMessage('Product name must be less than 255 characters'),
  
  body('price')
    .optional()
    .isFloat({ min: 0 })
    .withMessage('Price must be a positive number'),
  
  body('inventory_quantity')
    .optional()
    .isInt({ min: 0 })
    .withMessage('Inventory quantity must be a non-negative integer'),
  
  body('category_id')
    .optional()
    .isUUID()
    .withMessage('Category ID must be a valid UUID'),
  
  handleValidationErrors
];

const validateUUID = [
  param('id')
    .isUUID()
    .withMessage('Invalid ID format. Must be a valid UUID'),
  handleValidationErrors
];

// ==========================================
// VARIANT VALIDATION RULES
// ==========================================

const validateVariantCreate = [
  body('title')
    .trim()
    .isLength({ min: 1, max: 255 })
    .withMessage('Variant title is required'),
  
  body('price')
    .optional()
    .isFloat({ min: 0 })
    .withMessage('Price must be a positive number'),
  
  body('inventory_quantity')
    .optional()
    .isInt({ min: 0 })
    .withMessage('Inventory quantity must be a non-negative integer'),
  
  body('options')
    .optional()
    .isObject()
    .withMessage('Options must be an object (e.g., {size: "Large", color: "Red"})'),
  
  handleValidationErrors
];

const validateInventoryUpdate = [
  body('quantity')
    .isInt()
    .withMessage('Quantity must be an integer'),
  
  body('operation')
    .optional()
    .isIn(['set', 'adjust'])
    .withMessage('Operation must be either "set" or "adjust"'),
  
  handleValidationErrors
];

// ==========================================
// COLLECTION VALIDATION RULES
// ==========================================

const validateCollectionCreate = [
  body('name')
    .trim()
    .isLength({ min: 1, max: 255 })
    .withMessage('Collection name is required'),
  
  body('type')
    .optional()
    .isIn(['manual', 'automatic'])
    .withMessage('Type must be either "manual" or "automatic"'),
  
  body('sort_order')
    .optional()
    .isIn(['manual', 'best-selling', 'price-asc', 'price-desc', 'created-desc', 'created-asc'])
    .withMessage('Invalid sort order'),
  
  handleValidationErrors
];

const validateAddToCollection = [
  body('product_id')
    .isUUID()
    .withMessage('Product ID must be a valid UUID'),
  
  body('sort_order')
    .optional()
    .isInt()
    .withMessage('Sort order must be an integer'),
  
  handleValidationErrors
];

const validateReorderCollection = [
  body('products')
    .isArray({ min: 1 })
    .withMessage('Products must be a non-empty array'),
  
  body('products.*.product_id')
    .isUUID()
    .withMessage('Each product must have a valid UUID'),
  
  body('products.*.sort_order')
    .isInt()
    .withMessage('Each product must have a valid sort_order integer'),
  
  handleValidationErrors
];

// ==========================================
// EXPORT
// ==========================================

module.exports = {
  handleValidationErrors,
  validateRegistration,
  validateLogin,
  validateProfileUpdate,
  validateProductCreate,
  validateProductUpdate,
  validateUUID,
  validateVariantCreate,
  validateInventoryUpdate,
  validateCollectionCreate,
  validateAddToCollection,
  validateReorderCollection
};
