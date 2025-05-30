-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2025 at 08:48 AM
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
(1, 'admin', 'f9e601f630fc0da4f97e91d7bf8e3e5b', '2025-03-31 19:21:18', '26-05-2025 05:30:10 PM');

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

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(26, 13, '58', 1, '2025-05-19 08:48:38', 'COD', 'Delivered'),
(32, 16, '48', 1, '2025-05-26 12:40:25', 'Debit / Credit card', 'in Process'),
(33, 17, '47', 2, '2025-05-27 08:17:34', 'Debit / Credit card', 'in Process'),
(34, 18, '49', 1, '2025-05-27 08:35:03', 'Internet Banking', 'Delivered'),
(35, 18, '58', 2, '2025-05-27 09:09:39', 'COD', NULL),
(36, 18, '58', 3, '2025-05-27 09:10:14', 'COD', NULL),
(37, 18, '58', 3, '2025-05-28 15:39:32', 'COD', NULL),
(38, 18, '58', 4, '2025-05-28 15:41:08', 'COD', NULL),
(39, 18, '58', 4, '2025-05-28 15:44:45', 'COD', NULL),
(40, 18, '58', 4, '2025-05-29 05:12:20', 'COD', NULL),
(41, 18, '58', 2, '2025-05-29 05:14:55', 'COD', NULL),
(42, 18, '58', 1, '2025-05-29 05:15:56', 'COD', NULL),
(43, 18, '58', 1, '2025-05-29 05:16:53', 'COD', NULL),
(44, 18, '56', 4, '2025-05-29 05:48:33', 'COD', NULL);

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
(16, 26, 'Delivered', 'Thanks for choosing us.', '2025-05-19 08:49:48'),
(17, 30, 'in Process', 'Product is in process.', '2025-05-26 12:02:42'),
(18, 32, 'in Process', 'Ordered in process..', '2025-05-26 12:41:23'),
(19, 33, 'in Process', 'tq', '2025-05-27 08:19:24'),
(20, 34, 'Delivered', 'thank u', '2025-05-27 08:35:52');

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
(36, 6, 29, 'White and Pink Floral Dress', 'MFM', 750, 799, 'A charming white dress with delicate pink floral patterns, this outfit combines elegance and comfort. The flowy silhouette, paired with flutter sleeves, creates a soft, feminine look. Accentuated with a statement belt at the waist, it’s perfect for daytime events, festive occasions, or a graceful casual outing', 'tw8 (1).jpg', 'tw8 (3).jpg', 'tw8 (2).jpg', 50, 'In Stock', '2025-05-10 05:45:03', NULL, 4),
(47, 6, 29, 'Women kurta', 'MFM', 400, 499, 'Stylish Women kurta for casual occasions.', 'bb.jpg', 'bbb.jpg', 'b.jpg', 50, 'In Stock', '2025-05-12 14:33:49', NULL, 6),
(48, 6, 29, 'Women Stylish Kurta', 'MFM', 500, 599, '<li data-start=\\\"367\\\" data-end=\\\"568\\\" class=\\\"\\\"><p data-start=\\\"370\\\" data-end=\\\"568\\\" class=\\\"\\\">Kurtas often come in vibrant colors and patterns, such as floral, geometric, and ethnic prints. They may also feature intricate embroidery, block printing, or sequins for added elegance.</p>\\r\\n</li>\\r\\n<li data-start=\\\"570\\\" data-end=\\\"782\\\" class=\\\"\\\">\\r\\n<p data-start=\\\"573\\\" data-end=\\\"782\\\" class=\\\"\\\"></p></li>', 'c.jpg', 'cc.jpg', 'ccc.jpg', 50, 'In Stock', '2025-05-12 14:41:46', NULL, 4),
(49, 6, 28, 'Men kurta', 'MFM', 750, 799, '<p data-start=\\\"119\\\" data-end=\\\"171\\\" class=\\\"\\\"><strong data-start=\\\"119\\\" data-end=\\\"171\\\">Mens Kurta – Elegant Comfort for Every Occasion</strong></p>\\r\\n<p data-start=\\\"173\\\" data-end=\\\"527\\\" class=\\\"\\\">Step into timeless tradition with our classic men’s kurta, crafted from premium fabric for all-day comfort and style. Featuring a banded neckline, straight-cut design, and full sleeves, this versatile kurta is perfect for festive events, casual outings, or daily wear. Pair it with pyjamas, jeans, or a churidar to complete your ethnic look effortlessly.</p>', 'ddd.jpg', 'd.jpg', 'dd.jpg', 100, 'In Stock', '2025-05-12 14:53:36', NULL, 6),
(50, 6, 28, 'Men purple shirt', 'MFM', 450, 499, '<p data-start=\\\"154\\\" data-end=\\\"641\\\" class=\\\"\\\">Step up your style game with this <strong data-start=\\\"188\\\" data-end=\\\"218\\\">Mens Classic Purple Shirt</strong>, designed for both formal flair and casual charm. Crafted from high-quality cotton-blend fabric, it offers all-day comfort and breathability. The rich purple hue adds a bold, modern twist to traditional menswear, making it perfect for office meetings, evening events, or smart weekend outings. Featuring a sharp spread collar, full button-down front, and tailored fit, this shirt pairs effortlessly with trousers or jeans.</p>', 'fff.jpg', 'ff.jpg', 'f.jpg', 50, 'In Stock', '2025-05-12 15:11:12', NULL, 4),
(51, 6, 28, 'Mens Casual Kurta Set', 'MFM', 750, 799, '<p data-start=\\\"112\\\" data-end=\\\"638\\\" class=\\\"\\\">Elevate your ethnic wardrobe with this <strong data-start=\\\"151\\\" data-end=\\\"177\\\">Mens Casual Kurta Set</strong>, a perfect blend of comfort and style. Crafted from soft, breathable cotton fabric, the set includes a straight-cut kurta paired with matching pajama pants for a relaxed yet refined look. The kurta features a classic mandarin collar, side slits, and wooden button detailing, making it ideal for festive gatherings, family functions, or casual day-outs. Its subtle design and easy fit ensure you look effortlessly stylish while staying comfortable all day long.</p>', 'eee.jpg', 'e.jpg', 'ee.jpg', 50, 'In Stock', '2025-05-12 15:18:19', NULL, 4),
(53, 6, 29, 'Beige Co-ord Set with Lace Detailing', 'MFM', 500, 599, 'This elegant beige co-ord set features a straight-fit kurti with delicate lacework on the sleeves and pant hems, offering a chic and graceful look. Perfect for office wear or casual events, its minimal design and soft tone make it a versatile wardrobe choice.', 'gg.jpg', 'ggg.jpg', 'g.jpg', 50, 'In Stock', '2025-05-14 15:44:23', NULL, 4),
(54, 6, 29, 'Plum Bell-Sleeve Top', 'MFM', 450, 499, '<div>A stylish plum-colored top with bell sleeves and front detailing, perfect for office wear or a classy casual look when paired with trousers or jean.</div>', 'jj.jpg', 'jjj.jpg', 'j.jpg', 50, 'In Stock', '2025-05-14 15:49:26', NULL, 4),
(55, 6, 29, 'Mint Green Kurti Set', 'MFM', 600, 799, '<div>A soothing mint green kurti set with subtle embroidery and scalloped edges, offering a soft and elegant appearance ideal for casual or semi-formal occasions.</div>', 'ii.jpg', 'iii.jpg', '', 50, 'In Stock', '2025-05-14 15:52:36', NULL, 4),
(56, 6, 28, 'Yellow Tie-Dye Kurta Set', 'MFM', 700, 799, '<div>A vibrant yellow and white tie-dye kurta with a mandarin collar, paired with white churidar pants—perfect for festive occasions or traditional events with a trendy touch.</div>', 'lll.jpg', 'll.jpg', 'l.jpg', 50, 'In Stock', '2025-05-14 15:57:08', NULL, 4),
(57, 6, 28, 'Green & White Striped Casual Shirt', 'MFM', 680, 699, '<div>A stylish green and white vertical striped shirt with a relaxed fit and button-down design, ideal for casual outings or summer days.</div>', 'm.jpg', 'mm.jpg', 'mmm.jpg', 50, 'In Stock', '2025-05-14 15:59:47', NULL, 6),
(58, 6, 28, 'Mustard Yellow Slim Fit Shirt', 'MFM', 800, 999, '<div>A trendy mustard yellow shirt with a sleek mandarin collar and rolled sleeves, perfect for casual or semi-formal wear with a modern edge.</div>', 'n.jpg', 'nn.jpg', 'nnn.jpg', 50, 'In Stock', '2025-05-14 16:01:43', NULL, 4);

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
(26, 'ultimez@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-14 15:16:19', '14-05-2025 08:56:54 PM', 1),
(27, 'a@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-16 14:51:37', NULL, 0),
(28, 'ultimez@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-16 14:51:48', '16-05-2025 08:26:05 PM', 1),
(29, 'mis@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-17 05:40:36', NULL, 1),
(30, 'admin@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-17 08:05:56', NULL, 1),
(31, 'mis@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-18 16:18:03', NULL, 1),
(32, 'mis@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-19 08:37:16', NULL, 1),
(33, 'mis@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-19 08:48:15', NULL, 1),
(34, 'mnaaz3724@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-21 16:46:51', NULL, 1),
(35, 'mnaaz3724@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-22 08:45:50', NULL, 1),
(36, 'mnaaz3724@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-23 17:29:45', '23-05-2025 11:28:19 PM', 1),
(37, 'madam@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-26 11:53:49', '26-05-2025 05:24:45 PM', 1),
(38, 'ultimez@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-26 11:54:56', NULL, 0),
(39, 'ultimez@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-26 11:55:03', NULL, 0),
(40, 'maheknaaz@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-26 11:56:07', '26-05-2025 06:09:46 PM', 1),
(41, 'maheknaaz@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-26 12:39:55', NULL, 1),
(42, 'mfm@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-27 08:16:55', NULL, 1),
(43, 'sana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-27 08:30:42', '27-05-2025 03:00:02 PM', 1),
(44, 'sana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-27 09:30:07', NULL, 1),
(45, 'sana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-28 15:39:24', NULL, 1),
(46, 'sana@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-29 05:00:48', '29-05-2025 11:20:04 AM', 1),
(47, 'n@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-29 06:05:44', NULL, 1),
(48, 'mis@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-29 06:08:46', NULL, 1),
(49, 'mis@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-29 06:32:05', NULL, 1);

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
(13, 'mis', 'mis@gmail.com', 2654861231, '7b32339e233ff3249095d2f01c1d00fb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-19 08:48:12', NULL),
(14, 'Mahek Naaz', 'mnaaz3724@gmail.com', 9980915555, 'f8ca569361a345a89b49e6202fe6a9a1', '1234, abc building, main road ,', 'Karnataka', 'Hubli', 580024, '1234, abc building, main road ', 'Karnataka', 'Hubli', 580024, '2025-05-21 16:46:43', NULL),
(15, 'mnaaz', 'madam@gmail.com', 9980915255, '25f9e794323b453885f5181f1b624d0b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-26 11:52:55', NULL),
(16, 'Mahek Naaz', 'maheknaaz@gmail.com', 9980915257, '0d369472f1d16e61f6ea0716696fd7b2', '14, xyz colony,', 'Delhi', 'New Delhi', 110092, '154,Meenakshi complex, deshpande nagar', 'Delhi', 'New Delhi', 110092, '2025-05-26 11:56:01', NULL),
(17, 'mfmfa', 'mfm@gmail.com', 9980915255, '162de64f36ff5fccffb829c78ee3112b', '154,Meenakshi complex, deshpande nagar', 'Delhi', 'New Delhi', 110092, '154,Meenakshi complex, deshpande nagar', 'Delhi', 'New Delhi', 110092, '2025-05-27 08:16:42', NULL),
(18, 'sana', 'sana@gmail.com', 9980915255, 'c84093cc68f9243f938f57eada115b36', '154,Meenakshi complex, deshpande nagar', 'Delhi', 'New Delhi', 110092, '154,Meenakshi complex, deshpande nagar', 'Delhi', 'New Delhi', 110092, '2025-05-27 08:30:27', NULL),
(19, 'Mahek Banu', 'n@gmail.com', 9980915255, 'b75dc40034859b10da328bb089a0755b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-29 06:05:36', NULL),
(20, 'misbahk', 'mis@gmail.com', 9980915255, 'fc586057bbf1d6faa3dca535e16548ad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-29 06:08:36', NULL),
(21, 'Mahi', 'mis@gmail.co', 9980915257, 'fc586057bbf1d6faa3dca535e16548ad', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-29 06:20:53', NULL),
(22, 'mnaaz', 'kousar@gmail.com', 9980915255, 'e7dacf95f7005e860da5d1566d28f667', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-29 06:26:51', NULL),
(23, 'mnaaz', 'kousar@gmail.com', 9980915255, 'e7dacf95f7005e860da5d1566d28f667', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-29 06:32:00', NULL);

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
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `userId`, `productId`, `postingDate`) VALUES
(3, 13, 48, '2025-05-19 08:57:27'),
(6, 18, 58, '2025-05-28 17:41:14');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
