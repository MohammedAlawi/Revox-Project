<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("Vewi_TPL_File")){
	die("File not Found!");
}
?>
<style>
.card-body{width: 50%;margin: 0 auto;}
</style>
<?php
if(!isset($_GET['type']) and !isset($_POST['type'])){
	echo '<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>';
echo '
<script>
function fill(Value) {
   $("#search").val(Value);
   $("#display").hide();
}
function fillName(Value) {
   $("#account_id").val(Value);
   $("#displayName").hide();
}
$(document).ready(function() {
   $("#search").keyup(function() {
	   var name = $("#search").val();
	   if (name == "") {
		   $("#display").html("");
	   } else {
		   $.ajax({
			   type: "POST",
			   url: "'.URL.'?data=getItem",
			   data: {
				   search: name
			   },
			   success: function(html) {
					$("#display").html(html).show();
					$("#dropDown").css("display", "flow-root");
					$("#dropDown").css("list-style-type", "none");
					$("#dropDown").css("left", "unset");
					$("#dropDown").css("top", "unset");
			   }
 
		   });
	   }
   });
   
   $("#account_id").keyup(function() {
	   var name = $("#account_id").val();
	   if (name == "") {
		   $("#displayName").html("");
	   } else {
		   $.ajax({
			   type: "POST",
			   url: "'.URL.'?data=getAccount",
			   data: {
				   name: name
			   },
			   success: function(html) {
					$("#displayName").html(html).show();
					$("#dropDownName").css("display", "flow-root");
					$("#dropDownName").css("list-style-type", "none");
					$("#dropDownName").css("left", "unset");
					$("#dropDownName").css("top", "unset");
			   }
 
		   });
	   }
   });
});
</script>
';
?>
<div class="container-fluid">
	  <!-- Breadcrumbs-->
	  <ol class="breadcrumb">
		<li class="breadcrumb-item">
		  <a href="<?=URL?>?go=Home">Home</a>
		</li>
		<li class="breadcrumb-item active">Send item to player</li>
	  </ol>
	  <div class="row">
		<div class="col-12">
			<div class="card-body">
				<form action="<?=URL?>?go=addItemToPlayer" method="POST">
					<?=(isset($_SESSION['Messege']) ? $_SESSION['Messege'] : "")?>
					<?php unset($_SESSION['Messege']);?>
					<?=(isset($error) == true )? $error : ""?>
					<input type="hidden" name="type" value="item">
					
					<div class="form-group">
						<label for="account_id">Account Id</label>
						<input class="form-control" id="account_id" name="account_id" type="text" aria-describedby="emailHelp" placeholder="Enter name of player">
						<div id="displayName"></div>
					</div>
					
					<div class="form-group">
						<label for="search">ID Item</label>
						<input class="form-control" id="search" name="code" type="text" aria-describedby="emailHelp" placeholder="Enter name of Item">
						<div id="display"></div>
					</div>
					  
					<div class="form-group">
						<label for="count">Count</label>
						<input class="form-control" id="count" name="count" type="text" placeholder="Enter the count of item">
					</div>
					<input type="submit" class="btn btn-primary btn-block" value="Send" />				
				</form>
			</div>
		</div>
	  </div>
	</div>
<?php
} elseif(isset($_POST['type']) ) {
	define("View_Child_File", true);
	include 'sendPostAdd.tpl';
}
?>