const express = require('express');
const router = express();

const db = require('../db');

router.get('/:id', async (req,res) => {
    const [details] = await db.query(`
    SELECT Name_on_Card, Card_Number, Expiry_Date FROM Card_Detail WHERE Customer_id = ?`,req.params.id);
    res.send(details);
});

module.exports = router;