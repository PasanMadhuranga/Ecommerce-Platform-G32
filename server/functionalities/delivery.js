const express = require('express');
const router = express();

const db = require('../db');

router.get('/:customer/:city', async (req,res) => {
    sql = `SELECT CalculateDeliveryDays(?, ?) AS days`;
    const [data] = await db.query(sql,[parseInt(req.params.customer), req.params.city]);
    res.send(data); 
    console.log(data);
});

module.exports = router;