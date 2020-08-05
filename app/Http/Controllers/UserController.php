<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\UserAccount;

use Illuminate\Support\Facades\Auth;

class UserController extends Controller
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
     * Get the authenticated User.
     *
     * @return Response
     */
    public function profile()
    {
        return response()->json(['user' => Auth::user()], 200);
    }

    /**
     * Get all User.
     *
     * @return Response
     */
    public function allUsers()
    {
         return response()->json(['users' =>  User::all()], 200);
    }

    /**
     * Get one user.
     *
     * @return Response
     */
    public function singleUser($id)
    {
        try {
            $user = User::findOrFail($id);

            return response()->json(['user' => $user], 200);

        } catch (\Exception $e) {

            return response()->json(['message' => 'User not found!'], 404);
        }

    }

    /**
     * Get all User Accounts.
     *
     * @return Response
     */
    public function userAllAccounts()
    {
         return response()->json(['userAccounts' =>  User::find(Auth::id())->userAccounts], 200);
    }

    /**
     * Get one User Account.
     *
     * @return Response
     */
    public function userSingleAccount($id)
    {
        try {
            $userAccount = UserAccount::findOrFail($id);

            return response()->json(['userAccount' => $userAccount], 200);

        } catch (\Exception $e) {

            return response()->json(['message' => 'User account not found!'], 404);
        }

    }
}
