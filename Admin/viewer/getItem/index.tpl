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
	
	$random = security::clean(@$_POST['random']);
	$count = security::clean(@$_POST['count']);
	if(isset($random) and $random == true){
		for ($i = 1; $i <= $count; $i++) {
			$search = security::clean(@$_POST['search'.$i]);
		}
	} else {
		$search = security::clean($_POST['search']);
	}		
	if(strlen($search) > 2){
		if(GET_DATA_ITEM_FROM_SQLSERVER === true) {
			$query = new DatabaseSQL();
			$sth = $query->prepare("SELECT top 5 id,value,enhance FROM [".DB_ARCADIA."].[dbo].[".TABLE_StringResource."] s WITH(NOLOCK),[".DB_ARCADIA."].[dbo].[ItemResource] i WITH(NOLOCK) WHERE i.name_id = s.code and s.value like N'%$search%'");
		} else {
			$query = new Database();	
			$sth = $query->prepare("SELECT id,value,enhance FROM ".TABLE_StringResource." s ,ItemResource i WHERE i.name_id = s.code and s.value like N'%$search%' limit 0,5");			
		}
		$sth->setFetchMode(PDO::FETCH_ASSOC);
		$sth->execute();
		$data = $sth->fetchAll();
		if(count($data) > 0){
			echo '<ul class="dropdown-menu" role="menu" id="dropDown'.$count.'">';
			while($row = array_shift($data)){
				echo "<li onclick='fill(". $row['id'].",".$count.")'><a class='nav-link'>".$row['value'];
				if($row['enhance'] > 0)
					echo " +".$row['enhance'];
				
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
