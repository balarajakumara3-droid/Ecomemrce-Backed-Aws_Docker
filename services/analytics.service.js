/**
 * services/analytics.service.js - Analytics Business Logic
 */

const { query, enhanceConnectionError } = require('../utils/db');

const getDashboardStats = async () => {
    const salesTodayResult = await query("SELECT SUM(total) as total_sales FROM orders WHERE created_at >= NOW() - interval '24 hours'");
    const salesWeekResult = await query("SELECT SUM(total) as total_sales FROM orders WHERE created_at >= NOW() - interval '7 days'");
    const salesMonthResult = await query("SELECT SUM(total) as total_sales FROM orders WHERE created_at >= NOW() - interval '1 month'");
    const salesAllTimeResult = await query("SELECT SUM(total) as total_sales FROM orders");

    const ordersByStatusResult = await query("SELECT status, COUNT(*) as count FROM orders GROUP BY status");
    const userCountResult = await query("SELECT COUNT(*) as count FROM profiles WHERE deleted_at IS NULL");
    const newUsersMonthResult = await query("SELECT COUNT(*) as count FROM profiles WHERE created_at >= NOW() - interval '1 month'");
    const productCountResult = await query("SELECT COUNT(*) as count FROM products WHERE deleted_at IS NULL");
    const lowStockResult = await query("SELECT COUNT(*) as count FROM products WHERE inventory_quantity < 10 AND inventory_quantity > 0 AND deleted_at IS NULL");

    return {
        sales: {
            today: salesTodayResult.rows[0].total_sales || 0,
            week: salesWeekResult.rows[0].total_sales || 0,
            month: salesMonthResult.rows[0].total_sales || 0,
            all_time: salesAllTimeResult.rows[0].total_sales || 0,
        },
        orders: ordersByStatusResult.rows.reduce((acc, row) => {
            acc[row.status] = parseInt(row.count);
            return acc;
        }, {}),
        users: {
            total: parseInt(userCountResult.rows[0].count),
            new_this_month: parseInt(newUsersMonthResult.rows[0].count)
        },
        products: {
            total: parseInt(productCountResult.rows[0].count),
            low_stock: parseInt(lowStockResult.rows[0].count)
        }
    };
};

const getSalesReport = async (startDate, endDate) => {
    const result = await query(
        `SELECT DATE(created_at) as date, SUM(total) as sales 
         FROM orders 
         WHERE created_at BETWEEN $1 AND $2 
         GROUP BY DATE(created_at) 
         ORDER BY date`,
        [startDate, endDate]
    );
    return result.rows;
};

const getTopProducts = async (limit = 10) => {
    const result = await query(
        `SELECT p.id, p.name, p.sales_count, p.average_rating 
         FROM products p
         WHERE p.deleted_at IS NULL
         ORDER BY p.sales_count DESC 
         LIMIT $1`,
        [limit]
    );
    return result.rows;
};

const getRecentOrders = async (limit = 10) => {
    const result = await query('SELECT * FROM orders ORDER BY created_at DESC LIMIT $1', [limit]);
    return result.rows;
};


const getInventoryAlerts = async () => {
    const result = await query("SELECT id, name, inventory_quantity FROM products WHERE inventory_quantity < 10 AND deleted_at IS NULL ORDER BY inventory_quantity ASC");
    return result.rows;
};


module.exports = {
    getDashboardStats,
    getSalesReport,
    getTopProducts,
    getRecentOrders,
    getInventoryAlerts
};