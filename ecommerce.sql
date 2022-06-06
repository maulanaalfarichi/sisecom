-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2018 at 03:51 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `optikpemuda`
--

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `id` int(11) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carousel`
--

INSERT INTO `carousel` (`id`, `position`, `link`) VALUES
(1, 1, 'category/Rayban'),
(2, 2, 'category/Tom-Ford'),
(3, 3, 'category/Calvin-Klein');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent`, `position`, `url`) VALUES
(1, 0, 1, 'Rayban'),
(2, 0, 1, 'Calvin-Klein'),
(3, 0, 1, 'Tom-Ford'),
(4, 0, 1, 'Tag-Heuer');

-- --------------------------------------------------------

--
-- Table structure for table `optik_brand`
--

CREATE TABLE `optik_brand` (
  `id` int(11) NOT NULL,
  `for_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `locale` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `optik_brand`
--

INSERT INTO `optik_brand` (`id`, `for_id`, `name`, `locale`) VALUES
(1, 1, 'Rayban', 'en'),
(2, 2, 'Calvin Klein', 'en'),
(3, 3, 'Tom Ford', 'en'),
(4, 4, 'Tag Heuer', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `optik_products`
--

CREATE TABLE `optik_products` (
  `id` int(11) NOT NULL,
  `for_id` int(10) UNSIGNED NOT NULL COMMENT 'id of product',
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` varchar(20) NOT NULL,
  `locale` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `optik_products`
--

INSERT INTO `optik_products` (`id`, `for_id`, `name`, `description`, `price`, `locale`) VALUES
(1, 1, 'Rayban Original 7097-2000', 'Desain Elegant', '1500000', 'en'),
(2, 2, 'Calvin Klein Original CK5415-045', 'Desain Elegant', '1500000', 'en'),
(3, 3, 'Tag Heuer Original 3952-003', 'Desain Elegant', '1500000', 'en'),
(4, 4, 'Rayban Original 4246V-2000', 'Desain Elegant', '1300000', 'en'),
(5, 5, 'Rayban Fibre 8313-004/N3', 'Desain Elegant', '1500000', 'en'),
(6, 6, 'Calvin Klein Original CK5407-195', 'Desain Elegant', '1600000', 'en'),
(7, 7, 'Tom Ford Original 5436D-016', 'Desain Elegant', '1800000', 'en'),
(8, 8, 'Tom Ford Original 5411-001', 'Desain Elegant', '1000000', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(30) NOT NULL,
  `products` varchar(255) NOT NULL COMMENT 'serialized array',
  `status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `time_created`, `type`, `products`, `status`) VALUES
(1, 1, '2018-05-06 11:23:26', 'cash_on_delivery', 'a:1:{i:0;a:2:{s:2:\"id\";s:1:\"2\";s:8:\"quantity\";s:1:\"1\";}}', 3),
(2, 2, '2018-06-28 07:54:39', 'cash_on_delivery', 'a:1:{i:0;a:2:{s:2:\"id\";s:1:\"5\";s:8:\"quantity\";s:1:\"1\";}}', 3),
(3, 3, '2018-06-06 11:28:23', 'cash_on_delivery', 'a:1:{i:0;a:2:{s:2:\"id\";s:1:\"6\";s:8:\"quantity\";s:1:\"1\";}}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders_clients`
--

CREATE TABLE `orders_clients` (
  `id` int(11) NOT NULL,
  `for_order` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(20) NOT NULL,
  `post_code` varchar(10) NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders_clients`
--

INSERT INTO `orders_clients` (`id`, `for_order`, `first_name`, `last_name`, `email`, `phone`, `address`, `city`, `post_code`, `notes`) VALUES
(1, 1, 'Fadhil', 'Amadan', 'fadhil.amadan@yahoo.co.id', '08977348404', 'Jl. Basuki Rachmad No.64, Kutorejo', 'Tuban', '62311', 'Ditunggu'),
(2, 2, 'Lucas', 'Leonard', 'lucas.leonard@gmail.com', '081283763524', 'Jalan Pangeran Diponegoro No.33, Ronggomulyo', 'Tuban', '62313', 'Ditunggu'),
(3, 3, 'Rahmat', 'Bagus', 'rahmat.bagus@gmail.com', '089723492741', 'Jalan Sunan Ampel No.25, Latsari', 'Tuban', '62314', 'Ditunggu');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `folder` int(10) UNSIGNED NOT NULL COMMENT 'product_id is name of folder',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL COMMENT 'category id',
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `link_to` varchar(255) DEFAULT NULL,
  `order_position` int(10) UNSIGNED NOT NULL,
  `tags` varchar(255) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `image`, `folder`, `created_at`, `updated_at`, `category_id`, `quantity`, `url`, `link_to`, `order_position`, `tags`, `hidden`) VALUES
(1, 'images/sU5X7wizwyPsmhvW5CQH40haItIxF5Eb0oCLAfqe.jpeg', 1517491780, '2018-02-01 13:29:41', '2018-06-06 23:27:46', 1, 10, 'Kacamata-Rayban-Original-1', NULL, 2, 'tags', 0),
(2, 'images/N41LOSmdHO7DwlGp6N7DUDJPrbhy19ilSeQE1gPj.png', 1517492067, '2018-02-01 13:34:27', '2018-03-29 07:59:46', 2, 9, 'Kacamata-Calvin-Klein-Original-CK-2', NULL, 1, '', 0),
(3, 'images/eGbi1t6vJVLfEGTbYA0dcm4wsJozmwXBRQDbed2L.png', 1522334075, '2018-03-29 14:34:35', '2018-03-29 08:05:28', 4, 10, 'Kacamata-Tag-Heuer-Original-9', NULL, 1, '', 0),
(4, 'images/TzSgvJO97edZvU2uhssWf61t2e99BMOgcOTsnwMX.jpeg', 1517658536, '2018-02-03 11:48:56', '2018-03-29 08:01:35', 1, 9, 'Kacamata-Rayban-Original-V-4', NULL, 1, '', 0),
(5, 'images/j7AjnlDaJ8zjZUk48ns52BLAcxsyh8jwV6c2EKtL.jpeg', 1517658714, '2018-02-03 11:51:54', '2018-03-29 08:04:27', 1, 9, 'Kacamata-Rayban-Original-Carbon-Fibre-N-5', NULL, 1, '', 0),
(6, 'images/HXPxpgwsw85JGgp1wtum9bKqcfJkUKXkewXnt6fU.png', 1517659007, '2018-02-03 11:56:47', '2018-03-29 08:04:46', 2, 10, 'Kacamata-Calvin-Klein-Original-CK-6', NULL, 1, '', 0),
(7, 'images/sE13RFDjQlpIAFQvcNCK5iHE0qW2BHJ76t59xyrK.jpeg', 1517660281, '2018-02-03 12:18:01', '2018-03-29 08:04:58', 3, 10, 'Kacamata-Tom-Ford-Original-D-7', NULL, 1, '', 0),
(8, 'images/v8K3LGtek5MdFvx4YN5r6PE5hvOflOzqUuAqLi3F.jpeg', 1517661024, '2018-02-03 12:30:24', '2018-03-29 08:05:15', 3, 10, 'Kacamata-Tom-Ford-Original-8', NULL, 1, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `slide_link`
--

CREATE TABLE `slide_link` (
  `id` int(11) NOT NULL,
  `for_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `locale` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `slide_link`
--

INSERT INTO `slide_link` (`id`, `for_id`, `image`, `locale`) VALUES
(1, 1, 'carousel/lidVb0D1RjAMjvqyYl4dtKQtbPOmYSQtZ3Ll885Z.png', 'en'),
(2, 2, 'carousel/72KDk0I6aOkmWJGG78OMh5yviBNTWq5uwRhPFI7U.png', 'en'),
(3, 3, 'carousel/vH69mGfCsnCRWw0AqcsEFKyz8LICKw224xT8e6UI.png', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remember_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `updated_at`, `created_at`, `remember_token`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$10$tjgrkskpjLtzL8YxZ7HrEOJE98nodkXw9gdC9MS/zdfBQACOX.lM2', '2018-01-07 22:06:28', '2018-01-07 22:06:28', 'NA71GtEmyk9cDu5Vm6f9ZQgA9kA43dXtKE4hxkCkgai1jx6KDUgZfOkDnSi5'),
(2, 'Fadhil', 'fadhil@gmail.com', '$2y$10$yYOVAhJthZkigUSfcBQY4uZe/fWR.k45Ad2VlJkL/eqsKLOnXPxm.', '2018-01-18 13:44:24', '2018-01-18 13:44:24', 'BWrb0DrBTgVCk1x6xrv99ZVKblkEPhtK3gErSZwd'),
(3, 'Lucas', 'lucas@gmail.com', '$2y$10$OpmgtFmRWiZ4hBAY9Kq9K.Ns0K1uThJsNdWUMUoK13SnFyNK0BRGi', '2018-01-18 13:44:39', '2018-01-18 13:44:39', 'BWrb0DrBTgVCk1x6xrv99ZVKblkEPhtK3gErSZwd');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url` (`url`);

--
-- Indexes for table `optik_brand`
--
ALTER TABLE `optik_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `optik_products`
--
ALTER TABLE `optik_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `orders_clients`
--
ALTER TABLE `orders_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slide_link`
--
ALTER TABLE `slide_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `optik_brand`
--
ALTER TABLE `optik_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `optik_products`
--
ALTER TABLE `optik_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders_clients`
--
ALTER TABLE `orders_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `slide_link`
--
ALTER TABLE `slide_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
