<?php

namespace App\Jobs;

require_once __DIR__.'/../../instagram/vendor/autoload.php';

use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\File;

use App\UserAccount;
use App\Worker;

use Phpfastcache\Helper\Psr16Adapter;

class InstagramGetAccountFollowingsJob extends Job implements ShouldQueue
{
    protected $psr16Adapter;

    protected Worker $worker;
    protected UserAccount $userAccount;

    protected $accountUsername;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($userAccount, $accountUsername)
    {
        $this->userAccount = UserAccount::findOrFail($userAccount);

        $this->worker = new Worker;
        $this->worker->job = "getAccountFollowings";
        $this->worker->status = "starting";
        $this->worker->progress = 0;
        $this->worker->user_account_id = $this->userAccount->id;
        $this->worker->save();

        $this->accountUsername = $accountUsername;

        $this->psr16Adapter = new Psr16Adapter('Files');
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        $this->worker->status = "working";
        $this->worker->update();

        $instagram = \InstagramScraper\Instagram::withCredentials(new \GuzzleHttp\Client(), $this->userAccount->username, $this->userAccount->password, $this->psr16Adapter);
        $instagram->login();
        sleep(2);

        $followings = [];
        $account = $instagram->getAccount($this->accountUsername);
        sleep(1);
        $followings = $instagram->getFollowing($account->getId(), 100, 100, true);

        $filename = 'worker_result_' . uniqid() . '.json';
        $url = 'uploads/worker_results/' . $filename;
        $path = 'uploads' . DIRECTORY_SEPARATOR . 'worker_results' . DIRECTORY_SEPARATOR;
        $destinationPath = 'public' . DIRECTORY_SEPARATOR . $path;
        File::makeDirectory($destinationPath, 0777, true, true);
        File::put($destinationPath . $filename, json_encode($followings, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));

        $this->worker->status = "finished";
        $this->worker->result = $url;
        $this->worker->progress = 100;
        $this->worker->update();
    }
}
