-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2022 at 01:10 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task-4`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `region_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(512) NOT NULL,
  `name_ar` varchar(512) NOT NULL,
  `image` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(512) NOT NULL,
  `name_ar` varchar(512) NOT NULL,
  `image` varchar(64) NOT NULL,
  `creared_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `citie`
--

CREATE TABLE `citie` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(512) NOT NULL,
  `name_ar` varchar(512) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `complain`
--

CREATE TABLE `complain` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `massege` tinyint(4) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `status` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title-en` varchar(50) NOT NULL,
  `title_ar` varchar(50) NOT NULL,
  `offers` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0 _> active\r\n1 _> not active',
  `code` varchar(20) NOT NULL,
  `conpon_id` bigint(20) UNSIGNED NOT NULL,
  `adresse_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `producte_order`
--

CREATE TABLE `producte_order` (
  `products_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(7,0) NOT NULL,
  `quantitiy` tinyint(3) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(512) NOT NULL,
  `name_ar` varchar(512) NOT NULL,
  `datalis_en` mediumtext NOT NULL,
  `detalis_ar` mediumint(9) NOT NULL,
  `price` decimal(7,0) UNSIGNED NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `code` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '1->active\r\n0-> not activ',
  `image` varchar(64) NOT NULL,
  `subcategor_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `categories_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_offer`
--

CREATE TABLE `product_offer` (
  `produtct_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `price_after_discont` decimal(10,0) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(512) NOT NULL,
  `name_ar` varchar(512) NOT NULL,
  `staus` tinyint(1) NOT NULL COMMENT '1 _> activve\r\n1 -> not active',
  `cities_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `creaad_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(512) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sudtcatergorie`
--

CREATE TABLE `sudtcatergorie` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(512) NOT NULL,
  `name_ar` varchar(512) NOT NULL,
  `image` varchar(64) NOT NULL,
  `status` int(1) NOT NULL COMMENT '0 _> active \r\n1 _> not active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `frist_name` varchar(2) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `email` varchar(320) NOT NULL,
  `email_verifed` varchar(320) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `phone` varchar(11) NOT NULL,
  `phone_verified-at` varchar(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `code` varchar(20) NOT NULL,
  `creaad_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_product`
--

CREATE TABLE `user_product` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adresse_region_fk` (`region_id`),
  ADD KEY `adresse_user_fk` (`user_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `citie`
--
ALTER TABLE `citie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complain`
--
ALTER TABLE `complain`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cimplain_user_fk` (`user_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order-conpon_fk` (`conpon_id`),
  ADD KEY `order_adresse` (`adresse_id`);

--
-- Indexes for table `producte_order`
--
ALTER TABLE `producte_order`
  ADD KEY `productorder_product_fk` (`products_id`),
  ADD KEY `productorder_order_fk` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `prducte_subcategor_fk` (`subcategor_id`),
  ADD KEY `prduct_brand-fk` (`brand_id`),
  ADD KEY `product_categorie_fk` (`categories_id`);

--
-- Indexes for table `product_offer`
--
ALTER TABLE `product_offer`
  ADD KEY `productoffter_order_fk` (`produtct_id`),
  ADD KEY `productoffet_order_fk` (`order_id`);

--
-- Indexes for table `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_cities_fk` (`cities_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD KEY `review_product_fk` (`product_id`),
  ADD KEY `review_user_fk` (`user_id`);

--
-- Indexes for table `specs`
--
ALTER TABLE `specs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_spacs` (`product_id`);

--
-- Indexes for table `sudtcatergorie`
--
ALTER TABLE `sudtcatergorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_product`
--
ALTER TABLE `user_product`
  ADD KEY `userproduct_sudtcatergorie_fk` (`product_id`),
  ADD KEY `userproduct_user_fk` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `citie`
--
ALTER TABLE `citie`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complain`
--
ALTER TABLE `complain`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `region`
--
ALTER TABLE `region`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `specs`
--
ALTER TABLE `specs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sudtcatergorie`
--
ALTER TABLE `sudtcatergorie`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adresse`
--
ALTER TABLE `adresse`
  ADD CONSTRAINT `adresse_region_fk` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`),
  ADD CONSTRAINT `adresse_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `complain`
--
ALTER TABLE `complain`
  ADD CONSTRAINT `cimplain_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order-conpon_fk` FOREIGN KEY (`conpon_id`) REFERENCES `coupon` (`id`),
  ADD CONSTRAINT `order_adresse` FOREIGN KEY (`adresse_id`) REFERENCES `adresse` (`id`);

--
-- Constraints for table `producte_order`
--
ALTER TABLE `producte_order`
  ADD CONSTRAINT `productorder_order_fk` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `productorder_product_fk` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `prduct_brand-fk` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`),
  ADD CONSTRAINT `prducte_subcategor_fk` FOREIGN KEY (`subcategor_id`) REFERENCES `sudtcatergorie` (`id`),
  ADD CONSTRAINT `product_categorie_fk` FOREIGN KEY (`categories_id`) REFERENCES `categorie` (`id`);

--
-- Constraints for table `product_offer`
--
ALTER TABLE `product_offer`
  ADD CONSTRAINT `productoffet_order_fk` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `productoffet_product_fk` FOREIGN KEY (`produtct_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `region_cities_fk` FOREIGN KEY (`cities_id`) REFERENCES `citie` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_product_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `review_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `specs`
--
ALTER TABLE `specs`
  ADD CONSTRAINT `products_spacs` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `user_product`
--
ALTER TABLE `user_product`
  ADD CONSTRAINT `userproduct_sudtcatergorie_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `userproduct_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
