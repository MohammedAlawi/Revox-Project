<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
require "config.php";
ob_start();
if(isset($_GET['id']) or isset($_SESSION['dataPlay'])){
    function __autoload($class) {
        require 'include/' . $class . ".php";
    }
    $getID = security::clean($_GET['id']);
    $site = security::clean($_GET['go']);
    
    $login = new LoginCheack();
    if(isset($_SESSION['expire']) AND ($_SESSION['expire'] > time()) AND isset($_SESSION['dataPlay'])){
		$data = $_SESSION['dataPlay'];
        $point = $login->CheackAcoount($data[0]['account_id'])[0]['point'];
        if(count($data) > 0){
            define("Vewi_TPL_File", true);
			$Database = new querydb();
			include 'viewer/header.tpl';
			if (isset($site)) {
				if (file_exists("viewer/$site/index.tpl")) {
					include "viewer/$site/index.tpl";
				} else {
					include 'viewer/newOffers/index.tpl';
				}
			} else {
				include 'viewer/newOffers/index.tpl';
			}
			include 'viewer/foteer.tpl';

        } else{
			unset($_SESSION['expire']);
			unset($_SESSION['dataPlay']);
            echo "Authentication Error!1";
        }

    } else {
		unset($_SESSION['expire']);
		unset($_SESSION['dataPlay']);
        $check = $login->Login($getID);
        if($check === true){
            $_SESSION['expire'] = time() + TIME_STILL_LOGIN;
            $_SESSION['dataPlay'] = $login->getData();
            $point = $login->CheackAcoount($_SESSION['dataPlay'][0]['account_id'])[0]['point'];
			define("Vewi_TPL_File", true);
			$Database = new querydb();
            include 'viewer/header.tpl';
			if (isset($site)) {
				if (file_exists("viewer/$site/index.tpl")) {
					include "viewer/$site/index.tpl";
				} else {
					include 'viewer/newOffers/index.tpl';
				}
			} else {
				include 'viewer/newOffers/index.tpl';
			}
			include 'viewer/foteer.tpl';
        } else {
            echo "<center>Authentication Error! <br> Please close the shop and open it again</center>";
        }
    }    
} else {
    echo "Please Open inside Clinet !";
}
ob_end_flush();
?>
