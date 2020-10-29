import {authAPI} from "../api/api";

const SET_AUTORISATION = 'SET_AUTORISATION';

let initialState = {
    email: null,
    password:null,
    isAuth: false
}

const loginReducer = (state = initialState, action) => {
    switch (action.type) {
        case SET_AUTORISATION:
            return {
                ...state,
                ...action.payload
            }
    }
    return state
}

export const setAuthUserData = (email,password)=>({
    type:SET_AUTORISATION,
    payload:{email,password}
})

export const login = (email,password)=> {
    console.log(email);
    let response = authAPI.login(email,password)

    if (response.status === 200){
        console.log(response.result.token)
    } else {
        console.log(response)
    }

};

export default loginReducer
