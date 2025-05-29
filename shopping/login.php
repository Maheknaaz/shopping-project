<?php
session_start();
error_reporting(0);
include('includes/config.php');
// Code user Registration
if(isset($_POST['submit']))
{
$name=$_POST['fullname'];
$email=$_POST['emailid'];
$contactno=$_POST['contactno'];
$password=md5($_POST['password']);
$query=mysqli_query($con,"insert into users(name,email,contactno,password) values('$name','$email','$contactno','$password')");
if($query)
{
	echo "<script>alert('You are successfully register');</script>";
}
else{
echo "<script>alert('Not register something went worng');</script>";
}
}
// Code for User login
if(isset($_POST['login']))
{
   $email=$_POST['email'];
   $password=md5($_POST['password']);
$query=mysqli_query($con,"SELECT * FROM users WHERE email='$email' and password='$password'");
$num=mysqli_fetch_array($query);
if($num>0)
{
$extra="my-cart.php";
$_SESSION['login']=$_POST['email'];
$_SESSION['id']=$num['id'];
$_SESSION['username']=$num['name'];
$uip=$_SERVER['REMOTE_ADDR'];
$status=1;
$log=mysqli_query($con,"insert into userlog(userEmail,userip,status) values('".$_SESSION['login']."','$uip','$status')");
header("location:my-cart.php");
exit();
}
else
{
$extra="login.php";
$email=$_POST['email'];
$uip=$_SERVER['REMOTE_ADDR'];
$status=0;
$log=mysqli_query($con,"insert into userlog(userEmail,userip,status) values('$email','$uip','$status')");
header("location:login.php");
$_SESSION['errmsg']="Invalid email id or Password";
exit();
}
}


?>


<!DOCTYPE html>
<html lang="en">
	<head>
		<!-- Meta -->
		<meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
		<meta name="description" content="">
		<meta name="author" content="">
	    <meta name="keywords" content="MediaCenter, Template, eCommerce">
	    <meta name="robots" content="all">

	    <title>MFM Fashion | Sign-in | Signup</title>

	    <!-- Bootstrap Core CSS -->
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
	    
	    <!-- Customizable CSS -->
	    <link rel="stylesheet" href="assets/css/main.css">
	    <link rel="stylesheet" href="assets/css/red.css">
	    <link rel="stylesheet" href="assets/css/owl.carousel.css">
		<link rel="stylesheet" href="assets/css/owl.transitions.css">
		<!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
		<link href="assets/css/lightbox.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/animate.min.css">
		<link rel="stylesheet" href="assets/css/rateit.css">
		<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">

		<link rel="stylesheet" href="assets/css/config.css">

		<link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
		<link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
		<link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
		<link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
		<link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
		
		<!-- Icons/Glyphs -->
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!-- Fonts --> 
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		
		<!-- Favicon -->
		<link rel="shortcut icon" href="assets/images/favicon.ico">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-image: url('https://i.pinimg.com/736x/7e/e7/92/7ee79220f8149fb8f51ade19f19dcc40.jpg'); /* main background */
      background-size: cover;
      background-position: center;
      background-attachment: fixed;
      font-family: 'Segoe UI', sans-serif;
    }

    .glass-card {
      background: rgba(247, 212, 226, 0.85);
      border-radius: 20px;
      box-shadow: 0 4px 30px rgba(0, 0, 0, 0.2);
      backdrop-filter: blur(2px);
      padding: 30px;
      display: flex;
      flex-direction: row;
      flex-wrap: wrap;
    }

    @media (min-width: 768px) {
      .side-image {
        width: 100%;
        height: 100%;
        border-radius: 15px;
        min-height: 500px;
      }
    }

    h4 {
      font-weight: 700;
    }

    .btn-primary, .btn-success {
      border-radius: 30px;
    }

    label {
      font-weight: 500;
    }

    .form-control {
      border-radius: 10px;
    }

    a {
      text-decoration: none;
      font-size: 14px;
    }

    .title-tag-line {
      font-size: 15px;
      color: #666;
    }

    .error-message {
      color: #dc3545;
      font-size: 12px;
      margin-top: 5px;
    }

    .success-message {
      color: #28a745;
      font-size: 12px;
      margin-top: 5px;
    }

    /* Password toggle styles */
    .password-container {
      position: relative;
    }

    .password-toggle {
      position: absolute;
      right: 12px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      color: #6c757d;
      font-size: 18px;
      z-index: 10;
      padding: 5px;
      border-radius: 3px;
      transition: color 0.3s ease;
    }

    .password-toggle:hover {
      color: #495057;
      background-color: rgba(0, 0, 0, 0.05);
    }

    .password-input {
      padding-right: 45px !important;
    }
  </style>

<script type="text/javascript">
// Enhanced validation function for registration
function valid()
{
    // Check if passwords match
    if(document.register.password.value != document.register.confirmpassword.value)
    {
        alert("Password and Confirm Password Field do not match!!");
        document.register.confirmpassword.focus();
        return false;
    }
    
    // Validate all fields
    if(!validateRegistrationForm()) {
        return false;
    }
    
    return true;
}

// Email validation function
function validateEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

// Phone number validation function (10 digits)
function validatePhone(phone) {
    const phoneRegex = /^\d{10}$/;
    return phoneRegex.test(phone);
}

// Password validation function
function validatePassword(password) {
    // At least 8 characters, 1 uppercase, 1 special character, 1 digit
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
    return passwordRegex.test(password);
}

// Full name validation
function validateFullName(name) {
    const nameRegex = /^[a-zA-Z\s]{2,50}$/;
    return nameRegex.test(name.trim());
}

// Registration form validation
function validateRegistrationForm() {
    const fullname = document.register.fullname.value.trim();
    const email = document.register.emailid.value.trim();
    const phone = document.register.contactno.value.trim();
    const password = document.register.password.value;
    
    // Clear previous error messages
    clearErrorMessages();
    
    let isValid = true;
    
    // Validate full name
    if(!validateFullName(fullname)) {
        showError('fullname-error', 'Full name should contain only letters and spaces (2-50 characters)');
        isValid = false;
    }
    
    // Validate email
    if(!validateEmail(email)) {
        showError('email-error', 'Please enter a valid email address');
        isValid = false;
    }
    
    // Validate phone
    if(!validatePhone(phone)) {
        showError('phone-error', 'Phone number must be exactly 10 digits');
        isValid = false;
    }
    
    // Validate password
    if(!validatePassword(password)) {
        showError('password-error', 'Password must be at least 8 characters with 1 uppercase, 1 digit, and 1 special character');
        isValid = false;
    }
    
    return isValid;
}

// Login form validation
function validateLoginForm() {
    const email = document.loginForm.email.value.trim();
    const password = document.loginForm.password.value;
    
    // Clear previous error messages
    clearErrorMessages();
    
    let isValid = true;
    
    // Validate email
    if(!validateEmail(email)) {
        showError('login-email-error', 'Please enter a valid email address');
        isValid = false;
    }
    
    // Validate password (basic check for login)
    if(password.length < 1) {
        showError('login-password-error', 'Please enter your password');
        isValid = false;
    }
    
    return isValid;
}

// Show error message
function showError(elementId, message) {
    const errorElement = document.getElementById(elementId);
    if(errorElement) {
        errorElement.textContent = message;
        errorElement.style.display = 'block';
    }
}

// Clear all error messages
function clearErrorMessages() {
    const errorElements = document.querySelectorAll('.error-message');
    errorElements.forEach(element => {
        element.textContent = '';
        element.style.display = 'none';
    });
}

// Password toggle functionality
function togglePassword(inputId, iconElement) {
    const passwordInput = document.getElementById(inputId);
    const icon = iconElement;
    
    if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        icon.classList.remove('fa-eye');
        icon.classList.add('fa-eye-slash');
    } else {
        passwordInput.type = 'password';
        icon.classList.remove('fa-eye-slash');
        icon.classList.add('fa-eye');
    }
}

// Real-time validation for registration form
function setupRealTimeValidation() {
    // Email validation on blur
    document.addEventListener('DOMContentLoaded', function() {
        const emailField = document.querySelector('input[name="emailid"]');
        if(emailField) {
            emailField.addEventListener('blur', function() {
                if(this.value.trim() && !validateEmail(this.value.trim())) {
                    showError('email-error', 'Please enter a valid email address');
                } else if(this.value.trim() && validateEmail(this.value.trim())) {
                    document.getElementById('email-error').style.display = 'none';
                }
            });
        }
        
        // Phone validation on input
        const phoneField = document.querySelector('input[name="contactno"]');
        if(phoneField) {
            phoneField.addEventListener('input', function() {
                // Only allow digits
                this.value = this.value.replace(/\D/g, '');
                if(this.value.length > 10) {
                    this.value = this.value.slice(0, 10);
                }
                
                if(this.value.length > 0 && this.value.length !== 10) {
                    showError('phone-error', 'Phone number must be exactly 10 digits');
                } else if(this.value.length === 10) {
                    document.getElementById('phone-error').style.display = 'none';
                }
            });
        }
        
        // Password validation on input
        const passwordField = document.querySelector('input[name="password"]');
        if(passwordField) {
            passwordField.addEventListener('input', function() {
                if(this.value.length > 0 && !validatePassword(this.value)) {
                    showError('password-error', 'Password must be at least 8 characters with 1 uppercase, 1 digit, and 1 special character');
                } else if(validatePassword(this.value)) {
                    document.getElementById('password-error').style.display = 'none';
                }
            });
        }
        
        // Full name validation on blur
        const nameField = document.querySelector('input[name="fullname"]');
        if(nameField) {
            nameField.addEventListener('blur', function() {
                if(this.value.trim() && !validateFullName(this.value.trim())) {
                    showError('fullname-error', 'Full name should contain only letters and spaces (2-50 characters)');
                } else if(this.value.trim() && validateFullName(this.value.trim())) {
                    document.getElementById('fullname-error').style.display = 'none';
                }
            });
        }
    });
}

// Initialize real-time validation
setupRealTimeValidation();
</script>
    	<script>
function userAvailability() {
$("#loaderIcon").show();
jQuery.ajax({
url: "check_availability.php",
data:'email='+$("#email").val(),
type: "POST",
success:function(data){
$("#user-availability-status1").html(data);
$("#loaderIcon").hide();
},
error:function (){}
});
}
</script>

	</head>
    <body class="cnt-home">
	
		
	
		<!-- ============================================== HEADER ============================================== -->
<header class="header-style-1">

	<!-- ============================================== TOP MENU ============================================== -->
<?php include('includes/top-header.php');?>
<!-- ============================================== TOP MENU : END ============================================== -->

	<!-- ============================================== NAVBAR ============================================== -->

<!-- ============================================== NAVBAR : END ============================================== -->

</header>

<!-- ============================================== HEADER : END ============================================== -->
<div class="breadcrumb">
	<div class="container">
		<div class="breadcrumb-inner">
			<ul class="list-inline list-unstyled">
				<li><a href="home.html">Home</a></li>
				<li class='active'>Authentication</li>
			</ul>
		</div><!-- /.breadcrumb-inner -->
	</div><!-- /.container -->
</div><!-- /.breadcrumb -->

<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-lg-10">
      <div class="row glass-card">
		<h2 style="text-align:center">Join the Movement of Modern Elegance</h2>
		<h2 style="text-align:center">Not Just Clothes, A Culture</h2>
       <h3 style="text-align:center; font-family: serif;">
  "Log in and be part of something more — where trends meet soul and every thread tells a story."
</h3>
<!-- Login Form -->
        <div class="col-md-6 border-end">
          <h4 class="text-primary">Sign In</h4>
          <p class="title-tag-line">Welcome back to MFM Fashion!</p>
          <form method="post" name="loginForm" onsubmit="return validateLoginForm();">
            <div class="mb-3">
              <label>Email Address</label>
              <input type="email" name="email" class="form-control" required>
              <div id="login-email-error" class="error-message" style="display: none;"></div>
            </div>
            <div class="mb-3">
              <label>Password</label>
              <div class="password-container">
                <input type="password" name="password" id="loginPassword" class="form-control password-input" required>
                <i class="fa fa-eye password-toggle" onclick="togglePassword('loginPassword', this)"></i>
              </div>
              <div id="login-password-error" class="error-message" style="display: none;"></div>
            </div>
            <div class="mb-3 text-end">
              <a href="forgot-password.php">Forgot your password?</a>
            </div>
            <button type="submit" name="login" class="btn btn-primary w-100">Login</button>
          </form>
        </div>

        <!-- Register Form -->
        <div class="col-md-6">
          <h4 class="text-success">Create a New Account</h4>
          <p class="title-tag-line">Join and get the latest styles delivered.</p>
          <form method="post" name="register" onsubmit="return valid();">
            <div class="mb-3">
              <label>Full Name</label>
              <input type="text" name="fullname" class="form-control" required>
              <div id="fullname-error" class="error-message" style="display: none;"></div>
            </div>
            <div class="mb-3">
              <label>Email Address</label>
              <input type="email" name="emailid" onblur="userAvailability()" class="form-control" required>
              <small id="user-availability-status1" class="text-muted"></small>
              <div id="email-error" class="error-message" style="display: none;"></div>
            </div>
            <div class="mb-3">
              <label>Contact No.</label>
              <input type="text" name="contactno" maxlength="10" class="form-control" required>
              <div id="phone-error" class="error-message" style="display: none;"></div>
            </div>
            <div class="mb-3">
              <label>Password</label>
              <div class="password-container">
                <input type="password" name="password" id="registerPassword" class="form-control password-input" required>
                <i class="fa fa-eye password-toggle" onclick="togglePassword('registerPassword', this)"></i>
              </div>
              <div id="password-error" class="error-message" style="display: none;"></div>
              <small class="text-muted">Password must be at least 8 characters with 1 uppercase, 1 digit, and 1 special character</small>
            </div>
            <div class="mb-3">
              <label>Confirm Password</label>
              <div class="password-container">
                <input type="password" name="confirmpassword" id="confirmPassword" class="form-control password-input" required>
                <i class="fa fa-eye password-toggle" onclick="togglePassword('confirmPassword', this)"></i>
              </div>
            </div>
            <button type="submit" name="submit" class="btn btn-success w-100">Sign Up</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>


	<script src="assets/js/jquery-1.11.1.min.js"></script>
	
	<script src="assets/js/bootstrap.min.js"></script>
	
	<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
	<script src="assets/js/owl.carousel.min.js"></script>
	
	<script src="assets/js/echo.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
	<script src="assets/js/bootstrap-slider.min.js"></script>
    <script src="assets/js/jquery.rateit.min.js"></script>
    <script type="text/javascript" src="assets/js/lightbox.min.js"></script>
    <script src="assets/js/bootstrap-select.min.js"></script>
    <script src="assets/js/wow.min.js"></script>
	<script src="assets/js/scripts.js"></script>
	
	<script src="switchstylesheet/switchstylesheet.js"></script>
	
	<script>
		$(document).ready(function(){ 
			$(".changecolor").switchstylesheet( { seperator:"color"} );
			$('.show-theme-options').click(function(){
				$(this).parent().toggleClass('open');
				return false;
			});
		});

		$(window).bind("load", function() {
		   $('.show-theme-options').delay(2000).trigger('click');
		});
	</script>
	
</body>
</html>