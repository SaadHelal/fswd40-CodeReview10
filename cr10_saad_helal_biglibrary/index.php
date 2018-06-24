<?php
ob_start();
session_start();
require_once 'dbconnect.php';

// it will never let you open index(login) page if session is set
if ( isset($_SESSION['user'])!="" ) {
 header("Location: home.php");
 exit;
}

$error = false;

if( isset($_POST['btn-login']) ) {

 // prevent sql injections/ clear user invalid inputs
 $email = trim($_POST['email']);
 $email = strip_tags($email);
 $email = htmlspecialchars($email);

 $pass = trim($_POST['pass']);
 $pass = strip_tags($pass);
 $pass = htmlspecialchars($pass);
 // prevent sql injections / clear user invalid inputs

 if(empty($email)){
  $error = true;
  $emailError = "Please enter your email address.";
 } else if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
  $error = true;
  $emailError = "Please enter valid email address.";
 }

 if(empty($pass)){
  $error = true;
  $passError = "Please enter your password.";
 }

 // if there's no error, continue to login
 if (!$error) {
  
  $password = hash('sha256', $pass); // password hashing

  $res=mysqli_query($conn, "SELECT userId, userName, pass FROM user WHERE email='$email'");
  $row=mysqli_fetch_array($res, MYSQLI_ASSOC);
  $count = mysqli_num_rows($res); // if uname/pass correct it returns must be 1 row
  
  if( $count == 1 && $row['pass']==$password ) {
   $_SESSION['user'] = $row['userId'];
   header("Location: home.php");
  } else {
   $errMSG = "Incorrect Credentials, Try again...";
  }
  
 }

}
?>
<!DOCTYPE html>
<html>
<head>
<title>Login </title>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="icon" type="image/png" href="images2/icons/favicon.ico"/>

	<link rel="stylesheet" type="text/css" href="vendor2/bootstrap/css/bootstrap.min.css">

	<link rel="stylesheet" type="text/css" href="fonts2/font-awesome-4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="fonts2/iconic/css/material-design-iconic-font.min.css">

	<link rel="stylesheet" type="text/css" href="vendor2/animate/animate.css">
	
	<link rel="stylesheet" type="text/css" href="vendor2/css-hamburgers/hamburgers.min.css">

	<link rel="stylesheet" type="text/css" href="vendor2/animsition/css/animsition.min.css">

	<link rel="stylesheet" type="text/css" href="vendor2/select2/select2.min.css">
	
	<link rel="stylesheet" type="text/css" href="vendor2/daterangepicker/daterangepicker.css">

	<link rel="stylesheet" type="text/css" href="css2/util.css">
	<link rel="stylesheet" type="text/css" href="css2/main.css">

</head>
<body>
   <form method="post" action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']); ?>" autocomplete="off">
  
    
            
           <?php
  if ( isset($errMSG) ) {
echo $errMSG; ?>
              
               <?php
  }
  ?>


      <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-26">
						Sign In
					</span>
					<span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-font"></i>
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<input class="input100" type="text" name="email">
						<span class="focus-input100" data-placeholder="Email"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<input class="input100" type="password" name="pass">
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
              <button class="login100-form-btn" name="btn-login">
								Login
							</button>
						</div>
					</div>

					<div class="text-center p-t-115">
						<span class="txt1">
							Don’t have an account?
						</span>

						<a class="txt2" href="register.php">
							Sign Up
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
          
          

  
            <a href="register.php">Sign Up Here...</a>
      
          
   </form>
   </div>
</div>


<div id="dropDownSelect1"></div>
	
  <!--===============================================================================================-->
    <script src="vendor2/jquery/jquery-3.2.1.min.js"></script>
  <!--===============================================================================================-->
    <script src="vendor2/animsition/js/animsition.min.js"></script>
  <!--===============================================================================================-->
    <script src="vendor2/bootstrap/js/popper.js"></script>
    <script src="vendor2/bootstrap/js/bootstrap.min.js"></script>
  <!--===============================================================================================-->
    <script src="vendor2/select2/select2.min.js"></script>
  <!--===============================================================================================-->
    <script src="vendor2/daterangepicker/moment.min.js"></script>
    <script src="vendor2/daterangepicker/daterangepicker.js"></script>
  <!--===============================================================================================-->
    <script src="vendor2/countdowntime/countdowntime.js"></script>
  <!--===============================================================================================-->
    <script src="js2/main.js"></script>
</body>
</html>
<?php ob_end_flush(); ?>


