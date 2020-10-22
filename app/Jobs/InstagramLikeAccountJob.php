<?php

namespace App\Jobs;

use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Support\Facades\File;

use App\UserAccount;
use App\Worker;

use Phpfastcache\Helper\Psr16Adapter;

class InstagramLikeAccountJob extends Job implements ShouldQueue
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
        $this->worker->job = "like 3 media";
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

        $instagram = \InstagramScraper\Instagram::withCredentials($this->userAccount->username, $this->userAccount->password, $this->psr16Adapter);
        $instagram->login();
        sleep(2);

// If account private you should be subscribed and after auth it will be available
        $medias = $instagram->getMedias($this->accountUsername, 5);
        $media = $medias[0];
        $media1 = $medias[1];
        $media2 = $medias[2];

        $instagram->like($media->getId());
        $instagram->like($media1->getId());
        $instagram->like($media2->getId());

        $filename = 'worker_result_' . uniqid() . '.json';
        $url = 'uploads/worker_results/' . $filename;
        $path = 'uploads' . DIRECTORY_SEPARATOR . 'worker_results' . DIRECTORY_SEPARATOR;
        $destinationPath = 'public' . DIRECTORY_SEPARATOR . $path;
        File::makeDirectory($destinationPath, 0777, true, true);
        File::put($destinationPath . $filename, json_encode('', JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES));

        $this->worker->status = "finished";
        $this->worker->result = $url;
        $this->worker->progress = 100;
        $this->worker->update();
    }
}
