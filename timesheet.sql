CREATE DATABASE  IF NOT EXISTS `newtimesheet` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `newtimesheet`;
-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (i686)
--
-- Host: 127.0.0.1    Database: newtimesheet
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.13.04.1

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
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'Administration',1,1,'2015-04-25 05:06:54','2015-04-25 05:29:51'),(2,'Set Up-',1,1,'2015-04-25 05:07:12','2015-04-25 05:30:11'),(4,'Legal-',1,NULL,'2015-04-25 05:30:30','0000-00-00 00:00:00'),(5,'Compliance',1,NULL,'2015-04-25 05:30:42','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `team_name` text,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Client 1','Airtel',1,11,'2015-04-25 05:24:35','2015-09-29 06:39:45','Team 1'),(2,'The Cricket Ground Trustees Co Ltd','Airtel',1,NULL,'2015-04-25 05:25:27',NULL,'Team,Team 1'),(3,'Mangrovia Developments Ltd','Clavis',1,NULL,'2015-04-25 05:25:41',NULL,'Team 1,Team 2'),(4,'Owners United Ltd','HCL',1,NULL,'2015-04-25 05:26:11',NULL,'Team 3'),(5,'Sphere Media','Vodafone',1,NULL,'2015-04-25 05:26:25',NULL,'Team 3'),(6,'ABC co. LTD','Clavis',11,11,'2015-05-07 01:35:00','2015-09-29 06:39:34','Team 1'),(7,'ss','Airtel',11,NULL,'2015-09-29 12:31:52',NULL,''),(8,'Noida Client','Airtel',11,NULL,'2015-09-29 12:37:45',NULL,'Team 1,Team 2,Team 3');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_account_info`
--

DROP TABLE IF EXISTS `client_account_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_account_info` (
  `client_account_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `financial_year_end` date NOT NULL,
  `accounting_done_by` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date_last_accounts_filed` date DEFAULT NULL,
  `auditors` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date_last_annual_returns` date DEFAULT NULL,
  `date_last_tax_returns` date DEFAULT NULL,
  `add_date_last_financial_summaries_filed` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`client_account_info_id`),
  KEY `fk_client_account_info_1_idx` (`client_id`),
  CONSTRAINT `fk_client_account_info_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_account_info`
--

LOCK TABLES `client_account_info` WRITE;
/*!40000 ALTER TABLE `client_account_info` DISABLE KEYS */;
INSERT INTO `client_account_info` VALUES (1,6,'2015-06-24','shiju','2015-06-25','sharma','2015-06-26','2015-06-26','2015-06-26',11,NULL,'2015-06-24 06:21:09',NULL);
/*!40000 ALTER TABLE `client_account_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_agm_info`
--

DROP TABLE IF EXISTS `client_agm_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_agm_info` (
  `client_agm_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `agm_date` date DEFAULT NULL,
  `financial_statements` enum('Yes','No') DEFAULT NULL,
  `constitution_adopted` enum('Yes','No') DEFAULT NULL,
  `amendment` enum('Yes','No') DEFAULT NULL,
  `relevant_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`client_agm_info_id`),
  KEY `fk_client_agm_info_1_idx` (`client_id`),
  CONSTRAINT `fk_client_agm_info_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_agm_info`
--

LOCK TABLES `client_agm_info` WRITE;
/*!40000 ALTER TABLE `client_agm_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_agm_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_bank_info`
--

DROP TABLE IF EXISTS `client_bank_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_bank_info` (
  `client_bank_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `bank_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `account_type` varchar(255) CHARACTER SET latin1 NOT NULL,
  `internet_banking` enum('Yes','No') CHARACTER SET latin1 NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `date_account_opened` date DEFAULT NULL,
  `bank_signatories` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `additional_info` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`client_bank_info_id`),
  KEY `fk_client_bank_info_1_idx` (`client_id`),
  CONSTRAINT `fk_client_bank_info_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_bank_info`
--

LOCK TABLES `client_bank_info` WRITE;
/*!40000 ALTER TABLE `client_bank_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_bank_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_beneficial_owner_info`
--

DROP TABLE IF EXISTS `client_beneficial_owner_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_beneficial_owner_info` (
  `client_beneficial_owner_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `contact_details` varchar(255) CHARACTER SET latin1 NOT NULL,
  `country_id` int(11) NOT NULL,
  `name_of_authorised_person` varchar(255) CHARACTER SET latin1 NOT NULL,
  `email_of_the_authorised_person` varchar(255) CHARACTER SET latin1 NOT NULL,
  `phone_number_of_the_authorised_person` varchar(50) CHARACTER SET latin1 NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`client_beneficial_owner_info_id`),
  KEY `fk_client_beneficial_owner_info_1_idx` (`client_id`),
  CONSTRAINT `fk_client_beneficial_owner_info_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_beneficial_owner_info`
--

LOCK TABLES `client_beneficial_owner_info` WRITE;
/*!40000 ALTER TABLE `client_beneficial_owner_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_beneficial_owner_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_compliance_info`
--

DROP TABLE IF EXISTS `client_compliance_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_compliance_info` (
  `client_compliance_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `checklist_number` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date_last_review` date NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`client_compliance_info_id`),
  KEY `fk_client_compliance_info_1_idx` (`client_id`),
  CONSTRAINT `fk_client_compliance_info_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_compliance_info`
--

LOCK TABLES `client_compliance_info` WRITE;
/*!40000 ALTER TABLE `client_compliance_info` DISABLE KEYS */;
INSERT INTO `client_compliance_info` VALUES (1,6,'982472974239847','2015-06-24',11,NULL,'2015-06-24 05:53:49',NULL);
/*!40000 ALTER TABLE `client_compliance_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_director_info`
--

DROP TABLE IF EXISTS `client_director_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_director_info` (
  `client_director_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `director_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `date_appointed` date NOT NULL,
  `date_resigned` date NOT NULL,
  `passport_expiry_date` date NOT NULL,
  `other_kyc_docs` varchar(255) CHARACTER SET latin1 NOT NULL,
  `directorship_yes_no` enum('yes','no') CHARACTER SET latin1 NOT NULL,
  `age_of_the_director` varchar(50) CHARACTER SET latin1 NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`client_director_info_id`),
  KEY `fk_client_director_info_1_idx` (`client_id`),
  CONSTRAINT `fk_client_director_info_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_director_info`
--

LOCK TABLES `client_director_info` WRITE;
/*!40000 ALTER TABLE `client_director_info` DISABLE KEYS */;
INSERT INTO `client_director_info` VALUES (2,3,'Rahul Sharma','2015-05-06','2015-05-06','2015-05-13','','no','41',11,11,'2015-05-06 03:21:22','2015-05-06 03:34:51'),(3,3,'Ankit sharma','2015-05-04','0000-00-00','2015-06-05','','yes','',11,11,'2015-05-06 03:39:51','2015-05-06 03:40:09'),(4,3,'xyz','2015-05-04','0000-00-00','2015-05-08','','no','',11,NULL,'2015-05-06 03:42:40',NULL),(5,3,'aaa','2015-05-04','0000-00-00','2015-06-09','','no','',11,NULL,'2015-05-06 03:44:17',NULL),(6,5,'raghu','2015-05-07','2015-05-06','2015-05-13','','no','',11,NULL,'2015-05-06 03:47:05',NULL);
/*!40000 ALTER TABLE `client_director_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_info`
--

DROP TABLE IF EXISTS `client_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_info` (
  `client_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `company_reference` varchar(255) NOT NULL,
  `introduced_by_period` varchar(255) NOT NULL,
  `place_of_work_of_the_introducer` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `email_of_the_introducer` varchar(255) NOT NULL,
  `phone_number_of_the_introducer` varchar(255) NOT NULL,
  `name_of_company` varchar(255) NOT NULL,
  `trc` enum('Yes','No') NOT NULL,
  `renewal_date` date NOT NULL,
  `status` enum('Active','Inactive') NOT NULL,
  `group` varchar(255) NOT NULL,
  `client_type_id` int(11) NOT NULL,
  `foreign_country_name` int(11) NOT NULL,
  `date_of_inc` date NOT NULL,
  `file_no` varchar(255) NOT NULL,
  `activity_of_company` varchar(255) NOT NULL,
  `activities_in_line_with_business_plan` varchar(255) NOT NULL,
  `gbl_license_no` varchar(255) CHARACTER SET big5 NOT NULL,
  `conversion_or_transfer_registration` varchar(255) NOT NULL,
  `transfer_from_another_mc` varchar(255) NOT NULL,
  `business_registration_no` varchar(255) NOT NULL,
  `freeport_licence` varchar(255) NOT NULL,
  `vat_no` varchar(255) NOT NULL,
  `tan_no` varchar(255) NOT NULL,
  `registered_office` varchar(255) NOT NULL,
  `strike_off` varchar(255) NOT NULL,
  `business_address` varchar(255) NOT NULL,
  `previous_name` varchar(255) NOT NULL,
  `file_location` varchar(255) NOT NULL,
  `date_change_of_name` date NOT NULL,
  `portfolio` varchar(255) NOT NULL,
  `archives_ref_no` varchar(255) NOT NULL,
  `registration_fees` enum('Yes','No') NOT NULL,
  `fsc_fees` enum('Yes','No') NOT NULL,
  `transfer_from_another_mc_description` varchar(255) DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `registration_fees_description` varchar(255) DEFAULT NULL,
  `fsc_fees_description` varchar(255) DEFAULT NULL,
  `business_activity` varchar(255) DEFAULT NULL,
  `activities_in_line_with_business_plan_description` varchar(255) DEFAULT NULL,
  `removal_from_register` varchar(255) DEFAULT NULL,
  `gbl_license_issue_date` date DEFAULT NULL,
  `conversion_or_transfer_registration_description` date DEFAULT NULL,
  `management_company_name` varchar(255) DEFAULT NULL,
  `converted_from_to` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `foreign_country` int(11) DEFAULT NULL,
  PRIMARY KEY (`client_info_id`),
  KEY `FK_client_info` (`client_id`),
  CONSTRAINT `fk_client_info_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_info`
--

LOCK TABLES `client_info` WRITE;
/*!40000 ALTER TABLE `client_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_licence_info`
--

DROP TABLE IF EXISTS `client_licence_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_licence_info` (
  `client_licence_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `licence_type_id` int(11) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `licensing_conditions` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  PRIMARY KEY (`client_licence_info_id`),
  KEY `fk_client_licence_info_1_idx` (`client_id`),
  CONSTRAINT `fk_client_licence_info_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_licence_info`
--

LOCK TABLES `client_licence_info` WRITE;
/*!40000 ALTER TABLE `client_licence_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_licence_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_occupation_info`
--

DROP TABLE IF EXISTS `client_occupation_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_occupation_info` (
  `client_occupation_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `investor_permit` enum('Yes','No') NOT NULL,
  `professional_permit` enum('Yes','No') NOT NULL,
  `self_employed_permit` enum('Yes','No') NOT NULL,
  `retired_permit` enum('Yes','No') NOT NULL,
  `permanent_residence_permit` enum('Yes','No') NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `investor_permit_date` date DEFAULT NULL,
  `professional_permit_date` date DEFAULT NULL,
  `self_employed_permit_date` date DEFAULT NULL,
  `retired_permit_date` date DEFAULT NULL,
  `permanent_residence_permit_date` date DEFAULT NULL,
  PRIMARY KEY (`client_occupation_info_id`),
  KEY `fk_client_occupation_info_1_idx` (`client_id`),
  CONSTRAINT `fk_client_occupation_info_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_occupation_info`
--

LOCK TABLES `client_occupation_info` WRITE;
/*!40000 ALTER TABLE `client_occupation_info` DISABLE KEYS */;
INSERT INTO `client_occupation_info` VALUES (2,3,'Yes','Yes','Yes','Yes','Yes',11,11,'2015-05-06 03:23:28','2015-05-06 03:54:35','2015-06-05','2015-06-05','2015-06-05','2015-06-05','2015-06-05'),(3,3,'Yes','Yes','Yes','Yes','Yes',11,11,'2015-05-06 03:24:09','2015-05-06 03:55:13','2015-05-13','2015-05-13','2015-05-13','2015-06-17','2015-06-05'),(4,3,'No','No','Yes','No','No',11,11,'2015-05-06 03:24:24','2015-05-06 03:53:31','0000-00-00','0000-00-00','2015-06-05','0000-00-00','0000-00-00'),(5,5,'Yes','Yes','Yes','Yes','Yes',11,NULL,'2015-05-06 03:56:17',NULL,'2015-05-13','2015-06-05','2015-05-12','2015-05-21','2015-05-08');
/*!40000 ALTER TABLE `client_occupation_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_shareholder_info`
--

DROP TABLE IF EXISTS `client_shareholder_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_shareholder_info` (
  `client_shareholder_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `shareholder_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `no_of_shares` varchar(255) CHARACTER SET latin1 NOT NULL,
  `type_of_shares` varchar(255) CHARACTER SET latin1 NOT NULL,
  `value_of_shares` varchar(255) CHARACTER SET latin1 NOT NULL,
  `passport_expiry_date` date NOT NULL,
  `other_kyc_docs` varchar(255) CHARACTER SET latin1 NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `transfer_of_shares` enum('Yes','No') CHARACTER SET latin1 DEFAULT NULL,
  `stated_capital` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `new_share_holder` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`client_shareholder_info_id`),
  KEY `fk_client_shareholder_info_1_idx` (`client_id`),
  CONSTRAINT `fk_client_shareholder_info_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_shareholder_info`
--

LOCK TABLES `client_shareholder_info` WRITE;
/*!40000 ALTER TABLE `client_shareholder_info` DISABLE KEYS */;
INSERT INTO `client_shareholder_info` VALUES (2,3,'Ajay Gupta','10','','','2015-05-13','',11,11,'2015-05-06 03:22:38','2015-05-06 03:40:31','Yes','','Deepanshu Chauhan'),(3,3,'Mohit gupta','50','','','2015-06-05','',11,NULL,'2015-05-06 03:41:09',NULL,'No','',''),(4,3,'xyz','22','','','2015-05-08','',11,NULL,'2015-05-06 03:41:36',NULL,'No','',''),(5,5,'abc week','20','','','2015-05-13','',11,11,'2015-05-06 03:50:39','2015-05-06 03:50:50','No','',''),(6,5,'abc mon','20','','','2015-06-05','',11,NULL,'2015-05-06 03:51:14',NULL,'No','',''),(7,5,'xyz','21','','','2015-05-20','',11,NULL,'2015-05-06 03:51:40',NULL,'No','','');
/*!40000 ALTER TABLE `client_shareholder_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_substance_info`
--

DROP TABLE IF EXISTS `client_substance_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_substance_info` (
  `client_substance_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `arbitration_clause` enum('Yes','No') CHARACTER SET latin1 NOT NULL,
  `office_in_mauritius` enum('Yes','No') CHARACTER SET latin1 NOT NULL,
  `other_substance_conditions` varchar(255) CHARACTER SET latin1 NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `office_address` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `mauritius_employ` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`client_substance_info_id`),
  KEY `fk_client_substance_info_1_idx` (`client_id`),
  CONSTRAINT `fk_client_substance_info_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_substance_info`
--

LOCK TABLES `client_substance_info` WRITE;
/*!40000 ALTER TABLE `client_substance_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_substance_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_trust_info`
--

DROP TABLE IF EXISTS `client_trust_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_trust_info` (
  `client_trust_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `trust_type_id` int(11) DEFAULT NULL,
  `trust_type_other` varchar(255) DEFAULT NULL,
  `global_business_licence` enum('Yes','No','NA') DEFAULT NULL,
  `trust_deed_available` enum('Yes','No') DEFAULT NULL,
  `trustee_name` varchar(255) DEFAULT NULL,
  `non_resident_trustee_passport_expiry_date` date DEFAULT NULL,
  `non_resident_trustee_utility_bill_available_and_dated` date DEFAULT NULL,
  `settlor_name` varchar(255) DEFAULT NULL,
  `settlor_passport_expiry_date` date DEFAULT NULL,
  `settlor_utility_bill_available_and_dated` date DEFAULT NULL,
  `beneficiaries_name` varchar(255) DEFAULT NULL,
  `letter_of_wishes` enum('Yes','No') DEFAULT NULL,
  `declaration_of_non_residence_available` enum('Yes','No') DEFAULT NULL,
  `accounts_prepared` enum('Yes','No') DEFAULT NULL,
  `tax_returns` enum('Yes','No') DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`client_trust_info_id`),
  KEY `fk_client_trust_info_1_idx` (`client_id`),
  CONSTRAINT `fk_client_trust_info_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_trust_info`
--

LOCK TABLES `client_trust_info` WRITE;
/*!40000 ALTER TABLE `client_trust_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_trust_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_type`
--

DROP TABLE IF EXISTS `client_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_type` (
  `client_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_type_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`client_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_type`
--

LOCK TABLES `client_type` WRITE;
/*!40000 ALTER TABLE `client_type` DISABLE KEYS */;
INSERT INTO `client_type` VALUES (1,'Domestic'),(2,'GBC 1'),(3,'Trust'),(4,'Foreign');
/*!40000 ALTER TABLE `client_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `company_logo` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  KEY `fk_comapny_1_idx` (`created_by`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Clavis',1,1,'2015-04-25 05:04:27','2015-04-25 05:05:13','logo_12.png'),(2,'HCL',1,NULL,'2015-04-25 05:05:31',NULL,'logo_21.png'),(3,'Vodafone',1,NULL,'2015-04-25 05:06:13',NULL,'logo_3.jpg'),(4,'Airtel',1,NULL,'2015-04-25 05:06:31',NULL,'logo_4.jpg');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Afghanistan'),(2,'Albania'),(3,'Algeria'),(4,'Andorra'),(5,'Angola'),(6,'Antigua and Barbuda'),(7,'Argentina'),(8,'Armenia'),(9,'Aruba'),(10,'Australia'),(11,'Austria'),(12,'Azerbaijan'),(13,'Bahamas, The'),(14,'Bahrain'),(15,'Bangladesh'),(16,'Barbados'),(17,'Belarus'),(18,'Belgium'),(19,'Belize'),(20,'Benin'),(21,'Bermuda'),(22,'Bhutan'),(23,'Bolivia'),(24,'Bosnia and Herzegovina'),(25,'Botswana'),(26,'Brazil'),(27,'Brunei'),(28,'Bulgaria'),(29,'Burkina Faso'),(30,'Burma'),(31,'Burundi'),(32,'Cabo Verde'),(33,'Cambodia'),(34,'Cameroon'),(35,'Canada'),(36,'Cayman Islands'),(37,'Central African Republic'),(38,'Chad'),(39,'Chile'),(40,'China'),(41,'Colombia'),(42,'Comoros'),(43,'Congo, Democratic Republic of the'),(44,'Congo, Republic of the'),(45,'Costa Rica'),(46,'Cote dIvoire'),(47,'Croatia'),(48,'Cuba'),(49,'Curacao'),(50,'Cyprus'),(51,'Czech Republic'),(52,'Denmark'),(53,'Djibouti'),(54,'Dominica'),(55,'Dominican Republic'),(56,'Ecuador'),(57,'Egypt'),(58,'El Salvador'),(59,'Equatorial Guinea'),(60,'Eritrea'),(61,'Estonia'),(62,'Ethiopia'),(63,'Fiji'),(64,'Finland'),(65,'France'),(66,'Gabon'),(67,'Gambia, The'),(68,'Georgia'),(69,'Germany'),(70,'Ghana'),(71,'Greece'),(72,'Grenada'),(73,'Guatemala'),(74,'Guinea'),(75,'Guinea-Bissau'),(76,'Guyana'),(77,'Haiti'),(78,'Holy See'),(79,'Honduras'),(80,'Hong Kong'),(81,'Hungary'),(82,'Iceland'),(83,'India'),(84,'Indonesia'),(85,'Iran'),(86,'Iraq'),(87,'Ireland'),(88,'Israel'),(89,'Italy'),(90,'Jamaica'),(91,'Japan'),(92,'Jordan'),(93,'Kazakhstan'),(94,'Kenya'),(95,'Kiribati'),(96,'Kosovo'),(97,'Kuwait'),(98,'Kyrgyzstan'),(99,'Laos'),(100,'Latvia'),(101,'Lebanon'),(102,'Lesotho'),(103,'Liberia'),(104,'Libya'),(105,'Liechtenstein'),(106,'Lithuania'),(107,'Luxembourg'),(108,'Macau'),(109,'Macedonia'),(110,'Madagascar'),(111,'Malawi'),(112,'Malaysia'),(113,'Maldives'),(114,'Mali'),(115,'Malta'),(116,'Marshall Islands'),(117,'Mauritania'),(118,'Mauritius'),(119,'Mexico'),(120,'Micronesia'),(121,'Moldova'),(122,'Monaco'),(123,'Mongolia'),(124,'Montenegro'),(125,'Morocco'),(126,'Mozambique'),(127,'Namibia'),(128,'Nauru'),(129,'Nepal'),(130,'Netherlands'),(131,'Netherlands Antilles'),(132,'New Zealand'),(133,'Nicaragua'),(134,'Niger'),(135,'Nigeria'),(136,'North Korea'),(137,'Norway'),(138,'Oman'),(139,'Pakistan'),(140,'Palau'),(141,'Palestinian Territories'),(142,'Panama'),(143,'Papua New Guinea'),(144,'Paraguay'),(145,'Peru'),(146,'Philippines'),(147,'Poland'),(148,'Portugal'),(149,'Qatar'),(150,'Romania'),(151,'Russia'),(152,'Rwanda'),(153,'Saint Kitts and Nevis'),(154,'Saint Lucia'),(155,'Saint Vincent and the Grenadines'),(156,'Samoa'),(157,'San Marino'),(158,'Sao Tome and Principe'),(159,'Saudi Arabia'),(160,'Senegal'),(161,'Serbia'),(162,'Seychelles'),(163,'Sierra Leone'),(164,'Singapore'),(165,'Sint Maarten'),(166,'Slovakia'),(167,'Slovenia'),(168,'Solomon Islands'),(169,'Somalia'),(170,'South Africa'),(171,'South Korea'),(172,'South Sudan'),(173,'Spain'),(174,'Sri Lanka'),(175,'Sudan'),(176,'Suriname'),(177,'Swaziland'),(178,'Sweden'),(179,'Switzerland'),(180,'Syria'),(181,'Taiwan'),(182,'Tajikistan'),(183,'Tanzania'),(184,'Thailand'),(185,'Timor-Leste'),(186,'Togo'),(187,'Tonga'),(188,'Trinidad and Tobago'),(189,'Tunisia'),(190,'Turkey'),(191,'Turkmenistan'),(192,'Tuvalu'),(193,'Uganda'),(194,'Ukraine'),(195,'United Arab Emirates'),(196,'United Kingdom'),(197,'Uruguay'),(198,'Uzbekistan'),(199,'Vanuatu'),(200,'Venezuela'),(201,'Vietnam'),(202,'Yemen'),(203,'Zambia'),(204,'Zimbabwe');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_code` varchar(45) DEFAULT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'EUR','EURO'),(2,'GBP','British Pound'),(3,'AUD','Australian dollar'),(4,'INR','Indian Rupee'),(5,'USD','United States Dollar'),(6,'CAD','Canadian Dollar'),(7,'CNY','Chinese Yuan'),(8,'NZD','New Zealand Dollar'),(9,'CHF','Swiss franc'),(10,'JPY','Japanese yen'),(11,'SGD','Singapore Dollar'),(12,'HKD','Hongkong Dollar');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date`
--

DROP TABLE IF EXISTS `date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date` (
  `auto_id` int(11) NOT NULL,
  `date` int(11) DEFAULT NULL,
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
/*!40000 ALTER TABLE `date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_agreement_contracts`
--

DROP TABLE IF EXISTS `db_agreement_contracts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_agreement_contracts` (
  `agreement_co_id` int(11) NOT NULL AUTO_INCREMENT,
  `agreement_type` varchar(255) NOT NULL,
  `termination_date` datetime NOT NULL,
  `signed_date` datetime NOT NULL,
  `remarks` mediumtext NOT NULL,
  `is_active` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`agreement_co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_agreement_contracts`
--

LOCK TABLES `db_agreement_contracts` WRITE;
/*!40000 ALTER TABLE `db_agreement_contracts` DISABLE KEYS */;
INSERT INTO `db_agreement_contracts` VALUES (2,'ss','2015-09-28 00:00:00','2015-09-28 00:00:00','ss',1,6,11,'2015-09-28 16:39:12',11,'2015-09-28 16:39:12'),(3,'ss','2015-09-28 00:00:00','2015-09-28 00:00:00','ss',1,6,0,'0000-00-00 00:00:00',11,'2015-09-28 16:39:19'),(4,'sss','2015-09-28 00:00:00','2015-09-28 00:00:00','',1,6,0,'0000-00-00 00:00:00',11,'2015-09-28 16:39:24'),(5,'sss','2015-09-28 00:00:00','2015-09-28 00:00:00','',1,6,0,'0000-00-00 00:00:00',11,'2015-09-28 16:39:33');
/*!40000 ALTER TABLE `db_agreement_contracts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_ba_accountno`
--

DROP TABLE IF EXISTS `db_ba_accountno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_ba_accountno` (
  `accountno_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_no` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`accountno_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_ba_accountno`
--

LOCK TABLES `db_ba_accountno` WRITE;
/*!40000 ALTER TABLE `db_ba_accountno` DISABLE KEYS */;
INSERT INTO `db_ba_accountno` VALUES (2,'dw'),(3,'sdfsdfsdf');
/*!40000 ALTER TABLE `db_ba_accountno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_ba_accounttype`
--

DROP TABLE IF EXISTS `db_ba_accounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_ba_accounttype` (
  `account_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_ba_accounttype`
--

LOCK TABLES `db_ba_accounttype` WRITE;
/*!40000 ALTER TABLE `db_ba_accounttype` DISABLE KEYS */;
INSERT INTO `db_ba_accounttype` VALUES (2,'a'),(3,'sdfsdf'),(4,'aaa');
/*!40000 ALTER TABLE `db_ba_accounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_ba_bankname`
--

DROP TABLE IF EXISTS `db_ba_bankname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_ba_bankname` (
  `bank_name_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bank_name_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_ba_bankname`
--

LOCK TABLES `db_ba_bankname` WRITE;
/*!40000 ALTER TABLE `db_ba_bankname` DISABLE KEYS */;
INSERT INTO `db_ba_bankname` VALUES (1,'ss'),(3,'xcxc'),(4,'asdasdasdasd'),(5,'asdasdasdasdasdasdasdasd'),(6,'hhhh'),(7,'ddddd'),(8,'zxczxczx'),(9,'ssssssssss'),(10,'vvvvv'),(11,'xxx'),(12,'fghfghfghfgh'),(13,'dddddddddddddddddddddddd'),(14,'ggggg'),(15,'e'),(16,'adasdasd'),(18,'y'),(19,'cccc'),(20,'ssss'),(21,'sssss'),(22,'hello hilal'),(23,'sss'),(24,'gkghjfgjfghfghfghfgh'),(25,'zsdfsdfsdf'),(26,'12344'),(27,'12345678'),(28,'1234456768678678'),(29,'sdfsdfsdfsdfsdfsdfsdfsdfsdfsdf'),(30,'ssdfsdfsdfwe342342'),(31,'sdfsdfsdfs64dfs6d6fs13d1f3s1df31sdf'),(32,'aaa'),(33,'a1'),(34,'a21'),(35,'aaaa');
/*!40000 ALTER TABLE `db_ba_bankname` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_ba_currency`
--

DROP TABLE IF EXISTS `db_ba_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_ba_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_ba_currency`
--

LOCK TABLES `db_ba_currency` WRITE;
/*!40000 ALTER TABLE `db_ba_currency` DISABLE KEYS */;
INSERT INTO `db_ba_currency` VALUES (2,'b'),(3,'dfsdfsdf');
/*!40000 ALTER TABLE `db_ba_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_bank_info`
--

DROP TABLE IF EXISTS `db_bank_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_bank_info` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name_id` int(11) NOT NULL,
  `account_type_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `accountno_id` int(11) NOT NULL,
  `signing_mangate` varchar(45) NOT NULL,
  `date_of_min_resu` datetime NOT NULL,
  `is_internet_banking` smallint(2) NOT NULL,
  `type_facility` varchar(100) NOT NULL,
  `remark` mediumtext NOT NULL,
  `is_active` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_bank_info`
--

LOCK TABLES `db_bank_info` WRITE;
/*!40000 ALTER TABLE `db_bank_info` DISABLE KEYS */;
INSERT INTO `db_bank_info` VALUES (7,5,3,2,2,'ss','2015-09-19 00:00:00',1,'ss','ss',1,6,11,'2015-09-19 12:16:40',11,'2015-09-19 12:16:40',''),(8,8,3,3,3,'ww','2015-09-19 00:00:00',0,'','www',1,6,0,'0000-00-00 00:00:00',11,'2015-09-19 12:16:55',''),(9,3,3,3,2,'zz','2015-09-28 00:00:00',1,'zzz','sss',1,6,11,'2015-09-28 11:40:13',11,'2015-09-28 11:50:43','Dormant');
/*!40000 ALTER TABLE `db_bank_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_beneficial_corporate`
--

DROP TABLE IF EXISTS `db_beneficial_corporate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_beneficial_corporate` (
  `beneficial_crp_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of_company` varchar(255) DEFAULT NULL,
  `registered_in` varchar(255) DEFAULT NULL,
  `date_of_incorp` datetime DEFAULT NULL,
  `date_of_certification_of_incorp` datetime DEFAULT NULL,
  `type_of_company` varchar(45) DEFAULT NULL,
  `is_member_register` smallint(2) DEFAULT NULL,
  `member_register_date` datetime DEFAULT NULL,
  `is_director_register` smallint(2) DEFAULT NULL,
  `director_register_date` datetime DEFAULT NULL,
  `represented_by` varchar(45) DEFAULT NULL,
  `is_passport` smallint(2) DEFAULT NULL,
  `passport_no` varchar(45) DEFAULT NULL,
  `country_of_issue` varchar(45) DEFAULT NULL,
  `date_of_issue` datetime DEFAULT NULL,
  `date_of_expiry` datetime DEFAULT NULL,
  `is_bank_ref` varchar(45) DEFAULT NULL,
  `name_of_bank` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `is_address_proof` smallint(2) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `address_proof_date` datetime DEFAULT NULL,
  `is_corporate_profile` smallint(2) DEFAULT NULL,
  `is_audited_account` smallint(2) DEFAULT NULL,
  `date_of_finantial_year_end` datetime DEFAULT NULL,
  `remarks` mediumtext,
  `client_id` int(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `is_active` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`beneficial_crp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_beneficial_corporate`
--

LOCK TABLES `db_beneficial_corporate` WRITE;
/*!40000 ALTER TABLE `db_beneficial_corporate` DISABLE KEYS */;
INSERT INTO `db_beneficial_corporate` VALUES (2,'aa1','aa2','2015-10-08 00:00:00','2015-10-08 00:00:00','aa3',1,'2015-10-09 00:00:00',1,'2015-10-10 00:00:00','aa41',1,'aa5','BR','2015-10-11 00:00:00','2015-10-12 00:00:00','1','aa6','2015-10-13 00:00:00',1,'aa7','FR','2015-10-14 00:00:00',1,1,'0000-00-00 00:00:00','aa',6,11,'2015-10-07 14:38:55',11,'2015-10-07 17:09:39',1);
/*!40000 ALTER TABLE `db_beneficial_corporate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_beneficial_corporate_auth_person`
--

DROP TABLE IF EXISTS `db_beneficial_corporate_auth_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_beneficial_corporate_auth_person` (
  `person_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_no` varchar(45) DEFAULT NULL,
  `beneficial_crp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_beneficial_corporate_auth_person`
--

LOCK TABLES `db_beneficial_corporate_auth_person` WRITE;
/*!40000 ALTER TABLE `db_beneficial_corporate_auth_person` DISABLE KEYS */;
INSERT INTO `db_beneficial_corporate_auth_person` VALUES (1,'q','w','e','r',1),(2,'t','y','u','i',1),(9,'1','2','3','4',2),(10,'aa1','aa','aa','aa',2);
/*!40000 ALTER TABLE `db_beneficial_corporate_auth_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_beneficial_individual`
--

DROP TABLE IF EXISTS `db_beneficial_individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_beneficial_individual` (
  `beneficial_ind_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_name` varchar(255) DEFAULT NULL,
  `has_passport` smallint(2) DEFAULT NULL,
  `passport_no` varchar(45) DEFAULT NULL,
  `country_of_issue` varchar(45) DEFAULT NULL,
  `date_of_issue` datetime DEFAULT NULL,
  `date_of_expiry` datetime DEFAULT NULL,
  `has_cv` smallint(2) DEFAULT NULL,
  `recieved_date` datetime DEFAULT NULL,
  `is_bank_ref` smallint(2) DEFAULT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `has_address_proof` smallint(2) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `address_proof_date` datetime DEFAULT NULL,
  `other_detail` mediumtext,
  `client_id` int(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `is_active` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`beneficial_ind_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_beneficial_individual`
--

LOCK TABLES `db_beneficial_individual` WRITE;
/*!40000 ALTER TABLE `db_beneficial_individual` DISABLE KEYS */;
INSERT INTO `db_beneficial_individual` VALUES (2,'sasda',1,'asd','asd','2015-10-07 00:00:00','2015-10-07 00:00:00',1,'2015-10-07 00:00:00',1,'asd','2015-10-07 00:00:00',1,'asd','AF','2015-10-07 00:00:00','asd',6,11,'2015-10-07 10:56:15',11,'2015-10-07 10:56:15',1);
/*!40000 ALTER TABLE `db_beneficial_individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_cd_activity`
--

DROP TABLE IF EXISTS `db_cd_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_cd_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_cd_activity`
--

LOCK TABLES `db_cd_activity` WRITE;
/*!40000 ALTER TABLE `db_cd_activity` DISABLE KEYS */;
INSERT INTO `db_cd_activity` VALUES (1,'aa'),(2,'aaa');
/*!40000 ALTER TABLE `db_cd_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_cd_company_type`
--

DROP TABLE IF EXISTS `db_cd_company_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_cd_company_type` (
  `ctype_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ctype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_cd_company_type`
--

LOCK TABLES `db_cd_company_type` WRITE;
/*!40000 ALTER TABLE `db_cd_company_type` DISABLE KEYS */;
INSERT INTO `db_cd_company_type` VALUES (1,'ss'),(2,'ghjghj'),(3,'aaa'),(4,'ssss');
/*!40000 ALTER TABLE `db_cd_company_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_cd_status`
--

DROP TABLE IF EXISTS `db_cd_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_cd_status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_cd_status`
--

LOCK TABLES `db_cd_status` WRITE;
/*!40000 ALTER TABLE `db_cd_status` DISABLE KEYS */;
INSERT INTO `db_cd_status` VALUES (1,'aa'),(2,'ss');
/*!40000 ALTER TABLE `db_cd_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_compliance_info`
--

DROP TABLE IF EXISTS `db_compliance_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_compliance_info` (
  `compliance_id` int(11) NOT NULL AUTO_INCREMENT,
  `check_list_no` varchar(255) NOT NULL,
  `review_date` datetime NOT NULL,
  `remarks` mediumtext NOT NULL,
  `risk_level` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`compliance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_compliance_info`
--

LOCK TABLES `db_compliance_info` WRITE;
/*!40000 ALTER TABLE `db_compliance_info` DISABLE KEYS */;
INSERT INTO `db_compliance_info` VALUES (2,'ss','2015-09-28 00:00:00','ss','ss',1,6,0,'0000-00-00 00:00:00',11,'2015-09-28 14:18:30'),(4,'ff','2015-09-28 00:00:00','gg','ffgg',1,6,0,'0000-00-00 00:00:00',11,'2015-09-28 14:18:41');
/*!40000 ALTER TABLE `db_compliance_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_corporate_data`
--

DROP TABLE IF EXISTS `db_corporate_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_corporate_data` (
  `corporate_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_refrence` varchar(255) NOT NULL,
  `portfolio` varchar(255) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `gbl_license_no` varchar(255) NOT NULL,
  `previous_name` varchar(255) NOT NULL,
  `global_license_issue_date` datetime NOT NULL,
  `date_of_change_name` datetime NOT NULL,
  `business_reg_no` varchar(255) NOT NULL,
  `date_of_incorp` datetime NOT NULL,
  `transfer_reg` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `transfer_from_to` varchar(255) NOT NULL,
  `roc_file_no` varchar(255) NOT NULL,
  `within_group` smallint(2) NOT NULL,
  `name_of_group` varchar(255) DEFAULT NULL,
  `type_of_company` varchar(255) NOT NULL,
  `activity` int(11) NOT NULL,
  `activity_detail` varchar(255) NOT NULL,
  `registered_office` varchar(255) NOT NULL,
  `file_location` varchar(255) NOT NULL,
  `business_address` varchar(255) NOT NULL,
  `archieves_ref_no` varchar(255) NOT NULL,
  `introduced_by` varchar(255) NOT NULL,
  `introducer_email` varchar(255) NOT NULL,
  `introducer_address` varchar(255) NOT NULL,
  `introducer_phone` varchar(255) NOT NULL,
  `introducer_country` varchar(255) NOT NULL,
  `client_id` int(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`corporate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_corporate_data`
--

LOCK TABLES `db_corporate_data` WRITE;
/*!40000 ALTER TABLE `db_corporate_data` DISABLE KEYS */;
INSERT INTO `db_corporate_data` VALUES (1,'','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','0000-00-00 00:00:00','','','','',0,NULL,'',0,'','','','','','','','','','',8,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00'),(2,'sss111111111','asdasdasdasd','qq','r','w','2015-09-15 00:00:00','2015-09-29 00:00:00','y','2015-09-23 00:00:00','u','2','aaaa','e',1,'aa','2',1,'ddd','ss','er','wer','wer','aa1','aa4','2aa','aa5','aa3',6,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00'),(7,'','','','','','0000-00-00 00:00:00','0000-00-00 00:00:00','','0000-00-00 00:00:00','','','','',0,NULL,'',0,'','','','','','','','','','',1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `db_corporate_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_director_corporate`
--

DROP TABLE IF EXISTS `db_director_corporate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_director_corporate` (
  `director_corp_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(255) DEFAULT NULL,
  `registered_in` varchar(255) DEFAULT NULL,
  `date_of_incorporation` datetime DEFAULT NULL,
  `date_of_appointment` datetime DEFAULT NULL,
  `date_of_resigned` datetime DEFAULT NULL,
  `is_register_of_members` smallint(2) DEFAULT NULL,
  `member_register_date` datetime DEFAULT NULL,
  `is_register_directors` smallint(2) DEFAULT NULL,
  `director_register_date` datetime DEFAULT NULL,
  `represented_by` varchar(45) DEFAULT NULL,
  `is_passport` smallint(2) DEFAULT NULL,
  `passport_no` varchar(45) DEFAULT NULL,
  `country_of_issue` varchar(45) DEFAULT NULL,
  `date_of_issue` datetime DEFAULT NULL,
  `date_of_expiry` datetime DEFAULT NULL,
  `is_bank_ref` smallint(2) DEFAULT NULL,
  `is_proof_address` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `is_corporate_profile` smallint(2) DEFAULT NULL,
  `is_audited_accounts` smallint(2) DEFAULT NULL,
  `finantial_year_end_date` datetime DEFAULT NULL,
  `proof_of_address_date` datetime DEFAULT NULL,
  `client_id` int(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `is_active` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`director_corp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_director_corporate`
--

LOCK TABLES `db_director_corporate` WRITE;
/*!40000 ALTER TABLE `db_director_corporate` DISABLE KEYS */;
INSERT INTO `db_director_corporate` VALUES (1,'as','asd','2015-10-05 00:00:00','2015-10-05 00:00:00','2015-10-05 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00','',0,'','','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'on','','','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2015-10-05 00:00:00',6,11,'2015-10-05 18:17:22',11,'2015-10-05 18:17:22',1),(3,'ss','','2015-10-05 00:00:00','2015-10-05 00:00:00','2015-10-05 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00','',0,'','','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'','','','0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00','2015-10-05 00:00:00',6,NULL,NULL,11,'2015-10-05 18:20:34',1),(6,'latest','ss1','2015-10-07 00:00:00','2015-10-08 00:00:00','2015-10-09 00:00:00',1,'2015-10-10 00:00:00',1,'2015-10-11 00:00:00','ss21',1,'ss3','AL','2015-10-12 00:00:00','2015-10-13 00:00:00',1,'1','ss4','AO','2015-10-14 00:00:00',1,1,'2015-10-15 00:00:00','2015-10-16 00:00:00',6,11,'2015-10-06 14:05:41',11,'2015-10-06 14:17:46',1);
/*!40000 ALTER TABLE `db_director_corporate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_director_individual`
--

DROP TABLE IF EXISTS `db_director_individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_director_individual` (
  `dtr_individual_id` int(11) NOT NULL AUTO_INCREMENT,
  `director_name` varchar(255) CHARACTER SET big5 DEFAULT NULL,
  `appointed_date` datetime DEFAULT NULL,
  `is_form16_filled` smallint(2) DEFAULT NULL,
  `resigned_date` datetime DEFAULT NULL,
  `is_form17_filled` smallint(2) DEFAULT NULL,
  `director_birth_date` datetime DEFAULT NULL,
  `director_age` int(5) DEFAULT NULL,
  `directorship_in_public` smallint(2) DEFAULT NULL,
  `directorship_desc` mediumtext,
  `has_passport` smallint(2) DEFAULT NULL,
  `passport_no` varchar(45) DEFAULT NULL,
  `country_of_issue` varchar(45) DEFAULT NULL,
  `date_of_issue` datetime DEFAULT NULL,
  `date_of_expiry` datetime DEFAULT NULL,
  `has_cv` smallint(2) DEFAULT NULL,
  `has_bank_ref` smallint(2) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `is_address_proof` smallint(2) DEFAULT NULL,
  `address_detail` mediumtext,
  `country` varchar(45) DEFAULT NULL,
  `address_proof_date` datetime DEFAULT NULL,
  `other_detail` mediumtext,
  `client_id` int(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_on` datetime NOT NULL,
  `is_active` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`dtr_individual_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_director_individual`
--

LOCK TABLES `db_director_individual` WRITE;
/*!40000 ALTER TABLE `db_director_individual` DISABLE KEYS */;
INSERT INTO `db_director_individual` VALUES (2,'tyh','2015-10-05 00:00:00',0,'2015-10-05 00:00:00',0,'2015-10-05 00:00:00',0,0,'',1,'','AF','2015-10-05 00:00:00','2015-10-05 00:00:00',1,1,'','2015-10-05 00:00:00',1,'','AF','2015-10-05 00:00:00','',6,11,'2015-10-05 14:48:23',11,'2015-10-05 16:50:52',1);
/*!40000 ALTER TABLE `db_director_individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_fta_accounts`
--

DROP TABLE IF EXISTS `db_fta_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_fta_accounts` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `account_team` varchar(255) DEFAULT NULL,
  `financial_year_date` int(2) DEFAULT NULL,
  `financial_year_month` varchar(10) DEFAULT NULL,
  `adopted_at_agm` smallint(2) DEFAULT NULL,
  `special_meeting_on` datetime DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `is_active` smallint(2) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_fta_accounts`
--

LOCK TABLES `db_fta_accounts` WRITE;
/*!40000 ALTER TABLE `db_fta_accounts` DISABLE KEYS */;
INSERT INTO `db_fta_accounts` VALUES (1,'aaq',7,'August',0,'2015-09-22 00:00:00',6,11,'2015-09-21 13:53:23',11,'2015-09-21 15:14:14',1);
/*!40000 ALTER TABLE `db_fta_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_fta_accounts_values`
--

DROP TABLE IF EXISTS `db_fta_accounts_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_fta_accounts_values` (
  `auto_id` int(11) NOT NULL AUTO_INCREMENT,
  `financial_year` datetime DEFAULT NULL,
  `date_filed` datetime DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`auto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_fta_accounts_values`
--

LOCK TABLES `db_fta_accounts_values` WRITE;
/*!40000 ALTER TABLE `db_fta_accounts_values` DISABLE KEYS */;
INSERT INTO `db_fta_accounts_values` VALUES (59,'2015-09-21 00:00:00','2015-09-21 00:00:00',1),(65,'2015-09-21 00:00:00','2015-09-21 00:00:00',7),(66,'1970-01-01 05:30:00','1970-01-01 05:30:00',2),(67,'2015-09-22 00:00:00','2015-09-22 00:00:00',3);
/*!40000 ALTER TABLE `db_fta_accounts_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_fta_auditors`
--

DROP TABLE IF EXISTS `db_fta_auditors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_fta_auditors` (
  `auditor_id` int(11) NOT NULL AUTO_INCREMENT,
  `auditors` mediumtext,
  `resignation_date` datetime DEFAULT NULL,
  `appointment_date` datetime DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `is_active` smallint(2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`auditor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_fta_auditors`
--

LOCK TABLES `db_fta_auditors` WRITE;
/*!40000 ALTER TABLE `db_fta_auditors` DISABLE KEYS */;
INSERT INTO `db_fta_auditors` VALUES (4,'sss','1970-01-01 05:30:00','2015-09-22 00:00:00',6,1,11,'2015-09-22 15:09:25',11,'2015-09-22 15:09:56'),(5,'zxzzZX','2015-09-22 00:00:00','2015-09-22 00:00:00',6,1,11,'2015-09-22 15:42:05',11,'2015-09-22 15:42:05');
/*!40000 ALTER TABLE `db_fta_auditors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_fta_substance`
--

DROP TABLE IF EXISTS `db_fta_substance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_fta_substance` (
  `substance_id` int(11) NOT NULL AUTO_INCREMENT,
  `office_premises` smallint(2) DEFAULT NULL,
  `office_address` varchar(255) DEFAULT NULL,
  `employee_full_time` smallint(2) DEFAULT NULL,
  `adopted_arbitration` smallint(2) DEFAULT NULL,
  `has_the_constitution` varchar(255) DEFAULT NULL,
  `date_relevant` datetime DEFAULT NULL,
  `is_expected` smallint(2) DEFAULT NULL,
  `shares_are` smallint(2) DEFAULT NULL,
  `security_exchange` varchar(255) DEFAULT NULL,
  `has_yearly_expenditure` smallint(2) DEFAULT NULL,
  `is_active` smallint(2) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`substance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_fta_substance`
--

LOCK TABLES `db_fta_substance` WRITE;
/*!40000 ALTER TABLE `db_fta_substance` DISABLE KEYS */;
INSERT INTO `db_fta_substance` VALUES (1,1,'0e',1,1,'ss','2015-10-01 00:00:00',1,1,'asdxsadaSD',1,1,6,11,'2015-10-01 12:04:26',11,'2015-10-01 12:36:56');
/*!40000 ALTER TABLE `db_fta_substance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_fta_taxtrc`
--

DROP TABLE IF EXISTS `db_fta_taxtrc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_fta_taxtrc` (
  `taxtrc_id` int(11) NOT NULL AUTO_INCREMENT,
  `vat_no` varchar(255) DEFAULT NULL,
  `tan_no` varchar(255) DEFAULT NULL,
  `last_tax_returned_on` datetime DEFAULT NULL,
  `trc_available` smallint(2) DEFAULT NULL,
  `trc_no` varchar(255) DEFAULT NULL,
  `trc_renewal_at` datetime DEFAULT NULL,
  `treaty_countries` varchar(255) DEFAULT NULL,
  `client_id` int(255) DEFAULT NULL,
  `is_active` smallint(2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`taxtrc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_fta_taxtrc`
--

LOCK TABLES `db_fta_taxtrc` WRITE;
/*!40000 ALTER TABLE `db_fta_taxtrc` DISABLE KEYS */;
INSERT INTO `db_fta_taxtrc` VALUES (2,'aa','aa','2015-09-22 00:00:00',1,'aa','2013-02-14 00:00:00','aa',6,1,11,'2015-09-22 17:25:09',11,'2015-09-22 17:25:09'),(3,'aa','aa','2015-09-28 00:00:00',1,'aa','2015-09-28 00:00:00','aa',6,1,11,'2015-09-28 10:22:28',11,'2015-09-28 10:22:28');
/*!40000 ALTER TABLE `db_fta_taxtrc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_lp_license`
--

DROP TABLE IF EXISTS `db_lp_license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_lp_license` (
  `license_id` int(11) NOT NULL AUTO_INCREMENT,
  `license_type` varchar(255) DEFAULT NULL,
  `licensing_cond` varchar(255) DEFAULT NULL,
  `issue_date` datetime DEFAULT NULL,
  `license_no` varchar(255) DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `is_active` smallint(2) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`license_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_lp_license`
--

LOCK TABLES `db_lp_license` WRITE;
/*!40000 ALTER TABLE `db_lp_license` DISABLE KEYS */;
INSERT INTO `db_lp_license` VALUES (5,'0','0','2015-09-15 00:00:00','0','2015-09-15 00:00:00',11,'2015-09-15 16:37:39',11,'2015-09-15 16:37:39',1,6),(6,'0','0','2015-09-15 00:00:00','0','2015-09-15 00:00:00',11,'2015-09-15 16:39:27',11,'2015-09-15 16:39:27',1,6),(16,'2','ff','2015-09-01 00:00:00','ff','2015-09-03 00:00:00',11,'2015-09-16 12:58:31',11,'2015-09-16 12:58:31',1,6),(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6),(18,'2','f','2015-09-17 00:00:00','ff','2015-09-17 00:00:00',11,'2015-09-17 11:55:49',11,'2015-09-17 11:55:49',1,6),(20,'6','ss','2015-09-01 00:00:00','ss','2015-09-09 00:00:00',11,'2015-09-18 17:11:57',11,'2015-09-21 17:47:00',1,6),(21,'2','d','2015-09-18 00:00:00','d','2015-09-18 00:00:00',11,'2015-09-18 17:12:22',11,'2015-09-18 17:12:22',1,6),(24,'0','0','1970-01-01 05:30:00','0','1970-01-01 05:30:00',NULL,NULL,11,'2015-09-18 17:22:40',1,6),(26,'3','ss','2015-09-18 00:00:00','ss','2015-09-18 00:00:00',11,'2015-09-18 17:25:18',11,'2015-09-18 17:25:18',1,6),(27,'2','ss','2015-09-18 00:00:00','ss','2015-09-18 00:00:00',11,'2015-09-18 17:26:23',11,'2015-09-18 17:26:23',1,6),(29,'2','ss','2015-09-18 00:00:00','ss','2015-09-18 00:00:00',11,'2015-09-18 17:28:11',11,'2015-09-18 17:28:11',1,6),(30,'3','ss','2015-09-18 00:00:00','ss','2015-09-18 00:00:00',11,'2015-09-18 17:28:39',11,'2015-09-18 17:28:39',1,6),(31,'3','ss','2015-09-18 00:00:00','ss','2015-09-18 00:00:00',11,'2015-09-18 17:31:32',11,'2015-09-18 17:31:32',1,6),(32,'3','aa','2015-09-18 00:00:00','aa','2015-09-18 00:00:00',11,'2015-09-18 17:51:05',11,'2015-09-18 17:51:05',1,6),(34,'2','  fff','2015-09-18 00:00:00','fff','2015-09-18 00:00:00',11,'2015-09-18 18:04:54',11,'2015-09-18 18:04:54',1,6),(35,'3','qq','2015-09-18 00:00:00','qq','2015-09-18 00:00:00',11,'2015-09-18 18:06:36',11,'2015-09-18 18:06:36',1,6),(37,'3','ss','2015-09-18 00:00:00','ss','2015-09-18 00:00:00',11,'2015-09-18 18:08:17',11,'2015-09-18 18:08:17',1,6),(38,'3','ss','2015-09-18 00:00:00','ss','2015-09-18 00:00:00',11,'2015-09-18 18:08:48',11,'2015-09-18 18:08:48',1,6),(39,'3','ss','2015-09-18 00:00:00','ss','2015-09-18 00:00:00',NULL,NULL,11,'2015-09-18 18:10:52',1,6),(42,'4','ss','2015-09-18 00:00:00','sss','2015-09-18 00:00:00',11,'2015-09-18 18:33:01',11,'2015-09-18 18:33:01',1,6),(43,'2','ddd','2015-09-18 00:00:00','dd','2015-09-18 00:00:00',11,'2015-09-18 18:35:11',11,'2015-09-18 18:35:11',1,6),(44,'4','AA','2015-09-21 00:00:00','AA','2015-09-21 00:00:00',NULL,NULL,11,'2015-09-21 15:55:12',1,6),(45,'2','qqq','2015-09-21 00:00:00','q','2015-09-21 00:00:00',NULL,NULL,11,'2015-09-21 15:55:30',1,6),(46,'3','aa','2015-09-21 00:00:00','aa','2015-09-21 00:00:00',NULL,NULL,11,'2015-09-21 15:55:44',1,6),(47,'4','aa','2015-09-21 00:00:00','aa','2015-09-21 00:00:00',11,'2015-09-21 15:57:25',11,'2015-09-21 15:57:25',1,6),(48,'23','','2015-09-21 00:00:00','','2015-09-21 00:00:00',11,'2015-09-21 17:25:54',11,'2015-09-21 17:25:54',1,6),(49,'24','','2015-09-21 00:00:00','','2015-09-21 00:00:00',11,'2015-09-21 17:26:25',11,'2015-09-21 17:26:25',1,6),(50,'26','','2015-09-21 00:00:00','','2015-09-21 00:00:00',11,'2015-09-21 17:32:25',11,'2015-09-21 17:32:25',1,6),(51,'7','','2015-09-21 00:00:00','','2015-09-21 00:00:00',NULL,'2015-09-21 17:37:47',NULL,'2015-09-21 17:37:47',1,6),(52,'12','','2015-09-21 00:00:00','','2015-09-21 00:00:00',NULL,'2015-09-21 17:38:17',NULL,'2015-09-21 17:38:17',1,6),(53,'7','','2015-09-21 00:00:00','','2015-09-21 00:00:00',11,'2015-09-21 17:39:18',11,'2015-09-21 17:39:18',1,6),(54,'7','','2015-09-21 00:00:00','','2015-09-21 00:00:00',11,'2015-09-21 17:39:53',11,'2015-09-21 17:39:53',1,6),(55,'12','','2015-09-21 00:00:00','','2015-09-21 00:00:00',11,'2015-09-21 17:40:04',11,'2015-09-21 17:40:04',1,6),(56,'28','','2015-09-21 00:00:00','','2015-09-21 00:00:00',11,'2015-09-21 17:42:34',11,'2015-09-21 17:42:34',1,6),(57,'7','aa','2015-09-21 00:00:00','aa','2015-09-21 00:00:00',11,'2015-09-21 17:46:37',11,'2015-09-21 17:46:37',1,6),(58,'7','','2015-09-21 00:00:00','','2015-09-21 00:00:00',11,'2015-09-21 17:48:01',11,'2015-09-21 17:48:01',1,6),(59,'34','','2015-09-21 00:00:00','','2015-09-21 00:00:00',NULL,NULL,11,'2015-09-21 18:46:39',1,6),(60,'35','rr','2015-09-21 00:00:00','rrr','2015-09-21 00:00:00',NULL,NULL,11,'2015-09-21 18:46:45',1,6),(61,'7','ss','2015-09-21 00:00:00','ss','2015-09-21 00:00:00',NULL,NULL,11,'2015-09-21 18:46:52',1,6);
/*!40000 ALTER TABLE `db_lp_license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_lp_license_type`
--

DROP TABLE IF EXISTS `db_lp_license_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_lp_license_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_lp_license_type`
--

LOCK TABLES `db_lp_license_type` WRITE;
/*!40000 ALTER TABLE `db_lp_license_type` DISABLE KEYS */;
INSERT INTO `db_lp_license_type` VALUES (8,'ssss'),(10,'cvbbcvb'),(13,'q'),(14,'ffffff'),(15,'bnbnbn'),(16,'sss'),(17,'dfhdfghdfhdfhd'),(18,'nfgfhhfghfghfg'),(19,'tt'),(21,'bnvnvbnv'),(22,'r'),(25,'hghhh'),(27,'s'),(29,'khkhkhk'),(30,'g'),(31,'t'),(32,'sssss'),(36,'dfgdfgdf'),(37,'z2222@@@@@'),(38,'vvv'),(40,'k2344'),(41,'hello hilal');
/*!40000 ALTER TABLE `db_lp_license_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_lp_permit`
--

DROP TABLE IF EXISTS `db_lp_permit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_lp_permit` (
  `permit_id` int(11) NOT NULL AUTO_INCREMENT,
  `permit_type` varchar(255) DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `name_of_permit_holder` varchar(255) DEFAULT NULL,
  `issue_date` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `is_active` smallint(2) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`permit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_lp_permit`
--

LOCK TABLES `db_lp_permit` WRITE;
/*!40000 ALTER TABLE `db_lp_permit` DISABLE KEYS */;
INSERT INTO `db_lp_permit` VALUES (1,'2','2015-09-22 00:00:00','ss','2015-09-22 00:00:00','ss',11,'2015-09-22 17:36:40',11,'2015-09-22 17:36:40',1,NULL),(2,'3','2015-09-22 00:00:00','aa','2015-09-22 00:00:00','aa',11,'2015-09-22 17:39:11',11,'2015-09-22 17:39:11',1,NULL),(3,'4','2015-09-22 00:00:00','aaaa','2015-09-22 00:00:00','aa',11,'2015-09-22 17:39:53',11,'2015-09-22 17:40:42',1,6),(4,'2','2015-09-28 00:00:00','ss','2015-09-28 00:00:00','ss',11,'2015-09-28 16:43:34',11,'2015-09-28 16:43:34',1,6),(5,'3','2015-09-28 00:00:00','ss','2015-09-28 00:00:00','ss',NULL,NULL,11,'2015-09-28 16:59:29',1,6),(6,'9','2015-10-01 00:00:00','AA','2015-10-01 00:00:00','AA',11,'2015-10-01 14:26:20',11,'2015-10-01 14:26:20',1,6);
/*!40000 ALTER TABLE `db_lp_permit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_lp_permit_type`
--

DROP TABLE IF EXISTS `db_lp_permit_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_lp_permit_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_lp_permit_type`
--

LOCK TABLES `db_lp_permit_type` WRITE;
/*!40000 ALTER TABLE `db_lp_permit_type` DISABLE KEYS */;
INSERT INTO `db_lp_permit_type` VALUES (5,'z'),(6,'ccc'),(7,'t'),(8,'d'),(9,'b'),(10,'333'),(11,'ss'),(12,'ggg'),(13,'sss'),(14,'retyrety'),(15,'wewerwer'),(16,'nnn');
/*!40000 ALTER TABLE `db_lp_permit_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_shareholder_allotment`
--

DROP TABLE IF EXISTS `db_shareholder_allotment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_shareholder_allotment` (
  `allotment_id` int(11) NOT NULL AUTO_INCREMENT,
  `shareholder` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `date_of_allotment` datetime DEFAULT NULL,
  `type_of_share` varchar(45) DEFAULT NULL,
  `no_of_shares` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `capital_after_issue` varchar(255) DEFAULT NULL,
  `holding_after_allotment` varchar(255) DEFAULT NULL,
  `allotment_remark` mediumtext,
  `transfer_from` varchar(255) DEFAULT NULL,
  `transfer_to` varchar(255) DEFAULT NULL,
  `allotment_address` varchar(45) DEFAULT NULL,
  `date_of_transfer` datetime DEFAULT NULL,
  `transfer_type_of_share` varchar(255) DEFAULT NULL,
  `no_of_shares_transfer` varchar(45) DEFAULT NULL,
  `transfer_currency` varchar(45) DEFAULT NULL,
  `transfer_value` varchar(45) DEFAULT NULL,
  `transfer_capital_after_transfer` varchar(255) DEFAULT NULL,
  `transfer_holding_after_allotment` varchar(255) DEFAULT NULL,
  `transfer_remark` mediumtext,
  `client_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`allotment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_shareholder_allotment`
--

LOCK TABLES `db_shareholder_allotment` WRITE;
/*!40000 ALTER TABLE `db_shareholder_allotment` DISABLE KEYS */;
INSERT INTO `db_shareholder_allotment` VALUES (1,'a','a','2015-10-09 00:00:00','3','a','a','a','a','a','a','a','a','a','2015-10-09 00:00:00','3','a','a','a','a','a','a','6');
/*!40000 ALTER TABLE `db_shareholder_allotment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_shareholder_allotment_typeofshare`
--

DROP TABLE IF EXISTS `db_shareholder_allotment_typeofshare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_shareholder_allotment_typeofshare` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_of_share` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_shareholder_allotment_typeofshare`
--

LOCK TABLES `db_shareholder_allotment_typeofshare` WRITE;
/*!40000 ALTER TABLE `db_shareholder_allotment_typeofshare` DISABLE KEYS */;
INSERT INTO `db_shareholder_allotment_typeofshare` VALUES (1,'sss'),(2,'ddd'),(3,'dfsdfs'),(4,'xxxx'),(5,'sdfsdfsdfsdfsdfsdfw');
/*!40000 ALTER TABLE `db_shareholder_allotment_typeofshare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_shareholder_individual`
--

DROP TABLE IF EXISTS `db_shareholder_individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_shareholder_individual` (
  `shareholder_ind_id` int(11) NOT NULL AUTO_INCREMENT,
  `is_shareholder` smallint(2) DEFAULT NULL,
  `name_of_shareholder` varchar(255) DEFAULT NULL,
  `shareholder_address` varchar(255) DEFAULT NULL,
  `is_passport` smallint(2) DEFAULT NULL,
  `passport_no` varchar(45) DEFAULT NULL,
  `country_of_issue` varchar(45) DEFAULT NULL,
  `date_of_issue` datetime DEFAULT NULL,
  `date_of_expiry` datetime DEFAULT NULL,
  `has_cv` smallint(2) DEFAULT NULL,
  `recieved_date` datetime DEFAULT NULL,
  `is_bank_ref` smallint(2) DEFAULT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `has_address_proof` smallint(2) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `address_proof_date` datetime DEFAULT NULL,
  `other_detail` mediumtext,
  `client_id` int(11) DEFAULT NULL,
  `col_seperator` varchar(45) DEFAULT NULL,
  `name_of_corporate_shareholder` varchar(255) DEFAULT NULL,
  `corporate_shareholder_address` varchar(255) DEFAULT NULL,
  `date_of_certification_of_incorp` datetime DEFAULT NULL,
  `type_of_company` varchar(45) DEFAULT NULL,
  `is_member_register` smallint(2) DEFAULT NULL,
  `member_register_date` datetime DEFAULT NULL,
  `is_director_register` smallint(2) DEFAULT NULL,
  `director_register_date` datetime DEFAULT NULL,
  `is_corporate_profile` smallint(2) DEFAULT NULL,
  `is_audited_account` smallint(2) DEFAULT NULL,
  `date_of_finantial_year_end` datetime DEFAULT NULL,
  `represented_by` varchar(45) DEFAULT NULL,
  `is_bank_ref_c` smallint(2) DEFAULT NULL,
  `bank_name_c` varchar(45) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `has_address_proof_c` smallint(2) DEFAULT NULL,
  `address_c` varchar(255) DEFAULT NULL,
  `country_c` varchar(45) DEFAULT NULL,
  `address_proof_date_c` datetime DEFAULT NULL,
  `remarks` mediumtext,
  PRIMARY KEY (`shareholder_ind_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_shareholder_individual`
--

LOCK TABLES `db_shareholder_individual` WRITE;
/*!40000 ALTER TABLE `db_shareholder_individual` DISABLE KEYS */;
INSERT INTO `db_shareholder_individual` VALUES (2,0,'','',0,'','','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'','0000-00-00 00:00:00',0,'','','0000-00-00 00:00:00','',6,NULL,'aswdasdasd','sdasd','2015-10-09 00:00:00','dasd',1,'2015-10-09 00:00:00',1,'2015-10-09 00:00:00',1,1,'0000-00-00 00:00:00','asda',1,'','2015-10-09 00:00:00',1,'asdas','AF','2015-10-09 00:00:00','asdasdasd');
/*!40000 ALTER TABLE `db_shareholder_individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_trust_trustinfo`
--

DROP TABLE IF EXISTS `db_trust_trustinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_trust_trustinfo` (
  `trustinfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_of_trust` varchar(255) DEFAULT NULL,
  `trust_type` varchar(255) DEFAULT NULL,
  `is_other_than_anex` smallint(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_of_establishment` datetime DEFAULT NULL,
  `is_trust_deed` smallint(2) DEFAULT NULL,
  `is_global_business_license` smallint(2) DEFAULT NULL,
  `is_letter_of_wishes` smallint(2) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `is_non_residence` smallint(2) DEFAULT NULL,
  `is_trust_tax_residence` smallint(2) DEFAULT NULL,
  `tan_no` varchar(255) DEFAULT NULL,
  `is_account_prepared` smallint(2) DEFAULT NULL,
  `finantial_year_date` varchar(45) DEFAULT NULL,
  `finantial_year_month` varchar(45) DEFAULT NULL,
  `is_settlor_individual` smallint(2) DEFAULT NULL,
  `name_of_settlor` varchar(255) DEFAULT NULL,
  `is_passport` smallint(2) DEFAULT NULL,
  `passport_no` varchar(45) DEFAULT NULL,
  `country_of_issue` varchar(45) DEFAULT NULL,
  `date_of_issue` datetime DEFAULT NULL,
  `date_of_expiry` datetime DEFAULT NULL,
  `has_cv` smallint(2) DEFAULT NULL,
  `recieved_date` datetime DEFAULT NULL,
  `is_bank_ref` smallint(2) DEFAULT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `has_address_proof` smallint(2) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `address_proof_date` datetime DEFAULT NULL,
  `other_detail` mediumtext,
  `col_seperator` varchar(45) DEFAULT NULL,
  `name_of_company` varchar(255) DEFAULT NULL,
  `represented_by` varchar(45) DEFAULT NULL,
  `date_of_incorp` datetime DEFAULT NULL,
  `registered_in` varchar(255) DEFAULT NULL,
  `is_member_register` smallint(2) DEFAULT NULL,
  `member_register_date` datetime DEFAULT NULL,
  `is_director_register` smallint(2) DEFAULT NULL,
  `director_register_date` datetime DEFAULT NULL,
  `is_corporate_profile` smallint(2) DEFAULT NULL,
  `is_audited_account` smallint(2) DEFAULT NULL,
  `date_of_finantial_year_end` datetime DEFAULT NULL,
  `is_bank_ref_n` smallint(2) DEFAULT NULL,
  `bank_name_n` varchar(255) DEFAULT NULL,
  `date_n` datetime DEFAULT NULL,
  `has_address_proof_n` smallint(2) DEFAULT NULL,
  `address_n` varchar(255) DEFAULT NULL,
  `country_n` varchar(45) DEFAULT NULL,
  `address_proof_date_n` datetime DEFAULT NULL,
  `remarks` mediumtext,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`trustinfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_trust_trustinfo`
--

LOCK TABLES `db_trust_trustinfo` WRITE;
/*!40000 ALTER TABLE `db_trust_trustinfo` DISABLE KEYS */;
INSERT INTO `db_trust_trustinfo` VALUES (1,'SS','',0,NULL,'2015-10-12 00:00:00',0,0,0,'','',0,0,'',0,'01','01',1,'asdfas',1,'fdf','DZ','2015-10-12 00:00:00','2015-10-12 00:00:00',0,'0000-00-00 00:00:00',0,'','0000-00-00 00:00:00',0,'','','0000-00-00 00:00:00','dasd',NULL,'','','0000-00-00 00:00:00','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'','0000-00-00 00:00:00',0,'','','0000-00-00 00:00:00','',6),(2,'sss-111','3',1,NULL,'2015-10-12 00:00:00',1,1,1,'ss','ss',1,1,'ss',1,'15','06',0,'',0,'','','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'','0000-00-00 00:00:00',0,'','','0000-00-00 00:00:00','',NULL,'ss','ss','2015-10-12 00:00:00','ss',1,'2015-10-12 00:00:00',1,'2015-10-12 00:00:00',1,1,'0000-00-00 00:00:00',1,'ss','2015-10-12 00:00:00',1,'ss','AF','2015-10-12 00:00:00','ss',6),(3,'ss','',0,NULL,'2015-10-09 00:00:00',0,0,0,'','',0,0,'',0,'01','01',0,'',0,'','','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'','0000-00-00 00:00:00',0,'','','0000-00-00 00:00:00','',NULL,'','','2015-10-09 00:00:00','',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'','0000-00-00 00:00:00',0,'','','0000-00-00 00:00:00','',6);
/*!40000 ALTER TABLE `db_trust_trustinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'QA','1',NULL,'2015-04-25 10:29:53',NULL),(2,'Dev','1',NULL,'2015-04-25 10:30:10',NULL),(3,'Designer','1',NULL,'2015-04-25 10:30:27',NULL);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `empId` varchar(255) CHARACTER SET koi8r NOT NULL DEFAULT '',
  `empName` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `other` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `gender` enum('Male','Female') CHARACTER SET latin1 DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `occupation` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `designation` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `drivLicense` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `emailId` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `address` text CHARACTER SET latin1,
  `city` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `homePhone` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  `currentTeamId` int(11) DEFAULT NULL,
  `profilepic` text CHARACTER SET latin1,
  `usrRoleld` int(11) NOT NULL,
  `managerId` int(11) NOT NULL,
  `empPassword` varchar(255) CHARACTER SET latin1 NOT NULL,
  `surname` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `placeOfBirth` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `probation_period` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `status` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `dateLeft` date NOT NULL,
  `dateJoining` date NOT NULL DEFAULT '0000-00-00',
  `dateOfConfirmation` date NOT NULL DEFAULT '0000-00-00',
  `pension_status` varchar(255) DEFAULT NULL,
  `medical_status` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NULL DEFAULT NULL COMMENT '0000-00-00 00:00:00',
  `company_id` int(11) DEFAULT NULL,
  `apply_leave` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `empId` (`empId`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'S001','Super User',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'superuser@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','','','','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','2015-04-24 04:52:15',NULL,NULL),(15,'R008','Nabeela','Beebee Tabastum','',0,'1990-11-23','','Accounts Officer','','nabeela.reheem@anexconsultancy.com','La Caverne No 2, Vacoas','Vacoas',118,'6980559','57781768',0,14,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','REHEEM','Victoria Hospital','','1','0000-00-00','2013-01-01','0000-00-00',NULL,NULL,NULL,NULL,'2015-02-06 13:19:19',NULL,NULL,1),(14,'M001','Vikash','','',0,'1988-03-28','','','','vikash.mangli@anexconsultancy.com','Rue Canangium Alma, Verdun, Moka, Mauritius','',0,'4357175','0',0,14,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','MANGLI','','','1','2015-01-15','2010-01-06','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-05 12:15:27',NULL,NULL,1),(13,'J001','Bhavna','','',0,'1985-08-26','','','','bhavna.jaunky@anexconsultancy.com','La Caverne, Vacoas, Mauritius','',0,'6967728','57650657',0,14,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Jaunky','Candos Hospital','','1','0000-00-00','2012-08-01','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-05 11:50:48',NULL,NULL,1),(10,'A007','deepanshu','','Male',0,'0000-00-00','','',NULL,'deepanshu.chauhan61@gmail.com','','',0,'','',0,1,NULL,14,11,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','','','','0000-00-00','0000-00-00','2015-05-06','no','no',1,NULL,'2015-04-25 10:17:02',NULL,3,1),(8,'A0111','Shiju','','Male',0,'2015-04-24','','',NULL,'clavisshiju@gmail.com','','',0,'','',0,1,NULL,12,10,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Jacob','','','','0000-00-00','2015-04-22','2015-04-24','no','no',1,NULL,'2015-04-25 10:14:27',NULL,1,0),(11,'A0071','s1 jacob','','Male',0,'0000-00-00','','',NULL,'sjacob.v@gmail.com','','',0,'','',0,0,NULL,13,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','','3','','0000-00-00','2015-03-06','0000-00-00','no','no',1,NULL,'2015-04-25 10:20:52',NULL,2,0),(16,'H004','Salman','Mohammad, Ibrahim','',0,'1987-10-20','','','','salman.hatteea@stanhope.mu','11, Flat Dahlia,  Harris Street,  Port-Louis','',0,'2121745','54993037',0,14,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','HATTEEA','','','','2015-01-15','2007-12-12','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-06 13:18:30',NULL,NULL,1),(17,'M014','Mootoosamy, Manika','','',0,'1991-12-27','','Assistant Corporate Officer','','corporate.dn@stanhope.mu','Dr Idriss Goomany, Plaisance Rose Hill','Rose Hill',118,'4652858','57366908',0,14,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','Victoria Hospital','','1','0000-00-00','0000-00-00','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-05 13:38:16',NULL,NULL,1),(18,'N002','Danishta','','',0,'1975-09-04','','Team Leader','','danishta.nobin@stanhope.mu','1, Bain Des Dames Street, Les Cassis, Port-Louis','',118,'2105166','54975388',0,14,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Nobin','Port-Louis','','1','0000-00-00','1999-03-25','0000-00-00',NULL,NULL,NULL,NULL,'2015-02-05 18:32:00',NULL,NULL,1),(19,'A003','Nathalie','Sabrina, Marie','',0,'1981-08-03','','','','nathalie.alcide@anexman.com','54B Dupont Street, Beau-Bassin, Mauritius','',0,'4678687','57123257',0,3,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Kelly','','3','1','0000-00-00','2008-07-15','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-09 16:51:21',NULL,NULL,1),(20,'S008','Seethamah, Muzzammil','','',0,'0000-00-00','','','','muzzammil.seethamah@anexman.com','','',0,'0','0',1,3,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','','','','0000-00-00','0000-00-00','2015-01-15',NULL,NULL,NULL,NULL,'2015-01-16 20:14:10',NULL,NULL,1),(21,'S007','Seechurn, Manmohini','','',0,'1988-04-27','','Accounts Officer','','manmohini.seechurn@anexman.com','Seechurn Lane Solferino Rd 3 Vacoas','Vacoas',118,'4243784','59229591',0,3,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','','','1','0000-00-00','2010-09-01','0000-00-00',NULL,NULL,NULL,NULL,'2015-03-27 13:40:51',NULL,NULL,1),(22,'J003','Ya-Eash','','',0,'1990-07-17','','','','yaeash.joomratty@anexman.com','115, La Paix Street, Port-Louis, Mauritius','',0,'2167083','57509207',0,4,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Joomratty','','6','1','2015-01-15','2014-02-24','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-09 18:53:17',NULL,NULL,1),(23,'M006','Ashish','','',0,'1990-08-24','','','','ashish.mehta@anexconsultancy.com','45, Pope Henessy Street, Curepipe, Vel Govinden Street, Beau-Bassin, Mauritius','',0,'6741519','57024094',0,3,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Mehta','','6','1','2015-01-15','2013-06-19','2015-01-15',NULL,NULL,NULL,NULL,'2015-03-27 13:41:11',NULL,NULL,1),(24,'H005','Marie-Line','','',0,'1953-09-07','','','','marieline.hitillambeau@anexman.com','Sterling Street, Eau Coulee, Mauritius','',0,'6976357','0',0,4,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Hitillambeau','','','','2015-01-15','0000-00-00','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-05 12:12:55',NULL,NULL,1),(25,'C002','Joel','Juste, Joel, Bernard','',0,'1983-12-12','','','','joel.chavry@anexman.com','35A, Middle Road, Belle-Etoile, Coromandel, Mauritius','',0,'2335691','59154666',0,4,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Chavry','Mauritius','','','2015-01-15','2011-05-16','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-05 12:12:10',NULL,NULL,1),(26,'W001','Cedric','David','',0,'1988-07-17','','Senior Corporate Officer','','cedric.wong@anexman.com','Cnr Cormoran &amp;amp;amp; Albatros, Elizabethville Tombeau Bay','Pamplemousses',118,'2475797','57414131',0,4,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Wong Sao Tien','Jeetoo Hospital','','1','0000-00-00','2007-01-14','0000-00-00',NULL,NULL,NULL,NULL,'2015-02-06 13:20:12',NULL,NULL,1),(27,'M002','Suhaylah','Bibi','',0,'1989-04-23','','','','suhaylah.maulaboksh@anexman.com','Hill Lane, Carreau Laliane, Vacoas, Mauritius','',0,'4274172','0',0,4,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Maulaboksh','','','','2015-01-15','0000-00-00','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-10 10:59:08',NULL,NULL,1),(28,'H007','Jeeneshwaree','Shalinee','',0,'1985-02-17','','Senior Corporate Officer','','shalinee.hawoldar@anexman.com','Des Coins Road, Long Mountain, Mauritius','',118,'2433804','57187715',0,5,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Hawoldar','Mauritius','6','1','0000-00-00','2013-09-02','2014-01-05',NULL,NULL,NULL,NULL,'2015-02-05 11:53:07',NULL,NULL,1),(29,'N001','Zeeshan','','',0,'1988-12-17','','','','zeeshan.nousher@anexman.com','De Burgh Avenue, Floreal','',0,'6864646','59326648',0,5,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Nousher','Moka, Mauritius','','1','2015-01-15','2014-04-01','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-04 16:13:47',NULL,NULL,2),(30,'N004','Nair, Pallavi','','',0,'1984-01-28','','Assistant Corporate Officer','','pallavi.nair@anexman.com','','Vacoas',118,'6986384','0',0,6,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','','','1','0000-00-00','2014-04-16','0000-00-00',NULL,NULL,NULL,NULL,'2015-02-05 15:59:02',NULL,NULL,1),(31,'R001','Vedita','','',0,'1979-01-09','','','','vedita.ragoo@anexman.com','Royal Road, La Marie, Vacoas','',0,'6849980','57547597',0,6,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Ragoo-Sobrun','Mauritius','','1','2015-01-15','2005-09-26','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-09 14:24:37',NULL,NULL,1),(32,'R006','Rummun, Azhar','Azhar Ali Muhammad','',0,'1989-10-22','','Assistant Corporate Officer','','azhar.rummun@anexman.com','Royal Road L avenir Saint pierre','',118,'0','57542497',0,6,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','','6','1','0000-00-00','2014-05-05','0000-00-00',NULL,NULL,NULL,NULL,'2015-02-05 13:58:38',NULL,NULL,1),(33,'R004','Riyaad','Muhammad','',0,'1989-06-12','','','','riyaad.rosun@anexman.com','Royal Road, Union Park, Mauritius','',0,'6770391','57010721',0,7,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Rosun','Mauritius','','','2015-01-15','2011-05-02','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-05 12:14:00',NULL,NULL,1),(34,'G002','Bilaal','Salim','',0,'1987-08-10','','','','bilaal.ghanty@anexman.com','47, Eugene Laurent Street, Port-Louis, Mauritius','',0,'2100343','57833110',0,7,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Ghanty','Port-Louis, Mauritius','','','0000-00-00','2007-03-14','0000-00-00',NULL,NULL,NULL,NULL,'2015-02-05 12:10:04',NULL,NULL,1),(35,'T002','Brindha','','',0,'1984-05-18','Compliance Officer','','','brindha.tanee@anexman.com','Avenue Osman, St Paul, Phoenix','Phoenix',118,'686 5462','5422 8078',0,8,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','TANEE','Pamplemousses','6','1','0000-00-00','2014-07-01','2015-01-01',NULL,NULL,NULL,NULL,'2015-02-16 11:19:07',NULL,NULL,1),(36,'A004','Mubeen','Muhammad','',0,'0000-00-00','','','','mubeen.abdullatif@anexman.com','48B Shand Street, Beau-Bassin, Mauritius','',0,'4664712','0',0,8,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Abdullatif','','9','1','2015-01-15','2012-01-04','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-05 12:13:14',NULL,NULL,1),(37,'M005','Wardah','','',0,'1986-11-27','','','','wardah.meerun@anexman.com','Royal Road, 8th Mile, Triolet, Mauritius','',0,'2613832','57929919',0,9,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Meerun','Jeetoo Hospital','','1','2015-01-15','2011-04-25','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-05 11:53:43',NULL,NULL,1),(38,'R005','Ibtisaam','','',0,'1988-02-08','','','','ibtisaam.ramputh@anexman.com','Clairfond No 1, Ramputh Lane, Phoenix, Mauritius','',0,'6971953','7088818',0,9,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Ramputh','Victoria Hospital','','1','2015-01-15','2011-12-13','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-05 12:11:54',NULL,NULL,1),(39,'S004','Saraspadee','Saraspadee','',0,'1980-01-22','','','','anex.secretary@anexman.com','93, Faucon Street,  Morc. Saint Daniel,  Roche Brune,  Mauritius','',0,'4660006','57622536',0,9,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Sidambaram','Port-Louis','','','2015-01-15','2004-03-01','2015-01-15',NULL,NULL,NULL,NULL,'2015-02-05 18:30:31',NULL,NULL,1),(40,'S006','Stephen,  Emmanuel','Gerard Emmanuel','',0,'1986-04-25','','Corporate Officer','','emmanuel.stephen@anexman.com','4A Remy Ollier Beau bassin','Beau Bassin',118,'4646529','0',0,4,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','Mauritius','','1','0000-00-00','2012-08-05','0000-00-00',NULL,NULL,NULL,NULL,'2015-02-05 18:02:39',NULL,NULL,1),(41,'A001','Alimohamed, Farhana','','',0,'0000-00-00','','Executive Director','','farhana@anexman.com','','',0,'0','0',1,9,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','','','','2015-01-15','0000-00-00','2015-01-15',NULL,NULL,NULL,NULL,'2015-01-30 14:34:07',NULL,NULL,1),(42,'A192921','Sahir Manager','','',0,'0000-00-00','','','','abdulkidwai@gmail.com','A-74, Rail Nagar Apartments  Sector- 50, Noida','Noida',83,'+919971114453','+919971114453',0,11,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','','2','','0000-00-00','2015-01-01','2015-02-28',NULL,NULL,NULL,NULL,'2015-02-05 16:07:52',NULL,NULL,2),(43,'clavismanager','clavis manager','','',0,'0000-00-00','','manager','','deepanshu.chauhan61@gmail.com','','',0,'0','0',0,11,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','','','','0000-00-00','0000-00-00','2015-01-27',NULL,NULL,NULL,NULL,'2015-01-30 14:18:35',NULL,NULL,1),(44,'151','test emp','','',0,'0000-00-00','','','','chauhan.nov21@gmail.com','','',0,'0','0',0,11,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','','','','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,'2015-01-30 14:18:40',NULL,NULL,1),(45,'X123','Doorgakant, Sandeep','','',0,'1986-05-23','','','','sandeep.doorgakant@anexman.com','','',0,'0','0',0,0,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','','','','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,'2015-02-05 18:56:59',NULL,NULL,1),(46,'X125','Sahood','Abdool, Ibney','',0,'1972-07-18','','','','anex.admin@anexman.com','Bonnefin Road, Pailles, Mauritius','',0,'2860438','57715059',0,0,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Beekhy','','','','0000-00-00','1996-06-01','0000-00-00',NULL,NULL,NULL,NULL,'2015-02-05 11:55:00',NULL,NULL,1),(47,'X1234','Stanhope, Admin','','',0,'0000-00-00','','','','admin@stanhope.com','','',0,'0','0',0,14,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','','','','','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,'2015-01-30 14:17:07',NULL,NULL,1),(48,'Y007','Yashley Nelson','','',0,'1990-10-07','','','','yashley.latchman@anexman.com','','',0,'0','0',0,4,'',12,0,'YKupYhnWz//XcZIRAfZw9w3pFZ6OtX0aA6FGXnAc4Syab1UXLy4CFsnBuDXchG7FXwXRi01gpPWYk3+qIgRY1w==','Latchman','','','','0000-00-00','0000-00-00','0000-00-00',NULL,NULL,NULL,NULL,'2015-03-18 17:27:26',NULL,NULL,1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_contact_details`
--

DROP TABLE IF EXISTS `employee_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_contact_details` (
  `employee_contact_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `name1` varchar(255) DEFAULT NULL,
  `releationship1` varchar(255) DEFAULT NULL,
  `telephone1` varchar(255) DEFAULT NULL,
  `address1` text,
  `name2` varchar(255) DEFAULT NULL,
  `releationship2` varchar(255) DEFAULT NULL,
  `telephone2` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL COMMENT '0000-00-00 00:00:00',
  `updated` timestamp NULL DEFAULT NULL COMMENT '0000-00-00 00:00:00',
  PRIMARY KEY (`employee_contact_details_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_contact_details`
--

LOCK TABLES `employee_contact_details` WRITE;
/*!40000 ALTER TABLE `employee_contact_details` DISABLE KEYS */;
INSERT INTO `employee_contact_details` VALUES (1,8,'','','','','','','','',1,NULL,'2015-04-25 10:14:27',NULL),(2,9,'','','','','','','','',1,NULL,'2015-04-25 10:14:57',NULL),(3,10,'','','','','','','','',1,NULL,'2015-04-25 10:17:02',NULL),(4,11,'','','','','','','','',1,NULL,'2015-04-25 10:20:52',NULL),(5,12,'','','','','','','','',11,NULL,'2015-05-07 06:47:14',NULL);
/*!40000 ALTER TABLE `employee_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_document`
--

DROP TABLE IF EXISTS `employee_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_document` (
  `employee_document_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `identity_card` varchar(255) DEFAULT NULL,
  `eds_form` varchar(255) DEFAULT NULL,
  `other_documents` varchar(255) DEFAULT NULL,
  `employee_documentcol` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `contract` varchar(255) DEFAULT NULL,
  `driving_licence` varchar(255) DEFAULT NULL,
  `certificates_memberships` varchar(255) DEFAULT NULL,
  `personal_questionnaires` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL COMMENT '0000-00-00 00:00:00',
  `updated` timestamp NULL DEFAULT NULL COMMENT '0000-00-00 00:00:00',
  PRIMARY KEY (`employee_document_id`),
  KEY `fk_employee_document_1_idx` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_document`
--

LOCK TABLES `employee_document` WRITE;
/*!40000 ALTER TABLE `employee_document` DISABLE KEYS */;
INSERT INTO `employee_document` VALUES (1,2,'','','','zzzg-32,sec. @#$%^&*()*()_+741063+','','','','','',1,NULL,'2015-04-24 17:00:11',NULL),(2,3,'abc1234567891','abc1234567891','abc1234567891','Delhi','abc1234567891','abc1234567891','abc1234567891','abc1234567891','',2,NULL,'2015-04-24 17:07:41',NULL),(3,4,'','','','','','','','','',2,NULL,'2015-04-24 17:26:10',NULL),(4,5,'','','','','','','','','',2,NULL,'2015-04-24 10:23:26',NULL),(5,6,'','','','','','','','','',2,NULL,'2015-04-24 10:29:27',NULL),(6,7,'','','','','','','','','',2,NULL,'2015-04-24 10:36:07',NULL),(7,8,'','','','','','','','','',1,NULL,'2015-04-25 10:14:27',NULL),(8,9,'','','','','','','','','',1,NULL,'2015-04-25 10:14:57',NULL),(9,10,'','','','','','','','','',1,NULL,'2015-04-25 10:17:02',NULL),(10,11,'','','','','','','','','',1,NULL,'2015-04-25 10:20:52',NULL),(11,12,'','','','','','','','','',11,NULL,'2015-05-07 06:47:14',NULL);
/*!40000 ALTER TABLE `employee_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_job_detail`
--

DROP TABLE IF EXISTS `employee_job_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_job_detail` (
  `employee_job_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `pormotion_date` date DEFAULT NULL,
  `special_remarks` text,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL COMMENT '0000-00-00 00:00:00',
  `updated` timestamp NULL DEFAULT NULL COMMENT '0000-00-00 00:00:00',
  PRIMARY KEY (`employee_job_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_job_detail`
--

LOCK TABLES `employee_job_detail` WRITE;
/*!40000 ALTER TABLE `employee_job_detail` DISABLE KEYS */;
INSERT INTO `employee_job_detail` VALUES (2,9,'','0000-00-00','',1,NULL,'2015-04-25 10:14:57',NULL),(19,8,'','0000-00-00','',NULL,NULL,NULL,NULL),(27,11,'','0000-00-00','',NULL,NULL,NULL,NULL),(28,10,'','0000-00-00','',NULL,NULL,NULL,NULL),(29,12,'','0000-00-00','',11,NULL,'2015-05-07 06:47:14',NULL);
/*!40000 ALTER TABLE `employee_job_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_leaves`
--

DROP TABLE IF EXISTS `employee_leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_leaves` (
  `employee_leave_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `leave_type_id` int(11) DEFAULT NULL,
  `from_date` date NOT NULL,
  `from_session` int(11) NOT NULL DEFAULT '1',
  `to_date` date NOT NULL,
  `to_session` int(11) NOT NULL DEFAULT '2',
  `number_of_days` float NOT NULL DEFAULT '0',
  `manager_id` int(11) NOT NULL,
  `cc_to` text CHARACTER SET latin1 NOT NULL,
  `reason` text CHARACTER SET latin1 NOT NULL,
  `contact_details` text CHARACTER SET latin1 NOT NULL,
  `status` enum('Pending','Approved','Rejected') CHARACTER SET latin1 NOT NULL DEFAULT 'Pending',
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `manage_comment` text CHARACTER SET latin1 NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NULL DEFAULT NULL COMMENT '0000-00-00 00:00:00',
  PRIMARY KEY (`employee_leave_id`,`created`),
  KEY `fk1_leave_type_id` (`leave_type_id`),
  CONSTRAINT `fk1_leave_type_id` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_category` (`leave_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_leaves`
--

LOCK TABLES `employee_leaves` WRITE;
/*!40000 ALTER TABLE `employee_leaves` DISABLE KEYS */;
INSERT INTO `employee_leaves` VALUES (1,8,1,'2015-04-27',1,'2015-04-27',2,1,10,'','','','Approved',8,NULL,'','2015-04-25 06:21:44',NULL),(2,8,2,'2015-04-28',1,'2015-04-29',2,2,10,'','','','Approved',8,NULL,'','2015-04-25 06:22:08',NULL),(3,10,1,'2015-04-30',1,'2015-04-30',2,1,10,'','','','Approved',10,NULL,'','2015-04-25 06:25:08',NULL),(6,8,1,'2015-04-07',1,'2015-04-10',2,4,10,'','','','Approved',8,NULL,'','2015-04-25 06:41:41',NULL),(8,8,1,'2015-04-04',1,'2015-04-06',2,2,10,'','','','Approved',8,NULL,'','2015-04-25 06:44:31',NULL),(11,8,1,'2015-04-24',1,'2015-04-26',2,3,10,'','vsdvSDVSDVSDV','','Rejected',8,NULL,'','2015-04-25 06:57:01',NULL);
/*!40000 ALTER TABLE `employee_leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_medical_insurance`
--

DROP TABLE IF EXISTS `employee_medical_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_medical_insurance` (
  `employee_medical_insurance_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `medical_plan` varchar(255) DEFAULT NULL,
  `medical_paln_joined` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL COMMENT '0000-00-00 00:00:00',
  `updated` timestamp NULL DEFAULT NULL COMMENT '0000-00-00 00:00:00',
  PRIMARY KEY (`employee_medical_insurance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_medical_insurance`
--

LOCK TABLES `employee_medical_insurance` WRITE;
/*!40000 ALTER TABLE `employee_medical_insurance` DISABLE KEYS */;
INSERT INTO `employee_medical_insurance` VALUES (2,9,'','0000-00-00',1,NULL,'2015-04-25 10:14:57',NULL),(19,8,'','2015-04-25',NULL,NULL,NULL,NULL),(27,11,'','2015-04-25',NULL,NULL,NULL,NULL),(28,10,'','2015-04-25',NULL,NULL,NULL,NULL),(29,12,'','0000-00-00',11,NULL,'2015-05-07 06:47:14',NULL);
/*!40000 ALTER TABLE `employee_medical_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_pension_insurance`
--

DROP TABLE IF EXISTS `employee_pension_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_pension_insurance` (
  `employee_medical_insurance_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `pension_plan` varchar(255) DEFAULT NULL,
  `pension_join_date` date DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`employee_medical_insurance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_pension_insurance`
--

LOCK TABLES `employee_pension_insurance` WRITE;
/*!40000 ALTER TABLE `employee_pension_insurance` DISABLE KEYS */;
INSERT INTO `employee_pension_insurance` VALUES (2,9,'','0000-00-00',NULL,1,'2015-04-25 10:14:57',NULL),(19,8,'','2015-04-25',NULL,NULL,NULL,NULL),(27,11,'','2015-04-25',NULL,NULL,NULL,NULL),(28,10,'','2015-04-25',NULL,NULL,NULL,NULL),(29,12,'','0000-00-00',NULL,11,'2015-05-07 06:47:14',NULL);
/*!40000 ALTER TABLE `employee_pension_insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_training`
--

DROP TABLE IF EXISTS `employee_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee_training` (
  `employee_training_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `offered_by` varchar(255) DEFAULT NULL,
  `cpd_points` varchar(255) DEFAULT NULL,
  `training_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL COMMENT '0000-00-00 00:00:00',
  `updated` timestamp NULL DEFAULT NULL COMMENT '0000-00-00 00:00:00',
  PRIMARY KEY (`employee_training_id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_training`
--

LOCK TABLES `employee_training` WRITE;
/*!40000 ALTER TABLE `employee_training` DISABLE KEYS */;
INSERT INTO `employee_training` VALUES (23,5,'','','','','0000-00-00',NULL,NULL,NULL,NULL),(24,6,'','','','','0000-00-00',2,NULL,'2015-04-24 10:29:27',NULL),(27,7,'','','','','0000-00-00',NULL,NULL,NULL,NULL),(45,2,'','','','','0000-00-00',NULL,NULL,NULL,NULL),(53,4,'','','','','0000-00-00',NULL,NULL,NULL,NULL),(54,3,'abc123456789','abc123456789','abc123456789','abc123456789','2015-04-23',NULL,NULL,NULL,NULL),(55,3,'','','','','0000-00-00',NULL,NULL,NULL,NULL),(57,9,'','','','','0000-00-00',1,NULL,'2015-04-25 10:14:57',NULL),(74,8,'','','','','0000-00-00',NULL,NULL,NULL,NULL),(82,11,'','','','','0000-00-00',NULL,NULL,NULL,NULL),(83,10,'','','','','0000-00-00',NULL,NULL,NULL,NULL),(84,12,'','','','','0000-00-00',11,NULL,'2015-05-07 06:47:14',NULL);
/*!40000 ALTER TABLE `employee_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,1,'Added Company','Clavis has been added.','2015-04-25 05:04:27'),(2,1,'Updated Company','Clavis1 has been updated.','2015-04-25 05:04:41'),(3,1,'Updated Company','Clavis has been updated.','2015-04-25 05:04:58'),(4,1,'Updated Company','Clavis has been updated.','2015-04-25 05:05:13'),(5,1,'Added Company','HCL has been added.','2015-04-25 05:05:31'),(6,1,'Added Company','Vodafone has been added.','2015-04-25 05:06:13'),(7,1,'Added Company','Airtel has been added.','2015-04-25 05:06:31'),(8,1,'Added Activity','Activity 1 has been added.','2015-04-25 05:06:54'),(9,1,'Added Activity','Activity 2 has been added.','2015-04-25 05:07:12'),(10,1,'Added Activity','Activity 3 has been added.','2015-04-25 05:07:24'),(11,1,'Added Sub-Activity','Sub 1 has been added.','2015-04-25 05:07:41'),(12,1,'Added Sub-Activity','Sub 2 has been added.','2015-04-25 05:07:55'),(13,1,'Added Sub-Activity','Sub 3 has been added.','2015-04-25 05:08:12'),(14,1,'Updated Sub-Activity','Sub 3 has been updated.','2015-04-25 05:08:39'),(15,1,'Added Team','Team 1 has been added.','2015-04-25 05:23:22'),(16,1,'Added Team','Team 2 has been added.','2015-04-25 05:23:37'),(17,1,'Added Team','Team has been added.','2015-04-25 05:23:54'),(18,1,'Added Client','Client 1 has been added.','2015-04-25 05:24:35'),(19,1,'Added Client','The Cricket Ground Trustees Co Ltd has been added.','2015-04-25 05:25:27'),(20,1,'Updated Team','Team 3 has been updated.','2015-04-25 05:25:39'),(21,1,'Added Client','Mangrovia Developments Ltd has been added.','2015-04-25 05:25:41'),(22,1,'Added Client','Owners United Ltd has been added.','2015-04-25 05:26:11'),(23,1,'Added Client','Sphere Media has been added.','2015-04-25 05:26:25'),(24,1,'Added Project','Project 1 has been added.','2015-04-25 05:27:36'),(25,1,'Added Project','Project 2 has been added.','2015-04-25 05:27:51'),(26,1,'Added Project','Project 3 has been added.','2015-04-25 05:28:12'),(27,1,'Added Project','Project 4 has been added.','2015-04-25 05:28:29'),(28,1,'Added Task','Task 1 has been added.','2015-04-25 05:28:51'),(29,1,'Added Task','Task 2 has been added.','2015-04-25 05:29:18'),(30,1,'Updated Activity','o	Administration has been updated.','2015-04-25 05:29:36'),(31,1,'Added Task','Task 3 has been added.','2015-04-25 05:29:41'),(32,1,'Updated Activity','Administration has been updated.','2015-04-25 05:29:52'),(33,1,'Added Department','QA has been added.','2015-04-25 05:29:53'),(34,1,'Deleted Activity','Activity deleted.','2015-04-25 05:29:59'),(35,1,'Added Department','Dev has been added.','2015-04-25 05:30:10'),(36,1,'Updated Activity','Set Up- has been updated.','2015-04-25 05:30:12'),(37,1,'Added Department','Designer has been added.','2015-04-25 05:30:27'),(38,1,'Added Activity','Legal- has been added.','2015-04-25 05:30:30'),(39,1,'Added Activity','Compliance has been added.','2015-04-25 05:30:42'),(40,1,'Updated Sub-Activity','Company set up; has been updated.','2015-04-25 05:32:08'),(41,1,'Updated Sub-Activity','Account Opening; has been updated.','2015-04-25 05:32:26'),(42,1,'Added Sub-Activity','Tax Filling; has been added.','2015-04-25 05:32:40'),(43,1,'Updated Sub-Activity','Bank reconciliation; has been updated.','2015-04-25 05:33:08'),(44,1,'Updated Task','Task 1 has been updated.','2015-04-25 05:33:57'),(45,1,'Updated Task','Task 2 has been updated.','2015-04-25 05:34:10'),(46,1,'Updated Task','Task 3 has been updated.','2015-04-25 05:34:21'),(47,1,'Updated Team','Team 3 has been updated.','2015-04-25 05:35:00'),(48,11,'Updated Project','Project 1 has been updated.','2015-04-25 05:42:05'),(49,8,'Added Timesheet','Added Timesheet of Shiju.','2015-04-25 05:42:35'),(50,8,'Added Timesheet','Added Timesheet of Shiju.','2015-04-25 05:43:32'),(51,8,'Added Timesheet','Added Timesheet of Shiju.','2015-04-25 05:43:39'),(52,11,'Updated Team','Team 1 has been updated.','2015-04-25 05:52:06'),(53,8,'Added Timesheet','Added Timesheet of Shiju.','2015-04-25 05:53:22'),(54,10,'Added Timesheet','Added Timesheet of deepanshu.','2015-04-25 05:53:27'),(55,8,'Timesheet Status','Submitted Timesheet of Shiju.','2015-04-25 05:54:52'),(56,10,'Added Timesheet','Added Timesheet of deepanshu.','2015-04-25 05:55:23'),(57,10,'Updated Timesheet','Updated Timesheet of deepanshu.','2015-04-25 05:55:57'),(58,8,'Updated Timesheet','Updated Timesheet of Shiju.','2015-04-25 05:56:01'),(59,8,'Updated Timesheet','Updated Timesheet of Shiju.','2015-04-25 05:56:36'),(60,10,'Added Timesheet','Added Timesheet of deepanshu.','2015-04-25 05:56:45'),(61,8,'Deleted Timesheet','Deleted Timesheet of Shiju.','2015-04-25 05:56:50'),(62,10,'Added Timesheet','Added Timesheet of deepanshu.','2015-04-25 05:57:14'),(63,10,'Timesheet Status','Submitted Timesheet of deepanshu.','2015-04-25 05:59:17'),(64,8,'Added Timesheet','Added Timesheet of Shiju.','2015-04-25 06:01:00'),(65,10,'Added Timesheet','Added Timesheet of deepanshu.','2015-04-25 06:01:25'),(66,10,'Added Timesheet','Added Timesheet of deepanshu.','2015-04-25 06:02:00'),(67,10,'Added Timesheet','Added Timesheet of deepanshu.','2015-04-25 06:02:00'),(68,10,'Timesheet Status','Submitted Timesheet of deepanshu.','2015-04-25 06:02:33'),(69,10,'Added Timesheet','Added Timesheet of deepanshu.','2015-04-25 06:02:46'),(70,8,'Added Timesheet','Added Timesheet of Shiju.','2015-04-25 06:03:40'),(71,11,'Timesheet Status','Approved Timesheet of s jacob.','2015-04-25 06:05:05'),(72,11,'Timesheet Status','Rejected Timesheet of s jacob.','2015-04-25 06:05:25'),(73,10,'Timesheet Status','Submitted Timesheet of deepanshu.','2015-04-25 06:07:25'),(74,10,'Timesheet Status','Submitted Timesheet of deepanshu.','2015-04-25 06:07:52'),(75,11,'Timesheet Status','Rejected Timesheet of s jacob.','2015-04-25 06:08:32'),(76,10,'Timesheet Status','Submitted Timesheet of deepanshu.','2015-04-25 06:09:07'),(77,10,'Timesheet Status','Submitted Timesheet of deepanshu.','2015-04-25 06:09:56'),(78,10,'Added Timesheet','Added Timesheet of deepanshu.','2015-04-25 06:10:49'),(79,8,'Timesheet Status','Submitted Timesheet of Shiju.','2015-04-25 06:11:58'),(80,10,'Timesheet Status','Approved Timesheet of deepanshu.','2015-04-25 06:12:27'),(81,11,'Added Holiday','holiday 1 has been added.','2015-04-25 06:14:01'),(82,11,'Added Holiday','Holiday 2 has been added.','2015-04-25 06:14:20'),(83,11,'Added Holiday','csdc has been added.','2015-04-25 06:14:39'),(84,11,'Added Leave type','Annual Type has been added.','2015-04-25 06:15:12'),(85,11,'Added Leave type','Sick Leave has been added.','2015-04-25 06:15:33'),(86,11,'Added Leave type','Exam Leave has been added.','2015-04-25 06:15:53'),(87,8,'Leave apply','Shiju leave apply.','2015-04-25 06:21:45'),(88,8,'Leave apply','Shiju leave apply.','2015-04-25 06:22:09'),(89,10,'Leave apply','deepanshu leave apply.','2015-04-25 06:25:09'),(90,11,'Updated Leave type','Annual Type has been updated.','2015-04-25 06:25:32'),(91,10,'Leave apply','deepanshu leave apply.','2015-04-25 06:26:04'),(92,10,'Added Timesheet','Added Timesheet of deepanshu.','2015-04-25 06:38:58'),(93,8,'Leave apply','Shiju leave apply.','2015-04-25 06:41:18'),(94,8,'Leave apply','Shiju leave apply.','2015-04-25 06:41:42'),(95,8,'Leave apply','Shiju leave apply.','2015-04-25 06:41:58'),(96,8,'Deleted leave','Leave withdraw successfully.','2015-04-25 06:43:30'),(97,11,'Added Timesheet','Added Timesheet of s jacob.','2015-04-25 06:44:25'),(98,8,'Leave apply','Shiju leave apply.','2015-04-25 06:44:33'),(99,8,'Deleted leave','Leave withdraw successfully.','2015-04-25 06:46:34'),(100,11,'Added Timesheet','Added Timesheet of s jacob.','2015-04-25 06:48:42'),(101,8,'Leave apply','Shiju leave apply.','2015-04-25 06:55:13'),(102,8,'Deleted leave','Leave withdraw successfully.','2015-04-25 06:55:47'),(103,8,'Leave apply','Shiju leave apply.','2015-04-25 06:56:15'),(104,8,'Deleted leave','Leave withdraw successfully.','2015-04-25 06:56:54'),(105,8,'Leave apply','Shiju leave apply.','2015-04-25 06:57:02'),(106,11,'Leave status','Leave Approved successfully.','2015-04-25 06:57:47'),(107,11,'Leave status','Leave Approved successfully.','2015-04-25 06:57:56'),(108,11,'Leave status','Leave Approved successfully.','2015-04-25 06:58:06'),(109,11,'Leave status','Leave Approved successfully.','2015-04-25 06:58:16'),(110,11,'Leave status','Leave Rejected successfully.','2015-04-25 06:58:36'),(111,11,'Leave status','Leave Approved successfully.','2015-04-25 07:03:26'),(112,8,'Added Timesheet','Added Timesheet of Shiju.','2015-04-29 07:39:00'),(113,8,'Updated Timesheet','Updated Timesheet of Shiju.','2015-04-29 07:42:16'),(114,8,'Added Timesheet','Added Timesheet of Shiju.','2015-04-29 07:43:02'),(115,8,'Timesheet Status','Submitted Timesheet of Shiju.','2015-04-29 07:44:47'),(116,10,'Timesheet Status','Approved Timesheet of deepanshu.','2015-04-29 07:51:15'),(117,8,'Added Timesheet','Added Timesheet of Shiju.','2015-04-29 07:52:36'),(118,11,'Added Timesheet','Added Timesheet of s jacob.','2015-05-06 02:12:11'),(119,10,'Added Timesheet','Added Timesheet of deepanshu.','2015-05-06 02:21:12'),(120,10,'Added Timesheet','Added Timesheet of deepanshu.','2015-05-06 02:22:28'),(121,11,'Added Client','ABC co. LTD has been added.','2015-05-07 01:35:00'),(122,11,'Added Client','ss has been added.','2015-09-29 12:31:52'),(123,11,'Added Client','Noida Client has been added.','2015-09-29 12:37:45'),(124,11,'Updated Client','ABC co. LTD has been updated.','2015-09-29 06:39:34'),(125,11,'Updated Client','Client 1 has been updated.','2015-09-29 06:39:45');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `holiday`
--

DROP TABLE IF EXISTS `holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `holiday` (
  `holiday_id` int(11) NOT NULL AUTO_INCREMENT,
  `holiday_date` date NOT NULL,
  `holiday_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `holiday`
--

LOCK TABLES `holiday` WRITE;
/*!40000 ALTER TABLE `holiday` DISABLE KEYS */;
INSERT INTO `holiday` VALUES (1,'2015-04-23','holiday 1',11,0,'2015-04-25 06:14:01','0000-00-00 00:00:00'),(2,'2015-04-28','Holiday 2',11,0,'2015-04-25 06:14:20','0000-00-00 00:00:00'),(3,'2014-02-04','csdc',11,0,'2015-04-25 06:14:39','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_category`
--

DROP TABLE IF EXISTS `leave_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_category` (
  `leave_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `legend` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `weekend_check` tinyint(2) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`leave_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_category`
--

LOCK TABLES `leave_category` WRITE;
/*!40000 ALTER TABLE `leave_category` DISABLE KEYS */;
INSERT INTO `leave_category` VALUES (1,'Annual Type','AL',1,11,11,'2015-04-25 06:15:11','2015-04-25 06:25:32'),(2,'Sick Leave','SL',0,11,NULL,'2015-04-25 06:15:33',NULL),(3,'Exam Leave','EL',0,11,NULL,'2015-04-25 06:15:53',NULL);
/*!40000 ALTER TABLE `leave_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_employee_details`
--

DROP TABLE IF EXISTS `leave_employee_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_employee_details` (
  `leave_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `no_of_leaves` float NOT NULL DEFAULT '0',
  `leave_type_id` int(11) NOT NULL DEFAULT '0',
  `year` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `balance_leave` float NOT NULL DEFAULT '0',
  `last_year_forward_leaves` float NOT NULL DEFAULT '0',
  `log_data` blob,
  PRIMARY KEY (`leave_id`),
  KEY `fk_leave_type_id` (`leave_type_id`),
  CONSTRAINT `fk_leave_type_id` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_category` (`leave_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_employee_details`
--

LOCK TABLES `leave_employee_details` WRITE;
/*!40000 ALTER TABLE `leave_employee_details` DISABLE KEYS */;
INSERT INTO `leave_employee_details` VALUES (1,10,10,1,'2015',9,0,'[\"The No of Days Added on 2015-04-25 06:16:42 by user( EMPID ) 11 is 10\"]'),(2,11,10,1,'2015',10,0,'[\"The No of Days Added on 2015-04-25 06:16:42 by user( EMPID ) 11 is 10\"]'),(3,8,10,1,'2015',3,0,'[\"The No of Days Added on 2015-04-25 06:16:42 by user( EMPID ) 11 is 10\"]'),(4,10,10,2,'2015',10,0,'[\"The No of Days Added on 2015-04-25 06:17:03 by user( EMPID ) 11 is 10\"]'),(5,8,10,2,'2015',8,0,'[\"The No of Days Added on 2015-04-25 06:17:03 by user( EMPID ) 11 is 10\"]'),(6,11,5,3,'2015',5,0,'[\"The No of Days Added on 2015-04-25 06:17:21 by user( EMPID ) 11 is 5\"]'),(7,12,0,1,'2015',0,0,'[\"The No of Days Added on 2015-05-07 01:47:14 by user( EMPID ) 12 is 0 \"]'),(8,12,0,3,'2015',0,0,'[\"The No of Days Added on 2015-05-07 01:47:14 by user( EMPID ) 12 is 0 \"]'),(9,12,0,2,'2015',0,0,'[\"The No of Days Added on 2015-05-07 01:47:14 by user( EMPID ) 12 is 0 \"]');
/*!40000 ALTER TABLE `leave_employee_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `licence_type`
--

DROP TABLE IF EXISTS `licence_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `licence_type` (
  `licence_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `licence_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`licence_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `licence_type`
--

LOCK TABLES `licence_type` WRITE;
/*!40000 ALTER TABLE `licence_type` DISABLE KEYS */;
INSERT INTO `licence_type` VALUES (1,'CIS'),(2,'Closed-end Fund'),(3,'Investment Adviser'),(4,'CIS Manager'),(5,'Licences under Part IV of the FSA 07');
/*!40000 ALTER TABLE `licence_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `emp_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL,
  `message` varchar(255) CHARACTER SET latin1 NOT NULL,
  `time_of_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `empId` (`emp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (0,'Timesheet Submitted','A0111 has Submitted the Timesheet for the week of 2015-04-19','2015-04-25 10:54:51'),(0,'Timesheet Submitted','A007 has Submitted the Timesheet for the week of 2015-04-19','2015-04-25 10:59:17'),(0,'Timesheet Submitted','A007 has Submitted the Timesheet for the week of 2015-03-15','2015-04-25 11:02:32'),(0,'Timesheet Submitted',' The timesheet submitted by you for the week of 2015-04-19 has been approved by your manager. ','2015-04-25 11:05:04'),(0,'Timesheet Rejected',' The timesheet submitted by you for the week of 2015-04-19 has been rejected by your manager. ','2015-04-25 11:05:24'),(0,'Timesheet Submitted','A007 has Submitted the Timesheet for the week of 2015-04-19','2015-04-25 11:07:25'),(0,'Timesheet Submitted','A007 has Submitted the Timesheet for the week of 2015-04-26','2015-04-25 11:07:52'),(0,'Timesheet Rejected',' The timesheet submitted by you for the week of 2015-03-15 has been rejected by your manager. ','2015-04-25 11:08:31'),(0,'Timesheet Submitted','A007 has Submitted the Timesheet for the week of 2015-03-15','2015-04-25 11:09:06'),(0,'Timesheet Submitted','A007 has Submitted the Timesheet for the week of 2014-12-14','2015-04-25 11:09:56'),(0,'Timesheet Submitted','A0111 has Submitted the Timesheet for the week of 2015-03-29','2015-04-25 11:11:58'),(0,'Timesheet Submitted',' The timesheet submitted by you for the week of 2015-03-29 has been approved by your manager. ','2015-04-25 11:12:27'),(10,'Timesheet Submitted','A0111 has Submitted the Timesheet for the week of 2015-05-10','2015-04-29 12:44:45'),(0,'Timesheet Submitted',' The timesheet submitted by you for the week of 2015-05-10 has been approved by your manager. ','2015-04-29 12:51:13');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Project 1','Client 1','JPY',1,11,'2015-04-25 05:27:36','2015-04-25 05:42:05'),(2,'Project 2','Mangrovia Developments Ltd','HKD',1,NULL,'2015-04-25 05:27:51','0000-00-00 00:00:00'),(3,'Project 3','Owners United Ltd','NZD',1,NULL,'2015-04-25 05:28:12','0000-00-00 00:00:00'),(4,'Project 4','Sphere Media','NZD',1,NULL,'2015-04-25 05:28:29','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_activity`
--

DROP TABLE IF EXISTS `sub_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_activity` (
  `subactivity_id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(255) NOT NULL,
  `subactivity_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`subactivity_id`),
  KEY `FK_sub_activity` (`activity_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_activity`
--

LOCK TABLES `sub_activity` WRITE;
/*!40000 ALTER TABLE `sub_activity` DISABLE KEYS */;
INSERT INTO `sub_activity` VALUES (1,'Administration','Company set up;',1,1,'2015-04-25 05:07:41','2015-04-25 05:32:08'),(2,'Compliance','Account Opening;',1,1,'2015-04-25 05:07:55','2015-04-25 05:32:26'),(3,'Set Up-','Bank reconciliation;',1,1,'2015-04-25 05:08:12','2015-04-25 05:33:07'),(4,'Legal-','Tax Filling;',1,NULL,'2015-04-25 05:32:40','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `sub_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `team_name` varchar(255) DEFAULT NULL,
  `expense` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `activity_name` varchar(255) DEFAULT NULL,
  `subactivity_name` varchar(255) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`task_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'Task 1','Team 1','1233','Administration','Company set up;',1,1,'2015-04-25 10:33:57','2015-04-25 10:33:57'),(2,'Task 2','Team 2','65121','Compliance','Account Opening;',1,1,'2015-04-25 10:34:10','2015-04-25 10:34:10'),(3,'Task 3','Team 3','12541','Legal-','Tax Filling;',1,1,'2015-04-25 10:34:21','2015-04-25 10:34:21');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `employee_id` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `show_client` int(11) DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Team 1','10',1,'11','1','2015-04-25 10:23:22','2015-04-25 10:52:06'),(2,'Team 2','11',0,NULL,'1','2015-04-25 10:23:37',NULL),(3,'Team 3','11',0,'1','1','2015-04-25 10:23:54','2015-04-25 10:35:00');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheet`
--

DROP TABLE IF EXISTS `timesheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timesheet` (
  `timesheet_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) NOT NULL,
  `timesheet_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `client_name` varchar(255) DEFAULT NULL,
  `activity_name` varchar(255) DEFAULT NULL,
  `subactivity_name` varchar(255) DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `billable` tinyint(4) DEFAULT NULL,
  `time_units` int(11) DEFAULT NULL,
  `comments` text,
  `time_status` enum('Pending','Approved','Rejected','Submitted') DEFAULT 'Pending',
  `reason_to_reject` text,
  `project_name` varchar(255) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `disbursement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`timesheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheet`
--

LOCK TABLES `timesheet` WRITE;
/*!40000 ALTER TABLE `timesheet` DISABLE KEYS */;
INSERT INTO `timesheet` VALUES (2,8,'2015-04-19','00:00:00','03:00:00','Mangrovia Developments Ltd','Compliance','Account Opening;','Task 2',0,12,'dedededede','Approved','','Project 2',8,8,'2015-04-25 05:43:32','2015-04-25 05:56:01',''),(3,8,'2015-04-23','02:00:00','03:45:00','Client 1','Compliance','Account Opening;','Task 2',0,7,'Description is very long shiju','Approved','','Project 1',8,8,'2015-04-25 05:43:39','2015-04-25 05:56:36',''),(4,8,'2015-04-22','02:00:00','05:00:00','The Cricket Ground Trustees Co Ltd','Set Up-','Bank reconciliation;','0',1,12,'','Approved','','0',8,NULL,'2015-04-25 05:53:22',NULL,''),(5,10,'2015-04-23','00:00:00','03:00:00','Client 1','Compliance','Account Opening;','Task 2',1,12,'','Submitted','','Project 1',10,10,'2015-04-25 05:53:27','2015-04-25 05:55:57','123'),(6,10,'2015-04-19','00:00:00','02:00:00','Mangrovia Developments Ltd','Set Up-','Bank reconciliation;','0',0,8,'','Submitted','','Project 2',10,NULL,'2015-04-25 05:55:23',NULL,'asxasxa'),(7,10,'2015-04-20','00:00:00','02:00:00','Owners United Ltd','Legal-','Tax Filling;','Task 3',0,8,'','Submitted','','Project 3',10,NULL,'2015-04-25 05:56:45',NULL,'dcsadc'),(8,10,'2015-04-21','00:00:00','02:00:00','Sphere Media','Legal-','Tax Filling;','Task 3',0,8,'','Submitted','','Project 4',10,NULL,'2015-04-25 05:57:14',NULL,'sdcasd'),(9,8,'2015-04-29','01:00:00','02:00:00','Sphere Media','Compliance','Account Opening;','Task 2',0,4,'','Pending',NULL,'Project 4',8,NULL,'2015-04-25 06:01:00',NULL,''),(10,10,'2015-04-25','00:00:00','00:15:00','','Administration','Company set up;','Task 1',0,1,'','Submitted','','',10,NULL,'2015-04-25 06:01:25',NULL,''),(11,10,'2015-03-18','00:00:00','00:15:00','','Administration','Company set up;','Task 1',0,1,'','Submitted','','',10,NULL,'2015-04-25 06:01:59',NULL,''),(12,10,'2014-12-17','00:00:00','03:00:00','Client 1','Compliance','Account Opening;','Task 2',0,12,'','Submitted','','Project 1',10,NULL,'2015-04-25 06:02:00',NULL,'ZXZX'),(13,10,'2015-04-28','00:00:00','02:00:00','Sphere Media','Legal-','Tax Filling;','Task 3',0,8,'','Submitted','','Project 4',10,NULL,'2015-04-25 06:02:46',NULL,'asxsx'),(14,8,'2015-04-01','02:00:00','04:00:00','The Cricket Ground Trustees Co Ltd','Set Up-','Bank reconciliation;','0',1,8,'','Approved','','0',8,NULL,'2015-04-25 06:03:40',NULL,''),(15,10,'2015-04-22','00:00:00','02:00:00','Mangrovia Developments Ltd','Administration','Company set up;','Task 1',0,8,'','Submitted',NULL,'Project 2',10,NULL,'2015-04-25 06:10:49',NULL,''),(16,10,'2015-07-01','00:00:00','02:00:00','','Administration','Company set up;','Task 1',0,8,'','Pending',NULL,'',10,NULL,'2015-04-25 06:38:58',NULL,''),(17,11,'2015-04-22','00:00:00','02:00:00','The Cricket Ground Trustees Co Ltd','Set Up-','Bank reconciliation;','0',0,8,'','Pending',NULL,'0',11,NULL,'2015-04-25 06:44:24',NULL,''),(18,11,'2015-04-23','00:00:00','02:00:00','','Set Up-','Bank reconciliation;','0',0,8,'','Pending',NULL,'',11,NULL,'2015-04-25 06:48:42',NULL,''),(19,8,'2015-05-10','01:00:00','03:00:00','Mangrovia Developments Ltd','Compliance','Account Opening;','Task 2',0,8,'While setup the c...','Approved','','Project 2',8,8,'2015-04-29 07:39:00','2015-04-29 07:42:16',''),(20,8,'2015-05-12','02:00:00','03:00:00','Sphere Media','Administration','Company set up;','Task 1',0,4,'','Approved','','Project 4',8,NULL,'2015-04-29 07:43:02',NULL,''),(21,8,'2015-04-14','01:00:00','02:00:00','Mangrovia Developments Ltd','Compliance','Account Opening;','Task 2',0,4,'','Pending',NULL,'Project 2',8,NULL,'2015-04-29 07:52:36',NULL,''),(22,11,'2015-04-27','00:00:00','00:15:00','','Administration','Company set up;','Task 1',0,1,'','Pending',NULL,'',11,NULL,'2015-05-06 02:12:11',NULL,''),(23,10,'2015-04-27','00:00:00','00:15:00','','Administration','Company set up;','Task 1',0,1,'','Submitted',NULL,'',10,NULL,'2015-05-06 02:21:12',NULL,''),(24,10,'2015-03-25','00:00:00','00:15:00','','Administration','Company set up;','Task 1',0,1,'','Pending',NULL,'',10,NULL,'2015-05-06 02:22:27',NULL,'');
/*!40000 ALTER TABLE `timesheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trust_type`
--

DROP TABLE IF EXISTS `trust_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trust_type` (
  `trust_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `trust_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`trust_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trust_type`
--

LOCK TABLES `trust_type` WRITE;
/*!40000 ALTER TABLE `trust_type` DISABLE KEYS */;
INSERT INTO `trust_type` VALUES (1,'Charitable'),(2,'Discretionary'),(3,'Non-discretionary'),(4,'Purpose Trust'),(5,'Other');
/*!40000 ALTER TABLE `trust_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `user_privileges` longtext CHARACTER SET latin1 NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `is_active` enum('Yes','No') CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'Super User','{\"administration_control\":{\"company\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"clients\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"projects\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"activity\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"task\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"team\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"department\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"user\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\",\"user_pdf\":\"1\"},\"report\":{\"View\":\"1\",\"PrintReport\":\"1\",\"ExportExcel\":\"1\"},\"user_role\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\",\"Privileges\":\"1\"}},\"client_database\":{\"database\":{\"download_pdf\":\"0\",\"excel_export\":\"0\",\"view_edit_details\":\"1\"},\"client\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"client_report\":{\"Print\":\"0\",\"ExportExcel\":\"0\",\"View\":\"0\"},\"accounts\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"director\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"shareholder\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"beneficial\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"bank\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"compliance\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"substance\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"occupation\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"trust\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"licence\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"agm\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1}},\"leave_management\":{\"setholidaylist\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"setleaves\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\",\"Forward\":\"0\",\"Grant\":\"0\"},\"manageleave\":{\"View\":\"0\",\"Leave_PDF\":\"0\"},\"applyleave\":{\"View\":\"0\"},\"allemployee\":{\"View\":\"0\"}},\"timesheet\":{\"managetimesheet\":{\"View\":\"0\",\"weekend_submission\":\"0\"},\"timesheet_status\":{\"View\":\"0\"},\"alltimesheet\":{\"View\":\"0\"}},\"dms\":{\"dms\":{\"View\":\"1\"}}}',1,'2015-04-25 04:58:11',2,'2015-03-26 04:25:56','Yes'),(12,'Employee','{\"administration_control\":{\"company\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"clients\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"projects\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"activity\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"task\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"team\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"department\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"user\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\",\"user_pdf\":\"0\"},\"report\":{\"View\":\"0\",\"PrintReport\":\"0\",\"ExportExcel\":\"0\"},\"user_role\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\",\"Privileges\":\"0\"}},\"client_database\":{\"database\":{\"download_pdf\":\"0\",\"excel_export\":\"0\",\"view_edit_details\":\"0\"},\"client\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"client_report\":{\"Print\":\"0\",\"ExportExcel\":\"0\",\"View\":\"0\"},\"accounts\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"director\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"shareholder\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"beneficial\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"bank\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"compliance\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"substance\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"occupation\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"trust\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"licence\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"agm\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1}},\"leave_management\":{\"setholidaylist\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"setleaves\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\",\"Forward\":\"0\",\"Grant\":\"0\"},\"manageleave\":{\"View\":\"1\",\"Leave_PDF\":\"0\"},\"applyleave\":{\"View\":\"1\"},\"allemployee\":{\"View\":\"0\"}},\"timesheet\":{\"managetimesheet\":{\"View\":\"1\",\"weekend_submission\":\"0\"},\"timesheet_status\":{\"View\":\"1\"},\"alltimesheet\":{\"View\":\"0\"}},\"dms\":{\"dms\":{\"View\":\"1\"}}}',1,'2015-04-29 12:41:13',11,'2015-04-29 12:41:13','Yes'),(13,'Admin','{\"administration_control\":{\"company\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"clients\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"projects\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"activity\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"task\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"team\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"department\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"user\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\",\"user_pdf\":\"1\"},\"report\":{\"View\":\"1\",\"PrintReport\":\"1\",\"ExportExcel\":\"1\"},\"user_role\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\",\"Privileges\":\"1\"}},\"client_database\":{\"database\":{\"download_pdf\":\"1\",\"excel_export\":\"1\",\"view_edit_details\":\"1\"},\"client\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"client_report\":{\"Print\":\"1\",\"ExportExcel\":\"1\",\"View\":\"1\"},\"accounts\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"director\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"shareholder\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"beneficial\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"bank\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"compliance\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"substance\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"occupation\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"trust\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"licence\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"agm\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1}},\"leave_management\":{\"setholidaylist\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\"},\"setleaves\":{\"View\":\"1\",\"Add\":\"1\",\"Edit\":\"1\",\"Delete\":\"1\",\"Forward\":\"1\",\"Grant\":\"1\"},\"manageleave\":{\"View\":\"1\",\"Leave_PDF\":\"1\"},\"applyleave\":{\"View\":\"1\"},\"allemployee\":{\"View\":\"1\"}},\"timesheet\":{\"managetimesheet\":{\"View\":\"1\",\"weekend_submission\":\"1\"},\"timesheet_status\":{\"View\":\"1\"},\"alltimesheet\":{\"View\":\"1\"}},\"dms\":{\"dms\":{\"View\":\"1\"}}}',1,'2015-04-25 11:15:54',11,'2015-04-25 11:15:54','Yes'),(14,'Manager','{\"administration_control\":{\"company\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"clients\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"projects\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"activity\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"task\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"team\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"department\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"user\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\",\"user_pdf\":\"0\"},\"report\":{\"View\":\"1\",\"PrintReport\":\"1\",\"ExportExcel\":\"1\"},\"user_role\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\",\"Privileges\":\"0\"}},\"client_database\":{\"database\":{\"download_pdf\":\"0\",\"excel_export\":\"0\",\"view_edit_details\":\"0\"},\"client\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"client_report\":{\"Print\":\"0\",\"ExportExcel\":\"0\",\"View\":\"0\"},\"accounts\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"director\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"shareholder\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"beneficial\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"bank\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"compliance\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"substance\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"occupation\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"trust\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"licence\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1},\"agm\":{\"View\":1,\"Add\":1,\"Edit\":1,\"Delete\":1}},\"leave_management\":{\"setholidaylist\":{\"View\":\"1\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\"},\"setleaves\":{\"View\":\"0\",\"Add\":\"0\",\"Edit\":\"0\",\"Delete\":\"0\",\"Forward\":\"0\",\"Grant\":\"0\"},\"manageleave\":{\"View\":\"1\",\"Leave_PDF\":\"1\"},\"applyleave\":{\"View\":\"1\"},\"allemployee\":{\"View\":\"0\"}},\"timesheet\":{\"managetimesheet\":{\"View\":\"1\",\"weekend_submission\":\"0\"},\"timesheet_status\":{\"View\":\"1\"},\"alltimesheet\":{\"View\":\"0\"}},\"dms\":{\"dms\":{\"View\":\"1\"}}}',1,'2015-04-29 12:33:06',11,'2015-04-29 12:33:06','Yes');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-13 12:55:18
