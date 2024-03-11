-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2024 at 09:23 PM
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
-- Database: `final_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `activityplan`
--

CREATE TABLE `activityplan` (
  `ProjectID` int(11) NOT NULL,
  `ActivityID` int(11) NOT NULL,
  `ActivityName` varchar(255) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Activity` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `NotificationID` int(11) NOT NULL,
  `SenderUserID` int(11) DEFAULT NULL,
  `ReceiverUserID` int(11) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `passreset`
--

CREATE TABLE `passreset` (
  `Email` varchar(255) NOT NULL,
  `ResetToken` varchar(255) NOT NULL,
  `Used` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projectlistwithuserid`
--

CREATE TABLE `projectlistwithuserid` (
  `UserID` int(11) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `ProjectTitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projectlistwithuserid`
--

INSERT INTO `projectlistwithuserid` (`UserID`, `ProjectID`, `ProjectTitle`) VALUES
(1, 2, ''),
(1, 3, ''),
(1, 4, ''),
(1, 5, ''),
(1, 6, ''),
(1, 7, ''),
(1, 8, ''),
(1, 9, ''),
(1, 10, ''),
(1, 11, ''),
(1, 12, ''),
(1, 13, ''),
(1, 14, ''),
(1, 15, ''),
(1, 16, ''),
(1, 17, ''),
(1, 18, ''),
(1, 19, ''),
(1, 20, ''),
(1, 21, ''),
(1, 22, ''),
(1, 23, ''),
(1, 24, ''),
(1, 25, ''),
(1, 26, 'Project Title'),
(1, 27, 'Project Title'),
(1, 28, ''),
(1, 29, ''),
(1, 30, ''),
(1, 31, 'Project Title0'),
(1, 32, 'Project Title0'),
(1, 33, 'Project Title0'),
(1, 34, ''),
(1, 35, ''),
(1, 36, ''),
(1, 37, ''),
(1, 38, ''),
(1, 39, ''),
(1, 40, 'Project Titlesd'),
(1, 41, ''),
(1, 42, ''),
(1, 43, ''),
(1, 51, 'Project Titledsfdsf');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `ProjectID` int(11) NOT NULL,
  `CodeByRTC` varchar(255) DEFAULT NULL,
  `DateRecieved` varchar(255) DEFAULT NULL,
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
  `CreatorUserID` int(11) DEFAULT NULL,
  `CoPiUserID` int(11) DEFAULT NULL,
  `StudentUserID` int(11) DEFAULT NULL,
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
  `TotalPoints` int(11) DEFAULT NULL,
  `ProjectSoftCopyLocation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`ProjectID`, `CodeByRTC`, `DateRecieved`, `ProjectTitle`, `NatureOfResearchProposal`, `NameOfCollaboratingDepartments`, `AddressOfCollaboratingDepartments`, `NameOfCollaboratingInstitutes`, `AddressOfCollaboratingInstitutes`, `LocationOfFieldActivities`, `DurationOfResearchProjectAnnual`, `DurationOfResearchProjectLongTerm`, `TotalBudgetOfResearchProposalTK`, `ExternalAgencyFundingSource`, `ExternalAgencyFundingSourcesName`, `ExternalAgencyFundingSourcesSubmissionDate`, `CommitmentOtherResearchProject`, `CommitmentOtherResearchProjectName`, `ProjectDescription`, `ProjectObjective`, `PstuNationalGoal`, `PriorResearchOverview`, `Methodology`, `MethodologyFileLocation`, `ExpectedOutput`, `SuccessIndicators`, `Beneficiaries`, `ManPowerExisting`, `ManPowerRequired`, `SmallEquipmentExisting`, `SmallEquipmentRequired`, `ResearchMaterialsExisting`, `ResearchMaterialsRequired`, `OtherExisting`, `OtherRequired`, `ResearchCarriedOutPlace`, `CreatorUserID`, `CoPiUserID`, `StudentUserID`, `CreatorUserSealLocation`, `CreatorUserSignatureLocation`, `CreatorUserSignatureDate`, `ChairmanOfDepartmentComment`, `ChairmanOfDepartmentSealLocation`, `ChairmanOfDepartmentSignatureLocation`, `ChairmanOfDepartmentSignatureDate`, `ResultsAndDiscussion`, `KeyAchievements`, `ProjectStatus`, `TotalPoints`, `ProjectSoftCopyLocation`) VALUES
(1, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '568f1dd5-07e5-4c23-8117-321858310b28.jfif', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, 'C-Unit-Business-Female-Merit.pdf', 'coin.txt', '', '', 'URLs_2023_12_22.txt', 'idea.docx', '', NULL, NULL, 'Completed', NULL, 'zzz.pdf'),
(2, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(3, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(4, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(5, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(6, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(7, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(8, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(9, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(10, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(11, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(12, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(13, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(14, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(15, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(16, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(17, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(18, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(19, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '2024-03-07 20:08:05.734', 'Comments of the Chairman of the Department', '', '', '2024-03-07 20:08:05.784', NULL, NULL, NULL, NULL, NULL),
(20, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '2024-03-07 20:09:32.444', 'Comments of the Chairman of the Department', '', '', '2024-03-07 20:09:32.497', NULL, NULL, NULL, NULL, NULL),
(21, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '2024-03-07 20:12:23.918', 'Comments of the Chairman of the Department', '', '', '2024-03-07 20:12:23.970', NULL, NULL, NULL, NULL, NULL),
(22, '465465', '2024-03-07 20:13:47.938', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(23, '465465', '2024-03-07 20:13:47.938', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(24, '4654650000000000', '2024-03-07 20:13:47.938', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(25, '465465', '2024-03-07 21:23:08.970', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(26, '', '', 'Project Title', 'Coordinated', 'Faculty of Computer Science and Engineering', 'PSTU patuakhali', 'Faculty of Computer Science and Engineering', 'PSTU patuakhali', 'PSTU patuakhali', '2024-03-07 21:25:03.012 - 2024-03-14 21:25:03.012', '2024-03-07 21:25:03.023 - 2024-03-14 21:25:03.023', 1000000, 'Not Submitted', '', 'null', 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(27, '', '', 'Project Title', 'Coordinated', 'Faculty of Computer Science and Engineering', 'PSTU patuakhali', 'Faculty of Computer Science and Engineering', 'PSTU patuakhali', 'PSTU patuakhali', '2024-03-07 21:25:03.012 - 2024-03-14 21:25:03.012', '2024-03-07 21:25:03.023 - 2024-03-14 21:25:03.023', 1000000, 'Not Submitted', '', 'null', 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(28, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', 'hhh', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(29, '4654650000', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', 'hhh', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(30, '4654650000', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(31, '4654650000', '', 'Project Title0', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(32, '4654650000', '', 'Project Title0', '', '', '', '', '', '', '', '', 0, '', '', '', '', 'jhjkhjhkj', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(33, '4654650000', '', 'Project Title0', '', '', '', '', '', '', '', '', 0, '', '', '', '', 'hjhgh', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(34, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(35, '', '', '', '', '', '', '', '', '', '', '', 10000000, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(36, '', '', '', '', '', '', '', '', '', '', '', 10000000, '', '', '', 'No', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(37, '', '', '', '', '', '', '', '', '', '', '', 10000000, '', '', '', 'Yes', 'hgjjhh', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(38, '', '', '', 'Interdisciplinary', '', '', '', '', '', '', '', 0, 'Not Submitted', '', 'null', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(39, '', '', '', 'Interdisciplinary', '', '', '', '', '', '', '', 0, 'Submitted', 'xcxx', '2024-03-07 00:00:00.000', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(40, '4654655', '2024-03-07 00:00:00.000', 'Project Titlesd', 'Independent', 'Faculty of Business Administration', 'PSTU patuakhalids', 'Faculty of Business Administration', 'PSTU patuakhalids', 'PSTU patuakhalif', '2024-03-19 00:00:00.000 - 2024-03-21 00:00:00.000', '2024-03-19 00:00:00.000 - 2024-03-22 00:00:00.000', 10000001, 'Submitted', 'dfsf', '2024-03-23 00:00:00.000', 'Yes', 'dsfdsf', 'Introduction, Identification of Problem & Justification of The Research Proposald', 'Specific Objectives of The Proposald', 'Relevance to The Strategic Plan of Pstu & National Development Goalsd', 'Brief Review of Works Already Performed / in Progress Elsewhere With List of Referenceds', 'Methodologyd', 'Screenshot (285).png', 'Expected Outputsdd', 'Success Indicatorsdd', 'Beneficiariesdd', 'Existingd', 'Requiredd', 'Existingd', 'Requiredd', 'Existingd', 'Requiredd', 'Existingd', 'Requiredd', NULL, 1, 1, 1, 'Screenshot (288).png', 'Screenshot (286).png', '2024-03-25 00:00:00.000', 'Comments of the Chairman of the Departmentf', 'Screenshot (290).png', 'Screenshot (289).png', '2024-03-26 00:00:00.000', NULL, NULL, NULL, NULL, NULL),
(41, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 1, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(42, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 3, 1, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(43, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 1, 3, 2, '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL),
(51, '46546532343234', '2024-03-16 00:00:00.000', 'Project Titledsfdsf', 'Applied', 'Faculty of Business Administration', 'PSTU patuakhalidfsf', 'Faculty of Business Administration', 'PSTU patuakhalidfsf', 'PSTU patuakhalidsfds', '2024-03-05 00:00:00.000 - 2024-03-07 00:00:00.000', '2024-03-11 00:00:00.000 - 2024-03-12 00:00:00.000', 2147483647, 'Submitted', 'dsfsdf', '2024-03-23 00:00:00.000', 'No', '', 'Introduction, Identification of Problem & Justification osdsff The Research Proposal', 'Specific Objectives of The Proposalsdfsdf', 'Relevance to The Strategic Plan of Pstu & National Develsdfdsfopment Goals', 'Brief Review of Works Already Performed / in Progress Elsewhsdfdsfere With List of References', 'Methodologydsfdsf', 'Screenshot (370).png', 'Expected Outputsfdsf', 'Success Indicatorssdf', 'Beneficiariesfdsfds', 'Existingdsf', 'fRequired', 'Existingf', 'Requirefd', 'Existingf', 'Requiredf', 'Existingf', 'Requirfed', NULL, 1, 3, 2, 'Screenshot (362).png', 'Screenshot (370).png', '2024-03-03 00:00:00.000', 'Comments of the Chairman of the Departmenfft', 'Screenshot (367).png', 'Screenshot (360).png', '2024-03-17 00:00:00.000', NULL, NULL, 'Pending', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `ReviewID` int(11) NOT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `ReviewerUserID` int(11) DEFAULT NULL,
  `Comments` text DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Points` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RoleID`, `RoleName`) VALUES
(1, 'Admin'),
(2, 'Researcher'),
(3, 'Reviewer'),
(4, 'Teacher'),
(5, 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
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
  `InstituteName` varchar(255) DEFAULT NULL,
  `InstituteLocation` varchar(255) DEFAULT NULL,
  `InstituteEmail` varchar(255) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Dateofbirth` varchar(255) DEFAULT NULL,
  `SalaryScale` int(11) DEFAULT NULL,
  `HighestAcademicQualification` varchar(255) DEFAULT NULL,
  `HighestAcademicQualificationUniversity` varchar(255) DEFAULT NULL,
  `HighestAcademicQualificationCountry` varchar(255) DEFAULT NULL,
  `HighestAcademicQualificationYear` int(11) DEFAULT NULL,
  `AreaOfExpertise` varchar(255) DEFAULT NULL,
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `RoleID`, `Username`, `Password`, `PositionEnglish`, `PositionBangla`, `PositionHeldSince`, `Email`, `FirstName`, `LastName`, `FullNameBangla`, `PresentAddress`, `PermanentAddress`, `Gender`, `Nid`, `NidLocation`, `InstituteName`, `InstituteLocation`, `InstituteEmail`, `Phone`, `Dateofbirth`, `SalaryScale`, `HighestAcademicQualification`, `HighestAcademicQualificationUniversity`, `HighestAcademicQualificationCountry`, `HighestAcademicQualificationYear`, `AreaOfExpertise`, `ExperienceInResearch`, `Teaching`, `ProfilePicLocation`, `SignatureLocation`, `SealLocation`, `TotalNumberOfCompleteProjects`, `TotalNumberOfCompletePublications`, `OngoingProjects`, `StudentID`, `StudentRegNo`, `FirstEnrollmentSemester`, `UndergraduateCGPALevel`) VALUES
(1, 1, 'rakib', 'pbkdf2:sha256:600000$pBp6ozzOF62V7o4z$f715e4a4334b95bf32e8d6c7ee447933255bd0e9c5879c73f7b0c43ab894a7c4', 'd', 'd', 'd', 'rakib29185@gmail.com', 'MD Rakibul', 'Islam', 'd', 'address', 'd', 'd', 'd', NULL, 'd', 'd', 'd', '01700000000', '2000-09-17 00:00:00.000', 0, 'cse', 'pstu', 'bd', 2024, 'area', 0, 0, '30000000.jpg', NULL, 'shanto.jpg', 0, 0, 0, 0, 'd', 'd', 'd'),
(2, 5, 'taj', 'pbkdf2:sha256:600000$fvGbCjbgaOWoIxxQ$c4f2a33ddf766eb6298948bcc01a67a8e9011418eabe1a9201a2cb552e3faf43', '', '', '', 'taj', 'taj', 'taj', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01400000000', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 4, 'sobujsir', 'pbkdf2:sha256:600000$T9gF3PI05rPxPLm1$f79929f8dcd1d67904d504593b132d2542b739e4fefb0febae3ed44398b15123', 'f', 'f', '5', 'sobujsir@gmail.com', 'sobujsir', 'sobujsir', 'hf', 'f', 'f', 'f', 'ff', '', 'f', 'f', 'f', '01500000000', '2024-03-20 00:00:00.000', 0, 'f', 'ff', 'f', 0, 'f', 0, 0, NULL, 'IMG_20230725_162605.jpg', 'shanto  .jpg', 0, 0, 0, 0, '3', 'f', 'f'),
(4, 4, 'test', 'pbkdf2:sha256:600000$ro6WCinSg8T9e8tY$dd76510053f1b34d729d6d59b20e85fdde00ff56787340ee5471dba9f2ec63b6', '', '', '', 'test@gmail.com', 'test', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01725225225', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activityplan`
--
ALTER TABLE `activityplan`
  ADD PRIMARY KEY (`ProjectID`,`ActivityID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`NotificationID`),
  ADD KEY `SenderUserID` (`SenderUserID`),
  ADD KEY `ReceiverUserID` (`ReceiverUserID`);

--
-- Indexes for table `projectlistwithuserid`
--
ALTER TABLE `projectlistwithuserid`
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`ProjectID`),
  ADD KEY `CreatorUserID` (`CreatorUserID`),
  ADD KEY `CoPiUserID` (`CoPiUserID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `ProjectID` (`ProjectID`),
  ADD KEY `ReviewerUserID` (`ReviewerUserID`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `RoleID` (`RoleID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `NotificationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `ProjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activityplan`
--
ALTER TABLE `activityplan`
  ADD CONSTRAINT `activityplan_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`SenderUserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`ReceiverUserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `projectlistwithuserid`
--
ALTER TABLE `projectlistwithuserid`
  ADD CONSTRAINT `projectlistwithuserid_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `projectlistwithuserid_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`CreatorUserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`CoPiUserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`ReviewerUserID`) REFERENCES `users` (`UserID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
