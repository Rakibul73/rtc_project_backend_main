-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2023 at 04:42 PM
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

--
-- Dumping data for table `activityplan`
--

INSERT INTO `activityplan` (`ProjectID`, `ActivityID`, `ActivityName`, `StartDate`, `EndDate`, `Activity`) VALUES
(1, 1, 'Data Collection', '2023-02-01', '2023-02-15', 'Collect data from various sources'),
(1, 2, 'Data Analysis', '2023-02-16', '2023-03-01', 'Perform statistical analysis on collected data'),
(2, 1, 'Data Collection', '2022-08-01', '2022-08-15', 'Collect data from various datasets'),
(2, 2, 'Data Analysis', '2022-08-16', '2022-09-01', 'Apply machine learning algorithms for analysis');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `NotificationID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Message` text DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`NotificationID`, `UserID`, `Message`, `Timestamp`) VALUES
(1, 2, 'You have a new project notification.', '2023-12-04 16:21:40'),
(2, 3, 'Your project review has been submitted.', '2023-12-04 16:21:40');

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
(2, 1, 'Machine Learning Project'),
(3, 2, 'Data Science Project');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `ProjectID` int(11) NOT NULL,
  `CodeByRTC` varchar(255) DEFAULT NULL,
  `DateRecieved` date DEFAULT NULL,
  `ProjectTitle` varchar(255) DEFAULT NULL,
  `NatureOfResearchProposal` varchar(255) DEFAULT NULL,
  `NameOfCollaboratingDepartments` varchar(255) DEFAULT NULL,
  `AddressOfCollaboratingDepartments` varchar(255) DEFAULT NULL,
  `NameOfCollaboratingInstitutes` varchar(255) DEFAULT NULL,
  `AddressOfCollaboratingInstitutes` varchar(255) DEFAULT NULL,
  `LocationOfFieldActivities` varchar(255) DEFAULT NULL,
  `DurationOfResearchProjectAnnual` int(11) DEFAULT NULL,
  `DurationOfResearchProjectLongTerm` int(11) DEFAULT NULL,
  `TotalBudgetOfResearchProposalTK` int(11) DEFAULT NULL,
  `ExternalAgencyFundingSourcesName` varchar(255) DEFAULT NULL,
  `ExternalAgencyFundingSourcesSubmissionDate` date DEFAULT NULL,
  `ProjectDescription` text DEFAULT NULL,
  `ProjectAbstract` text DEFAULT NULL,
  `ProjectObjective` text DEFAULT NULL,
  `PstuNationalGoal` text DEFAULT NULL,
  `PriorResearchOverview` text DEFAULT NULL,
  `Methodology` text DEFAULT NULL,
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
  `CreatorUserDate` date DEFAULT NULL,
  `CreatorUserSealLocation` varchar(255) DEFAULT NULL,
  `ChairmanOfDepartmentComment` text DEFAULT NULL,
  `ChairmanOfDepartmentSignatureLocation` varchar(255) DEFAULT NULL,
  `ChairmanOfDepartmentSignatureDate` date DEFAULT NULL,
  `ResultsAndDiscussion` text DEFAULT NULL,
  `KeyAchievements` text DEFAULT NULL,
  `ProjectStatus` varchar(50) DEFAULT NULL,
  `TotalPoints` int(11) DEFAULT NULL,
  `ProjectSoftCopyLocation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`ProjectID`, `CodeByRTC`, `DateRecieved`, `ProjectTitle`, `NatureOfResearchProposal`, `NameOfCollaboratingDepartments`, `AddressOfCollaboratingDepartments`, `NameOfCollaboratingInstitutes`, `AddressOfCollaboratingInstitutes`, `LocationOfFieldActivities`, `DurationOfResearchProjectAnnual`, `DurationOfResearchProjectLongTerm`, `TotalBudgetOfResearchProposalTK`, `ExternalAgencyFundingSourcesName`, `ExternalAgencyFundingSourcesSubmissionDate`, `ProjectDescription`, `ProjectAbstract`, `ProjectObjective`, `PstuNationalGoal`, `PriorResearchOverview`, `Methodology`, `ExpectedOutput`, `SuccessIndicators`, `Beneficiaries`, `ManPowerExisting`, `ManPowerRequired`, `SmallEquipmentExisting`, `SmallEquipmentRequired`, `ResearchMaterialsExisting`, `ResearchMaterialsRequired`, `OtherExisting`, `OtherRequired`, `ResearchCarriedOutPlace`, `CreatorUserID`, `CreatorUserDate`, `CreatorUserSealLocation`, `ChairmanOfDepartmentComment`, `ChairmanOfDepartmentSignatureLocation`, `ChairmanOfDepartmentSignatureDate`, `ResultsAndDiscussion`, `KeyAchievements`, `ProjectStatus`, `TotalPoints`, `ProjectSoftCopyLocation`) VALUES
(1, 'RTC123', '2023-01-01', 'Machine Learning Project', 'Research on ML algorithms', 'Computer Science', '123 Main St, City', 'Institute of Technology', '456 Tech St, Tech City', 'Techville', 12, 24, 50000, 'Tech Foundation', '2023-02-01', 'Detailed description of the project', 'Project abstract goes here', 'Project objective details', 'Contribution to PSTU national goal', 'Overview of prior research', 'Methodology details', 'Expected project output', 'Success indicators', 'Project beneficiaries', 'Existing manpower details', 'Manpower required for the project', 'Existing small equipment details', 'Small equipment required for the project', 'Existing research materials details', 'Research materials required for the project', 'Other existing resources details', 'Other resources required for the project', 'Lab A, Tech Institute', 2, '2023-01-15', 'Seal_Location_Admin.jpg', 'Comment from Chairman goes here', 'Signature_Location_Admin.jpg', '2023-01-20', 'Results and discussion details', 'Key achievements of the project', 'Ongoing', 0, 'project_softcopy_location_machine_learning'),
(2, 'RTC456', '2022-07-01', 'Data Science Project', 'Analysis of large datasets', 'Statistics Department', '789 Data St, City', 'Data Analytics Institute', '101 Analytics St, Analytics City', 'Analyticsville', 10, 18, 35000, 'Data Analytics Foundation', '2022-07-15', 'Detailed description of the project', 'Project abstract goes here', 'Project objective details', 'Contribution to PSTU national goal', 'Overview of prior research', 'Methodology details', 'Expected project output', 'Success indicators', 'Project beneficiaries', 'Existing manpower details', 'Manpower required for the project', 'Existing small equipment details', 'Small equipment required for the project', 'Existing research materials details', 'Research materials required for the project', 'Other existing resources details', 'Other resources required for the project', 'Lab B, Analytics Institute', 3, '2022-07-10', 'Seal_Location_Researcher.jpg', 'Comment from Chairman goes here', 'Signature_Location_Researcher.jpg', '2022-07-15', 'Results and discussion details', 'Key achievements of the project', 'Completed', 0, 'project_softcopy_location_data_science'),
(3, 'RTC789', '2023-03-01', 'Artificial Intelligence Project', 'Development of AI algorithms', 'Computer Science', '234 Tech St, Tech City', 'AI Institute', '567 AI St, AI City', 'AIVille', 15, 30, 80000, 'AI Foundation', '2023-04-01', 'Detailed description of the project', 'Project abstract goes here', 'Project objective details', 'Contribution to PSTU national goal', 'Overview of prior research', 'Methodology details', 'Expected project output', 'Success indicators', 'Project beneficiaries', 'Existing manpower details', 'Manpower required for the project', 'Existing small equipment details', 'Small equipment required for the project', 'Existing research materials details', 'Research materials required for the project', 'Other existing resources details', 'Other resources required for the project', 'Lab C, AI Institute', 4, '2023-03-15', 'Seal_Location_Researcher.jpg', 'Comment from Chairman goes here', 'Signature_Location_Researcher.jpg', '2023-03-20', 'Results and discussion details', 'Key achievements of the project', 'Ongoing', 0, 'project_softcopy_location_ai'),
(4, 'RTC101', '2022-09-01', 'Renewable Energy Project', 'Development of sustainable energy sources', 'Environmental Science', '345 Eco St, Eco City', 'Renewable Energy Institute', '678 Renew St, Renew City', 'RenewVille', 18, 36, 120000, 'Renewable Energy Foundation', '2022-09-15', 'Detailed description of the project', 'Project abstract goes here', 'Project objective details', 'Contribution to PSTU national goal', 'Overview of prior research', 'Methodology details', 'Expected project output', 'Success indicators', 'Project beneficiaries', 'Existing manpower details', 'Manpower required for the project', 'Existing small equipment details', 'Small equipment required for the project', 'Existing research materials details', 'Research materials required for the project', 'Other existing resources details', 'Other resources required for the project', 'Lab D, Renewable Energy Institute', 5, '2022-09-10', 'Seal_Location_Researcher.jpg', 'Comment from Chairman goes here', 'Signature_Location_Researcher.jpg', '2022-09-15', 'Results and discussion details', 'Key achievements of the project', 'Completed', 0, 'project_softcopy_location_renewable_energy'),
(5, 'RTC111', '2022-11-01', 'Smart Cities Project', 'Implementation of smart city technologies', 'Civil Engineering', '456 Urban St, Urban City', 'Smart Cities Institute', '789 Smart St, Smart City', 'SmartVille', 20, 40, 150000, 'Smart Cities Foundation', '2022-11-15', 'Detailed description of the project', 'Project abstract goes here', 'Project objective details', 'Contribution to PSTU national goal', 'Overview of prior research', 'Methodology details', 'Expected project output', 'Success indicators', 'Project beneficiaries', 'Existing manpower details', 'Manpower required for the project', 'Existing small equipment details', 'Small equipment required for the project', 'Existing research materials details', 'Research materials required for the project', 'Other existing resources details', 'Other resources required for the project', 'Lab E, Smart Cities Institute', 6, '2022-11-10', 'Seal_Location_Researcher.jpg', 'Comment from Chairman goes here', 'Signature_Location_Researcher.jpg', '2022-11-15', 'Results and discussion details', 'Key achievements of the project', 'Ongoing', 0, 'project_softcopy_location_smart_cities'),
(6, 'RTC121', '2022-12-15', 'Health Informatics Project', 'Integration of technology in healthcare', 'Health Informatics', '567 Health St, Health City', 'Health Informatics Institute', '890 Health St, Health City', 'HealthVille', 16, 32, 100000, 'Health Informatics Foundation', '2023-01-01', 'Detailed description of the project', 'Project abstract goes here', 'Project objective details', 'Contribution to PSTU national goal', 'Overview of prior research', 'Methodology details', 'Expected project output', 'Success indicators', 'Project beneficiaries', 'Existing manpower details', 'Manpower required for the project', 'Existing small equipment details', 'Small equipment required for the project', 'Existing research materials details', 'Research materials required for the project', 'Other existing resources details', 'Other resources required for the project', 'Lab F, Health Informatics Institute', 7, '2022-12-20', 'Seal_Location_Researcher.jpg', 'Comment from Chairman goes here', 'Signature_Location_Researcher.jpg', '2022-12-25', 'Results and discussion details', 'Key achievements of the project', 'Ongoing', 0, 'project_softcopy_location_health_informatics'),
(7, 'RTC131', '2022-10-01', 'Cybersecurity Project', 'Enhancement of cybersecurity measures', 'Computer Science', '678 Security St, Security City', 'Cybersecurity Institute', '901 Cyber St, Cyber City', 'CyberVille', 14, 28, 90000, 'Cybersecurity Foundation', '2022-10-15', 'Detailed description of the project', 'Project abstract goes here', 'Project objective details', 'Contribution to PSTU national goal', 'Overview of prior research', 'Methodology details', 'Expected project output', 'Success indicators', 'Project beneficiaries', 'Existing manpower details', 'Manpower required for the project', 'Existing small equipment details', 'Small equipment required for the project', 'Existing research materials details', 'Research materials required for the project', 'Other existing resources details', 'Other resources required for the project', 'Lab G, Cybersecurity Institute', 8, '2022-10-10', 'Seal_Location_Researcher.jpg', 'Comment from Chairman goes here', 'Signature_Location_Researcher.jpg', '2022-10-15', 'Results and discussion details', 'Key achievements of the project', 'Completed', 0, 'project_softcopy_location_cybersecurity'),
(8, 'RTC141', '2023-02-15', 'Climate Change Project', 'Impact of climate change on local communities', 'Environmental Science', '789 Climate St, Climate City', 'Climate Change Institute', '101 Climate St, Climate City', 'ClimateVille', 12, 24, 75000, 'Climate Change Foundation', '2023-03-01', 'Detailed description of the project', 'Project abstract goes here', 'Project objective details', 'Contribution to PSTU national goal', 'Overview of prior research', 'Methodology details', 'Expected project output', 'Success indicators', 'Project beneficiaries', 'Existing manpower details', 'Manpower required for the project', 'Existing small equipment details', 'Small equipment required for the project', 'Existing research materials details', 'Research materials required for the project', 'Other existing resources details', 'Other resources required for the project', 'Lab H, Climate Change Institute', 9, '2023-02-20', 'Seal_Location_Researcher.jpg', 'Comment from Chairman goes here', 'Signature_Location_Researcher.jpg', '2023-02-25', 'Results and discussion details', 'Key achievements of the project', 'Ongoing', 0, 'project_softcopy_location_climate_change'),
(9, 'RTC151', '2023-04-01', 'Biotechnology Project', 'Advancements in biotechnological applications', 'Biotechnology', '890 Bio St, Bio City', 'Biotechnology Institute', '123 Bio St, Bio City', 'BioVille', 22, 44, 160000, 'Biotechnology Foundation', '2023-04-15', 'Detailed description of the project', 'Project abstract goes here', 'Project objective details', 'Contribution to PSTU national goal', 'Overview of prior research', 'Methodology details', 'Expected project output', 'Success indicators', 'Project beneficiaries', 'Existing manpower details', 'Manpower required for the project', 'Existing small equipment details', 'Small equipment required for the project', 'Existing research materials details', 'Research materials required for the project', 'Other existing resources details', 'Other resources required for the project', 'Lab I, Biotechnology Institute', 10, '2023-04-05', 'Seal_Location_Researcher.jpg', 'Comment from Chairman goes here', 'Signature_Location_Researcher.jpg', '2023-04-10', 'Results and discussion details', 'Key achievements of the project', 'Ongoing', 0, 'project_softcopy_location_biotechnology');

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

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`ReviewID`, `ProjectID`, `ReviewerUserID`, `Comments`, `Rating`, `Points`) VALUES
(1, 1, 3, 'Great work on machine learning project!', 9, 90),
(2, 2, 2, 'Thorough analysis of large datasets in data science project', 8, 80);

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
(3, 'Reviewer');

-- --------------------------------------------------------

--
-- Table structure for table `studentuser`
--

CREATE TABLE `studentuser` (
  `StudentID` int(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RegNo` varchar(50) DEFAULT NULL,
  `FirstEnrollmentSemester` varchar(50) DEFAULT NULL,
  `UndergraduateCGPALevel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `studentuser`
--

INSERT INTO `studentuser` (`StudentID`, `NAME`, `RegNo`, `FirstEnrollmentSemester`, `UndergraduateCGPALevel`) VALUES
(234231432, 'John Doe', '2021001', 'Fall 2021', '3.5'),
(2032531001, 'Bob Johnson', '2021003', 'Fall 2020', '3.2'),
(2147483647, 'Jane Smith', '2021002', 'Spring 2021', '3.8');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `SalaryScale` int(11) DEFAULT NULL,
  `HighestAcademicQualificationUniversity` varchar(255) DEFAULT NULL,
  `HighestAcademicQualificationCountry` varchar(255) DEFAULT NULL,
  `HighestAcademicQualificationYear` int(11) DEFAULT NULL,
  `AreaOfExpertise` varchar(255) DEFAULT NULL,
  `ExperienceInResearch` int(11) DEFAULT NULL,
  `Teaching` int(11) DEFAULT NULL,
  `RoleID` int(11) DEFAULT NULL,
  `ProfilePicLocation` varchar(255) DEFAULT NULL,
  `TotalNumberOfCompleteProjects` int(11) DEFAULT NULL,
  `TotalNumberOfCompletePublications` int(11) DEFAULT NULL,
  `OngoingProjects` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `PASSWORD`, `Email`, `FirstName`, `LastName`, `Address`, `Phone`, `SalaryScale`, `HighestAcademicQualificationUniversity`, `HighestAcademicQualificationCountry`, `HighestAcademicQualificationYear`, `AreaOfExpertise`, `ExperienceInResearch`, `Teaching`, `RoleID`, `ProfilePicLocation`, `TotalNumberOfCompleteProjects`, `TotalNumberOfCompletePublications`, `OngoingProjects`) VALUES
(1, 'admin_user4', 'admin_password4', 'admin4@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'admin_profile4.jpg', 10, 5, 2),
(2, 'researcher_user', 'researcher_password', 'researcher@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'researcher_profile.jpg', 5, 2, 3),
(3, 'reviewer_user', 'reviewer_password', 'reviewer@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'reviewer_profile.jpg', 8, 4, 1),
(4, 'admin_user1', 'admin_password1', 'admin1@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'admin_profile1.jpg', 8, 4, 3),
(5, 'admin_user2', 'admin_password2', 'admin2@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'admin_profile2.jpg', 12, 6, 1),
(6, 'admin_user3', 'admin_password3', 'admin3@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 'admin_profile3.jpg', 15, 8, 2),
(7, 'researcher_user1', 'researcher_password1', 'researcher1@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'researcher_profile1.jpg', 6, 3, 2),
(8, 'researcher_user2', 'researcher_password2', 'researcher2@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'researcher_profile2.jpg', 10, 5, 1),
(9, 'researcher_user3', 'researcher_password3', 'researcher3@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 'researcher_profile3.jpg', 8, 4, 3),
(10, 'reviewer_user1', 'reviewer_password1', 'reviewer1@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'reviewer_profile1.jpg', 10, 5, 1),
(11, 'reviewer_user2', 'reviewer_password2', 'reviewer2@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'reviewer_profile2.jpg', 7, 3, 2),
(12, 'reviewer_user3', 'reviewer_password3', 'reviewer3@example.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 'reviewer_profile3.jpg', 9, 4, 3);

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
  ADD KEY `UserID` (`UserID`);

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
  ADD KEY `CreatorUserID` (`CreatorUserID`);

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
-- Indexes for table `studentuser`
--
ALTER TABLE `studentuser`
  ADD PRIMARY KEY (`StudentID`);

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
  MODIFY `NotificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `ProjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`);

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
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`CreatorUserID`) REFERENCES `users` (`UserID`);

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
