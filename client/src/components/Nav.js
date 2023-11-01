import React, { useState, useEffect } from "react";
import {
  AppBar,
  Button,
  Toolbar,
  Typography,
  Box,
  Popover,
  MenuItem,
  ListItemText,
  Collapse,
} from "@mui/material";
import { ExpandLess, ExpandMore } from "@mui/icons-material";
import axios from "axios";
import { Link } from "react-router-dom";
<<<<<<< Updated upstream
=======
import Cookies from "js-cookie";

let id = Cookies.get("ID");
let role = Cookies.get("role");

// logout function
const logout = async () => {
  try {
    const response = await axios.post("http://localhost:8000/logout", {
      Headers: { authorization: `Bearer ${Cookies.get("accessToken")}` },
      refreshToken: Cookies.get("refreshToken"),
    });

    if (response.status >= 200 && response.status < 300) {
      Cookies.remove("accessToken");
      Cookies.remove("refreshToken");
      Cookies.remove("ID");
      Cookies.remove("role");
      window.location.href = "/";
    } else {
      console.log("Failed to log out.");
    }
  } catch (error) {
    console.log("Failed to log out.");
  }
};
>>>>>>> Stashed changes

const NavBar = () => {
  const [anchorEl, setAnchorEl] = useState(null);
  const [categories, setCategories] = useState([]);
  const [open, setOpen] = useState({});
<<<<<<< Updated upstream

  useEffect(() => {
=======
  const [customer, setCustomer] = useState("");

  useEffect(() => {
    // fetch categories
>>>>>>> Stashed changes
    axios
      .get("http://localhost:8000/main-categories/all")
      .then((response) => {
        const data = response.data;
        const tree = data.filter((category) => !category.Parent_Category_id);
        tree.forEach((root) => {
          root.children = data.filter(
            (child) => child.Parent_Category_id === root.Category_id
          );
        });
        setCategories(tree);
      })
      .catch((error) => {
        console.error("Error fetching categories:", error);
      });
<<<<<<< Updated upstream
  }, []);

=======
    // fetch customer details
    id &&
      axios
        .get(`http://localhost:8000/customers/${id}`)
        .then((response) => {
          setCustomer(response.data[0]);
          console.log(response.data[0]);
        })
        .catch((error) => {
          console.error("Error fetching customer details:", error);
        });
  }, []);

  // create a function to check if the user is logged in
  // if logged in, show the user's name and a logout button
  // if not logged in, show a login button
  const HandleLogin = () => {
    if (id && role === "customer") {
      return (
        <div style={{ display: "flex", alignItems: "center", gap: "10px" }}>
          <Typography
            variant="h6"
            component="div"
            sx={{
              flexGrow: 1,
              color: "#333",
              fontWeight: "bold",
              fontSize: "1.2em",
              paddingRight: "10px",
            }}
          >
            Welcome, {customer.First_name}!
          </Typography>
          <Button
            variant="outlined"
            color="inherit"
            onClick={logout}
            sx={{ borderColor: "#ff4081", color: "#ff4081" }}
          >
            Log Out
          </Button>
        </div>
      );
    } else {
      return (
        <div>
          <Button
            variant="outlined"
            color="inherit"
            href="/login"
            sx={{ borderColor: "#ff4081", color: "#ff4081" }}
          >
            Log In
          </Button>
          <Button
            variant="contained"
            color="secondary"
            href="/register"
            sx={{ ml: 2 }}
          >
            Sign Up
          </Button>
        </div>
      );
    }
  };

>>>>>>> Stashed changes
  const handleClick = (event) => {
    setAnchorEl(event.currentTarget);
  };

  const handleClose = () => {
    setAnchorEl(null);
  };

  const dropDownHandleOpen = (id) => {
    setOpen((prevOpen) => ({ ...prevOpen, [id]: true }));
  };

  const dropDownHandleClose = (id) => {
    setOpen((prevOpen) => ({ ...prevOpen, [id]: false }));
  };

  const renderCategories = (categories) => {
    return categories.map((category) => (
      <div key={category.Category_id}>
        <MenuItem>
          <Link
            to={`/main-categories/${category.Category_id}`}
            style={{ textDecoration: "none", color: "inherit" }}
          >
            <ListItemText primary={category.Name} />
          </Link>
          {category.children && category.children.length > 0 ? (
            <div
              onMouseEnter={() => dropDownHandleOpen(category.Category_id)}
              onMouseLeave={() => dropDownHandleClose(category.Category_id)}
            >
              {open[category.Category_id] ? <ExpandLess /> : <ExpandMore />}
            </div>
          ) : null}
        </MenuItem>
        {category.children && category.children.length > 0 && (
          <Collapse
            in={open[category.Category_id]}
            timeout="auto"
            unmountOnExit
          >
            {category.children.map((child, index) => (
              <div key={index}>{renderCategories([child])}</div>
            ))}
          </Collapse>
        )}
      </div>
    ));
  };

  return (
    <AppBar position="static" color="transparent" elevation={0}>
      <Toolbar
        sx={{
          borderBottom: 1,
          borderColor: "divider",
          backgroundColor: "#ffffff",
        }}
      >
        <Typography
          variant="h6"
          component="div"
          sx={{ flexGrow: 1, color: "#333" }}
        >
          C Ecommerce
        </Typography>
        <Button color="inherit" href="/" sx={{ color: "#333" }}>
          Home
        </Button>
        <Button color="inherit" href="/shop" sx={{ color: "#333" }}>
          Shop
        </Button>
        <Button color="inherit" onClick={handleClick} sx={{ color: "#333" }}>
          Categories
        </Button>
        <Popover
          anchorEl={anchorEl}
          open={Boolean(anchorEl)}
          onClose={handleClose}
          anchorOrigin={{
            vertical: "bottom",
            horizontal: "left",
          }}
          transformOrigin={{
            vertical: "top",
            horizontal: "left",
          }}
          sx={{
            "& .MuiPaper-root": {
              backgroundColor: "#ffffff",
              color: "#333",
              borderRadius: "10px",
              boxShadow: "0px 3px 5px 2px rgba(0, 0, 0, 0.3)",
            },
            "& .MuiMenuItem-root": {
              "&:hover": {
                backgroundColor: "#e0e0e0",
              },
            },
            "& .MuiListItemIcon-root, & .MuiSvgIcon-root": {
              color: "#ff4081",
            },
          }}
        >
          {renderCategories(categories)}
        </Popover>
        <Box sx={{ flexGrow: 1 }} />
<<<<<<< Updated upstream
        <Button
          variant="outlined"
          color="inherit"
          href="/login"
          sx={{ borderColor: "#ff4081", color: "#ff4081" }}
        >
          Log In
        </Button>
        <Button
          variant="contained"
          color="secondary"
          href="/register"
          sx={{ ml: 2 }}
        >
          Sign Up
        </Button>
=======
        <HandleLogin />
>>>>>>> Stashed changes
      </Toolbar>
    </AppBar>
  );
};

export default NavBar;
