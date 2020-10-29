import React from 'react';
import ReactDOM from 'react-dom'
import classes from './index.module.css';
import App from './App';
import * as serviceWorker from './serviceWorker';
import {BrowserRouter} from "react-router-dom";
import {Switch as SwitchRouter} from "react-router-dom";
import store from "./redux/redux";
import {Provider} from "react-redux";


ReactDOM.render(
    <BrowserRouter>
        <SwitchRouter>
            <React.StrictMode>
                <Provider store={store}>
                    <App />
                </Provider>
            </React.StrictMode>
        </SwitchRouter>
    </BrowserRouter>
    , document.getElementById('root'))
;

serviceWorker.unregister();
