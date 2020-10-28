import * as axios from 'axios'

const instance = axios.create({
    withCredentials: true,
    baseURL: 'https://lumben/api/',
    headers: 'application/x-www-form-urlencoded'
})


export const authAPI = {
    login(email,password){
        return instance.post('/login',{email,password})
    }
}
