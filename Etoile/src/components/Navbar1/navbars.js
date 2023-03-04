import React from "react";
import logo from "./logo.png";
import { Nav, NavLink, Bars, NavMenu } from "./navbarElement";
import Login from "../pages/Login/Login";
import Profile from "../pages/Login/Profile";
import Cart from "../pages/cart/cart";
import { FaUserAlt } from "react-icons/fa";
import { FaSearch } from "react-icons/fa";
import { BsFillBasket2Fill, BsSearch } from "react-icons/bs";
import "./nav.css";
import { Button, Modal, NavItem, Row } from "react-bootstrap";
import { Link } from "react-router-dom";
import { useState } from "react";




export default function Navbar() {
  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  const storageUser = window.localStorage.getItem("user");

  const logout = async () => {
    await fetch("http://localhost:3001/Logout", {
      credentials: "include"

    })


    window.localStorage.setItem('user', "");

  }




  return (
    <>
      <Nav className="navbar">
        <NavLink to="/">
          <img src={logo} alt="logo" className="logonav" />
        </NavLink>
        <div className="nav-input">
          <input
            className="search"
            type="search"
            id="header-search"
            placeholder=""
            name="s"
          />
          <button className="searchBtn">
            <BsSearch />
          </button>
        </div>
        <Bars />
        <div className="items">
          <NavMenu className="navmenu">
            <Link
              className="cartnav"
              to="/cart"
              activeStyle

            >

              <BsFillBasket2Fill />
            </Link>

            {!storageUser && (
              <a className="tologin" href="/login"><FaUserAlt />
              </a>
            )}

            {storageUser && (
              <div className="loggedin">
                <i className="welcomeUser">Welcome {storageUser} </i>
                <a className="logout" onClick={logout} href="/">
                  <i className="logout"> Log out</i>
                </a>
              </div>
            )}

          </NavMenu>
        </div>
      </Nav>
    </>
  );
}