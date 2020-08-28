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
     * Get all Workers.
     *
     * @return Response
     */
    public function allWorkers()
    {
         return response()->json(['result' =>  Worker::all()], 200);
    }

    /**
     * Get one Worker.
     *
     * @return Response
     */
    public function singleWorker($id)
    {
        try {
            $worker = Worker::findOrFail($id);

            return response()->json(['worker' => $worker], 200);

        } catch (\Exception $e) {

            return response()->json(['message' => 'Worker not found!'], 404);
        }

    }

    /**
     * Get all User Workers.
     *
     * @return Response
     */
    public function allUserAccountWorkers($id)
    {
         return response()->json(['result' =>  UserAccount::find($id)->workers], 200);
    }

}
