<?php
/*
 * Made by ham999dy
 * © 2018 Revolution Team
 */
if(!defined("Vewi_TPL_File")){
	die("File not Found!");
}
if(isset($_POST['username']) AND isset($_POST['password'])){
	$username = security::clean($_POST['username']);
	$password = security::clean($_POST['password']);
	$data = $Database->SelectW("admin", array("username" => $username, "password" => md5(HASH_PASSWORD.$password) ) );
	if(count($data) > 0 ){
		$_SESSION['loginAdmin'] = true;
		$_SESSION['adminData'] = $data[0];
		header("location: " . URL);
		exit();
	} else {
		$error = '<div class="alert alert-danger"><strong>Danger!</strong> Username or password is Wrong.</div>';
	}
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>SB Admin - <?=SERVER_NAME?></title>
  <link href="<?=URL?>style/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="<?=URL?>style/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="<?=URL?>style/css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        <form action="<?=URL?>" method="POST">
		<?=(isset($error) == true )? $error : ""?>
          <div class="form-group">
            <label for="exampleInputUsername">Username</label>
            <input class="form-control" id="exampleInputUsername" name="username" type="text" aria-describedby="emailHelp" placeholder="Enter username">
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input class="form-control" id="exampleInputPassword1" name="password" type="password" placeholder="Password">
          </div>
          <div class="form-group">
            <div class="form-check">
              <label class="form-check-label">
                <input class="form-check-input" type="checkbox"> Remember Password</label>
            </div>
          </div>
          <input type="submit" class="btn btn-primary btn-block" value="Login" />
        </form>
      </div>
    </div>
  </div>
  
  <script src="<?=URL?>style/vendor/jquery/jquery.min.js"></script>
  <script src="<?=URL?>style/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<?=URL?>style/vendor/jquery-easing/jquery.easing.min.js"></script>
</body>

</html>
