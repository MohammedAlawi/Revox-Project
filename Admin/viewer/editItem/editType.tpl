<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("View_Child_File")){
	die("File not Found!");
}
$id = security::clean($_GET['id']);
$data = $Database->SelectW("store", array("id" => $id));
$data2 = $Database->SelectW("item_store", array("id_store" => $id) );
//print_r($data2);
if(count($data) > 0){
	$count = count($data2);
	echo '<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>';
	echo '<script src=\'//cdn.tinymce.com/4/tinymce.min.js\'></script>';
	echo "<script>
			tinymce.init({
				selector: 'textarea',
				height: 200,
				plugins: [
					'advlist autolink link image lists charmap preview hr',
					'searchreplace wordcount visualblocks visualchars code insertdatetime media',
					'save contextmenu directionality emoticons paste textcolor emoticons '
				],
				toolbar1: 'newdocument fullpage | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect',
				toolbar2: 'cut copy paste | searchreplace | bullist numlist | outdent indent blockquote | undo redo | link unlink anchor image media code | insertdatetime preview | forecolor backcolor',
				toolbar3: 'hr removeformat | subscript superscript | charmap emoticons | print fullscreen | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak restoredraft'
			});
		</script>";
	for ($i = 1; $i <= $count; $i++) {
		echo '
		<script>
			function fill(Value,id) {
				$("#search"+id).val(Value);
				$("#display"+id).hide();
			}
			$(document).ready(function() {
			   $("#search"+'.$i.').keyup(function() {
				   var name = $("#search" + '.$i.').val();
				   if (name == "") {
					   $("#display"+'.$i.').html("");
				   } else {
					   $.ajax({
						   type: "POST",
						   url: "'.URL.'?data=getItem",
						   data: {
							   "search'.$i.'": name,
							   "count": '.$i.',
							   "random" : true
						   },
						   success: function(html) {
								$("#display"+'.$i.').html(html).show();
								$("#dropDown"+'.$i.').css("display", "flow-root");
								$("#dropDown"+'.$i.').css("list-style-type", "none");
								$("#dropDown"+'.$i.').css("left", "unset");
								$("#dropDown"+'.$i.').css("top", "unset");
						   }
			 
					   });
				   }
			   });
			});
			</script>
		';
	}
	?>
	<style>
	.card-body{width: 80%;margin: 0 auto;}
	</style>	
	<div class="container-fluid">
	  <!-- Breadcrumbs-->
	  <ol class="breadcrumb">
		<li class="breadcrumb-item">
		  <a href="<?=URL?>?go=Home">Home</a>
		</li>
		<li class="breadcrumb-item">
		  <a href="<?=URL?>?go=editItem">Edit item</a>
		</li>
		<li class="breadcrumb-item active"><?=$data[0]['name']?></li>
	  </ol>
	  <div class="row">
		<div class="col-12">
			<div class="card-body">
				<?=(isset($_SESSION['Messege']) ? $_SESSION['Messege'] : "")?>
				<?php unset($_SESSION['Messege']);?>
				<?=(isset($error) == true )? $error : ""?>
				<form action="<?=URL?>?go=editItem" method="POST">
					<input type="hidden" name="id" value="<?= $data[0]['id'] ?>">
					<input type="hidden" name="type" value="randomItem">
					<input type="hidden" name="countItem" value="<?=$count?>">
					<div class="form-group">
						<label for="Title">Title of the item</label>
						<input class="form-control" id="Title" name="title" type="text" value="<?=$data[0]['name']?>" placeholder="Enter the Title of the item">
					</div>
					<div class="form-group">
						<label for="Description">Description of the item</label>
						<textarea id="mytextarea" name="desc"><?=$data[0]['desc']?></textarea>
					</div>
					<?php
					for ($i = 0; $i < $count; $i++) {
						?>
						<div class="form-group">
							<label >Item <?= $i + 1 ?></label>
							<input class="form-control" id="search<?=$i + 1?>" value="<?=$data2[$i]['code']?>" style="display: inline;width: 48%;" placeholder="Code" name="code<?= $i + 1 ?>" required>
							<input class="form-control" style="display: inline;width: 45%;" value="<?=$data2[$i]['count']?>" placeholder="Count" name="count<?= $i + 1 ?>" required >
							<div id="display<?= $i + 1 ?>"></div>
						</div>
					<?php } ?>
					  
					<div class="form-group">
						<label for="Price">Price</label>
						<input class="form-control" id="Price" name="price" value="<?=$data[0]['price']?>" type="text" placeholder="Enter the Price of item">
					</div>
					
					<div class="form-group">
						<label for="img">Img for item</label>
						<input class="form-control" id="img" name="img" value="<?=$data[0]['img']?>" type="text" placeholder="Enter the img of item">
					</div>
					
					<div class="form-group">
						<label for="type">Type Item</label>
						<select class="form-control" id="type" name="typeDb">
							<option value="" selected disabled hidden><?=$data[0]['type']?></option>
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
					
					<input type="submit" class="btn btn-primary btn-block" value="Edit" />
				</form>
			</div>
		</div>
	</div>
	</div>
<?php } else {
	header("location: " . URL . "?go=editItem");
} ?>
