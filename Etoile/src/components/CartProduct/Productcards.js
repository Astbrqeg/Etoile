import "./cartCards.css";
import "bootstrap/dist/css/bootstrap.min.css";
import React from "react";

export default function Cards(props) {
  console.log(props.nameOfProduct);
  const [quantity, updateQuantity] = React.useState(props.quantity);
  return (
    <div className="box">
      <img src={props.img} alt=""></img>
      <div className="content">
        <h3>{props.nameOfProduct}</h3>
        <h7>Price: {props.price} $</h7>
        <p className="unit">
          <input className="quantity" value={quantity}></input>

          <button className="btn3" onClick={() => updateQuantity(quantity - 1)}>
            -
          </button>
          <button className="btn4" onClick={() => updateQuantity(quantity + 1)}>
            +
          </button>
          <h7>
            <br></br>Sub-Total:{quantity * props.price}
          </h7>
        </p>
        <p>
          <p className="btnarea">
            <i className="fafatrash">
              <span className="btn2">Remove</span>
            </i>
          </p>
        </p>
      </div>
    </div>
  );
}
