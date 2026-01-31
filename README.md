# E-commerce API

A clean, secure, portable e-commerce API built with **Node.js 20+**, **Express.js**, and **PostgreSQL**. Designed for migration from Supabase to self-hosted AWS (RDS + EC2 + S3), but easily deployable to any VPS or cloud provider.

## Features

### ✅ Phase 1: Authentication (Complete)
- User registration with email/password
- JWT-based login
- Profile management (view/update)
- Password hashing with bcrypt
- Protected routes with JWT middleware

### ✅ Phase 2: Products, Variants & Collections (Complete)
- **Products**: Full CRUD with image uploads to S3
- **Variants**: Size/color options with separate inventory/pricing
- **Collections**: Manual groups with product ordering
- **Admin Protection**: All write operations require admin role
- **File Uploads**: AWS S3 integration with Multer
- **Search & Filter**: By category, price range, featured status

### ✅ Security Features
- Helmet.js for security headers
- CORS configuration
- Rate limiting (general + auth-specific)
- Input validation with express-validator
- Global error handling
- SQL injection protection (parameterized queries)
- Admin role verification middleware

### ✅ Infrastructure
- Docker & Docker Compose support
- Environment variable configuration
- Connection pooling for database
- Structured logging with Winston
- Health check endpoint
- AWS S3 file storage support

## Tech Stack

- **Runtime**: Node.js 20+
- **Framework**: Express.js 4.18+
- **Database**: PostgreSQL 14+ (pg driver)
- **Authentication**: JWT (jsonwebtoken) + bcrypt
- **Validation**: express-validator
- **Security**: helmet, cors, express-rate-limit
- **File Upload**: multer + AWS SDK v3
- **Logging**: winston
- **Docker**: Node 20 Alpine + PostgreSQL 16

## Project Structure

```
ecommerce-api/
├── config/               # Configuration files
├── controllers/          # HTTP request handlers
│   ├── auth.controller.js
│   ├── product.controller.js
│   ├── variant.controller.js
│   └── collection.controller.js
├── middleware/           # Express middleware
│   ├── auth.middleware.js
│   ├── error.middleware.js
│   ├── validation.middleware.js
│   └── upload.middleware.js
├── routes/               # API route definitions
│   ├── auth.routes.js
│   ├── product.routes.js
│   ├── variant.routes.js
│   └── collection.routes.js
├── services/             # Business logic layer
│   ├── auth.service.js
│   ├── product.service.js
│   ├── variant.service.js
│   └── collection.service.js
├── utils/                # Utility functions
│   ├── db.js            # Database connection pool
│   ├── logger.js        # Winston logger
│   └── s3.js            # AWS S3 helper
├── scripts/              # Database scripts
│   ├── init-db.sql      # Schema creation
│   └── init-db.js       # DB initialization script
├── logs/                 # Log files (created at runtime)
├── server.js             # Application entry point
├── package.json
├── Dockerfile
├── docker-compose.yml
└── .env.example
```

## Quick Start

### 1. Clone and Install

```bash
cd ecommerce-api
npm install
```

### 2. Configure Environment

```bash
cp .env.example .env
# Edit .env with your settings (database, JWT secret, AWS credentials)
```

### 3. Start with Docker (Recommended)

```bash
# Start PostgreSQL + API
docker-compose up -d

# Initialize database schema
npm run db:init

# View logs
docker-compose logs -f api
```

### 4. Or Start Locally (without Docker)

```bash
# Make sure PostgreSQL is running locally
# Update .env with local DB credentials

# Initialize database
npm run db:init

# Start development server
npm run dev
```

## API Endpoints

### Health Check
```
GET /health
```

### Authentication
```
POST /api/v1/auth/register          # Register new user
POST /api/v1/auth/login             # Login (returns JWT)
GET  /api/v1/auth/profile           # Get profile (requires auth)
PUT  /api/v1/auth/profile           # Update profile (requires auth)
POST /api/v1/auth/logout            # Logout (requires auth)
```

### Products (Public Read, Admin Write)
```
# Public Routes
GET    /api/v1/products                    # List all (with filters)
GET    /api/v1/products/slug/:slug         # Get by slug
GET    /api/v1/products/:id                 # Get by ID

# Admin Routes (requires JWT + admin role)
POST   /api/v1/products                    # Create (with images)
PUT    /api/v1/products/:id                # Update (with images)
DELETE /api/v1/products/:id                # Soft delete
POST   /api/v1/products/:id/images         # Upload image
DELETE /api/v1/products/:id/images         # Remove image
```

**Product Filters:**
- `?page=1&limit=20` - Pagination
- `?category_id=uuid` - Filter by category
- `?search=keyword` - Search name/description
- `?min_price=10&max_price=100` - Price range
- `?is_featured=true` - Featured products only
- `?sort_by=price&sort_order=asc` - Sorting

### Variants (Public Read, Admin Write)
```
# Public Routes
GET /api/v1/products/:productId/variants   # List by product
GET /api/v1/variants/:id                   # Get single variant

# Admin Routes
POST   /api/v1/products/:productId/variants # Create variant
PUT    /api/v1/variants/:id                 # Update variant
DELETE /api/v1/variants/:id                 # Delete variant
PATCH  /api/v1/variants/:id/inventory       # Update inventory
```

### Collections (Public Read, Admin Write)
```
# Public Routes
GET /api/v1/collections                    # List all
GET /api/v1/collections/slug/:slug         # Get by slug with products
GET /api/v1/collections/:id                # Get by ID with products

# Admin Routes
POST   /api/v1/collections                 # Create (with image)
PUT    /api/v1/collections/:id             # Update (with image)
DELETE /api/v1/collections/:id             # Delete
POST   /api/v1/collections/:id/products    # Add product
DELETE /api/v1/collections/:collectionId/products/:productId  # Remove product
PUT    /api/v1/collections/:id/reorder     # Reorder products
```

## Example Requests

### Authentication

**Register:**
```bash
curl -X POST http://localhost:3000/api/v1/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "SecurePass123!",
    "first_name": "John",
    "last_name": "Doe"
  }'
```

**Login:**
```bash
curl -X POST http://localhost:3000/api/v1/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "user@example.com",
    "password": "SecurePass123!"
  }'
```

### Products (Admin)

**Create Product with Images:**
```bash
curl -X POST http://localhost:3000/api/v1/products \
  -H "Authorization: Bearer ADMIN_JWT_TOKEN" \
  -F "name=Premium T-Shirt" \
  -F "price=29.99" \
  -F "description=High quality cotton t-shirt" \
  -F "inventory_quantity=100" \
  -F "images=@/path/to/image1.jpg" \
  -F "images=@/path/to/image2.jpg"
```

**Create Product (JSON):**
```bash
curl -X POST http://localhost:3000/api/v1/products \
  -H "Authorization: Bearer ADMIN_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Premium T-Shirt",
    "price": 29.99,
    "description": "High quality cotton t-shirt",
    "inventory_quantity": 100,
    "category_id": "uuid-here",
    "tags": ["clothing", "premium"],
    "images": ["https://s3.amazonaws.com/..."]
  }'
```

**Search Products:**
```bash
curl "http://localhost:3000/api/v1/products?search=t-shirt&min_price=20&is_featured=true"
```

### Variants (Admin)

**Create Variant:**
```bash
curl -X POST http://localhost:3000/api/v1/products/PRODUCT_ID/variants \
  -H "Authorization: Bearer ADMIN_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Large / Red",
    "sku": "TSH-L-RED-001",
    "price": 29.99,
    "inventory_quantity": 25,
    "options": {
      "size": "Large",
      "color": "Red"
    }
  }'
```

**Update Inventory:**
```bash
curl -X PATCH http://localhost:3000/api/v1/variants/VARIANT_ID/inventory \
  -H "Authorization: Bearer ADMIN_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "quantity": 50,
    "operation": "set"
  }'
```

### Collections (Admin)

**Create Collection:**
```bash
curl -X POST http://localhost:3000/api/v1/collections \
  -H "Authorization: Bearer ADMIN_JWT_TOKEN" \
  -F "name=Summer Sale" \
  -F "description=Hot summer deals" \
  -F "image=@/path/to/collection-image.jpg"
```

**Add Product to Collection:**
```bash
curl -X POST http://localhost:3000/api/v1/collections/COLLECTION_ID/products \
  -H "Authorization: Bearer ADMIN_JWT_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "product_id": "PRODUCT_UUID",
    "sort_order": 1
  }'
```

## Default Admin Account

After database initialization:
- **Email**: admin@example.com
- **Password**: admin123

⚠️ **Change these credentials in production!**

## Environment Variables

| Variable | Description | Default |
|----------|-------------|---------|
| `NODE_ENV` | Environment mode | development |
| `PORT` | Server port | 3000 |
| `DB_HOST` | Database host | localhost |
| `DB_PORT` | Database port | 5432 |
| `DB_NAME` | Database name | ecommerce_db |
| `DB_USER` | Database user | postgres |
| `DB_PASSWORD` | Database password | - |
| `DB_SSL` | Enable SSL | false |
| `JWT_SECRET` | JWT signing secret | - |
| `JWT_EXPIRES_IN` | Token expiration | 7d |
| `AWS_REGION` | AWS region | us-east-1 |
| `AWS_ACCESS_KEY_ID` | AWS access key | - |
| `AWS_SECRET_ACCESS_KEY` | AWS secret key | - |
| `S3_BUCKET` | S3 bucket name | - |
| `S3_ENDPOINT` | Custom S3 endpoint (for MinIO) | - |

## Database Schema

See `scripts/init-db.sql` for complete schema including:
- **profiles** (users + auth)
- **categories** (product categories)
- **products** (main product catalog)
- **product_variants** (size/color options)
- **collections** (product groups)
- **collection_products** (many-to-many link)
- **carts** (shopping carts)
- **orders** & **order_items** (order management)
- **coupons** (discount codes)
- **reviews** (product reviews)

## Scripts

```bash
npm start          # Start production server
npm run dev        # Start with nodemon (auto-reload)
npm run db:init    # Initialize database schema
npm test           # Run tests (when added)
npm run lint       # Run ESLint
```

## Docker Commands

```bash
# Build and start
docker-compose up -d

# View logs
docker-compose logs -f api

# Stop
docker-compose down

# Stop and remove volumes (WARNING: deletes data)
docker-compose down -v

# Rebuild after changes
docker-compose up -d --build

# Run DB init in container
docker-compose exec api npm run db:init
```

## Security Checklist

### Implemented
- [x] Passwords hashed with bcrypt (12+ rounds)
- [x] JWT tokens for authentication
- [x] Helmet.js for security headers
- [x] Rate limiting on all routes
- [x] Stricter rate limiting on auth endpoints
- [x] Input validation and sanitization
- [x] CORS configured
- [x] SQL injection protection (parameterized queries)
- [x] Error messages don't leak sensitive info
- [x] Admin role verification middleware
- [x] File upload validation (images only, 5MB limit)

### Production Checklist
- [ ] Enable HTTPS in production
- [ ] Set secure JWT_SECRET (random, 32+ chars)
- [ ] Change default admin credentials
- [ ] Enable DB_SSL for RDS/production
- [ ] Configure AWS credentials securely (IAM roles preferred)
- [ ] Set up S3 bucket policies and CORS
- [ ] Add request size limits
- [ ] Configure logging aggregation (CloudWatch, etc.)
- [ ] Set up monitoring and alerting
- [ ] Implement backup strategy for database and S3

## Next Phases

- **Phase 3**: Cart System
- **Phase 4**: Orders + Checkout
- **Phase 5**: Coupons & Discounts
- **Phase 6**: Reviews & Ratings
- **Phase 7**: Search & Filtering Enhancements
- **Phase 8**: Admin Dashboard APIs

## License

MIT

## Contributing

This is a learning project. Feel free to fork and modify!

## Troubleshooting

### S3 Upload Issues
If S3 uploads fail:
1. Check AWS credentials in `.env`
2. Ensure S3 bucket exists and is accessible
3. Check bucket CORS configuration for web uploads
4. For local dev without AWS, use MinIO or leave S3 vars empty

### Database Connection Issues
1. Verify DB credentials in `.env`
2. Check if PostgreSQL is running: `docker-compose ps`
3. For RDS: ensure security group allows connections
4. Enable SSL: `DB_SSL=true` for production

### JWT Authentication Issues
1. Ensure `JWT_SECRET` is set and consistent
2. Check token format: `Authorization: Bearer <token>`
3. Verify token hasn't expired
