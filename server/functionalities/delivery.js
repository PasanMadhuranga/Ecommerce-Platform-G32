const express = require('express');
const router = express();

const db = require('../db');

router.get('/:item/:quantity', async (req,res) => {
    sql = `CALL CalculateItemDeliveryDays(?, ?)`;
    const [data] = await db.query(sql,[req.params.item, req.params.quantity]);
    res.send(data); 
    console.log(data);
});

router.get('/:customer/:city', async (req,res) => {
    sql = `CALL CalculateDeliveryDays(?, ?)`;
    const [data] = await db.query(sql,[req.params.customer, req.params.city]);
    res.send(data); 
    console.log(data);
});

module.exports = router;