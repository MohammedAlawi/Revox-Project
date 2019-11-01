<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
class LoginCheack extends querydbSQL {
    var $accountId = "";
    var $avatarId = "";
    var $passWord = "";

    function __construct() {
        parent::__construct();
    }
    
    function Login($id) {
        if (strlen($id) == 40) {
            $seed = hexdec(substr($id, 0, 8));
            $avatar_id = hexdec(substr($id, 8, 8));
            $account_id = hexdec(substr($id, 16, 8));
            $password = hexdec(substr($id, 24, 8));
            $checksum = hexdec(substr($id, 32, 8));
            $avatar_id ^= 0xD8FB51A9;
            $account_id ^= 0x9DC720AC;
            $password ^= 0x31F42CB7;
            $checksum ^= 0x7F9B3D2E;

            $checksum ^= $password;
            $password ^= $account_id;
            $account_id ^= $avatar_id;
            $avatar_id ^= $seed;

            if ($checksum == $avatar_id + $account_id + $password) {
				$checkLogin = $this->checkLogin($account_id, $password, $avatar_id);
             
				if(count($checkLogin) == 0)
                    return false;
                if(count($this->CheackAcoount($password)) == 0)
                    return false;
                
				
				$this->avatarId = $account_id;
                $this->accountId = $password;
                $this->passWord = $avatar_id;
                return true;
            }
        }
    }
    
    function checkLogin($avatar_id, $account_id, $password){
		$query = new DatabaseSQL();
        $sth = $query->prepare("SET NOCOUNT ON;USE [" . DB_TELECASTER . "]; EXEC shop_login $avatar_id,$account_id,$password");
        $sth->execute();
        $data = $sth->fetchAll(PDO::FETCH_ASSOC);
        return $data;
	}
	
    function CheackAcoount($accountId){
		return $this->SelectW(DB_AUTH, "Account", array("account_id" => $accountId));
    }

    function getData(){
		return $this->SelectW(DB_AUTH, "Account", array("account_id" => $this->accountId));
    }
}
