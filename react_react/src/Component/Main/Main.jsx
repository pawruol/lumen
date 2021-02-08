import React from "react"
import classes from './main.module.css'
import Header from "./Header/Header";
import Navbar from "./Navbar/Navbar";
import Content from "./Content/Content";
import DataGridDemo from "../DataGrid/DataGrid";


const Main = () => {
    return (
        <div className={classes.appWrapper}>
            <Header/>
            <Navbar/>
            <Content/>
            <DataGridDemo/>
        </div>
    )
}

export default Main
