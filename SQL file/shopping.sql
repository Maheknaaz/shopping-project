-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2025 at 06:20 PM
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
(3, 4, '22', 1, '2025-05-07 17:12:09', 'COD', NULL),
(4, 6, '25', 1, '2025-05-10 05:18:32', 'COD', 'Delivered'),
(5, 6, '24', 1, '2025-05-10 13:54:55', 'Internet Banking', NULL),
(6, 6, '34', 1, '2025-05-10 13:54:55', 'Internet Banking', 'Delivered'),
(7, 1, '24', 1, '2025-05-10 14:34:39', 'COD', NULL),
(8, 1, '24', 1, '2025-05-10 14:44:19', 'COD', NULL),
(9, 1, '24', 1, '2025-05-10 17:11:55', 'COD', NULL),
(10, 1, '29', 1, '2025-05-10 17:11:55', 'COD', NULL),
(11, 1, '30', 1, '2025-05-11 08:41:16', 'COD', NULL),
(12, 1, '37', 1, '2025-05-11 08:41:16', 'COD', NULL),
(13, 6, '25', 1, '2025-05-11 10:14:18', 'COD', NULL);

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
(6, 4, 'Delivered', 'Thanks for Choosing us.', '2025-05-10 05:19:37'),
(7, 6, 'Delivered', 'Thanks for choosing us.', '2025-05-11 14:07:21');

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
(26, 6, 28, 'Mens Short Casual Kurta Set', 'MFM', 750, 799, 'Stylish Kurta set for men.', ' EM (1).jpg', ' EM (2).jpg', ' EM (3).jpg', 50, 'In Stock', '2025-05-09 11:58:25', NULL),
(27, 6, 24, 'Yellow Embroidered Kurta', 'MFM', 970, 999, 'Stylish men kurta.', ' EM2 (1).jpg', ' EM2 (2).jpg', ' EM2 (3).jpg', 100, 'In Stock', '2025-05-09 12:51:15', NULL),
(29, 6, 29, 'White and Pink Printed Saree', 'MFM', 970, 999, 'A soft white saree with subtle pink prints and embroidery. Minimalist yet graceful, ideal for daytime functions or poojas.', ' TW (1).jpg', ' TW (2).jpg', ' TW (3).jpg', 50, 'In Stock', '2025-05-09 15:37:16', NULL),
(30, 6, 29, 'Elegant Dress', 'MFM', 999, 1049, 'Elegant dress for women.', ' TW2 (1).jpg', ' TW2 (2).jpg', ' TW2 (3).jpg', 50, 'In Stock', '2025-05-09 15:42:02', NULL),
(31, 6, 29, 'White Embroidered Kurti with Jeans', 'MFM', 450, 499, 'Casual white kurti with colorful floral embroidery around the neck, paired with denim jeans. Great for everyday wear or semi-casual outings.', ' TW3 (1).jpg', ' TW3 (2).jpg', ' TW3 (3).jpg', 50, 'In Stock', '2025-05-09 15:45:06', NULL),
(32, 6, 29, 'Casual Puff-Sleeve Top', 'MFM', 550, 599, 'Stylish white puff-sleeve top with a round neck and cut-out detail, made from soft crinkled fabric—perfect for casual and chic everyday looks.', ' TW4 (1).jpg', ' TW4 (2).jpg', ' TW4 (3).jpg', 50, 'In Stock', '2025-05-10 05:02:15', NULL),
(33, 6, 29, 'Dark Purple Maxi Dress', 'MFM', 389, 399, 'solid-colored maxi dress in dark purple, belted at the waist. Simple and elegant, suitable for semi-formal occasions or dinners.', ' TW5 (1).jpg', ' TW5 (2).jpg', ' TW5 (3).jpg', 50, 'In Stock', '2025-05-10 05:11:56', NULL),
(34, 6, 29, 'Traditional Lehenga with Half Saree Style', 'MFM', 920, 999, 'vibrant South Indian half-saree/lehenga with a pink and orange border, floral pleated skirt, and traditional draping. Ideal for festive and wedding occasions.', ' TW6 (1).jpg', ' TW6 (2).jpg', ' TW6 (3).jpg', 100, 'In Stock', '2025-05-10 05:14:49', NULL),
(35, 6, 29, 'White and Black Dress', 'MFM', 750, 799, 'Modern and chic, this white and black dress pairs a printed top with butterfly motifs and stylish tie-up sleeves with a sleek, high-waisted black skirt. The combination gives a flattering shape and a trendy contrast look—ideal for office wear, dinners, or semi-formal occasions.', ' tw7 (3).jpg', ' tw7 (2).jpg', ' tw7 (1).jpg', 50, 'Out of Stock', '2025-05-10 05:40:26', NULL),
(36, 6, 29, 'White and Pink Floral Dress', 'MFM', 750, 799, 'A charming white dress with delicate pink floral patterns, this outfit combines elegance and comfort. The flowy silhouette, paired with flutter sleeves, creates a soft, feminine look. Accentuated with a statement belt at the waist, it’s perfect for daytime events, festive occasions, or a graceful casual outing', 'tw8 (1).jpg', 'tw8 (3).jpg', 'tw8 (2).jpg', 50, 'Out of Stock', '2025-05-10 05:45:03', NULL),
(39, 6, 28, 'Peach Casual Shirt', 'MFM', 499, 599, 'A stylish men\\\'s peach-colored casual shirt with a slim fit, full sleeves, and a button-down design. It features a modern look with a slightly open collar, ideal for parties or semi-formal occasions. Paired with black trousers for a sleek contrast.', '_EM3__1_.jpg', '_EM3__2_.jpg', '_EM3__3_.jpg', 49, 'In Stock', '2025-05-11 07:48:09', NULL),
(42, 6, 28, 'Latest Mens Fancy Wool Blend Full Sleeve Regular Fit High Neck Sweater.', 'MFM', 699, 799, 'A sleek black wool-blend high neck sweater with a snug fit, ideal for winter layering. Its ribbed texture and minimalist style make it suitable for both casual and semi-formal wear.', '_EM6__3_.jpg', '_EM6__1_.jpg', '_EM6__2_.jpg', 50, 'In Stock', '2025-05-11 10:56:25', NULL),
(43, 6, 28, 'Peach Casual Shirt', 'MFM', 750, 799, 'A stylish men\\\'s peach-colored casual shirt with a slim fit, full sleeves, and a button-down design. It features a modern look with a slightly open collar, ideal for parties or semi-formal occasions. Paired with black trousers for a sleek contrast.', '_EM3__2_.jpg', '_EM3__1_.jpg', '_EM3__3_.jpg', 50, 'In Stock', '2025-05-11 10:57:33', NULL);

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
(18, 'mfm@gmail.com', 0x3a3a3100000000000000000000000000, '2025-05-11 12:27:54', NULL, 0);

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
(7, 'MFM', 'mfm@gmail.com', 9980915255, '1ed71198052c6468210e630c28dec397', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-11 11:43:14', NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
