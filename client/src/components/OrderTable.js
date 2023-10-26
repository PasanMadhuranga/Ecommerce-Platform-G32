import React from 'react';

function OrderTable({ data }) {
  return (
    <div>
        <h2>Your Cart</h2>
      {data.length === 0 ? (
        <p>No previous sales.</p>
      ) :(
        <table>
        <thead>
          <tr>
            <th>Date/Time</th>
            <th>Title</th>
            <th>Total Quantity</th>
            <th>Unit Price</th>
          </tr>
        </thead>
        <tbody>
          {data.map((item, index) => (
            <tr key={index}>
              <td>{item['DATE(so.Date)']}</td>
              <td>{item.Title}</td>
              <td>{item.Quantity}</td>
              <td>{item.Unit_price}</td>
            </tr>
          ))}
        </tbody>
      </table>
      )}
    </div>
    
  );
}

export default OrderTable;
