require('dotenv').config();
const { query, closePool } = require('./utils/db');

async function checkProducts() {
  try {
    const result = await query('SELECT count(*) FROM products');
    console.log('Product count:', result.rows[0].count);
    
    // Check columns
    const columns = await query("SELECT column_name FROM information_schema.columns WHERE table_name = 'products'");
    console.log('Columns:', columns.rows.map(r => r.column_name).join(', '));
  } catch (error) {
    console.error('Error checking products:', error.message);
  } finally {
    await closePool();
  }
}

checkProducts();
