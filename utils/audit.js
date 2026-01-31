/**
 * utils/audit.js - Audit Log Helper
 */

const { query } = require('./db');

const auditLog = async (logData) => {
    const { adminId, entityType, entityId, action, payload, ipAddress, userAgent } = logData;
    try {
        await query(
            `INSERT INTO audit_logs (admin_id, entity_type, entity_id, action, payload, ip_address, user_agent)
             VALUES ($1, $2, $3, $4, $5, $6, $7)`,
            [adminId, entityType, entityId, action, payload, ipAddress, userAgent]
        );
    } catch (error) {
        console.error('Failed to write to audit log:', error);
    }
};

module.exports = { auditLog };