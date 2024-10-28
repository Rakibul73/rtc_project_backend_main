-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pstu_rtc
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activityplan`
--

DROP TABLE IF EXISTS `activityplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activityplan` (
  `ActivityID` int NOT NULL AUTO_INCREMENT,
  `ProjectID` int DEFAULT NULL,
  `Activity` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `ActivityStatus` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`ActivityID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `activityplan_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activityplan`
--

LOCK TABLES `activityplan` WRITE;
/*!40000 ALTER TABLE `activityplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `activityplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activityplanhistory`
--

DROP TABLE IF EXISTS `activityplanhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activityplanhistory` (
  `ActivityID` int NOT NULL AUTO_INCREMENT,
  `ProjectID` int DEFAULT NULL,
  `Activity` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `ActivityStatus` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`ActivityID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `activityplanhistory_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activityplanhistory`
--

LOCK TABLES `activityplanhistory` WRITE;
/*!40000 ALTER TABLE `activityplanhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `activityplanhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activityplanoriginal`
--

DROP TABLE IF EXISTS `activityplanoriginal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activityplanoriginal` (
  `ActivityID` int NOT NULL AUTO_INCREMENT,
  `ProjectID` int DEFAULT NULL,
  `Activity` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `ActivityStatus` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`ActivityID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `activityplanoriginal_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activityplanoriginal`
--

LOCK TABLES `activityplanoriginal` WRITE;
/*!40000 ALTER TABLE `activityplanoriginal` DISABLE KEYS */;
/*!40000 ALTER TABLE `activityplanoriginal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgetplan`
--

DROP TABLE IF EXISTS `budgetplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budgetplan` (
  `BudgetID` int NOT NULL AUTO_INCREMENT,
  `ProjectID` int DEFAULT NULL,
  `SerialNo` int DEFAULT NULL,
  `Item` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitPrice` float DEFAULT NULL,
  `TotalCost` float DEFAULT NULL,
  PRIMARY KEY (`BudgetID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `budgetplan_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgetplan`
--

LOCK TABLES `budgetplan` WRITE;
/*!40000 ALTER TABLE `budgetplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `budgetplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgetplanhistory`
--

DROP TABLE IF EXISTS `budgetplanhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budgetplanhistory` (
  `BudgetID` int NOT NULL AUTO_INCREMENT,
  `ProjectID` int DEFAULT NULL,
  `SerialNo` int DEFAULT NULL,
  `Item` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitPrice` float DEFAULT NULL,
  `TotalCost` float DEFAULT NULL,
  PRIMARY KEY (`BudgetID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `budgetplanhistory_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgetplanhistory`
--

LOCK TABLES `budgetplanhistory` WRITE;
/*!40000 ALTER TABLE `budgetplanhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `budgetplanhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `budgetplanoriginal`
--

DROP TABLE IF EXISTS `budgetplanoriginal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budgetplanoriginal` (
  `BudgetID` int NOT NULL AUTO_INCREMENT,
  `ProjectID` int DEFAULT NULL,
  `SerialNo` int DEFAULT NULL,
  `Item` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitPrice` float DEFAULT NULL,
  `TotalCost` float DEFAULT NULL,
  PRIMARY KEY (`BudgetID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `budgetplanoriginal_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `budgetplanoriginal`
--

LOCK TABLES `budgetplanoriginal` WRITE;
/*!40000 ALTER TABLE `budgetplanoriginal` DISABLE KEYS */;
/*!40000 ALTER TABLE `budgetplanoriginal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `NoticeID` int NOT NULL AUTO_INCREMENT,
  `DatePublished` text COLLATE utf8mb4_general_ci,
  `Subject` text COLLATE utf8mb4_general_ci,
  `NoticeFileLocation` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`NoticeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `NotificationID` int NOT NULL AUTO_INCREMENT,
  `SenderUserID` int DEFAULT NULL,
  `ReceiverUserID` int DEFAULT NULL,
  `Message` text COLLATE utf8mb4_general_ci,
  `IsRead` int DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`NotificationID`),
  KEY `SenderUserID` (`SenderUserID`),
  KEY `ReceiverUserID` (`ReceiverUserID`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`SenderUserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `notification_ibfk_2` FOREIGN KEY (`ReceiverUserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passreset`
--

DROP TABLE IF EXISTS `passreset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passreset` (
  `Email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ResetToken` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Used` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passreset`
--

LOCK TABLES `passreset` WRITE;
/*!40000 ALTER TABLE `passreset` DISABLE KEYS */;
/*!40000 ALTER TABLE `passreset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectadvancefund`
--

DROP TABLE IF EXISTS `projectadvancefund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectadvancefund` (
  `ProjectAdvanceFundID` int NOT NULL AUTO_INCREMENT,
  `ProjectID` int DEFAULT NULL,
  `TotalBudget` float DEFAULT NULL,
  `PiSignatureDate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ChairmanOfDepartmentSignatureDate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RequestedAmount` float DEFAULT NULL,
  `RequestForAdvanceFundDone` int DEFAULT NULL,
  `AdvanceFundRecievedDone` int DEFAULT NULL,
  `AdvanceFundSendDone` int DEFAULT NULL,
  PRIMARY KEY (`ProjectAdvanceFundID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `projectadvancefund_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectadvancefund`
--

LOCK TABLES `projectadvancefund` WRITE;
/*!40000 ALTER TABLE `projectadvancefund` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectadvancefund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectfund`
--

DROP TABLE IF EXISTS `projectfund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectfund` (
  `ProjectFundID` int NOT NULL AUTO_INCREMENT,
  `ProjectID` int DEFAULT NULL,
  `TotalBudget` float DEFAULT NULL,
  `HonorariumOfPI` float DEFAULT NULL,
  `HonorariumOfCoPI` float DEFAULT NULL,
  `PiSignatureDate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ChairmanOfDepartmentSignatureDate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TotalHonorarium` float DEFAULT NULL,
  `RequestForFundDone` int DEFAULT NULL,
  `FundRecievedDone` int DEFAULT NULL,
  `FundSendDone` int DEFAULT NULL,
  `RequestedAmount` float DEFAULT NULL,
  PRIMARY KEY (`ProjectFundID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `projectfund_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectfund`
--

LOCK TABLES `projectfund` WRITE;
/*!40000 ALTER TABLE `projectfund` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectfund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectlistwithreviewerid`
--

DROP TABLE IF EXISTS `projectlistwithreviewerid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectlistwithreviewerid` (
  `ProjectID` int DEFAULT NULL,
  `ReviewerUserID` int DEFAULT NULL,
  KEY `ProjectID` (`ProjectID`),
  KEY `ReviewerUserID` (`ReviewerUserID`),
  CONSTRAINT `projectlistwithreviewerid_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`),
  CONSTRAINT `projectlistwithreviewerid_ibfk_2` FOREIGN KEY (`ReviewerUserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectlistwithreviewerid`
--

LOCK TABLES `projectlistwithreviewerid` WRITE;
/*!40000 ALTER TABLE `projectlistwithreviewerid` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectlistwithreviewerid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectlistwithuserid`
--

DROP TABLE IF EXISTS `projectlistwithuserid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectlistwithuserid` (
  `UserID` int DEFAULT NULL,
  `ProjectID` int DEFAULT NULL,
  `ProjectTitle` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  KEY `UserID` (`UserID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `projectlistwithuserid_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `projectlistwithuserid_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectlistwithuserid`
--

LOCK TABLES `projectlistwithuserid` WRITE;
/*!40000 ALTER TABLE `projectlistwithuserid` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectlistwithuserid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectmonitoringfeedback`
--

DROP TABLE IF EXISTS `projectmonitoringfeedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectmonitoringfeedback` (
  `ProjectMonitoringFeedbackID` int NOT NULL AUTO_INCREMENT,
  `ProjectMonitoringReportID` int DEFAULT NULL,
  `ProjectID` int DEFAULT NULL,
  `MonitoringCommitteeUserID` int DEFAULT NULL,
  `Observation` text COLLATE utf8mb4_general_ci,
  `Suggestions` text COLLATE utf8mb4_general_ci,
  `Recommendations` text COLLATE utf8mb4_general_ci,
  `Endorsement` text COLLATE utf8mb4_general_ci,
  `MonitoringFeedbackFileLocation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PiCanViewOrNot` int DEFAULT NULL,
  PRIMARY KEY (`ProjectMonitoringFeedbackID`),
  KEY `ProjectID` (`ProjectID`),
  KEY `ProjectMonitoringReportID` (`ProjectMonitoringReportID`),
  KEY `MonitoringCommitteeUserID` (`MonitoringCommitteeUserID`),
  CONSTRAINT `projectmonitoringfeedback_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`),
  CONSTRAINT `projectmonitoringfeedback_ibfk_2` FOREIGN KEY (`ProjectMonitoringReportID`) REFERENCES `projectmonitoringreport` (`ProjectMonitoringReportID`),
  CONSTRAINT `projectmonitoringfeedback_ibfk_3` FOREIGN KEY (`MonitoringCommitteeUserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectmonitoringfeedback`
--

LOCK TABLES `projectmonitoringfeedback` WRITE;
/*!40000 ALTER TABLE `projectmonitoringfeedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectmonitoringfeedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectmonitoringreport`
--

DROP TABLE IF EXISTS `projectmonitoringreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectmonitoringreport` (
  `ProjectMonitoringReportID` int NOT NULL AUTO_INCREMENT,
  `ProjectID` int DEFAULT NULL,
  `ReportDate` text COLLATE utf8mb4_general_ci,
  `ReportFileLocation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ProjectMonitoringReportID`),
  KEY `ProjectID` (`ProjectID`),
  CONSTRAINT `projectmonitoringreport_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectmonitoringreport`
--

LOCK TABLES `projectmonitoringreport` WRITE;
/*!40000 ALTER TABLE `projectmonitoringreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectmonitoringreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectmonitoringreportactivity`
--

DROP TABLE IF EXISTS `projectmonitoringreportactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectmonitoringreportactivity` (
  `ProjectMonitoringReportID` int DEFAULT NULL,
  `ActivityID` int DEFAULT NULL,
  KEY `ProjectMonitoringReportID` (`ProjectMonitoringReportID`),
  KEY `ActivityID` (`ActivityID`),
  CONSTRAINT `projectmonitoringreportactivity_ibfk_1` FOREIGN KEY (`ProjectMonitoringReportID`) REFERENCES `projectmonitoringreport` (`ProjectMonitoringReportID`),
  CONSTRAINT `projectmonitoringreportactivity_ibfk_2` FOREIGN KEY (`ActivityID`) REFERENCES `activityplanhistory` (`ActivityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectmonitoringreportactivity`
--

LOCK TABLES `projectmonitoringreportactivity` WRITE;
/*!40000 ALTER TABLE `projectmonitoringreportactivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectmonitoringreportactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectmonitoringreportbudget`
--

DROP TABLE IF EXISTS `projectmonitoringreportbudget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectmonitoringreportbudget` (
  `ProjectMonitoringReportID` int DEFAULT NULL,
  `BudgetID` int DEFAULT NULL,
  KEY `ProjectMonitoringReportID` (`ProjectMonitoringReportID`),
  KEY `BudgetID` (`BudgetID`),
  CONSTRAINT `projectmonitoringreportbudget_ibfk_1` FOREIGN KEY (`ProjectMonitoringReportID`) REFERENCES `projectmonitoringreport` (`ProjectMonitoringReportID`),
  CONSTRAINT `projectmonitoringreportbudget_ibfk_2` FOREIGN KEY (`BudgetID`) REFERENCES `budgetplanhistory` (`BudgetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectmonitoringreportbudget`
--

LOCK TABLES `projectmonitoringreportbudget` WRITE;
/*!40000 ALTER TABLE `projectmonitoringreportbudget` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectmonitoringreportbudget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectreportlistwithmonitoringcommitteeid`
--

DROP TABLE IF EXISTS `projectreportlistwithmonitoringcommitteeid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectreportlistwithmonitoringcommitteeid` (
  `ProjectMonitoringReportID` int DEFAULT NULL,
  `MonitoringCommitteeUserID` int DEFAULT NULL,
  KEY `ProjectMonitoringReportID` (`ProjectMonitoringReportID`),
  KEY `MonitoringCommitteeUserID` (`MonitoringCommitteeUserID`),
  CONSTRAINT `projectreportlistwithmonitoringcommitteeid_ibfk_1` FOREIGN KEY (`ProjectMonitoringReportID`) REFERENCES `projectmonitoringreport` (`ProjectMonitoringReportID`),
  CONSTRAINT `projectreportlistwithmonitoringcommitteeid_ibfk_2` FOREIGN KEY (`MonitoringCommitteeUserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectreportlistwithmonitoringcommitteeid`
--

LOCK TABLES `projectreportlistwithmonitoringcommitteeid` WRITE;
/*!40000 ALTER TABLE `projectreportlistwithmonitoringcommitteeid` DISABLE KEYS */;
/*!40000 ALTER TABLE `projectreportlistwithmonitoringcommitteeid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `ProjectID` int NOT NULL AUTO_INCREMENT,
  `CodeByRTC` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DateRecieved` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CreatorUserID` int DEFAULT NULL,
  `CoPiUserID` int DEFAULT NULL,
  `StudentUserID` int DEFAULT NULL,
  `ProjectTitle` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NatureOfResearchProposal` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NameOfCollaboratingDepartments` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AddressOfCollaboratingDepartments` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NameOfCollaboratingInstitutes` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `AddressOfCollaboratingInstitutes` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LocationOfFieldActivities` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DurationOfResearchProjectAnnual` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DurationOfResearchProjectLongTerm` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TotalBudgetOfResearchProposalTK` int DEFAULT NULL,
  `ExternalAgencyFundingSource` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ExternalAgencyFundingSourcesName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ExternalAgencyFundingSourcesSubmissionDate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommitmentOtherResearchProject` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CommitmentOtherResearchProjectName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ProjectDescription` text COLLATE utf8mb4_general_ci,
  `ProjectObjective` text COLLATE utf8mb4_general_ci,
  `PstuNationalGoal` text COLLATE utf8mb4_general_ci,
  `PriorResearchOverview` text COLLATE utf8mb4_general_ci,
  `Methodology` text COLLATE utf8mb4_general_ci,
  `MethodologyFileLocation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ExpectedOutput` text COLLATE utf8mb4_general_ci,
  `SuccessIndicators` text COLLATE utf8mb4_general_ci,
  `Beneficiaries` text COLLATE utf8mb4_general_ci,
  `ManPowerExisting` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ManPowerRequired` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SmallEquipmentExisting` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SmallEquipmentRequired` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ResearchMaterialsExisting` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ResearchMaterialsRequired` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OtherExisting` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `OtherRequired` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ResearchCarriedOutPlace` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CreatorUserSealLocation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CreatorUserSignatureLocation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CreatorUserSignatureDate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ChairmanOfDepartmentComment` text COLLATE utf8mb4_general_ci,
  `ChairmanOfDepartmentSealLocation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ChairmanOfDepartmentSignatureLocation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ChairmanOfDepartmentSignatureDate` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ResultsAndDiscussion` text COLLATE utf8mb4_general_ci,
  `KeyAchievements` text COLLATE utf8mb4_general_ci,
  `ProjectStatus` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TotalPoints` float DEFAULT NULL,
  `ProjectSoftCopyLocation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ProjectID`),
  KEY `CreatorUserID` (`CreatorUserID`),
  KEY `CoPiUserID` (`CoPiUserID`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`CreatorUserID`) REFERENCES `users` (`UserID`),
  CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`CoPiUserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `ProjectID` int DEFAULT NULL,
  `ReviewerUserID` int DEFAULT NULL,
  `Comments` text COLLATE utf8mb4_general_ci,
  `Rating` int DEFAULT NULL,
  `Points` float DEFAULT NULL,
  `PiCanViewOrNot` int NOT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `ProjectID` (`ProjectID`),
  KEY `ReviewerUserID` (`ReviewerUserID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ProjectID`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`ReviewerUserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `RoleID` int NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Researcher'),(3,'Reviewer'),(4,'Teacher'),(5,'Student');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tempusers`
--

DROP TABLE IF EXISTS `tempusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tempusers` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `RoleID` int DEFAULT NULL,
  `Username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FirstName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Phone` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FacultyName` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`UserID`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `tempusers_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tempusers`
--

LOCK TABLES `tempusers` WRITE;
/*!40000 ALTER TABLE `tempusers` DISABLE KEYS */;
INSERT INTO `tempusers` VALUES (1,4,'testagain','pbkdf2:sha256:600000$8Flc2XgU6MTKKJYa$5d5d53ab2c28ecd9569c147ef9a56e2263fe7d4a4041e08acbb1f60ddca5d5ec','testagain','testagain','tuimorsala01@gmail.com','01785245258','Faculty of Computer Science and Engineering'),(3,4,'test_sobuj_sir','pbkdf2:sha256:600000$yCat3hwShHovddrs$446b016ce4cb2b2350c25eb94d81f35fc3b3dca5cb33a3876b2f340e90ac3575','test_sobuj_sir','test_sobuj_sir','test_sobuj_sir@gmail.com','017111111111','Faculty of Computer Science and Engineering');
/*!40000 ALTER TABLE `tempusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `RoleID` int DEFAULT NULL,
  `Username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `PositionEnglish` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PositionBangla` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PositionHeldSince` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FirstName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FullNameBangla` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PresentAddress` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PermanentAddress` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Gender` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Nid` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NidLocation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FacultyName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DepartmentName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `InstituteName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `InstituteLocation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `InstituteEmail` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Phone` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Dateofbirth` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SalaryScale` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BasicPay` float NOT NULL DEFAULT '0',
  `HighestAcademicQualification` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HighestAcademicQualificationUniversity` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HighestAcademicQualificationCountry` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HighestAcademicQualificationYear` int DEFAULT NULL,
  `AreaOfExpertise` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ReferencesOfLatestPublications` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ExperienceInResearch` int DEFAULT NULL,
  `Teaching` int DEFAULT NULL,
  `ProfilePicLocation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SignatureLocation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SealLocation` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TotalNumberOfCompleteProjects` int DEFAULT NULL,
  `TotalNumberOfCompletePublications` int DEFAULT NULL,
  `OngoingProjects` int DEFAULT NULL,
  `StudentID` int DEFAULT NULL,
  `StudentRegNo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FirstEnrollmentSemester` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `UndergraduateCGPALevel` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `RoleID` (`RoleID`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`RoleID`) REFERENCES `role` (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'rakib','pbkdf2:sha256:600000$pBp6ozzOF62V7o4z$f715e4a4334b95bf32e8d6c7ee447933255bd0e9c5879c73f7b0c43ab894a7c4','admin','','2024','rakib29185@gmail.com','admin',NULL,NULL,NULL,NULL,'Male',NULL,'18.png','','','Patuakhali Science & Technology University (PSTU)',NULL,NULL,'01700000000','2000-09-17 00:00:00.000',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'defaultprofilepic.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,4,'zzz','pbkdf2:sha256:600000$1eKFdSXC6xQNvO39$431f2f77c3bc74f8f3257e0c783d653401c65bb647a819291b8d8f6f0685569f',NULL,NULL,NULL,'tuimorsala01@gmail.com','dsfdfg','zzz',NULL,NULL,NULL,NULL,NULL,'defaultnid.png','Faculty of Fisheries',NULL,NULL,NULL,NULL,'021654654656',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'defaultprofilepic.png','defaultsignature.png','defaultseal.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-28 18:26:46
