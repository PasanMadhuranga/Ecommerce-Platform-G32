const pool = require("mysql2/promise");

const mysqlPool = pool.createPool({
  host: "localhost",
  user: "root",
  password: process.env.DB_PASSWORD,
  database: "Group32_v1.0",
  port: process.env.DB_PORT,
});

module.exports = mysqlPool;
