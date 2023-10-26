import React from 'react';

function SalesTable({ data }) {
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
            <th>Total Quantity</th>
            <th>Total Sales Amount</th>
          </tr>
        </thead>
        <tbody>
          {data.map((item, index) => (
            <tr key={index}>
              <td>{item.Title}</td>
              <td>{item['SUM(oi.Quantity)']}</td>
              <td>{item['SUM(oi.Unit_price * oi.Quantity)']}</td>
            </tr>
          ))}
        </tbody>
      </table>
      )}
    </div>
    
  );
}

export default SalesTable;
