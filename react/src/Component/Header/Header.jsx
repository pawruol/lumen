import React from "react";
import classes from './header.module.css'
import AppBar from "@material-ui/core/AppBar";
import {Container, IconButton, Toolbar, Typography} from "@material-ui/core";
import MenuIcon from "@material-ui/icons/Menu";
import SettingsIcon from "@material-ui/icons/Settings";
import {Link, NavLink} from "react-router-dom";


const Header = (props) => {
    return  <AppBar position={"fixed"} color={"default"} className={classes.header}>

        <Container>
            <Toolbar className={classes.flex}>
                <IconButton edge={"start"} color={'black'} aria-label={'menu'}>
                    <MenuIcon></MenuIcon>

                </IconButton>
                {/*<div className={classes.titleName}> PROJECT </div>*/}
                <Typography variant={'h6'}><Link to='/main'>Project</Link></Typography>
                <Typography variant={'h6'}><Link to='/'>Login</Link></Typography>
                {/*<Login />*/}
            </Toolbar>
        </Container>
    </AppBar>
}
export default Header
