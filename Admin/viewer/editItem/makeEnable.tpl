<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("View_Child_File")){
	die("File not Found!");
}
$id = security::clean($_GET['id']);
$sth = $Database->Update("store", array("enable" => 1), " id = '$id'");
if(count($sth) > 0){
	$_SESSION['Messege'] = '<div class="alert alert-success"><strong>Success!</strong> Enable Successfuly :)</div>';
	header("location: ". URL."?go=editItem");
} else {
	$error = '<div class="alert alert-danger"><strong>Danger!</strong> Erroe in Database.</div>';
}

if (isset($error)){
	$_SESSION['Messege'] = $error;
	header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>