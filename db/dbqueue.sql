-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2024 at 03:09 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbqueue`
--

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`id`, `name`, `description`, `created_at`, `updated_at`, `status`) VALUES
(22, '1', 'pay', '2024-05-24', NULL, 1),
(23, '2', 'permit', '2024-05-24', NULL, 1),
(24, '3', 'card', '2024-05-24', NULL, 1),
(25, '4', 'Enrollment', '2024-05-24', NULL, 1),
(26, '5', 'completion', '2024-05-24', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `key` varchar(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `description`, `key`, `created_at`, `updated_at`, `status`) VALUES
(13, 'Cashier', 'pay', '1', '2024-05-24 07:58:49', '2024-05-24 08:41:34', 1),
(14, 'Permit', 'permit', '2', '2024-05-24 08:00:29', NULL, 1),
(15, 'Card', 'card', '3', '2024-05-24 08:33:45', NULL, 1),
(16, 'Enrollment Form', 'Enrollment', '4', '2024-05-24 08:42:41', NULL, 1),
(17, 'Completion Form', 'completion', '5', '2024-05-24 08:56:28', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `display`
--

CREATE TABLE `display` (
  `id` int(11) NOT NULL,
  `message` text,
  `direction` varchar(10) DEFAULT 'left',
  `color` varchar(10) DEFAULT '#ffffff',
  `background_color` varchar(10) NOT NULL DEFAULT '#cdcdcd',
  `border_color` varchar(10) NOT NULL DEFAULT '#ffffff',
  `time_format` varchar(20) DEFAULT 'h:i:s A',
  `date_format` varchar(50) DEFAULT 'd M, Y',
  `updated_at` datetime DEFAULT NULL,
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-single, 2/3-counter,4-department,5-hospital',
  `keyboard_mode` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-inactive,1-active',
  `sms_alert` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0-inactive, 1-active ',
  `show_note` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inactive, 1-active ',
  `show_officer` tinyint(1) NOT NULL DEFAULT '1',
  `show_department` tinyint(1) NOT NULL DEFAULT '1',
  `alert_position` int(2) NOT NULL DEFAULT '3',
  `language` varchar(20) DEFAULT 'English'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `display`
--

INSERT INTO `display` (`id`, `message`, `direction`, `color`, `background_color`, `border_color`, `time_format`, `date_format`, `updated_at`, `display`, `keyboard_mode`, `sms_alert`, `show_note`, `show_officer`, `show_department`, `alert_position`, `language`) VALUES
(1, 'Token - Queuing System for PCLU', 'left', '#000000', '#53bcfd', '#3c8dbc', 'h:i:s A', 'F j, Y', '2024-06-08 11:12:04', 2, 1, 0, 0, 1, 1, 2, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `display_custom`
--

CREATE TABLE `display_custom` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `counters` varchar(64) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '1-active, 2-inactive',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `display_custom`
--

INSERT INTO `display_custom` (`id`, `name`, `description`, `counters`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Floor 1', 'TEST 1', '1,2,3,6', 1, '2020-10-01 03:34:44', '2020-10-01 14:40:10'),
(2, 'Floor 2', 'TEST 2', '6,7,8,9,10', 0, '2020-10-01 03:35:28', '2020-10-01 09:17:20'),
(3, 'Floor 3', 'TEST 3', '8,9,10,11,12,13', 1, '2020-10-01 03:35:51', '2020-10-01 08:48:36'),
(4, 'Floor 4', 'TESTS Floor', '4,5,6,7', 1, '2020-10-01 10:11:00', '2020-10-01 06:58:27');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `favicon` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `copyright_text` varchar(255) DEFAULT NULL,
  `direction` varchar(10) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `timezone` varchar(32) NOT NULL DEFAULT 'Asia/Dhaka'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `title`, `description`, `logo`, `favicon`, `email`, `phone`, `address`, `copyright_text`, `direction`, `language`, `timezone`) VALUES
(1, 'Queuing System for Polytechnic College of La Union', 'Queue', 'public/assets/img/icons/logo.jpg', 'public/assets/img/icons/favicon.jpg', 'lyka@gmail.com', '+325 252 222', 'Demo street, NY-10000', 'copyright@2024', NULL, NULL, 'Asia/Hong_Kong');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `token_no` varchar(10) DEFAULT NULL,
  `client_mobile` varchar(20) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `counter_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `note` varchar(512) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_vip` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-pending, 1-complete, 2-stop',
  `sms_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-pending, 1-sent, 2-quick-send'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `token_no`, `client_mobile`, `department_id`, `counter_id`, `user_id`, `note`, `created_by`, `created_at`, `updated_at`, `is_vip`, `status`, `sms_status`) VALUES
(298, '33000', NULL, 15, 24, 33, NULL, 1, '2024-05-24 08:37:07', '2024-06-08 19:12:37', NULL, 1, 1),
(299, '22000', NULL, 14, 23, 32, NULL, 1, '2024-05-24 08:37:12', '2024-06-08 19:12:40', NULL, 1, 1),
(300, '11001', NULL, 13, 22, 31, NULL, 1, '2024-05-24 08:37:16', '2024-06-08 19:12:43', NULL, 1, 1),
(301, '33001', NULL, 13, 22, 31, NULL, 1, '2024-05-24 08:46:14', '2024-06-08 19:12:45', NULL, 1, 1),
(302, '33002', NULL, 14, 23, 32, NULL, 1, '2024-05-24 08:58:43', '2024-06-08 19:12:48', NULL, 1, 1),
(303, '22001', NULL, 14, 23, 32, NULL, 1, '2024-05-24 08:58:47', '2024-06-08 19:12:59', NULL, 1, 1),
(304, '33001', NULL, 15, 24, 33, NULL, 1, '2024-05-24 08:58:51', '2024-06-08 19:13:02', NULL, 1, 1),
(305, '44000', NULL, 16, 25, 34, NULL, 1, '2024-05-24 08:58:55', '2024-06-08 19:13:04', NULL, 1, 1),
(306, '55000', NULL, 13, 22, 31, NULL, 1, '2024-05-24 08:59:01', '2024-06-08 19:13:07', NULL, 1, 1),
(307, '11000', NULL, 13, 22, 31, NULL, 1, '2024-06-03 06:37:09', '2024-06-08 19:13:09', NULL, 1, 1),
(308, '22000', NULL, 14, 23, 32, NULL, 1, '2024-06-03 06:37:16', '2024-06-08 19:13:12', NULL, 1, 1),
(309, '33000', NULL, 15, 24, 33, NULL, 1, '2024-06-03 06:37:22', '2024-06-03 06:38:33', NULL, 1, 1),
(310, '44000', NULL, 16, 25, 34, NULL, 1, '2024-06-03 06:37:28', '2024-06-03 06:38:28', NULL, 1, 1),
(311, '55000', NULL, 17, 26, 35, NULL, 1, '2024-06-03 06:37:33', '2024-06-03 06:38:16', NULL, 1, 1),
(312, '11001', NULL, 13, 22, 31, NULL, 1, '2024-06-03 06:37:38', '2024-06-03 06:38:11', NULL, 1, 1),
(313, '11000', NULL, 13, 22, 31, NULL, 1, '2024-06-06 07:59:39', '2024-06-08 19:13:14', NULL, 1, 1),
(314, '11000', NULL, 13, 22, 31, NULL, 28, '2024-06-07 02:07:13', '2024-06-08 19:13:16', NULL, 1, 1),
(315, '44000', NULL, 16, 25, 34, NULL, 28, '2024-06-07 02:07:42', '2024-06-08 19:13:18', NULL, 1, 1),
(316, '55000', NULL, 17, 26, 35, NULL, 28, '2024-06-07 02:14:55', '2024-06-08 19:13:20', NULL, 1, 1),
(317, '11001', NULL, 13, 22, 31, NULL, 28, '2024-06-07 10:34:58', '2024-06-08 19:13:22', NULL, 1, 1),
(318, '11002', NULL, 13, 22, 31, NULL, 28, '2024-06-07 10:35:55', '2024-06-08 19:13:25', NULL, 1, 1),
(319, '33000', NULL, 15, 24, 33, NULL, 28, '2024-06-07 10:45:34', '2024-06-08 19:13:29', NULL, 1, 1),
(320, '11000', NULL, 13, 22, 31, NULL, 28, '2024-06-08 19:11:11', '2024-06-08 19:13:31', NULL, 1, 1),
(321, '11001', NULL, 13, 22, 31, NULL, 28, '2024-06-08 19:11:18', '2024-06-08 19:13:33', NULL, 1, 1),
(322, '11002', NULL, 13, 22, 31, NULL, 28, '2024-06-08 19:13:43', NULL, NULL, 0, 0),
(323, '11003', NULL, 13, 22, 31, NULL, 28, '2024-06-08 19:13:49', NULL, NULL, 0, 0),
(324, '11004', NULL, 13, 22, 31, NULL, 28, '2024-06-08 19:13:58', NULL, NULL, 0, 0),
(325, '22000', NULL, 14, 23, 32, NULL, 28, '2024-06-08 19:14:18', NULL, NULL, 0, 0),
(326, '22001', NULL, 14, 23, 32, NULL, 28, '2024-06-08 19:14:23', NULL, NULL, 0, 0),
(327, '33000', NULL, 15, 24, 33, NULL, 28, '2024-06-08 19:14:27', NULL, NULL, 0, 0),
(328, '33001', NULL, 15, 24, 33, NULL, 28, '2024-06-08 19:14:32', NULL, NULL, 0, 0),
(329, '44000', NULL, 16, 25, 34, NULL, 28, '2024-06-08 19:14:36', NULL, NULL, 0, 0),
(330, '44001', NULL, 16, 25, 34, NULL, 28, '2024-06-08 19:14:40', NULL, NULL, 0, 0),
(331, '55000', NULL, 17, 26, 35, NULL, 28, '2024-06-08 19:14:44', NULL, NULL, 0, 0),
(332, '55001', NULL, 17, 26, 35, NULL, 28, '2024-06-08 19:14:48', NULL, NULL, 0, 0),
(333, '22002', NULL, 14, 23, 32, NULL, 28, '2024-06-08 19:15:03', NULL, NULL, 0, 0),
(334, '33002', NULL, 15, 24, 33, NULL, 28, '2024-06-08 19:15:07', NULL, NULL, 0, 0),
(335, '44002', NULL, 16, 25, 34, NULL, 28, '2024-06-08 19:15:12', NULL, NULL, 0, 0),
(336, '55002', NULL, 17, 26, 35, NULL, 28, '2024-06-08 19:15:15', NULL, NULL, 0, 0),
(337, '11005', NULL, 13, 22, 31, NULL, 28, '2024-06-08 19:17:23', NULL, NULL, 0, 0),
(338, '11006', NULL, 13, 22, 31, NULL, 1, '2024-06-08 19:26:23', NULL, NULL, 0, 0),
(339, '11000', NULL, 13, 22, 31, NULL, 1, '2024-06-26 18:43:42', NULL, NULL, 0, 0),
(340, '11001', NULL, 13, 22, 31, NULL, 1, '2024-06-26 18:46:36', NULL, NULL, 0, 0),
(341, '11002', NULL, 13, 22, 31, NULL, 1, '2024-06-26 18:47:33', NULL, NULL, 0, 0),
(342, '44000', NULL, 16, 25, 34, NULL, 1, '2024-06-26 18:47:41', NULL, NULL, 0, 0),
(343, '11003', NULL, 13, 22, 31, NULL, 1, '2024-06-26 18:48:16', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `token_setting`
--

CREATE TABLE `token_setting` (
  `id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `counter_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `token_setting`
--

INSERT INTO `token_setting` (`id`, `department_id`, `counter_id`, `user_id`, `created_at`, `updated_at`, `status`) VALUES
(25, 13, 22, 31, '2024-05-24 07:59:56', NULL, 1),
(26, 14, 23, 32, '2024-05-24 08:01:31', NULL, 1),
(27, 15, 24, 33, '2024-05-24 08:36:14', NULL, 1),
(28, 16, 25, 34, '2024-05-24 08:58:03', NULL, 1),
(29, 17, 26, 35, '2024-05-24 08:58:23', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) UNSIGNED NOT NULL,
  `firstname` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=officer, 2=staff, 3=client, 5=admin',
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active,2=inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `password`, `department_id`, `mobile`, `photo`, `user_type`, `remember_token`, `created_at`, `updated_at`, `status`) VALUES
(1, 'lyka', 'cagiuoa', 'lyka', '$2y$10$sBMhKR6EKE277OcGejcYHecGxygLbFe5KG.UBuAVRUHb1NSNIUQxi', 0, '0123456789', NULL, 5, 'JdpM0clN0EqFPh8vc5EGvcW4ieISwfH3mOzSodYaO6b3addEfZAApuaSzMki', '2016-10-30 00:00:00', '2024-06-23 18:14:47', 1),
(28, 'lyka2', 'lyka2', 'lyka2', '$2y$10$kB2r7a6Gh4euo.v7zkAM0usi2J91Y6Bb/hBj7/EDPTp0K9GODP7PS', NULL, '2165468978798', NULL, 2, 'nIKQaNjQLJB9HaNA3CYUGoF0uyoKhjJfkkz0dTa5j67H435hhCjXFzX1c5D2', '2024-05-22 00:00:00', '2024-06-08 18:51:31', 1),
(31, 'yas', 'yas', 'yas', '$2y$10$gO0QjPrCcLsX6XjNhScRB.KSjO2AZALCZH0j291j87lVF.vJ88nvy', 13, '54654687987987', NULL, 1, 'hqeEcBWQNSxkh1PrrG5o7KN53sDIKn5QB8vO76NWk8x7Qzf5HeJgf16giGyZ', '2024-05-24 00:00:00', '2024-06-08 18:51:13', 1),
(32, 'lyy', 'lyy', 'lyy', '$2y$10$3PcER46KsYnhLp4ua8heuuLjCgrBqjoafVFwQl4wwagGChwyLhs4a', 14, '894849645132', NULL, 1, NULL, '2024-05-24 00:00:00', NULL, 1),
(33, 'daryl', 'daryl', 'daryl', '$2y$10$VgTuAKUYhePVwMqqLuIlTeGd4XrJuzw69OrddgSrpQUB5FlSj.qHu', 15, '654897984132168', NULL, 1, NULL, '2024-05-24 00:00:00', NULL, 1),
(34, 'tin', 'tin', 'tin', '$2y$10$saTb5GII.GMgoMUOn7FND.FVGFfuHiTNvQvkTaPqvaTQxsqyyXu.m', 16, '545', NULL, 1, NULL, '2024-05-24 00:00:00', '2024-05-24 00:00:00', 1),
(35, 'gab', 'gab', 'gab', '$2y$10$FqGeeGerfgd8nUPUJjQywOP2WYmmAI/VFGr4O3412S/tMYFtLVX.G', 17, '5614251231', NULL, 1, NULL, '2024-05-24 00:00:00', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `display`
--
ALTER TABLE `display`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `display_custom`
--
ALTER TABLE `display_custom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token_setting`
--
ALTER TABLE `token_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `counter`
--
ALTER TABLE `counter`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `display`
--
ALTER TABLE `display`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `display_custom`
--
ALTER TABLE `display_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=344;

--
-- AUTO_INCREMENT for table `token_setting`
--
ALTER TABLE `token_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
