import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import { Container, Typography, Paper, Grid, Card, CardMedia, CardContent } from '@mui/material';
import Slider from 'react-slick';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';

const HomePage = () => {
  const [categories, setCategories] = useState([]);
  const [subCategories, setSubCategories] = useState([]);

  useEffect(() => {
    // Fetch main product categories from the API when the component mounts
    axios.get('http://localhost:8000/main-categories')
      .then((response) => {
        console.log(response);
        setCategories(response.data); // Assuming the API returns an array of categories
      })
      .catch((error) => {
        console.error('Error fetching categories:', error);
      });

    axios.get('http://localhost:8000/main-categories/sub')
      .then((response) => {
        console.log(response);
        setSubCategories(response.data); // Assuming the API returns an array of categories
      })
      .catch((error) => {
        console.error('Error fetching categories:', error);
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
    <div>
      <Container maxWidth="lg">
        <Paper elevation={1} style={{ padding: '20px', textAlign: 'center' }}>
          <Typography variant="h4" component="div" gutterBottom>
            C Ecommerce
          </Typography>
          <Typography variant="subtitle1" gutterBottom>
            Your Faithful Retailer
          </Typography>
          <img
            src="https://firebasestorage.googleapis.com/v0/b/e-commerce-3356b.appspot.com/o/Banner.png?alt=media&token=73571f95-149f-4691-8d53-26fb117b56ee&_gl=1*cr9f9y*_ga*NjM3NzczMzI4LjE2OTc3MzU5ODI.*_ga_CW55HF8NVT*MTY5ODY4NjU3OC4yNC4xLjE2OTg2ODg1MTYuNjAuMC4w"
            alt="Shop Image"
            style={{ maxWidth: '100%', height: 'auto' }}
          />
          <div className="slider">
          <Slider {...sliderSettings}>
            {categories.map((category) => (
              <div key={category.Category_id} className="category-slide">
                <a href={`/main-categories/${category.Category_id}`}>
                <img
                  src={category.Category_image}
                  alt={category.Name}
                  style={{ width: '80%', padding: '10% 10% 0% 10%' }}
                />
                <h3 style={{ textAlign: 'center' }}>{category.Name}</h3>
                </a>
              </div>
            ))}
          </Slider>
        </div>
        </Paper>
      </Container>

      <Grid container spacing={2} width="80%" margin="10%">
      {subCategories.map((item) => (
        <Grid item xs={12} sm={6} md={3} key={item.id}>
          <a href={`/main-categories/${item.Category_id}`}>
          <Card>
            <CardMedia
              component="img"
              alt={item.Name}
              height="160"
              image={item.Category_image}
            />
            <CardContent>
              <Typography variant="body2" color="textSecondary" textAlign="center">
                {item.Name}
              </Typography>
            </CardContent>
          </Card>
          </a>
        </Grid>
      ))}
    </Grid>


      {/* <div className="slider">
        {categories.map((category) => (
          <a href={`/main-categories/${category.Category_id}`}
            //to={`/main-categories/`} // Assuming the API uses 'id' for category identification
            key={category.Category_id}
            className="category-slide"
          >
            <img src={category.Image} alt={category.Name} width="60%" 
                      style={{'marginLeft':'20%', 'marginRight':'20%'}} />
            <h3 style={{'textAlign':'center'}}>{category.Name}</h3>
          </a>
        ))}
      </div> */}
    </div>
  );
};

export default HomePage;
