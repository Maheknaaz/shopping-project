<?php 
session_start();
error_reporting(0);
include('includes/config.php');

if(isset($_GET['action']) && $_GET['action']=="add"){
    $id=intval($_GET['id']);
    $quantity = isset($_GET['qty']) ? intval($_GET['qty']) : 1; // Get quantity from URL
    
    // Get current stock quantity
    $stock_query = mysqli_query($con, "SELECT stock_quantity FROM products WHERE id={$id}");
    $stock_row = mysqli_fetch_array($stock_query);
    $current_stock = $stock_row['stock_quantity'];
    
    // Check if requested quantity is available
    if($current_stock < $quantity) {
        echo "<script>alert('Sorry! Only {$current_stock} items available in stock.')</script>";
        echo "<script type='text/javascript'> document.location ='product-details.php?pid={$id}'; </script>";
    } else {
        // Decrease stock quantity by requested amount in database
        $update_stock = mysqli_query($con, "UPDATE products SET stock_quantity = stock_quantity - {$quantity} WHERE id={$id}");
        
        if($update_stock) {
            if(isset($_SESSION['cart'][$id])){
                $_SESSION['cart'][$id]['quantity'] += $quantity;
            } else {
                $sql_p="SELECT * FROM products WHERE id={$id}";
                $query_p=mysqli_query($con,$sql_p);
                if(mysqli_num_rows($query_p)!=0){
                    $row_p=mysqli_fetch_array($query_p);
                    $_SESSION['cart'][$row_p['id']]=array("quantity" => $quantity, "price" => $row_p['productPrice']);
                }
            }
            
            // Check remaining stock after purchase
            $remaining_stock = $current_stock - $quantity;
            if($remaining_stock <= 0) {
                echo "<script>alert('Product added to cart! This item is now out of stock.')</script>";
            } else if($remaining_stock <= 3) {
                echo "<script>alert('Product added to cart! Only {$remaining_stock} items left in stock.')</script>";
            } else {
                echo "<script>alert('{$quantity} item(s) have been added to the cart')</script>";
            }
            
            echo "<script type='text/javascript'> document.location ='my-cart.php'; </script>";
        } else {
            echo "<script>alert('Error updating stock. Please try again.')</script>";
        }
    }
}

// Handle cart removal (to restore stock when items are removed from cart)
if(isset($_GET['action']) && $_GET['action']=="remove"){
    $id=intval($_GET['id']);
    
    if(isset($_SESSION['cart'][$id])){
        // Restore stock quantity
        $restore_qty = $_SESSION['cart'][$id]['quantity'];
        mysqli_query($con, "UPDATE products SET stock_quantity = stock_quantity + {$restore_qty} WHERE id={$id}");
        
        // Remove from cart
        unset($_SESSION['cart'][$id]);
        echo "<script>alert('Product removed from cart and stock restored.')</script>";
        echo "<script type='text/javascript'> document.location ='product-details.php?pid={$id}'; </script>";
    }
}

$pid=intval($_GET['pid']);
if(isset($_GET['pid']) && $_GET['action']=="wishlist" ){
    if(strlen($_SESSION['login'])==0)
    {   
        header('location:login.php');
    }
    else
    {
        mysqli_query($con,"insert into wishlist(userId,productId) values('".$_SESSION['id']."','$pid')");
        echo "<script>alert('Product added in wishlist');</script>";
        header('location:my-wishlist.php');
    }
}

if(isset($_POST['submit']))
{
    $qty=$_POST['quality'];
    $price=$_POST['price'];
    $value=$_POST['value'];
    $name=$_POST['name'];
    $summary=$_POST['summary'];
    $review=$_POST['review'];
    mysqli_query($con,"insert into productreviews(productId,quality,price,value,name,summary,review) values('$pid','$qty','$price','$value','$name','$summary','$review')");
}
?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta name="keywords" content="MediaCenter, Template, eCommerce">
        <meta name="robots" content="all">
        <title>Product Details</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/main.css">
        <link rel="stylesheet" href="assets/css/red.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css">
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

        <!-- Fonts --> 
        <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
        <link rel="shortcut icon" href="assets/images/favicon.ico">
    </head>
    <body class="cnt-home">

<header class="header-style-1">
    <!-- ============================================== TOP MENU ============================================== -->
    <?php include('includes/top-header.php');?>
    <!-- ============================================== TOP MENU : END ============================================== -->
    <?php include('includes/main-header.php');?>
    <!-- ============================================== NAVBAR ============================================== -->
    <?php include('includes/menu-bar.php');?>
    <!-- ============================================== NAVBAR : END ============================================== -->
</header>

<!-- ============================================== HEADER : END ============================================== -->
<div class="breadcrumb">
    <div class="container">
        <div class="breadcrumb-inner">
<?php
$ret=mysqli_query($con,"select category.categoryName as catname,subcategory.subcategory as subcatname,products.productName as pname from products join category on category.id=products.category join subcategory on subcategory.id=products.subcategory where products.id='$pid'");
while ($rw=mysqli_fetch_array($ret)) {
?>
            <ul class="list-inline list-unstyled">
                <li><a href="index.php">Home</a></li>
                <li><?php echo htmlentities($rw['catname']);?></a></li>
                <li><?php echo htmlentities($rw['subcatname']);?></li>
                <li class='active'><?php echo htmlentities($rw['pname']);?></li>
            </ul>
            <?php }?>
        </div><!-- /.breadcrumb-inner -->
    </div><!-- /.container -->
</div><!-- /.breadcrumb -->

<div class="body-content outer-top-xs">
    <div class='container'>
        <div class='row single-product outer-bottom-sm '>
            <div class='col-md-3 sidebar'>
                <div class="sidebar-module-container">
                    <!-- ==============================================CATEGORY============================================== -->
                    <div class="sidebar-widget outer-bottom-xs wow fadeInUp">
                        <h3 class="section-title">Category</h3>
                        <div class="sidebar-widget-body m-t-10">
                            <div class="accordion">
                                <?php $sql=mysqli_query($con,"select id,categoryName  from category");
                                while($row=mysqli_fetch_array($sql))
                                {
                                    ?>
                                    <div class="accordion-group">
                                        <div class="accordion-heading">
                                            <a href="category.php?cid=<?php echo $row['id'];?>"  class="accordion-toggle collapsed">
                                               <?php echo $row['categoryName'];?>
                                            </a>
                                        </div>
                                    </div>
                                    <?php } ?>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================== CATEGORY : END ============================================== -->
                    
                    <!-- ============================================== HOT DEALS ============================================== -->
                    <div class="sidebar-widget hot-deals wow fadeInUp">
                        <h3 class="section-title">hot deals</h3>
                        <div class="owl-carousel sidebar-carousel custom-carousel owl-theme outer-top-xs">
                            <?php
                            $ret=mysqli_query($con,"select * from products order by rand() limit 4 ");
                            while ($rws=mysqli_fetch_array($ret)) {
                            ?>
                                <div class="item">
                                    <div class="products">
                                        <div class="hot-deal-wrapper">
                                            <div class="image">
                                                <img src="admin/productimages/<?php echo htmlentities($rws['id']);?>/<?php echo htmlentities($rws['productImage1']);?>"  width="150"  alt="">
                                            </div>
                                        </div><!-- /.hot-deal-wrapper -->

                                        <div class="product-info text-left m-t-20">
                                            <h3 class="name"><a href="product-details.php?pid=<?php echo htmlentities($rws['id']);?>"><?php echo htmlentities($rws['productName']);?></a></h3>
                                            <div class="rating rateit-small"></div>

                                            <div class="product-price">    
                                                <span class="price">
                                                    Rs. <?php echo htmlentities($rws['productPrice']);?>.00
                                                </span>
                                                <span class="price-before-discount">Rs.<?php echo htmlentities($rws['productPriceBeforeDiscount']);?></span>                    
                                            </div><!-- /.product-price -->
                                        </div><!-- /.product-info -->

                                        <div class="cart clearfix animate-effect">
                                            <div class="action">
                                                <div class="add-cart-button btn-group">
                                                    <?php if($rws['stock_quantity'] > 0){?>
                                                        <button class="btn btn-primary icon" data-toggle="dropdown" type="button">
                                                            <i class="fa fa-shopping-cart"></i>                                                    
                                                        </button>
                                                        <a href="product-details.php?page=product&action=add&id=<?php echo $rws['id']; ?>">
                                                            <button class="btn btn-primary" type="button">Add to cart</button>
                                                        </a>
                                                    <?php } else {?>
                                                        <div class="action" style="color:red">Out of Stock</div>
                                                    <?php } ?>
                                                </div>
                                            </div><!-- /.action -->
                                        </div><!-- /.cart -->
                                    </div>    
                                </div>        
                                <?php } ?>        
                        </div><!-- /.sidebar-widget -->
                    </div>
                    <!-- ============================================== HOT DEALS : END ============================================== -->
                </div>
            </div><!-- /.sidebar -->

<?php 
$ret=mysqli_query($con,"select * from products where id='$pid'");
while($row=mysqli_fetch_array($ret))
{
    // Get current stock and set stock status
    $stock_quantity = $row['stock_quantity'];
    $is_low_stock = $stock_quantity <= 5 && $stock_quantity > 0;
    $is_out_of_stock = $stock_quantity <= 0;
?>

            <div class='col-md-9'>
                <div class="row  wow fadeInUp">
                    <div class="col-xs-12 col-sm-6 col-md-5 gallery-holder">
                        <div class="product-item-holder size-big single-product-gallery small-gallery">
                            <div id="owl-single-product">
                                <div class="single-product-gallery-item" id="slide1">
                                    <a data-lightbox="image-1" data-title="<?php echo htmlentities($row['productName']);?>" href="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage1']);?>">
                                        <img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage1']);?>" width="370" height="350" />
                                    </a>
                                </div>

                                <div class="single-product-gallery-item" id="slide2">
                                    <a data-lightbox="image-1" data-title="Gallery" href="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage2']);?>">
                                        <img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage2']);?>" />
                                    </a>
                                </div><!-- /.single-product-gallery-item -->

                                <div class="single-product-gallery-item" id="slide3">
                                    <a data-lightbox="image-1" data-title="Gallery" href="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage3']);?>">
                                        <img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage3']);?>" />
                                    </a>
                                </div>
                            </div><!-- /.single-product-slider -->

                            <div class="single-product-gallery-thumbs gallery-thumbs">
                                <div id="owl-single-product-thumbnails">
                                    <div class="item">
                                        <a class="horizontal-thumb active" data-target="#owl-single-product" data-slide="1" href="#slide1">
                                            <img class="img-responsive"  alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage1']);?>" />
                                        </a>
                                    </div>

                                    <div class="item">
                                        <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="2" href="#slide2">
                                            <img class="img-responsive" width="85" alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage2']);?>"/>
                                        </a>
                                    </div>
                                    <div class="item">
                                        <a class="horizontal-thumb" data-target="#owl-single-product" data-slide="3" href="#slide3">
                                            <img class="img-responsive" width="85" alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']);?>/<?php echo htmlentities($row['productImage3']);?>" height="200" />
                                        </a>
                                    </div>
                                </div><!-- /#owl-single-product-thumbnails -->
                            </div>
                        </div>
                    </div>                 

                    <div class='col-sm-6 col-md-7 product-info-block'>
                        <div class="product-info">
                            <h1 class="name"><?php echo htmlentities($row['productName']);?></h1>
                            
                            <?php $rt=mysqli_query($con,"select * from productreviews where productId='$pid'");
                            $num=mysqli_num_rows($rt);
                            ?>        
                            <div class="rating-reviews m-t-20">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="rating rateit-small"></div>
                                    </div>
                                    <div class="col-sm-8">
                                        <div class="reviews">
                                            <a href="#" class="lnk">(<?php echo htmlentities($num);?> Reviews)</a>
                                        </div>
                                    </div>
                                </div><!-- /.row -->        
                            </div><!-- /.rating-reviews -->

                            <!-- UPDATED STOCK AVAILABILITY SECTION -->
                            <div class="stock-container info-container m-t-10">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="stock-box">
                                            <span class="label">Availability :</span>
                                        </div>    
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="stock-box">
                                            <?php if($is_out_of_stock): ?>
                                                <span class="value" style="color: red; font-weight: bold; font-size: 16px;">
                                                    <i class="fa fa-times-circle"></i> OUT OF STOCK
                                                </span>
                                            <?php elseif($is_low_stock): ?>
                                                <span class="value" style="color: orange; font-weight: bold;">
                                                    <i class="fa fa-exclamation-triangle"></i> 
                                                    HURRY! Only <?php echo $stock_quantity; ?> left in stock!
                                                </span>
                                            <?php else: ?>
                                                <span class="value" style="color: green; font-weight: bold;">
                                                    <i class="fa fa-check-circle"></i> 
                                                    In Stock (<?php echo $stock_quantity; ?> available)
                                                </span>
                                            <?php endif; ?>
                                        </div>    
                                    </div>
                                </div><!-- /.row -->    
                            </div>

                            <div class="stock-container info-container m-t-10">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="stock-box">
                                            <span class="label">Product Brand :</span>
                                        </div>    
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="stock-box">
                                            <span class="value"><?php echo htmlentities($row['productCompany']);?></span>
                                        </div>    
                                    </div>
                                </div><!-- /.row -->    
                            </div>

                            <div class="stock-container info-container m-t-10">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="stock-box">
                                            <span class="label">Shipping Charge :</span>
                                        </div>    
                                    </div>
                                    <div class="col-sm-9">
                                        <div class="stock-box">
                                            <span class="value"><?php if($row['shippingCharge']==0)
                                            {
                                                echo "Free";
                                            }
                                            else
                                            {
                                                echo htmlentities($row['shippingCharge']);
                                            }
                                            ?></span>
                                        </div>    
                                    </div>
                                </div><!-- /.row -->    
                            </div>

                            <div class="price-container info-container m-t-20">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="price-box">
                                            <span class="price">Rs. <?php echo htmlentities($row['productPrice']);?></span>
                                            <span class="price-strike">Rs.<?php echo htmlentities($row['productPriceBeforeDiscount']);?></span>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="favorite-button m-t-10">
                                            <a class="btn btn-primary" data-toggle="tooltip" data-placement="right" title="Wishlist" href="product-details.php?pid=<?php echo htmlentities($row['id'])?>&&action=wishlist">
                                                <i class="fa fa-heart"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div><!-- /.row -->
                            </div><!-- /.price-container -->

                            <!-- UPDATED QUANTITY AND ADD TO CART SECTION WITH + - BUTTONS -->
                            <div class="quantity-container info-container">
                                <div class="row">
                                    <?php if(!$is_out_of_stock): ?>
                                        <!-- Show stock warning if low stock -->
                                        <?php if($is_low_stock): ?>
                                            <div class="col-sm-12">
                                                <div class="alert alert-warning" style="margin-bottom: 15px; padding: 10px;">
                                                    <i class="fa fa-exclamation-triangle"></i>
                                                    <strong>Limited Stock Alert!</strong> Only <?php echo $stock_quantity; ?> items remaining. Order now!
                                                </div>
                                            </div>
                                        <?php endif; ?>
                                        
                                        <div class="col-sm-2">
                                            <span class="label">Qty :</span>
                                        </div>
                                        
                                        <div class="col-sm-2">
                                            <div class="cart-quantity">
                                                <div class="quant-input">
                                                    <div class="arrows">
                                                        <div class="arrow plus gradient" onclick="increaseQty(<?php echo $stock_quantity; ?>)">
                                                            <span class="ir"><i class="icon fa fa-sort-asc"></i></span>
                                                        </div>
                                                        <div class="arrow minus gradient" onclick="decreaseQty()">
                                                            <span class="ir"><i class="icon fa fa-sort-desc"></i></span>
                                                        </div>
                                                    </div>
                                                    <input type="text" value="1" id="quantity" min="1" max="<?php echo $stock_quantity; ?>">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-8">
                                            <a href="#" id="addToCartLink" class="btn btn-primary" 
                                               onclick="addToCart(<?php echo $row['id']; ?>, <?php echo $stock_quantity; ?>)">
                                                <i class="fa fa-shopping-cart inner-right-vs"></i> 
                                                ADD TO CART (<?php echo $stock_quantity; ?> left)
                                            </a>
                                            
                                            <!-- Show items in cart if any -->
                                            <?php if(isset($_SESSION['cart'][$row['id']])): ?>
                                                <div style="margin-top: 10px;">
                                                    <small class="text-info">
                                                        <i class="fa fa-shopping-cart"></i>
                                                        <?php echo $_SESSION['cart'][$row['id']]['quantity']; ?> in your cart
                                                        <a href="product-details.php?action=remove&id=<?php echo $row['id']; ?>" 
                                                           class="btn btn-xs btn-warning" 
                                                           onclick="return confirm('Remove from cart and restore stock?')">
                                                            Remove
                                                        </a>
                                                    </small>
                                                </div>
                                            <?php endif; ?>
                                        </div>
                                        
                                    <?php else: ?>
                                        <!-- OUT OF STOCK DISPLAY -->
                                        <div class="col-sm-12">
                                            <div class="alert alert-danger text-center" style="margin: 20px 0;">
                                                <h4 style="color: red; margin: 0;">
                                                    <i class="fa fa-times-circle"></i> 
                                                    SORRY! THIS PRODUCT IS OUT OF STOCK
                                                </h4>
                                                <p style="margin: 10px 0 0 0;">
                                                    This item is currently unavailable. Please check back later.
                                                </p>
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                </div><!-- /.row -->
                            </div><!-- /.quantity-container -->
                        </div><!-- /.product-info -->
                    </div><!-- /.col-sm-7 -->
                </div><!-- /.row -->

                <!-- PRODUCT TABS SECTION (DESCRIPTION & REVIEWS) -->
                <div class="product-tabs inner-bottom-xs  wow fadeInUp">
                    <div class="row">
                        <div class="col-sm-3">
                            <ul id="product-tabs" class="nav nav-tabs nav-tab-cell">
                                <li class="active"><a data-toggle="tab" href="#description">DESCRIPTION</a></li>
                                <li><a data-toggle="tab" href="#review">REVIEW</a></li>
                            </ul><!-- /.nav-tabs #product-tabs -->
                        </div>
                        <div class="col-sm-9">
                            <div class="tab-content">
                                <div id="description" class="tab-pane in active">
                                    <div class="product-tab">
                                        <p class="text"><?php echo $row['productDescription'];?></p>
                                    </div>    
                                </div><!-- /.tab-pane -->

                                <div id="review" class="tab-pane">
                                    <div class="product-tab">
                                        <div class="product-reviews">
                                            <h4 class="title">Customer Reviews</h4>
                                            <?php $qry=mysqli_query($con,"select * from productreviews where productId='$pid'");
                                            while($rvw=mysqli_fetch_array($qry))
                                            {
                                            ?>
                                                <div class="reviews" style="border: solid 1px #000; padding-left: 2% ">
                                                    <div class="review">
                                                        <div class="review-title"><span class="summary"><?php echo htmlentities($rvw['summary']);?></span><span class="date"><i class="fa fa-calendar"></i><span><?php echo htmlentities($rvw['reviewDate']);?></span></span></div>
                                                        <div class="text">"<?php echo htmlentities($rvw['review']);?>"</div>
                                                        <div class="text"><b>Quality :</b>  <?php echo htmlentities($rvw['quality']);?> Star</div>
                                                        <div class="text"><b>Price :</b>  <?php echo htmlentities($rvw['price']);?> Star</div>
                                                        <div class="text"><b>value :</b>  <?php echo htmlentities($rvw['value']);?> Star</div>
                                                        <div class="author m-t-15"><i class="fa fa-pencil-square-o"></i> <span class="name"><?php echo htmlentities($rvw['name']);?></span></div>
                                                    </div>
                                                </div>
                                                <?php } ?><!-- /.reviews -->
                                        </div><!-- /.product-reviews -->
                                        
                                        <form role="form" class="cnt-form" name="review" method="post">
                                            <div class="product-add-review">
                                                <h4 class="title">Write your own review</h4>
                                                <div class="review-table">
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered">    
                                                            <thead>
                                                                <tr>
                                                                    <th class="cell-label">&nbsp;</th>
                                                                    <th>1 star</th>
                                                                    <th>2 stars</th>
                                                                    <th>3 stars</th>
                                                                    <th>4 stars</th>
                                                                    <th>5 stars</th>
                                                                </tr>
                                                            </thead>    
                                                            <tbody>
                                                                <tr>
                                                                    <td class="cell-label">Quality</td>
                                                                    <td><input type="radio" name="quality" class="radio" value="1"></td>
                                                                    <td><input type="radio" name="quality" class="radio" value="2"></td>
                                                                    <td><input type="radio" name="quality" class="radio" value="3"></td>
                                                                    <td><input type="radio" name="quality" class="radio" value="4"></td>
                                                                    <td><input type="radio" name="quality" class="radio" value="5"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="cell-label">Price</td>
                                                                    <td><input type="radio" name="price" class="radio" value="1"></td>
                                                                    <td><input type="radio" name="price" class="radio" value="2"></td>
                                                                    <td><input type="radio" name="price" class="radio" value="3"></td>
                                                                    <td><input type="radio" name="price" class="radio" value="4"></td>
                                                                    <td><input type="radio" name="price" class="radio" value="5"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="cell-label">Value</td>
                                                                    <td><input type="radio" name="value" class="radio" value="1"></td>
                                                                    <td><input type="radio" name="value" class="radio" value="2"></td>
                                                                    <td><input type="radio" name="value" class="radio" value="3"></td>
                                                                    <td><input type="radio" name="value" class="radio" value="4"></td>
                                                                    <td><input type="radio" name="value" class="radio" value="5"></td>
                                                                </tr>
                                                            </tbody>
                                                        </table><!-- /.table .table-bordered -->
                                                    </div><!-- /.table-responsive -->
                                                </div><!-- /.review-table -->
                                                
                                                <div class="review-form">
                                                    <div class="form-container">
                                                        <div class="row">
                                                            <div class="col-sm-6">
                                                                <div class="form-group">
                                                                    <label for="exampleInputName">Your Name <span class="astk">*</span></label>
                                                                    <input type="text" class="form-control txt" id="exampleInputName" placeholder="" name="name" required="required">
                                                                </div><!-- /.form-group -->
                                                                <div class="form-group">
                                                                    <label for="exampleInputSummary">Summary <span class="astk">*</span></label>
                                                                    <input type="text" class="form-control txt" id="exampleInputSummary" placeholder="" name="summary" required="required">
                                                                </div><!-- /.form-group -->
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label for="exampleInputReview">Review <span class="astk">*</span></label>
                                                                    <textarea class="form-control txt txt-review" id="exampleInputReview" rows="4" placeholder="" name="review" required="required"></textarea>
                                                                </div><!-- /.form-group -->
                                                            </div>
                                                        </div><!-- /.row -->
                                                        
                                                        <div class="action text-right">
                                                            <button name="submit" class="btn btn-primary btn-upper">SUBMIT REVIEW</button>
                                                        </div><!-- /.action -->
                                                    </div><!-- /.form-container -->
                                                </div><!-- /.review-form -->
                                            </div><!-- /.product-add-review -->                                        
                                        </form><!-- /.cnt-form -->
                                    </div><!-- /.product-tab -->
                                </div><!-- /.tab-pane -->
                            </div><!-- /.tab-content -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.product-tabs -->

<?php 
$cid=$row['category'];
$subcid=$row['subCategory']; 
} 
?>

                <!-- ============================================== RELATED PRODUCTS ============================================== -->
                <section class="section featured-product wow fadeInUp">
                    <h3 class="section-title">Related Products </h3>
                    <div class="owl-carousel home-owl-carousel upsell-product custom-carousel owl-theme outer-top-xs">
                        <?php 
                        $qry=mysqli_query($con,"select * from products where subCategory='$subcid' and category='$cid'");
                        while($rw=mysqli_fetch_array($qry))
                        {
                        ?>    
                            <div class="item item-carousel">
                                <div class="products">
                                    <div class="product">        
                                        <div class="product-image">
                                            <div class="image">
                                                <a href="product-details.php?pid=<?php echo htmlentities($rw['id']);?>"><img  src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($rw['id']);?>/<?php echo htmlentities($rw['productImage1']);?>" width="150" height="240" alt=""></a>
                                            </div><!-- /.image -->                                       
                                        </div><!-- /.product-image -->
                                        
                                        <div class="product-info text-left">
                                            <h3 class="name"><a href="product-details.php?pid=<?php echo htmlentities($rw['id']);?>"><?php echo htmlentities($rw['productName']);?></a></h3>
                                            <div class="rating rateit-small"></div>
                                            <div class="description"></div>

                                            <div class="product-price">    
                                                <span class="price">
                                                    Rs.<?php echo htmlentities($rw['productPrice']);?>            </span>
                                                <span class="price-before-discount">Rs.
                                                <?php echo htmlentities($rw['productPriceBeforeDiscount']);?></span>
                                            </div><!-- /.product-price -->
                                        </div><!-- /.product-info -->
                                        
                                        <div class="cart clearfix animate-effect">
                                            <div class="action">
                                                <ul class="list-unstyled">
                                                    <li class="add-cart-button btn-group">
                                                        <?php if($rw['stock_quantity'] > 0): ?>
                                                            <button class="btn btn-primary icon" data-toggle="dropdown" type="button">
                                                                <i class="fa fa-shopping-cart"></i>                                                    
                                                            </button>
                                                            <a href="product-details.php?page=product&action=add&id=<?php echo $rw['id']; ?>" class="lnk btn btn-primary">Add to cart</a>
                                                        <?php else: ?>
                                                            <span class="btn btn-default" style="color: red;">Out of Stock</span>
                                                        <?php endif; ?>
                                                    </li>
                                                </ul>
                                            </div><!-- /.action -->
                                        </div><!-- /.cart -->
                                    </div><!-- /.product -->
                                </div><!-- /.products -->
                            </div><!-- /.item -->
                        <?php } ?>
                    </div><!-- /.home-owl-carousel -->
                </section><!-- /.section -->
                <!-- ============================================== RELATED PRODUCTS : END ============================================== -->
            </div><!-- /.col -->
            <div class="clearfix"></div>
        </div>
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

    <!-- For demo purposes – can be removed on production -->
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

        // Quantity increase/decrease functions
        function increaseQty(maxStock) {
            var qtyInput = document.getElementById('quantity');
            var currentQty = parseInt(qtyInput.value);
            if(currentQty < maxStock) {
                qtyInput.value = currentQty + 1;
            } else {
                alert('Maximum available quantity is ' + maxStock);
            }
        }

        function decreaseQty() {
            var qtyInput = document.getElementById('quantity');
            var currentQty = parseInt(qtyInput.value);
            if(currentQty > 1) {
                qtyInput.value = currentQty - 1;
            }
        }

        // Add to cart function with quantity
        function addToCart(productId, maxStock) {
            var quantity = document.getElementById('quantity').value;
            var qty = parseInt(quantity);
            
            if(qty > maxStock) {
                alert('Only ' + maxStock + ' items available in stock');
                return false;
            }
            
            if(qty < 1) {
                alert('Please select at least 1 item');
                return false;
            }
            
            if(confirm('Add ' + qty + ' item(s) to your cart? Stock will be reserved immediately.')) {
                window.location.href = 'product-details.php?page=product&action=add&id=' + productId + '&qty=' + qty;
            }
            return false;
        }

        // Validate quantity input
        document.getElementById('quantity').addEventListener('change', function() {
            var qty = parseInt(this.value);
            var maxStock = <?php echo $stock_quantity; ?>;
            
            if(qty > maxStock) {
                alert('Only ' + maxStock + ' items available in stock');
                this.value = maxStock;
            } else if(qty < 1 || isNaN(qty)) {
                this.value = 1;
            }
        });
    </script>
</body>
</html>