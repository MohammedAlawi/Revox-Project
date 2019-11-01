<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("Vewi_TPL_File")){
	die("File not Found!");
}
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
		<?=(isset($_SESSION['Messege']) ? $_SESSION['Messege'] : "")?>
		<?php unset($_SESSION['Messege']);?>
		<?=(isset($error) == true )? $error : ""?>
		<div class="card mb-3">
			<div class="card-header">
				<i class="fa fa-table"></i> Data Table Example</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>#</th>
								<th>Name</th>
								<th>Price</th>
								<th>Type</th>
								<th>Options</th>
							</tr>
						</thead>
						<tbody>
							<?php
							$data = $Database->SelectWhere("store", " id > 0 order by id");
							$i = 1;
							while($row = array_shift($data)){
								echo "<tr>";
								echo "<td>" . $i++ . "</td>";
								echo "<td>" . $row['name'] . "</td>";
								echo "<td>" . $row['price'] . "</td>";
								echo "<td>" . $row['type'] . "</td>";
								echo '<td>
										<a style="text-decoration: none;" href="'.URL.'?go=editItem&type=edit&id='.$row['id'].'" title="show ('.$row['name'].' )"><i class="fa fa-edit"></i></a>   -   ';
								if($row['enable'] == 0)
									echo '<a style="ext-decoration: none;color: green;" href="'.URL.'?go=editItem&type=enable&id='.$row['id'].'" title="make enable ('.$row['name'].' )"><i class="fa fa-check"></i></a>';
								else
									echo '<a style="ext-decoration: none;color: red;" href="'.URL.'?go=editItem&type=disable&id='.$row['id'].'" title="Make disable ('.$row['name'].' )"><i class="fa fa-times"></i></a>
									</td>';
								echo "</tr>";
							}
							?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
<?php
} elseif(isset($_GET['type']) and $_GET['type'] == "enable") {
	define("View_Child_File", true);
	include 'makeEnable.tpl';
} elseif(isset($_GET['type']) and $_GET['type'] == "disable") {
	define("View_Child_File", true);
	include 'makeDisable.tpl';
} elseif(isset($_GET['type']) and $_GET['type'] == "edit") {
	define("View_Child_File", true);
	include 'editType.tpl';
} elseif(isset($_POST['type']) ) {
	define("View_Child_File", true);
	include 'sendPostEdit.tpl';
}
?>