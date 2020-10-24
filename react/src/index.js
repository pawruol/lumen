import React from 'react';
import ReactDOM from 'react-dom'
import classes from './index.module.css';
import App from './App';
import * as serviceWorker from './serviceWorker';
import {BrowserRouter} from "react-router-dom";
import {Switch as SwitchRouter} from "react-router-dom";


ReactDOM.render(
    <BrowserRouter>
        <SwitchRouter>
        <React.StrictMode>
            <App className={classes.flex}/>
        </React.StrictMode>
        </SwitchRouter>
    </BrowserRouter>
    , document.getElementById('root'))
;


// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
