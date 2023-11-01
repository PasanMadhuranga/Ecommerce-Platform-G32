import React, { Component } from 'react';
import TextField from '@mui/material/TextField';
import Button from '@mui/material/Button';
import Container from '@mui/material/Container';
import Box from '@mui/material/Box';
import { Typography, Grid } from '@mui/material';

class CardDetailsPage extends Component {
  constructor(props) {
    super(props);

    this.state = {
      cardNumber: '',
      cardHolderName: '',
      expirationDate: '',
      cvv: '',
    };
  }

  handleInputChange = (e) => {
    const { name, value } = e.target;
    this.setState({ [name]: value });
  }

  handleSubmit = (e) => {
    e.preventDefault();
    // In a real application, you would handle payment processing or submit the card details securely.
  }

  render() {
    return (
      <Container>
        <Typography variant="h5" textAlign="center" marginTop="5%">Enter Card Details</Typography>
        <form onSubmit={this.handleSubmit} style={{margin:"3% 30%"}}>
          <Box>
            <TextField
              label="Card Number"
              type="text"
              name="cardNumber"
              value={this.state.cardNumber}
              onChange={this.handleInputChange}
              required
              fullWidth
            />
          </Box>
          <Box>
            <TextField
              label="Card Holder's Name"
              type="text"
              name="cardHolderName"
              value={this.state.cardHolderName}
              onChange={this.handleInputChange}
              required
              fullWidth
            />
          </Box>
          <Box>
            <TextField
              label="Expiration Date"
              type="text"
              name="expirationDate"
              value={this.state.expirationDate}
              onChange={this.handleInputChange}
              required
              fullWidth
            />
          </Box>
          <Box>
            <TextField
              label="CVV"
              type="text"
              name="cvv"
              value={this.state.cvv}
              onChange={this.handleInputChange}
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
      </Container>
    );
  }
}

export default CardDetailsPage;



// import React, { Component } from 'react';

// class CardDetailsPage extends Component {
//   constructor(props) {
//     super(props);

//     this.state = {
//       cardNumber: '',
//       cardHolderName: '',
//       expirationDate: '',
//       cvv: '',
//     };
//   }

//   handleInputChange = (e) => {
//     const { name, value } = e.target;
//     this.setState({ [name]: value });
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
//             <input type="text" name="cardNumber" value={this.state.cardNumber} onChange={this.handleInputChange} required />
//           </div>
//           <div>
//             <label>Card Holder's Name:</label>
//             <input type="text" name="cardHolderName" value={this.state.cardHolderName} onChange={this.handleInputChange} required />
//           </div>
//           <div>
//             <label>Expiration Date:</label>
//             <input type="text" name="expirationDate" value={this.state.expirationDate} onChange={this.handleInputChange} required />
//           </div>
//           <div>
//             <label>CVV:</label>
//             <input type="text" name="cvv" value={this.state.cvv} onChange={this.handleInputChange} required />
//           </div>
//           <button type="submit">Submit</button>
//         </form>
//       </div>
//     );
//   }
// }

// export default CardDetailsPage;
