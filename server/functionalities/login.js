const express = require("express");
const router = express.Router(); // Use Router, not a new Express instance
const jwt = require("jsonwebtoken");

const db = require("../db");
const bcrypt = require("bcrypt");
const { createAccessToken, createRefreshToken } = require("./token");

const { setRefreshTokens } = require("./token");

router.post("/", async (req, res) => {
  const { email, password } = req.body; // Assuming the client sends JSON data

  try {
    // First, retrieve the hashed password and customer ID from the database
    const [data] = await db.query(
      "SELECT Customer_id, Hashed_password FROM customer WHERE email = ? AND is_registered = 1",
      [email]
    );

    if (data.length === 1) {
      const hashedPassword = data[0].Hashed_password;

      // Compare the provided password with the stored hashed password
      const passwordMatch = await bcrypt.compare(password, hashedPassword);

      if (passwordMatch) {
        // clear refresh tokens array
        refreshTokens = [];
        // Passwords match, user is authenticated
        // Create a JWT token and send it to the client
        const user = {
          email: email,
          role: "customer",
        };
        const accessToken = createAccessToken(user);
        const refreshToken = createRefreshToken(user);
        // Add the refresh token to the list of refresh tokens
        setRefreshTokens(refreshToken);

        res.json({
          message: "You're successfully logged in.",
          ID: data[0].Customer_id,
          accessToken,
          refreshToken,
        });
      } else {
        res
          .status(401)
          .json({ message: "Incorrect password. Please try again." });
      }
    } else {
      res.status(404).json({ message: "User not found or not registered." });
    }
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: "Internal server error." });
  }
});

module.exports = router;
