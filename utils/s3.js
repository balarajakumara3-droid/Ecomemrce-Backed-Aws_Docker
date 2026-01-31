/**
 * utils/s3.js - AWS S3 File Upload Utility
 * 
 * This utility handles file uploads to AWS S3 (or S3-compatible services like MinIO).
 * It provides a clean interface for uploading product images and other files.
 * 
 * Supports:
 * - AWS S3 (production)
 * - MinIO or other S3-compatible services (local dev)
 */

const { S3Client, PutObjectCommand, DeleteObjectCommand, GetObjectCommand } = require('@aws-sdk/client-s3');
const { getSignedUrl } = require('@aws-sdk/s3-request-presigner');
const logger = require('./logger');

// ==========================================
// S3 CLIENT CONFIGURATION
// ==========================================

const s3Config = {
  region: process.env.AWS_REGION || 'us-east-1',
  credentials: {
    accessKeyId: process.env.AWS_ACCESS_KEY_ID,
    secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY
  }
};

// If S3_ENDPOINT is set, use it (for MinIO/local S3)
if (process.env.S3_ENDPOINT) {
  s3Config.endpoint = process.env.S3_ENDPOINT;
  s3Config.forcePathStyle = true; // Required for MinIO
}

const s3Client = new S3Client(s3Config);
const BUCKET_NAME = process.env.S3_BUCKET;

// Validate configuration
if (!BUCKET_NAME) {
  logger.warn('⚠️  S3_BUCKET not configured. File uploads will fail.');
}

// ==========================================
// UPLOAD FUNCTIONS
// ==========================================

/**
 * Upload a file to S3
 * @param {Object} file - Multer file object (buffer, originalname, mimetype)
 * @param {string} folder - Folder path in bucket (e.g., 'products', 'avatars')
 * @returns {Object} - { url, key, bucket }
 * 
 * Usage:
 *   const result = await uploadFile(req.file, 'products');
 *   console.log(result.url); // Public URL of uploaded file
 */
const uploadFile = async (file, folder = 'uploads') => {
  try {
    if (!file) {
      throw new Error('No file provided');
    }

    if (!BUCKET_NAME) {
      throw new Error('S3_BUCKET not configured');
    }

    // Generate unique filename: folder/uuid-originalname
    const { v4: uuidv4 } = require('uuid');
    const uniqueName = `${uuidv4()}-${file.originalname.replace(/\s+/g, '-')}`;
    const key = `${folder}/${uniqueName}`;

    // Upload parameters
    const params = {
      Bucket: BUCKET_NAME,
      Key: key,
      Body: file.buffer,
      ContentType: file.mimetype,
      // ACL: 'public-read' // Uncomment if your bucket allows public-read ACL
    };

    // Execute upload
    const command = new PutObjectCommand(params);
    await s3Client.send(command);

    // Construct public URL
    // For AWS S3: https://bucket-name.s3.region.amazonaws.com/key
    // For custom endpoint: https://endpoint/bucket-name/key
    let url;
    if (process.env.S3_ENDPOINT) {
      // MinIO or custom S3
      url = `${process.env.S3_ENDPOINT}/${BUCKET_NAME}/${key}`;
    } else {
      // AWS S3
      const region = process.env.AWS_REGION || 'us-east-1';
      url = `https://${BUCKET_NAME}.s3.${region}.amazonaws.com/${key}`;
    }

    logger.info(`File uploaded to S3: ${key}`);

    return {
      url,
      key,
      bucket: BUCKET_NAME,
      originalName: file.originalname,
      size: file.size,
      mimeType: file.mimetype
    };

  } catch (error) {
    logger.error('S3 upload error:', error);
    throw new Error(`Failed to upload file: ${error.message}`);
  }
};

/**
 * Upload multiple files to S3
 * @param {Array} files - Array of Multer file objects
 * @param {string} folder - Folder path in bucket
 * @returns {Array} - Array of upload results
 */
const uploadMultipleFiles = async (files, folder = 'uploads') => {
  if (!files || !Array.isArray(files)) {
    return [];
  }

  const uploadPromises = files.map(file => uploadFile(file, folder));
  return Promise.all(uploadPromises);
};

/**
 * Delete a file from S3
 * @param {string} key - S3 object key (path)
 * @returns {boolean} - Success status
 */
const deleteFile = async (key) => {
  try {
    if (!key) {
      throw new Error('No key provided');
    }

    const params = {
      Bucket: BUCKET_NAME,
      Key: key
    };

    const command = new DeleteObjectCommand(params);
    await s3Client.send(command);

    logger.info(`File deleted from S3: ${key}`);
    return true;

  } catch (error) {
    logger.error('S3 delete error:', error);
    throw new Error(`Failed to delete file: ${error.message}`);
  }
};

/**
 * Generate a presigned URL for temporary access
 * Useful for private files that need temporary access
 * @param {string} key - S3 object key
 * @param {number} expiresIn - URL expiration in seconds (default: 3600)
 * @returns {string} - Presigned URL
 */
const getPresignedUrl = async (key, expiresIn = 3600) => {
  try {
    const command = new GetObjectCommand({
      Bucket: BUCKET_NAME,
      Key: key
    });

    const url = await getSignedUrl(s3Client, command, { expiresIn });
    return url;

  } catch (error) {
    logger.error('S3 presigned URL error:', error);
    throw new Error(`Failed to generate presigned URL: ${error.message}`);
  }
};

module.exports = {
  uploadFile,
  uploadMultipleFiles,
  deleteFile,
  getPresignedUrl,
  s3Client
};
