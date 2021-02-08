import React from 'react';
import classes from './App.css';

import Main from "./Component/Main/Main";
import Login from "./Component/Login/Login";
import  {withRouter,Route} from "react-router-dom";
import {connect} from "react-redux";
import {compose} from "redux";


function App() {
    return (
        <>
            <Route path='/main' render={() => <Main/>}/>
            <Route exact path='/' render={() => <Login/>}/>
        </>
    );
}


export default compose(
    withRouter,
    connect(null, {}))(App);
