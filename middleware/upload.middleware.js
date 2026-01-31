/**
 * middleware/upload.middleware.js - File Upload Middleware
 * 
 * This middleware handles file uploads using Multer.
 * It processes multipart/form-data and stores files in memory (for S3 upload)
 * or disk (for local storage).
 * 
 * Configuration:
 * - Accepts images only (jpg, jpeg, png, gif, webp)
 * - Max file size: 5MB
 * - Max 10 files per upload
 */

const multer = require('multer');
const path = require('path');
const { ApiError } = require('./error.middleware');

// ==========================================
// FILE FILTER - Only allow images
// ==========================================

const fileFilter = (req, file, cb) => {
  // Allowed mime types
  const allowedMimes = [
    'image/jpeg',
    'image/jpg',
    'image/png',
    'image/gif',
    'image/webp'
  ];

  // Allowed extensions
  const allowedExtensions = ['.jpg', '.jpeg', '.png', '.gif', '.webp'];
  const ext = path.extname(file.originalname).toLowerCase();

  if (allowedMimes.includes(file.mimetype) && allowedExtensions.includes(ext)) {
    cb(null, true); // Accept file
  } else {
    cb(new Error('Only image files are allowed (jpg, jpeg, png, gif, webp)'), false);
  }
};

// ==========================================
// STORAGE CONFIGURATION
// ==========================================

// Memory storage (for direct S3 upload)
const memoryStorage = multer.memoryStorage();

// Disk storage (for local development/testing)
const diskStorage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/');
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1E9);
    const ext = path.extname(file.originalname);
    cb(null, file.fieldname + '-' + uniqueSuffix + ext);
  }
});

// ==========================================
// UPLOAD CONFIGURATION
// ==========================================

const uploadConfig = {
  storage: memoryStorage, // Use memory for S3 uploads
  fileFilter: fileFilter,
  limits: {
    fileSize: 5 * 1024 * 1024, // 5MB max file size
    files: 10 // Max 10 files per request
  }
};

// Create multer instance
const upload = multer(uploadConfig);

// ==========================================
// ERROR HANDLING WRAPPER
// ==========================================

/**
 * Wrap multer middleware to handle errors consistently
 */
const handleUploadError = (err, req, res, next) => {
  if (err instanceof multer.MulterError) {
    // Multer-specific errors
    if (err.code === 'LIMIT_FILE_SIZE') {
      return res.status(400).json({
        success: false,
        message: 'File too large. Maximum size is 5MB.'
      });
    }
    if (err.code === 'LIMIT_FILE_COUNT') {
      return res.status(400).json({
        success: false,
        message: 'Too many files. Maximum is 10 files.'
      });
    }
    if (err.code === 'LIMIT_UNEXPECTED_FILE') {
      return res.status(400).json({
        success: false,
        message: `Unexpected field: ${err.field}. Use 'image' for single file or 'images' for multiple.`
      });
    }
    return res.status(400).json({
      success: false,
      message: err.message
    });
  }

  // Other errors (like file filter rejection)
  if (err) {
    return res.status(400).json({
      success: false,
      message: err.message || 'File upload error'
    });
  }

  next();
};

// ==========================================
// EXPORT MIDDLEWARE HELPERS
// ==========================================

/**
 * Upload single image
 * Usage: router.post('/upload', uploadSingle, handleUploadError, controller)
 */
const uploadSingle = upload.single('image');

/**
 * Upload multiple images
 * Usage: router.post('/upload', uploadMultiple, handleUploadError, controller)
 */
const uploadMultiple = upload.array('images', 10);

/**
 * Upload mixed fields
 * Usage: router.post('/products', uploadFields, handleUploadError, controller)
 */
const uploadFields = upload.fields([
  { name: 'featured_image', maxCount: 1 },
  { name: 'gallery_images', maxCount: 10 }
]);

module.exports = {
  upload,
  uploadSingle,
  uploadMultiple,
  uploadFields,
  handleUploadError
};
