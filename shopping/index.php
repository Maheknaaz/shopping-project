<?php session_start();
error_reporting(0);
include('includes/config.php');
if(isset($_GET['action']) && $_GET['action']=="add"){
	$id=intval($_GET['id']);
	if(isset($_SESSION['cart'][$id])){
		$_SESSION['cart'][$id]['quantity']++;
	}else{
		$sql_p="SELECT * FROM products WHERE id={$id}";
		$query_p=mysqli_query($con,$sql_p);
		if(mysqli_num_rows($query_p)!=0){
			$row_p=mysqli_fetch_array($query_p);
			$_SESSION['cart'][$row_p['id']]=array("quantity" => 1, "price" => $row_p['productPrice']);
		
		}else{
			$message="Product ID is invalid";
		}
	}
		echo "<script>alert('Product has been added to the cart')</script>";
		echo "<script type='text/javascript'> document.location ='my-cart.php'; </script>";
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

	    <title>MFM Fashion</title>

	    <!-- Bootstrap Core CSS -->
	    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<!-- Bootstrap CSS
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"> -->

	    
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
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">
		<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
		
		<!-- Favicon -->
		<link rel="shortcut icon" href="assets/images/favicon.ico">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600&family=Raleway&display=swap" rel="stylesheet">
<!-- In <head> -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

<style>
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

			/* Hero Section */
			.hero-section {
  			padding: 80px 0;
  			background-color:rgb(248, 195, 240);
			}
			.btn:hover {
  				transform: translateY(-2px);
  				box-shadow: 0 8px 16px rgba(0,0,0,0.15);
				}
			.hero-section img:hover {
  			transform: scale(1.05) rotateY(0deg);
			}
			.hero-section {
  			background: linear-gradient(90deg, #fff0f5 0%, #ffe6f0 100%);
			}

			/* Container and title */
.more-info-tab {
    background: #f9f9f9;
    padding: 10px 20px;
    margin-bottom: 20px;
    border-radius: 10px;
    box-shadow: 0 3px 15px rgba(0,0,0,0.05);
}

.new-product-title {
    font-family: 'Poppins', sans-serif;
    font-weight: 700;
    font-size: 30px;
    color: #222;
    position: relative;
    padding-bottom: 10px;
}

.new-product-title::after {
    content: "";
    width: 80px;
    height: 4px;
    background: #007bff; /* Blue underline */
    position: absolute;
    bottom: 0;
    left: 0;
    border-radius: 3px;
}

/* Owl carousel container padding */
.product-slider {
    padding: 0 15px 30px;
}

/* Product card styling */
.product {
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 8px 18px rgba(0,0,0,0.1);
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    cursor: pointer;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.product:hover {
    transform: translateY(-8px);
    box-shadow: 0 14px 25px rgba(0,0,0,0.15);
}
/* Base styling (desktop view) */
.product-image {
  width: 100%;
  height: 300px;
  object-fit: cover;
  border-radius: 8px;
}


/* Image container */
/* .product-image .image {
    width: 80%;
    overflow: hidden;
    border-bottom: 1px solid #eee;
}

.product-image img {
    width: 100%;
    height: auto;
    object-fit: cover;
    transition: transform 0.5s ease;
    border-radius: 12px 12px 0 0;
} */

/* .product-image .image {
    height: 250px; 
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
}

.product-image .image img {
    height: 100%;
    width: auto;
    object-fit: contain; 
}

.product:hover .product-image img {
    transform: scale(1.05);
} */

/* Product info */
.product-info {
    padding: 15px 20px;
    flex-grow: 1;
}

.product-info .name {
    font-weight: 600;
    font-size: 18px;
    color: #333;
    margin-bottom: 6px;
    line-height: 1.2;
}

.product-info .name a {
    color: inherit;
    text-decoration: none;
    transition: color 0.3s ease;
}

.product-info .name a:hover {
    color: #007bff;
}

.product-price {
    margin-top: 8px;
    font-size: 16px;
    color: #222;
}

.product-price .price {
    font-weight: 700;
    color: #007bff;
    margin-right: 10px;
}

.product-price .price-before-discount {
    color: #999;
    text-decoration: line-through;
    font-weight: 400;
}

/* Add to cart button */
.action {
    padding: 15px 20px;
    text-align: center;
    border-top: 1px solid #eee;
}

.action .btn {
    display: inline-block;
    width: 100%;
    padding: 12px 0;
    font-size: 16px;
    font-weight: 600;
    border-radius: 8px;
    text-transform: uppercase;
    transition: background-color 0.3s ease;
}

.action .btn-info {
    background-color:rgb(245, 87, 197);
    border-color:rgb(95, 4, 65);
    color: #fff;
    box-shadow: 0 4px 12px rgba(0,123,255,0.3);
}

.action .btn-info:hover {
    background-color:rgb(252, 109, 228);
    border-color:rgb(112, 6, 77);
    box-shadow: 0 6px 18px rgba(0,64,133,0.5);
}

.action[style] {
    font-weight: 700;
    font-size: 16px;
}

/* Responsive tweaks */
@media (max-width: 768px) {
    .product-info .name {
        font-size: 16px;
    }
    .product-price {
        font-size: 14px;
    }
}

@media (max-width: 480px) {
    .product-price .price,
    .product-price .price-before-discount {
        font-size: 13px;
    }
    .action .btn {
        font-size: 14px;
        padding: 10px 0;
    }
}

		</style>

</head>
    <body class="cnt-home">
	
    
		<!-- ============================================== HEADER ============================================== -->
<header class="header-style-1">
<?php include('includes/top-header.php');?>
<?php include('includes/main-header.php');?>
<?php include('includes/menu-bar.php');?>
</header>

<!-- ============================================== HEADER : END ============================================== -->
<!-- ================================== TOP NAVIGATION : END ================================== -->
			<!-- </div> -->
			<!-- /.sidemenu-holder -->	
			
			<!-- <div class="col-xs-12 col-sm-12 col-md-9 homebanner-holder"> -->
				<!-- ========================================== SECTION – HERO ========================================= -->
	
<section class="hero-section py-5" style="background: linear-gradient(to right, #fff0f5, #ffe6f0); font-family: 'Raleway', sans-serif;">
  <div class="container">
    <div class="row align-items-center">
      
      <!-- Left content -->
      <div class="col-lg-6 mb-4 mb-lg-0" data-aos="fade-right">
        <h1 style="font-family: 'Playfair Display', serif; font-size: 7rem; color: #222; line-height: 1.2;">
          Elevate Your <br><span style="color: #d63384;">Wardrobe</span>
        </h1>
        <p style="font-size: 1.9rem; color: #555; margin-top: 1rem;">
          Curated collections blending contemporary design with timeless elegance. <br>
          Experience fashion that speaks to your individuality.
        </p>

        <!-- Buttons -->
        <div class="d-flex flex-wrap gap-3 mt-4">
          <a href="#" class="btn btn-dark btn-lg px-4 py-2 rounded-pill shadow-sm" style="transition: 0.3s;">
            <i class="bi bi-gender-male me-2"></i> Men's Collection
          </a>
          <a href="#" class="btn btn-outline-dark btn-lg px-4 py-2 rounded-pill shadow-sm" style="transition: 0.3s;">
            <i class="bi bi-gender-female me-2"></i> Women's Collection
          </a>
        </div>

        <!-- Stats -->
        <div class="d-flex gap-5 mt-5 text-left justify-content-start">
          <div>
            <h5 class="fw-bold mb-1 display-6">5K+</h5>
            <p class="text-muted mb-0">Products</p>
          </div>
          <div>
            <h5 class="fw-bold mb-1 display-6">24/7</h5>
            <p class="text-muted mb-0">Support</p>
          </div>
        </div>
      </div>

      <!-- Right image -->
      <div class="col-lg-6 text-center" data-aos="fade-left">
        <div class="overflow-hidden rounded-4 shadow-lg" style="transform: rotateY(-4deg) scale(1.02); transition: transform 0.4s;">
          <img src="assets/images/sliders/slider1.jpg" alt="Fashion Collection" class="img-fluid" style="width: 110%; object-fit: cover;">
        </div>
      </div>
    </div>
  </div>
</section>


			
<!-- ========================================= SECTION – HERO : END ========================================= -->	
				<!-- ============================================== INFO BOXES ============================================== -->
<div class="info-boxes wow fadeInUp py-5 bg-light">
  <div class="container">
    <div class="row text-center g-4">
      
      <!-- Box 1: Money Back -->
      <div class="col-lg-4 col-md-6">
        <div class="card shadow-sm border-0 h-100">
          <div class="card-body d-flex align-items-center">
            <div class="me-3">
              <i class="fa fa-dollar fa-2x text-success"></i>
            </div>
            <div>
              <h5 class="card-title mb-1 text-success fw-bold">Money Back</h5>
              <p class="card-text small">30 Days Money Back Guarantee.</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Box 2: Free Shipping -->
      <div class="col-lg-4 col-md-6">
        <div class="card shadow-sm border-0 h-100">
          <div class="card-body d-flex align-items-center">
            <div class="me-3">
              <i class="fa fa-truck fa-2x text-warning"></i>
            </div>
            <div>
              <h5 class="card-title mb-1 text-warning fw-bold">Free Shipping</h5>
              <p class="card-text small">Free ship-on order over Rs. 600.00</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Box 3: Special Sale -->
      <div class="col-lg-4 col-md-12">
        <div class="card shadow-sm border-0 h-100">
          <div class="card-body d-flex align-items-center">
            <div class="me-3">
              <i class="fa fa-gift fa-2x text-danger"></i>
            </div>
            <div>
              <h5 class="card-title mb-1 text-danger fw-bold">Special Sale</h5>
              <p class="card-text small">All items-sale up to 20% off</p>
            </div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>
<!-- ============================================== INFO BOXES : END ============================================== -->		
			</div><!-- /.homebanner-holder -->
			
		</div><!-- /.row -->

		<!-- ============================================== SCROLL TABS ============================================== -->
<div>
    <div class="more-info-tab clearfix">
        <h3 class="new-product-title pull-left" style="margin: 5px;">All Products</h3>
    </div>

    <div class="tab-content outer-top-xs">
        <div class="tab-pane in active" id="all">            
            <div class="product-slider">
                <div class="owl-carousel home-owl-carousel custom-carousel owl-theme">
                    <?php
                    $ret = mysqli_query($con, "SELECT * FROM products");
                    while ($row = mysqli_fetch_array($ret)) {
                    ?>
                        <div class="item">
                            <div class="products">
                                <div class="product">        
                                    <div class="product-image">
                                        <div class="image">
                                            <a href="product-details.php?pid=<?php echo htmlentities($row['id']); ?>">
                                                <img src="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage1']); ?>" 
                                                     data-echo="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage1']); ?>" 
                                                     width="200" height="300" alt="<?php echo htmlentities($row['productName']); ?>">
                                            </a>
                                        </div><!-- /.image -->                        
                                    </div><!-- /.product-image -->

                                    <div class="product-info text-left">
                                        <h3 class="name">
                                            <a href="product-details.php?pid=<?php echo htmlentities($row['id']); ?>">
                                                <?php echo htmlentities($row['productName']); ?>
                                            </a>
                                        </h3>
                                        <div class="rating rateit-small"></div>
                                        <div class="description"></div>

                                        <div class="product-price">    
                                            <span class="price">
                                                Rs.<?php echo htmlentities($row['productPrice']); ?>
                                            </span>
                                            <span class="price-before-discount">
                                                Rs.<?php echo htmlentities($row['productPriceBeforeDiscount']); ?>
                                            </span>                                    
                                        </div><!-- /.product-price -->
                                    </div><!-- /.product-info -->

                                    <?php if ($row['productAvailability'] == 'In Stock') { ?>
                                        <div class="action">
                                            <a href="index.php?page=product&action=add&id=<?php echo $row['id']; ?>" class="lnk btn btn-info">Add to Cart</a>
                                        </div>
                                    <?php } else { ?>
                                        <div class="action" style="color:red;">Out of Stock</div>
                                    <?php } ?>
                                </div><!-- /.product -->
                            </div><!-- /.products -->
                        </div><!-- /.item -->
                    <?php } ?>
                </div><!-- /.home-owl-carousel -->
            </div><!-- /.product-slider -->
        </div>
    </div>
</div>

         <!-- ============================================== TABS ============================================== -->
	
		

</div>
</div>
<?php include('includes/footer.php');?>
	
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
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
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


		AOS.init();
	</script>

</body>
</html>