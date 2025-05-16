-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2025 at 05:19 PM
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
-- Database: `shopping`
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
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2025-03-31 19:21:18', '');

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
(6, 'Fashion', 'Fashion', '2025-01-01 07:17:37', '');

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

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(16, 8, '27', 1, '2025-05-12 14:06:20', 'COD', 'Delivered'),
(17, 6, '27', 1, '2025-05-13 05:47:56', 'COD', NULL),
(18, 10, '27', 1, '2025-05-13 06:47:52', 'COD', 'Delivered'),
(19, 1, '52', 1, '2025-05-13 06:54:30', 'COD', NULL),
(20, 10, '29', 1, '2025-05-14 15:20:28', 'Debit / Credit card', 'in Process'),
(21, 10, '31', 1, '2025-05-16 14:51:58', 'COD', 'in Process');

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

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(8, 16, 'Delivered', 'Thanks for choosing us.', '2025-05-12 15:26:16'),
(9, 18, 'in Process', 'Thanks for choosing us.', '2025-05-13 06:57:02'),
(10, 18, 'in Process', 'In process the order.', '2025-05-13 06:58:35'),
(11, 18, 'Delivered', 'Order delivered!', '2025-05-13 07:00:14'),
(12, 20, 'in Process', 'In process the order.', '2025-05-14 15:22:12'),
(13, 21, 'in Process', 'In process..', '2025-05-16 14:54:32');

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
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(39, 6, 28, 'Peach Casual Shirt', 'MFM', 499, 599, 'A stylish men\\\'s peach-colored casual shirt with a slim fit, full sleeves, and a button-down design. It features a modern look with a slightly open collar, ideal for parties or semi-formal occasions. Paired with black trousers for a sleek contrast.', '_EM3__1_.jpg', '_EM3__2_.jpg', '_EM3__3_.jpg', 49, 'In Stock', '2025-05-11 07:48:09', NULL),
(42, 6, 28, 'Latest Mens Fancy Wool Blend Full Sleeve Regular Fit High Neck Sweater.', 'MFM', 699, 799, 'A sleek black wool-blend high neck sweater with a snug fit, ideal for winter layering. Its ribbed texture and minimalist style make it suitable for both casual and semi-formal wear.', '_EM6__3_.jpg', '_EM6__1_.jpg', '_EM6__2_.jpg', 50, 'In Stock', '2025-05-11 10:56:25', NULL),
(43, 6, 28, 'Peach Casual Shirt', 'MFM', 750, 799, 'A stylish men\\\'s peach-colored casual shirt with a slim fit, full sleeves, and a button-down design. It features a modern look with a slightly open collar, ideal for parties or semi-formal occasions. Paired with black trousers for a sleek contrast.', '_EM3__2_.jpg', '_EM3__1_.jpg', '_EM3__3_.jpg', 50, 'In Stock', '2025-05-11 10:57:33', NULL),
(47, 6, 29, 'Women kurta', 'MFM', 400, 499, 'Stylish Women kurta for casual occasions.', 'bb.jpg', 'bbb.jpg', 'b.jpg', 50, 'In Stock', '2025-05-12 14:33:49', NULL),
(48, 6, 29, 'Women Stylish Kurta', 'MFM', 500, 599, '<li data-start=\\\"367\\\" data-end=\\\"568\\\" class=\\\"\\\"><p data-start=\\\"370\\\" data-end=\\\"568\\\" class=\\\"\\\">Kurtas often come in vibrant colors and patterns, such as floral, geometric, and ethnic prints. They may also feature intricate embroidery, block printing, or sequins for added elegance.</p>\\r\\n</li>\\r\\n<li data-start=\\\"570\\\" data-end=\\\"782\\\" class=\\\"\\\">\\r\\n<p data-start=\\\"573\\\" data-end=\\\"782\\\" class=\\\"\\\"></p></li>', 'c.jpg', 'cc.jpg', 'ccc.jpg', 50, 'In Stock', '2025-05-12 14:41:46', NULL),
(49, 6, 28, 'Men kurta', 'MFM', 750, 799, '<p data-start=\\\"119\\\" data-end=\\\"171\\\" class=\\\"\\\"><strong data-start=\\\"119\\\" data-end=\\\"171\\\">Mens Kurta – Elegant Comfort for Every Occasion</strong></p>\\r\\n<p data-start=\\\"173\\\" data-end=\\\"527\\\" class=\\\"\\\">Step into timeless tradition with our classic men’s kurta, crafted from premium fabric for all-day comfort and style. Featuring a banded neckline, straight-cut design, and full sleeves, this versatile kurta is perfect for festive events, casual outings, or daily wear. Pair it with pyjamas, jeans, or a churidar to complete your ethnic look effortlessly.</p>', 'ddd.jpg', 'd.jpg', 'dd.jpg', 100, 'In Stock', '2025-05-12 14:53:36', NULL),
(50, 6, 28, 'Men purple shirt', 'MFM', 450, 499, '<p data-start=\\\"154\\\" data-end=\\\"641\\\" class=\\\"\\\">Step up your style game with this <strong data-start=\\\"188\\\" data-end=\\\"218\\\">Mens Classic Purple Shirt</strong>, designed for both formal flair and casual charm. Crafted from high-quality cotton-blend fabric, it offers all-day comfort and breathability. The rich purple hue adds a bold, modern twist to traditional menswear, making it perfect for office meetings, evening events, or smart weekend outings. Featuring a sharp spread collar, full button-down front, and tailored fit, this shirt pairs effortlessly with trousers or jeans.</p>', 'fff.jpg', 'ff.jpg', 'f.jpg', 50, 'Out of Stock', '2025-05-12 15:11:12', NULL),
(51, 6, 28, 'Mens Casual Kurta Set', 'MFM', 750, 799, '<p data-start=\\\"112\\\" data-end=\\\"638\\\" class=\\\"\\\">Elevate your ethnic wardrobe with this <strong data-start=\\\"151\\\" data-end=\\\"177\\\">Mens Casual Kurta Set</strong>, a perfect blend of comfort and style. Crafted from soft, breathable cotton fabric, the set includes a straight-cut kurta paired with matching pajama pants for a relaxed yet refined look. The kurta features a classic mandarin collar, side slits, and wooden button detailing, making it ideal for festive gatherings, family functions, or casual day-outs. Its subtle design and easy fit ensure you look effortlessly stylish while staying comfortable all day long.</p>', 'eee.jpg', 'e.jpg', 'ee.jpg', 50, 'In Stock', '2025-05-12 15:18:19', NULL),
(52, 6, 28, 'Men\\\'s Sweatshirts', 'MFM', 520, 599, 'Men\\\'s Stylish sweatshirt.', '_EM4__2_.jpg', '_EM4__3_.jpg', '_EM4__1_.jpg', 50, 'In Stock', '2025-05-13 06:53:31', NULL),
(53, 6, 29, 'Beige Co-ord Set with Lace Detailing', 'MFM', 500, 599, 'This elegant beige co-ord set features a straight-fit kurti with delicate lacework on the sleeves and pant hems, offering a chic and graceful look. Perfect for office wear or casual events, its minimal design and soft tone make it a versatile wardrobe choice.', 'gg.jpg', 'ggg.jpg', 'g.jpg', 50, 'In Stock', '2025-05-14 15:44:23', NULL),
(54, 6, 29, 'Plum Bell-Sleeve Top', 'MFM', 450, 499, '<div>A stylish plum-colored top with bell sleeves and front detailing, perfect for office wear or a classy casual look when paired with trousers or jean.</div>', 'jj.jpg', 'jjj.jpg', 'j.jpg', 50, 'In Stock', '2025-05-14 15:49:26', NULL),
(55, 6, 29, 'Mint Green Kurti Set', 'MFM', 600, 799, '<div>A soothing mint green kurti set with subtle embroidery and scalloped edges, offering a soft and elegant appearance ideal for casual or semi-formal occasions.</div>', 'ii.jpg', 'iii.jpg', '', 50, 'In Stock', '2025-05-14 15:52:36', NULL),
(56, 6, 28, 'Yellow Tie-Dye Kurta Set', 'MFM', 700, 799, '<div>A vibrant yellow and white tie-dye kurta with a mandarin collar, paired with white churidar pants—perfect for festive occasions or traditional events with a trendy touch.</div>', 'lll.jpg', 'll.jpg', 'l.jpg', 50, 'In Stock', '2025-05-14 15:57:08', NULL),
(57, 6, 28, 'Green & White Striped Casual Shirt', 'MFM', 680, 699, '<div>A stylish green and white vertical striped shirt with a relaxed fit and button-down design, ideal for casual outings or summer days.</div>', 'm.jpg', 'mm.jpg', 'mmm.jpg', 50, 'In Stock', '2025-05-14 15:59:47', NULL),
(58, 6, 28, 'Mustard Yellow Slim Fit Shirt', 'MFM', 800, 999, '<div>A trendy mustard yellow shirt with a sleek mandarin collar and rolled sleeves, perfect for casual or semi-formal wear with a modern edge.</div>', 'n.jpg', 'nn.jpg', 'nnn.jpg', 50, 'In Stock', '2025-05-14 16:01:43', NULL);

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
(24, 6, 'Fashion', '2025-05-09 11:57:18', NULL),
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

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 'mahek@gmail.com', 0x3132372e302e302e3100000000000000, '2025-04-02 09:11:28', '02-04-2025 02:43:43 PM', 1),
(2, 'johndeo@gmail.com', 0x3132372e302e302e3100000000000000, '2025-01-02 09:15:08', NULL, 1),
(3, 'johndeo@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-07 17:09:29', NULL, 1),
(4, 'Test@123', 0x3a3a3100000000000000000000000000, '2025-05-09 15:20:48', NULL, 0),
(5, 'Test@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-09 15:21:22', NULL, 0),
(6, 'mnaaz@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-09 16:18:19', NULL, 1),
(7, 'mnaaz@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-10 05:18:11', NULL, 1),
(8, 'mnaaz@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-10 12:24:45', NULL, 1),
(9, 'mnaaz@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-10 12:47:03', NULL, 1),
(10, 'mnaaz@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-10 13:31:54', NULL, 1),
(11, 'mnaaz@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-10 17:20:30', NULL, 1),
(12, 'mnaaz@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-11 07:06:55', NULL, 1),
(13, 'mnaaz@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-11 09:25:21', NULL, 1),
(14, 'mfm@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-11 11:43:22', NULL, 1),
(15, 'mfm@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-11 12:26:35', NULL, 0),
(16, 'mfm@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-11 12:26:43', NULL, 0),
(17, 'mfm@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-11 12:26:54', NULL, 0),
(18, 'mfm@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-11 12:27:54', NULL, 0),
(19, 'mahek@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-12 14:05:50', NULL, 1),
(20, 'mahekbepari813@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-12 16:14:13', NULL, 0),
(21, 'mahekbepari813@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-12 16:14:13', NULL, 0),
(22, 'mnaaz3724@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-12 16:14:55', NULL, 1),
(23, 'mnaaz@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-13 05:45:54', NULL, 1),
(24, 'mnaaz@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-13 06:03:53', NULL, 1),
(25, 'ultimez@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-13 06:46:18', NULL, 1),
(26, 'ultimez@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-14 15:16:19', '14-05-2025 08:56:54 PM', 1),
(27, 'a@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-16 14:51:37', NULL, 0),
(28, 'ultimez@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-16 14:51:48', '16-05-2025 08:26:05 PM', 1);

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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(4, 'John Doe', 'johndeo@gmail.com', 4564566554, 'f925916e2754e5e03f75dd58a5733251', 'A 12323 XYZ Apartment ', 'Delhi', 'New Delhi', 110092, 'A 12323 XYZ Apartment ', 'Delhi', 'New Delhi', 110092, '2025-01-01 07:30:50', NULL),
(6, 'mnaaz', 'mnaaz@gmail.com', 9980915255, 'df859cc3177c3aa66a0c73e3569a1ecc', 'Hubli', 'Karnataka', 'Hubli', 110092, 'jhjsc', 'Delhi', 'New Delhi', 110092, '2025-05-09 16:18:06', NULL),
(7, 'MFM', 'mfm@gmail.com', 9980915255, '1ed71198052c6468210e630c28dec397', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-11 11:43:14', NULL),
(8, 'Mahek', 'mahek@gmail.com', 9980915255, '3442ead1d316a5fb8269f982ea1545b9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-12 14:05:28', NULL),
(9, 'Mahek Naaz', 'mnaaz3724@gmail.com', 9980915555, '5ab7ad4af37f82e2ce2d7ec4b900d7b1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-12 16:14:50', NULL),
(10, 'Ultimezian', 'ultimez@gmail.com', 9980915255, '298739a47ab9526fa24b20eb40ec4b5b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-13 06:46:10', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
