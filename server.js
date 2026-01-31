/**
 * server.js - Main Application Entry Point
 * 
 * This is the heart of our e-commerce API. It sets up Express,
 * connects middleware, and starts the server.
 * 
 * Architecture: MVC-like pattern with clear separation:
 * - Routes: Define API endpoints
 * - Controllers: Handle HTTP requests/responses
 * - Services: Business logic
 * - Middleware: Cross-cutting concerns (auth, validation, etc.)
 */

const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const rateLimit = require('express-rate-limit');
const session = require('express-session');
require('dotenv').config();

// Import routes
const authRoutes = require('./routes/auth.routes');
const productRoutes = require('./routes/product.routes');
const variantRoutes = require('./routes/variant.routes');
const collectionRoutes = require('./routes/collection.routes');
const cartRoutes = require('./routes/cart.routes');
const couponRoutes = require('./routes/coupon.routes');
const orderRoutes = require('./routes/order.routes');
const reviewRoutes = require('./routes/review.routes');
const analyticsRoutes = require('./routes/analytics.routes');
const addressRoutes = require('./routes/address.routes');
const ooruSpecialsRoutes = require('./routes/ooru-specials.routes');
const tamilClassicsRoutes = require('./routes/tamil-classics.routes');

// Import middleware
const errorHandler = require('./middleware/error.middleware');
const logger = require('./utils/logger');

// Initialize Express app
const app = express();
const PORT = process.env.PORT || 3000;

// ==========================================
// SECURITY MIDDLEWARE (Order matters!)
// ==========================================

// 1. Helmet: Sets security headers (X-Frame-Options, CSP, etc.)
app.use(helmet());

// 2. CORS: Allow requests from specified origins
const corsOptions = {
  origin: process.env.CORS_ORIGINS?.split(',') || '*',
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH'],
  allowedHeaders: ['Content-Type', 'Authorization']
};
app.use(cors(corsOptions));

// 3. Rate Limiting: Prevent brute force attacks
const limiter = rateLimit({
  windowMs: parseInt(process.env.RATE_LIMIT_WINDOW_MS) || 15 * 60 * 1000, // 15 minutes
  max: parseInt(process.env.RATE_LIMIT_MAX_REQUESTS) || 100, // Limit each IP
  message: {
    success: false,
    message: 'Too many requests from this IP, please try again later.'
  },
  standardHeaders: true,
  legacyHeaders: false
});
app.use(limiter);

// Stricter rate limit for auth endpoints
const authLimiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 5, // 5 attempts per window
  message: {
    success: false,
    message: 'Too many authentication attempts, please try again later.'
  }
});

// ==========================================
// BODY PARSING MIDDLEWARE
// ==========================================

// Parse JSON bodies (for API requests)
app.use(express.json({ limit: '10mb' }));

// Parse URL-encoded bodies (for form submissions)
app.use(express.urlencoded({ extended: true, limit: '10mb' }));

// Session middleware
app.use(session({
  secret: process.env.SESSION_SECRET || 'your-secret-key',
  resave: false,
  saveUninitialized: false,
  cookie: {
    secure: 'auto', // Recommended
    httpOnly: true,
    sameSite: 'lax'
  }
}));

// ==========================================
// HEALTH CHECK ROUTE
// ==========================================

/**
 * GET /health
 * Simple health check endpoint for monitoring/Docker
 * Returns: { status: 'ok', timestamp, uptime }
 */
app.get('/health', (req, res) => {
  res.status(200).json({
    success: true,
    status: 'ok',
    timestamp: new Date().toISOString(),
    uptime: process.uptime(),
    environment: process.env.NODE_ENV || 'development'
  });
});

// ==========================================
// API ROUTES
// ==========================================

// Base route info
app.get('/', (req, res) => {
  res.json({
    success: true,
    message: 'E-commerce API',
    version: '1.0.0',
    endpoints: {
      health: '/health',
      auth: '/api/v1/auth',
      products: '/api/v1/products',
      variants: '/api/v1/variants',
      collections: '/api/v1/collections',
      cart: '/api/v1/cart',
      coupons: '/api/v1/coupons',
      orders: '/api/v1/orders',
      reviews: '/api/v1/reviews',
      analytics: '/api/v1/analytics',
      addresses: '/api/v1/addresses',
      'ooru-specials': '/api/v1/ooru-specials',
      'tamil-classics': '/api/v1/tamil-classics'
    }
  });
});

// Apply auth rate limiter to auth routes
app.use('/api/v1/auth/register', authLimiter);
app.use('/api/v1/auth/login', authLimiter);

// Mount routes
app.use('/api/v1/auth', authRoutes);
app.use('/api/v1/products', productRoutes);
app.use('/api/v1/variants', variantRoutes);
app.use('/api/v1/collections', collectionRoutes);
app.use('/api/v1/cart', cartRoutes);
app.use('/api/v1/coupons', couponRoutes);
app.use('/api/v1/orders', orderRoutes);
app.use('/api/v1/reviews', reviewRoutes);
app.use('/api/v1/ooru-specials', ooruSpecialsRoutes);
app.use('/api/v1/tamil-classics', tamilClassicsRoutes);

// ==========================================
// ERROR HANDLING (Must be last!)
// ==========================================

// 404 Handler - Route not found
app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: `Route ${req.method} ${req.originalUrl} not found`
  });
});

// Global Error Handler
app.use(errorHandler);

// ==========================================
// START SERVER
// ==========================================

const server = app.listen(PORT, () => {
  logger.info(`🚀 Server running on port ${PORT}`);
  logger.info(`📚 API Documentation: http://localhost:${PORT}/`);
  logger.info(`🏥 Health Check: http://localhost:${PORT}/health`);
});

// Graceful shutdown (handle Ctrl+C, Docker stop)
process.on('SIGTERM', () => {
  logger.info('SIGTERM received, shutting down gracefully');
  server.close(() => {
    logger.info('Server closed');
    process.exit(0);
  });
});

process.on('SIGINT', () => {
  logger.info('SIGINT received, shutting down gracefully');
  server.close(() => {
    logger.info('Server closed');
    process.exit(0);
  });
});

module.exports = app;
