<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

// API route group
$router->group(['prefix' => 'api'], function () use ($router) {
    // Matches "/api/register
    $router->post('register', 'AuthController@register');
    // Matches "/api/login
    $router->post('login', 'AuthController@login');


    // Matches "/api/profile
    $router->get('user', 'UserController@profile');
    // Matches "/api/users/1 
    //get one user by id
    $router->get('users/{id}', 'UserController@singleUser');
    // Matches "/api/users
    $router->get('users', 'UserController@allUsers');


    // Matches "/api/userAllAccounts
    $router->get('user/accounts', 'UserController@userAllAccounts');
    // Matches "/api/userSingleAccount/1 
    $router->get('user/accounts/{id}', 'UserController@userSingleAccount');


    // Matches "/api/instagram
    $router->post('instagram/getAccountFollowers', 'InstagramController@getAccountFollowers');
    $router->post('instagram/getAccountFollowings', 'InstagramController@getAccountFollowings');

    $router->post('storeUserAccount', 'UserController@storeUserAccount');
});