import React from "react";
import { Link } from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import Cards from "./Productcards.js";
import { Card, Button } from "react-bootstrap";
import "./list.css";


export default function Cart() {
  const [list, setlist] = React.useState([]);
  const storageUser = window.localStorage.getItem("user");
  
  
  
  const productInCard = async () => {
    try {
      let response = await fetch("http://localhost:3001/Cart", {
        method: "GET",
        credentials: "include",
        headers: {
          "Content-Type": "application/json",
        },
      });

      const resJson = await response.json();
      console.log(resJson, "products");
      setlist(resJson);
    } catch (error) {
      console.log(error);
    }
  };

  React.useEffect(() => {
    productInCard();
  }, []);

  if (list.length > 0) {
    return (
      <div class="wrapper">
        <h1>Shopping Cart</h1>
        <div class="project">
          <div class="shop">{list.map(insertcards)}</div>
        </div>
        <h3 className="total">Total:</h3>
        {storageUser && (
        <Link to="/Payment">
          <button className="pay">PAY</button>
        </Link>)}
        
          {storageUser ==null &&(
            <Link to="/sigup"/>
          )}
        
      </div>
    );
  } else if (list.length == 0) {
    return (
      <Link to="/Products">
        <button>go to Shopping!!</button>
      </Link>
    );
  }
  
 
}

function insertcards(item) {
  return (
    
    <Cards
      key={item.productid}
      nameOfProduct={item.productname}
      price={item.price}
      img={item.img}
      quantity={item.quantity}
    />
  );
}

