<?php
require __DIR__ . '/../vendor/autoload.php';

use Phpfastcache\Helper\Psr16Adapter;

$login = $argv[1];
$password = $argv[2];

$instagram = \InstagramScraper\Instagram::withCredentials($login, $password, new Psr16Adapter('Files'));
$instagram->login();
sleep(2); // Delay to mimic user

$username = $argv[3];
$followers = [];
$account = $instagram->getAccount($username);
sleep(1);
$followers = $instagram->getFollowers($account->getId(), 100, 100, true); // Get 1000 followers of 'kevin', 100 a time with random delay between requests
echo json_encode($followers, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT | JSON_UNESCAPED_SLASHES);