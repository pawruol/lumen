import {applyMiddleware, combineReducers, createStore} from "redux";
import loginReducer from "./login-reducer";

import thunkMiddleware from "redux-thunk";


let rootReducer  = combineReducers({
    loginPage: loginReducer,
})

const store = createStore(rootReducer,applyMiddleware(thunkMiddleware))
export default store

window.store = store
