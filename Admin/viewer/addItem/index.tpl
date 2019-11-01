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
	?>
	<div class="container-fluid">
	  <!-- Breadcrumbs-->
	  <ol class="breadcrumb">
		<li class="breadcrumb-item">
		  <a href="<?=URL?>?go=Home">Home</a>
		</li>
		<li class="breadcrumb-item active">Rappelz Revolution Store</li>
	  </ol>
	  <div class="row">
		<div class="col-12">
			<h1>Rappelz Revolution Store</h1>
			<hr>
			<p>Chose between item or random item.</p>
			<a class="btn btn-primary" href="<?=URL?>?go=addItem&type=Item">Item</a>
			<a class="btn btn-primary" href="<?=URL?>?go=addItem&type=randomItem">Random Item</a>
		</div>
	  </div>
	</div>
<?php 
} elseif(isset($_GET['type']) and $_GET['type'] == "Item") {
	define("View_Child_File", true);
	include 'itemType.tpl';
} elseif(isset($_GET['type']) and $_GET['type'] == "randomItem") {
	define("View_Child_File", true);
	include 'itemRandomType.tpl';
} elseif(isset($_POST['type']) ) {
	define("View_Child_File", true);
	include 'sendPostAdd.tpl';
}
?>