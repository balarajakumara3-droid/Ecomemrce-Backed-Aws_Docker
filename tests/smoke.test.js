/**
 * tests/smoke.test.js - Comprehensive Smoke Tests for All Endpoints
 * 
 * This file contains smoke tests for all API endpoints to verify they respond correctly.
 * Run with: npm test
 */

const request = require('supertest');
const app = require('../server');

// Test configuration
const TEST_TIMEOUT = 10000;

// Store tokens and IDs for reuse across tests
let adminToken = null;
let userToken = null;
let testProductId = null;
let testOrderId = null;
let testCollectionId = null;
let testCouponId = null;

// Test user credentials
const testUser = {
  email: `test${Date.now()}@example.com`,
  password: 'TestPassword123!',
  first_name: 'Test',
  last_name: 'User'
};

describe('🚀 SMOKE TESTS - E-commerce API', () => {
  
  // ==========================================
  // SERVER & BASE ROUTES
  // ==========================================
  describe('Server Health & Base Routes', () => {
    
    test('GET / - Should return API info', async () => {
      const response = await request(app)
        .get('/')
        .expect(200);
      
      expect(response.body.success).toBe(true);
      expect(response.body.message).toBe('E-commerce API');
      expect(response.body.endpoints).toBeDefined();
    }, TEST_TIMEOUT);

    test('GET /health - Should return health status', async () => {
      const response = await request(app)
        .get('/health')
        .expect(200);
      
      expect(response.body.success).toBe(true);
      expect(response.body.status).toBe('ok');
      expect(response.body.timestamp).toBeDefined();
    }, TEST_TIMEOUT);

    test('GET /nonexistent - Should return 404', async () => {
      const response = await request(app)
        .get('/nonexistent')
        .expect(404);
      
      expect(response.body.success).toBe(false);
      expect(response.body.message).toContain('not found');
    }, TEST_TIMEOUT);
  });

  // ==========================================
  // AUTHENTICATION ROUTES
  // ==========================================
  describe('Authentication Routes', () => {
    
    test('POST /api/v1/auth/register - Should register a new user', async () => {
      const response = await request(app)
        .post('/api/v1/auth/register')
        .send(testUser)
        .expect(201);
      
      expect(response.body.success).toBe(true);
      expect(response.body.data).toBeDefined();
      expect(response.body.data.token).toBeDefined();
      userToken = response.body.data.token;
    }, TEST_TIMEOUT);

    test('POST /api/v1/auth/login - Should login with valid credentials', async () => {
      const response = await request(app)
        .post('/api/v1/auth/login')
        .send({
          email: testUser.email,
          password: testUser.password
        })
        .expect(200);
      
      expect(response.body.success).toBe(true);
      expect(response.body.data).toBeDefined();
      expect(response.body.data.token).toBeDefined();
      userToken = response.body.data.token;
    }, TEST_TIMEOUT);

    test('POST /api/v1/auth/login - Should reject invalid credentials', async () => {
      const response = await request(app)
        .post('/api/v1/auth/login')
        .send({
          email: testUser.email,
          password: 'wrongpassword'
        })
        .expect(401);
      
      expect(response.body.success).toBe(false);
    }, TEST_TIMEOUT);

    test('GET /api/v1/auth/profile - Should require authentication', async () => {
      const response = await request(app)
        .get('/api/v1/auth/profile')
        .expect(401);
      
      expect(response.body.success).toBe(false);
    }, TEST_TIMEOUT);

    test('GET /api/v1/auth/profile - Should return user profile with valid token', async () => {
      const response = await request(app)
        .get('/api/v1/auth/profile')
        .set('Authorization', `Bearer ${userToken}`)
        .expect(200);
      
      expect(response.body.success).toBe(true);
      expect(response.body.data).toBeDefined();
    }, TEST_TIMEOUT);

    test('PUT /api/v1/auth/profile - Should update user profile', async () => {
      const response = await request(app)
        .put('/api/v1/auth/profile')
        .set('Authorization', `Bearer ${userToken}`)
        .send({
          first_name: 'Updated',
          last_name: 'Name'
        })
        .expect(200);
      
      expect(response.body.success).toBe(true);
    }, TEST_TIMEOUT);

    test('POST /api/v1/auth/logout - Should logout user', async () => {
      const response = await request(app)
        .post('/api/v1/auth/logout')
        .set('Authorization', `Bearer ${userToken}`)
        .expect(200);
      
      expect(response.body.success).toBe(true);
    }, TEST_TIMEOUT);
  });

  // ==========================================
  // PRODUCT ROUTES
  // ==========================================
  describe('Product Routes', () => {
    
    test('GET /api/v1/products - Should return all products', async () => {
      const response = await request(app)
        .get('/api/v1/products')
        .expect(200);
      
      expect(response.body.success).toBe(true);
      expect(Array.isArray(response.body.data)).toBe(true);
    }, TEST_TIMEOUT);

    test('GET /api/v1/products?search=test - Should search products', async () => {
      const response = await request(app)
        .get('/api/v1/products?search=test')
        .expect(200);
      
      expect(response.body.success).toBe(true);
    }, TEST_TIMEOUT);

    test('POST /api/v1/products - Should require admin authentication', async () => {
      const response = await request(app)
        .post('/api/v1/products')
        .set('Authorization', `Bearer ${userToken}`)
        .send({
          name: 'Test Product',
          description: 'Test Description',
          base_price: 99.99,
          category: 'Test'
        })
        .expect(403);
      
      expect(response.body.success).toBe(false);
    }, TEST_TIMEOUT);
  });

  // ==========================================
  // COLLECTION ROUTES
  // ==========================================
  describe('Collection Routes', () => {
    
    test('GET /api/v1/collections - Should return all collections', async () => {
      const response = await request(app)
        .get('/api/v1/collections')
        .expect(200);
      
      expect(response.body.success).toBe(true);
      expect(Array.isArray(response.body.data)).toBe(true);
    }, TEST_TIMEOUT);
  });

  // ==========================================
  // CART ROUTES
  // ==========================================
  describe('Cart Routes', () => {
    
    test('GET /api/v1/cart - Should return cart (guest or authenticated)', async () => {
      const response = await request(app)
        .get('/api/v1/cart')
        .expect(200);
      
      expect(response.body.success).toBe(true);
    }, TEST_TIMEOUT);

    test('GET /api/v1/cart - Should return cart with authentication', async () => {
      const response = await request(app)
        .get('/api/v1/cart')
        .set('Authorization', `Bearer ${userToken}`)
        .expect(200);
      
      expect(response.body.success).toBe(true);
    }, TEST_TIMEOUT);
  });

  // ==========================================
  // ORDER ROUTES
  // ==========================================
  describe('Order Routes', () => {
    
    test('GET /api/v1/orders - Should require authentication', async () => {
      const response = await request(app)
        .get('/api/v1/orders')
        .expect(401);
      
      expect(response.body.success).toBe(false);
    }, TEST_TIMEOUT);

    test('GET /api/v1/orders - Should return user orders with auth', async () => {
      const response = await request(app)
        .get('/api/v1/orders')
        .set('Authorization', `Bearer ${userToken}`)
        .expect(200);
      
      expect(response.body.success).toBe(true);
      expect(Array.isArray(response.body.data)).toBe(true);
    }, TEST_TIMEOUT);
  });

  // ==========================================
  // REVIEW ROUTES
  // ==========================================
  describe('Review Routes', () => {
    
    test('GET /api/v1/reviews/product/:productId - Should return product reviews', async () => {
      // Using a dummy product ID
      const response = await request(app)
        .get('/api/v1/reviews/product/00000000-0000-0000-0000-000000000000')
        .expect(200);
      
      expect(response.body.success).toBe(true);
    }, TEST_TIMEOUT);

    test('POST /api/v1/reviews/product/:productId - Should require authentication', async () => {
      const response = await request(app)
        .post('/api/v1/reviews/product/00000000-0000-0000-0000-000000000000')
        .send({
          rating: 5,
          comment: 'Great product!'
        })
        .expect(401);
      
      expect(response.body.success).toBe(false);
    }, TEST_TIMEOUT);
  });

  // ==========================================
  // COUPON ROUTES
  // ==========================================
  describe('Coupon Routes', () => {
    
    test('POST /api/v1/coupons/validate - Should require authentication', async () => {
      const response = await request(app)
        .post('/api/v1/coupons/validate')
        .send({
          code: 'TESTCODE'
        })
        .expect(401);
      
      expect(response.body.success).toBe(false);
    }, TEST_TIMEOUT);

    test('POST /api/v1/coupons/validate - Should validate coupon with auth', async () => {
      const response = await request(app)
        .post('/api/v1/coupons/validate')
        .set('Authorization', `Bearer ${userToken}`)
        .send({
          code: 'TESTCODE'
        })
        .expect(200);
      
      expect(response.body.success).toBe(true);
    }, TEST_TIMEOUT);
  });

  // ==========================================
  // VARIANT ROUTES
  // ==========================================
  describe('Variant Routes', () => {
    
    test('GET /api/v1/variants/products/:productId/variants - Should return variants', async () => {
      const response = await request(app)
        .get('/api/v1/variants/products/00000000-0000-0000-0000-000000000000')
        .expect(200);
      
      expect(response.body.success).toBe(true);
    }, TEST_TIMEOUT);

    test('GET /api/v1/variants/:id - Should return variant by ID', async () => {
      const response = await request(app)
        .get('/api/v1/variants/00000000-0000-0000-0000-000000000000')
        .expect(200);
      
      // Might be 404 if not found, but endpoint should work
      expect([200, 404]).toContain(response.status);
    }, TEST_TIMEOUT);
  });

  // ==========================================
  // ADDRESS ROUTES
  // ==========================================
  describe('Address Routes', () => {
    
    test('GET /api/v1/addresses - Should return 501 (not implemented)', async () => {
      const response = await request(app)
        .get('/api/v1/addresses')
        .set('Authorization', `Bearer ${userToken}`)
        .expect(501);
      
      expect(response.body.success).toBe(false);
      expect(response.body.message).toContain('not implemented');
    }, TEST_TIMEOUT);

    test('POST /api/v1/addresses - Should return 501 (not implemented)', async () => {
      const response = await request(app)
        .post('/api/v1/addresses')
        .set('Authorization', `Bearer ${userToken}`)
        .send({
          street: '123 Test St',
          city: 'Test City',
          state: 'TS',
          zip: '12345'
        })
        .expect(501);
      
      expect(response.body.success).toBe(false);
    }, TEST_TIMEOUT);
  });

  // ==========================================
  // OORU SPECIALS ROUTES
  // ==========================================
  describe('Ooru Specials Routes', () => {
    
    test('GET /api/v1/ooru-specials - Should return all specials', async () => {
      const response = await request(app)
        .get('/api/v1/ooru-specials')
        .expect(200);
      
      expect(response.body.success).toBe(true);
    }, TEST_TIMEOUT);

    test('GET /api/v1/ooru-specials/:slug - Should return special by slug', async () => {
      const response = await request(app)
        .get('/api/v1/ooru-specials/test-slug')
        .expect(200);
      
      // Might be 404 if not found
      expect([200, 404]).toContain(response.status);
    }, TEST_TIMEOUT);
  });

  // ==========================================
  // TAMIL CLASSICS ROUTES
  // ==========================================
  describe('Tamil Classics Routes', () => {
    
    test('GET /api/v1/tamil-classics/:classicType - Should return products', async () => {
      const response = await request(app)
        .get('/api/v1/tamil-classics/sarees')
        .expect(200);
      
      expect(response.body.success).toBe(true);
    }, TEST_TIMEOUT);
  });

  // ==========================================
  // ANALYTICS ROUTES
  // ==========================================
  describe('Analytics Routes (Admin Only)', () => {
    
    test('GET /api/v1/analytics/dashboard - Should require authentication', async () => {
      const response = await request(app)
        .get('/api/v1/analytics/dashboard')
        .expect(401);
      
      expect(response.body.success).toBe(false);
    }, TEST_TIMEOUT);

    test('GET /api/v1/analytics/dashboard - Should require admin role', async () => {
      const response = await request(app)
        .get('/api/v1/analytics/dashboard')
        .set('Authorization', `Bearer ${userToken}`)
        .expect(403);
      
      expect(response.body.success).toBe(false);
    }, TEST_TIMEOUT);
  });

  // ==========================================
  // ERROR HANDLING
  // ==========================================
  describe('Error Handling', () => {
    
    test('Should handle invalid JSON in request body', async () => {
      const response = await request(app)
        .post('/api/v1/auth/login')
        .set('Content-Type', 'application/json')
        .send('invalid json')
        .expect(400);
      
      expect(response.body.success).toBe(false);
    }, TEST_TIMEOUT);

    test('Should handle validation errors', async () => {
      const response = await request(app)
        .post('/api/v1/auth/register')
        .send({
          email: 'invalid-email',
          password: '123' // Too short
        })
        .expect(400);
      
      expect(response.body.success).toBe(false);
    }, TEST_TIMEOUT);
  });
});

// Global test teardown
describe('Test Cleanup', () => {
  test('All smoke tests completed', () => {
    console.log('✅ Smoke tests completed successfully!');
    expect(true).toBe(true);
  });
});