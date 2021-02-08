import React from "react";
import classes from './login.module.css'
import {Field, reduxForm, values} from "redux-form";
import {validate} from "../utils/validate";
import {
    renderCheckbox,
    renderTextFieldLogin,
    renderTextFieldPassword
} from "../utils/CreateInputMaterialFunction";
import {connect} from "react-redux";
import {login} from "../../redux/login-reducer";
import {Redirect} from "react-router-dom";
import DataGridDemo from "../DataGrid/DataGrid";


const LoginForm = (props) => {
    return (
<>
        <form onSubmit={props.handleSubmit}>
            <div><Field component={renderTextFieldLogin } name={'login'}  /></div>
            <div><Field  component={renderTextFieldPassword } name={'password'}   /></div>
            <div><Field component={renderCheckbox} name={'rememberMe'}  />запомнить меня</div>
            <div>
                <button>Войти</button>
            </div>

        </form>

    <button onClick={<Redirect to={DataGridDemo}/>} >Регистрация</button>
    </>
    )
}
const LoginReduxForm = reduxForm({form: 'login', validate})(LoginForm)

const Login = () => {

    const onSubmit=(formData) =>{

        login(formData.login, formData.password);
    }

    return (<div className={classes.container}>
        <p>Login</p>
        <LoginReduxForm onSubmit={onSubmit}/>
    </div>)
}
let mapDispatchToProps=(state)=>{

}
export default connect(mapDispatchToProps,{login})(Login)

