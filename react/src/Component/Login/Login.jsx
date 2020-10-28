import React from "react";
import classes from './login.module.css'
import Button from "@material-ui/core/Button";
import Checkbox from '@material-ui/core/Checkbox';
import {Input} from "@material-ui/core";
import {Redirect} from "react-router-dom";


const Login = (props) => {

    return (
    <form className={classes.root} autoComplete="off">
        <h3>Login</h3>
       <div> <Input required id="standard-required" label="login" placeholder={'Login'} type={'text'}  /></div>
        <div>  <Input required id="standard-required" label="password" placeholder={'Password'} type={'password'}  size={"small"} /></div>
        <div>
            <Button variant="contained" size={'small'} onClick={<Redirect to={'/main'}/>}>Login</Button>
        </div>
        <div> <Checkbox inputProps={{ 'aria-label': 'uncontrolled-checkbox' }} />remember me</div>
    </form>)
}

export default Login
