import axios from 'axios';
import React, { useState } from 'react';

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loginSuccess, setLoginSuccess] = useState(false);

  const handleLogin = async () => {
    try {
      const response = await axios.post('http://localhost:8000/login', { email, password });
      console.log(response);
      
      if (response.data === "You're successfully logged in.") {
        setLoginSuccess(true);
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
