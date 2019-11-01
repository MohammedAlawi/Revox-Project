<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
class player {
	
	public function addItem($accountId, $itemCode, $itemCount){
		$query = new querydbSQL();
		return $query->Insert(DB_BILLING, "PaidItem", array(
												"buy_id"			=> 1, 
												"account_id"		=> $accountId,
												"avatar_id"			=> 0,
												"avatar_name"		=> "",
												"server_name"		=> SERVER_NAME,
												"taken_account_id"	=> $accountId,
												"taken_avatar_id"	=> 0,
												"taken_avatar_name"	=> "",
												"taken_server_name" => "",
												"item_code"			=> $itemCode,
												"item_count"		=> $itemCount,
												"type"				=> 1,
												"rest_item_count"	=> $itemCount,
												"confirmed"			=> 1,
												"confirmed_time"	=> "9999-12-31 00:00:00.000",
												"bought_time"		=> date("Y-m-d H:i:s"),
												"valid_time"		=> "9999-12-31 00:00:00.000",
												"taken_time"		=> "9999-12-31 00:00:00.000",
												"isCancel"			=> 0
												)
							);
	}
	
	public function updatePoint($accountId, $point){
		$query = new querydbSQL();
		return $query->Update(DB_AUTH, "Account", array("point" => $point), "[account_id] = $accountId");
	}
}