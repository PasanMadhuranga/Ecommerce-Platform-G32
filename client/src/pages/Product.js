import React, { useState, useEffect } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";
<<<<<<< Updated upstream
import { useUser } from "../components/UserContext";
import { Grid, Card, CardContent, CardMedia, Typography, Button, Paper } from "@mui/material";
import NavBar from "../components/Nav";
=======
// import { useUser } from "../components/UserContext";
import {
  Grid,
  Card,
  CardContent,
  CardMedia,
  Typography,
  Button,
  Paper,
} from "@mui/material";
>>>>>>> Stashed changes

const ProductPage = () => {
  const { id } = useParams(); // Get the product ID from the URL parameter
  const [product, setProduct] = useState({});
  const [items, setItems] = useState([]);
  const [showViewCart, setShowViewCart] = useState(false);
<<<<<<< Updated upstream
  //const { state: { customer_id } } = useUser();
  const customer_id = 4;
=======
  // const { state: { customer_id } } = useUser();
  const customer_id = 1;
>>>>>>> Stashed changes

  const [quantity, setQuantity] = useState(1); // Default quantity is 1

  const incrementQuantity = () => {
    setQuantity(quantity + 1);
  };

  const decrementQuantity = () => {
    if (quantity > 1) {
      setQuantity(quantity - 1);
    }
  };

  useEffect(() => {
    // Fetch product details from the API
    axios
      .get(`http://localhost:8000/shop/${id}`)
      .then((response) => {
        console.log(response);
        setProduct(response.data[0][0]);
        setItems(response.data[1]);
      })
      .catch((error) => {
        console.error("Error fetching product details:", error);
      });
  }, [id]);

  const addToCart = (itemID) => {
    // Add the selected product item to the cart
    setShowViewCart(true);
    axios
      .post(`http://localhost:8000/cart/${customer_id}/${itemID}/${quantity}`)
      .then((response) => {
        if (response.status === 200) {
          console.log("View cart is set to " + showViewCart);
        }
      })
      .catch((error) => {
        console.error("Error adding item to cart:", error);
      });
  };

  return (
    <div>
      <NavBar/>
      <Grid container spacing={2}>
        <Grid item xs={12} md={6}>
          <Card>
            <CardMedia
              component="img"
              alt={product.Title}
              height="600px"
              width="auto"
              image={product.Image}
            />
          </Card>
        </Grid>
        <Grid item xs={12} md={6}>
          <Paper
            elevation={1}
            style={{ margin: "150px 150px 50px 50px", padding: "20px" }}
          >
            <Typography variant="h4" gutterBottom marginBottom="30px">
              {product.Title}
            </Typography>
            <Typography variant="body1" gutterBottom marginBottom="25px">
              {product.Description}
            </Typography>
            <Typography variant="body1" gutterBottom marginBottom="25px">
              Weight: {product.Weight}kg
            </Typography>
            <Typography variant="h6" color="textPrimary">
              Price: ${product.Min_price}
            </Typography>
            {showViewCart && (
              <a href={`http://localhost:3000/cart/${customer_id}`}>
                <Button>View Your Cart</Button>
              </a>
            )}
          </Paper>
        </Grid>
      </Grid>
      <div className="product-list">
        {items && items.length > 0 && (
          <div>
            <h2 style={{textAlign:"center", marginTop:"50px"}}>Variations</h2>
            <Grid container spacing={2} width="80%" margin="0% 10% 10%">
              {items.map((item) => (
                <Grid item key={item.Item_id} xs={12} sm={6} md={3}>
                  <Card>
                    <CardMedia
                      component="img"
                      alt={item.Title}
                      height="240"
                      image={item.Image}
                      margin="20px"
                      padding="20px"
                    />
                    <CardContent>
                      <Typography variant="h6" gutterBottom>
                        {item.Title}
                      </Typography>
<<<<<<< Updated upstream
                      <Typography variant="subtitle1" color="textSecondary">
                        ${item.Price}
                      </Typography>
                      <p>Quantity: {quantity}</p>
                      <Button size="large" onClick={incrementQuantity}>+</Button>
                      <Button size="large" onClick={decrementQuantity}>-</Button>
=======
                      <Grid container>
                        <Grid item xs={4}>
                          <Typography variant="body2" color="textSecondary">
                            ${item.Price}
                          </Typography>
                          <p>Quantity: {quantity}</p>
                        </Grid>
                        <Grid item xs={8}>
                          <Typography
                            align="right"
                            variant="body2"
                            color="textSecondary"
                            dangerouslySetInnerHTML={{
                              __html: item.variant
                                .map((i) => {
                                  return `<strong>${i.variant_name}</strong>: ${i.attribute_name}`;
                                })
                                .join("<br />"),
                            }}
                          />
                        </Grid>
                      </Grid>
>>>>>>> Stashed changes
                      <Button
                        variant="outlined"
                        color="primary"
                        onClick={() => addToCart(item.Item_id)}
                      >
                        Add to Cart
                      </Button>
                    </CardContent>
                  </Card>
                </Grid>
              ))}
            </Grid>
          </div>
        )}
      </div>
    </div>
  );
};

export default ProductPage;

// import React, { useState, useEffect } from "react";
// import axios from "axios";
// import { useParams } from "react-router-dom";
// import Alert from "../components/Alert";
// import { useUser } from "../components/UserContext";

// const ProductPage = () => {
//   const { id } = useParams(); // Get the product ID from the URL parameter
//   const [product, setProduct] = useState({});
//   const [items,setItems] = useState([]);
//   const [cart,setCart] = useState([]);
//   const [showAlert, setShowAlert] = useState(false);
//   const customer_id = 1;

//   useEffect(() => {
//     // Fetch product details from the API
//     axios.get(`http://localhost:8000/shop/${id}`)
//       .then((response) => {
//         console.log(response);
//         setProduct(response.data[0][0]);
//         setItems(response.data[1]);
//       })
//       .catch((error) => {
//         console.error("Error fetching product details:", error);
//       });
//   }, [id]);

//   const closeAlert = () => {
//     setShowAlert(false); // Close the alert
//   };

//   // const { state: { customer_id } } = useUser();

//   // if (!customer_id) {
//   //   return <div>Please log in to view this page.</div>;
//   // }

//   const addToCart = (itemID) => {
//     // Add the selected product item to the cart
//     axios.post(`http://localhost:8000/cart/${customer_id}/${itemID}`)
//       .then((response) => {
//         if (response.status === 200) {
//           setCart((prevCart) => [...prevCart, itemID]);
//           setShowAlert(true);
//         }
//       })
//       .catch((error) => {
//         console.error("Error adding item to cart:", error);
//       });
//   };

//   return (
//     <div>
//       {showAlert && (
//         <Alert message="Product added to cart!" onClose={closeAlert} />
//       )}
//       <div>
//         <h1>{product.Title}</h1>
//         <img src={product.Image} width="40%" />
//         <p>{product.Description}</p>
//         <p>{product.Weight}kg</p>
//         <p>Price: ${product.Min_price}</p>
//       </div>
//       <div className="product-list">
//         {items && items.length > 0 && (
//           <div>
//             <h2>Variations</h2>
//           {items.map((item) => (
//             <div key={item.Item_id} className="product">
//               <p>Item ID:{item.Item_id} </p>
//               <img src={item.Image} width="25%" />
//               <p>Price: ${item.Price}</p>
//               <button onClick={() => addToCart(item.Item_id)}>Add to Cart</button>
//             </div>
//           ))}
//         </div>

//       )}

//       </div>
//     </div>
//   );
// };

// export default ProductPage;
