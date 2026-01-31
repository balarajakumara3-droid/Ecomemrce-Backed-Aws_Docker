/**
 * routes/ooru-specials.routes.js - Ooru Specials Routes
 */

const express = require('express');
const router = express.Router();
const ooruSpecialsController = require('../controllers/ooru-specials.controller');
const { authenticateToken, requireAdmin } = require('../middleware/auth.middleware');

// Public routes
router.get('/', ooruSpecialsController.getAllSpecials);
router.get('/:slug', ooruSpecialsController.getSpecialBySlug);

// Admin routes
router.use(authenticateToken, requireAdmin);
router.post('/', ooruSpecialsController.createSpecial);
router.put('/:id', ooruSpecialsController.updateSpecial);
router.delete('/:id', ooruSpecialsController.deleteSpecial);

module.exports = router;