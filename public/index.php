<?php
require_once 'vendor/autoload.php';

use danog\MadelineProto\API;
use danog\MadelineProto\Logger;

$settings = [
    'app_info' => [
        'api_id' => 123456, // replace with your API ID
        'api_hash' => 'your_api_hash_here', // replace with your API Hash
    ],
    'logger' => [
        'logger_level' => Logger::ERROR
    ]
];

$MadelineProto = new API('session.madeline', $settings);
$MadelineProto->start();

$me = $MadelineProto->getSelf();
echo "Logged in as @" . $me['username'] . PHP_EOL;

$MadelineProto->setEventHandler(function ($update) use ($MadelineProto) {
    if (isset($update['_']) && $update['_'] === 'updateNewChannelMessage') {
        $msg = $update['message'];
        $from = $msg['to_id']['channel_id'] ?? null;
        $text = $msg['message'] ?? '';

        if ($from && $text) {
            // Replace with your target channel username or ID
            $MadelineProto->messages->sendMessage([
                'peer' => '@YourTargetChannel', 
                'message' => $text
            ]);
        }
    }
});
?>