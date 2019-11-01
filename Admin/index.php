<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
require "config.php";
ob_start();
function __autoload($class) {
	require 'include/' . $class . ".php";
}
define("Vewi_TPL_File", true);
$Database = new querydb();
if(isset($_SESSION['loginAdmin']) AND $_SESSION['loginAdmin'] === true){
	$site = security::clean(@$_GET['go']);
	if(isset($_GET['data'])) {
		if($_GET['data'] == 'getItem')
			include 'viewer/GetItem/index.tpl';
		else
			include 'viewer/getAccount/index.tpl';
	} else {
		include 'viewer/header.tpl';
		if (isset($site)) {
			if (file_exists("viewer/$site/index.tpl")) {
				include "viewer/$site/index.tpl";
			} else {
				include 'viewer/Home/index.tpl';
			}
		} else {
			include 'viewer/Home/index.tpl';
		}
		include 'viewer/foteer.tpl';
	}	
} else {
	include 'viewer/login/index.tpl';
}
ob_end_flush();
?>
