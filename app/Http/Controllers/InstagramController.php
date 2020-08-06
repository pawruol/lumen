<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\UserAccount;
use App\Worker;
use App\Jobs\InstagramGetAccountFollowersJob;
use App\Jobs\InstagramGetAccountFollowingsJob;

use Illuminate\Support\Facades\Auth;

class InstagramController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * @param  Request  $request
     * @return Response
     */
    public function getAccountFollowers(Request $request)
    {
        //validate incoming request 
        $this->validate($request, [
            'username' => 'required|string',
            'userAccount' => 'required|integer',
        ]);
        
        $userAccount = $request->userAccount;
        $accountUsername = $request->username;

        $job = (new InstagramGetAccountFollowersJob($userAccount, $accountUsername));
        $this->dispatch($job);

        return true;
    }

    /**
     * @param  Request  $request
     * @return Response
     */
    public function getAccountFollowings(Request $request)
    {
        //validate incoming request 
        $this->validate($request, [
            'username' => 'required|string',
            'userAccount' => 'required|integer',
        ]);
        
        $userAccount = $request->userAccount;
        $accountUsername = $request->username;

        $job = (new InstagramGetAccountFollowingsJob($userAccount, $accountUsername));
        $this->dispatch($job);

        return true;
    }
}
