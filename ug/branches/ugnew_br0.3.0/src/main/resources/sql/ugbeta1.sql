-- MySQL dump 10.13  Distrib 5.5.10, for Win32 (x86)
--
-- Host: localhost    Database: ugbeta1
-- ------------------------------------------------------
-- Server version	5.5.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `addressTypeId` bigint(20) NOT NULL,
  `display_identifier` varchar(25) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `address1` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(20) DEFAULT NULL,
  `stateId` bigint(20) NOT NULL,
  `zip` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `stateId` (`stateId`),
  KEY `addressTypeId` (`addressTypeId`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `address_ibfk_2` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`),
  CONSTRAINT `address_ibfk_3` FOREIGN KEY (`addressTypeId`) REFERENCES `addresstype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `addresstype`
--

DROP TABLE IF EXISTS `addresstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresstype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `addressTypeName` varchar(255) NOT NULL,
  `addressTypeDescription` varchar(200) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corporate`
--

DROP TABLE IF EXISTS `corporate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `address1` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `corporate_linked_in_profile` varchar(75) DEFAULT NULL,
  `corporate_name` varchar(20) NOT NULL,
  `corporate_primary_contact` varchar(50) NOT NULL,
  `corporate_website` varchar(30) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `industry` varchar(15) DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `stateId` bigint(20) NOT NULL,
  `work_phone` varchar(255) NOT NULL,
  `zip` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `stateId` (`stateId`),
  CONSTRAINT `corporate_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `corporate_ibfk_2` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `corporate_loan_amount`
--

DROP TABLE IF EXISTS `corporate_loan_amount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporate_loan_amount` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `corporateId` bigint(20) NOT NULL,
  `available_loan_amount` decimal(10,2) NOT NULL,
  `committed_loan_amount` decimal(10,2) NOT NULL,
  `loaned_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `corporateId` (`corporateId`),
  CONSTRAINT `corporate_loan_amount_ibfk_1` FOREIGN KEY (`corporateId`) REFERENCES `corporate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(255) NOT NULL,
  `countryDescription` varchar(200) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `departmentName` varchar(255) NOT NULL,
  `departmentDescription` varchar(200) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `genderName` varchar(6) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `grantneededfor`
--

DROP TABLE IF EXISTS `grantneededfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grantneededfor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grantNeed` varchar(255) NOT NULL,
  `grantNeedDescription` varchar(200) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guarantor`
--

DROP TABLE IF EXISTS `guarantor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guarantor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `universityId` bigint(20) NOT NULL,
  `address1` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `stateId` bigint(20) NOT NULL,
  `country` varchar(20) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `genderId` bigint(20) NOT NULL,
  `home_page` varchar(30) DEFAULT NULL,
  `home_phone` varchar(255) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `linked_in_profile` varchar(75) DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `middle_name` varchar(30) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `work_phone` varchar(255) DEFAULT NULL,
  `zip` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `universityId` (`universityId`),
  KEY `stateId` (`stateId`),
  KEY `genderId` (`genderId`),
  CONSTRAINT `guarantor_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `guarantor_ibfk_2` FOREIGN KEY (`universityId`) REFERENCES `university` (`id`),
  CONSTRAINT `guarantor_ibfk_3` FOREIGN KEY (`stateId`) REFERENCES `state` (`id`),
  CONSTRAINT `guarantor_ibfk_4` FOREIGN KEY (`genderId`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `loan_name` varchar(20) DEFAULT NULL,
  `loan_amount` decimal(10,2) NOT NULL,
  `grantNeededFor` bigint(20) NOT NULL,
  `loan_needed_by` datetime NOT NULL,
  `comments` varchar(2000) DEFAULT NULL,
  `supportDocumentName` varchar(75) DEFAULT NULL,
  `loanStatusId` bigint(20) NOT NULL,
  `address` bigint(20) NOT NULL,
  `lastupdatedby` bigint(20) DEFAULT NULL,
  `lastupdatedtimestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `grantNeededFor` (`grantNeededFor`),
  KEY `address` (`address`),
  KEY `loanStatusId` (`loanStatusId`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`grantNeededFor`) REFERENCES `grantneededfor` (`id`),
  CONSTRAINT `loan_ibfk_3` FOREIGN KEY (`address`) REFERENCES `address` (`id`),
  CONSTRAINT `loan_ibfk_4` FOREIGN KEY (`loanStatusId`) REFERENCES `loanstatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `loanstatus`
--

DROP TABLE IF EXISTS `loanstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loanstatus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loanStatusName` varchar(255) NOT NULL,
  `loanStatusDescription` varchar(200) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) NOT NULL,
  `universityId` bigint(20) NOT NULL,
  `departmentId` bigint(20) NOT NULL,
  `programStudyId` bigint(20) NOT NULL,
  `expected_graduation_date` datetime DEFAULT NULL,
  `citizenship` bigint(20) NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `genderId` bigint(20) NOT NULL,
  `home_phone` varchar(10) NOT NULL,
  `linked_in_profile` varchar(255) DEFAULT NULL,
  `youtubeurl` varchar(255) DEFAULT NULL,
  `mobile` varchar(10) NOT NULL,
  `photoIdentifier` varchar(75) DEFAULT NULL,
  `resumeIdentifier` varchar(75) DEFAULT NULL,
  `universityEmail` varchar(255) DEFAULT NULL,
  `briefDescription` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `universityId` (`universityId`),
  KEY `departmentId` (`departmentId`),
  KEY `programStudyId` (`programStudyId`),
  KEY `genderId` (`genderId`),
  KEY `profile_ibfk_6` (`citizenship`),
  CONSTRAINT `profile_ibfk_6` FOREIGN KEY (`citizenship`) REFERENCES `country` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `profile_ibfk_2` FOREIGN KEY (`universityId`) REFERENCES `university` (`id`),
  CONSTRAINT `profile_ibfk_3` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `profile_ibfk_4` FOREIGN KEY (`programStudyId`) REFERENCES `programstudy` (`id`),
  CONSTRAINT `profile_ibfk_5` FOREIGN KEY (`genderId`) REFERENCES `gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `programstudy`
--

DROP TABLE IF EXISTS `programstudy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programstudy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `programStudyName` varchar(255) NOT NULL,
  `programStudyDescription` varchar(200) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleDescription` varchar(200) NOT NULL,
  `roleName` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roleName` (`roleName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stateName` varchar(255) NOT NULL,
  `stateDescription` varchar(200) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `university`
--

DROP TABLE IF EXISTS `university`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `university` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `university_name` varchar(90) NOT NULL,
  `university_website` varchar(30) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `stateId` bigint(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `domain` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3771 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activationDate` datetime DEFAULT NULL,
  `activationKey` varchar(255) DEFAULT NULL,
  `emailAddress` varchar(255) NOT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `locked` bit(1) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emailAddress` (`emailAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `roleEntry` bigint(20) NOT NULL,
  `userEntry` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK143BF46A379CF084` (`userEntry`),
  KEY `FK143BF46A3124AD9A` (`roleEntry`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-06-26 12:51:57




--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin Role','admin',1),(2,'Student Role','student',2),(3,'Corporate Role','corporate',3);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

