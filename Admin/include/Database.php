<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
class Database extends PDO {

    function __construct() {
        try {
            parent::__construct('mysql:host=' . DB_HOST . ';dbname=' . DB_NAME . ';charset=utf8', DB_USER, DB_PASS, array(
				PDO::ATTR_TIMEOUT => 10,
                PDO::ATTR_EMULATE_PREPARES=>false,
                PDO::MYSQL_ATTR_DIRECT_QUERY=>false,
                PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION
            ));
            
        } catch (Exception $ex) {
			if(DEV_MODE === true){
				echo "The Error : " . $ex->getMessage() . "<br />";
				echo "The Error in : " . $ex->getFile() . "<br />";
				echo "Line : " . $ex->getLine() . "<br />";
			} else {
				echo "[100]The System has some error, Please contact with Administrator!";
			}
            die;
        }
    }
}
