-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2025 at 12:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankingsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `acc_no` int(11) NOT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `acc_type` varchar(20) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `opened_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`acc_no`, `cust_id`, `acc_type`, `balance`, `opened_on`) VALUES
(1, 1, 'Savings', 15519, '2023-01-10'),
(2, 2, 'Current', 75000, '2023-03-15'),
(3, 3, 'Savings', 38100, '2023-06-20'),
(4, 4, 'Current', 22000, '2023-07-05'),
(5, 5, 'Savings', 30000, '2023-08-12'),
(13, 13, 'Savings', 55000, '2025-09-10'),
(14, 14, 'Savings', 2000, '2025-09-11');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `name`, `mobile`, `dob`, `address`) VALUES
(1, 'Minhaj', '01711112233', '2000-05-12', 'Chattogram'),
(2, 'Afsana', '01822223344', '1999-11-03', 'Dhaka'),
(3, 'John', '01933334455', '2001-02-25', 'Sylhet'),
(4, 'Jack', '01644445566', '1998-07-19', 'Khulna'),
(5, 'Don', '01555556677', '2002-03-30', 'Barisal'),
(13, 'Tonima Akhter Pinky', '1556166150', '2025-09-11', 'Sylhet'),
(14, 'minhaj khan ', '35452725752', '2025-09-11', 'Sylhet');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL,
  `cust_id` int(11) DEFAULT NULL,
  `loan_amount` double DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `request_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_id`, `cust_id`, `loan_amount`, `status`, `request_date`) VALUES
(1, 1, 50000, 'Approved', '2024-08-01'),
(2, 2, 75000, 'Pending', '2024-09-10'),
(3, 3, 60000, 'Rejected', '2024-07-20'),
(4, 4, 45000, 'Approved', '2024-06-15'),
(5, 5, 80000, 'Pending', '2024-10-05'),
(6, 2, 100000, 'Pending', '2025-09-10'),
(7, 1, 100000, 'Pending', '2025-09-11'),
(8, 5, 100000, 'Pending', '2025-09-11'),
(9, 14, 500000, 'Pending', '2025-09-11');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `txn_id` int(11) NOT NULL,
  `acc_no` int(11) DEFAULT NULL,
  `txn_type` varchar(20) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `txn_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`txn_id`, `acc_no`, `txn_type`, `amount`, `txn_date`) VALUES
(1, 1, 'Deposit', 25000, '2025-09-10 16:25:47'),
(2, 1, 'Withdraw', 25000, '2025-09-10 16:26:28'),
(3, 1, 'Deposit', 1000, '2025-09-10 19:56:34'),
(4, 1, 'Withdraw', 1000, '2025-09-10 19:56:36'),
(5, 13, 'Deposit', 5000, '2025-09-10 21:36:57'),
(6, 13, 'Withdraw', 50000, '2025-09-10 21:37:15'),
(7, 5, 'Deposit', 50000, '2025-09-11 08:33:32'),
(8, 5, 'Withdraw', 50000, '2025-09-11 08:34:12'),
(9, 14, 'Deposit', 1000, '2025-09-11 09:02:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`acc_no`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`txn_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `acc_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `txn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
