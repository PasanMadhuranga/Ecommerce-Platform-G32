const pool = require('mysql2/promise');

const mysqlPool = pool.createPool(
    {
        host: 'localhost',
        user: 'root',
        password: 'MySQL@Harith',
        database: 'Group32_v1.0',
        port: 3307
    }
);

module.exports = mysqlPool;