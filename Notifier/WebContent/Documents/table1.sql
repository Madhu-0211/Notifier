-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2021 at 09:38 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `table1`
--

-- --------------------------------------------------------

--
-- Table structure for table `addnote`
--

CREATE TABLE `addnote` (
  `id` int(11) NOT NULL,
  `nbid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nname` varchar(100) NOT NULL,
  `notename` varchar(100) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `Remainder` date NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Tag` varchar(100) NOT NULL,
  `des` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `addnote`
--

INSERT INTO `addnote` (`id`, `nbid`, `email`, `nname`, `notename`, `start`, `end`, `Remainder`, `Status`, `Tag`, `des`) VALUES
(7, 3, 'madhumitha.e.2017.ece@rajalakshmi.edu.in', 'Virtusa', 'Assessment', '2021-05-01', '2021-05-01', '2021-05-01', 'Started', 'Private', 'Complete the test '),
(19, 3, 'madhumitha.e.2017.ece@rajalakshmi.edu.in', 'Virtusa', 'Test-1', '2021-05-01', '2021-05-02', '2021-05-02', 'Started', 'Private', 'Finish '),
(20, 6, 'madhumitha.e.2017.ece@rajalakshmi.edu.in', 'Project', 'Presentation', '2021-05-02', '2021-05-03', '2021-05-03', 'Not started', 'Public', 'PowerPoint');

-- --------------------------------------------------------

--
-- Table structure for table `newnotebook`
--

CREATE TABLE `newnotebook` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nname` varchar(100) NOT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `newnotebook`
--

INSERT INTO `newnotebook` (`id`, `email`, `nname`, `count`) VALUES
(3, 'madhumitha.e.2017.ece@rajalakshmi.edu.in', 'Virtusa', 2),
(6, 'madhumitha.e.2017.ece@rajalakshmi.edu.in', 'Project', 1);

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `username` varchar(100) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `conform` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`username`, `number`, `email`, `password`, `conform`) VALUES
('madhu_02', '9551859474', 'madhumitha.e.2017.ece@rajalakshmi.edu.in', 'madhu02', 'madhu02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addnote`
--
ALTER TABLE `addnote`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newnotebook`
--
ALTER TABLE `newnotebook`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addnote`
--
ALTER TABLE `addnote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `newnotebook`
--
ALTER TABLE `newnotebook`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
