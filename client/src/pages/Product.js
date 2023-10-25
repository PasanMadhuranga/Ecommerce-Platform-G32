import React, { useState, useEffect } from "react";
import axios from "axios";
import { useParams } from "react-router-dom";
import Alert from "../components/Alert";
import { useUser } from "../components/UserContext";

const ProductPage = () => {
  const { id } = useParams(); // Get the product ID from the URL parameter
  const [product, setProduct] = useState({});
  const [items,setItems] = useState([]);
  const [cart,setCart] = useState([]);
  const [showAlert, setShowAlert] = useState(false);
  const customer_id = 1;

  useEffect(() => {
    // Fetch product details from the API
    axios.get(`http://localhost:8000/shop/${id}`)
      .then((response) => {
        console.log(response);
        setProduct(response.data[0][0]);
        setItems(response.data[1]);
      })
      .catch((error) => {
        console.error("Error fetching product details:", error);
      });
  }, [id]);

  const closeAlert = () => {
    setShowAlert(false); // Close the alert
  };

  // const { state: { customer_id } } = useUser();

  // if (!customer_id) {
  //   return <div>Please log in to view this page.</div>;
  // }

  const addToCart = (itemID) => {
    // Add the selected product item to the cart
    axios.post(`http://localhost:8000/cart/${customer_id}/${itemID}`)
      .then((response) => {
        if (response.status === 200) {
          setCart((prevCart) => [...prevCart, itemID]);
          setShowAlert(true);
        }
      })
      .catch((error) => {
        console.error("Error adding item to cart:", error);
      });
  };

  return (
    <div>
      {showAlert && (
        <Alert message="Product added to cart!" onClose={closeAlert} />
      )}
      <div>
        <h1>{product.Title}</h1>
        <img src={product.Image} width="40%" />
        <p>{product.Description}</p>
        <p>{product.Weight}kg</p>
        <p>Price: ${product.Min_price}</p>
      </div>
      <div className="product-list">
        {items && items.length > 0 && (
          <div>
            <h2>Variations</h2>
          {items.map((item) => (
            <div key={item.Item_id} className="product">
              <p>Item ID:{item.Item_id} </p>
              <img src={item.Image} width="25%" />
              <p>Price: ${item.Price}</p>
              <button onClick={() => addToCart(item.Item_id)}>Add to Cart</button>
            </div>
          ))}
        </div>
        
      )}
          
      </div>
    </div>
  );
};

export default ProductPage;
