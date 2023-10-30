const express = require('express');
const router = express.Router(); // Use Router, not a new Express instance

const db = require('../db');

router.get('/', (req,res)=>{
    req.session.destroy();
    res.redirect('/client/src/pages/Home');
})

module.exports = router;