import React from 'react';

function PopularTable({ data }) {
  return (
    <div>
        <h2>Your Cart</h2>
      {data.length === 0 ? (
        <p>No previous sales.</p>
      ) :(
        <table>
        <thead>
          <tr>
            <th>Title</th>
            <th>Total Sales Amount</th>
          </tr>
        </thead>
        <tbody>
          {data.map((item, index) => (
            <tr key={index}>
              <td>{item.Title}</td>
              <td>{item.Total_sales}</td>
            </tr>
          ))}
        </tbody>
      </table>
      )}
    </div>
    
  );
}

export default PopularTable;
