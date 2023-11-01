import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom';
import { Table, TableHead, TableBody, TableRow, TableCell, Typography, Paper, Container, Button, Grid } from '@mui/material';
import CheckoutPage from './Checkout';
import NavBar from '../components/Nav';

const CartPage = () => {
  const { id } = useParams(); // Get the customer ID from the URL parameter
  const [cartItems, setCartItems] = useState([]);
  const [totalValue, setTotalValue] = useState(0);
  const [showCheckout, setShowCheckout] = useState(false);

  useEffect(() => {
    // Fetch cart items data from the API
    axios
      .get(`http://localhost:8000/cart/${id}`)
      .then((response) => {
        // Handle the API response and extract cart items data
        const cartData = response.data;
        console.log(cartData);

        // Calculate the total value
        let total = 0;
        for (const item of cartData) {
          total += item.price * item.quantity;
        }

        // Set the state with cart items and total value
        setCartItems(cartData);
        setTotalValue(total);
      })
      .catch((error) => {
        console.error('Error fetching cart data:', error);
      });
  }, [id]);

  return (
    <div>
      <NavBar/>
      <Typography variant="h4" textAlign="center" gutterBottom style={{marginTop:"2%"}}>
        Your Cart
      </Typography>
      {cartItems.length === 0 ? (
        <Typography variant="body1">Your cart is empty.</Typography>
      ) : (
        <Container>
        <Paper elevation={3} style={{margin:"3% 10%"}}>
          <Table>
            <TableHead>
              <TableRow>
                <TableCell>Product</TableCell>
                <TableCell>Price</TableCell>
                <TableCell>Quantity</TableCell>
                <TableCell>Total</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              {cartItems.map((item, index) => (
                <TableRow key={index}>
                  <TableCell>
                    {item.title}
                    {" - "}
                    {item.variant
                      .map((i) => {
                        return i.attribute_name;
                      })
                      .join(" | ")}
                  </TableCell>
                  <TableCell>${item.price}</TableCell>
                  <TableCell>{item.quantity}</TableCell>
                  <TableCell>${(item.price * item.quantity).toFixed(2)}</TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
          <Typography variant="h5" gutterBottom padding="3%">
            Total Value: ${totalValue.toFixed(2)}
          </Typography>
          <Grid container alignItems="center" justifyContent="center">
            <Button onClick={()=>{setShowCheckout(true)}}>Checkout</Button>
          </Grid>
        </Paper>

        {
          showCheckout && (
            <CheckoutPage id={id}/>
          )
        }

        </Container>
      )}
    </div>
  );
};

export default CartPage;




// import React, { useState, useEffect } from 'react';
// import axios from 'axios';
// import { useParams } from "react-router-dom";

// const CartPage = () => {
//   const { id } = useParams(); // Get the customer ID from the URL parameter
//   const [cartItems, setCartItems] = useState([]);
//   const [totalValue, setTotalValue] = useState(0);

//   useEffect(() => {
//     // Fetch cart items data from the API
//     axios.get(`http://localhost:8000/cart/${id}`)
//       .then((response) => {
//         // Handle the API response and extract cart items data
//         const cartData = response.data;
//         console.log(cartData);

//         // Calculate the total value
//         let total = 0;
//         for (const item of cartData) {
//           total += item.price * item.quantity;
//         }

//         // Set the state with cart items and total value
//         setCartItems(cartData);
//         setTotalValue(total);
//       })
//       .catch((error) => {
//         console.error('Error fetching cart data:', error);
//       });
//   }, [id]);

//   return (
//     <div>
//       <h2>Your Cart</h2>
//       {cartItems.length === 0 ? (
//         <p>Your cart is empty.</p>
//       ) : (
//     <div>
//       <table>
//         <thead>
//           <tr>
//             <th>Product</th>
//             <th>Price</th>
//             <th>Quantity</th>
//             <th>Total</th>
//           </tr>
//         </thead>
//         <tbody>
//           {cartItems.map((item, index) => (
//             <tr key={index}>
//               <td>{item.title}</td>
//               <td>${item.price}</td>
//               <td>{item.quantity}</td>
//               <td>${item.price * item.quantity}</td>
//             </tr>
//           ))}
//         </tbody>
//       </table>
//       <p>Total Value: ${totalValue.toFixed(2)}</p>
//       </div>
//       )}
//     </div>
//   );
// }

// export default CartPage;
