import axios from 'axios';
import React, { useState } from 'react';
import { useUser } from '../components/UserContext';

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loginSuccess, setLoginSuccess] = useState(false);
  const {login} = useUser();

  const handleLogin = async () => {
    try {
      const response = await axios.post('http://localhost:8000/login', { email, password });
      setLoginSuccess(true);
      console.log(response);
      const customer_id = response.data.customerID;
      login(customer_id);
      console.log(customer_id);
      
      if (response.status >= 200 && response.status < 300) {
        console.log("Login succeeded.");
      } else {
        console.log("Login failed.");
      }
    } catch (error) {
      console.error("Login failed.");
    }
  };

  return (
    <div>
      <h2>Login</h2>
      <form>
        <div>
          <label htmlFor='email'>Email:</label>
          <input name='email' type="email" value={email} onChange={(e) => setEmail(e.target.value)} />
        </div>
        <div>
          <label htmlFor='password'>Password:</label>
          <input name='password' type="password" value={password} onChange={(e) => setPassword(e.target.value)} />
        </div>
        <button type="button" onClick={handleLogin}>Login</button>
      </form>
      {loginSuccess && <p>Login Successful!</p>}
    </div>
  );
};

export default Login;
