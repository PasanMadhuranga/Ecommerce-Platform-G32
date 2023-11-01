import React, { useState } from "react";
import axios from "axios";
import { TextField, Button, Grid, Typography, Container } from "@mui/material";

const CustomerRegisterPage = () => {
  const [formData, setFormData] = useState({
    Password: "",
    First_name: "",
    Last_name: "",
    Email: "",
    Phone_number: "",
    Address_line1: "",
    Address_line2: "",
    City: "",
    Province: "",
    Zipcode: "",
    Is_registered: 1
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    
    // Send a POST request to the API with the form data
    axios.post("http://localhost:8000/register", formData)
      .then((response) => {
        // Handle successful registration (e.g., show a success message)
        console.log("Registration successful:", response.data);
      })
      .catch((error) => {
        // Handle registration error (e.g., show an error message)
        console.error("Registration failed:", error);
      });
  };

  return (
    <Container maxWidth="xs">
      <Typography marginTop="4%" variant="h4" align="center">Customer Registration</Typography>
      <form onSubmit={handleSubmit}>
        <Grid container spacing={2}>
          <Grid item xs={12}>
            <TextField
              variant="outlined"
              required
              fullWidth
              type="password"
              label="Password"
              name="Password"
              value={formData.Password}
              onChange={handleChange}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              variant="outlined"
              required
              fullWidth
              type="text"
              label="First Name"
              name="First_name"
              value={formData.First_name}
              onChange={handleChange}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              variant="outlined"
              required
              fullWidth
              type="text"
              label="Last Name"
              name="Last_name"
              value={formData.Last_name}
              onChange={handleChange}
            />
          </Grid>
          <Grid item xs={12}>
            <TextField
              variant="outlined"
              required
              fullWidth
              type="email"
              label="Email"
              name="Email"
              value={formData.Email}
              onChange={handleChange}
            />
          </Grid>
          <Grid item xs={12}>
            <TextField
              variant="outlined"
              required
              fullWidth
              type="tel"
              label="Phone Number"
              name="Phone_number"
              value={formData.Phone_number}
              onChange={handleChange}
            />
          </Grid>
          <Grid item xs={12}>
            <TextField
              variant="outlined"
              required
              fullWidth
              type="text"
              label="Address Line 1"
              name="Address_line1"
              value={formData.Address_line1}
              onChange={handleChange}
            />
          </Grid>
          <Grid item xs={12}>
            <TextField
              variant="outlined"
              fullWidth
              type="text"
              label="Address Line 2"
              name="Address_line2"
              value={formData.Address_line2}
              onChange={handleChange}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              variant="outlined"
              required
              fullWidth
              type="text"
              label="City"
              name="City"
              value={formData.City}
              onChange={handleChange}
            />
          </Grid>
          <Grid item xs={6}>
            <TextField
              variant="outlined"
              required
              fullWidth
              type="text"
              label="Province"
              name="Province"
              value={formData.Province}
              onChange={handleChange}
            />
          </Grid>
          <Grid item xs={12}>
            <TextField
              variant="outlined"
              required
              fullWidth
              type="text"
              label="Zipcode"
              name="Zipcode"
              value={formData.Zipcode}
              onChange={handleChange}
            />
          </Grid>
        </Grid>
        <Button
          type="submit"
          fullWidth
          variant="contained"
          color="primary"
          style={{margin:"2% 0%"}}
        >
          Register
        </Button>
      </form>
    </Container>
  );
};

export default CustomerRegisterPage;



// import React, { useState } from "react";
// import axios from "axios"; // Import axios

// const CustomerRegisterPage = () => {
//   const [formData, setFormData] = useState({
//     Password: "",
//     First_name: "",
//     Last_name: "",
//     Email: "",
//     Phone_number: "",
//     Address_line1: "",
//     Address_line2: "",
//     City: "",
//     Province: "",
//     Zipcode: "",
//     Is_registered: 1
//   });

//   const handleChange = (e) => {
//     const { name, value } = e.target;
//     setFormData({
//       ...formData,
//       [name]: value,
//     });
//   };

//   const handleSubmit = (e) => {
//     e.preventDefault();
    
//     // Send a POST request to the API with the form data
//     axios.post("http://localhost:8000/register", formData)
//       .then((response) => {
//         // Handle successful registration (e.g., show a success message)
//         console.log("Registration successful:", response.data);
//       })
//       .catch((error) => {
//         // Handle registration error (e.g., show an error message)
//         console.error("Registration failed:", error);
//       });
//   };

//   return (
//     <div>
//       <h1>Customer Registration</h1>
//       <form onSubmit={handleSubmit}>
//       <div>
//           <label>Password:</label>
//           <input
//             type="password"
//             name="Password"
//             value={formData.Password}
//             onChange={handleChange}
//             required
//           />
//         </div>
//         <div>
//           <label>First Name:</label>
//           <input
//             type="text"
//             name="First_name"
//             value={formData.First_name}
//             onChange={handleChange}
//             required
//           />
//         </div>
//         <div>
//           <label>Last Name:</label>
//           <input
//             type="text"
//             name="Last_name"
//             value={formData.Last_name}
//             onChange={handleChange}
//             required
//           />
//         </div>
//         <div>
//           <label>Email:</label>
//           <input
//             type="email"
//             name="Email"
//             value={formData.Email}
//             onChange={handleChange}
//             required
//           />
//         </div>
//         <div>
//           <label>Phone Number:</label>
//           <input
//             type="tel"
//             name="Phone_number"
//             value={formData.Phone_number}
//             onChange={handleChange}
//             required
//           />
//         </div>
//         <div>
//           <label>Address Line 1:</label>
//           <input
//             type="text"
//             name="Address_line1"
//             value={formData.Address_line1}
//             onChange={handleChange}
//             required
//           />
//         </div>
//         <div>
//           <label>Address Line 2:</label>
//           <input
//             type="text"
//             name="Address_line2"
//             value={formData.Address_line2}
//             onChange={handleChange}
//           />
//         </div>
//         <div>
//           <label>City:</label>
//           <input
//             type="text"
//             name="City"
//             value={formData.City}
//             onChange={handleChange}
//             required
//           />
//         </div>
//         <div>
//           <label>Province:</label>
//           <input
//             type="text"
//             name="Province"
//             value={formData.Province}
//             onChange={handleChange}
//             required
//           />
//         </div>
//         <div>
//           <label>Zipcode:</label>
//           <input
//             type="text"
//             name="Zipcode"
//             value={formData.Zipcode}
//             onChange={handleChange}
//             required
//           />
//         </div>
//         <button type="submit">Register</button>
//       </form>
//     </div>
//   );
// };

// export default CustomerRegisterPage;
