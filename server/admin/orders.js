const express = require('express');
const router = express();

const db = require('../db');

router.get('/:year/:quarter/:customer', async (req,res) => {
    sql = `CALL get_order_report(?)`;
    const [data] = await db.query(sql,
        [req.params.customer]);
    res.send(data); 
    console.log(data);
});


module.exports = router;