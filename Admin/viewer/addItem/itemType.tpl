<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("View_Child_File")){
	die("File not Found!");
}
echo '<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>';
echo '
<script>
function fill(Value) {
   $("#search").val(Value);
   $("#display").hide();
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
		<li class="breadcrumb-item">
		  <a href="<?=URL?>?go=addItem">Rappelz Revolution Store</a>
		</li>
		<li class="breadcrumb-item active">Item</li>
	  </ol>
	  <div class="row">
		<div class="col-12">
			<div class="card-body">
				<form action="<?=URL?>?go=addItem" method="POST">
					<?=(isset($_SESSION['Messege']) ? $_SESSION['Messege'] : "")?>
					<?php unset($_SESSION['Messege']);?>
					<?=(isset($error) == true )? $error : ""?>
					<input type="hidden" name="type" value="item">
					<div class="form-group">
						<label for="search">ID Item</label>
						<input class="form-control" id="search" name="code" type="text" aria-describedby="emailHelp" placeholder="Enter name of Item">
						<div id="display"></div>
					</div>
					  
					<div class="form-group">
						<label for="count">Count</label>
						<input class="form-control" id="count" name="count" type="text" placeholder="Enter the count of item">
					</div>
					  
					<div class="form-group">
						<label for="Price">Price</label>
						<input class="form-control" id="Price" name="price" type="text" placeholder="Enter the Price of item">
					</div>
					
					<div class="form-group">
						<label for="type">Type Item</label>
						<select class="form-control" id="type" name="typeDb">
							<option value="offer">Offor</option>
							<option value="item_supplie">General Supplies</option>
							<option value="item_summon">General Summon</option>
							<option value="item_weaponOne">Weapon Own Hand</option>
							<option value="item_weaponTwo">Weapon Two Hand</option>
							<option value="item_armor">Armor</option>
							<option value="item_boot">Boots</option>
							<option value="item_gloves">Gloves</option>
							<option value="item_helmets">Helmets</option>
							<option value="item_decor">Decorations</option>
						</select>
					</div>
					
					<input type="submit" class="btn btn-primary btn-block" value="Add" />				
				</form>
			</div>
		</div>
	  </div>
	</div>