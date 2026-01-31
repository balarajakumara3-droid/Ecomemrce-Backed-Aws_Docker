/**
 * Project Structure Explanation
 * =============================
 * 
 * ecommerce-api/
 * ├── config/           # Configuration files
 * │   └── database.js   # DB connection config
 * ├── controllers/      # Handle HTTP requests/responses
 * │   └── auth.controller.js
 * ├── middleware/       # Express middleware
 * │   ├── auth.middleware.js      # JWT verification
 * │   ├── error.middleware.js     # Global error handler
 * │   └── validation.middleware.js # Input validation
 * ├── routes/           # API route definitions
 * │   └── auth.routes.js
 * ├── services/         # Business logic layer
 * │   └── auth.service.js
 * ├── utils/            # Utility functions
 * │   ├── db.js         # Database pool
 * │   ├── logger.js     # Winston logger
 * │   └── s3.js         # AWS S3 helper
 * ├── scripts/          # Database scripts
 * │   └── init-db.sql   # Schema initialization
 * ├── logs/             # Log files (created at runtime)
 * ├── tests/            # Test files
 * ├── .env.example      # Environment variables template
 * ├── .env              # Your actual env vars (gitignored)
 * ├── .gitignore        # Git ignore rules
 * ├── Dockerfile        # Container definition
 * ├── docker-compose.yml # Local development stack
 * ├── package.json      # Dependencies & scripts
 * └── server.js         # Application entry point
 * 
 * Flow of a Request:
 * 1. Request hits server.js
 * 2. Security middleware (helmet, cors, rate limit)
 * 3. Body parsing middleware
 * 4. Route matching (routes/auth.routes.js)
 * 5. Validation middleware (if needed)
 * 6. Authentication middleware (if protected)
 * 7. Controller function (auth.controller.js)
 * 8. Service layer for business logic (auth.service.js)
 * 9. Database queries via utils/db.js
 * 10. Response sent back to client
 * 11. Error handler catches any errors
 */
