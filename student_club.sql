-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2025 at 01:33 PM
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
-- Database: `student_club`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Transaction_ID` int(11) NOT NULL,
  `Club_ID` int(11) DEFAULT NULL,
  `Transaction_Date` date DEFAULT NULL,
  `Transaction_Type` varchar(100) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `club`
--

CREATE TABLE `club` (
  `Club_ID` int(20) NOT NULL,
  `Club_Name` varchar(50) NOT NULL,
  `Club_Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_`
--

CREATE TABLE `event_` (
  `Event_ID` int(11) NOT NULL,
  `Club_ID` int(11) DEFAULT NULL,
  `Event_Name` varchar(100) DEFAULT NULL,
  `Event_Description` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_registration`
--

CREATE TABLE `event_registration` (
  `Registration_ID` int(11) NOT NULL,
  `Student_ID` int(11) DEFAULT NULL,
  `Event_ID` int(11) DEFAULT NULL,
  `Ticket_Price` float(10,2) DEFAULT NULL,
  `Event_Date` date DEFAULT NULL,
  `Venue` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `Member_ID` int(11) NOT NULL,
  `Student_ID` int(11) DEFAULT NULL,
  `Club_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `non_member`
--

CREATE TABLE `non_member` (
  `Visitor_ID` int(11) DEFAULT NULL,
  `Student_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `president`
--

CREATE TABLE `president` (
  `President_ID` int(11) NOT NULL,
  `Student_ID` int(11) DEFAULT NULL,
  `Member_ID` int(11) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_ID` int(20) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Middle_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Department` varchar(50) NOT NULL,
  `Semester` varchar(50) NOT NULL,
  `Year` int(20) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_phone`
--

CREATE TABLE `student_phone` (
  `Student_PhoneID` int(20) NOT NULL,
  `Student_ID` int(20) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `Teacher_ID` int(20) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Middle_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_phone`
--

CREATE TABLE `teacher_phone` (
  `Teacher_PhoneID` int(20) NOT NULL,
  `Teacher_ID` int(20) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Transaction_ID`),
  ADD KEY `Club_ID` (`Club_ID`);

--
-- Indexes for table `club`
--
ALTER TABLE `club`
  ADD PRIMARY KEY (`Club_ID`);

--
-- Indexes for table `event_`
--
ALTER TABLE `event_`
  ADD PRIMARY KEY (`Event_ID`),
  ADD KEY `Club_ID` (`Club_ID`);

--
-- Indexes for table `event_registration`
--
ALTER TABLE `event_registration`
  ADD PRIMARY KEY (`Registration_ID`),
  ADD KEY `Student_ID` (`Student_ID`),
  ADD KEY `Event_ID` (`Event_ID`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`Member_ID`),
  ADD KEY `Club_ID` (`Club_ID`),
  ADD KEY `Student_ID` (`Student_ID`);

--
-- Indexes for table `non_member`
--
ALTER TABLE `non_member`
  ADD KEY `Student_ID` (`Student_ID`);

--
-- Indexes for table `president`
--
ALTER TABLE `president`
  ADD PRIMARY KEY (`President_ID`),
  ADD KEY `Member_ID` (`Member_ID`),
  ADD KEY `Student_ID` (`Student_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `student_phone`
--
ALTER TABLE `student_phone`
  ADD PRIMARY KEY (`Student_PhoneID`),
  ADD KEY `Student_ID` (`Student_ID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`Teacher_ID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `teacher_phone`
--
ALTER TABLE `teacher_phone`
  ADD PRIMARY KEY (`Teacher_PhoneID`),
  ADD KEY `Teacher_ID` (`Teacher_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `Transaction_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `club`
--
ALTER TABLE `club`
  MODIFY `Club_ID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_`
--
ALTER TABLE `event_`
  MODIFY `Event_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_registration`
--
ALTER TABLE `event_registration`
  MODIFY `Registration_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `Member_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `president`
--
ALTER TABLE `president`
  MODIFY `President_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `Student_ID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_phone`
--
ALTER TABLE `student_phone`
  MODIFY `Student_PhoneID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `Teacher_ID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_phone`
--
ALTER TABLE `teacher_phone`
  MODIFY `Teacher_PhoneID` int(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Club_ID`) REFERENCES `club` (`Club_ID`);

--
-- Constraints for table `event_`
--
ALTER TABLE `event_`
  ADD CONSTRAINT `event__ibfk_1` FOREIGN KEY (`Club_ID`) REFERENCES `club` (`Club_ID`);

--
-- Constraints for table `event_registration`
--
ALTER TABLE `event_registration`
  ADD CONSTRAINT `event_registration_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  ADD CONSTRAINT `event_registration_ibfk_2` FOREIGN KEY (`Event_ID`) REFERENCES `event_` (`Event_ID`);

--
-- Constraints for table `member`
--
ALTER TABLE `member`
  ADD CONSTRAINT `member_ibfk_1` FOREIGN KEY (`Club_ID`) REFERENCES `club` (`Club_ID`),
  ADD CONSTRAINT `member_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`);

--
-- Constraints for table `non_member`
--
ALTER TABLE `non_member`
  ADD CONSTRAINT `non_member_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`);

--
-- Constraints for table `president`
--
ALTER TABLE `president`
  ADD CONSTRAINT `president_ibfk_1` FOREIGN KEY (`Member_ID`) REFERENCES `member` (`Member_ID`),
  ADD CONSTRAINT `president_ibfk_2` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`);

--
-- Constraints for table `student_phone`
--
ALTER TABLE `student_phone`
  ADD CONSTRAINT `student_phone_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`);

--
-- Constraints for table `teacher_phone`
--
ALTER TABLE `teacher_phone`
  ADD CONSTRAINT `teacher_phone_ibfk_1` FOREIGN KEY (`Teacher_ID`) REFERENCES `teacher` (`Teacher_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
