import React, { useState, useEffect } from "react";
import axios from "axios";
import {
  Container,
  Typography,
  Paper,
  Grid,
  Card,
  CardMedia,
  CardContent,
} from "@mui/material";
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import NavBar from "../components/Nav"; // Import NavBar
<<<<<<< Updated upstream
=======
import Cookies from "js-cookie";
>>>>>>> Stashed changes

const HomePage = () => {
  const [categories, setCategories] = useState([]);
  const [subCategories, setSubCategories] = useState([]);

  const refreshTokens = async () => {
    try {
      const response = await axios.post("http://localhost:8000/refresh", {
        refreshToken: Cookies.get("refreshToken"),
      });

      if (response.status >= 200 && response.status < 300) {
        const { accessToken, refreshToken } = response.data;
        Cookies.set("accessToken", accessToken);
        Cookies.set("refreshToken", refreshToken);
      } else {
        console.log("Failed to refresh tokens.");
      }
    } catch (error) {
      console.log("Failed to refresh tokens.");
    }
  };

  axios.interceptors.response.use(
    (response) => response,
    async (error) => {
      if (error.response.status === 401) {
        // If the server responds with a 401 status code, refresh the tokens
        await refreshTokens();
      }
      return Promise.reject(error);
    }
  );

  useEffect(() => {
    // Fetch main product categories from the API when the component mounts
    axios
      .get("http://localhost:8000/main-categories")
      .then((response) => {
        console.log(response);
        setCategories(response.data); // Assuming the API returns an array of categories
      })
      .catch((error) => {
        console.error("Error fetching categories:", error);
      });

    axios
      .get("http://localhost:8000/main-categories/sub")
      .then((response) => {
        console.log(response);
        setSubCategories(response.data); // Assuming the API returns an array of categories
      })
      .catch((error) => {
        console.error("Error fetching categories:", error);
      });
  }, []); // The empty dependency array ensures this runs only once on mount

  const sliderSettings = {
    dots: true,
    infinite: true,
    speed: 500,
    slidesToShow: 1, // Display one slide at a time
    slidesToScroll: 1,
    autoplay: true, // Enable autoplay
    autoplaySpeed: 3000, // Autoplay interval in milliseconds
    rtl: false, // Slide from right to left
  };

  return (
    <div style={{ backgroundColor: "#f5f5f5" }}>
      <NavBar />
      <Container maxWidth="100%">
        <Paper
          elevation={3}
          style={{
            textAlign: "center",
            backgroundColor: "#ffffff",
<<<<<<< Updated upstream
            width:"90%", margin:"1% 5%"
=======
>>>>>>> Stashed changes
          }}
        >
          <img
            src="https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Banner%20copy.jpg?alt=media&token=cacc271e-85bd-4a96-9793-7516ad5f24a1&_gl=1*1dksexe*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODczNTk5NS4yOC4xLjE2OTg3MzYwMzkuMTYuMC4w"
            style={{ width: "100%", height: "100%" }}
            alt=""
          />
<<<<<<< Updated upstream
          <Slider {...sliderSettings} style={{width:"80%", margin:"1% 10%"}} >
=======
          <Slider {...sliderSettings}>
>>>>>>> Stashed changes
            {categories.map((category) => (
              <div key={category.Category_id} className="category-slide">
                <a href={`/main-categories/${category.Category_id}`}>
                  <img
                    src={category.Category_image}
                    alt={category.Name}
                    style={{
                      height: "90vh",
                      padding: "2% 10% 1% 10%",
                      margin: "auto",
                      display: "block",
                    }}
                  />
                  <h3 style={{ textAlign: "center" }}>{category.Name}</h3>
                </a>
              </div>
            ))}
          </Slider>
        </Paper>
      </Container>

      <Grid container spacing={2} style={{ width: "80%", margin: "5% auto" }}>
        {subCategories.map((item) => (
          <Grid item xs={12} sm={6} md={3} key={item.Category_id}>
            <a
              href={`/main-categories/${item.Category_id}`}
              style={{ textDecoration: "none" }}
            >
              <Card
                sx={{
                  borderRadius: "15px",
                  boxShadow: 3,
                  transition: "0.3s",
                  "&:hover": {
                    boxShadow: 6,
                    transform: "scale(1.05)",
                  },
                }}
              >
                <CardMedia
                  component="img"
                  alt={item.Name}
                  height="160"
                  image={item.Category_image}
                  style={{ borderRadius: "15px 15px 0 0" }}
                />
                <CardContent>
                  <Typography
                    variant="body2"
                    color="textSecondary"
                    textAlign="center"
                    style={{ color: "#3f51b5" }}
                  >
                    {item.Name}
                  </Typography>
                </CardContent>
              </Card>
            </a>
          </Grid>
        ))}
      </Grid>
    </div>
  );
};

export default HomePage;



// import React, { useState, useEffect } from 'react';
// import axios from 'axios';
// import { Link } from 'react-router-dom';
// import { Container, Typography, Paper, Grid, Card, CardMedia, CardContent } from '@mui/material';
// import Slider from 'react-slick';
// import 'slick-carousel/slick/slick.css';
// import 'slick-carousel/slick/slick-theme.css';

// const HomePage = () => {
//   const [categories, setCategories] = useState([]);
//   const [subCategories, setSubCategories] = useState([]);

//   useEffect(() => {
//     // Fetch main product categories from the API when the component mounts
//     axios.get('http://localhost:8000/main-categories')
//       .then((response) => {
//         console.log(response);
//         setCategories(response.data); // Assuming the API returns an array of categories
//       })
//       .catch((error) => {
//         console.error('Error fetching categories:', error);
//       });

//     axios.get('http://localhost:8000/main-categories/sub')
//       .then((response) => {
//         console.log(response);
//         setSubCategories(response.data); // Assuming the API returns an array of categories
//       })
//       .catch((error) => {
//         console.error('Error fetching categories:', error);
//       });

//   }, []); // The empty dependency array ensures this runs only once on mount

//   const sliderSettings = {
//     dots: true,
//     infinite: true,
//     speed: 500,
//     slidesToShow: 1, // Display one slide at a time
//     slidesToScroll: 1,
//     autoplay: true, // Enable autoplay
//     autoplaySpeed: 3000, // Autoplay interval in milliseconds
//     rtl: false, // Slide from right to left
//   };

//   return (
//     <div>
//       <Container maxWidth="lg">
//         <Paper elevation={1} style={{ padding: '20px', textAlign: 'center' }}>
//           <Typography variant="h4" component="div" gutterBottom>
//             C Ecommerce
//           </Typography>
//           <Typography variant="subtitle1" gutterBottom>
//             Your Faithful Retailer
//           </Typography>
//           <img
//             src="https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Banner.webp?alt=media&token=319a8045-33cc-478a-9be4-88db30165d06&_gl=1*1u40b4d*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2OTAxNjIuMzEuMC4w"
//             alt="Shop Image"
//             style={{ maxWidth: '100%', height: 'auto' }}
//           />
//           <div className="slider">
//           <Slider {...sliderSettings}>
//             {categories.map((category) => (
//               <div key={category.Category_id} className="category-slide">
//                 <a href={`/main-categories/${category.Category_id}`}>
//                 <img
//                   src={category.Category_image}
//                   alt={category.Name}
//                   style={{ width: '80%', padding: '10% 10% 0% 10%' }}
//                 />
//                 <h3 style={{ textAlign: 'center' }}>{category.Name}</h3>
//                 </a>
//               </div>
//             ))}
//           </Slider>
//         </div>
//         </Paper>
//       </Container>

//       <Grid container spacing={2} width="80%" margin="10%">
//       {subCategories.map((item) => (
//         <Grid item xs={12} sm={6} md={3} key={item.id}>
//           <a href={`/main-categories/${item.Category_id}`}>
//           <Card>
//             <CardMedia
//               component="img"
//               alt={item.Name}
//               height="160"
//               image={item.Category_image}
//             />
//             <CardContent>
//               <Typography variant="body2" color="textSecondary" textAlign="center">
//                 {item.Name}
//               </Typography>
//             </CardContent>
//           </Card>
//           </a>
//         </Grid>
//       ))}
//     </Grid>


//       {/* <div className="slider">
//         {categories.map((category) => (
//           <a href={`/main-categories/${category.Category_id}`}
//             //to={`/main-categories/`} // Assuming the API uses 'id' for category identification
//             key={category.Category_id}
//             className="category-slide"
//           >
//             <img src={category.Image} alt={category.Name} width="60%" 
//                       style={{'marginLeft':'20%', 'marginRight':'20%'}} />
//             <h3 style={{'textAlign':'center'}}>{category.Name}</h3>
//           </a>
//         ))}
//       </div> */}
//     </div>
//   );
// };

// export default HomePage;
