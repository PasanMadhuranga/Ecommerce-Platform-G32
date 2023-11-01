import React, { useState } from "react";
import axios from "axios";
<<<<<<< Updated upstream
import { TextField, Button, Grid, Typography, Container } from "@mui/material";
=======
import {
  Button,
  TextField,
  Typography,
  Container,
  Grid,
  Select,
  MenuItem,
  FormControl,
  Link,
  InputLabel,
  CircularProgress,
  LinearProgress,
} from "@mui/material";
import { styled } from "@mui/system";
import Alert from "@mui/material/Alert";

const StyledContainer = styled(Container)(({ theme }) => ({
  display: "flex",
  flexDirection: "column",
  alignItems: "center",
  justifyContent: "center",
  height: "100vh",
  backgroundColor: "#f5f5f5",
  padding: theme.spacing(2),
}));
>>>>>>> Stashed changes

const CustomerRegisterPage = () => {
  const [formData, setFormData] = useState({
    Password: "",
    Confirm_password: "",
    First_name: "",
    Last_name: "",
    Email: "",
    Phone_number: "",
    Address_line1: "",
    Address_line2: "",
    City: "",
    Province: "",
    Zipcode: "",
    Is_registered: 1,
  });

  const [formErrors, setFormErrors] = useState({});
  const [loading, setLoading] = useState(false);
  const [showSuccessMessage, setShowSuccessMessage] = useState(false);

  const getPasswordStrength = (password) => {
    let strength = 0;
    if (password.match(/[a-z]/)) strength++; // Lowercase letters
    if (password.match(/[A-Z]/)) strength++; // Uppercase letters
    if (password.match(/\d/)) strength++; // Numbers
    if (password.match(/[^a-zA-Z\d]/)) strength++; // Special characters
    return strength;
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({
      ...formData,
      [name]: value,
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();

    const newErrors = {};
    if (formData.Password !== formData.Confirm_password) {
      newErrors.Confirm_password = "Passwords do not match";
    }
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(formData.Email)) {
      newErrors.Email = "Invalid email format";
    }
    const phoneRegex = /^0\d{9}$/;
    if (!phoneRegex.test(formData.Phone_number)) {
      newErrors.Phone_number = "Invalid phone number";
    }

    if (Object.keys(newErrors).length > 0) {
      setFormErrors(newErrors);
      return;
    }

    // Send a POST request to the API with the form data
    setLoading(true);

    axios
      .post("http://localhost:8000/register", formData)
      .then((response) => {
        setLoading(false);
        setShowSuccessMessage(true);
        setTimeout(() => {
          setShowSuccessMessage(false);
          window.location.href = "/login";
        }, 3000);
      })
      .catch((error) => {
        setLoading(false);
        console.error("Registration failed:", error);
        // ...handle registration error...
      });
  };

  return (
<<<<<<< Updated upstream
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
=======
    <StyledContainer component="main" maxWidth="sm">
      <Typography component="h1" variant="h5">
        Customer Registration
      </Typography>
      <form noValidate sx={{ width: "100%", mt: 1 }} onSubmit={handleSubmit}>
        <Grid container spacing={1}>
          <Grid item xs={12} sm={6}>
            <TextField
              variant="outlined"
              margin="normal"
              required
              fullWidth
              id="first_name"
>>>>>>> Stashed changes
              label="First Name"
              name="First_name"
              value={formData.First_name}
              onChange={handleChange}
            />
          </Grid>
<<<<<<< Updated upstream
          <Grid item xs={6}>
            <TextField
              variant="outlined"
              required
              fullWidth
              type="text"
=======
          <Grid item xs={12} sm={6}>
            <TextField
              variant="outlined"
              margin="normal"
              required
              fullWidth
              id="last_name"
>>>>>>> Stashed changes
              label="Last Name"
              name="Last_name"
              value={formData.Last_name}
              onChange={handleChange}
            />
          </Grid>
<<<<<<< Updated upstream
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
=======
          <Grid item xs={12} sm={6}>
            <TextField
              variant="outlined"
              margin="normal"
              required
              fullWidth
              id="password"
              label="Password"
              name="Password"
              type="password"
              value={formData.Password}
              onChange={handleChange}
              error={!!formErrors.Password}
              helperText={formErrors.Password}
            />
            <LinearProgress
              variant="determinate"
              value={getPasswordStrength(formData.Password) * 25}
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <TextField
              variant="outlined"
              margin="normal"
              required
              fullWidth
              id="confirm_password"
              label="Confirm password"
              name="Confirm_password"
              type="password"
              value={formData.Confirm_password}
              onChange={handleChange}
              error={!!formErrors.Confirm_password}
              helperText={formErrors.Confirm_password}
            />
          </Grid>
          <Grid item xs={12}>
            <TextField
              variant="outlined"
              margin="normal"
              required
              fullWidth
              id="email"
              label="Email"
              name="Email"
              type="email"
              value={formData.Email}
              onChange={handleChange}
              error={!!formErrors.Email}
              helperText={formErrors.Email}
>>>>>>> Stashed changes
            />
          </Grid>
          <Grid item xs={12}>
            <TextField
              variant="outlined"
<<<<<<< Updated upstream
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
=======
              margin="normal"
              required
              fullWidth
              id="phone_number"
              label="Phone Number"
              name="Phone_number"
              type="tel"
              value={formData.Phone_number}
              onChange={handleChange}
              error={!!formErrors.Phone_number}
              helperText={formErrors.Phone_number}
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <TextField
              variant="outlined"
              margin="normal"
              required
              fullWidth
              id="address_line1"
>>>>>>> Stashed changes
              label="Address Line 1"
              name="Address_line1"
              value={formData.Address_line1}
              onChange={handleChange}
            />
          </Grid>
<<<<<<< Updated upstream
          <Grid item xs={12}>
            <TextField
              variant="outlined"
              fullWidth
              type="text"
=======
          <Grid item xs={12} sm={6}>
            <TextField
              variant="outlined"
              margin="normal"
              fullWidth
              id="address_line2"
>>>>>>> Stashed changes
              label="Address Line 2"
              name="Address_line2"
              value={formData.Address_line2}
              onChange={handleChange}
            />
          </Grid>
<<<<<<< Updated upstream
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
=======
          <Grid item xs={12} sm={6}>
            <FormControl fullWidth variant="outlined" margin="normal" required>
              <InputLabel id="city-label">City</InputLabel>
              <Select
                labelId="city-label"
                id="city"
                name="City"
                value={formData.City}
                onChange={handleChange}
                label="City"
              >
                <MenuItem value="Colombo">Colombo</MenuItem>
                <MenuItem value="Galle">Galle</MenuItem>
                <MenuItem value="Matara">Matara</MenuItem>
              </Select>
            </FormControl>
          </Grid>
          <Grid spacing={1} item xs={12} sm={6}>
            <TextField
              variant="outlined"
              margin="normal"
              required
              fullWidth
              id="province"
>>>>>>> Stashed changes
              label="Province"
              name="Province"
              value={formData.Province}
              onChange={handleChange}
            />
          </Grid>
<<<<<<< Updated upstream
          <Grid item xs={12}>
            <TextField
              variant="outlined"
              required
              fullWidth
              type="text"
=======
          <Grid spacing={1} item xs={12}>
            <TextField
              variant="outlined"
              margin="normal"
              required
              fullWidth
              id="zipcode"
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          style={{margin:"2% 0%"}}
        >
          Register
        </Button>
      </form>
    </Container>
=======
          sx={{ mt: 3, mb: 2 }}
          disabled={loading}
        >
          {loading ? <CircularProgress size={24} /> : "Register"}
        </Button>
        <Typography variant="body2" align="center">
          Already have an account? <Link href="/login">Log in</Link>
        </Typography>
        {showSuccessMessage && (
          <Alert severity="success">
            Registration successful! Please log in.
          </Alert>
        )}
      </form>
    </StyledContainer>
>>>>>>> Stashed changes
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
