import React from 'react';

function PopularTimeTable({ data }) {
  return (
    <div>
        <h2>Your Cart</h2>
      {data.length === 0 ? (
        <p>No previous sales.</p>
      ) :(
        <table>
        <thead>
          <tr>
            <th>Year</th>
            <th>Month</th>
            <th>Total Orders Amount</th>
          </tr>
        </thead>
        <tbody>
          {data.map((item, index) => (
            <tr key={index}>
              <td>{item.OrderYear}</td>
              <td>{item.OrderMonth}</td>
              <td>{item.Total_orders}</td>
            </tr>
          ))}
        </tbody>
      </table>
      )}
    </div>
    
  );
}

export default PopularTimeTable;
