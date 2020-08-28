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
         return response()->json(['result' =>  User::all()], 200);
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

            return response()->json(['result' => $user], 200);

        } catch (\Exception $e) {

            return response()->json(['message' => 'User not found!'], 404);
        }

    }

    /**
     * Get all User Accounts.
     *
     * @return Response
     */
    public function allUserAccounts()
    {
         return response()->json(['result' =>  User::find(Auth::id())->userAccounts], 200);
    }

    /**
     * Get one User Account.
     *
     * @return Response
     */
    public function singleUserAccount($id)
    {
        try {
            $userAccount = UserAccount::findOrFail($id);

            return response()->json(['userAccount' => $userAccount], 200);

        } catch (\Exception $e) {

            return response()->json(['message' => 'User account not found!'], 404);
        }

    }

    /**
     * Store a new user account.
     *
     * @param  Request  $request
     * @return Response
     */
    public function storeUserAccount(Request $request)
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
            return response()->json(['userAccount' => $userAccount, 'message' => 'User account stored!'], 201);
        } catch (\Exception $e) {
            //return error message
            return response()->json(['message' => 'User account stored failed!'], 409);
        }

    }
}
