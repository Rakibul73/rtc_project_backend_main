-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2024 at 12:48 PM
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
-- Database: `pstu_rtc`
--

-- --------------------------------------------------------

--
-- Table structure for table `ActivityPlan`
--

CREATE TABLE `ActivityPlan` (
  `ActivityID` int(11) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `Activity` varchar(255) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `ActivityStatus` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ActivityPlan`
--

INSERT INTO `ActivityPlan` (`ActivityID`, `ProjectID`, `Activity`, `StartDate`, `EndDate`, `ActivityStatus`) VALUES
(18, 64, 'Existing Literature review and antenna specification', '2020-07-01', '2020-08-31', 'Completed'),
(19, 64, 'Antenna design in CST simulation software', '2020-09-01', '2020-11-30', 'Completed'),
(20, 64, 'Compare the performance of high gain UWB antenna and with the existing one', '2020-11-01', '2020-12-30', 'Completed'),
(21, 64, 'Fabricated and measured the antenna parameter', '2021-01-01', '2021-03-30', 'Ongoing'),
(22, 64, 'Imaging analysis in CST simulator', '2021-03-01', '2021-04-30', 'Ongoing'),
(23, 64, 'Project Completion , Journal and Report writing', '2021-03-01', '2021-06-30', 'Ongoing'),
(25, 93, 'Do this ', '2024-04-12', '2024-04-20', 'Ongoing'),
(26, 93, 'Do that', '2024-04-28', '2024-04-30', 'Ongoing'),
(27, 94, 'Do this ', '2024-04-12', '2024-04-20', 'Ongoing'),
(28, 94, 'Do that', '2024-04-28', '2024-04-30', 'Ongoing'),
(29, 95, 'Do this ', '2024-04-12', '2024-04-20', 'Ongoing'),
(30, 95, 'Do that', '2024-04-28', '2024-04-30', 'Ongoing'),
(31, 96, 'ddd', '2024-05-10', '2024-05-11', 'Ongoing');

-- --------------------------------------------------------

--
-- Table structure for table `ActivityPlanHistory`
--

CREATE TABLE `ActivityPlanHistory` (
  `ActivityID` int(11) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `Activity` varchar(255) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `ActivityStatus` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ActivityPlanHistory`
--

INSERT INTO `ActivityPlanHistory` (`ActivityID`, `ProjectID`, `Activity`, `StartDate`, `EndDate`, `ActivityStatus`) VALUES
(1, 64, 'Existing Literature review and antenna specification', '2020-07-01', '2020-08-31', 'Completed'),
(2, 64, 'Antenna design in CST simulation software', '2020-09-01', '2020-11-30', 'Completed'),
(3, 64, 'Compare the performance of high gain UWB antenna and with the existing one', '2020-11-01', '2020-12-30', 'Ongoing'),
(4, 64, 'Fabricated and measured the antenna parameter', '2021-01-01', '2021-03-30', 'Ongoing'),
(5, 64, 'Imaging analysis in CST simulator', '2021-03-01', '2021-04-30', 'Ongoing'),
(6, 64, 'Project Completion , Journal and Report writing', '2021-03-01', '2021-06-30', 'Ongoing'),
(7, 64, 'Existing Literature review and antenna specification', '2020-07-01', '2020-08-31', 'Completed'),
(8, 64, 'Antenna design in CST simulation software', '2020-09-01', '2020-11-30', 'Completed'),
(9, 64, 'Compare the performance of high gain UWB antenna and with the existing one', '2020-11-01', '2020-12-30', 'Completed'),
(10, 64, 'Fabricated and measured the antenna parameter', '2021-01-01', '2021-03-30', 'Ongoing'),
(11, 64, 'Imaging analysis in CST simulator', '2021-03-01', '2021-04-30', 'Ongoing'),
(12, 64, 'Project Completion , Journal and Report writing', '2021-03-01', '2021-06-30', 'Ongoing');

-- --------------------------------------------------------

--
-- Table structure for table `ActivityPlanOriginal`
--

CREATE TABLE `ActivityPlanOriginal` (
  `ActivityID` int(11) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `Activity` varchar(255) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `ActivityStatus` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ActivityPlanOriginal`
--

INSERT INTO `ActivityPlanOriginal` (`ActivityID`, `ProjectID`, `Activity`, `StartDate`, `EndDate`, `ActivityStatus`) VALUES
(18, 64, 'Existing Literature review and antenna specification', '2020-07-01', '2020-08-31', 'Ongoing'),
(19, 64, 'Antenna design in CST simulation software', '2020-09-01', '2020-11-30', 'Ongoing'),
(20, 64, 'Compare the performance of high gain UWB antenna and with the existing one', '2020-11-01', '2020-12-30', 'Ongoing'),
(21, 64, 'Fabricated and measured the antenna parameter', '2021-01-01', '2021-03-30', 'Ongoing'),
(22, 64, 'Imaging analysis in CST simulator', '2021-03-01', '2021-04-30', 'Ongoing'),
(23, 64, 'Project Completion , Journal and Report writing', '2021-03-01', '2021-06-30', 'Ongoing'),
(25, 93, 'Do this ', '2024-04-12', '2024-04-20', 'Ongoing'),
(26, 93, 'Do that', '2024-04-28', '2024-04-30', 'Ongoing'),
(27, 94, 'Do this ', '2024-04-12', '2024-04-20', 'Ongoing'),
(28, 94, 'Do that', '2024-04-28', '2024-04-30', 'Ongoing'),
(29, 95, 'Do this ', '2024-04-12', '2024-04-20', 'Ongoing'),
(30, 95, 'Do that', '2024-04-28', '2024-04-30', 'Ongoing'),
(31, 96, 'ddd', '2024-05-10', '2024-05-11', 'Ongoing');

-- --------------------------------------------------------

--
-- Table structure for table `BudgetPlan`
--

CREATE TABLE `BudgetPlan` (
  `BudgetID` int(11) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `SerialNo` int(11) DEFAULT NULL,
  `Item` varchar(255) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` float DEFAULT NULL,
  `TotalCost` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `BudgetPlan`
--

INSERT INTO `BudgetPlan` (`BudgetID`, `ProjectID`, `SerialNo`, `Item`, `Quantity`, `UnitPrice`, `TotalCost`) VALUES
(5, 64, 1, 'a) Substrate Material', 3, 3000, 9000),
(6, 64, 2, 'b) Fabrication Cost', 3, 2000, 6000),
(7, 64, 3, 'c) Measurement Cost', 3, 2500, 7500),
(8, 64, 4, 'd) Printer', 1, 10000, 10000),
(9, 64, 5, 'e) USB Switch/Router', 2, 1000, 2000),
(10, 64, 6, 'f) Soldering Iron ', 1, 1000, 1000),
(11, 64, 7, 'g) SMA connector', 10, 100, 1000),
(12, 64, 8, 'h)Tool Box', 1, 1500, 1500),
(13, 64, 9, 'j) Mouse, Keyboard', 2, 750, 1500),
(14, 64, 10, 'k)UPS Battery', 1, 1500, 1500),
(15, 64, 11, 'Simulation Soft CST', 1, 18000, 18000),
(16, 64, 0, '', 0, 0, 0),
(17, 64, 0, '', 0, 0, 0),
(18, 93, 1, 'this ', 1, 111, 111),
(19, 93, 2, 'taht', 2, 222, 444),
(20, 94, 1, 'this ', 1, 111, 111),
(21, 94, 2, 'taht', 2, 222, 444),
(22, 95, 1, 'this ', 1, 111, 111),
(23, 95, 2, 'taht', 2, 222, 444),
(24, 96, 1, 'dd', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `BudgetPlanHistory`
--

CREATE TABLE `BudgetPlanHistory` (
  `BudgetID` int(11) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `SerialNo` int(11) DEFAULT NULL,
  `Item` varchar(255) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` float DEFAULT NULL,
  `TotalCost` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `BudgetPlanHistory`
--

INSERT INTO `BudgetPlanHistory` (`BudgetID`, `ProjectID`, `SerialNo`, `Item`, `Quantity`, `UnitPrice`, `TotalCost`) VALUES
(1, 64, 1, 'a) Substrate Material', 3, 3000, 9000),
(2, 64, 2, 'b) Fabrication Cost', 3, 2000, 6000),
(3, 64, 3, 'c) Measurement Cost', 3, 2500, 7500),
(4, 64, 4, 'd) Printer', 1, 10000, 10000),
(5, 64, 5, 'e) USB Switch/Router', 2, 1000, 2000),
(6, 64, 6, 'f) Soldering Iron ', 1, 1000, 1000),
(7, 64, 7, 'g) SMA connector', 10, 100, 1000),
(8, 64, 8, 'h)Tool Box', 1, 1500, 1500),
(9, 64, 9, 'j) Mouse, Keyboard', 2, 750, 1500),
(10, 64, 10, 'k)UPS Battery', 1, 1500, 1500),
(11, 64, 0, '', 0, 0, 0),
(12, 64, 0, '', 0, 0, 0),
(13, 64, 0, '', 0, 0, 0),
(14, 64, 1, 'a) Substrate Material', 3, 3000, 9000),
(15, 64, 2, 'b) Fabrication Cost', 3, 2000, 6000),
(16, 64, 3, 'c) Measurement Cost', 3, 2500, 7500),
(17, 64, 4, 'd) Printer', 1, 10000, 10000),
(18, 64, 5, 'e) USB Switch/Router', 2, 1000, 2000),
(19, 64, 6, 'f) Soldering Iron ', 1, 1000, 1000),
(20, 64, 7, 'g) SMA connector', 10, 100, 1000),
(21, 64, 8, 'h)Tool Box', 1, 1500, 1500),
(22, 64, 9, 'j) Mouse, Keyboard', 2, 750, 1500),
(23, 64, 10, 'k)UPS Battery', 1, 1500, 1500),
(24, 64, 11, 'Simulation Soft CST', 1, 18000, 18000),
(25, 64, 0, '', 0, 0, 0),
(26, 64, 0, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `BudgetPlanOriginal`
--

CREATE TABLE `BudgetPlanOriginal` (
  `BudgetID` int(11) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `SerialNo` int(11) DEFAULT NULL,
  `Item` varchar(255) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `UnitPrice` float DEFAULT NULL,
  `TotalCost` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `BudgetPlanOriginal`
--

INSERT INTO `BudgetPlanOriginal` (`BudgetID`, `ProjectID`, `SerialNo`, `Item`, `Quantity`, `UnitPrice`, `TotalCost`) VALUES
(5, 64, 1, 'a) Substrate Material', 3, 3000, 9000),
(6, 64, 2, 'b) Fabrication Cost', 3, 2000, 6000),
(7, 64, 3, 'c) Measurement Cost', 3, 2500, 7500),
(8, 64, 4, 'd) Printer', 1, 10000, 10000),
(9, 64, 5, 'e) USB Switch/Router', 2, 1000, 2000),
(10, 64, 6, 'f) Soldering Iron ', 1, 1000, 1000),
(11, 64, 7, 'g) SMA connector', 10, 100, 1000),
(12, 64, 8, 'h)Tool Box', 1, 1500, 1500),
(13, 64, 9, 'j) Mouse, Keyboard', 2, 750, 1500),
(14, 64, 10, 'k)UPS Battery', 1, 1500, 1500),
(15, 64, 11, 'I)Simulatiion soft CST', 1, 18000, 18000),
(16, 64, 12, 'Paper, Pen, Marker, Pen drive , CD/DVD, Tonner and others', 0, 9000, 9000),
(17, 64, 13, 'PI Honorium', 1, 12000, 12000),
(18, 93, 1, 'this ', 1, 111, 111),
(19, 93, 2, 'taht', 2, 222, 444),
(20, 94, 1, 'this ', 1, 111, 111),
(21, 94, 2, 'taht', 2, 222, 444),
(22, 95, 1, 'this ', 1, 111, 111),
(23, 95, 2, 'taht', 2, 222, 444),
(24, 96, 1, 'dd', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Notice`
--

CREATE TABLE `Notice` (
  `NoticeID` int(11) NOT NULL,
  `DatePublished` text DEFAULT NULL,
  `Subject` text DEFAULT NULL,
  `NoticeFileLocation` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Notice`
--

INSERT INTO `Notice` (`NoticeID`, `DatePublished`, `Subject`, `NoticeFileLocation`) VALUES
(2, 'Wed, 17 Apr 2024 04:01 PM', 'sutoni mj', 'zzzzzzzzzzzzzzz.docx'),
(3, 'Wed, 17 Apr 2024 04:02 PM', 'avro', 'yyyyyyyyyyyyyyy.docx'),
(4, 'Wed, 17 Apr 2024 07:24 PM', 'image', 'Circular for Project 2022-2023.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `Notification`
--

CREATE TABLE `Notification` (
  `NotificationID` int(11) NOT NULL,
  `SenderUserID` int(11) DEFAULT NULL,
  `ReceiverUserID` int(11) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `IsRead` int(11) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Notification`
--

INSERT INTO `Notification` (`NotificationID`, `SenderUserID`, `ReceiverUserID`, `Message`, `IsRead`, `Timestamp`) VALUES
(2, 5, 1, 'Need Reviewer', 0, '2024-03-17 18:57:14'),
(3, 5, 1, 'Need reviewr point', 0, '2024-03-17 19:23:35'),
(4, 8, 1, 'assign reviewer', 0, '2024-03-17 19:25:07'),
(6, 5, 1, 'ProjectDeletionRequest: Teacher ID: 5 requests deletion of Project ID: 65', 0, '2024-03-21 13:25:00'),
(8, 5, 1, 'ProjectDeletionRequest: Teacher ID: 5 requests deletion of Project ID: 61', 0, '2024-05-01 18:28:36'),
(9, 5, 1, 'ProjectDeletionRequest: Teacher ID: 5 requests deletion of Project ID: 61', 0, '2024-05-01 18:31:28'),
(10, 5, 1, 'ProjectDeletionRequest: Teacher ID: 5 requests deletion of Project ID: 61', 0, '2024-05-01 18:36:57'),
(11, 5, 1, 'ProjectDeletionRequest: Teacher ID: 5 requests deletion of Project ID: 61', 0, '2024-05-01 18:39:22'),
(12, 5, 1, 'ProjectDeletionRequest: Teacher ID: 5 requests deletion of Project ID: 61', 0, '2024-05-01 18:45:22'),
(13, 5, 1, 'ProjectDeletionRequest: Teacher ID: 5 requests deletion of Project ID: 61', 0, '2024-05-01 18:50:14'),
(14, 5, 1, 'ProjectDeletionRequest: Teacher ID: 5 requests deletion of Project ID: 61', 0, '2024-05-01 18:53:07'),
(15, 5, 1, 'ProjectDeletionRequest: Teacher ID: 5 requests deletion of Project ID: 61', 0, '2024-05-01 19:07:36'),
(16, 5, 1, 'ProjectDeletionRequest: Teacher ID: 5 requests deletion of Project ID: 61', 0, '2024-05-01 19:08:14'),
(17, 5, 1, 'ProjectDeletionRequest: Teacher ID: 5 requests deletion of Project ID: 61', 0, '2024-05-01 19:08:57'),
(18, 5, 1, 'ProjectDeletionRequest: Teacher ID: 5 requests deletion of Project ID: 61 for reason: wrong info', 0, '2024-05-01 19:20:59'),
(19, 6, 1, 'ProjectDeletionRequest: Teacher ID: 6 requests deletion of Project ID: 96 for reason: invalid info given', 0, '2024-05-01 19:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `PassReset`
--

CREATE TABLE `PassReset` (
  `Email` varchar(255) NOT NULL,
  `ResetToken` varchar(255) NOT NULL,
  `Used` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `PassReset`
--

INSERT INTO `PassReset` (`Email`, `ResetToken`, `Used`) VALUES
('raqibul.islam.17@gmail.com', 'a8wQ4PZlq8', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ProjectAdvanceFund`
--

CREATE TABLE `ProjectAdvanceFund` (
  `ProjectAdvanceFundID` int(11) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `TotalBudget` float DEFAULT NULL,
  `PiSignatureDate` varchar(255) DEFAULT NULL,
  `ChairmanOfDepartmentSignatureDate` varchar(255) DEFAULT NULL,
  `RequestedAmount` float DEFAULT NULL,
  `RequestForAdvanceFundDone` int(11) DEFAULT NULL,
  `AdvanceFundRecievedDone` int(11) DEFAULT NULL,
  `AdvanceFundSendDone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ProjectAdvanceFund`
--

INSERT INTO `ProjectAdvanceFund` (`ProjectAdvanceFundID`, `ProjectID`, `TotalBudget`, `PiSignatureDate`, `ChairmanOfDepartmentSignatureDate`, `RequestedAmount`, `RequestForAdvanceFundDone`, `AdvanceFundRecievedDone`, `AdvanceFundSendDone`) VALUES
(1, 62, 80000, '2024-05-24 00:00:00.000', '2024-05-19 00:00:00.000', 50000, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ProjectFund`
--

CREATE TABLE `ProjectFund` (
  `ProjectFundID` int(11) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `TotalBudget` float DEFAULT NULL,
  `HonorariumOfPI` float DEFAULT NULL,
  `HonorariumOfCoPI` float DEFAULT NULL,
  `PiSignatureDate` varchar(255) DEFAULT NULL,
  `ChairmanOfDepartmentSignatureDate` varchar(255) DEFAULT NULL,
  `TotalHonorarium` float DEFAULT NULL,
  `RequestForFundDone` int(11) DEFAULT NULL,
  `FundRecievedDone` int(11) DEFAULT NULL,
  `FundSendDone` int(11) DEFAULT NULL,
  `RequestedAmount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ProjectFund`
--

INSERT INTO `ProjectFund` (`ProjectFundID`, `ProjectID`, `TotalBudget`, `HonorariumOfPI`, `HonorariumOfCoPI`, `PiSignatureDate`, `ChairmanOfDepartmentSignatureDate`, `TotalHonorarium`, `RequestForFundDone`, `FundRecievedDone`, `FundSendDone`, `RequestedAmount`) VALUES
(1, 62, 80000, 5000, 5000, '2024-04-05 00:00:00.000', '2024-04-16 00:00:00.000', 10000, NULL, NULL, NULL, NULL),
(3, 64, 80000, 8000, 2000, '2024-04-04 00:00:00.000', '2024-04-04 00:00:00.000', 10000, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ProjectListWithReviewerID`
--

CREATE TABLE `ProjectListWithReviewerID` (
  `ProjectID` int(11) DEFAULT NULL,
  `ReviewerUserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ProjectListWithReviewerID`
--

INSERT INTO `ProjectListWithReviewerID` (`ProjectID`, `ReviewerUserID`) VALUES
(62, 6),
(62, 8),
(62, 10),
(58, 5),
(58, 8),
(58, 11),
(64, 8),
(64, 10),
(64, 11);

-- --------------------------------------------------------

--
-- Table structure for table `ProjectListWithUserID`
--

CREATE TABLE `ProjectListWithUserID` (
  `UserID` int(11) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `ProjectTitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ProjectListWithUserID`
--

INSERT INTO `ProjectListWithUserID` (`UserID`, `ProjectID`, `ProjectTitle`) VALUES
(8, 51, 'Project Titledsfdsf'),
(10, 56, 'Project Title3'),
(11, 57, 'Project Title3'),
(3, 58, 'Project Titledd'),
(6, 59, 'Researching food'),
(6, 60, 'Researching Water'),
(5, 61, 'Design and Development of Compact Wideband Antenna for Microwave based Brain Tumor Imaging'),
(5, 62, 'Wideband 8× 8 patch antenna array for 5G wireless communications'),
(5, 63, 'An Octagonal Ring-shaped Parasitic Resonator Based Compact Ultrawideband Antenna for Microwave Imaging Applications'),
(5, 64, 'A Gap Coupled Hexagonal Split Ring Resonator Based Metamaterial for S-Band and X-Band Microwave Applications'),
(6, 93, 'Ring Resonator Based Metamaterial for S-Band and X-Band Microwave Applications'),
(6, 94, 'Microwave Applications'),
(6, 95, 'S-Band and X-Band Microwave Applications'),
(6, 96, 'dddddddddddddddd');

-- --------------------------------------------------------

--
-- Table structure for table `ProjectMonitoringFeedback`
--

CREATE TABLE `ProjectMonitoringFeedback` (
  `ProjectMonitoringFeedbackID` int(11) NOT NULL,
  `ProjectMonitoringReportID` int(11) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `MonitoringCommitteeUserID` int(11) DEFAULT NULL,
  `Observation` text DEFAULT NULL,
  `Suggestions` text DEFAULT NULL,
  `Recommendations` text DEFAULT NULL,
  `Endorsement` text DEFAULT NULL,
  `MonitoringFeedbackFileLocation` varchar(255) DEFAULT NULL,
  `PiCanViewOrNot` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ProjectMonitoringFeedback`
--

INSERT INTO `ProjectMonitoringFeedback` (`ProjectMonitoringFeedbackID`, `ProjectMonitoringReportID`, `ProjectID`, `MonitoringCommitteeUserID`, `Observation`, `Suggestions`, `Recommendations`, `Endorsement`, `MonitoringFeedbackFileLocation`, `PiCanViewOrNot`) VALUES
(1, 1, 64, 11, '70', '', '', '', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ProjectMonitoringReport`
--

CREATE TABLE `ProjectMonitoringReport` (
  `ProjectMonitoringReportID` int(11) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `ReportDate` text DEFAULT NULL,
  `ReportFileLocation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ProjectMonitoringReport`
--

INSERT INTO `ProjectMonitoringReport` (`ProjectMonitoringReportID`, `ProjectID`, `ReportDate`, `ReportFileLocation`) VALUES
(1, 64, 'Mon, 06 May 2024 12:55 AM', NULL),
(2, 64, 'Sat, 11 May 2024 09:59 PM', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ProjectMonitoringReportActivity`
--

CREATE TABLE `ProjectMonitoringReportActivity` (
  `ProjectMonitoringReportID` int(11) DEFAULT NULL,
  `ActivityID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ProjectMonitoringReportActivity`
--

INSERT INTO `ProjectMonitoringReportActivity` (`ProjectMonitoringReportID`, `ActivityID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12);

-- --------------------------------------------------------

--
-- Table structure for table `ProjectMonitoringReportBudget`
--

CREATE TABLE `ProjectMonitoringReportBudget` (
  `ProjectMonitoringReportID` int(11) DEFAULT NULL,
  `BudgetID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ProjectMonitoringReportBudget`
--

INSERT INTO `ProjectMonitoringReportBudget` (`ProjectMonitoringReportID`, `BudgetID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 18),
(2, 19),
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25),
(2, 26);

-- --------------------------------------------------------

--
-- Table structure for table `ProjectReportListWithMonitoringCommitteeID`
--

CREATE TABLE `ProjectReportListWithMonitoringCommitteeID` (
  `ProjectMonitoringReportID` int(11) DEFAULT NULL,
  `MonitoringCommitteeUserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ProjectReportListWithMonitoringCommitteeID`
--

INSERT INTO `ProjectReportListWithMonitoringCommitteeID` (`ProjectMonitoringReportID`, `MonitoringCommitteeUserID`) VALUES
(1, 8),
(1, 10),
(1, 11);

-- --------------------------------------------------------

--
-- Table structure for table `Projects`
--

CREATE TABLE `Projects` (
  `ProjectID` int(11) NOT NULL,
  `CodeByRTC` varchar(255) DEFAULT NULL,
  `DateRecieved` varchar(255) DEFAULT NULL,
  `CreatorUserID` int(11) DEFAULT NULL,
  `CoPiUserID` int(11) DEFAULT NULL,
  `StudentUserID` int(11) DEFAULT NULL,
  `ProjectTitle` varchar(255) DEFAULT NULL,
  `NatureOfResearchProposal` varchar(255) DEFAULT NULL,
  `NameOfCollaboratingDepartments` varchar(255) DEFAULT NULL,
  `AddressOfCollaboratingDepartments` varchar(255) DEFAULT NULL,
  `NameOfCollaboratingInstitutes` varchar(255) DEFAULT NULL,
  `AddressOfCollaboratingInstitutes` varchar(255) DEFAULT NULL,
  `LocationOfFieldActivities` varchar(255) DEFAULT NULL,
  `DurationOfResearchProjectAnnual` varchar(255) DEFAULT NULL,
  `DurationOfResearchProjectLongTerm` varchar(255) DEFAULT NULL,
  `TotalBudgetOfResearchProposalTK` int(11) DEFAULT NULL,
  `ExternalAgencyFundingSource` varchar(255) DEFAULT NULL,
  `ExternalAgencyFundingSourcesName` varchar(255) DEFAULT NULL,
  `ExternalAgencyFundingSourcesSubmissionDate` varchar(255) DEFAULT NULL,
  `CommitmentOtherResearchProject` varchar(255) DEFAULT NULL,
  `CommitmentOtherResearchProjectName` varchar(255) DEFAULT NULL,
  `ProjectDescription` text DEFAULT NULL,
  `ProjectObjective` text DEFAULT NULL,
  `PstuNationalGoal` text DEFAULT NULL,
  `PriorResearchOverview` text DEFAULT NULL,
  `Methodology` text DEFAULT NULL,
  `MethodologyFileLocation` varchar(255) DEFAULT NULL,
  `ExpectedOutput` text DEFAULT NULL,
  `SuccessIndicators` text DEFAULT NULL,
  `Beneficiaries` text DEFAULT NULL,
  `ManPowerExisting` varchar(255) DEFAULT NULL,
  `ManPowerRequired` varchar(255) DEFAULT NULL,
  `SmallEquipmentExisting` varchar(255) DEFAULT NULL,
  `SmallEquipmentRequired` varchar(255) DEFAULT NULL,
  `ResearchMaterialsExisting` varchar(255) DEFAULT NULL,
  `ResearchMaterialsRequired` varchar(255) DEFAULT NULL,
  `OtherExisting` varchar(255) DEFAULT NULL,
  `OtherRequired` varchar(255) DEFAULT NULL,
  `ResearchCarriedOutPlace` varchar(255) DEFAULT NULL,
  `CreatorUserSealLocation` varchar(255) DEFAULT NULL,
  `CreatorUserSignatureLocation` varchar(255) DEFAULT NULL,
  `CreatorUserSignatureDate` varchar(255) DEFAULT NULL,
  `ChairmanOfDepartmentComment` text DEFAULT NULL,
  `ChairmanOfDepartmentSealLocation` varchar(255) DEFAULT NULL,
  `ChairmanOfDepartmentSignatureLocation` varchar(255) DEFAULT NULL,
  `ChairmanOfDepartmentSignatureDate` varchar(255) DEFAULT NULL,
  `ResultsAndDiscussion` text DEFAULT NULL,
  `KeyAchievements` text DEFAULT NULL,
  `ProjectStatus` varchar(50) DEFAULT NULL,
  `TotalPoints` float DEFAULT NULL,
  `ProjectSoftCopyLocation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Projects`
--

INSERT INTO `Projects` (`ProjectID`, `CodeByRTC`, `DateRecieved`, `CreatorUserID`, `CoPiUserID`, `StudentUserID`, `ProjectTitle`, `NatureOfResearchProposal`, `NameOfCollaboratingDepartments`, `AddressOfCollaboratingDepartments`, `NameOfCollaboratingInstitutes`, `AddressOfCollaboratingInstitutes`, `LocationOfFieldActivities`, `DurationOfResearchProjectAnnual`, `DurationOfResearchProjectLongTerm`, `TotalBudgetOfResearchProposalTK`, `ExternalAgencyFundingSource`, `ExternalAgencyFundingSourcesName`, `ExternalAgencyFundingSourcesSubmissionDate`, `CommitmentOtherResearchProject`, `CommitmentOtherResearchProjectName`, `ProjectDescription`, `ProjectObjective`, `PstuNationalGoal`, `PriorResearchOverview`, `Methodology`, `MethodologyFileLocation`, `ExpectedOutput`, `SuccessIndicators`, `Beneficiaries`, `ManPowerExisting`, `ManPowerRequired`, `SmallEquipmentExisting`, `SmallEquipmentRequired`, `ResearchMaterialsExisting`, `ResearchMaterialsRequired`, `OtherExisting`, `OtherRequired`, `ResearchCarriedOutPlace`, `CreatorUserSealLocation`, `CreatorUserSignatureLocation`, `CreatorUserSignatureDate`, `ChairmanOfDepartmentComment`, `ChairmanOfDepartmentSealLocation`, `ChairmanOfDepartmentSignatureLocation`, `ChairmanOfDepartmentSignatureDate`, `ResultsAndDiscussion`, `KeyAchievements`, `ProjectStatus`, `TotalPoints`, `ProjectSoftCopyLocation`) VALUES
(51, '46546532343234', '2024-03-16 00:00:00.000', 8, 3, 2, 'Project Titledsfdsf', 'Applied', 'Department of Computer and Communication Engineering', 'PSTU patuakhalidfsf', 'Patuakhali Science & Technology University (PSTU)', 'PSTU patuakhalidfsf', 'PSTU patuakhalidsfds', '2024-03-05 00:00:00.000 - 2024-03-07 00:00:00.000', '2024-03-11 00:00:00.000 - 2024-03-12 00:00:00.000', 2147483647, 'Submitted', 'dsfsdf', '2024-03-23 00:00:00.000', 'No', '', 'Introduction, Identification of Problem & Justification osdsff The Research Proposal', 'Specific Objectives of The Proposalsdfsdf', 'Relevance to The Strategic Plan of Pstu & National Develsdfdsfopment Goals', 'Brief Review of Works Already Performed / in Progress Elsewhsdfdsfere With List of References', 'Methodologydsfdsf', 'Screenshot (367).png', 'Expected Outputsfdsf', 'Success Indicatorssdf', 'Beneficiariesfdsfds', 'Existingdsf', 'fRequired', 'Existingf', 'Requirefd', 'Existingf', 'Requiredf', 'Existingf', 'Requirfed', NULL, '10.png', '4.png', '2024-03-03 00:00:00.000', 'Comments of the Chairman of the Departmenfft', '12.png', '14.png', '2024-03-17 00:00:00.000', NULL, NULL, 'Pending', 0, ''),
(56, '4654653', '2024-03-16 00:00:00.000', 10, 4, 2, 'Project Title3', 'Applied', 'Department of Computer and Communication Engineering', 'PSTU patuakhali3', 'Patuakhali Science & Technology University (PSTU)', 'PSTU patuakhali3', 'PSTU patuakhali3', '2024-03-12 00:00:00.000 - 2024-03-20 00:00:00.000', '2024-03-13 00:00:00.000 - 2024-03-20 00:00:00.000', 10000003, 'Not Submitted', '', 'null', 'Yes', 'ccc', 'Introduction, Identification of Problem & Justification of The Research Proposalcc', 'Specific Objectives of The Proposalc', 'Relevance to The Strategic Plan of Pstu & National Development cGoals', 'Brief Review of Works Already Performed / in Progress Elsewhere Witch List of References', 'Methodologyc', '23.png', 'Expected Outputsld', 'Success Indicatorsd', 'Beneficiariesds', 'Existings', 'Requireds', 'Existings', 'Requireds', 'Existings', 'Requireds', 'Existings', 'Requireds', NULL, '11.png', '5.png', '2024-03-21 00:00:00.000', 'Comments of the Chairman of the Departmentd', '12.png', '14.png', '2024-03-22 00:00:00.000', NULL, NULL, 'Pending', 0, ''),
(57, '4654653', '2024-03-16 00:00:00.000', 11, 4, 2, 'Project Title3', 'Applied', 'Department of Computer and Communication Engineering', 'PSTU patuakhali3', 'Patuakhali Science & Technology University (PSTU)', 'PSTU patuakhali3', 'PSTU patuakhali3', '2024-03-12 00:00:00.000 - 2024-03-20 00:00:00.000', '2024-03-13 00:00:00.000 - 2024-03-20 00:00:00.000', 10000003, 'Not Submitted', '', 'null', 'Yes', 'ccc', 'Introduction, Identification of Problem & Justification of The Research Proposalcc', 'Specific Objectives of The Proposalc', 'Relevance to The Strategic Plan of Pstu & National Development cGoals', 'Brief Review of Works Already Performed / in Progress Elsewhere Witch List of References', 'Methodologyc', '23.png', 'Expected Outputsld', 'Success Indicatorsd', 'Beneficiariesds', 'Existings', 'Requireds', 'Existings', 'Requireds', 'Existings', 'Requireds', 'Existings', 'Requireds', NULL, '8.png', '2.png', '2024-03-21 00:00:00.000', 'Comments of the Chairman of the Departmentd', '12.png', '14.png', '2024-03-22 00:00:00.000', NULL, NULL, 'Pending', 0, 'sajib.pdf'),
(58, '4654653', '2024-03-22 00:00:00.000', 3, 4, 2, 'Project Titledd', 'Independent', 'Department of Computer and Communication Engineering', 'PSTU patuakhaliaa', 'Patuakhali Science & Technology University (PSTU)', 'PSTU patuakhaliaa', 'PSTU patuakhalix', '2024-03-18 00:00:00.000 - 2024-03-19 00:00:00.000', '2024-03-27 00:00:00.000 - 2024-03-28 00:00:00.000', 10000003, 'Submitted', 'xx', '2024-03-30 00:00:00.000', 'Yes', 'xx', 'Introduction, Identification of Problem & Justification of The Research Propossal', 'Specific Objectives of The Proposals', 'Relevance to The Strategic Plan of Pstu & National Development Goalss', 'Brief Review of Works Already Performed / in Progsress Elsewhere With List of References', 'Methodologys', '22.png', 'Expected Outputss', 'Success Indicatorss', 'Beneficiariess', 'Existingss', 'Requireds', 'Existings', 'Requireds', 'Existings', 'Requireds', 'Existings', 'Requireds', NULL, 'shanto  .jpg', 'defaultsignature.png', '2024-03-12 00:00:00.000', 'Comments of the Chairman of the Depaertment', '12.png', '17.png', '2024-03-30 00:00:00.000', NULL, NULL, 'Rejected', 19.8667, NULL),
(59, '787989899', '2024-03-05 00:00:00.000', 6, 3, 2, 'Researching food', 'Independent', 'Department of Computer and Communication Engineering', 'PSTU patuakhalibb', 'Patuakhali Science & Technology University (PSTU)', 'PSTU patuakhalibb', 'PSTU patuakhalixxx', '2024-03-03 00:00:00.000 - 2024-03-30 00:00:00.000', '2024-03-24 00:00:00.000 - 2024-03-30 00:00:00.000', 50, 'Submitted', 'TEchbyte', '2024-03-08 00:00:00.000', 'Yes', 'Research apple', 'Introduction, Identification of Problem & Justificati', 'Specific Objectives of The', 'Relevance to The Strategic Plan of Pnt Goals', 'Brief Review of Works Already Performed / in Progresof References', 'Method', '20.png', 'Expected Outp', 'Success Indic', 'Benefic', 'Exist', 'Rjjjj', 'Exisk', 'Requ', 'Ex', 'Re', 'Exist', 'Req', NULL, '9.png', '3.png', '2024-03-16 00:00:00.000', 'Comments of the Chair', '12.png', '14.png', '2024-03-19 00:00:00.000', NULL, NULL, 'Pending', 0, ''),
(60, '1321132', '2024-03-05 00:00:00.000', 6, 8, 2, 'Researching Water', 'Independent', 'Department of Computer and Communication Engineering', 'PSTU patuakhalibb', 'Patuakhali Science & Technology University (PSTU)', 'PSTU patuakhalibb', 'PSTU patuakhalixxx', '2024-03-03 00:00:00.000 - 2024-03-30 00:00:00.000', '2024-03-24 00:00:00.000 - 2024-03-30 00:00:00.000', 50, 'Submitted', 'TEchbyte', '2024-03-08 00:00:00.000', 'Yes', 'Research apple', 'Introduction, Identification of Problem & Justificati', 'Specific Objectives of The', 'Relevance to The Strategic Plan of Pnt Goals', 'Brief Review of Works Already Performed / in Progresof References', 'Method', '20.png', 'Expected Outp', 'Success Indic', 'Benefic', 'Exist', 'Rjjjj', 'Exisk', 'Requ', 'Ex', 'Re', 'Exist', 'Req', NULL, '9.png', '3.png', '2024-03-16 00:00:00.000', 'Comments of the Chair', '12.png', '14.png', '2024-03-19 00:00:00.000', NULL, NULL, 'Pending', 0, 'Project Overview Updated.pdf'),
(61, '865453', '2024-03-16 00:00:00.000', 5, 4, 2, 'Design and Development of Compact Wideband Antenna for Microwave based Brain Tumor Imaging', 'Applied', 'Department of Computer and Communication Engineering', 'PSTU patuakhali', 'Patuakhali Science & Technology University (PSTU)', 'Patuakhali', 'Dept. of Computer and Communication Engineering laboratory, Faculty of CSE', '2020-07-01 00:00:00.000 - 2021-06-30 00:00:00.000', '2020-07-01 00:00:00.000 - 2021-06-30 00:00:00.000', 80000, 'Not Submitted', '', 'null', 'No', '', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a\ncause of death. Brain tumor detection is one of the important possible applications of microwave\nimaging. Microwave imaging is a well-established technique which is being employed to build\nlow-cost and portable medical diagnostic tools. The basis for using microwave techniques in\nmedical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues.\nThe currently available screening systems are not sufficient to detect the brain tumor effectively\nin prehospital environment due to their features of static, bulky and elevated cost. In this project,\na portable imaging system is proposed that uses the difference in contrast in the electrical\nproperties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an\nwideband antenna will be used to transceiver the microwave signal to the head and then the\nbackscattered signal from different parts of the head are collected and processed to get a clear\nimage of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive\nand no side effect, the proposed imaging technique can frequently be used to detect brain tumor in\nhuman head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'The specific objectives of this research can be listed as follows:\n1. To investigate the existing antenna technology for brain tumour imaging for required\nspecification of the antenna\n2. To design and simulate the antenna in CST simulate software\n3. To fabricate the simulated antenna that operates across lower UWB frequency\n4. To design an imaging system in a CST simulated environment for detecting brain tumour.', 'This wideband antenna would play an important on Bangladeshi society. This would be applicable\ndetecting unwanted cells (brain tumor) in human head. As a result this would affect the whole\neconomy and lead the nation ahead. The outcome of this research will be published impact factor\njournal with PSTU affiliation that will impact on university research area.', 'Brain tumor is one of the prime causes of morbidity and mortality and a major burden on health\ncare resources. In the World, every year about 15 million people suffer from stroke of which 5\nmillion die and another 5 million permanently become disabled [1, 2]. Since 2005, the percentage\nof deaths attributed to stroke in general hospitals has ranged from 6.6-8.4% Currently CAT scan,\nMRI, PET scan and ultrasound are commonly used to detect brain tumor. However, CAT scan,\nMRI and PET scan are not available outside the hospital environment due to their large and bulky\nstructure. Moreover, they are characteristics with invasive and elevated cost. Ultrasound though\ncan be used to detect acute stoke but cannot distinguish hemorrhage from ischemic stroke [3] . But\nto avoid death or possibility of disabled it is necessary diagnosis tumor immediate after onset of\nsymptoms so that proper treatments can be initiated. The aforementioned difficulties motivate us\nto develop a new simplified portable imaging system that is noninvasive and less expansive and\nwill be able to provide medical facility to the patients on onset of the stoke symptoms. The\nproposed system can be used as a prehospital diagnosis tool for real time observations to prevent\nsecondary stoke.\nMicrowave imaging technique has recently been used in medical applications as a low cost,\nnoninvasive and portable diagnosis tool. It is already been clinically proved as an effective\nscreening tool for breast cancer detection [4, 5] that is completely safe and no side effect.\nMicrowave imaging of head can be used to detect the presence and location of the damaged brain\ntissues [6].Microwave imaging now become a cost effective nonionizing portable imaging system\nfor brain tumor detection and can be used as an important tool in the emergency room of the\nhospital or by ambulance personal in the scene of onset symptoms. The basic principle of\nmicrowave imaging is the contrast in the dielectric properties between stoke-affected and healthy\nbrain tissues. In comparison to computed tomography and ultrasound, microwave can easily\npropagate through the human tissue and can penetrate the human skull [7]. A number of studies have already been proposed for microwave head imaging. Many of the reported research works\ndone on head imaging is based on numerical studies on simplified head model [8, 9]. Recently,\nMRI based imaging and real times diagnosis of brain injuries on 3D realistic head model were\npresented [10, 11] . However, in some reported experiments the head phantom is oversimplified\nand imaging system uses single UWB sensor (antenna)[11] . Although head phantoms with\ndispersive electric properties are reported recently, still there is scope to improve phantom quality\nwith detail human brain constructions that is very much similar to real human head. Furthermore,\nan imaging system with an array of antennas rather than single antenna is essential to transmit and\nreceive signal to and from head phantom efficiently. In this project, a microwave-based brain\ntumor imaging is proposed using unidirectional and wideband antenna. The proposed antenna will\noperate across the lower UWB.', 'The proposed research project methodology will be divided into three stages:\nStage 1:\nThe project will start with a survey of state-of-the-art antenna technology for a small satellite,\nvarious high gain techniques and real-time measurement system. Required references will be\nobtained from the resources, i.e. library (books, journal etc.) and online/database/internet.\nStage 2:\nAntenna is the key element of any microwave based imaging system. To accommodate within the\nlimited space, the antenna should be compact enough so that more number of antennas can be\narrayed in specific volume. Moreover, to increase the intensity of the transceive signal into the\nhead, the antenna should be unidirectional and pulse distortion free. The enhanced intensity of the\ntransceiver signal increases the power level of backscattered signal and minimizes the unwanted\nbackward interferences. Furthermore, an antenna that operates in the lower microwave frequencies\nof 1- 4 GHz (lower UWB) is required to ensure the effective penetration of the signal into dense\nhuman organ such as head. In this project, a unidirectional antenna that can achieve an operating\nfrequency band ranging from 1- 4 GHz will be proposed. The antenna will be designed and\nsimulated through Computer System Technology microwave studio. A new square enclosed circle\nmicrostrip patch antenna wideband antenna will be designed to meet the microwave head imaging features.\nThe antenna will be mounted on a cost-effective FR-4 substrate with a dielectric constant of 4.4, a dielectric\ntangent loss of 0.0037 and a thickness of 1.5 mm (SH). The FR-4 epoxy substrate was used here as it is\nmore available and much cheaper than any other PCB content. The proposed compact dimension of the\nantenna will 40×30×1.5 mm3 which initial dimension has taken based on patch antenna fundamental\nequations[12]. A 50 Ω microstrip feed line whose width is 2.9 mm and height is 15 mm is connected directly\nto the patch and antenna’s feeding is done through this line. There is a rectangular plane associated with\nthe ground in the ground plane, the length and width of which are marked with Gl and SW, respectively.\nThe top-left and top-right corners of the ground plane were truncated for expanded bandwidth. The antenna\narray is needed for the proposed system to operate in free space. An idea of the considered head imaging\nframework. The antenna covers a frequency span from 1 - 4 GHz.\nStage 3:\nAfter simulation, a laboratory prototype of the antenna will be fabricated, and its return loss and\nradiation pattern will be measured. The fabrication process will be completed using a PCB\nprototyping machine at lab. The Rogers substrate material will be utilized for the fabrication and\nthe antenna prototype will be measured in an anechoic chamber at lab and compare with simulation\nPage 6 of 13\nresults of validation purpose. Finally, a phantom will be designed in CST simulation environment\nand 9 antenna array will be put on the phantom.\nOverall follow chart of the proposed research is displayed in Figure 1', 'Untitled.png', 'Microwave imaging system has the advantages of low cost, high-data rate, low complexity and\nlow spectral power density. For microwave imaging, ultra-wide (UWB) technology has great\npotential to be an alternative imaging technique as it is inexpensive, compactness, high precision\nranging, and non-invasive. With the recent advances in both hardware and software, microwave\nimaging technique has gained much interest due to its low cost and non-ionizing characteristics.\nThe main target is to design a low cost antenna to detect brain tumor through microwave imaging\ntechnique. I have also targeted to publish one ISI and one scopes listed journal articles.\n', 'The success indicator of this project will be designed and prototyped a compact high performance\nantenna for brain tumor detection imaging system.', 'Brain Tumour is one of the main health challenges. Statistics reveal that around 13.2 million deaths\nof cancer/tumour are expected in 2030. Early detection of cancer is an important aspect for\neffective treatment. Widely used detection techniques include X-ray mammography, magnetic\nresonance imaging (MRI), and ultrasound technique. The currently available screening systems\nare not sufficient to detect the brain tumor effectively in prehospital environment due to their\nfeatures of static, bulky and elevated cost. Microwave imaging provides an alternative detection\ntechnique that requires simple configuration. The objective is to detect the variations in the\ndielectric properties of a tumour from the surrounding healthy tissue. Recent technologies,\nparticularly the use of wideband antenna allows resolution enhancement in the detection. ', 'Dr. Md. Samsuzzaman\nAssociate Professor, CCE', 'No', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus\n', 'Computer Printer\nAntivirus', 'Server Computer\ni. Simulation Software\nCST (Computer System\nTechnology)\ni. HFSS (High Frequency\nStructure Simulator)\nVector Network Analyzer\n(VNA)\nNear Field Anechoic Chamber\nOnline books and journal\nResource person\nSubstrate Material\nSMA connector\nFabric', 'CST Simulator\nSubstrate Material\nSMA connector\nFabrication', 'N/A', 'N/A', NULL, '7.png', '1.png', '2020-11-22 00:00:00.000', 'Comments of the Chairman of the Department', '12.png', '17.png', '2024-03-16 00:00:00.000', NULL, NULL, 'Pending', 0, ''),
(62, '121565464', '2024-03-16 00:00:00.000', 5, 1, 2, 'Wideband 8× 8 patch antenna array for 5G wireless communications', 'Applied', 'Department of Computer and Communication Engineering', 'PSTU patuakhali', 'Patuakhali Science & Technology University (PSTU)', 'Patuakhali', 'Dept. of Computer and Communication Engineering laboratory, Faculty of CSE', '2020-07-01 00:00:00.000 - 2021-06-30 00:00:00.000', '2020-07-01 00:00:00.000 - 2021-06-30 00:00:00.000', 80000, 'Not Submitted', '', 'null', 'No', '', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a\ncause of death. Brain tumor detection is one of the important possible applications of microwave\nimaging. Microwave imaging is a well-established technique which is being employed to build\nlow-cost and portable medical diagnostic tools. The basis for using microwave techniques in\nmedical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues.\nThe currently available screening systems are not sufficient to detect the brain tumor effectively\nin prehospital environment due to their features of static, bulky and elevated cost. In this project,\na portable imaging system is proposed that uses the difference in contrast in the electrical\nproperties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an\nwideband antenna will be used to transceiver the microwave signal to the head and then the\nbackscattered signal from different parts of the head are collected and processed to get a clear\nimage of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive\nand no side effect, the proposed imaging technique can frequently be used to detect brain tumor in\nhuman head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'The specific objectives of this research can be listed as follows:\n1. To investigate the existing antenna technology for brain tumour imaging for required\nspecification of the antenna\n2. To design and simulate the antenna in CST simulate software\n3. To fabricate the simulated antenna that operates across lower UWB frequency\n4. To design an imaging system in a CST simulated environment for detecting brain tumour.', 'This wideband antenna would play an important on Bangladeshi society. This would be applicable\ndetecting unwanted cells (brain tumor) in human head. As a result this would affect the whole\neconomy and lead the nation ahead. The outcome of this research will be published impact factor\njournal with PSTU affiliation that will impact on university research area.', 'Brain tumor is one of the prime causes of morbidity and mortality and a major burden on health\ncare resources. In the World, every year about 15 million people suffer from stroke of which 5\nmillion die and another 5 million permanently become disabled [1, 2]. Since 2005, the percentage\nof deaths attributed to stroke in general hospitals has ranged from 6.6-8.4% Currently CAT scan,\nMRI, PET scan and ultrasound are commonly used to detect brain tumor. However, CAT scan,\nMRI and PET scan are not available outside the hospital environment due to their large and bulky\nstructure. Moreover, they are characteristics with invasive and elevated cost. Ultrasound though\ncan be used to detect acute stoke but cannot distinguish hemorrhage from ischemic stroke [3] . But\nto avoid death or possibility of disabled it is necessary diagnosis tumor immediate after onset of\nsymptoms so that proper treatments can be initiated. The aforementioned difficulties motivate us\nto develop a new simplified portable imaging system that is noninvasive and less expansive and\nwill be able to provide medical facility to the patients on onset of the stoke symptoms. The\nproposed system can be used as a prehospital diagnosis tool for real time observations to prevent\nsecondary stoke.\nMicrowave imaging technique has recently been used in medical applications as a low cost,\nnoninvasive and portable diagnosis tool. It is already been clinically proved as an effective\nscreening tool for breast cancer detection [4, 5] that is completely safe and no side effect.\nMicrowave imaging of head can be used to detect the presence and location of the damaged brain\ntissues [6].Microwave imaging now become a cost effective nonionizing portable imaging system\nfor brain tumor detection and can be used as an important tool in the emergency room of the\nhospital or by ambulance personal in the scene of onset symptoms. The basic principle of\nmicrowave imaging is the contrast in the dielectric properties between stoke-affected and healthy\nbrain tissues. In comparison to computed tomography and ultrasound, microwave can easily\npropagate through the human tissue and can penetrate the human skull [7]. A number of studies have already been proposed for microwave head imaging. Many of the reported research works\ndone on head imaging is based on numerical studies on simplified head model [8, 9]. Recently,\nMRI based imaging and real times diagnosis of brain injuries on 3D realistic head model were\npresented [10, 11] . However, in some reported experiments the head phantom is oversimplified\nand imaging system uses single UWB sensor (antenna)[11] . Although head phantoms with\ndispersive electric properties are reported recently, still there is scope to improve phantom quality\nwith detail human brain constructions that is very much similar to real human head. Furthermore,\nan imaging system with an array of antennas rather than single antenna is essential to transmit and\nreceive signal to and from head phantom efficiently. In this project, a microwave-based brain\ntumor imaging is proposed using unidirectional and wideband antenna. The proposed antenna will\noperate across the lower UWB.', 'The proposed research project methodology will be divided into three stages:\nStage 1:\nThe project will start with a survey of state-of-the-art antenna technology for a small satellite,\nvarious high gain techniques and real-time measurement system. Required references will be\nobtained from the resources, i.e. library (books, journal etc.) and online/database/internet.\nStage 2:\nAntenna is the key element of any microwave based imaging system. To accommodate within the\nlimited space, the antenna should be compact enough so that more number of antennas can be\narrayed in specific volume. Moreover, to increase the intensity of the transceive signal into the\nhead, the antenna should be unidirectional and pulse distortion free. The enhanced intensity of the\ntransceiver signal increases the power level of backscattered signal and minimizes the unwanted\nbackward interferences. Furthermore, an antenna that operates in the lower microwave frequencies\nof 1- 4 GHz (lower UWB) is required to ensure the effective penetration of the signal into dense\nhuman organ such as head. In this project, a unidirectional antenna that can achieve an operating\nfrequency band ranging from 1- 4 GHz will be proposed. The antenna will be designed and\nsimulated through Computer System Technology microwave studio. A new square enclosed circle\nmicrostrip patch antenna wideband antenna will be designed to meet the microwave head imaging features.\nThe antenna will be mounted on a cost-effective FR-4 substrate with a dielectric constant of 4.4, a dielectric\ntangent loss of 0.0037 and a thickness of 1.5 mm (SH). The FR-4 epoxy substrate was used here as it is\nmore available and much cheaper than any other PCB content. The proposed compact dimension of the\nantenna will 40×30×1.5 mm3 which initial dimension has taken based on patch antenna fundamental\nequations[12]. A 50 Ω microstrip feed line whose width is 2.9 mm and height is 15 mm is connected directly\nto the patch and antenna’s feeding is done through this line. There is a rectangular plane associated with\nthe ground in the ground plane, the length and width of which are marked with Gl and SW, respectively.\nThe top-left and top-right corners of the ground plane were truncated for expanded bandwidth. The antenna\narray is needed for the proposed system to operate in free space. An idea of the considered head imaging\nframework. The antenna covers a frequency span from 1 - 4 GHz.\nStage 3:\nAfter simulation, a laboratory prototype of the antenna will be fabricated, and its return loss and\nradiation pattern will be measured. The fabrication process will be completed using a PCB\nprototyping machine at lab. The Rogers substrate material will be utilized for the fabrication and\nthe antenna prototype will be measured in an anechoic chamber at lab and compare with simulation\nPage 6 of 13\nresults of validation purpose. Finally, a phantom will be designed in CST simulation environment\nand 9 antenna array will be put on the phantom.\nOverall follow chart of the proposed research is displayed in Figure 1', 'Untitled.png', 'Microwave imaging system has the advantages of low cost, high-data rate, low complexity and\nlow spectral power density. For microwave imaging, ultra-wide (UWB) technology has great\npotential to be an alternative imaging technique as it is inexpensive, compactness, high precision\nranging, and non-invasive. With the recent advances in both hardware and software, microwave\nimaging technique has gained much interest due to its low cost and non-ionizing characteristics.\nThe main target is to design a low cost antenna to detect brain tumor through microwave imaging\ntechnique. I have also targeted to publish one ISI and one scopes listed journal articles.\n', 'The success indicator of this project will be designed and prototyped a compact high performance\nantenna for brain tumor detection imaging system.', 'Brain Tumour is one of the main health challenges. Statistics reveal that around 13.2 million deaths\nof cancer/tumour are expected in 2030. Early detection of cancer is an important aspect for\neffective treatment. Widely used detection techniques include X-ray mammography, magnetic\nresonance imaging (MRI), and ultrasound technique. The currently available screening systems\nare not sufficient to detect the brain tumor effectively in prehospital environment due to their\nfeatures of static, bulky and elevated cost. Microwave imaging provides an alternative detection\ntechnique that requires simple configuration. The objective is to detect the variations in the\ndielectric properties of a tumour from the surrounding healthy tissue. Recent technologies,\nparticularly the use of wideband antenna allows resolution enhancement in the detection. ', 'Dr. Md. Samsuzzaman\nAssociate Professor, CCE', 'No', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus\n', 'Computer Printer\nAntivirus', 'Server Computer\ni. Simulation Software\nCST (Computer System\nTechnology)\ni. HFSS (High Frequency\nStructure Simulator)\nVector Network Analyzer\n(VNA)\nNear Field Anechoic Chamber\nOnline books and journal\nResource person\nSubstrate Material\nSMA connector\nFabric', 'CST Simulator\nSubstrate Material\nSMA connector\nFabrication', 'N/A', 'N/A', NULL, '7.png', '1.png', '2020-11-22 00:00:00.000', 'Comments of the Chairman of the Department', '12.png', '17.png', '2024-03-16 00:00:00.000', NULL, NULL, 'Approved', 49.3333, NULL),
(63, '121565464', '2024-03-16 00:00:00.000', 5, 6, 2, 'An Octagonal Ring-shaped Parasitic Resonator Based Compact Ultrawideband Antenna for Microwave Imaging Applications', 'Applied', 'Department of Computer and Communication Engineering', 'PSTU patuakhali', 'Patuakhali Science & Technology University (PSTU)', 'Patuakhali', 'Dept. of Computer and Communication Engineering laboratory, Faculty of CSE', '2020-07-01 00:00:00.000 - 2021-06-30 00:00:00.000', '2020-07-01 00:00:00.000 - 2021-06-30 00:00:00.000', 80000, 'Not Submitted', '', 'null', 'No', '', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a\ncause of death. Brain tumor detection is one of the important possible applications of microwave\nimaging. Microwave imaging is a well-established technique which is being employed to build\nlow-cost and portable medical diagnostic tools. The basis for using microwave techniques in\nmedical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues.\nThe currently available screening systems are not sufficient to detect the brain tumor effectively\nin prehospital environment due to their features of static, bulky and elevated cost. In this project,\na portable imaging system is proposed that uses the difference in contrast in the electrical\nproperties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an\nwideband antenna will be used to transceiver the microwave signal to the head and then the\nbackscattered signal from different parts of the head are collected and processed to get a clear\nimage of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive\nand no side effect, the proposed imaging technique can frequently be used to detect brain tumor in\nhuman head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'The specific objectives of this research can be listed as follows:\n1. To investigate the existing antenna technology for brain tumour imaging for required\nspecification of the antenna\n2. To design and simulate the antenna in CST simulate software\n3. To fabricate the simulated antenna that operates across lower UWB frequency\n4. To design an imaging system in a CST simulated environment for detecting brain tumour.', 'This wideband antenna would play an important on Bangladeshi society. This would be applicable\ndetecting unwanted cells (brain tumor) in human head. As a result this would affect the whole\neconomy and lead the nation ahead. The outcome of this research will be published impact factor\njournal with PSTU affiliation that will impact on university research area.', 'Brain tumor is one of the prime causes of morbidity and mortality and a major burden on health\ncare resources. In the World, every year about 15 million people suffer from stroke of which 5\nmillion die and another 5 million permanently become disabled [1, 2]. Since 2005, the percentage\nof deaths attributed to stroke in general hospitals has ranged from 6.6-8.4% Currently CAT scan,\nMRI, PET scan and ultrasound are commonly used to detect brain tumor. However, CAT scan,\nMRI and PET scan are not available outside the hospital environment due to their large and bulky\nstructure. Moreover, they are characteristics with invasive and elevated cost. Ultrasound though\ncan be used to detect acute stoke but cannot distinguish hemorrhage from ischemic stroke [3] . But\nto avoid death or possibility of disabled it is necessary diagnosis tumor immediate after onset of\nsymptoms so that proper treatments can be initiated. The aforementioned difficulties motivate us\nto develop a new simplified portable imaging system that is noninvasive and less expansive and\nwill be able to provide medical facility to the patients on onset of the stoke symptoms. The\nproposed system can be used as a prehospital diagnosis tool for real time observations to prevent\nsecondary stoke.\nMicrowave imaging technique has recently been used in medical applications as a low cost,\nnoninvasive and portable diagnosis tool. It is already been clinically proved as an effective\nscreening tool for breast cancer detection [4, 5] that is completely safe and no side effect.\nMicrowave imaging of head can be used to detect the presence and location of the damaged brain\ntissues [6].Microwave imaging now become a cost effective nonionizing portable imaging system\nfor brain tumor detection and can be used as an important tool in the emergency room of the\nhospital or by ambulance personal in the scene of onset symptoms. The basic principle of\nmicrowave imaging is the contrast in the dielectric properties between stoke-affected and healthy\nbrain tissues. In comparison to computed tomography and ultrasound, microwave can easily\npropagate through the human tissue and can penetrate the human skull [7]. A number of studies have already been proposed for microwave head imaging. Many of the reported research works\ndone on head imaging is based on numerical studies on simplified head model [8, 9]. Recently,\nMRI based imaging and real times diagnosis of brain injuries on 3D realistic head model were\npresented [10, 11] . However, in some reported experiments the head phantom is oversimplified\nand imaging system uses single UWB sensor (antenna)[11] . Although head phantoms with\ndispersive electric properties are reported recently, still there is scope to improve phantom quality\nwith detail human brain constructions that is very much similar to real human head. Furthermore,\nan imaging system with an array of antennas rather than single antenna is essential to transmit and\nreceive signal to and from head phantom efficiently. In this project, a microwave-based brain\ntumor imaging is proposed using unidirectional and wideband antenna. The proposed antenna will\noperate across the lower UWB.', 'The proposed research project methodology will be divided into three stages:\nStage 1:\nThe project will start with a survey of state-of-the-art antenna technology for a small satellite,\nvarious high gain techniques and real-time measurement system. Required references will be\nobtained from the resources, i.e. library (books, journal etc.) and online/database/internet.\nStage 2:\nAntenna is the key element of any microwave based imaging system. To accommodate within the\nlimited space, the antenna should be compact enough so that more number of antennas can be\narrayed in specific volume. Moreover, to increase the intensity of the transceive signal into the\nhead, the antenna should be unidirectional and pulse distortion free. The enhanced intensity of the\ntransceiver signal increases the power level of backscattered signal and minimizes the unwanted\nbackward interferences. Furthermore, an antenna that operates in the lower microwave frequencies\nof 1- 4 GHz (lower UWB) is required to ensure the effective penetration of the signal into dense\nhuman organ such as head. In this project, a unidirectional antenna that can achieve an operating\nfrequency band ranging from 1- 4 GHz will be proposed. The antenna will be designed and\nsimulated through Computer System Technology microwave studio. A new square enclosed circle\nmicrostrip patch antenna wideband antenna will be designed to meet the microwave head imaging features.\nThe antenna will be mounted on a cost-effective FR-4 substrate with a dielectric constant of 4.4, a dielectric\ntangent loss of 0.0037 and a thickness of 1.5 mm (SH). The FR-4 epoxy substrate was used here as it is\nmore available and much cheaper than any other PCB content. The proposed compact dimension of the\nantenna will 40×30×1.5 mm3 which initial dimension has taken based on patch antenna fundamental\nequations[12]. A 50 Ω microstrip feed line whose width is 2.9 mm and height is 15 mm is connected directly\nto the patch and antenna’s feeding is done through this line. There is a rectangular plane associated with\nthe ground in the ground plane, the length and width of which are marked with Gl and SW, respectively.\nThe top-left and top-right corners of the ground plane were truncated for expanded bandwidth. The antenna\narray is needed for the proposed system to operate in free space. An idea of the considered head imaging\nframework. The antenna covers a frequency span from 1 - 4 GHz.\nStage 3:\nAfter simulation, a laboratory prototype of the antenna will be fabricated, and its return loss and\nradiation pattern will be measured. The fabrication process will be completed using a PCB\nprototyping machine at lab. The Rogers substrate material will be utilized for the fabrication and\nthe antenna prototype will be measured in an anechoic chamber at lab and compare with simulation\nPage 6 of 13\nresults of validation purpose. Finally, a phantom will be designed in CST simulation environment\nand 9 antenna array will be put on the phantom.\nOverall follow chart of the proposed research is displayed in Figure 1', 'Untitled.png', 'Microwave imaging system has the advantages of low cost, high-data rate, low complexity and\nlow spectral power density. For microwave imaging, ultra-wide (UWB) technology has great\npotential to be an alternative imaging technique as it is inexpensive, compactness, high precision\nranging, and non-invasive. With the recent advances in both hardware and software, microwave\nimaging technique has gained much interest due to its low cost and non-ionizing characteristics.\nThe main target is to design a low cost antenna to detect brain tumor through microwave imaging\ntechnique. I have also targeted to publish one ISI and one scopes listed journal articles.\n', 'The success indicator of this project will be designed and prototyped a compact high performance\nantenna for brain tumor detection imaging system.', 'Brain Tumour is one of the main health challenges. Statistics reveal that around 13.2 million deaths\nof cancer/tumour are expected in 2030. Early detection of cancer is an important aspect for\neffective treatment. Widely used detection techniques include X-ray mammography, magnetic\nresonance imaging (MRI), and ultrasound technique. The currently available screening systems\nare not sufficient to detect the brain tumor effectively in prehospital environment due to their\nfeatures of static, bulky and elevated cost. Microwave imaging provides an alternative detection\ntechnique that requires simple configuration. The objective is to detect the variations in the\ndielectric properties of a tumour from the surrounding healthy tissue. Recent technologies,\nparticularly the use of wideband antenna allows resolution enhancement in the detection. ', 'Dr. Md. Samsuzzaman\nAssociate Professor, CCE', 'No', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus\n', 'Computer Printer\nAntivirus', 'Server Computer\ni. Simulation Software\nCST (Computer System\nTechnology)\ni. HFSS (High Frequency\nStructure Simulator)\nVector Network Analyzer\n(VNA)\nNear Field Anechoic Chamber\nOnline books and journal\nResource person\nSubstrate Material\nSMA connector\nFabric', 'CST Simulator\nSubstrate Material\nSMA connector\nFabrication', 'N/A', 'N/A', NULL, '7.png', '1.png', '2020-11-22 00:00:00.000', 'Comments of the Chairman of the Department', '12.png', '17.png', '2024-03-16 00:00:00.000', NULL, NULL, 'Pending', 0, '');
INSERT INTO `Projects` (`ProjectID`, `CodeByRTC`, `DateRecieved`, `CreatorUserID`, `CoPiUserID`, `StudentUserID`, `ProjectTitle`, `NatureOfResearchProposal`, `NameOfCollaboratingDepartments`, `AddressOfCollaboratingDepartments`, `NameOfCollaboratingInstitutes`, `AddressOfCollaboratingInstitutes`, `LocationOfFieldActivities`, `DurationOfResearchProjectAnnual`, `DurationOfResearchProjectLongTerm`, `TotalBudgetOfResearchProposalTK`, `ExternalAgencyFundingSource`, `ExternalAgencyFundingSourcesName`, `ExternalAgencyFundingSourcesSubmissionDate`, `CommitmentOtherResearchProject`, `CommitmentOtherResearchProjectName`, `ProjectDescription`, `ProjectObjective`, `PstuNationalGoal`, `PriorResearchOverview`, `Methodology`, `MethodologyFileLocation`, `ExpectedOutput`, `SuccessIndicators`, `Beneficiaries`, `ManPowerExisting`, `ManPowerRequired`, `SmallEquipmentExisting`, `SmallEquipmentRequired`, `ResearchMaterialsExisting`, `ResearchMaterialsRequired`, `OtherExisting`, `OtherRequired`, `ResearchCarriedOutPlace`, `CreatorUserSealLocation`, `CreatorUserSignatureLocation`, `CreatorUserSignatureDate`, `ChairmanOfDepartmentComment`, `ChairmanOfDepartmentSealLocation`, `ChairmanOfDepartmentSignatureLocation`, `ChairmanOfDepartmentSignatureDate`, `ResultsAndDiscussion`, `KeyAchievements`, `ProjectStatus`, `TotalPoints`, `ProjectSoftCopyLocation`) VALUES
(64, '61516546', '2024-03-16 00:00:00.000', 5, 6, 2, 'A Gap Coupled Hexagonal Split Ring Resonator Based Metamaterial for S-Band and X-Band Microwave Applications', 'Applied', 'Department of Computer and Communication Engineering', 'PSTU patuakhali', 'Patuakhali Science & Technology University (PSTU)', 'Patuakhali', 'Dept. of Computer and Communication Engineering laboratory, Faculty of CSE', '2020-07-01 00:00:00.000 - 2021-06-30 00:00:00.000', '2020-07-01 00:00:00.000 - 2021-06-30 00:00:00.000', 80000, 'Not Submitted', '', 'null', 'No', '', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system.', 'The specific objectives of this research can be listed as follows:\n1. To investigate the existing antenna technology for brain tumour imaging for required\nspecification of the antenna\n2. To design and simulate the antenna in CST simulate software\n3. To fabricate the simulated antenna that operates across lower UWB frequency\n4. To design an imaging system in a CST simulated environment for detecting brain tumour.', 'This wideband antenna would play an important on Bangladeshi society. This would be applicable detecting unwanted cells (brain tumor) in human head. As a result this would affect the whole economy and lead the nation ahead. The outcome of this research will be published impact factor journal with PSTU affiliation that will impact on university research area.', 'Brain tumor is one of the prime causes of morbidity and mortality and a major burden on health care resources. In the World, every year about 15 million people suffer from stroke of which 5 million die and another 5 million permanently become disabled [1, 2]. Since 2005, the percentage of deaths attributed to stroke in general hospitals has ranged from 6.6-8.4% Currently CAT scan, MRI, PET scan and ultrasound are commonly used to detect brain tumor. However, CAT scan, MRI and PET scan are not available outside the hospital environment due to their large and bulky structure. Moreover, they are characteristics with invasive and elevated cost. Ultrasound though can be used to detect acute stoke but cannot distinguish hemorrhage from ischemic stroke [3] . But to avoid death or possibility of disabled it is necessary diagnosis tumor immediate after onset of symptoms so that proper treatments can be initiated. The aforementioned difficulties motivate us to develop a new simplified portable imaging system that is noninvasive and less expansive and will be able to provide medical facility to the patients on onset of the stoke symptoms. The proposed system can be used as a prehospital diagnosis tool for real time observations to prevent secondary stoke. Microwave imaging technique has recently been used in medical applications as a low cost, noninvasive and portable diagnosis tool. It is already been clinically proved as an effective screening tool for breast cancer detection [4, 5] that is completely safe and no side effect. Microwave imaging of head can be used to detect the presence and location of the damaged brain tissues [6].Microwave imaging now become a cost effective nonionizing portable imaging system for brain tumor detection and can be used as an important tool in the emergency room of the hospital or by ambulance personal in the scene of onset symptoms. The basic principle of microwave imaging is the contrast in the dielectric properties between stoke-affected and healthy brain tissues. In comparison to computed tomography and ultrasound, microwave can easily propagate through the human tissue and can penetrate the human skull [7]. A number of studies have already been proposed for microwave head imaging. Many of the reported research works done on head imaging is based on numerical studies on simplified head model [8, 9]. Recently, MRI based imaging and real times diagnosis of brain injuries on 3D realistic head model were presented [10, 11] . However, in some reported experiments the head phantom is oversimplified and imaging system uses single UWB sensor (antenna)[11] . Although head phantoms with dispersive electric properties are reported recently, still there is scope to improve phantom quality with detail human brain constructions that is very much similar to real human head. Furthermore, an imaging system with an array of antennas rather than single antenna is essential to transmit and receive signal to and from head phantom efficiently. In this project, a microwave-based brain tumor imaging is proposed using unidirectional and wideband antenna. The proposed antenna will operate across the lower UWB.', 'The proposed research project methodology will be divided into three stages:\nStage 1:\nThe project will start with a survey of state-of-the-art antenna technology for a small satellite, various high gain techniques and real-time measurement system. Required references will be obtained from the resources, i.e. library (books, journal etc.) and online/database/internet.\nStage 2: \nAntenna is the key element of any microwave based imaging system. To accommodate within the limited space, the antenna should be compact enough so that more number of antennas can be arrayed in specific volume. Moreover, to increase the intensity of the transceive signal into the head, the antenna should be unidirectional and pulse distortion free. The enhanced intensity of the transceiver signal increases the power level of backscattered signal and minimizes the unwanted backward interferences. Furthermore, an antenna that operates in the lower microwave frequencies of 1- 4 GHz (lower UWB) is required to ensure the effective penetration of the signal into dense human organ such as head. In this project, a unidirectional antenna that can achieve an operating frequency band ranging from 1- 4 GHz will be proposed. The antenna will be designed and simulated through Computer System Technology microwave studio. A new square enclosed circle microstrip patch antenna wideband antenna will be designed to meet the microwave head imaging features. The antenna will be mounted on a cost-effective FR-4 substrate with a dielectric constant of 4.4, a dielectric tangent loss of 0.0037 and a thickness of 1.5 mm (SH). The FR-4 epoxy substrate was used here as it is more available and much cheaper than any other PCB content. The proposed compact dimension of the antenna will 40×30×1.5 mm3 which initial dimension has taken based on patch antenna fundamental equations[12]. A 50 Ω microstrip feed line whose width is 2.9 mm and height is 15 mm is connected directly to the patch and antenna’s feeding is done through this line. There is a rectangular plane associated with the ground in the ground plane, the length and width of which are marked with Gl and SW, respectively. The top-left and top-right corners of the ground plane were truncated for expanded bandwidth. The antenna array is needed for the proposed system to operate in free space. An idea of the considered head imaging framework. The antenna covers a frequency span from 1 - 4 GHz.\nStage 3:\nAfter simulation, a laboratory prototype of the antenna will be fabricated, and its return loss and radiation pattern will be measured. The fabrication process will be completed using a PCB prototyping machine at lab. The Rogers substrate material will be utilized for the fabrication and the antenna prototype will be measured in an anechoic chamber at lab and compare with simulation Page 6 of 13 results of validation purpose. Finally, a phantom will be designed in CST simulation environment and 9 antenna array will be put on the phantom. Overall follow chart of the proposed research is displayed in Figure 1', 'Untitled.png', 'Microwave imaging system has the advantages of low cost, high-data rate, low complexity and low spectral power density. For microwave imaging, ultra-wide (UWB) technology has great potential to be an alternative imaging technique as it is inexpensive, compactness, high precision ranging, and non-invasive. With the recent advances in both hardware and software, microwave imaging technique has gained much interest due to its low cost and non-ionizing characteristics. The main target is to design a low cost antenna to detect brain tumor through microwave imaging technique. I have also targeted to publish one ISI and one scopes listed journal articles.\n', 'The success indicator of this project will be designed and prototyped a compact high performance antenna for brain tumor detection imaging system.', 'Brain Tumour is one of the main health challenges. Statistics reveal that around 13.2 million deaths of cancer/tumour are expected in 2030. Early detection of cancer is an important aspect for effective treatment. Widely used detection techniques include X-ray mammography, magnetic resonance imaging (MRI), and ultrasound technique. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. Microwave imaging provides an alternative detection technique that requires simple configuration. The objective is to detect the variations in the dielectric properties of a tumour from the surrounding healthy tissue. Recent technologies, particularly the use of wideband antenna allows resolution enhancement in the detection. ', 'Dr. Md. Samsuzzaman\nAssociate Professor, CCE', 'No', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus\n', 'Computer Printer\nAntivirus', 'Server Computer\ni. Simulation Software\nCST (Computer System\nTechnology)\ni. HFSS (High Frequency\nStructure Simulator)\nVector Network Analyzer\n(VNA)\nNear Field Anechoic Chamber\nOnline books and journal\nResource person\nSubstrate Material\nSMA connector\nFabric', 'CST Simulator\nSubstrate Material\nSMA connector\nFabrication', 'N/A', 'N/A', NULL, '7.png', '1.png', '2020-11-22 00:00:00.000', 'Comments of the Chairman of the Department', '12.png', '17.png', '2024-03-16 00:00:00.000', NULL, NULL, 'Approved', 79.3333, ''),
(93, '5432352', '2024-04-09 00:00:00.000', 6, 8, 2, 'Ring Resonator Based Metamaterial for S-Band and X-Band Microwave Applications', 'Fundamental', 'Department of Computer and Communication Engineering', 'PSTU Patuakhali', 'Patuakhali Science & Technology University (PSTU)', 'Patuakhali', 'Dept. of Computer and Communication Engineering laboratory, Faculty of CSE', '2024-04-07 00:00:00.000 - 2024-04-27 00:00:00.000', '2024-03-05 00:00:00.000 - 2024-06-12 00:00:00.000', 100000, 'Submitted', 'Fund Riser', '2024-04-27 00:00:00.000', 'No', '', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', '20.png', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'NO', NULL, '9.png', '3.png', '2024-04-09 00:00:00.000', 'Good', '12.png', '17.png', '2024-04-09 00:00:00.000', NULL, NULL, 'Pending', 0, NULL),
(94, '55555555', '2024-04-09 00:00:00.000', 6, 8, 2, 'Microwave Applications', 'Coordinated', 'Department of Computer and Communication Engineering', 'PSTU Patuakhali', 'Patuakhali Science & Technology University (PSTU)', 'Patuakhali', 'Dept. of Computer and Communication Engineering laboratory, Faculty of CSE', '2024-04-07 00:00:00.000 - 2024-04-27 00:00:00.000', '2024-03-05 00:00:00.000 - 2024-06-12 00:00:00.000', 100000, 'Submitted', 'Fund Riser', '2024-04-27 00:00:00.000', 'Yes', 'A Gap Coupled Hexagonal Split Ring', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', '20.png', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'NO', NULL, '9.png', '3.png', '2024-04-09 00:00:00.000', 'Good', '12.png', '17.png', '2024-04-09 00:00:00.000', NULL, NULL, 'Pending', 0, '');
INSERT INTO `Projects` (`ProjectID`, `CodeByRTC`, `DateRecieved`, `CreatorUserID`, `CoPiUserID`, `StudentUserID`, `ProjectTitle`, `NatureOfResearchProposal`, `NameOfCollaboratingDepartments`, `AddressOfCollaboratingDepartments`, `NameOfCollaboratingInstitutes`, `AddressOfCollaboratingInstitutes`, `LocationOfFieldActivities`, `DurationOfResearchProjectAnnual`, `DurationOfResearchProjectLongTerm`, `TotalBudgetOfResearchProposalTK`, `ExternalAgencyFundingSource`, `ExternalAgencyFundingSourcesName`, `ExternalAgencyFundingSourcesSubmissionDate`, `CommitmentOtherResearchProject`, `CommitmentOtherResearchProjectName`, `ProjectDescription`, `ProjectObjective`, `PstuNationalGoal`, `PriorResearchOverview`, `Methodology`, `MethodologyFileLocation`, `ExpectedOutput`, `SuccessIndicators`, `Beneficiaries`, `ManPowerExisting`, `ManPowerRequired`, `SmallEquipmentExisting`, `SmallEquipmentRequired`, `ResearchMaterialsExisting`, `ResearchMaterialsRequired`, `OtherExisting`, `OtherRequired`, `ResearchCarriedOutPlace`, `CreatorUserSealLocation`, `CreatorUserSignatureLocation`, `CreatorUserSignatureDate`, `ChairmanOfDepartmentComment`, `ChairmanOfDepartmentSealLocation`, `ChairmanOfDepartmentSignatureLocation`, `ChairmanOfDepartmentSignatureDate`, `ResultsAndDiscussion`, `KeyAchievements`, `ProjectStatus`, `TotalPoints`, `ProjectSoftCopyLocation`) VALUES
(95, '587676', '2024-04-09 00:00:00.000', 6, 11, 2, 'S-Band and X-Band Microwave Applications', 'Coordinated', 'Department of Computer and Communication Engineering', 'PSTU Patuakhali', 'Patuakhali Science & Technology University (PSTU)', 'Patuakhali', 'Dept. of Computer and Communication Engineering laboratory, Faculty of CSE', '2024-04-07 00:00:00.000 - 2024-04-27 00:00:00.000', '2024-03-05 00:00:00.000 - 2024-06-12 00:00:00.000', 100000, 'Submitted', 'Fund Riser', '2024-04-27 00:00:00.000', 'Yes', 'A Gap Coupled Hexagonal Split Ring', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', '20.png', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Brain tumor is a highly reported malignancy that can lead to brain damage, disability and thus a cause of death. Brain tumor detection is one of the important possible applications of microwave imaging. Microwave imaging is a well-established technique which is being employed to build low-cost and portable medical diagnostic tools. The basis for using microwave techniques in medical diagnosis is the contrast in the electrical properties between healthy and unhealthy tissues. The currently available screening systems are not sufficient to detect the brain tumor effectively in prehospital environment due to their features of static, bulky and elevated cost. In this project, a portable imaging system is proposed that uses the difference in contrast in the electrical properties between healthy and hemorrhaged brain tissues. In the proposed imaging system, an wideband antenna will be used to transceiver the microwave signal to the head and then the backscattered signal from different parts of the head are collected and processed to get a clear image of the unwanted cell (tumor) in the brain. Due to the features of non-ionizing, less expansive and no side effect, the proposed imaging technique can frequently be used to detect brain tumor in human head at any time. The proposed wideband will play an important role to form a microwavebased brain tumor detection system', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'Multitier,\nShouldering iron\nLaptop / Desktop Computer\nInternet\nLibrary\nSoftware\nTeaching aids\nComputer laboratory\nAntivirus', 'NO', NULL, '9.png', '3.png', '2024-04-09 00:00:00.000', 'Good', '12.png', '17.png', '2024-04-09 00:00:00.000', NULL, NULL, 'Pending', 0, NULL),
(96, 'ddddddd', '2024-05-24 00:00:00.000', 6, 8, 2, 'dddddddddddddddd', 'Independent', 'Department of Mathematics', 'ddd', 'Patuakhali Science & Technology University (PSTU)', 'dd', 'd', '2024-05-14 00:00:00.000 - 2024-05-15 00:00:00.000', '', 0, 'Not Submitted', '', 'null', 'No', '', '', '', '', '', '', '', '', '', '', '', '', 'd', '', '', '', '', '', NULL, '9.png', '3.png', '2024-05-30 00:00:00.000', '1', '', '', '2024-05-13 00:00:00.000', NULL, NULL, 'Pending', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `Review`
--

CREATE TABLE `Review` (
  `ReviewID` int(11) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `ReviewerUserID` int(11) DEFAULT NULL,
  `Comments` text DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Points` float DEFAULT NULL,
  `PiCanViewOrNot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Review`
--

INSERT INTO `Review` (`ReviewID`, `ProjectID`, `ReviewerUserID`, `Comments`, `Rating`, `Points`, `PiCanViewOrNot`) VALUES
(2, 62, 6, 'Not good', NULL, 6, 1),
(3, 62, 8, 'Good to go', NULL, 77, 1),
(4, 62, 10, 'Good', NULL, 65, 1),
(5, 58, 5, 'Not good , need to improve', NULL, 22, 1),
(6, 58, 8, 'Not good', NULL, 5.6, 1),
(7, 58, 11, 'need to improve', NULL, 32, 1),
(8, 64, 8, 'Good to go', NULL, 73, 1),
(9, 64, 10, 'Good to go', NULL, 90, 1),
(10, 64, 11, 'Good', NULL, 75, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

CREATE TABLE `Role` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Role`
--

INSERT INTO `Role` (`RoleID`, `RoleName`) VALUES
(1, 'Admin'),
(2, 'Researcher'),
(3, 'Reviewer'),
(4, 'Teacher'),
(5, 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `TempUsers`
--

CREATE TABLE `TempUsers` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) DEFAULT NULL,
  `Username` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `FacultyName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `TempUsers`
--

INSERT INTO `TempUsers` (`UserID`, `RoleID`, `Username`, `PASSWORD`, `FirstName`, `LastName`, `Email`, `Phone`, `FacultyName`) VALUES
(6, 4, 'manashsir', 'pbkdf2:sha256:600000$OmNEWPpV8PGIvf2u$0247cba8882f95b81cc8384b383c950dff86bca377c4ec6fd1f0942a3a5dfb7f', 'Manash', 'Sarker', 'raqibul.islam.17@gmail.com', '01712149555', 'Faculty of Computer Science and Engineering'),
(9, 4, 'chinmaysir', 'pbkdf2:sha256:600000$s6D9rvvSDqmuuO5Z$62526ca926a11b516865206682cffa576200a2bd9b9d86252a202ae19cc3d00b', 'Chinmay', 'Bepery', 'raqibul.islam.17@gmail.com', '01710531024', 'Faculty of Computer Science and Engineering'),
(10, 4, 'jamalsir', 'pbkdf2:sha256:600000$YuBhgqtVb1mAHGEi$1d6b6564a4087e56da87297b215008704bb1e7b43b7dea077f5c83a19ee5d602', 'Mohammad Jamal', 'Hossain', 'raqibul.islam.17@gmail.com', '01865102400', 'Faculty of Computer Science and Engineering'),
(12, 4, 'atiksir', 'pbkdf2:sha256:600000$yHlCBhitz4C7wE4j$afa93360466f4e6dc65a0e659b293af5b239ae74cbe92a8bdbc3c22ce4d34177', 'Md Atikur', 'Rahman', 'raqibul.islam.17@gmail.com', '01915114929', 'Faculty of Computer Science and Engineering'),
(13, 4, 'mahbubsir', 'pbkdf2:sha256:600000$z9tpFHVoKIbs917v$43701bfc20578fa8a045ac0cdd6d00cb489bec90dfa0b510c081a0eb7350a088', 'Md Mahbubur', 'Rahman', 'raqibul.islam.17@gmail.com', '01556449873', 'Faculty of Computer Science and Engineering'),
(14, 4, 'sayedsir', 'pbkdf2:sha256:600000$0EhHhFL4NSP8BEaN$2c43dad63ced45e0accd56d6703e363babc7b097c9c41d291338c033ead6a797', 'Moinul Islam', 'Sayed', 'raqibul.islam.17@gmail.com', '+14372263887', 'Faculty of Computer Science and Engineering'),
(15, 4, 'naimursir', 'pbkdf2:sha256:600000$p4W6IEtdO4XycVgO$6a8a6dad73a439fc760e2fc487f5583d398e92e523fcaecada983e8881117de1', 'Md. Naimur', 'Rahman', 'raqibul.islam.17@gmail.com', '01712442291', 'Faculty of Computer Science and Engineering'),
(16, 4, 'taohidsir', 'pbkdf2:sha256:600000$BKfAbjNQFwLNm2oD$2ace8d3e527fd9cce293b9cc56e28abc94595c30b1738c395119837f1a2c7fc0', 'Dr. S.M. Taohidul', 'Islam', 'raqibul.islam.17@gmail.com', '01719018370', 'Faculty of Computer Science and Engineering'),
(17, 4, 'moniborsir', 'pbkdf2:sha256:600000$XhIhzwAoNgISiNhe$abcb20277d1a7ca7545cb4fb1b0a7708e0000ea2c8030f0ecd1d443f90d582b8', 'Md. Monibor', 'Rahman', 'raqibul.islam.17@gmail.com', '01915094763', 'Faculty of Computer Science and Engineering'),
(18, 4, 'ranasir', 'pbkdf2:sha256:600000$Kf0KQJhXoPCDcSy2$320ad864693ed4084e2a18cc37dcb076e79cb380d8dfbf61242efcd2b5086bcc', 'Muhammad Masud', 'Rana', 'raqibul.islam.17@gmail.com', '01834545713', 'Faculty of Computer Science and Engineering'),
(19, 4, 'sajalsir', 'pbkdf2:sha256:600000$ZB8k2u5d66V0dK4p$b4ba6cd288c65bc0b547ba353a14796756bc51df3a8dbdf501412918817db8ac', 'Sajal', 'Saha', 'raqibul.islam.17@gmail.com', '01736092609', 'Faculty of Computer Science and Engineering'),
(20, 4, 'khokonsir', 'pbkdf2:sha256:600000$wAeKPLOyLrbbdCHP$40fda4f467d6db2a46adb30ce22f30114e24f9b722e27500d481d067f328d2d6', 'Khokon', 'Hossen', 'raqibul.islam.17@gmail.com', '01719151601', 'Faculty of Computer Science and Engineering'),
(21, 4, 'ollymam', 'pbkdf2:sha256:600000$F5NrcUJJQ2qe9Lbk$289aac9edccbfaa63d78c24f532c461d83efe02e6a062b5a941e3f0646e3b5b4', 'Dr. Olly Roy', 'Chowdhury', 'raqibul.islam.17@gmail.com', '01716335596', 'Faculty of Computer Science and Engineering'),
(22, 4, 'takiamam', 'pbkdf2:sha256:600000$0czsuiy1AgCVM0FY$4d60f1b1c9634f024071457b00e03fa3a636ee752d3fe389394bba81a597af5d', 'Humaira', 'Takia', 'raqibul.islam.17@gmail.com', '01722501970', 'Faculty of Computer Science and Engineering'),
(23, 4, 'bellalsir', 'pbkdf2:sha256:600000$kUD4KEab48sAdtCU$dcd4e6e80d0d957f5147579bb2946dd334298fedbcdeecff2334b86e5d23344e', 'Dr. Md. Bellal', 'Hossain', 'raqibul.islam.17@gmail.com', '01712642733', 'Faculty of Computer Science and Engineering'),
(24, 4, 'masudursir', 'pbkdf2:sha256:600000$EyhosmZPzJe1aSFd$a280b776b5bf0ddea5c0c3cd9119f8dffb5a67a566c93b9b06da33c8ff30d92c', 'Dr. Muhammad Masudur', 'Rahman', 'raqibul.islam.17@gmail.com', '53945893289', 'Faculty of Computer Science and Engineering'),
(25, 4, 'mehetajmam', 'pbkdf2:sha256:600000$o4lro23dFXqlTnKm$aaa60194a22565822bbda31e6ab1a21bef995ea43edd38bf415676572f569a9d', 'Mehetaj', 'Parvine', 'raqibul.islam.17@gmail.com', '01521232115', 'Faculty of Computer Science and Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UserID` int(11) NOT NULL,
  `RoleID` int(11) DEFAULT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `PositionEnglish` varchar(255) NOT NULL,
  `PositionBangla` varchar(255) NOT NULL,
  `PositionHeldSince` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `FullNameBangla` varchar(255) DEFAULT NULL,
  `PresentAddress` varchar(255) DEFAULT NULL,
  `PermanentAddress` varchar(255) DEFAULT NULL,
  `Gender` varchar(255) DEFAULT NULL,
  `Nid` varchar(255) DEFAULT NULL,
  `NidLocation` varchar(255) DEFAULT NULL,
  `FacultyName` varchar(255) NOT NULL,
  `DepartmentName` varchar(255) NOT NULL,
  `InstituteName` varchar(255) DEFAULT NULL,
  `InstituteLocation` varchar(255) DEFAULT NULL,
  `InstituteEmail` varchar(255) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Dateofbirth` varchar(255) DEFAULT NULL,
  `SalaryScale` varchar(255) DEFAULT NULL,
  `BasicPay` float NOT NULL,
  `HighestAcademicQualification` varchar(255) DEFAULT NULL,
  `HighestAcademicQualificationUniversity` varchar(255) DEFAULT NULL,
  `HighestAcademicQualificationCountry` varchar(255) DEFAULT NULL,
  `HighestAcademicQualificationYear` int(11) DEFAULT NULL,
  `AreaOfExpertise` varchar(255) DEFAULT NULL,
  `ReferencesOfLatestPublications` varchar(2000) DEFAULT NULL,
  `ExperienceInResearch` int(11) DEFAULT NULL,
  `Teaching` int(11) DEFAULT NULL,
  `ProfilePicLocation` varchar(255) DEFAULT NULL,
  `SignatureLocation` varchar(255) DEFAULT NULL,
  `SealLocation` varchar(255) DEFAULT NULL,
  `TotalNumberOfCompleteProjects` int(11) DEFAULT NULL,
  `TotalNumberOfCompletePublications` int(11) DEFAULT NULL,
  `OngoingProjects` int(11) DEFAULT NULL,
  `StudentID` int(11) DEFAULT NULL,
  `StudentRegNo` varchar(50) DEFAULT NULL,
  `FirstEnrollmentSemester` varchar(50) DEFAULT NULL,
  `UndergraduateCGPALevel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UserID`, `RoleID`, `Username`, `Password`, `PositionEnglish`, `PositionBangla`, `PositionHeldSince`, `Email`, `FirstName`, `LastName`, `FullNameBangla`, `PresentAddress`, `PermanentAddress`, `Gender`, `Nid`, `NidLocation`, `FacultyName`, `DepartmentName`, `InstituteName`, `InstituteLocation`, `InstituteEmail`, `Phone`, `Dateofbirth`, `SalaryScale`, `BasicPay`, `HighestAcademicQualification`, `HighestAcademicQualificationUniversity`, `HighestAcademicQualificationCountry`, `HighestAcademicQualificationYear`, `AreaOfExpertise`, `ReferencesOfLatestPublications`, `ExperienceInResearch`, `Teaching`, `ProfilePicLocation`, `SignatureLocation`, `SealLocation`, `TotalNumberOfCompleteProjects`, `TotalNumberOfCompletePublications`, `OngoingProjects`, `StudentID`, `StudentRegNo`, `FirstEnrollmentSemester`, `UndergraduateCGPALevel`) VALUES
(1, 1, 'rakib', 'pbkdf2:sha256:600000$pBp6ozzOF62V7o4z$f715e4a4334b95bf32e8d6c7ee447933255bd0e9c5879c73f7b0c43ab894a7c4', 'd', 'd', 'd', 'rakib29185@gmail.com', 'Md. Rakibul', 'Islam', 'd', 'address', 'd', 'Male', 'd', '22.png', 'Faculty of Computer Science and Engineering', '', 'Patuakhali Science & Technology University (PSTU)', 'd', 'd', '01700000000', '2000-09-17 00:00:00.000', '0', 0, 'cse', 'pstu', 'bd', 2024, 'area', 'arearesearchgate , google scholars', 0, 0, '30000000.jpg', '17.png', 'shanto.jpg', 0, 0, 0, 0, 'd', 'd', 'd'),
(2, 5, 'taj', 'pbkdf2:sha256:600000$fvGbCjbgaOWoIxxQ$c4f2a33ddf766eb6298948bcc01a67a8e9011418eabe1a9201a2cb552e3faf43', '', '', '', 'taj@gmail.com', 'Tahmidur', 'Rahman Taj', '', '', '', 'Male', '', 'defaultnid.png', 'Faculty of Computer Science and Engineering', '', '', '', '', '01400000000', '2000-03-29 00:00:00.000', '0', 0, '', '', '', 0, '', 'researchgate , google scholars', 0, 0, 'defaultprofilepic.png', 'defaultsignature.png', 'defaultseal.png', 0, 0, 0, 1802038, '08483', 'semester 1', '3.5'),
(3, 4, 'sobujsirsir', 'pbkdf2:sha256:600000$T9gF3PI05rPxPLm1$f79929f8dcd1d67904d504593b132d2542b739e4fefb0febae3ed44398b15123', 'f', 'f', '5', 'sobujsir@gmail.com', 'sobujsir', 'sobujsir', 'hf', 'f', 'f', 'Male', 'ff', '', 'Faculty of Computer Science and Engineering', '', NULL, 'f', 'f', '01500000000', '2024-03-20 00:00:00.000', '0', 0, 'f', 'ff', 'f', 0, 'f', 'researchgate , google scholars', 0, 0, 'defaultprofilepic.png', 'defaultsignature.png', 'shanto  .jpg', 0, 0, 0, 0, '3', 'f', 'f'),
(4, 4, 'test', 'pbkdf2:sha256:600000$ro6WCinSg8T9e8tY$dd76510053f1b34d729d6d59b20e85fdde00ff56787340ee5471dba9f2ec63b6', '', '', '', 'test@gmail.com', 'test', 'test', NULL, NULL, NULL, 'Male', NULL, NULL, 'Faculty of Computer Science and Engineering', '', NULL, NULL, NULL, '01725225225', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'researchgate , google scholars', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 4, 'sobujsir', 'pbkdf2:sha256:600000$NPKnJAgOJLFKPXf6$fd47733b28568ab00d054a2e5f6987a83a6fdff1722e7e2a2179c8283e3fd389', 'Professor', 'অধ্যাপক', '2019', 'rakibul16@cse.pstu.ac.bd', 'Dr. Md.', 'Samsuzzaman', 'মোঃ শামসুজ্জামান', 'Room No: 401 CSE Building (3rd Floor) Department of CCE,  Faculty of CSE , Dhumki , Patuakhali', 'Village: Rotidanga, Road: Rotidanga Road , Post Office : Boalia Bazar, Division : Khulna', 'Male', '1491370944', 'defaultnid.png', 'Faculty of Computer Science and Engineering', 'Department of Computer and Communication Engineering', 'Patuakhali Science & Technology University (PSTU)', 'Dumki, Patuakhali, Bangladesh', 'registrar@pstu.ac.bd', '01712653210', '1982-11-15 00:00:00.000', '50000-71200', 60400, 'Doctor of Philosophy', 'Universiti Kebangsaan Malaysia', 'Malaysia', 2015, 'Microwave Communication, Satellite Communication, Microwave Imaging, Antenna Technology for Microwave Applications', '1. Samsuzzaman, Md, Norbahiah Misran, Md Tarikul Islam, and Mohammad Tariqul Islam. \"Wideband 8× 8 patch antenna array for 5G wireless communications.\" Optoelectronics and Advanced Materials-Rapid Communications 14, no. March-April 2020 (2020): 163-171. ISSN: 1842-6573, (Impact Factor-0.445) Q4 (Indexed in ISI & SCOPUS).\n2. Hossain, Amran, Mohammad Tariqul Islam, Ali F. Almutairi, Mandeep Singh Jit Singh, Kamarulzaman Mat, and Md Samsuzzaman. \"An Octagonal Ring-shaped Parasitic Resonator Based Compact Ultrawideband Antenna for Microwave Imaging Applications.\" Sensors 20, no. 5 (2020): 1354.eISSN: 1424-8220, (Impact Factor-3.275) Q1 (Indexed in ISI & SCOPUS).\n3. Islam, Mohammad Shahidul, Md Samsuzzaman, Gan Kok Beng, Norbahiah Misran, Nowshad Amin, and Mohammad Tariqul Islam. \"A Gap Coupled Hexagonal Split Ring Resonator Based Metamaterial for S-Band and X-Band Microwave Applications.\" IEEE Access 8 (2020): 68239- 68253. ISSN: 2169-3536, (Impact Factor-3.745) Q1 (Indexed in ISI & SCOPUS).\n4. M. T. Islam, M. Samsuzzaman, M. Rahman, M. J. Singh, and M. T. Islam,. \"Asymmetric feed circularly polarized broadband printed antenna for wireless communication.\" Journal of Optoelectronics and Advanced Materials 22, no. 3-4 (2020): 129-135. ISSN: 1454-4164, (Impact Factor-0.631) Q4 (Indexed in ISI & SCOPUS).\n5. M. Tarikul Islam, Md Samsuzzaman, Salehin Kibria, Norbahiah Misran, and Mohammad Tariqul Islam. \"Metasurface Loaded High Gain Antenna based Microwave Imaging using Iteratively Corrected Delay Multiply and Sum Algorithm.\" Scientific reports 9, no. 1 (2019): 1-14. ISSN 2045-2322, (Indexed in ISI & SCOPUS) (Impact Factor-4.011) Q1', 6, 13, 'defaultprofilepic.png', '1.png', '7.png', 10, 29, 0, 0, '0', '0', '0'),
(6, 4, 'muradsir', 'pbkdf2:sha256:600000$4bGYQLpLjgEKH5VZ$12cf20e7fd80e442ca66d425f3d7741399ff1c7e7413c745864de4ec0bff4d81', '', '', '', 'tuimorsala01@gmail.com', 'Golam Md. Muradul', 'Bashir', '', '', '', 'Male', '', 'defaultnid.png', 'Faculty of Computer Science and Engineering', '', '', '', '', '01783242885', '1981-04-09 00:00:00.000', '', 0, '', '', '', 0, '', NULL, 0, 0, 'defaultprofilepic.png', '3.png', '9.png', 0, 0, 0, 0, '', '', ''),
(8, 4, 'arpitamam', 'pbkdf2:sha256:600000$Wp8ziS12tcJY689c$a3194f13647bab586bc9fa9b5046bda89906b69e8020230ddb481154b0e599ec', '', '', '', 'lovely.shanto.35@gmail.com', 'Arpita', 'Howlader', '', '', '', 'Female', '', 'defaultnid.png', 'Faculty of Computer Science and Engineering', '', '', '', '', '01584563227', '1993-04-12 00:00:00.000', '', 0, '', '', '', 0, '', NULL, 0, 0, 'defaultprofilepic.png', '4.png', '10.png', 0, 0, 0, 0, '', '', ''),
(10, 4, 'sarnamam', 'pbkdf2:sha256:600000$Xv7Q8DrCtJFwqfoS$98d4769d8cb93405c25c74dca8c6816cc35a4aa4b9c47c2de3f70b7d05d2ed5b', '', '', '', 'raqibul.islam.17@gmail.com', 'Sarna', 'Majumder', '', '', '', 'Female', '', 'defaultnid.png', 'Faculty of Computer Science and Engineering', '', '', '', '', '01767265119', '1991-04-18 00:00:00.000', '', 0, '', '', '', 0, '', NULL, 0, 0, 'defaultprofilepic.png', '5.png', '11.png', 0, 0, 0, 0, '', '', ''),
(11, 4, 'masudsir', 'pbkdf2:sha256:600000$0pc6rnWWVCz8TXGw$63407c54518d4890f8006c3807dc12741fa7642c57c38017aa6ceaab8f23721f', '', '', '', 'raqibul.islam.17@gmail.com', 'Dr. Md Abdul', 'Masud', '', '', '', 'Male', '', 'defaultnid.png', 'Faculty of Computer Science and Engineering', '', '', '', '', '01915461874', '1981-04-09 00:00:00.000', '', 0, '', '', '', 0, '', NULL, 0, 0, 'defaultprofilepic.png', '2.png', '8.png', 0, 0, 0, 0, '', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ActivityPlan`
--
ALTER TABLE `ActivityPlan`
  ADD PRIMARY KEY (`ActivityID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `ActivityPlanHistory`
--
ALTER TABLE `ActivityPlanHistory`
  ADD PRIMARY KEY (`ActivityID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `ActivityPlanOriginal`
--
ALTER TABLE `ActivityPlanOriginal`
  ADD PRIMARY KEY (`ActivityID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `BudgetPlan`
--
ALTER TABLE `BudgetPlan`
  ADD PRIMARY KEY (`BudgetID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `BudgetPlanHistory`
--
ALTER TABLE `BudgetPlanHistory`
  ADD PRIMARY KEY (`BudgetID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `BudgetPlanOriginal`
--
ALTER TABLE `BudgetPlanOriginal`
  ADD PRIMARY KEY (`BudgetID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `Notice`
--
ALTER TABLE `Notice`
  ADD PRIMARY KEY (`NoticeID`);

--
-- Indexes for table `Notification`
--
ALTER TABLE `Notification`
  ADD PRIMARY KEY (`NotificationID`),
  ADD KEY `SenderUserID` (`SenderUserID`),
  ADD KEY `ReceiverUserID` (`ReceiverUserID`);

--
-- Indexes for table `ProjectAdvanceFund`
--
ALTER TABLE `ProjectAdvanceFund`
  ADD PRIMARY KEY (`ProjectAdvanceFundID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `ProjectFund`
--
ALTER TABLE `ProjectFund`
  ADD PRIMARY KEY (`ProjectFundID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `ProjectListWithReviewerID`
--
ALTER TABLE `ProjectListWithReviewerID`
  ADD KEY `ProjectID` (`ProjectID`),
  ADD KEY `ReviewerUserID` (`ReviewerUserID`);

--
-- Indexes for table `ProjectListWithUserID`
--
ALTER TABLE `ProjectListWithUserID`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `ProjectMonitoringFeedback`
--
ALTER TABLE `ProjectMonitoringFeedback`
  ADD PRIMARY KEY (`ProjectMonitoringFeedbackID`),
  ADD KEY `ProjectID` (`ProjectID`),
  ADD KEY `ProjectMonitoringReportID` (`ProjectMonitoringReportID`),
  ADD KEY `MonitoringCommitteeUserID` (`MonitoringCommitteeUserID`);

--
-- Indexes for table `ProjectMonitoringReport`
--
ALTER TABLE `ProjectMonitoringReport`
  ADD PRIMARY KEY (`ProjectMonitoringReportID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `ProjectMonitoringReportActivity`
--
ALTER TABLE `ProjectMonitoringReportActivity`
  ADD KEY `ProjectMonitoringReportID` (`ProjectMonitoringReportID`),
  ADD KEY `ActivityID` (`ActivityID`);

--
-- Indexes for table `ProjectMonitoringReportBudget`
--
ALTER TABLE `ProjectMonitoringReportBudget`
  ADD KEY `ProjectMonitoringReportID` (`ProjectMonitoringReportID`),
  ADD KEY `BudgetID` (`BudgetID`);

--
-- Indexes for table `ProjectReportListWithMonitoringCommitteeID`
--
ALTER TABLE `ProjectReportListWithMonitoringCommitteeID`
  ADD KEY `ProjectMonitoringReportID` (`ProjectMonitoringReportID`),
  ADD KEY `MonitoringCommitteeUserID` (`MonitoringCommitteeUserID`);

--
-- Indexes for table `Projects`
--
ALTER TABLE `Projects`
  ADD PRIMARY KEY (`ProjectID`),
  ADD KEY `CreatorUserID` (`CreatorUserID`),
  ADD KEY `CoPiUserID` (`CoPiUserID`);

--
-- Indexes for table `Review`
--
ALTER TABLE `Review`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `ProjectID` (`ProjectID`),
  ADD KEY `ReviewerUserID` (`ReviewerUserID`);

--
-- Indexes for table `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `TempUsers`
--
ALTER TABLE `TempUsers`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `RoleID` (`RoleID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `RoleID` (`RoleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ActivityPlan`
--
ALTER TABLE `ActivityPlan`
  MODIFY `ActivityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `ActivityPlanHistory`
--
ALTER TABLE `ActivityPlanHistory`
  MODIFY `ActivityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ActivityPlanOriginal`
--
ALTER TABLE `ActivityPlanOriginal`
  MODIFY `ActivityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `BudgetPlan`
--
ALTER TABLE `BudgetPlan`
  MODIFY `BudgetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `BudgetPlanHistory`
--
ALTER TABLE `BudgetPlanHistory`
  MODIFY `BudgetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `BudgetPlanOriginal`
--
ALTER TABLE `BudgetPlanOriginal`
  MODIFY `BudgetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `Notice`
--
ALTER TABLE `Notice`
  MODIFY `NoticeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Notification`
--
ALTER TABLE `Notification`
  MODIFY `NotificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ProjectAdvanceFund`
--
ALTER TABLE `ProjectAdvanceFund`
  MODIFY `ProjectAdvanceFundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ProjectFund`
--
ALTER TABLE `ProjectFund`
  MODIFY `ProjectFundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ProjectMonitoringFeedback`
--
ALTER TABLE `ProjectMonitoringFeedback`
  MODIFY `ProjectMonitoringFeedbackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ProjectMonitoringReport`
--
ALTER TABLE `ProjectMonitoringReport`
  MODIFY `ProjectMonitoringReportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Projects`
--
ALTER TABLE `Projects`
  MODIFY `ProjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `Review`
--
ALTER TABLE `Review`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Role`
--
ALTER TABLE `Role`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `TempUsers`
--
ALTER TABLE `TempUsers`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ActivityPlan`
--
ALTER TABLE `ActivityPlan`
  ADD CONSTRAINT `activityplan_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`);

--
-- Constraints for table `ActivityPlanHistory`
--
ALTER TABLE `ActivityPlanHistory`
  ADD CONSTRAINT `activityplanhistory_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`);

--
-- Constraints for table `ActivityPlanOriginal`
--
ALTER TABLE `ActivityPlanOriginal`
  ADD CONSTRAINT `activityplanoriginal_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`);

--
-- Constraints for table `BudgetPlan`
--
ALTER TABLE `BudgetPlan`
  ADD CONSTRAINT `budgetplan_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`);

--
-- Constraints for table `BudgetPlanHistory`
--
ALTER TABLE `BudgetPlanHistory`
  ADD CONSTRAINT `budgetplanhistory_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`);

--
-- Constraints for table `BudgetPlanOriginal`
--
ALTER TABLE `BudgetPlanOriginal`
  ADD CONSTRAINT `budgetplanoriginal_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`);

--
-- Constraints for table `Notification`
--
ALTER TABLE `Notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`SenderUserID`) REFERENCES `Users` (`UserID`),
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`ReceiverUserID`) REFERENCES `Users` (`UserID`);

--
-- Constraints for table `ProjectAdvanceFund`
--
ALTER TABLE `ProjectAdvanceFund`
  ADD CONSTRAINT `projectadvancefund_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`);

--
-- Constraints for table `ProjectFund`
--
ALTER TABLE `ProjectFund`
  ADD CONSTRAINT `projectfund_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`);

--
-- Constraints for table `ProjectListWithReviewerID`
--
ALTER TABLE `ProjectListWithReviewerID`
  ADD CONSTRAINT `projectlistwithreviewerid_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`),
  ADD CONSTRAINT `projectlistwithreviewerid_ibfk_2` FOREIGN KEY (`ReviewerUserID`) REFERENCES `Users` (`UserID`);

--
-- Constraints for table `ProjectListWithUserID`
--
ALTER TABLE `ProjectListWithUserID`
  ADD CONSTRAINT `projectlistwithuserid_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Users` (`UserID`),
  ADD CONSTRAINT `projectlistwithuserid_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`);

--
-- Constraints for table `ProjectMonitoringFeedback`
--
ALTER TABLE `ProjectMonitoringFeedback`
  ADD CONSTRAINT `projectmonitoringfeedback_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`),
  ADD CONSTRAINT `projectmonitoringfeedback_ibfk_2` FOREIGN KEY (`ProjectMonitoringReportID`) REFERENCES `ProjectMonitoringReport` (`ProjectMonitoringReportID`),
  ADD CONSTRAINT `projectmonitoringfeedback_ibfk_3` FOREIGN KEY (`MonitoringCommitteeUserID`) REFERENCES `Users` (`UserID`);

--
-- Constraints for table `ProjectMonitoringReport`
--
ALTER TABLE `ProjectMonitoringReport`
  ADD CONSTRAINT `projectmonitoringreport_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`);

--
-- Constraints for table `ProjectMonitoringReportActivity`
--
ALTER TABLE `ProjectMonitoringReportActivity`
  ADD CONSTRAINT `projectmonitoringreportactivity_ibfk_1` FOREIGN KEY (`ProjectMonitoringReportID`) REFERENCES `ProjectMonitoringReport` (`ProjectMonitoringReportID`),
  ADD CONSTRAINT `projectmonitoringreportactivity_ibfk_2` FOREIGN KEY (`ActivityID`) REFERENCES `ActivityPlanHistory` (`ActivityID`);

--
-- Constraints for table `ProjectMonitoringReportBudget`
--
ALTER TABLE `ProjectMonitoringReportBudget`
  ADD CONSTRAINT `projectmonitoringreportbudget_ibfk_1` FOREIGN KEY (`ProjectMonitoringReportID`) REFERENCES `ProjectMonitoringReport` (`ProjectMonitoringReportID`),
  ADD CONSTRAINT `projectmonitoringreportbudget_ibfk_2` FOREIGN KEY (`BudgetID`) REFERENCES `BudgetPlanHistory` (`BudgetID`);

--
-- Constraints for table `ProjectReportListWithMonitoringCommitteeID`
--
ALTER TABLE `ProjectReportListWithMonitoringCommitteeID`
  ADD CONSTRAINT `projectreportlistwithmonitoringcommitteeid_ibfk_1` FOREIGN KEY (`ProjectMonitoringReportID`) REFERENCES `ProjectMonitoringReport` (`ProjectMonitoringReportID`),
  ADD CONSTRAINT `projectreportlistwithmonitoringcommitteeid_ibfk_2` FOREIGN KEY (`MonitoringCommitteeUserID`) REFERENCES `Users` (`UserID`);

--
-- Constraints for table `Projects`
--
ALTER TABLE `Projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`CreatorUserID`) REFERENCES `Users` (`UserID`),
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`CoPiUserID`) REFERENCES `Users` (`UserID`);

--
-- Constraints for table `Review`
--
ALTER TABLE `Review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Projects` (`ProjectID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`ReviewerUserID`) REFERENCES `Users` (`UserID`);

--
-- Constraints for table `TempUsers`
--
ALTER TABLE `TempUsers`
  ADD CONSTRAINT `tempusers_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `Role` (`RoleID`);

--
-- Constraints for table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `Role` (`RoleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
