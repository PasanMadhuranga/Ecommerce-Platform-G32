import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import { Container, Typography, Paper, Grid } from '@mui/material';
import Slider from 'react-slick';
import 'slick-carousel/slick/slick.css';
import 'slick-carousel/slick/slick-theme.css';

const HomePage = () => {
  const [categories, setCategories] = useState([]);

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
            src="https://cdn.newswire.com/files/x/f0/89/b1d52a0ea18e11cca6faa6a880b4.jpg"
            alt="Shop Image"
            style={{ maxWidth: '100%', height: 'auto' }}
          />
          <div className="slider">
          <Slider {...sliderSettings}>
            {categories.map((category) => (
              <div key={category.Category_id} className="category-slide">
                <a href={`/main-categories/${category.Category_id}`}>
                <img
                  src="https://blessingstelecom.com/img/developerimg/choco_blessingstelecom_20200113100659_db/mebase/CustomSectionStyle/Images/original_200219061202_5e4cd1b2c5eb3.jpg"
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
