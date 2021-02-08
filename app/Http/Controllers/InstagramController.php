<?php

namespace App\Http\Controllers;

require_once __DIR__.'/../../../instagram/vendor/autoload.php';

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
     * @return \Illuminate\Http\JsonResponse
     */
    public function getAccountByUsername(Request $request)
    {
        //validate incoming request
        $this->validate($request, [
            'username' => 'required|string',
        ]);

        $accountUsername = $request->username;


        // If account is public you can query Instagram without auth
        $instagram = new \InstagramScraper\Instagram(new \GuzzleHttp\Client());
        $account = $instagram->getAccount($accountUsername);




        return response()->json(['data' => [
                'id' => $account->getId(),
                'username' => $account->getUsername(),
                'full_name' => $account->getFullName(),
                'biography' => $account->getBiography(),
                'profile_picture_url' => $account->getProfilePicUrl(),
                'external_link' => $account->getExternalUrl(),
                'number_published_posts' => $account->getMediaCount(),
                'number_followers' => $account->getFollowsCount(),
                'number_follows' => $account->getFollowedByCount(),
                'is_private' => $account->isPrivate(),
                'is_verified' => $account->isVerified(),
            ], 'code' => 1], 200);
    }

    /**
     * @param  Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function getAccountPostsByUsername(Request $request)
    {
        //validate incoming request
        $this->validate($request, [
            'username' => 'required|string',
            'count'
        ]);

        $accountUsername = $request->username;
        $accountPostsCount = $request->count;

        // If account is public you can query Instagram without auth
        $instagram = new \InstagramScraper\Instagram(new \GuzzleHttp\Client());

        $medias = $instagram->getMedias($accountUsername, $accountPostsCount);
        $mediasItems = [];

        foreach ($medias as $media) {
            array_push($mediasItems, [
                'imageHref' => $media->getImageHighResolutionUrl(),
                'likesCount' => $media->getLikesCount(),
                'commentsCount' => $media->getCommentsCount(),

            ]);
        }
        return response()->json(['data' => $mediasItems]);
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
