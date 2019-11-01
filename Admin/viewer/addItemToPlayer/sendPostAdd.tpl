<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("View_Child_File")){
	die("File not Found!");
}
$account_id = security::clean($_POST['account_id']);
$code = security::clean($_POST['code']);
$count = security::clean($_POST['count']);
if(!empty($account_id) AND !empty($code) AND !empty($count) ) {
	$player = new Player();
	$accountData = $player->getCharacterData($account_id);
	$addItem = $player->addItem($account_id, $code, $count, "Admin");
	if(count($addItem) > 0 ){
		$_SESSION['Messege'] = '<div class="alert alert-success"><strong>Success!</strong> Send Item to  ('.$accountData[0]['name'].') Successfuly :)</div>';
		header("location: ". URL."?go=addItemToPlayer");
	} else {
		$error = '<div class="alert alert-danger"><strong>Danger!</strong> Erroe in Database.</div>';
	}
} else {
	$error = '<div class="alert alert-danger"><strong>Danger!</strong> One or more field empty .</div>';
}

if (isset($error)){
	$_SESSION['Messege'] = $error;
	header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>