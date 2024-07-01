-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2024 at 06:41 PM
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

-- --------------------------------------------------------

--
-- Table structure for table `PassReset`
--

CREATE TABLE `PassReset` (
  `Email` varchar(255) NOT NULL,
  `ResetToken` varchar(255) NOT NULL,
  `Used` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `ProjectListWithReviewerID`
--

CREATE TABLE `ProjectListWithReviewerID` (
  `ProjectID` int(11) DEFAULT NULL,
  `ReviewerUserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ProjectListWithUserID`
--

CREATE TABLE `ProjectListWithUserID` (
  `UserID` int(11) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `ProjectTitle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `ProjectMonitoringReportActivity`
--

CREATE TABLE `ProjectMonitoringReportActivity` (
  `ProjectMonitoringReportID` int(11) DEFAULT NULL,
  `ActivityID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ProjectMonitoringReportBudget`
--

CREATE TABLE `ProjectMonitoringReportBudget` (
  `ProjectMonitoringReportID` int(11) DEFAULT NULL,
  `BudgetID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ProjectReportListWithMonitoringCommitteeID`
--

CREATE TABLE `ProjectReportListWithMonitoringCommitteeID` (
  `ProjectMonitoringReportID` int(11) DEFAULT NULL,
  `MonitoringCommitteeUserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 1, 'rakib', 'pbkdf2:sha256:600000$pBp6ozzOF62V7o4z$f715e4a4334b95bf32e8d6c7ee447933255bd0e9c5879c73f7b0c43ab894a7c4', 'admin', '', '2024', 'rakib29185@gmail.com', 'admin', NULL, NULL, NULL, NULL, 'Male', NULL, '18.png', '', '', 'Patuakhali Science & Technology University (PSTU)', NULL, NULL, '01700000000', '2000-09-17 00:00:00.000', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'defaultprofilepic.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  MODIFY `ActivityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `ActivityPlanHistory`
--
ALTER TABLE `ActivityPlanHistory`
  MODIFY `ActivityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `ActivityPlanOriginal`
--
ALTER TABLE `ActivityPlanOriginal`
  MODIFY `ActivityID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `BudgetPlan`
--
ALTER TABLE `BudgetPlan`
  MODIFY `BudgetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `BudgetPlanHistory`
--
ALTER TABLE `BudgetPlanHistory`
  MODIFY `BudgetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `BudgetPlanOriginal`
--
ALTER TABLE `BudgetPlanOriginal`
  MODIFY `BudgetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `Notice`
--
ALTER TABLE `Notice`
  MODIFY `NoticeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `Notification`
--
ALTER TABLE `Notification`
  MODIFY `NotificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `ProjectAdvanceFund`
--
ALTER TABLE `ProjectAdvanceFund`
  MODIFY `ProjectAdvanceFundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `ProjectFund`
--
ALTER TABLE `ProjectFund`
  MODIFY `ProjectFundID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `ProjectMonitoringFeedback`
--
ALTER TABLE `ProjectMonitoringFeedback`
  MODIFY `ProjectMonitoringFeedbackID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `ProjectMonitoringReport`
--
ALTER TABLE `ProjectMonitoringReport`
  MODIFY `ProjectMonitoringReportID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `Projects`
--
ALTER TABLE `Projects`
  MODIFY `ProjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `Review`
--
ALTER TABLE `Review`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `Role`
--
ALTER TABLE `Role`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `TempUsers`
--
ALTER TABLE `TempUsers`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
