<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("Vewi_TPL_File")){
	die("File not Found!");
}
$refData = parse_url($_SERVER['HTTP_REFERER']);
if ($refData['host'] == REF_HOST AND $refData['scheme'] == REF_SCHEME){
	
	$name = security::clean(@$_POST['name']);
	
	if(strlen($name) > 2){
		$query = new DatabaseSQL();
		$sth = $query->prepare("SELECT top 5 name,account_id FROM [".DB_TELECASTER."].[dbo].[Character] WITH(NOLOCK) WHERE name  not like '@%' and name like N'%$name%'");
		$sth->setFetchMode(PDO::FETCH_ASSOC);
		$sth->execute();
		$data = $sth->fetchAll();
		if(count($data) > 0){
			echo '<ul class="dropdown-menu" role="menu" id="dropDownName">';
			while($row = array_shift($data)){
				echo "<li onclick='fillName(". $row['account_id'].")'><a class='nav-link'>".$row['name'];
				
				echo "</a></li>";
			}
			echo "</ul>";
		}
		
		unset($sth);
	} else {
		
	}
} else {
	http_response_code(404);
	exit;
}
?>
