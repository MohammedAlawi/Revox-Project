<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
require "paypal/app/start.php";
require "config.php";
require "include/Database.php";
require "include/DatabaseSQL.php";
require "include/index.php";
require "include/querydb.php";
require "include/security.php";
//require "include/config.php";

use PayPal\Api\Amount;
use PayPal\Api\Details;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\RedirectUrls;
use PayPal\Api\Transaction;

if(isset($_POST['amount'])){
	$price = security::clean($_POST['amount']);
	$price = $_POST['amount'];
	$invoiceNumber = uniqid();
	$nameServer = SERVER_NAME;
	$sku = $price.' Point - '.$invoiceNumber;
	$description = 'Point in revo server';
	$tax = 0;
	$shipping = 0;
	
	
	$payer = new Payer();
	$payer->setPaymentMethod("paypal");

	$item = new Item();
	$item->setName($nameServer)
		->setCurrency('USD')
		->setQuantity(1)
		->setSku($sku)
		->setPrice($price);
		

	$itemList = new ItemList();
	$itemList->setItems([$item]);

	$details = new Details();
	$details->setShipping($shipping)
		->setTax($tax)
		->setSubtotal($price);
		
	$amount = new Amount();
	$amount->setCurrency("USD")
		->setTotal($tax + $price)
		->setDetails($details);
		
	$transaction = new Transaction();
	$transaction->setAmount($amount)
		->setItemList($itemList)
		->setDescription($description)
		->setInvoiceNumber($invoiceNumber);
		
	$baseUrl = SITE_URL;
	$redirectUrls = new RedirectUrls();
	$redirectUrls->setReturnUrl("$baseUrl/success.php?success=true")
		->setCancelUrl("$baseUrl/success.php?success=false");
		
	$payment = new Payment();
	$payment->setIntent("sale")
		->setPayer($payer)
		->setRedirectUrls($redirectUrls)
		->setTransactions(array($transaction));
				
	$request = clone $payment;

	try {
		$payment->create($apiContext);
		$Database = new querydb();
		$Database->Insert("charge", array("account_id" => $_SESSION['dataPlay'][0]['account_id'], "invoiceNum" => $invoiceNumber, "price" => $price, "status"=> "no" ));
	}catch (Exception $ex) {
		echo $ex->getMessage();
		exit(1);
	}

	$approvalUrl = $payment->getApprovalLink();
	header("location:".$approvalUrl);
}


