<?php

namespace App\Http\Controllers;


require_once __DIR__.'/../../../instagram/vendor/autoload.php';

use App\UserAccount;
use Illuminate\Http\Request;
use Phpfastcache\Helper\Psr16Adapter;


class ExampleController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * @param  Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function masslike(Request $request)
    {
        http://lumen/masslike?username=shtanka.shop&count=10&userAccount=6
        //validate incoming request
        $this->validate($request, [
            'username' => 'required|string',
            'count'
        ]);

        $accountUsername = $request->username;
        $accountPostsCount = $request->count;

        $userAccountId = $request->userAccount;
        $userAccount = UserAccount::findOrFail($userAccountId);

        // If account is public you can query Instagram without auth
        $instagram = \InstagramScraper\Instagram::withCredentials(new \GuzzleHttp\Client(), $userAccount->username, $userAccount->password, new Psr16Adapter('Files'));
        $instagram->login();

        $medias = $instagram->getMedias($accountUsername, $accountPostsCount);
        $likedItems = [];

        foreach ($medias as $media) {
            $comments = $instagram->getMediaCommentsById($media->getId(), 100);
            sleep(5);
            foreach ($comments as $comment) {
                $account = $comment->getOwner();
                $accountMedias = $instagram->getMedias($account->getUsername(), 2);
                sleep(5);
                foreach ($accountMedias as $accountMedia) {
                    $instagram->like($accountMedia->getId());
                    array_push($likedItems, $accountMedia->getId());
                    sleep(15);
                }

            }
        }
        return response()->json(['data' => $likedItems]);
    }

    public function parse() {
        $image = 'uploads/image.jpg';
        $image2 = 'uploads/image2.jpg';
        $watermark = 'uploads/watermark.png';
        $this->resize_crop_image(1080, 1350, $image, $image2);
        $this->watermark($image2, $watermark);
    }

    //resize and crop image by center
    function resize_crop_image($max_width, $max_height, $source_file, $dst_dir, $quality = 100){
        $imgsize = getimagesize($source_file);
        $width = $imgsize[0];
        $height = $imgsize[1];
        $mime = $imgsize['mime'];

        switch($mime){
            case 'image/gif':
                $image_create = "imagecreatefromgif";
                $image = "imagegif";
                break;

            case 'image/png':
                $image_create = "imagecreatefrompng";
                $image = "imagepng";
                $quality = 7;
                break;

            case 'image/jpeg':
                $image_create = "imagecreatefromjpeg";
                $image = "imagejpeg";
                $quality = 80;
                break;

            default:
                return false;
                break;
        }

        $dst_img = imagecreatetruecolor($max_width, $max_height);
        $src_img = $image_create($source_file);

        $width_new = $height * $max_width / $max_height;
        $height_new = $width * $max_height / $max_width;
        //if the new width is greater than the actual width of the image, then the height is too large and the rest cut off, or vice versa
        if($width_new > $width){
            //cut point by height
            $h_point = 0;
            //copy image
            imagecopyresampled($dst_img, $src_img, 0, 0, 0, $h_point, $max_width, $max_height, $width, $height_new);
        }else{
            //cut point by width
            $w_point = 0;
            imagecopyresampled($dst_img, $src_img, 0, 0, $w_point, 0, $max_width, $max_height, $width_new, $height);
        }

        $image($dst_img, $dst_dir, $quality);

        if($dst_img)imagedestroy($dst_img);
        if($src_img)imagedestroy($src_img);
    }

    function watermark($sourcefile, $watermarkfile) {

        #
        # $sourcefile = Filename of the picture to be watermarked.
        # $watermarkfile = Filename of the 24-bit PNG watermark file.
        #


        //Get the resource ids of the pictures
        $watermarkfile_id = imagecreatefrompng($watermarkfile);

        imageAlphaBlending($watermarkfile_id, false);
        imageSaveAlpha($watermarkfile_id, true);

        $fileType = strtolower(substr($sourcefile, strlen($sourcefile)-3));

        switch($fileType) {
            case('gif'):
                $sourcefile_id = imagecreatefromgif($sourcefile);
                break;

            case('png'):
                $sourcefile_id = imagecreatefrompng($sourcefile);
                break;

            default:
                $sourcefile_id = imagecreatefromjpeg($sourcefile);
        }


        if (file_exists('uploads/image2.jpg'))
            unlink('uploads/image2.jpg');

        if (file_exists('uploads/image_marked.jpg'))
            unlink('uploads/image_marked.jpg');


        //Get the sizes of both pix
        $sourcefile_width=imageSX($sourcefile_id);
        $sourcefile_height=imageSY($sourcefile_id);
        $watermarkfile_width=imageSX($watermarkfile_id);
        $watermarkfile_height=imageSY($watermarkfile_id);

        $dest_x = ( $sourcefile_width ) - ( $watermarkfile_width );
        $dest_y = 0;

        // if a gif, we have to upsample it to a truecolor image
        if($fileType == 'gif') {
            // create an empty truecolor container
            $tempimage = imagecreatetruecolor($sourcefile_width,
                $sourcefile_height);

            // copy the 8-bit gif into the truecolor image
            imagecopy($tempimage, $sourcefile_id, 0, 0, 0, 0,
                $sourcefile_width, $sourcefile_height);

            // copy the source_id int
            $sourcefile_id = $tempimage;
        }

        imagecopy($sourcefile_id, $watermarkfile_id, $dest_x, $dest_y, 0, 0,
            $watermarkfile_width, $watermarkfile_height);


        //Create a jpeg out of the modified picture
        switch($fileType) {

            // remember we don't need gif any more, so we use only png or jpeg.
            // See the upsaple code immediately above to see how we handle gifs
            case('png'):
                header("Content-type: image/png");
                imagepng ($sourcefile_id, 'uploads/image_marked.jpg');
                break;

            default:
                header("Content-type: image/jpg");
                imagejpeg ($sourcefile_id, 'uploads/image_marked.jpg');
        }

        imagedestroy($sourcefile_id);
        imagedestroy($watermarkfile_id);

    }

}
