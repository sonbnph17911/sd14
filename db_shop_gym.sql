-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2023 at 07:55 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_shop_gym`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `description` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','IN_ACTIVE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`description`, `id`, `name`, `status`) VALUES
('Thương hiệu Channel', '424095dc-b43d-4419-87c8-b89ec7d63584', 'Channel', 'ACTIVE'),
('Thương hiệu Gucci', '96086e80-3ab4-4b0d-bb9a-ff96390b3476', 'Gucci', 'ACTIVE'),
('Thương hiệu Dior', '9e6426a7-47ad-4ccd-8e73-a654a8429705', 'Dior', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `description` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','IN_ACTIVE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`description`, `id`, `name`, `status`) VALUES
('Quần', '19f7eb33-e43e-444a-9bf4-2e344b846abf', 'Quần', 'ACTIVE'),
('Áo', '6d41a6ae-e38e-43ce-8b8a-c9ecb67e949e', 'Áo', 'ACTIVE'),
('Mũ', 'af9ef5e3-907c-430a-a4f1-734a876daf8e', 'Mũ', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `description` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','IN_ACTIVE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`description`, `id`, `name`, `status`) VALUES
('Màu vàng', '6f5cd090-dd9e-4d3b-a742-2fb2613812f2', 'Vàng', 'ACTIVE'),
('Màu cam', '94338044-a7a7-4f8a-bcbf-80948a856f1f', 'Cam', 'ACTIVE'),
('Màu đỏ', 'f8e15fdc-3a60-48ee-a346-e98eeee9e955', 'Đỏ', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `feedbacks`
--

CREATE TABLE `feedbacks` (
  `rate` double DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `status` enum('ACTIVE','IN_ACTIVE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `description` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','IN_ACTIVE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`description`, `id`, `name`, `status`) VALUES
('Vải jean', '17ed4896-abcb-4224-83c2-e255c1a4f2db', 'Jean', 'ACTIVE'),
('Vải cotton', '6aa95fd0-de57-4bc4-be9a-fd05becab63a', 'Cotton', 'ACTIVE'),
('Vải kaki', 'a92734b9-ccd6-40d6-bcf6-9b1e3d49c243', 'Kaki', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `total_amount` double DEFAULT NULL,
  `completed_date` datetime(6) DEFAULT NULL,
  `created_date` datetime(6) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `full_name_customer` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `voucher_id` varchar(255) DEFAULT NULL,
  `status` enum('HANGING_INVOICE','WAIT_FOR_CONFIRMATION','PREPARING_GOODS','SHIPPED','DELIVERING','DELIVERED_SUCCESSFULLY','SUCCESS') DEFAULT NULL,
  `type` enum('ONLINE','AT_THE_SHOP') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `is_voucher` bit(1) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `product_detail_id` varchar(255) NOT NULL,
  `status` enum('ACTIVE','IN_ACTIVE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `price` double DEFAULT NULL,
  `brand_id` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','IN_ACTIVE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`price`, `brand_id`, `category_id`, `description`, `id`, `image`, `name`, `status`) VALUES
(1000000, '424095dc-b43d-4419-87c8-b89ec7d63584', '19f7eb33-e43e-444a-9bf4-2e344b846abf', 'Quần Gucci đi cháy phố', '3a3df3f2-341c-4a2b-8189-849fa1c8f646', 'https://kicksgaleria.com/wp-content/uploads/2022/04/496920-X9V05-4245-Gucci-Jogger-01.jpg', 'Quần Gucci Fly', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

CREATE TABLE `product_details` (
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `color_id` varchar(255) NOT NULL,
  `id` varchar(255) NOT NULL,
  `material_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `size_id` varchar(255) NOT NULL,
  `status` enum('ACTIVE','IN_ACTIVE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`price`, `quantity`, `code`, `color_id`, `id`, `material_id`, `product_id`, `size_id`, `status`) VALUES
(0, 10, 'GUCCIF-FLY01', '6f5cd090-dd9e-4d3b-a742-2fb2613812f2', 'eeb3566f-6cb1-446c-b225-6aa757d12101', '17ed4896-abcb-4224-83c2-e255c1a4f2db', '3a3df3f2-341c-4a2b-8189-849fa1c8f646', '069fa0e0-018d-436f-bb47-a046fe3c2fdb', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` varchar(255) NOT NULL,
  `name` enum('ROLE_CUSTOMER','ROLE_SALES','ROLE_WAREHOUSE_MANAGEMENT','ROLE_MODERATOR') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
('11b61d6c-e311-4d23-81c6-ef832dfdd471', 'ROLE_MODERATOR'),
('7fa942b8-ffc8-42ef-9b17-53c2705000ad', 'ROLE_SALES'),
('d2c99fb9-404b-4e96-9c43-756b5b859e83', 'ROLE_CUSTOMER'),
('e131ee84-8ab7-4199-93fe-ceb64465e0e8', 'ROLE_WAREHOUSE_MANAGEMENT');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `description` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','IN_ACTIVE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`description`, `id`, `name`, `status`) VALUES
('Size L', '069fa0e0-018d-436f-bb47-a046fe3c2fdb', 'L', 'ACTIVE'),
('Size M', '410b18e4-8627-4335-ad93-5631243247c5', 'M', 'ACTIVE'),
('Size S', 'c43227ef-ec47-4527-b1c7-e3b376c51906', 'S', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `id` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `status` enum('ACTIVE','IN_ACTIVE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`address`, `avatar`, `email`, `full_name`, `id`, `password`, `phone_number`, `user_name`, `status`) VALUES
('HN', 'image', 'test@gmail.com', 'Quang Vũ', 'a1b6a48d-d73d-496a-b242-0f23be85de0e', '$2a$12$6OQPdsfgP5Ul2Nj2aTlLcuU5q74rVluMlbpxHWPhWvMY0LTNE7uLK', '0987654321', 'vubq', 'ACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `role_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`role_id`, `user_id`) VALUES
('e131ee84-8ab7-4199-93fe-ceb64465e0e8', 'a1b6a48d-d73d-496a-b242-0f23be85de0e');

-- --------------------------------------------------------

--
-- Table structure for table `vouvhers`
--

CREATE TABLE `vouvhers` (
  `value` double DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_by` varchar(255) NOT NULL,
  `id` varchar(255) NOT NULL,
  `status` enum('ACTIVE','IN_ACTIVE') DEFAULT NULL,
  `type` enum('PERCENT','MONEY') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKti2ywtwc29ys1i591rmmaveyc` (`product_id`),
  ADD KEY `FK312drfl5lquu37mu4trk8jkwx` (`user_id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_4gw7a2rkjix1kost1mk42dcc6` (`voucher_id`),
  ADD KEY `FKtjwuphstqm46uffgc7l1r27a9` (`created_by`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjyu2qbqt8gnvno9oe9j2s2ldk` (`order_id`),
  ADD KEY `FKl9w7hjxo9qo8s0glyr4ngkm1d` (`product_detail_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKa3a4mpsfdf4d2y6r8ra3sc8mv` (`brand_id`),
  ADD KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`);

--
-- Indexes for table `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5tcr8s5m0i3prlty9w0crocog` (`color_id`),
  ADD KEY `FKq2yn5xt7o49ewjor6jf69x19d` (`material_id`),
  ADD KEY `FKnfvvq3meg4ha3u1bju9k4is3r` (`product_id`),
  ADD KEY `FKccs28awcbxp3s7mjthrwcdwvn` (`size_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`role_id`,`user_id`),
  ADD KEY `FKj345gk1bovqvfame88rcx7yyx` (`user_id`);

--
-- Indexes for table `vouvhers`
--
ALTER TABLE `vouvhers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKs1fqnlqltw0cqibpdpd7dymxq` (`created_by`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feedbacks`
--
ALTER TABLE `feedbacks`
  ADD CONSTRAINT `FK312drfl5lquu37mu4trk8jkwx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKti2ywtwc29ys1i591rmmaveyc` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKo14a4d2bpnpfcms6yoyntlrmo` FOREIGN KEY (`voucher_id`) REFERENCES `vouvhers` (`id`),
  ADD CONSTRAINT `FKtjwuphstqm46uffgc7l1r27a9` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FKjyu2qbqt8gnvno9oe9j2s2ldk` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FKl9w7hjxo9qo8s0glyr4ngkm1d` FOREIGN KEY (`product_detail_id`) REFERENCES `product_details` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FKa3a4mpsfdf4d2y6r8ra3sc8mv` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `FK5tcr8s5m0i3prlty9w0crocog` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `FKccs28awcbxp3s7mjthrwcdwvn` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`),
  ADD CONSTRAINT `FKnfvvq3meg4ha3u1bju9k4is3r` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKq2yn5xt7o49ewjor6jf69x19d` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FKj345gk1bovqvfame88rcx7yyx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FKt7e7djp752sqn6w22i6ocqy6q` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `vouvhers`
--
ALTER TABLE `vouvhers`
  ADD CONSTRAINT `FKs1fqnlqltw0cqibpdpd7dymxq` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
