<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\UserAccount;
use App\Worker;

use Illuminate\Support\Facades\Auth;

class WorkerController extends Controller
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
     * Get one Worker.
     *
     * @return Response
     */
    public function singleWorker($id)
    {
        try {

            $userWorker = null;
            $userAccounts = User::find(Auth::id())->userAccounts;
            foreach ($userAccounts as $userAccount) {
                foreach (UserAccount::find($userAccount->id)->workers as $worker) {
                    if ($worker->id == $id)
                        $userWorker = $worker;
                }
            }

            if ($userWorker == null) {
                return response()->json(['message' => 'Worker not found!', 'code' => 0], 404);
            }

            return response()->json(['data' => $userWorker, 'code' => 1], 200);

        } catch (\Exception $e) {

            return response()->json(['message' => 'Worker not found!', 'code' => 0], 404);
        }

    }

    /**
     * Get all User Account Workers.
     *
     * @return Response
     */
    public function allAccountWorkers($id)
    {
         return response()->json(['data' =>  UserAccount::find($id)->workers, 'code' => 1], 200);
    }

    /**
     * Get all User Workers.
     *
     * @return Response
     */
    public function allWorkers()
    {
        $userWorkers = [];
        $userAccounts = User::find(Auth::id())->userAccounts;
        foreach ($userAccounts as $userAccount) {
            foreach (UserAccount::find($userAccount->id)->workers as $worker) {
                array_push($userWorkers, $worker);
            }
        }

        return response()->json(['data' =>  $userWorkers, 'code' => 1], 200);
    }

}
