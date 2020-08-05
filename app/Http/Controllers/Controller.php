<?php

namespace App\Http\Controllers;

use Laravel\Lumen\Routing\Controller as BaseController;

use Illuminate\Support\Facades\Auth;

class Controller extends BaseController
{
    protected function respondWithToken($token)
    {
        return response()->json([
            'token' => $token,
            'token_type' => 'bearer',
            'expires_in' => Auth::factory()->getTTL() * 60
        ], 200);
    }

    protected function exec_local_url($url) {
        exec('/usr/bin/wget -O - -q -t 1 "http://'. $_SERVER['HTTP_HOST'] .'/'
            . addslashes($url) . '" >/dev/null 2>&1'
        );
    }
}
