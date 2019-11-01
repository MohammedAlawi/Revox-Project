<?php
require 'paypal/vendor/autoload.php';
require 'config.php';
define("SITE_URL" , URL);
//Sesuaikan dengan URL anda...

$apiContext  = new \PayPal\Rest\ApiContext(
    new \PayPal\Auth\OAuthTokenCredential(
		ClientID,
		ClientSecret
    )
);

$apiContext->setConfig(
        array(
            'mode' => MOD_PAYPAL
			)
		);