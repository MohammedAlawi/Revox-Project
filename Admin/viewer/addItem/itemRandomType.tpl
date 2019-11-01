<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("View_Child_File")){
	die("File not Found!");
}
if(!isset($_GET['count'])) {
?>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script>
	$(function () {
		$('#select1').on('change', function () {
			var url = $(this).val();
			if (url) {
				window.location = "<?= URL ?>?go=addItem&type=randomItem&count=" + url;
			}
			return false;
		});
	});
	</script>
		<div class="container-fluid">
		  <!-- Breadcrumbs-->
		  <ol class="breadcrumb">
			<li class="breadcrumb-item">
			  <a href="<?=URL?>?go=Home">Home</a>
			</li>
			<li class="breadcrumb-item">
			  <a href="<?=URL?>?go=addItem">Rappelz Revolution Store</a>
			</li>
			<li class="breadcrumb-item active">Random Item</li>
		  </ol>
		  <div class="row">
			<div class="col-12">
				<?=(isset($_SESSION['Messege']) ? $_SESSION['Messege'] : "")?>
				<?php unset($_SESSION['Messege']);?>
				<?=(isset($error) == true )? $error : ""?>
				<label >Add New Offer (Rand)</label>
				<select class="form-control" id="select1">
					<option value="" selected>Number of tools</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
					<option value="7">7</option>
					<option value="8">8</option>
					<option value="9">9</option>
					<option value="10">10</option>
				</select>
			</div>
		  </div>
		</div>
	<?php } else { 
		if( ((int)$_GET['count'] > 0) AND ((int)$_GET['count'] <=10) ){
			$count = security::clean($_GET['count']);
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
				  <a href="<?=URL?>?go=addItem">Rappelz Revolution Store</a>
				</li>
				<li class="breadcrumb-item">
				  <a href="<?=URL?>?go=addItem&type=randomItem">Random Item</a>
				</li>
				<li class="breadcrumb-item active"><?=$count?></li>
			  </ol>
			  <div class="row">
				<div class="col-12">
					<div class="card-body">
						<form action="<?=URL?>?go=addItem" method="POST">
							<input type="hidden" name="type" value="randomItem">
							<input type="hidden" name="countItem" value="<?=$count?>">
							<div class="form-group">
								<label for="Title">Title of the item</label>
								<input class="form-control" id="Title" name="title" type="text" placeholder="Enter the Title of the item">
							</div>
							<div class="form-group">
								<label for="Description">Description of the item</label>
								<textarea id="mytextarea" name="desc"></textarea>
							</div>
							<?php
							for ($i = 1; $i <= $count; $i++) {
								?>
								<div class="form-group">
									<label >Item <?= $i ?></label>
									<input class="form-control" id="search<?=$i?>" style="display: inline;width: 48%;" placeholder="Code" name="code<?= $i ?>" required>
									<input class="form-control" style="display: inline;width: 45%;" placeholder="Count" name="count<?= $i ?>" required >
									<div id="display<?=$i?>"></div>
								</div>
							<?php } ?>
							  
							<div class="form-group">
								<label for="Price">Price</label>
								<input class="form-control" id="Price" name="price" type="text" placeholder="Enter the Price of item">
							</div>
							
							<div class="form-group">
								<label for="img">Img for item</label>
								<input class="form-control" id="img" name="img" type="text" placeholder="Enter the img of item">
							</div>
							
							<div class="form-group">
								<label for="type">Type Item</label>
								<select class="form-control" id="type" name="typeDb">
									<option value="offerRand">Offer Random</option>
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
<?php 
		} else {
			header("location: " . URL . "?go=addItem&type=randomItem");
		}
	} 

?>