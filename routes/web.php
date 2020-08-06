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
    $router->get('users/{id}', 'UserController@singleUser');
    // Matches "/api/users
    $router->get('users', 'UserController@allUsers');


    // Matches "/api/user/accounts
    $router->get('user/accounts', 'UserController@allUserAccounts');
    // Matches "/api/user/accounts/1 
    $router->get('user/accounts/{id}', 'UserController@singleUserAccount');
    // Matches "/api/user/accounts 
    $router->post('user/accounts', 'UserController@storeUserAccount');

    
    // Matches "/api/workers
    $router->get('workers', 'WorkerController@allWorkers');
    // Matches "/api/worker/1 
    $router->get('workers/{id}', 'WorkerController@singleWorker');
    // Matches "/api/user/accounts/1/workers
    $router->get('user/accounts/{id}/workers', 'WorkerController@allUserAccountWorkers');


    // Matches "/api/instagram
    $router->post('instagram/get-account-followers', 'InstagramController@getAccountFollowers');
    $router->post('instagram/get-account-followings', 'InstagramController@getAccountFollowings');

});