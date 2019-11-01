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
			$error = '<div class="alert alert-danger"><strong>Danger!</strong> Erroe in Database.</div>';
		}
	} else {
		$error = '<div class="alert alert-danger"><strong>Danger!</strong> One or more field empty .</div>';
	}
} else {
	$title = security::clean($_POST['title']);
	$desc = stripslashes($_POST['desc']);
	$countItem = security::clean($_POST['countItem']);
	$img = security::clean($_POST['img']);
	
	for ($i = 1; $i <= $countItem; $i++) {
		$code[$i] = security::clean($_POST['code'.$i]);
		$count[$i] = security::clean($_POST['count'.$i]);
	}
	
	if(!empty($type) AND (count($code) > 0) AND (count($count) > 0) AND !empty($price) AND !empty($typeDb) ) {
		$data = $Database->Insert("store", array(
				"name"	=> $title,
				"desc"	=> $desc,
				"img"	=> $img,
				"price"	=> $price,
				"type"	=> $typeDb,
				"enable"=> 1
			) );
		$sth = $Database->SelectWhere("store", " id > 0 order by id desc limit 1 ");
		for ($i = 1; $i <= $countItem; $i++) {
			$sth2 = $Database->Insert("item_store", array("id_store" => $sth[0]['id'], "code" => $code[$i], "count" => $count[$i]));
		}
		if(count($sth2) > 0 AND count($data) > 0 ){
			$_SESSION['Messege'] = '<div class="alert alert-success"><strong>Success!</strong> Add item ('.$title.') Successfuly :)</div>';
			header("location: ". URL."?go=addItem&type=randomItem");
		} else {
			$error = '<div class="alert alert-danger"><strong>Danger!</strong> Erroe in Database.</div>';
		}
	} else {
		$error = '<div class="alert alert-danger"><strong>Danger!</strong> One or more field empty .</div>';
	}
}
if (isset($error)){
	$_SESSION['Messege'] = $error;
	header('Location: ' . $_SERVER['HTTP_REFERER']);
}
?>