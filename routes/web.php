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
    //return view('index');
});

// API route group
$router->group(['prefix' => 'api'], function () use ($router) {

    // Matches "/api/register
    $router->post('register', 'AuthController@register');
    // Matches "/api/login
    $router->post('login', 'AuthController@login');

    // Matches "/api/profile
    $router->get('user', 'UserController@profile');

    // Matches "/api/user/accounts
    $router->get('user/accounts', 'UserController@allAccounts');
    // Matches "/api/user/accounts/1
    $router->get('user/accounts/{id}', 'UserController@singleAccount');
    // Matches "/api/user/accounts
    $router->post('user/accounts', 'UserController@storeAccount');

    // Matches "/api/workers
    $router->get('user/workers', 'WorkerController@allWorkers');
    // Matches "/api/workers/1
    $router->get('workers/{id}', 'WorkerController@singleWorker');
    // Matches "/api/user/accounts/1/workers
    $router->get('user/accounts/{id}/workers', 'WorkerController@allAccountWorkers');

    // Matches "/api/instagram
    $router->get('instagram/get-account-by-username', 'InstagramController@getAccountByUsername');

    $router->post('instagram/get-account-followers', 'InstagramController@getAccountFollowers');
    $router->post('instagram/get-account-followings', 'InstagramController@getAccountFollowings');

});
