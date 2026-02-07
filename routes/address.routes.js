/**
 * routes/address.routes.js - Address Routes
 *
 * Placeholder routes to keep API startup stable until full address
 * controller/service implementation is added.
 */

const express = require('express');
const router = express.Router();
const { authenticateToken } = require('../middleware/auth.middleware');

router.use(authenticateToken);

const notImplemented = (req, res) => {
  res.status(501).json({
    success: false,
    message: 'Address management is not implemented yet.'
  });
};

router.get('/', notImplemented);
router.post('/', notImplemented);
router.put('/:id', notImplemented);
router.delete('/:id', notImplemented);

module.exports = router;
