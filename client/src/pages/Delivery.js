import React, { useState, useEffect } from 'react';
import { Typography, Paper, List, ListItem, ListItemText } from '@material-ui/core';

const DeliveryPage = ({ cartItems, city, customerId }) => {
  // State to store the total delivery days
  const [totalDeliveryDays, setTotalDeliveryDays] = useState(0);

  // Function to fetch data from the server (you should implement this API endpoint)
  const fetchData = async () => {
    try {
      // Fetch data from the server using an API endpoint
      const response = await fetch(`/api/deliveryDays?customerId=${customerId}&city=${city}`);
      const data = await response.json();

      // Calculate the total delivery days and set it in state
      setTotalDeliveryDays(data.totalDeliveryDays);
    } catch (error) {
      console.error('Error fetching data:', error);
    }
  };

  useEffect(() => {
    fetchData(); // Fetch data when the component mounts
  }, [customerId, city]);

  return (
    <Paper>
      <Typography variant="h5" gutterBottom>
        Estimated Delivery Days
      </Typography>
      <List>
        {cartItems.map((cartItem) => (
          <ListItem key={cartItem.item_id}>
            <ListItemText
              primary={cartItem.item_name}
              secondary={`Quantity: ${cartItem.quantity}`}
            />
          </ListItem>
        ))}
      </List>
      <Typography variant="subtitle1" gutterBottom>
        Total Delivery Days: {totalDeliveryDays}
      </Typography>
    </Paper>
  );
};

export default DeliveryPage;
