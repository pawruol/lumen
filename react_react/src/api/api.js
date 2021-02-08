import * as axios from 'axios'
const qs = require('querystring')

const config = {
    baseURL: 'http://lumen/api',
    headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
    }
}


export const authAPI = {
    login(email,password){

        const requestBody = {
            email: email,
            password: password
        }

        return axios.post('/login', qs.stringify(requestBody), config)
            .then((result) => {
                // Do somthing

                document.cookie = "token=" + result.result.token;
                console.log(result);
            })
            .catch((err) => {
                // Do somthing
            })

    },
    registration(userName, email, password, passwordConfirmation){
        const requestBody = {
            email: email,
            password: password
        }

        return axios.post('/login', qs.stringify(requestBody), config)
            .then((result) => {
                // Do somthing
            })
            .catch((err) => {
                // Do somthing
            })

    }
}


export const globalAPI = {
    getDataGrid(url){

        var match = document.cookie.match(new RegExp('(^| )' + 'token' + '=([^;]+)'));

        let configAPI = {
            baseURL: 'http://lumen/api',
            headers: {
                'Authorization': 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sdW1lblwvYXBpXC9sb2dpbiIsImlhdCI6MTYwMzgwOTQzNCwiZXhwIjoxNjAzODEzMDM0LCJuYmYiOjE2MDM4MDk0MzQsImp0aSI6IjVucHdSZkphcnRqakF4dzQiLCJzdWIiOjEsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.tge6MnP8ON0ZreZWGM9yKl49SPE4tgPtk5PG3MLxe_w'
            }
        }

        return axios.get('http://lumen/api' + url, configAPI)
            .then((result) => {
                // Do somthing
            })
            .catch((err) => {
                // Do somthing
            })

    },

}
