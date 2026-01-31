/**
 * middleware/audit.middleware.js - Audit Middleware
 */

const { auditLog } = require('../utils/audit');

const audit = (entityType, action) => {
    return async (req, res, next) => {
        const { id } = req.params;
        const adminId = req.user.id;
        const ipAddress = req.ip;
        const userAgent = req.get('user-agent');

        // We can log the request body as the payload for create and update
        const payload = req.body;
        
        await auditLog({
            adminId,
            entityType,
            entityId: id,
            action,
            payload,
            ipAddress,
            userAgent
        });

        next();
    };
};

module.exports = { audit };