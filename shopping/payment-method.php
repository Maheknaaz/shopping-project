<?php
/*  payment-method.php  */
session_start();
error_reporting(0);
include('includes/config.php');

if (strlen($_SESSION['login']) == 0) {        // not logged in
    header('location:login.php');
    exit();
}

if (isset($_POST['submit'])) {                // form submitted
    $paymentMethod = $_POST['paymethod'];
    $userId        = $_SESSION['id'];

    /* --- secure update using a prepared statement --- */
    $stmt = mysqli_prepare(
        $con,
        "UPDATE orders
         SET    paymentMethod = ?
         WHERE  userId = ? AND paymentMethod IS NULL"
    );
    mysqli_stmt_bind_param($stmt, 'si', $paymentMethod, $userId);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);

    unset($_SESSION['cart']);                 // clear cart
    header('location:order-history.php');
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>MFM Fashion | Payment Method</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- core framework / theme styles (unchanged) -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/red.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/owl.transitions.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/rateit.css">
    <link rel="stylesheet" href="assets/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="assets/css/config.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- 🍭  All custom payment-page styles inlined here -->
    <style>
/* -------------------------------------------------------
   PAYMENT-PAGE  CUSTOM  CSS
--------------------------------------------------------*/
body {
  font-family: 'Segoe UI', sans-serif;
  background: 
    linear-gradient(rgba(255, 255, 255, 0.9), rgba(255, 255, 255, 0.9)),
    url('https://images.unsplash.com/photo-1512436991641-6745cdb1723f?auto=format&fit=crop&w=1600&q=80') no-repeat center center fixed;
  background-size: cover;
  color: #222;
  margin: 0;
  padding: 0;
}

.payment-page-bg{
  background:linear-gradient(135deg,#fff0f5 0%,#ffd1dc 100%);
  min-height:100vh;position:relative;overflow:hidden}
.payment-page-bg:before{content:"";position:absolute;top:0;left:0;right:0;bottom:0;
  background:url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%23ffb6c1' fill-opacity='0.2'/%3E%3C/svg%3E");
  z-index:0}
.payment-header{text-align:center;margin-bottom:30px;color:#d23669;font-weight:700;
  text-shadow:1px 1px 1px rgba(255,255,255,.8)}
.payment-header:after{content:"";display:block;width:120px;height:4px;
  background:linear-gradient(to right,#ff9a9e,#fad0c4);margin:15px auto 0;border-radius:2px}
.payment-method-container{background:#fff;border-radius:15px;box-shadow:0 15px 35px rgba(210,54,105,.15);
  padding:35px;margin-bottom:40px;position:relative;z-index:1;border:1px solid rgba(255,182,193,.3)}
.payment-option{display:flex;align-items:center;margin-bottom:20px;padding:18px;border-radius:12px;
  transition:.3s;border:2px solid transparent;background:#fff;box-shadow:0 4px 10px rgba(0,0,0,.03);cursor:pointer;
  animation:fadeIn .6s forwards}
.payment-option.selected{border-color:#ff85a2;background:#fff0f5;box-shadow:0 8px 20px rgba(210,54,105,.15)}
.payment-option:hover{background:#fff9fb;transform:translateY(-3px);box-shadow:0 8px 15px rgba(210,54,105,.1)}
.payment-radio{position:relative;margin-right:15px}
.payment-radio input[type=radio]{opacity:0;position:absolute}
.radio-custom{display:inline-block;width:24px;height:24px;border-radius:50%;border:2px solid #ffb6c1;cursor:pointer;
  transition:.2s}
.payment-radio input[type=radio]:checked + .radio-custom:after{content:"";position:absolute;width:14px;height:14px;
  background:linear-gradient(to right,#ff85a2,#ff9a9e);border-radius:50%;top:50%;left:50%;
  transform:translate(-50%,-50%);animation:pulse .5s}
@keyframes pulse{0%{transform:translate(-50%,-50%) scale(0);opacity:0}
  50%{transform:translate(-50%,-50%) scale(1.2);opacity:.8}
  100%{transform:translate(-50%,-50%) scale(1);opacity:1}}
.payment-option-label{font-size:17px;font-weight:600;color:#333}
.payment-icon{margin-left:auto;width:45px;height:45px;display:flex;align-items:center;justify-content:center;
  background:linear-gradient(to right,#ffeef1,#ffd1dc);border-radius:50%;color:#d23669;font-size:18px;
  box-shadow:0 4px 10px rgba(210,54,105,.15);transition:.3s}
.payment-option:hover .payment-icon{transform:rotate(10deg) scale(1.1)}

.submit-btn{background:linear-gradient(to right,#ff85a2,#ff9a9e);color:#fff;border:none;
  padding:14px 35px;border-radius:30px;font-size:17px;font-weight:600;cursor:pointer;transition:.3s;
  box-shadow:0 8px 20px rgba(210,54,105,.3);display:block;margin:35px auto 0;position:relative;overflow:hidden}
.submit-btn:before{content:"";position:absolute;top:0;left:-100%;width:100%;height:100%;
  background:linear-gradient(90deg,transparent,rgba(255,255,255,.3),transparent);transition:.6s}
.submit-btn:hover{transform:translateY(-4px);box-shadow:0 12px 25px rgba(210,54,105,.4)}
.submit-btn:hover:before{left:100%}

.breadcrumb{background:transparent;padding:20px 0}
.breadcrumb-inner{background:rgba(255,255,255,.8);padding:10px 20px;border-radius:30px;
  display:inline-block;box-shadow:0 4px 10px rgba(210,54,105,.1)}

@keyframes fadeIn{from{opacity:0;transform:translateY(15px)}
  to{opacity:1;transform:translateY(0)}}
.payment-option:nth-child(1){animation-delay:.1s}
.payment-option:nth-child(2){animation-delay:.25s}
.payment-option:nth-child(3){animation-delay:.4s}

.payment-method-container:before,.payment-method-container:after{
  content:"";position:absolute;border-radius:50%;background:linear-gradient(to right,#ffeef1,#ffd1dc);z-index:-1}
.payment-method-container:before{top:-15px;right:-15px;width:80px;height:80px}
.payment-method-container:after{bottom:-10px;left:-10px;width:60px;height:60px}

/* little twinkling sparkles */
.sparkle{position:absolute;width:20px;height:20px;background:rgba(255,255,255,.8);border-radius:50%;filter:blur(3px);
  opacity:0;animation:sparkle 4s ease-in-out infinite}
.sparkle:nth-child(1){top:20%;left:10%;animation-delay:0s}
.sparkle:nth-child(2){top:60%;left:85%;animation-delay:1s}
.sparkle:nth-child(3){top:40%;left:50%;animation-delay:2s}
.sparkle:nth-child(4){top:80%;left:30%;animation-delay:3s}
@keyframes sparkle{0%{transform:scale(0);opacity:0}50%{transform:scale(1);opacity:.6}100%{transform:scale(0);opacity:0}}
/* ---------------------------------------------------- */
    </style>
</head>
<body class="cnt-home">

<!-- ========  HEADER  ========= -->
<header class="header-style-1">
    <?php include('includes/top-header.php'); ?>
    <?php include('includes/main-header.php'); ?>
    <?php include('includes/menu-bar.php'); ?>
</header>

<!-- =========  PAGE  CONTENT  ========= -->
<div class="payment-page-bg">

    <!-- decorative sparkles -->
    <div class="sparkle"></div><div class="sparkle"></div><div class="sparkle"></div><div class="sparkle"></div>

    <!-- breadcrumb -->
    <div class="breadcrumb">
        <div class="container">
            <div class="breadcrumb-inner">
                <ul class="list-inline list-unstyled">
                    <li><a href="home.html">Home</a></li>
                    <li class="active">Payment Method</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- payment form -->
    <div class="body-content outer-top-bd">
        <div class="container">
            <div class="checkout-box faq-page inner-bottom-sm">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">

                        <h2 class="payment-header">Choose Your Payment Method</h2>

                        <div class="panel-group checkout-steps" id="accordion">
                            <div class="panel panel-default checkout-step-01">
                                <div class="panel-heading">
                                    <h4 class="unicase-checkout-title">
                                        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                            Select how you'd like to pay
                                        </a>
                                    </h4>
                                </div>

                                <div id="collapseOne" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="payment-method-container">
                                            <form method="post">

                                                <div class="payment-option" onclick="selectPayment(this)">
                                                    <div class="payment-radio">
                                                        <input type="radio" id="cod" name="paymethod" value="COD" checked>
                                                        <label for="cod" class="radio-custom"></label>
                                                    </div>
                                                    <label for="cod" class="payment-option-label">Cash On Delivery</label>
                                                    <div class="payment-icon"><i class="fa fa-money"></i></div>
                                                </div>

                                                <div class="payment-option" onclick="selectPayment(this)">
                                                    <div class="payment-radio">
                                                        <input type="radio" id="internet-banking" name="paymethod" value="Internet Banking">
                                                        <label for="internet-banking" class="radio-custom"></label>
                                                    </div>
                                                    <label for="internet-banking" class="payment-option-label">Internet Banking</label>
                                                    <div class="payment-icon"><i class="fa fa-university"></i></div>
                                                </div>

                                                <div class="payment-option" onclick="selectPayment(this)">
                                                    <div class="payment-radio">
                                                        <input type="radio" id="card" name="paymethod" value="Debit / Credit card">
                                                        <label for="card" class="radio-custom"></label>
                                                    </div>
                                                    <label for="card" class="payment-option-label">Debit / Credit Card</label>
                                                    <div class="payment-icon"><i class="fa fa-credit-card"></i></div>
                                                </div>

                                                <input type="submit" name="submit" value="Complete Payment" class="submit-btn">
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- /.step -->
                        </div><!-- /.checkout-steps -->
                    </div>
                </div>
            </div>

            <!-- brand carousel (optional) -->
            <?php include('includes/brands-slider.php'); ?>
        </div>
    </div>
</div>

<?php include('includes/footer.php'); ?>


<!-- =========  JS  ========= -->
<script src="assets/js/jquery-1.11.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/echo.min.js"></script>
<script src="assets/js/jquery.easing-1.3.min.js"></script>
<script src="assets/js/bootstrap-slider.min.js"></script>
<script src="assets/js/jquery.rateit.min.js"></script>
<script src="assets/js/lightbox.min.js"></script>
<script src="assets/js/bootstrap-select.min.js"></script>
<script src="assets/js/wow.min.js"></script>
<script src="assets/js/scripts.js"></script>

<!-- tiny colour-scheme demo switcher (optional) -->
<script src="switchstylesheet/switchstylesheet.js"></script>

<script>
/* UI helpers */
$(function () {
    $(".changecolor").switchstylesheet({ seperator: "color" });
    $('.show-theme-options').click(function () {
        $(this).parent().toggleClass('open');
        return false;
    });

    // highlight first option on load
    $(".payment-option:first").addClass("selected");
});

/* select-box styling */
function selectPayment(option) {
    $(".payment-option").removeClass("selected");
    $(option).addClass("selected");
    $(option).find('input[type="radio"]').prop('checked', true);
}
</script>
</body>
</html>