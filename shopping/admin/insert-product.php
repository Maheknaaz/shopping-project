<?php
session_start();
include('include/config.php');

// Check admin login
if (!isset($_SESSION['alogin']) || empty($_SESSION['alogin'])) {
    header('location:index.php');
    exit();
}

// Sanitize file names
function safeFileName($filename) {
    return preg_replace("/[^a-zA-Z0-9.]/", "_", basename($filename));
}

if (isset($_POST['submit'])) {
    $category = intval($_POST['category']);
    $subcat = intval($_POST['subcategory']);
    $productname = mysqli_real_escape_string($con, $_POST['productName']);
    $productcompany = mysqli_real_escape_string($con, $_POST['productCompany']);
    $productprice = floatval($_POST['productprice']);
    $productpricebd = floatval($_POST['productpricebd']);
    $productdescription = mysqli_real_escape_string($con, $_POST['productDescription']);
    $productscharge = mysqli_real_escape_string($con, $_POST['productShippingcharge']);
    $productavailability = mysqli_real_escape_string($con, $_POST['productAvailability']);

    // Upload images
    $productimage1 = safeFileName($_FILES["productimage1"]["name"]);
    $productimage2 = safeFileName($_FILES["productimage2"]["name"]);
    $productimage3 = safeFileName($_FILES["productimage3"]["name"]);

    if ($_FILES["productimage1"]["error"] > 0 || $_FILES["productimage2"]["error"] > 0) {
        $_SESSION['msg'] = "Error uploading images!";
        header("location: insert-product.php");
        exit;
    }

    // Get next product ID
    $query = mysqli_query($con, "SELECT MAX(id) as pid FROM products");
    $result = mysqli_fetch_array($query);
    $productid = $result['pid'] + 1;

    $dir = "productimages/$productid";
    if (!is_dir($dir)) {
        mkdir($dir, 0777, true);
    }

    move_uploaded_file($_FILES["productimage1"]["tmp_name"], "$dir/$productimage1");
    move_uploaded_file($_FILES["productimage2"]["tmp_name"], "$dir/$productimage2");
    if (!empty($productimage3)) {
        move_uploaded_file($_FILES["productimage3"]["tmp_name"], "$dir/$productimage3");
    }

    // Insert into database using prepared statement
    $stmt = $con->prepare("INSERT INTO products (category, subCategory, productName, productCompany, productPrice, productDescription, shippingCharge, productAvailability, productImage1, productImage2, productImage3, productPriceBeforeDiscount) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("iissdssssssd", $category, $subcat, $productname, $productcompany, $productprice, $productdescription, $productscharge, $productavailability, $productimage1, $productimage2, $productimage3, $productpricebd);
    $stmt->execute();
    $stmt->close();

    $_SESSION['msg'] = "Product Inserted Successfully !!";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Admin | Insert Product</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <link href="images/icons/css/font-awesome.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
    <script src="http://js.nicedit.com/nicEdit-latest.js"></script>
    <script>bkLib.onDomLoaded(nicEditors.allTextAreas);</script>
    <script src="scripts/jquery-1.9.1.min.js"></script>
    <script>
    function getSubcat(val) {
        $.ajax({
            type: "POST",
            url: "get_subcat.php",
            data: 'cat_id=' + val,
            success: function(data){
                $("#subcategory").html(data);
            }
        });
    }
    </script>
</head>

<body>
<?php include('include/header.php'); ?>
<div class="wrapper">
    <div class="container">
        <div class="row">
            <?php include('include/sidebar.php'); ?>
            <div class="span9">
                <div class="content">
                    <div class="module">
                        <div class="module-head">
                            <h3>Insert Product</h3>
                        </div>
                        <div class="module-body">
                            <?php if (isset($_SESSION['msg'])) { ?>
                                <div class="alert alert-success">
                                    <button type="button" class="close" data-dismiss="alert">×</button>
                                    <strong>Well done!</strong> <?php echo htmlentities($_SESSION['msg']); unset($_SESSION['msg']); ?>
                                </div>
                            <?php } ?>

                            <form class="form-horizontal row-fluid" name="insertproduct" method="post" enctype="multipart/form-data">
                                <div class="control-group">
                                    <label class="control-label">Category</label>
                                    <div class="controls">
                                        <select name="category" class="span8 tip" onChange="getSubcat(this.value);" required>
                                            <option value="">Select Category</option>
                                            <?php
                                            $query = mysqli_query($con, "SELECT * FROM category");
                                            while ($row = mysqli_fetch_array($query)) {
                                                echo "<option value='".$row['id']."'>".$row['categoryName']."</option>";
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">Sub Category</label>
                                    <div class="controls">
                                        <select name="subcategory" id="subcategory" class="span8 tip" required></select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">Product Name</label>
                                    <div class="controls">
                                        <input type="text" name="productName" placeholder="Enter Product Name" class="span8 tip" required>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">Product Company</label>
                                    <div class="controls">
                                        <input type="text" name="productCompany" placeholder="Enter Product Company" class="span8 tip" required>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">Product Price Before Discount</label>
                                    <div class="controls">
                                        <input type="text" name="productpricebd" placeholder="Enter Product Price" class="span8 tip" required>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">Product Price After Discount</label>
                                    <div class="controls">
                                        <input type="text" name="productprice" placeholder="Enter Selling Price" class="span8 tip" required>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">Product Description</label>
                                    <div class="controls">
                                        <textarea name="productDescription" rows="6" class="span8 tip" placeholder="Enter Product Description"></textarea>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">Shipping Charge</label>
                                    <div class="controls">
                                        <input type="text" name="productShippingcharge" placeholder="Enter Shipping Charge" class="span8 tip" required>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">Availability</label>
                                    <div class="controls">
                                        <select name="productAvailability" class="span8 tip" required>
                                            <option value="">Select</option>
                                            <option value="In Stock">In Stock</option>
                                            <option value="Out of Stock">Out of Stock</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">Product Image 1</label>
                                    <div class="controls">
                                        <input type="file" name="productimage1" required>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">Product Image 2</label>
                                    <div class="controls">
                                        <input type="file" name="productimage2" required>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <label class="control-label">Product Image 3 (optional)</label>
                                    <div class="controls">
                                        <input type="file" name="productimage3">
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                        <button type="submit" name="submit" class="btn btn-primary">Insert</button>
                                    </div>
                                </div>
                            </form>
                        </div> <!-- module-body -->
                    </div> <!-- module -->
                </div> <!-- content -->
            </div> <!-- span9 -->
        </div> <!-- row -->
    </div> <!-- container -->
</div> <!-- wrapper -->

<?php include('include/footer.php'); ?>

<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="scripts/jquery-ui-1.10.1.custom.min.js"></script>
</body>
</html>