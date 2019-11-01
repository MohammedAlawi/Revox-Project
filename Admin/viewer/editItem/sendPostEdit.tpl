<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("View_Child_File")){
	die("File not Found!");
}


$type = security::clean($_POST['type']);
$price = security::clean($_POST['price']);
$typeDb = security::clean($_POST['typeDb']);

if($type == "item"){
	$code = security::clean($_POST['code']);
	$count = security::clean($_POST['count']);
	if(!empty($type) AND !empty($code) AND !empty($count) AND !empty($price) AND !empty($typeDb) ) {
		$itemData = Arcadia::ItemResource($code);
		$string = Arcadia::StringResource($itemData[0]['name_id']);
		$data = $Database->Insert("store", array(
				"name"	=> $string[0]['value'],
				"desc"	=> "",
				"img"	=> $itemData[0]['icon_file_name'],
				"price"	=> $price,
				"type"	=> $typeDb,
				"enable"=> 1
			) );
		$sth = $Database->SelectWhere("store", " id > 0 order by id desc limit 1 ");
		$sth2 = $Database->Insert("item_store", array("id_store" => $sth[0]['id'], "code" => $code, "count" => $count));
		if(count($sth2) > 0 AND count($data) > 0 ){
			$_SESSION['Messege'] = '<div class="alert alert-success"><strong>Success!</strong> Add item ('.$string[0]['value'].') Successfuly :)</div>';
			header("location: ". URL."?go=addItem&type=Item");
		} else {
			$error = '<div class="alert alert-danger"><strong>Danger!</strong> Username or password is Wrong.</div>';
		}
	} else {
		$error = '<div class="alert alert-danger"><strong>Danger!</strong> One or more field empty .</div>';
	}
} else {
	$id = security::clean($_POST['id']);
	$title = security::clean($_POST['title']);
	$desc = stripslashes($_POST['desc']);
	$countItem = security::clean($_POST['countItem']);
	$img = security::clean($_POST['img']);

	$fields = array();
	$query = ' SET ';
	if (!empty($title)) {
		$fields[count($fields)] = " `name` = '$title' ";
	}
	
	if (!empty($desc)) {
		$fields[count($fields)] = " `desc` = '$desc' ";
	}
	
	if (!empty($price)) {
		$fields[count($fields)] = " `price` = '$price' ";
	}
	
	if (!empty($img)) {
		$fields[count($fields)] = " `img` = '$img' ";
	}
	
	if (!empty($typeDb)) {
		$fields[count($fields)] = " `type` = '$typeDb' ";
	}
	$fcount = count($fields);
	for ($i = 0; $i < $fcount; $i++) {
		$query .= $fields[$i];
		if ($i != ($fcount - 1))
			$query.=" , ";
	}
	
	$sthUpdateOffer = $Database->UpdateQ("store", $query . "WHERE `id` = '$id'");
	$sthId = $Database->SelectW("item_store", array("id_store" => $id));
	for ($i = 1; $i <= $countItem; $i++) {
		$code[$i] = security::clean($_POST["code$i"]);
		$count[$i] = security::clean($_POST["count$i"]);
		$sthUpdateItem = $Database->UpdateQ("item_store", " SET `code` = '$code[$i]' , `count` = '$count[$i]' WHERE `sid` = '" . $sthId[$i - 1]['sid'] . "'");
	}
	
	if(count($sthUpdateOffer) > 0 AND count($sthUpdateItem) > 0 ){
		$_SESSION['Messege'] = '<div class="alert alert-success"><strong>Success!</strong> Edit item ('.$title.') Successfuly :)</div>';
		header("location: ". URL."?go=editItem&type=edit&id=".$id);
	} else {
		$error = '<div class="alert alert-danger"><strong>Danger!</strong> Erroe in Database.</div>';
	}	
}
if (isset($error)){
	$_SESSION['Messege'] = $error;
	header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>