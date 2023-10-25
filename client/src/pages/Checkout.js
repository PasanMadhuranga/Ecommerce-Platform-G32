import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

function CheckoutPage() {
  const [formData, setFormData] = useState({
    firstName: '',
    lastName: '',
    email: '',
    address: '',
    city: '',
    zipCode: '',
    paymentMethod: 'Credit Card',
  });

  const navigate = useNavigate();

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    // Add logic for handling the form submission, such as sending data to a server or processing payment.
    if (formData.paymentMethod === 'Credit Card') {
      navigate('/card-details');
    }
  }

  return (
    <div>
      <h2>Checkout</h2>
      <form onSubmit={handleSubmit}>
        <div>
          <label>First Name:</label>
          <input type="text" name="firstName" value={formData.firstName} onChange={handleInputChange} required />
        </div>
        <div>
          <label>Last Name:</label>
          <input type="text" name="lastName" value={formData.lastName} onChange={handleInputChange} required />
        </div>
        <div>
          <label>Email:</label>
          <input type="email" name="email" value={formData.email} onChange={handleInputChange} required />
        </div>
        <div>
          <label>Address:</label>
          <input type="text" name="address" value={formData.address} onChange={handleInputChange} required />
        </div>
        <div>
          <label>City:</label>
          <input type="text" name="city" value={formData.city} onChange={handleInputChange} required />
        </div>
        <div>
          <label>Zip Code:</label>
          <input type="text" name="zipCode" value={formData.zipCode} onChange={handleInputChange} required />
        </div>
        <div>
          <label>Payment Method:</label>
          <select name="paymentMethod" value={formData.paymentMethod} onChange={handleInputChange}>
            <option value="Credit Card">Credit Card</option>
            <option value="Cash on Delivery">Cash on Delivery</option>
          </select>
        </div>
        <button type="submit">Submit</button>
      </form>
    </div>
  );
}

export default CheckoutPage;
