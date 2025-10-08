const express = require('express');
const { Pool } = require('pg');
const { v4: uuidv4 } = require('uuid');
const os = require('os');

const app = express();
const port = process.env.PORT || 3000;

// Database connection - throw error if required environment variables are missing
if (!process.env.DB_HOST || !process.env.DB_NAME || !process.env.DB_USER || !process.env.DB_PASSWORD) {
  console.error('ERROR: Missing required database environment variables:');
  console.error('Required: DB_HOST, DB_NAME, DB_USER, DB_PASSWORD');
  console.error('Optional: DB_PORT (default: 5432)');
  process.exit(1);
}

const pool = new Pool({
  user: process.env.DB_USER,
  host: process.env.DB_HOST,
  database: process.env.DB_NAME,
  password: process.env.DB_PASSWORD,
  port: process.env.DB_PORT || 5432,
});

// Test database connection
pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.error('Database connection error:', err);
  } else {
    console.log('Database connected at:', res.rows[0].now);
  }
});

// /info endpoint - menampilkan informasi hostname dan ip address
app.get('/info', (req, res) => {
  const networkInterfaces = os.networkInterfaces();
  let ipAddress = '127.0.0.1';

  // Get first non-internal IPv4 address
  for (const interfaceName in networkInterfaces) {
    const interfaces = networkInterfaces[interfaceName];
    for (const iface of interfaces) {
      if (iface.family === 'IPv4' && !iface.internal) {
        ipAddress = iface.address;
        break;
      }
    }
  }

  res.json({
    hostname: os.hostname(),
    ip_address: ipAddress,
    platform: os.platform(),
    arch: os.arch(),
    uptime: os.uptime()
  });
});

// /produk/ endpoint - menampilkan data produk dari database
app.get('/produk/', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM produk ORDER BY created_at');
    res.json({
      status: 'success',
      data: result.rows,
      count: result.rows.length
    });
  } catch (err) {
    console.error('Error fetching products:', err);
    res.status(500).json({
      status: 'error',
      message: 'Internal server error'
    });
  }
});

// Health check endpoint
app.get('/health', (req, res) => {
  res.json({ status: 'OK', timestamp: new Date().toISOString() });
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});