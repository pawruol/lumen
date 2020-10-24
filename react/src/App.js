import React from 'react';
import classes from './App.css';

import Main from "./Component/Main/Main";
import Login from "./Component/Login/Login";
import {Route, Switch as SwitchRouter} from "react-router-dom";


function App() {
    return (
        <>
            <Route path='/main' render={() => <Main/>}/>
            <Route exact path='/' render={() => <Login/>}/>
        </>
    );
}

export default App;
