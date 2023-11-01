import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';
import PopularTimeTable from '../../components/PopularTimeTable';

function PopularTimeForProductReport() {
  const { id } = useParams();
  const [data, setData] = useState([]);

  useEffect(() => {
    // Make an API request to http://localhost:8000/sales/:year/:quarter and fetch data
    // Replace this with your actual API call
    fetch(`http://localhost:8000/orders/${id}`)
      .then((response) => response.json())
      .then((data) => {
        setData(data[0]);
        console.log(data[0]);
        });
  }, [id]);

  return (
    <div>
      <h1>Most Popular Time of Product ID : {id}</h1>
      <PopularTimeTable data={data} />
    </div>
  );
}

export default PopularTimeForProductReport;
