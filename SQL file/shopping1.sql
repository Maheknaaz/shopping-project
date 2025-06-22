-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2025 at 07:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', '6e1bdcbedcd04d33460dc64f465ca044', '2025-03-31 19:21:18', '05-06-2025 09:19:10 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(6, 'Fashion', 'Fashion', '2025-04-01 07:17:37', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) DEFAULT NULL,
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `name`, `summary`, `review`, `reviewDate`) VALUES
(1, 47, 5, 5, 5, 'misbah', 'nice', 'Excellent product!!', '2025-05-19 08:55:58');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL,
  `stock_quantity` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`, `stock_quantity`) VALUES
(36, 6, 29, 'White and Pink Floral Dress', 'MFM', 750, 799, 'A charming white dress with delicate pink floral patterns, this outfit combines elegance and comfort. The flowy silhouette, paired with flutter sleeves, creates a soft, feminine look. Accentuated with a statement belt at the waist, it’s perfect for daytime events, festive occasions, or a graceful casual outing.<div><font face=\"verdana\"><br></font></div><div style=\"text-align: left;\"><font size=\"4\" face=\"verdana\"><b>Color : Pink</b></font></div><div><div style=\"text-align: left;\"><br></div><div><br></div><div><br></div></div>', 'tw8 (1).jpg', 'tw8 (3).jpg', 'tw8 (2).jpg', 50, 'In Stock', '2025-05-10 05:45:03', NULL, 4),
(47, 6, 29, 'Women kurta', 'MFM', 400, 499, 'Stylish Women kurta for casual occasions.<div><br></div><div><b style=\"font-family: verdana; font-size: large;\">Color : Purple</b></div>', 'bb.jpg', 'bbb.jpg', 'b.jpg', 50, 'In Stock', '2025-05-12 14:33:49', NULL, 6),
(48, 6, 29, 'Women Stylish Kurta', 'MFM', 500, 599, '<li data-start=\"&quot;367&quot;\" data-end=\"&quot;568&quot;\" class=\"&quot;&quot;\"><p data-start=\"&quot;370&quot;\" data-end=\"&quot;568&quot;\" class=\"&quot;&quot;\">Kurtas often come in vibrant colors and patterns, such as floral, geometric, and ethnic prints. They may also feature intricate embroidery, block printing, or sequins for added elegance.</p></li><li data-start=\"&quot;367&quot;\" data-end=\"&quot;568&quot;\" class=\"&quot;&quot;\"><p data-start=\"&quot;370&quot;\" data-end=\"&quot;568&quot;\" class=\"&quot;&quot;\"><b style=\"font-family: verdana; font-size: large;\">Color : Brown</b></p></li>', 'c.jpg', 'cc.jpg', 'ccc.jpg', 50, 'In Stock', '2025-05-12 14:41:46', NULL, 6),
(49, 6, 28, 'Men kurta', 'MFM', 750, 799, '<p data-start=\"&quot;119&quot;\" data-end=\"&quot;171&quot;\" class=\"&quot;&quot;\"><strong data-start=\"&quot;119&quot;\" data-end=\"&quot;171&quot;\">Mens Kurta – Elegant Comfort for Every Occasion</strong></p><p data-start=\"&quot;173&quot;\" data-end=\"&quot;527&quot;\" class=\"&quot;&quot;\">Step into timeless tradition with our classic men’s kurta, crafted from premium fabric for all-day comfort and style. Featuring a banded neckline, straight-cut design, and full sleeves, this versatile kurta is perfect for festive events, casual outings, or daily wear. Pair it with pyjamas, jeans, or a churidar to complete your ethnic look effortlessly.</p><p data-start=\"&quot;173&quot;\" data-end=\"&quot;527&quot;\" class=\"&quot;&quot;\"><b style=\"font-family: verdana; font-size: large;\">Color : Printed</b></p>', 'ddd.jpg', 'd.jpg', 'dd.jpg', 100, 'In Stock', '2025-05-12 14:53:36', NULL, 6),
(50, 6, 28, 'Men purple shirt', 'MFM', 450, 499, '<p data-start=\"&quot;154&quot;\" data-end=\"&quot;641&quot;\" class=\"&quot;&quot;\">Step up your style game with this <strong data-start=\"&quot;188&quot;\" data-end=\"&quot;218&quot;\">Mens Classic Purple Shirt</strong>, designed for both formal flair and casual charm. Crafted from high-quality cotton-blend fabric, it offers all-day comfort and breathability. The rich purple hue adds a bold, modern twist to traditional menswear, making it perfect for office meetings, evening events, or smart weekend outings. Featuring a sharp spread collar, full button-down front, and tailored fit, this shirt pairs effortlessly with trousers or jeans.</p><p data-start=\"&quot;154&quot;\" data-end=\"&quot;641&quot;\" class=\"&quot;&quot;\"><b style=\"font-family: verdana; font-size: large;\">Color : Purple</b></p><p data-start=\"&quot;154&quot;\" data-end=\"&quot;641&quot;\" class=\"&quot;&quot;\"><br></p>', 'fff.jpg', 'ff.jpg', 'f.jpg', 50, 'In Stock', '2025-05-12 15:11:12', NULL, 4),
(51, 6, 28, 'Mens Casual Kurta Set', 'MFM', 750, 799, '<p data-start=\"&quot;112&quot;\" data-end=\"&quot;638&quot;\" class=\"&quot;&quot;\">Elevate your ethnic wardrobe with this <strong data-start=\"&quot;151&quot;\" data-end=\"&quot;177&quot;\">Mens Casual Kurta Set</strong>, a perfect blend of comfort and style. Crafted from soft, breathable cotton fabric, the set includes a straight-cut kurta paired with matching pajama pants for a relaxed yet refined look. The kurta features a classic mandarin collar, side slits, and wooden button detailing, making it ideal for festive gatherings, family functions, or casual day-outs. Its subtle design and easy fit ensure you look effortlessly stylish while staying comfortable all day long.</p><p data-start=\"&quot;112&quot;\" data-end=\"&quot;638&quot;\" class=\"&quot;&quot;\"><br></p><p data-start=\"&quot;112&quot;\" data-end=\"&quot;638&quot;\" class=\"&quot;&quot;\"><b style=\"font-family: verdana; font-size: large;\">Color : Black and White</b></p>', 'eee.jpg', 'e.jpg', 'ee.jpg', 50, 'In Stock', '2025-05-12 15:18:19', NULL, 4),
(53, 6, 29, 'Beige Co-ord Set with Lace Detailing', 'MFM', 500, 599, 'This elegant beige co-ord set features a straight-fit kurti with delicate lacework on the sleeves and pant hems, offering a chic and graceful look. Perfect for office wear or casual events, its minimal design and soft tone make it a versatile wardrobe choice.<div><br></div><div><b style=\"font-family: verdana; font-size: large;\">Color : Light beige</b></div>', 'gg.jpg', 'ggg.jpg', 'g.jpg', 50, 'In Stock', '2025-05-14 15:44:23', NULL, 4),
(54, 6, 29, 'Plum Bell-Sleeve Top', 'MFM', 450, 499, '<div>A stylish plum-colored top with bell sleeves and front detailing, perfect for office wear or a classy casual look when paired with trousers or jean.</div><div><br></div><div><b style=\"font-family: verdana; font-size: large;\">Color : Plum</b></div>', 'jj.jpg', 'jjj.jpg', 'j.jpg', 50, 'In Stock', '2025-05-14 15:49:26', NULL, 4),
(55, 6, 29, 'Mint Green Kurti Set', 'MFM', 600, 799, '<div>A soothing mint green kurti set with subtle embroidery and scalloped edges, offering a soft and elegant appearance ideal for casual or semi-formal occasions.</div><div><br></div><div><b style=\"font-family: verdana; font-size: large;\">Color : Mint Green</b></div>', 'ii.jpg', 'iii.jpg', '', 50, 'In Stock', '2025-05-14 15:52:36', NULL, 4),
(56, 6, 28, 'Yellow Tie-Dye Kurta Set', 'MFM', 700, 799, '<div>A vibrant yellow and white tie-dye kurta with a mandarin collar, paired with white churidar pants—perfect for festive occasions or traditional events with a trendy touch.</div><div><br></div><div><b style=\"font-family: verdana; font-size: large;\">Color : Yellow</b></div>', 'lll.jpg', 'll.jpg', 'l.jpg', 50, 'In Stock', '2025-05-14 15:57:08', NULL, 4),
(57, 6, 28, 'Green & White Striped Casual Shirt', 'MFM', 680, 699, '<div>A stylish green and white vertical striped shirt with a relaxed fit and button-down design, ideal for casual outings or summer days.</div><div><br></div><div><b style=\"font-family: verdana; font-size: large;\">Color : Green and White</b></div>', 'm.jpg', 'mm.jpg', 'mmm.jpg', 50, 'In Stock', '2025-05-14 15:59:47', NULL, 6);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(28, 6, 'Men', '2025-05-09 12:55:30', NULL),
(29, 6, 'Women', '2025-05-09 12:55:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
