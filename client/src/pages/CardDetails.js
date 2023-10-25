import React, { Component } from 'react';

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
      <div>
        <h2>Enter Card Details</h2>
        <form onSubmit={this.handleSubmit}>
          <div>
            <label>Card Number:</label>
            <input type="text" name="cardNumber" value={this.state.cardNumber} onChange={this.handleInputChange} required />
          </div>
          <div>
            <label>Card Holder's Name:</label>
            <input type="text" name="cardHolderName" value={this.state.cardHolderName} onChange={this.handleInputChange} required />
          </div>
          <div>
            <label>Expiration Date:</label>
            <input type="text" name="expirationDate" value={this.state.expirationDate} onChange={this.handleInputChange} required />
          </div>
          <div>
            <label>CVV:</label>
            <input type="text" name="cvv" value={this.state.cvv} onChange={this.handleInputChange} required />
          </div>
          <button type="submit">Submit</button>
        </form>
      </div>
    );
  }
}

export default CardDetailsPage;
