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
        return response()->json(['data' => Auth::user(), 'code' => 1], 200);
    }

    /**
     * Get all User Accounts.
     *
     * @return Response
     */
    public function allAccounts()
    {
         return response()->json(['data' =>  User::find(Auth::id())->userAccounts, 'code' => 1], 200);
    }

    /**
     * Get one User Account.
     *
     * @return Response
     */
    public function singleAccount($id)
    {
        try {
            $userAccount = UserAccount::where([
                ['user_id', '=', Auth::id()],
                ['id', '=', $id]
            ])->firstOrFail();;

            return response()->json(['data' => $userAccount, 'code' => 1], 200);

        } catch (\Exception $e) {

            return response()->json(['message' => 'User account not found!', 'code' => 0], 404);
        }

    }

    /**
     * Store a new user account.
     *
     * @param  Request  $request
     * @return Response
     */
    public function storeAccount(Request $request)
    {
        //validate incoming request
        $this->validate($request, [
            'type' => 'required|string',
            'username' => 'required|string',
            'password' => 'required|string',
        ]);

        try {
            $userAccount = new UserAccount;
            $userAccount->username = $request->input('username');
            $userAccount->type = $request->input('type');
            $userAccount->password = $request->input('password');
            $userAccount->user_id = Auth::id();
            $userAccount->save();

            //return successful response
            return response()->json(['data' => $userAccount, 'code' => 1], 201);
        } catch (\Exception $e) {
            //return error message
            return response()->json(['message' => 'User account store failed!', 'code' => 0], 409);
        }

    }
}
