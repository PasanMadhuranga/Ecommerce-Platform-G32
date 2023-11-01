import React, { useState, useEffect } from 'react';
import axios from 'axios';
import TextField from '@mui/material/TextField';
import Button from '@mui/material/Button';
import Container from '@mui/material/Container';
import Box from '@mui/material/Box';
import { Typography, Grid } from '@mui/material';
import DeliveryPage from './Delivery';

const CardDetailsPage = ({id, city}) => {

  const [cardDeta, setCardData] = useState({
    Card_Number: '',
    Name_on_Card: '',
    Expiry_Date: '',
    CVV: '',
  });

  let initialDataFromJSON = [];
  useEffect(() => {
    axios
      .get(`http://localhost:8000/card-details/${id}`)
      .then((response) => {
        console.log(response);
        initialDataFromJSON = response.data[0];
        console.log(initialDataFromJSON);
        //initialDataFromJSON.PaymentMethod = 'Credit Card';
        //setFormData(initialDataFromJSON);
        setCardData((prevData) => {
          return { ...prevData, ...initialDataFromJSON };
        });
      });
  }, [id]);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setCardData({...cardDeta, [name]: value });
  }

  const [showDeliveryDays, setShowDeliveryDays] = useState(false);

  const handleSubmit = (e) => {
    e.preventDefault();
    // In a real application, you would handle payment processing or submit the card details securely.
    setShowDeliveryDays(true);
  }

    return (
      <Container>
        <Typography variant="h5" textAlign="center" marginTop="5%">Enter Card Details</Typography>
        <form onSubmit={handleSubmit} style={{margin:"3% 30%"}}>
          <Box>
            <TextField
              label="Card Number"
              type="text"
              name="Card_Number"
              value={cardDeta.Card_Number}
              onChange={handleInputChange}
              required
              fullWidth
            />
          </Box>
          <Box>
            <TextField
              label="Card Holder's Name"
              type="text"
              name="Name_on_Card"
              value={cardDeta.Name_on_Card}
              onChange={handleInputChange}
              required
              fullWidth
            />
          </Box>
          <Box>
            <TextField
              label="Expiration Date"
              type="text"
              name="Expiry_Date"
              value={cardDeta.Expiry_Date}
              onChange={handleInputChange}
              required
              fullWidth
            />
          </Box>
          <Box>
            <TextField
              label="CVV"
              type="text"
              name="CVV"
              value={cardDeta.CVV}
              onChange={handleInputChange}
              required
              fullWidth
            />
          </Box>
          <Box>
            <Grid container alignItems="center" justifyContent="center" margin="2%">
            <Button type="submit" variant="contained" color="primary">
              Submit
            </Button>
            </Grid>
          </Box>
        </form>
        {showDeliveryDays && <DeliveryPage customerId={id} city={city}/>}
      </Container>
    );
  }

export default CardDetailsPage;



// import React, { Component } from 'react';

// class CardDetailsPage extends Component {
//   constructor(props) {
//     super(props);

//     cardDeta = {
//       Card_Number: '',
//       cardHolderName: '',
//       expirationDate: '',
//       cvv: '',
//     };
//   }

//   handleInputChange = (e) => {
//     const { name, value } = e.target;
//     this.setCardData({ [name]: value });
//   }

//   handleSubmit = (e) => {
//     e.preventDefault();
//     // In a real application, you would handle payment processing or submit the card details securely.
//   }

//   render() {
//     return (
//       <div>
//         <h2>Enter Card Details</h2>
//         <form onSubmit={this.handleSubmit}>
//           <div>
//             <label>Card Number:</label>
//             <input type="text" name="Card_Number" value={this.cardDeta.Card_Number} onChange={this.handleInputChange} required />
//           </div>
//           <div>
//             <label>Card Holder's Name:</label>
//             <input type="text" name="cardHolderName" value={this.cardDeta.cardHolderName} onChange={this.handleInputChange} required />
//           </div>
//           <div>
//             <label>Expiration Date:</label>
//             <input type="text" name="expirationDate" value={this.cardDeta.expirationDate} onChange={this.handleInputChange} required />
//           </div>
//           <div>
//             <label>CVV:</label>
//             <input type="text" name="cvv" value={this.cardDeta.cvv} onChange={this.handleInputChange} required />
//           </div>
//           <button type="submit">Submit</button>
//         </form>
//       </div>
//     );
//   }
// }

// export default CardDetailsPage;
