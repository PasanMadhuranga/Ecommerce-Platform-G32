const express = require("express");

const app = express();

const dotenv = require("dotenv");
dotenv.config({ path: "./.env" });

require("express-async-errors");
require("body-parser");

const db = require("./db");
const cors = require("cors");

// Controllers
const productRoutes = require("./controllers/products");
const customerRoutes = require("./controllers/customers");
const tempOrderRoutes = require("./controllers/temp-orders");
const mainCategoryRoutes = require("./controllers/categories");

// Functionalities
const registerRoutes = require("./functionalities/register");
const cartItemRoutes = require("./functionalities/cart");
const loginRoutes = require("./functionalities/login");

// Admin
const salesRoutes = require("./admin/sales");
const orderRoutes = require("./admin/orders");

const bodyParser = require("body-parser");

app.use(bodyParser.json());
app.use(cors());

// Controllers
app.use("/shop", productRoutes);
app.use("/customers", customerRoutes);
app.use("/temp-orders", tempOrderRoutes);
app.use("/main-categories", mainCategoryRoutes);

// Functionalities
app.use("/register", registerRoutes);
app.use("/cart", cartItemRoutes);
app.use("/login", loginRoutes);

// Admin
app.use("/sales", salesRoutes);
app.use("/orders", orderRoutes);

app.use((err, req, res, next) => {
  console.log(err);
  res.status(err.status || 500).send("Something went wrong.");
});

db.query("SELECT * FROM admin")
  .then((data) => {
    console.log("DB connection succeeded.");
    console.log(data);
    app.listen(8000, () => {
      console.log("Server running on 8000.");
    });
  })
  .catch((err) => console.log("DB connection failed. " + err));
