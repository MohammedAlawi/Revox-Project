<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
require "config.php";
require "include/Database.php";
require "include/DatabaseSQL.php";
require "include/index.php";
require "include/querydb.php";
require "include/querydbSQL.php";
require "include/LoginCheack.php";
require "include/Player.php";

use PayPal\Api\Payment;
use PayPal\Api\PaymentExecution;

require "paypal/app/start.php";
if(!isset($_GET["success"] , $_GET["paymentId"] , $_GET["PayerID"])){
	die();
}

if((bool) $_GET["success"] === false){
	die();
}

$paymentId = $_GET["paymentId"];
$payerId = $_GET["PayerID"];

$payment = Payment::get($paymentId,$apiContext );
$execute = new PaymentExecution();
$execute->setPayerId($payerId);

try {
	$result = $payment->execute($execute , $apiContext );
	$transactions = $result->getTransactions();
	$transaction = $transactions[0];
	$Database = new querydb();
	$Database->Update("charge", array("status" => $result->getState()), " invoiceNum = '".$transaction->invoice_number."'");
	
	$login = new LoginCheack();
	$data = $_SESSION['dataPlay'];
	$point = $login->CheackAcoount($data[0]['account_id'])[0]['point'];
	
	$data2 = $Database->SelectW("charge", array("invoiceNum" => $transaction->invoice_number));
	
	switch($data2[0]['price']){
		case 5: $newPoint = 50; break;
		case 10: $newPoint = 100; break;
		case 20: $newPoint = 250; break;
		case 40: $newPoint = 500; break;
		case 80: $newPoint = 1000; break;
		default: $newPoint = 0;
	}
	
	$player = new Player();
	$player->updatePoint($data[0]['account_id'], $point + $newPoint);
	
	print "Thanks for Payment";
	
} catch(Exception $e) {
	$data = json_decode($e->getData());
	echo $data->message;
	die();
}
