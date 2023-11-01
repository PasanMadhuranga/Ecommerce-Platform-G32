const express = require("express");
const router = express();
const bcrypt = require("bcrypt");

const db = require("../db");

router.post("/", async (req, res) => {
  const sql1 = `SELECT Customer_id FROM Customer
        WHERE Email = ? AND Is_registered = 1`;
  const sql2 = `INSERT INTO Customer (Hashed_password, First_name, Last_name, Email, Phone_number, Address_line1, Address_line2, City, Province, Zipcode, Is_registered)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE
        Hashed_password = VALUES(Hashed_password),
        First_name = VALUES(First_name),
        Last_name = VALUES(Last_name),
        Phone_number = VALUES(Phone_number),
        Address_line1 = VALUES(Address_line1),
        Address_line2 = VALUES(Address_line2),
        City = VALUES(City),
        Province = VALUES(Province),
        Zipcode = VALUES(Zipcode),
        Is_registered = VALUES(Is_registered)`;

  try {
    // Password encryption
    const saltRounds = 10; // You can adjust the number of salt rounds
    const plaintextPassword = req.body.Password;

    // Generate the hashed password using async/await
    const hashedPassword = await bcrypt.hash(plaintextPassword, saltRounds);

    const values = [
      hashedPassword,
      req.body.First_name,
      req.body.Last_name,
      req.body.Email,
      req.body.Phone_number,
      req.body.Address_line1,
      req.body.Address_line2,
      req.body.City,
      req.body.Province,
      req.body.Zipcode,
      req.body.Is_registered,
    ];

    const [details1] = await db.query(sql1, req.body.Email);
    if (details1.affectedRows === 0) {
      res.send("You're already registered. Please log in.");
    } else {
      await db.query(sql2, values);
      res.send("Registration succeeded.");
    }
  } catch (error) {
    console.error(error);
    res.status(500).send("An error occurred.");
  }
});

module.exports = router;
