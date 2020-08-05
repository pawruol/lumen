<?php

namespace App\Jobs;

use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

use Phpfastcache\Helper\Psr16Adapter;

class InstagramGetAccountFollowingsJob extends Job implements ShouldQueue
{
    protected $userUsername;
    protected $userPassword;
    protected $psr16Adapter;

    protected $accountUsername;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($userUsername, $userPassword, $accountUsername)
    {
        $this->userUsername = $userUsername;
        $this->userPassword = $userPassword;
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
        $instagram = \InstagramScraper\Instagram::withCredentials($this->userUsername, $this->userPassword, $this->psr16Adapter);
        $instagram->login();
        sleep(2);

        $followings = [];
        $account = $instagram->getAccount($this->accountUsername);
        sleep(1);
        $followings = $instagram->getFollowing($account->getId(), 100, 100, true);

        info(json_encode($followings, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));
        return true;
    }
}
