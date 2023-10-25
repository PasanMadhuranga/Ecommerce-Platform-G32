import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import './App.css';
import HomePage from './pages/Home';
import ShopPage from './pages/Shop';
import CategoryProducts from './pages/Category';
import ProductPage from './pages/Product';
import CustomerRegisterPage from './pages/Register';
import CustomerGuestPage from './pages/Guest';
import CartPage from './pages/Cart';
import { UserProvider } from './components/UserContext';
import Login from './pages/Login';
import CheckoutPage from './pages/Checkout';
import CardDetailsPage from './pages/CardDetails';

function app(){
  return(
    <>
      <Router>
        <UserProvider>
          <Routes>
            <Route exact path="/" element={<HomePage/>} />
            <Route path="/main-categories/:id" element={<CategoryProducts/>} />
            <Route path='/shop' element={<ShopPage/>} />
            <Route path='/shop/:id' element={<ProductPage/>} />
            <Route path='/register' element={<CustomerRegisterPage/>} />
            <Route path='/guest' element={<CustomerGuestPage/>} />
            <Route path='/cart/:id' element={<CartPage/>} />
            <Route path="/login" element={<Login/>} />
            <Route path='/checkout' element={<CheckoutPage/>} />
            <Route path='/card-details' element={<CardDetailsPage/>} />
            {/* <Redirect from="/" to="/login" /> */}
          </Routes>
        </UserProvider>
      </Router>
    </>
  );
}

export default app;