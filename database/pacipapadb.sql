-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2025 at 04:43 AM
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
-- Database: `pacipapadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `username` varchar(50) NOT NULL,
  `fileID` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `isAdmin` tinyint(1) DEFAULT 0,
  `hashedPassword` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`username`, `fileID`, `email`, `firstName`, `lastName`, `isAdmin`, `hashedPassword`, `salt`) VALUES
('bob_brown', NULL, 'bob@example.com', 'Bob', 'Brown', 0, 'hashed789', 'salt789'),
('jane_smith', NULL, 'jane@example.com', 'Jane', 'Smith', 0, 'hashed456', 'salt456'),
('john_doe', NULL, 'john@example.com', 'John', 'Doe', 0, 'hashed123', 'salt123'),
('madlanh', NULL, 'adlan@email.com', 'Adlan', 'Hafizha', 0, '5131edcd06f6abff359704bc61f5d6ad975876528fd3567d4431f1f7df9b9c2a', 'e81965666c8e619c50c6b0f3118bc9f5');

-- --------------------------------------------------------

--
-- Table structure for table `bookmarks`
--

CREATE TABLE `bookmarks` (
  `username` varchar(50) NOT NULL,
  `moduleID` int(11) NOT NULL,
  `dateBookmarked` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `fileID` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  `path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`fileID`, `name`, `type`, `size`, `path`) VALUES
(1, 'note1.pdf', 'application/pdf', 1024, '/uploads/note1.pdf'),
(2, 'note2.pdf', 'application/pdf', 2048, '/uploads/note2.pdf'),
(3, 'note3.pdf', 'application/pdf', 3072, '/uploads/note3.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `moduleID` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `fileID` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `major` varchar(100) DEFAULT NULL,
  `dateUploaded` datetime DEFAULT NULL,
  `visibility` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`moduleID`, `username`, `fileID`, `name`, `description`, `course`, `major`, `dateUploaded`, `visibility`) VALUES
(1, 'john_doe', 1, 'Pemrograman Dasar', 'Pengenalan algoritma dan pemrograman', 'CS101', 'Computer Science', '2025-06-14 08:53:27', 1),
(2, 'jane_smith', 2, 'Struktur Data', 'Array, Linked List, dan Tree', 'CS201', 'Computer Science', '2025-06-14 08:53:27', 1),
(3, 'bob_brown', 3, 'Basis Data', 'Konsep database dan SQL', 'CS301', 'Information Systems', '2025-06-14 08:53:27', 1),
(4, 'john_doe', 1, 'Kalkulus', 'Limit, turunan, dan integral', 'MATH101', 'Mathematics', '2025-06-14 08:53:27', 1),
(5, 'jane_smith', 2, 'Fisika Dasar', 'Mekanika klasik', 'PHY101', 'Physics', '2025-06-14 08:53:27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `username` varchar(50) NOT NULL,
  `moduleID` int(11) NOT NULL,
  `dateRated` datetime DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `sessionID` varchar(100) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `IPAddress` varchar(45) DEFAULT NULL,
  `userAgent` text DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userdetails`
--

CREATE TABLE `userdetails` (
  `username` varchar(50) NOT NULL,
  `aboutMe` text DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL,
  `linkedin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userdetails`
--

INSERT INTO `userdetails` (`username`, `aboutMe`, `instagram`, `linkedin`) VALUES
('madlanh', '', '', 'www.linkedin.com');

-- --------------------------------------------------------

--
-- Table structure for table `views`
--

CREATE TABLE `views` (
  `viewID` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `moduleID` int(11) DEFAULT NULL,
  `dateViewed` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `views`
--

INSERT INTO `views` (`viewID`, `username`, `moduleID`, `dateViewed`) VALUES
(1, 'madlanh', 1, '2025-06-14 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`username`),
  ADD KEY `fileID` (`fileID`);

--
-- Indexes for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`username`,`moduleID`),
  ADD KEY `moduleID` (`moduleID`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`fileID`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`moduleID`),
  ADD KEY `username` (`username`),
  ADD KEY `fileID` (`fileID`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`username`,`moduleID`),
  ADD KEY `moduleID` (`moduleID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sessionID`),
  ADD KEY `username` (`username`);

--
-- Indexes for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`viewID`),
  ADD KEY `username` (`username`),
  ADD KEY `moduleID` (`moduleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `fileID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `moduleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `views`
--
ALTER TABLE `views`
  MODIFY `viewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`fileID`) REFERENCES `files` (`fileID`);

--
-- Constraints for table `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD CONSTRAINT `bookmarks_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`),
  ADD CONSTRAINT `bookmarks_ibfk_2` FOREIGN KEY (`moduleID`) REFERENCES `notes` (`moduleID`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`),
  ADD CONSTRAINT `notes_ibfk_2` FOREIGN KEY (`fileID`) REFERENCES `files` (`fileID`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`),
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`moduleID`) REFERENCES `notes` (`moduleID`);

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`);

--
-- Constraints for table `userdetails`
--
ALTER TABLE `userdetails`
  ADD CONSTRAINT `userdetails_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`);

--
-- Constraints for table `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `views_ibfk_1` FOREIGN KEY (`username`) REFERENCES `accounts` (`username`),
  ADD CONSTRAINT `views_ibfk_2` FOREIGN KEY (`moduleID`) REFERENCES `notes` (`moduleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
