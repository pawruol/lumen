import React from "react"
import classes from './main.module.css'
import Header from "../Header/Header";
import Navbar from "../Navbar/Navbar";
import Content from "../Content/Content";



const Main =()=>{
    return (
     <div className={classes.appWrapper}>
         <Header/>
         <Navbar/>
         <Content/>
     </div>
    )
}

export default Main
