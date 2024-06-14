-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nextcloud
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oc_accounts`
--

DROP TABLE IF EXISTS `oc_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `data` longtext NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts`
--

LOCK TABLES `oc_accounts` WRITE;
/*!40000 ALTER TABLE `oc_accounts` DISABLE KEYS */;
INSERT INTO `oc_accounts` VALUES ('admin','{\"displayname\":{\"value\":\"admin\",\"scope\":\"v2-federated\",\"verified\":\"0\"},\"address\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"website\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"email\":{\"value\":null,\"scope\":\"v2-federated\",\"verified\":\"0\"},\"avatar\":{\"scope\":\"v2-federated\"},\"phone\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"twitter\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"fediverse\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"organisation\":{\"value\":\"\",\"scope\":\"v2-local\"},\"role\":{\"value\":\"\",\"scope\":\"v2-local\"},\"headline\":{\"value\":\"\",\"scope\":\"v2-local\"},\"biography\":{\"value\":\"\",\"scope\":\"v2-local\"},\"profile_enabled\":{\"value\":\"1\"}}');
/*!40000 ALTER TABLE `oc_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_accounts_data`
--

DROP TABLE IF EXISTS `oc_accounts_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `accounts_data_uid` (`uid`),
  KEY `accounts_data_name` (`name`),
  KEY `accounts_data_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts_data`
--

LOCK TABLES `oc_accounts_data` WRITE;
/*!40000 ALTER TABLE `oc_accounts_data` DISABLE KEYS */;
INSERT INTO `oc_accounts_data` VALUES (1,'admin','displayname','admin'),(2,'admin','address',''),(3,'admin','website',''),(4,'admin','email',''),(5,'admin','phone',''),(6,'admin','twitter',''),(7,'admin','fediverse',''),(8,'admin','organisation',''),(9,'admin','role',''),(10,'admin','headline',''),(11,'admin','biography',''),(12,'admin','profile_enabled','1');
/*!40000 ALTER TABLE `oc_accounts_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity`
--

DROP TABLE IF EXISTS `oc_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity` (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `user` varchar(64) DEFAULT NULL,
  `affecteduser` varchar(64) NOT NULL,
  `app` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `subjectparams` longtext NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `messageparams` longtext DEFAULT NULL,
  `file` varchar(4000) DEFAULT NULL,
  `link` varchar(4000) DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activity_id`),
  KEY `activity_user_time` (`affecteduser`,`timestamp`),
  KEY `activity_filter_by` (`affecteduser`,`user`,`timestamp`),
  KEY `activity_filter` (`affecteduser`,`type`,`app`,`timestamp`),
  KEY `activity_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity`
--

LOCK TABLES `oc_activity` WRITE;
/*!40000 ALTER TABLE `oc_activity` DISABLE KEYS */;
INSERT INTO `oc_activity` VALUES (1,1717845635,30,'file_created','admin','admin','files','created_self','[{\"3\":\"\\/Documents\"}]','','[]','/Documents','http://nc.local/index.php/apps/files/?dir=/','files',3),(2,1717845635,30,'file_created','admin','admin','files','created_self','[{\"4\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://nc.local/index.php/apps/files/?dir=/Documents','files',4),(3,1717845635,30,'file_changed','admin','admin','files','changed_self','[{\"4\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://nc.local/index.php/apps/files/?dir=/Documents','files',4),(4,1717845635,30,'file_created','admin','admin','files','created_self','[{\"5\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://nc.local/index.php/apps/files/?dir=/Documents','files',5),(5,1717845635,30,'file_changed','admin','admin','files','changed_self','[{\"5\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://nc.local/index.php/apps/files/?dir=/Documents','files',5),(6,1717845635,30,'file_created','admin','admin','files','created_self','[{\"6\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://nc.local/index.php/apps/files/?dir=/Documents','files',6),(7,1717845635,30,'file_changed','admin','admin','files','changed_self','[{\"6\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://nc.local/index.php/apps/files/?dir=/Documents','files',6),(8,1717845635,30,'file_created','admin','admin','files','created_self','[{\"7\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://nc.local/index.php/apps/files/?dir=/Documents','files',7),(9,1717845635,30,'file_changed','admin','admin','files','changed_self','[{\"7\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://nc.local/index.php/apps/files/?dir=/Documents','files',7),(10,1717845635,30,'file_created','admin','admin','files','created_self','[{\"8\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://nc.local/index.php/apps/files/?dir=/','files',8),(11,1717845635,30,'file_changed','admin','admin','files','changed_self','[{\"8\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://nc.local/index.php/apps/files/?dir=/','files',8),(12,1717845635,30,'file_created','admin','admin','files','created_self','[{\"9\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://nc.local/index.php/apps/files/?dir=/','files',9),(13,1717845636,30,'file_changed','admin','admin','files','changed_self','[{\"9\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://nc.local/index.php/apps/files/?dir=/','files',9),(14,1717845636,30,'file_created','admin','admin','files','created_self','[{\"10\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://nc.local/index.php/apps/files/?dir=/','files',10),(15,1717845636,30,'file_changed','admin','admin','files','changed_self','[{\"10\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://nc.local/index.php/apps/files/?dir=/','files',10),(16,1717845636,30,'file_created','admin','admin','files','created_self','[{\"11\":\"\\/Photos\"}]','','[]','/Photos','http://nc.local/index.php/apps/files/?dir=/','files',11),(17,1717845636,30,'file_created','admin','admin','files','created_self','[{\"12\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',12),(18,1717845636,30,'file_changed','admin','admin','files','changed_self','[{\"12\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',12),(19,1717845636,30,'file_created','admin','admin','files','created_self','[{\"13\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',13),(20,1717845636,30,'file_changed','admin','admin','files','changed_self','[{\"13\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',13),(21,1717845636,30,'file_created','admin','admin','files','created_self','[{\"14\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',14),(22,1717845636,30,'file_changed','admin','admin','files','changed_self','[{\"14\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',14),(23,1717845636,30,'file_created','admin','admin','files','created_self','[{\"15\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',15),(24,1717845636,30,'file_changed','admin','admin','files','changed_self','[{\"15\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',15),(25,1717845637,30,'file_created','admin','admin','files','created_self','[{\"16\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',16),(26,1717845637,30,'file_changed','admin','admin','files','changed_self','[{\"16\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',16),(27,1717845637,30,'file_created','admin','admin','files','created_self','[{\"17\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://nc.local/index.php/apps/files/?dir=/Photos','files',17),(28,1717845637,30,'file_changed','admin','admin','files','changed_self','[{\"17\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://nc.local/index.php/apps/files/?dir=/Photos','files',17),(29,1717845637,30,'file_created','admin','admin','files','created_self','[{\"18\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',18),(30,1717845637,30,'file_changed','admin','admin','files','changed_self','[{\"18\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',18),(31,1717845637,30,'file_created','admin','admin','files','created_self','[{\"19\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',19),(32,1717845637,30,'file_changed','admin','admin','files','changed_self','[{\"19\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',19),(33,1717845637,30,'file_created','admin','admin','files','created_self','[{\"20\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',20),(34,1717845637,30,'file_changed','admin','admin','files','changed_self','[{\"20\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',20),(35,1717845637,30,'file_created','admin','admin','files','created_self','[{\"21\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://nc.local/index.php/apps/files/?dir=/','files',21),(36,1717845637,30,'file_changed','admin','admin','files','changed_self','[{\"21\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://nc.local/index.php/apps/files/?dir=/','files',21),(37,1717845637,30,'file_created','admin','admin','files','created_self','[{\"22\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://nc.local/index.php/apps/files/?dir=/','files',22),(38,1717845637,30,'file_changed','admin','admin','files','changed_self','[{\"22\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://nc.local/index.php/apps/files/?dir=/','files',22),(39,1717845637,30,'file_created','admin','admin','files','created_self','[{\"23\":\"\\/Templates\"}]','','[]','/Templates','http://nc.local/index.php/apps/files/?dir=/','files',23),(40,1717845637,30,'file_created','admin','admin','files','created_self','[{\"24\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',24),(41,1717845637,30,'file_changed','admin','admin','files','changed_self','[{\"24\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',24),(42,1717845637,30,'file_created','admin','admin','files','created_self','[{\"25\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',25),(43,1717845638,30,'file_changed','admin','admin','files','changed_self','[{\"25\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',25),(44,1717845638,30,'file_created','admin','admin','files','created_self','[{\"26\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',26),(45,1717845638,30,'file_changed','admin','admin','files','changed_self','[{\"26\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',26),(46,1717845638,30,'file_created','admin','admin','files','created_self','[{\"27\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',27),(47,1717845638,30,'file_changed','admin','admin','files','changed_self','[{\"27\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',27),(48,1717845638,30,'file_created','admin','admin','files','created_self','[{\"28\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',28),(49,1717845638,30,'file_changed','admin','admin','files','changed_self','[{\"28\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',28),(50,1717845638,30,'file_created','admin','admin','files','created_self','[{\"29\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',29),(51,1717845638,30,'file_changed','admin','admin','files','changed_self','[{\"29\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',29),(52,1717845638,30,'file_created','admin','admin','files','created_self','[{\"30\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',30),(53,1717845638,30,'file_changed','admin','admin','files','changed_self','[{\"30\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',30),(54,1717845638,30,'file_created','admin','admin','files','created_self','[{\"31\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://nc.local/index.php/apps/files/?dir=/Templates','files',31),(55,1717845638,30,'file_changed','admin','admin','files','changed_self','[{\"31\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://nc.local/index.php/apps/files/?dir=/Templates','files',31),(56,1717845638,30,'file_created','admin','admin','files','created_self','[{\"32\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',32),(57,1717845638,30,'file_changed','admin','admin','files','changed_self','[{\"32\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',32),(58,1717845638,30,'file_created','admin','admin','files','created_self','[{\"33\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',33),(59,1717845638,30,'file_changed','admin','admin','files','changed_self','[{\"33\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',33),(60,1717845638,30,'file_created','admin','admin','files','created_self','[{\"34\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://nc.local/index.php/apps/files/?dir=/Templates','files',34),(61,1717845638,30,'file_changed','admin','admin','files','changed_self','[{\"34\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://nc.local/index.php/apps/files/?dir=/Templates','files',34),(62,1717845638,30,'file_created','admin','admin','files','created_self','[{\"35\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',35),(63,1717845639,30,'file_changed','admin','admin','files','changed_self','[{\"35\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',35),(64,1717845639,30,'file_created','admin','admin','files','created_self','[{\"36\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',36),(65,1717845639,30,'file_changed','admin','admin','files','changed_self','[{\"36\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',36),(66,1717845639,30,'file_created','admin','admin','files','created_self','[{\"37\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',37),(67,1717845639,30,'file_changed','admin','admin','files','changed_self','[{\"37\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',37),(68,1717845639,30,'file_created','admin','admin','files','created_self','[{\"38\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',38),(69,1717845639,30,'file_changed','admin','admin','files','changed_self','[{\"38\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',38),(70,1717845639,30,'file_created','admin','admin','files','created_self','[{\"39\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',39),(71,1717845639,30,'file_changed','admin','admin','files','changed_self','[{\"39\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',39),(72,1717845639,30,'file_created','admin','admin','files','created_self','[{\"40\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',40),(73,1717845639,30,'file_changed','admin','admin','files','changed_self','[{\"40\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',40),(74,1717845639,30,'file_created','admin','admin','files','created_self','[{\"41\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://nc.local/index.php/apps/files/?dir=/Templates','files',41),(75,1717845639,30,'file_changed','admin','admin','files','changed_self','[{\"41\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://nc.local/index.php/apps/files/?dir=/Templates','files',41),(76,1717845639,30,'file_created','admin','admin','files','created_self','[{\"42\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://nc.local/index.php/apps/files/?dir=/Templates','files',42),(77,1717845639,30,'file_changed','admin','admin','files','changed_self','[{\"42\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://nc.local/index.php/apps/files/?dir=/Templates','files',42),(78,1717845639,30,'file_created','admin','admin','files','created_self','[{\"43\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',43),(79,1717845639,30,'file_changed','admin','admin','files','changed_self','[{\"43\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',43),(80,1717845639,30,'file_created','admin','admin','files','created_self','[{\"44\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',44),(81,1717845639,30,'file_changed','admin','admin','files','changed_self','[{\"44\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',44),(82,1717845640,30,'file_created','admin','admin','files','created_self','[{\"45\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://nc.local/index.php/apps/files/?dir=/Templates','files',45),(83,1717845640,30,'file_changed','admin','admin','files','changed_self','[{\"45\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://nc.local/index.php/apps/files/?dir=/Templates','files',45),(84,1717845640,30,'file_created','admin','admin','files','created_self','[{\"46\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',46),(85,1717845640,30,'file_changed','admin','admin','files','changed_self','[{\"46\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',46),(86,1717845640,30,'file_created','admin','admin','files','created_self','[{\"47\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',47),(87,1717845640,30,'file_changed','admin','admin','files','changed_self','[{\"47\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',47),(88,1717845640,30,'file_created','admin','admin','files','created_self','[{\"48\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',48),(89,1717845640,30,'file_changed','admin','admin','files','changed_self','[{\"48\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',48),(90,1717845640,30,'file_created','admin','admin','files','created_self','[{\"49\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http://nc.local/index.php/apps/files/?dir=/','files',49),(91,1717845640,30,'file_changed','admin','admin','files','changed_self','[{\"49\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http://nc.local/index.php/apps/files/?dir=/','files',49);
/*!40000 ALTER TABLE `oc_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity_mq`
--

DROP TABLE IF EXISTS `oc_activity_mq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity_mq` (
  `mail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amq_timestamp` int(11) NOT NULL DEFAULT 0,
  `amq_latest_send` int(11) NOT NULL DEFAULT 0,
  `amq_type` varchar(255) NOT NULL,
  `amq_affecteduser` varchar(64) NOT NULL,
  `amq_appid` varchar(32) NOT NULL,
  `amq_subject` varchar(255) NOT NULL,
  `amq_subjectparams` longtext DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mail_id`),
  KEY `amp_user` (`amq_affecteduser`),
  KEY `amp_latest_send_time` (`amq_latest_send`),
  KEY `amp_timestamp_time` (`amq_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity_mq`
--

LOCK TABLES `oc_activity_mq` WRITE;
/*!40000 ALTER TABLE `oc_activity_mq` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_activity_mq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbookchanges`
--

DROP TABLE IF EXISTS `oc_addressbookchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbookchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `addressbookid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `addressbookid_synctoken` (`addressbookid`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbookchanges`
--

LOCK TABLES `oc_addressbookchanges` WRITE;
/*!40000 ALTER TABLE `oc_addressbookchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_addressbookchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbooks`
--

DROP TABLE IF EXISTS `oc_addressbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbooks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addressbook_index` (`principaluri`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbooks`
--

LOCK TABLES `oc_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc_addressbooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_addressbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_appconfig`
--

DROP TABLE IF EXISTS `oc_appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_appconfig` (
  `appid` varchar(32) NOT NULL DEFAULT '',
  `configkey` varchar(64) NOT NULL DEFAULT '',
  `configvalue` longtext DEFAULT NULL,
  `type` int(10) unsigned NOT NULL DEFAULT 2,
  `lazy` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`appid`,`configkey`),
  KEY `ac_lazy_i` (`lazy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_appconfig`
--

LOCK TABLES `oc_appconfig` WRITE;
/*!40000 ALTER TABLE `oc_appconfig` DISABLE KEYS */;
INSERT INTO `oc_appconfig` VALUES ('activity','enabled','yes',2,0),('activity','installed_version','2.21.1',2,0),('activity','types','filesystem',2,0),('backgroundjob','lastjob','13',2,0),('circles','enabled','yes',2,0),('circles','installed_version','29.0.0-dev',2,0),('circles','loopback_tmp_scheme','http',2,0),('circles','maintenance_run','0',2,0),('circles','maintenance_update','{\"3\":1717845778,\"2\":1717845778,\"1\":1717845778}',2,0),('circles','types','filesystem,dav',2,0),('cloud_federation_api','enabled','yes',2,0),('cloud_federation_api','installed_version','1.12.0',2,0),('cloud_federation_api','types','filesystem',2,0),('comments','enabled','yes',2,0),('comments','installed_version','1.19.0',2,0),('comments','types','logging',2,0),('contactsinteraction','enabled','yes',2,0),('contactsinteraction','installed_version','1.10.0',2,0),('contactsinteraction','types','dav',2,0),('core','files_metadata','{\"photos-original_date_time\":{\"value\":null,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-exif\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}',64,1),('core','installedat','1717845628.1243',2,0),('core','lastcron','1717846027',8,0),('core','lastupdatedat','1717845628',8,0),('core','oc.integritycheck.checker','{\"core\":{\"FILE_MISSING\":{\".htaccess\":{\"expected\":\"8f73bca83268566360c55d51fd2d2dc41af8448ec67211c73a5c1d316c8f384065bfdef8f79895a3c38ab4b8be202f9fbfe23482e6ed6cca43c726ba99dfc719\",\"current\":\"\"},\".user.ini\":{\"expected\":\"4843b3217e91f8536cb9b52700efb20300290292cf6286f92794d4cec99df286afeb7dd6c91b1be20bc55eda541eef230a5c5e7dcd46c189edd0ed1e80c6d3f5\",\"current\":\"\"}}}}',64,1),('core','public_files','files_sharing/public.php',2,0),('core','vendor','nextcloud',2,0),('dashboard','enabled','yes',2,0),('dashboard','installed_version','7.9.0',2,0),('dashboard','types','',2,0),('dav','enabled','yes',2,0),('dav','installed_version','1.30.1',2,0),('dav','types','filesystem',2,0),('federatedfilesharing','enabled','yes',2,0),('federatedfilesharing','installed_version','1.19.0',2,0),('federatedfilesharing','types','',2,0),('federation','enabled','yes',2,0),('federation','installed_version','1.19.0',2,0),('federation','types','authentication',2,0),('files','enabled','yes',2,0),('files','installed_version','2.1.0',2,0),('files','types','filesystem',2,0),('files_downloadlimit','enabled','yes',2,0),('files_downloadlimit','installed_version','2.0.0',2,0),('files_downloadlimit','types','',2,0),('files_pdfviewer','enabled','yes',2,0),('files_pdfviewer','installed_version','2.10.0',2,0),('files_pdfviewer','types','',2,0),('files_reminders','enabled','yes',2,0),('files_reminders','installed_version','1.2.0',2,0),('files_reminders','types','',2,0),('files_sharing','enabled','yes',2,0),('files_sharing','installed_version','1.21.0',2,0),('files_sharing','types','filesystem',2,0),('files_trashbin','enabled','yes',2,0),('files_trashbin','installed_version','1.19.0',2,0),('files_trashbin','types','filesystem,dav',2,0),('files_versions','enabled','yes',2,0),('files_versions','installed_version','1.22.0',2,0),('files_versions','types','filesystem,dav',2,0),('firstrunwizard','enabled','yes',2,0),('firstrunwizard','installed_version','2.18.0',2,0),('firstrunwizard','types','logging',2,0),('logreader','enabled','yes',2,0),('logreader','installed_version','2.14.0',2,0),('logreader','types','logging',2,0),('lookup_server_connector','enabled','yes',2,0),('lookup_server_connector','installed_version','1.17.0',2,0),('lookup_server_connector','types','authentication',2,0),('nextcloud_announcements','enabled','yes',2,0),('nextcloud_announcements','installed_version','1.18.0',2,0),('nextcloud_announcements','types','logging',2,0),('notifications','enabled','yes',2,0),('notifications','installed_version','2.17.0',2,0),('notifications','types','logging',2,0),('oauth2','enabled','yes',2,0),('oauth2','installed_version','1.17.0',2,0),('oauth2','types','authentication',2,0),('password_policy','enabled','yes',2,0),('password_policy','installed_version','1.19.0',2,0),('password_policy','types','authentication',2,0),('photos','enabled','yes',2,0),('photos','installed_version','2.5.0',2,0),('photos','types','dav,authentication',2,0),('privacy','enabled','yes',2,0),('privacy','installed_version','1.13.0',2,0),('privacy','types','',2,0),('provisioning_api','enabled','yes',2,0),('provisioning_api','installed_version','1.19.0',2,0),('provisioning_api','types','prevent_group_restriction',2,0),('recommendations','enabled','yes',2,0),('recommendations','installed_version','2.1.0',2,0),('recommendations','types','',2,0),('related_resources','enabled','yes',2,0),('related_resources','installed_version','1.4.0',2,0),('related_resources','types','',2,0),('serverinfo','enabled','yes',2,0),('serverinfo','installed_version','1.19.0',2,0),('serverinfo','types','',2,0),('settings','enabled','yes',2,0),('settings','installed_version','1.12.0',2,0),('settings','types','',2,0),('sharebymail','enabled','yes',2,0),('sharebymail','installed_version','1.19.0',2,0),('sharebymail','types','filesystem',2,0),('support','enabled','yes',2,0),('support','installed_version','1.12.0',2,0),('support','types','session',2,0),('survey_client','enabled','yes',2,0),('survey_client','installed_version','1.17.0',2,0),('survey_client','types','',2,0),('systemtags','enabled','yes',2,0),('systemtags','installed_version','1.19.0',2,0),('systemtags','types','logging',2,0),('text','enabled','yes',2,0),('text','installed_version','3.10.0',2,0),('text','types','dav',2,0),('theming','enabled','yes',2,0),('theming','installed_version','2.4.0',2,0),('theming','types','logging',2,0),('twofactor_backupcodes','enabled','yes',2,0),('twofactor_backupcodes','installed_version','1.18.0',2,0),('twofactor_backupcodes','types','',2,0),('updatenotification','enabled','yes',2,0),('updatenotification','installed_version','1.19.1',2,0),('updatenotification','types','',2,0),('user_status','enabled','yes',2,0),('user_status','installed_version','1.9.0',2,0),('user_status','types','',2,0),('viewer','enabled','yes',2,0),('viewer','installed_version','2.3.0',2,0),('viewer','types','',2,0),('weather_status','enabled','yes',2,0),('weather_status','installed_version','1.9.0',2,0),('weather_status','types','',2,0),('workflowengine','enabled','yes',2,0),('workflowengine','installed_version','2.11.0',2,0),('workflowengine','types','filesystem',2,0);
/*!40000 ALTER TABLE `oc_appconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authorized_groups`
--

DROP TABLE IF EXISTS `oc_authorized_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authorized_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(200) NOT NULL,
  `class` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admindel_groupid_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authorized_groups`
--

LOCK TABLES `oc_authorized_groups` WRITE;
/*!40000 ALTER TABLE `oc_authorized_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_authorized_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authtoken`
--

DROP TABLE IF EXISTS `oc_authtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authtoken` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '',
  `login_name` varchar(255) NOT NULL DEFAULT '',
  `password` longtext DEFAULT NULL,
  `name` longtext NOT NULL DEFAULT '',
  `token` varchar(200) NOT NULL DEFAULT '',
  `type` smallint(5) unsigned DEFAULT 0,
  `remember` smallint(5) unsigned DEFAULT 0,
  `last_activity` int(10) unsigned DEFAULT 0,
  `last_check` int(10) unsigned DEFAULT 0,
  `scope` longtext DEFAULT NULL,
  `expires` int(10) unsigned DEFAULT NULL,
  `private_key` longtext DEFAULT NULL,
  `public_key` longtext DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `password_invalid` tinyint(1) DEFAULT 0,
  `password_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authtoken_token_index` (`token`),
  KEY `authtoken_last_activity_idx` (`last_activity`),
  KEY `authtoken_uid_index` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
INSERT INTO `oc_authtoken` VALUES (1,'admin','admin','nO8/fZSmCPqtqlGQlxTPe3x7Ee4srJIEBqUcS2ZHsh4P0mXpChEq40Gj2dQLziMFYD6jGbPyRdoOBvU9ZUw1h7Eqlj9ePul6t0sIE0UipmHar2PEumjLCcVU5UgxS8uODEZWZIqWq6dHlWNkGvLLsAZ8vMl+8W9WFtNUVRTxXdkeA+bDGRl2/vRzHDAiM1ItNVOTfck/DHGUp+ntmX3Fl+bc4kwrahDCJpUXHJahhdxq4byDz7F//dPD2gnPkf4TPCX2z9OPqroxqF97QtTCweX8hrz45tDA1QZX35d2+IRN9yRytK65q6X2aKrm55AvVIK95yCRcaez4WJIgxoohA==','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36','a1ad1d502320f0808bb57a40a17fd38988a0d7787b36f1ed485ecb00488213eccf079e6f7739dfa5283e008faafbc41985e040ce1fc701df3a2b01db4cda3487',0,0,1717846627,1717846593,NULL,NULL,'7b88e5a7b88ecf23f76b30a27bec563c2b2546c3b7aee02ad1570406901311b9647ceed4f1089aa995fe1a18a9f94c7f3f3d264643b506ba6635a9d9e02db888f87ddb710c8176ee16c5fb428f45c805f7ff62490ecb8ea744a7b16c4fbaf1f21c0202538a393cf0f4e6206589aaca31f5ae66a7dc2916fd150382747ba4c04eb04278605d2eb915c5b640424ced107cb6257ee8a7138ebfe238e6b1ef67ea83d9a256d49ca45a523b4f383543f01ff0936a9cfadce372579614d97123370e86b64a2f29077d1f18249cd4aafabb8138de92b3572298c31f9d0e64f262d074c58d0d516be4ce08b971374744503037d22ffddaf554318c5f526251d86b3cd7efbbc4fd0bf430d37b3b02be9449c1e8dff4536eaea60688c58ba170ebf8b38b1ba6fd2a5bc76ced0b4a79667b33a94c15a31eb9a8b3181ca998a92137349c3d37d0341e6e085cc461f1eb20d1240a7cb321f67e2ff6cf51a6fc5121b6607db7b2f8ffb87d8f388163350690207871e7ca6a28257dc9d5874cd66c360d5ac846d66ac8ec0d24c5704164001717aa584c4545247413aeb8a96edcfb58cb4e079b67dfdeb7d8020fabac2643c35db4d6cdfb15882fa1f98133e40937866f4bc73d7f74bc2d3825022bb4ec6b5fb45b722153516dea7ea10392ed05bacd02575377d45f28d7f0f345b8cd2aeb99218507b143b021e1efba3b58a6c6c6831c28d93d1292f8058280b6622851c1f9277de5698e12f39d63cd963e63e76b000c0962fbc588918926b512f763414192017ed4648a5645b2f88e5322af1cf5442c1e30a63ec8780d9aef05f882659e4bd3b0eca7d31b871194a558d184cacfd13a4250ac67e58a0b6624db616d199aa08eab9947b2afb9a82266cb75897218901c3c65407ae48a85abd0b20ec77a7ffb2ef30b7c0c367167e0eaecbdc9c63027a4caa6803aca496ec795678842f02b5b6333bca17c36b8a2053a79df1f37efffb7dcb58f6623f7912f34f5655c25da1c348359162f5e85013016ffcd8dbfa0c7e90cd70df8c6df9936b80347a9a9c60afbd5ff0e61ff2d3d436b6897cdc6062c670395c83d77dfe268fb33457a9669653c2395a7549031e2deff6d797cc020ffce22fffdb401eb9002e0e3f72108c4ac3aae74072f26d306e2f434dfc7c48f792f76b2491e0e3733d696d337ba72b1d6802024aebdd04b3c5e1c39f372e7f6d63b07660d130c3bae3900d1949f15ae6e5fe3a15c1054169adc87e507e81139208d521ac00329692c22f88b6908a5b422b3e92bb25f5cda39ff246bc6d2dbbd5216fcce88e82d85ccf6c5de8439deb5c9ce7488735138516ba29ccc20be6c2b0b5905c860e17065d3b9ee91c21cdf92bb8d302521849c09ab9a52231e50687549e220be6988906dcd9997b2f88080aa34e7f94fa8c0ecb2792fd66743355ec8435b9cb571b949dcd0dd8515ac66af05d623eda352d40ed60c0c672cd450f1a0d35231a9df9bf1c76a8673f72da7ef6cc782823e9d753414ceea5121c7053b591df618fe409783605a5ad907b88f167605638970fa62402b06456a372af0118513fde06dfb191aa90fc4d1ad48824a16698658cee50205b9df6bda78c299bf94088d49873d13a40799b1fa5f0e8414844ee86870b99e4d9455cb1c1a49c51bdd2da7ee30feb1a7431f24cc4f224b2a0c872d31ee2e341012806b47280a55aea318d9ccb6995e84af1bb43d982f6c2752af32d826b4d051431efe5db55f32f200bded466e1459e04b37dfaee6735ec9cec0c68ae7db9b991f13a1b26af5d7e57dec03a2e75bb04c7aae9d5de540118a5d6c844f691b1a51c605469b9ed3a44bd5c140518140dbbd9c9cc0463333dbafee47de23e38ef54ee98fbf2d5b835de36af792cbcd92a0f7c4281840fea3ee4e06a92d9bc35418648da2aa7ed742c068b85b66750ed3c3eb84e1c8f9a4c4281e5928d887ecf9b9401afb4a120ba7c86db493dee702b6d945161361b7a4e8eb3e15862b0c814695f4a34624ad192baef543f0991da89468ba6ef778f15c59769e9e24be9582574966e461003b3bc1b50ebce18d5c81c1496c8d31324ed98e27808bf55371f536777370d13eedda5f1960fdbd8177ac19b9b19adc70eda31a4afada04b6038cd55e61070ca230d04f4daad96b2bd22a5d7027c25425ae32287ab7e47aecefb1a664309eb726e9d177fe8d5c3a187f26675a7a659856ce2bfb7dd046c142e7e3186266aec013067ca7f92580d92f163347d069c059aedc4a2485e7e4dd80ede54960a14d3362951d1bbac8f13ba70d474f7666f309da1936c89adb98bcfbac23a160456af4130c422dca2715d9fc9c27a9a4031c7ae793e32cec42cb386deaf06f9912a79d772415784f1a292e9fe7f23ac19eececf968f457131dc89c3403f7d2c0|8a2cba37f8a3ee9d2839e99ab56aeb3d|e380e6a96154a18ab5feb8dd6179a67d22291292d73768c23492741dc201fe7bf747581425e8e80b446e6fea29ed921b3726bc0dea0a3aa193a2b6b689e671bf|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuTAu4AT3pJj4XGNotuYT\noBo27grigPcMc6Gj+ZUsh+n+zUsdgMOEScDqL0C3RRPW9XlQkBqYWiNgqZBFq9Wx\nO9scbK7zCkJvUv0ChnPJFIq9tAMj8Vq65l4AJd4qGVHvzD8yJzRORKsGZs3dO8OH\nLCd3hQmQxObATng/6ertEE9ermi/bijnOnULH9oJQaDLLRCdgXXMMpYBmdLI9SDL\nQPZTr4AllOoM5LxZBxjqPDRBKQkpOagrjfYo8eR0T31BkkOt0KeGBMQKsDsTxg8x\n0aV1pTcZkuAK5pVBwWQb6T0QyighT8CVUpL7Oc99ARE4lw8ndL2NVs0eYTYGf80Y\ncQIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'3|$argon2id$v=19$m=65536,t=4,p=1$cnZkdDB2Z2lZSmxYYTF3dA$bzZw8657ZZ8ge/bLnCbgyW9g31tunIY8Ht9lZWgzv48');
/*!40000 ALTER TABLE `oc_authtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_bruteforce_attempts`
--

DROP TABLE IF EXISTS `oc_bruteforce_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_bruteforce_attempts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL DEFAULT '',
  `occurred` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `bruteforce_attempts_ip` (`ip`),
  KEY `bruteforce_attempts_subnet` (`subnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_bruteforce_attempts`
--

LOCK TABLES `oc_bruteforce_attempts` WRITE;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_invitations`
--

DROP TABLE IF EXISTS `oc_calendar_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `recurrenceid` varchar(255) DEFAULT NULL,
  `attendee` varchar(255) NOT NULL,
  `organizer` varchar(255) NOT NULL,
  `sequence` bigint(20) unsigned DEFAULT NULL,
  `token` varchar(60) NOT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_invitation_tokens` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_invitations`
--

LOCK TABLES `oc_calendar_invitations` WRITE;
/*!40000 ALTER TABLE `oc_calendar_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_reminders`
--

DROP TABLE IF EXISTS `oc_calendar_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `is_recurring` smallint(6) DEFAULT NULL,
  `uid` varchar(255) NOT NULL,
  `recurrence_id` bigint(20) unsigned DEFAULT NULL,
  `is_recurrence_exception` smallint(6) NOT NULL,
  `event_hash` varchar(255) NOT NULL,
  `alarm_hash` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `is_relative` smallint(6) NOT NULL,
  `notification_date` bigint(20) unsigned NOT NULL,
  `is_repeat_based` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_reminder_objid` (`object_id`),
  KEY `calendar_reminder_uidrec` (`uid`,`recurrence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_reminders`
--

LOCK TABLES `oc_calendar_reminders` WRITE;
/*!40000 ALTER TABLE `oc_calendar_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources`
--

DROP TABLE IF EXISTS `oc_calendar_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) DEFAULT NULL,
  `resource_id` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `group_restrictions` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_resources_email` (`email`),
  KEY `calendar_resources_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources`
--

LOCK TABLES `oc_calendar_resources` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources_md`
--

DROP TABLE IF EXISTS `oc_calendar_resources_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_md_idk` (`resource_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources_md`
--

LOCK TABLES `oc_calendar_resources_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms`
--

DROP TABLE IF EXISTS `oc_calendar_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) DEFAULT NULL,
  `resource_id` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `group_restrictions` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_rooms_email` (`email`),
  KEY `calendar_rooms_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms`
--

LOCK TABLES `oc_calendar_rooms` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms_md`
--

DROP TABLE IF EXISTS `oc_calendar_rooms_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_md_idk` (`room_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms_md`
--

LOCK TABLES `oc_calendar_rooms_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarchanges`
--

DROP TABLE IF EXISTS `oc_calendarchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `calendarid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  `created_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calid_type_synctoken` (`calendarid`,`calendartype`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarchanges`
--

LOCK TABLES `oc_calendarchanges` WRITE;
/*!40000 ALTER TABLE `oc_calendarchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects`
--

DROP TABLE IF EXISTS `oc_calendarobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `calendarid` bigint(20) unsigned NOT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `componenttype` varchar(8) DEFAULT NULL,
  `firstoccurence` bigint(20) unsigned DEFAULT NULL,
  `lastoccurence` bigint(20) unsigned DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `classification` int(11) DEFAULT 0,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calobjects_index` (`calendarid`,`calendartype`,`uri`),
  KEY `calobj_clssfction_index` (`classification`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects`
--

LOCK TABLES `oc_calendarobjects` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects_props`
--

DROP TABLE IF EXISTS `oc_calendarobjects_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects_props` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendarid` bigint(20) NOT NULL DEFAULT 0,
  `objectid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `parameter` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calendarobject_index` (`objectid`,`calendartype`),
  KEY `calendarobject_name_index` (`name`,`calendartype`),
  KEY `calendarobject_value_index` (`value`,`calendartype`),
  KEY `calendarobject_calid_index` (`calendarid`,`calendartype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects_props`
--

LOCK TABLES `oc_calendarobjects_props` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendars`
--

DROP TABLE IF EXISTS `oc_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `description` varchar(255) DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) DEFAULT NULL,
  `timezone` longtext DEFAULT NULL,
  `components` varchar(64) DEFAULT NULL,
  `transparent` smallint(6) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendars_index` (`principaluri`,`uri`),
  KEY `cals_princ_del_idx` (`principaluri`,`deleted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendars`
--

LOCK TABLES `oc_calendars` WRITE;
/*!40000 ALTER TABLE `oc_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarsubscriptions`
--

DROP TABLE IF EXISTS `oc_calendarsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarsubscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(100) DEFAULT NULL,
  `refreshrate` varchar(10) DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) DEFAULT NULL,
  `striptodos` smallint(6) DEFAULT NULL,
  `stripalarms` smallint(6) DEFAULT NULL,
  `stripattachments` smallint(6) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `source` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calsub_index` (`principaluri`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarsubscriptions`
--

LOCK TABLES `oc_calendarsubscriptions` WRITE;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards`
--

DROP TABLE IF EXISTS `oc_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `carddata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `lastmodified` bigint(20) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_abiduri` (`addressbookid`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards`
--

LOCK TABLES `oc_cards` WRITE;
/*!40000 ALTER TABLE `oc_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards_properties`
--

DROP TABLE IF EXISTS `oc_cards_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards_properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `cardid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `card_contactid_index` (`cardid`),
  KEY `card_name_index` (`name`),
  KEY `card_value_index` (`value`),
  KEY `cards_prop_abid` (`addressbookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards_properties`
--

LOCK TABLES `oc_cards_properties` WRITE;
/*!40000 ALTER TABLE `oc_cards_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_circle`
--

DROP TABLE IF EXISTS `oc_circles_circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_circle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(31) NOT NULL,
  `name` varchar(127) NOT NULL,
  `display_name` varchar(255) DEFAULT '',
  `sanitized_name` varchar(127) DEFAULT '',
  `instance` varchar(255) DEFAULT '',
  `config` int(10) unsigned DEFAULT NULL,
  `source` int(10) unsigned DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  `contact_addressbook` int(10) unsigned DEFAULT NULL,
  `contact_groupname` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8195F548E3C68343` (`unique_id`),
  KEY `IDX_8195F548D48A2F7C` (`config`),
  KEY `IDX_8195F5484230B1DE` (`instance`),
  KEY `IDX_8195F5485F8A7F73` (`source`),
  KEY `IDX_8195F548C317B362` (`sanitized_name`),
  KEY `dname` (`display_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_circle`
--

LOCK TABLES `oc_circles_circle` WRITE;
/*!40000 ALTER TABLE `oc_circles_circle` DISABLE KEYS */;
INSERT INTO `oc_circles_circle` VALUES (1,'iPLty6KqsgYx8hFHt3q7hSztrYBolIi','user:admin:iPLty6KqsgYx8hFHt3q7hSztrYBolIi','admin','','',1,1,'[]','','2024-06-08 11:20:35',0,''),(2,'eqvPGMSQR699QcCpmJ3KJzXVydC1Y4U','app:circles:eqvPGMSQR699QcCpmJ3KJzXVydC1Y4U','Circles','','',8193,10001,'[]','','2024-06-08 11:20:35',0,'');
/*!40000 ALTER TABLE `oc_circles_circle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_event`
--

DROP TABLE IF EXISTS `oc_circles_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_event` (
  `token` varchar(63) NOT NULL,
  `instance` varchar(255) NOT NULL,
  `event` longtext DEFAULT NULL,
  `result` longtext DEFAULT NULL,
  `interface` int(11) NOT NULL DEFAULT 0,
  `severity` int(11) DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `creation` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`token`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_event`
--

LOCK TABLES `oc_circles_event` WRITE;
/*!40000 ALTER TABLE `oc_circles_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_member`
--

DROP TABLE IF EXISTS `oc_circles_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `single_id` varchar(31) DEFAULT NULL,
  `circle_id` varchar(31) NOT NULL,
  `member_id` varchar(31) DEFAULT NULL,
  `user_id` varchar(127) NOT NULL,
  `user_type` smallint(6) NOT NULL DEFAULT 1,
  `instance` varchar(255) DEFAULT '',
  `invited_by` varchar(31) DEFAULT NULL,
  `level` smallint(6) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `cached_name` varchar(255) DEFAULT '',
  `cached_update` datetime DEFAULT NULL,
  `contact_id` varchar(127) DEFAULT NULL,
  `contact_meta` longtext DEFAULT NULL,
  `joined` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_member_cisiuiutil` (`circle_id`,`single_id`,`user_id`,`user_type`,`instance`,`level`),
  KEY `circles_member_cisi` (`circle_id`,`single_id`),
  KEY `IDX_25C66A49E7A1254A` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_member`
--

LOCK TABLES `oc_circles_member` WRITE;
/*!40000 ALTER TABLE `oc_circles_member` DISABLE KEYS */;
INSERT INTO `oc_circles_member` VALUES (1,'eqvPGMSQR699QcCpmJ3KJzXVydC1Y4U','eqvPGMSQR699QcCpmJ3KJzXVydC1Y4U','eqvPGMSQR699QcCpmJ3KJzXVydC1Y4U','circles',10000,'',NULL,9,'Member','[]','Circles','2024-06-08 11:20:35','',NULL,'2024-06-08 11:20:35'),(2,'iPLty6KqsgYx8hFHt3q7hSztrYBolIi','iPLty6KqsgYx8hFHt3q7hSztrYBolIi','iPLty6KqsgYx8hFHt3q7hSztrYBolIi','admin',1,'','eqvPGMSQR699QcCpmJ3KJzXVydC1Y4U',9,'Member','[]','admin','2024-06-08 11:20:35','',NULL,'2024-06-08 11:20:35');
/*!40000 ALTER TABLE `oc_circles_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_membership`
--

DROP TABLE IF EXISTS `oc_circles_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_membership` (
  `circle_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `inheritance_first` varchar(31) NOT NULL,
  `inheritance_last` varchar(31) NOT NULL,
  `inheritance_depth` int(10) unsigned NOT NULL,
  `inheritance_path` longtext NOT NULL,
  PRIMARY KEY (`single_id`,`circle_id`),
  KEY `IDX_8FC816EAE7C1D92B` (`single_id`),
  KEY `circles_membership_ifilci` (`inheritance_first`,`inheritance_last`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_membership`
--

LOCK TABLES `oc_circles_membership` WRITE;
/*!40000 ALTER TABLE `oc_circles_membership` DISABLE KEYS */;
INSERT INTO `oc_circles_membership` VALUES ('eqvPGMSQR699QcCpmJ3KJzXVydC1Y4U','eqvPGMSQR699QcCpmJ3KJzXVydC1Y4U',9,'eqvPGMSQR699QcCpmJ3KJzXVydC1Y4U','eqvPGMSQR699QcCpmJ3KJzXVydC1Y4U',1,'[\"eqvPGMSQR699QcCpmJ3KJzXVydC1Y4U\"]'),('iPLty6KqsgYx8hFHt3q7hSztrYBolIi','iPLty6KqsgYx8hFHt3q7hSztrYBolIi',9,'iPLty6KqsgYx8hFHt3q7hSztrYBolIi','iPLty6KqsgYx8hFHt3q7hSztrYBolIi',1,'[\"iPLty6KqsgYx8hFHt3q7hSztrYBolIi\"]');
/*!40000 ALTER TABLE `oc_circles_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mount`
--

DROP TABLE IF EXISTS `oc_circles_mount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) NOT NULL,
  `circle_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `token` varchar(63) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `mountpoint` longtext DEFAULT NULL,
  `mountpoint_hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mount_cimipt` (`circle_id`,`mount_id`,`parent`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mount`
--

LOCK TABLES `oc_circles_mount` WRITE;
/*!40000 ALTER TABLE `oc_circles_mount` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mountpoint`
--

DROP TABLE IF EXISTS `oc_circles_mountpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mountpoint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `mountpoint` longtext DEFAULT NULL,
  `mountpoint_hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mountpoint_ms` (`mount_id`,`single_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mountpoint`
--

LOCK TABLES `oc_circles_mountpoint` WRITE;
/*!40000 ALTER TABLE `oc_circles_mountpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mountpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_remote`
--

DROP TABLE IF EXISTS `oc_circles_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_remote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT 'Unknown',
  `interface` int(11) NOT NULL DEFAULT 0,
  `uid` varchar(20) DEFAULT NULL,
  `instance` varchar(127) DEFAULT NULL,
  `href` varchar(254) DEFAULT NULL,
  `item` longtext DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F94EF834230B1DE` (`instance`),
  KEY `IDX_F94EF83539B0606` (`uid`),
  KEY `IDX_F94EF8334F8E741` (`href`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_remote`
--

LOCK TABLES `oc_circles_remote` WRITE;
/*!40000 ALTER TABLE `oc_circles_remote` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_share_lock`
--

DROP TABLE IF EXISTS `oc_circles_share_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_share_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(31) NOT NULL,
  `circle_id` varchar(31) NOT NULL,
  `instance` varchar(127) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_337F52F8126F525E70EE2FF6` (`item_id`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_share_lock`
--

LOCK TABLES `oc_circles_share_lock` WRITE;
/*!40000 ALTER TABLE `oc_circles_share_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_share_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_token`
--

DROP TABLE IF EXISTS `oc_circles_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) DEFAULT NULL,
  `circle_id` varchar(31) DEFAULT NULL,
  `single_id` varchar(31) DEFAULT NULL,
  `member_id` varchar(31) DEFAULT NULL,
  `token` varchar(31) DEFAULT NULL,
  `password` varchar(127) DEFAULT NULL,
  `accepted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sicisimit` (`share_id`,`circle_id`,`single_id`,`member_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_token`
--

LOCK TABLES `oc_circles_token` WRITE;
/*!40000 ALTER TABLE `oc_circles_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_accesscache`
--

DROP TABLE IF EXISTS `oc_collres_accesscache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_accesscache` (
  `user_id` varchar(64) NOT NULL,
  `collection_id` bigint(20) NOT NULL DEFAULT 0,
  `resource_type` varchar(64) NOT NULL DEFAULT '',
  `resource_id` varchar(64) NOT NULL DEFAULT '',
  `access` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`user_id`,`collection_id`,`resource_type`,`resource_id`),
  KEY `collres_user_res` (`user_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_accesscache`
--

LOCK TABLES `oc_collres_accesscache` WRITE;
/*!40000 ALTER TABLE `oc_collres_accesscache` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_accesscache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_collections`
--

DROP TABLE IF EXISTS `oc_collres_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_collections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_collections`
--

LOCK TABLES `oc_collres_collections` WRITE;
/*!40000 ALTER TABLE `oc_collres_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_resources`
--

DROP TABLE IF EXISTS `oc_collres_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_resources` (
  `collection_id` bigint(20) NOT NULL,
  `resource_type` varchar(64) NOT NULL,
  `resource_id` varchar(64) NOT NULL,
  PRIMARY KEY (`collection_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_resources`
--

LOCK TABLES `oc_collres_resources` WRITE;
/*!40000 ALTER TABLE `oc_collres_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments`
--

DROP TABLE IF EXISTS `oc_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `topmost_parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `children_count` int(10) unsigned NOT NULL DEFAULT 0,
  `actor_type` varchar(64) NOT NULL DEFAULT '',
  `actor_id` varchar(64) NOT NULL DEFAULT '',
  `message` longtext DEFAULT NULL,
  `verb` varchar(64) DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT NULL,
  `latest_child_timestamp` datetime DEFAULT NULL,
  `object_type` varchar(64) NOT NULL DEFAULT '',
  `object_id` varchar(64) NOT NULL DEFAULT '',
  `reference_id` varchar(64) DEFAULT NULL,
  `reactions` varchar(4000) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `meta_data` longtext DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_index` (`parent_id`),
  KEY `comments_topmost_parent_id_idx` (`topmost_parent_id`),
  KEY `comments_object_index` (`object_type`,`object_id`,`creation_timestamp`),
  KEY `comments_actor_index` (`actor_type`,`actor_id`),
  KEY `expire_date` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments`
--

LOCK TABLES `oc_comments` WRITE;
/*!40000 ALTER TABLE `oc_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments_read_markers`
--

DROP TABLE IF EXISTS `oc_comments_read_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments_read_markers` (
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `object_type` varchar(64) NOT NULL DEFAULT '',
  `object_id` varchar(64) NOT NULL DEFAULT '',
  `marker_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`object_type`,`object_id`),
  KEY `comments_marker_object_index` (`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments_read_markers`
--

LOCK TABLES `oc_comments_read_markers` WRITE;
/*!40000 ALTER TABLE `oc_comments_read_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments_read_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_absence`
--

DROP TABLE IF EXISTS `oc_dav_absence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_absence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `first_day` varchar(10) NOT NULL,
  `last_day` varchar(10) NOT NULL,
  `status` varchar(100) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_absence_uid_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_absence`
--

LOCK TABLES `oc_dav_absence` WRITE;
/*!40000 ALTER TABLE `oc_dav_absence` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_absence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_cal_proxy`
--

DROP TABLE IF EXISTS `oc_dav_cal_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_cal_proxy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` varchar(64) NOT NULL,
  `proxy_id` varchar(64) NOT NULL,
  `permissions` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_cal_proxy_uidx` (`owner_id`,`proxy_id`,`permissions`),
  KEY `dav_cal_proxy_ipid` (`proxy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_cal_proxy`
--

LOCK TABLES `oc_dav_cal_proxy` WRITE;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_shares`
--

DROP TABLE IF EXISTS `oc_dav_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_shares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access` smallint(6) DEFAULT NULL,
  `resourceid` bigint(20) unsigned NOT NULL,
  `publicuri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_shares_index` (`principaluri`,`resourceid`,`type`,`publicuri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_shares`
--

LOCK TABLES `oc_dav_shares` WRITE;
/*!40000 ALTER TABLE `oc_dav_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_direct_edit`
--

DROP TABLE IF EXISTS `oc_direct_edit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_direct_edit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `editor_id` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `share_id` bigint(20) DEFAULT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `accessed` tinyint(1) DEFAULT 0,
  `file_path` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4D5AFECA5F37A13B` (`token`),
  KEY `direct_edit_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_direct_edit`
--

LOCK TABLES `oc_direct_edit` WRITE;
/*!40000 ALTER TABLE `oc_direct_edit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_direct_edit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_directlink`
--

DROP TABLE IF EXISTS `oc_directlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_directlink` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) DEFAULT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `token` varchar(60) DEFAULT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directlink_token_idx` (`token`),
  KEY `directlink_expiration_idx` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_directlink`
--

LOCK TABLES `oc_directlink` WRITE;
/*!40000 ALTER TABLE `oc_directlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_directlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_federated_reshares`
--

DROP TABLE IF EXISTS `oc_federated_reshares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_federated_reshares` (
  `share_id` bigint(20) NOT NULL,
  `remote_id` varchar(255) DEFAULT '',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_federated_reshares`
--

LOCK TABLES `oc_federated_reshares` WRITE;
/*!40000 ALTER TABLE `oc_federated_reshares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_federated_reshares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_file_locks`
--

DROP TABLE IF EXISTS `oc_file_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_file_locks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lock` int(11) NOT NULL DEFAULT 0,
  `key` varchar(64) NOT NULL,
  `ttl` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lock_key_index` (`key`),
  KEY `lock_ttl_index` (`ttl`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` VALUES (1,0,'files/e358852d1799ec24cd00329ffe6b7ec1',1717849610),(2,0,'files/c39f16dc45e4f7b92b8efb4cb69ce5da',1717849283),(4,0,'files/09c4badf5d461631b485126732f17937',1717849294),(5,0,'files/09a1a462d7a1e780019bf19976c7a7e8',1717849294),(6,0,'files/942a043b730c208a0a1500491e8baede',1717849294),(7,0,'files/360a33658cc55899c6058f1c37046f1c',1717849294),(8,0,'files/321278dd1924a3b5b45e86cb6194ba8e',1717849294),(9,0,'files/f3bbbe76e0ccda6212e09ebbcfd4bf8e',1717849294),(10,0,'files/9eb74a49d3d894372bb7b0b1ca37571f',1717849294),(11,0,'files/54609f24fbf6bfdf7ebced00c2ee261a',1717849294),(12,0,'files/cd4e6dd482cd31d7afaccdd40f44260c',1717849294),(13,0,'files/2b7e7fc6eb6a6eebafc20f9ca38ea940',1717849294),(14,0,'files/d011488bffc5c548459640ee84f0667f',1717849294),(15,0,'files/70efc04cfef4e360cf5626cf9079e0cd',1717849294),(16,0,'files/34fbb29aeb64614fed102f72b9778bcc',1717849294),(17,0,'files/8d9976892306ba1b2694f69844308ab7',1717849294),(18,0,'files/a12c48802232076c65d6cef2c8146c01',1717849294),(19,0,'files/7ce03ea3ba19d7e7f77ed2db6f525fb5',1717849294),(20,0,'files/532c3ecf4079d188141577c6b5983ce3',1717849294),(21,0,'files/8207fd79ab98994004c1bba7e6154322',1717849294),(22,0,'files/375272c72a83ad21e76740edae350d2d',1717849294),(23,0,'files/b64d12750972be2b886de190d778855c',1717849294),(24,0,'files/e0dfe6d993ddb994689a4cc0d6cd6384',1717849294),(25,0,'files/3e5af334b59d1c379c8b42c9dbffc89a',1717849294),(26,0,'files/396c3c3f5079039bdb84c42eb6d1dce3',1717849294),(27,0,'files/79b6cca6e2e077859de9ee511b8308bf',1717849294),(28,0,'files/0d6866c50407f816da27cc62cfbf3ebf',1717849294),(29,0,'files/fd29a48cf7852050f4031fa98ee35ecb',1717849294),(30,0,'files/59566c3e4b129b1ac2e111d9508eb747',1717849294),(31,0,'files/9dd12709aa5a405107dd1b4022fb0530',1717849294),(33,0,'files/87f7757f072295f83c07aec6979240cb',1717849294),(35,0,'files/b6ef755cfc70b5eb94f5d3aad8ba833d',1717849610),(37,0,'files/2b7e5de9afe8b3f7b056c0ba2a04af46',1717849610),(39,0,'files/cecfa4eb5a3277d2b93f3c58256f99d8',1717849294),(41,0,'files/5cee638e61c80810ec19d33ab0689268',1717849294),(46,0,'files/d051e91b9cb1f5f8a50f8a63d0a7c513',1717849294),(47,0,'files/9a532fe76d2f5897319818aa21a9b5b0',1717849294),(48,0,'files/48674a32d466a448ce7522d563076058',1717849294),(49,0,'files/b60ea0fc5fc30b179b42f24a8a145b33',1717849294),(50,0,'files/4bea42354fb2d5320f0fa697e13105e1',1717849294),(51,0,'files/1b5ab961b2786fc50b1640aff46feb51',1717849294),(52,0,'files/70338df065a56974a1f4e8f59be424d4',1717849294),(53,0,'files/173b2b63515c3e7bedcd7aa656e92b8b',1717849294),(54,0,'files/7d5779f556ee4b88740dc11b38cde11a',1717849294),(55,0,'files/72060f2b997627f108b78a7d94788b6c',1717849294),(56,0,'files/4d4a98ad111969f931c84b894b82c0dc',1717849294),(57,0,'files/3f667f94061dcaf8bb78ebc9a7a781f7',1717849294),(58,0,'files/c5ffc1a27a7bc882499ce1ab7e6a44b7',1717849294),(59,0,'files/9eec423052de4284ab9fa765a78882d9',1717849294),(60,0,'files/e58b6cafd92b1275de186e076801da8e',1717849295),(64,0,'files/4f53a0755b9a327991769630d9f3a6df',1717849295),(68,0,'files/6b2de085d9b53fa93fa74433933ff37f',1717849361),(71,0,'files/cbc6f4e337332b94c2e02444d64b1c16',1717849361),(72,0,'files/2c7eaecb9090bd89cef1dcd4d0d5881a',1717849361),(73,0,'files/84fc6d08ed3bd071bcdab33a99d2d7d9',1717849361),(74,0,'files/3513aba8aa4305d3ad33fc7122d4af30',1717849361),(75,0,'files/585273f764f7401d20c06a646f408e8a',1717849386),(77,0,'files/fc1d4c31cf68f59920fd6d7fae453a0f',1717849368),(78,0,'files/e2ed06d2ee00737cbe51012dd744d5b7',1717849368),(79,0,'files/fa4303f9cc34d0d822c801a962dd24a7',1717849368),(80,0,'files/1704c7333ca49a5b4e4f7aa52fb4320f',1717849368),(81,0,'files/dbd1a51fa47902a27d910c4b9465fb88',1717849368),(82,0,'files/94d20fd75bc62e3492c66cb5a3174791',1717849368),(83,0,'files/2c1481ce552a481e10ed0536304b645f',1717849368),(84,0,'files/ae9ed81b0c7c073c798cb9ea91dfc90d',1717849368),(85,0,'files/0dc70958c1e23341c47cc41d35a8a860',1717849368),(86,0,'files/836dd037cc799a41ed8cd1392a3cf7ea',1717849368),(87,0,'files/b24b40c61ed961ced37ea09a7711a105',1717849368),(88,0,'files/79cafabdc53430e95d9c02d7316ad9da',1717849368),(89,0,'files/2c4ce14b2cba6e19d1114c15966369a3',1717849368),(90,0,'files/145d316859b42a430d0791d5c7415492',1717849368),(91,0,'files/d704bb4537dacc0fd3e69ca79facb2ac',1717849368),(92,0,'files/6713925673bb58b9a6b15c4c017bdfaa',1717849368),(93,0,'files/f0a5b992239d4c7c9e1881b8ee05bb27',1717849368),(94,0,'files/2b827a9891984805ade046d195ce3a7f',1717849368),(95,0,'files/28c70570533d130372aa463b3df335f3',1717849368),(96,0,'files/b4505913c2c4ba2035d40a1a44cbc4bd',1717849368),(97,0,'files/2d46d8e30ab55f2aeb4613a09a325fa3',1717849369),(98,0,'files/db5200c2ca40c3dd2b4fda1e33c316a4',1717849369),(99,0,'files/f6b7332165290ea0915bb00a804f0620',1717849369),(100,0,'files/1b6f7a352266655af9940c0561b2a99c',1717849369),(101,0,'files/4ebb699ad484cdc76a7704e0d28fd491',1717849369),(102,0,'files/835ac7ae19da9fedb6163c3bc24bb2e2',1717849369),(103,0,'files/7df5b64c351b9f2fa9b18354abc78d9e',1717849386),(104,0,'files/66938f6d96e39e97c8b86e7f865e6897',1717849386),(105,0,'files/f059eb5d2ed6989cbf70c2b28163d9f3',1717849386),(106,0,'files/a3c2aa6eeff249fb1829e6ae554122a1',1717849386),(107,0,'files/273ac840dc5185276ffefc5cc642f60f',1717849386),(108,0,'files/b2168b12da569445dc46bb36eac7128b',1717849386),(109,0,'files/33e1fa4c5b6f8c69b09a8cc4829187e9',1717849386),(110,0,'files/8ba9098721c30357891f077dfa50e31f',1717849386),(111,0,'files/0c1fb4ecc34ec6261f9321c3a104d84a',1717849386),(112,0,'files/402ec256228c944de6755d1e29d0869b',1717849386),(113,0,'files/5a05a50836b032b52f5a1d93b2332483',1717849386),(114,0,'files/60d92f6b423c3bfa1b898c088b057c15',1717849386),(115,0,'files/e2e3073bf36b5947eb1dd8a6a1165793',1717849386),(116,0,'files/7a480897065b8205d7fbe74ab7e4591c',1717849386),(117,0,'files/29e70128fd3de76d4147b29b084b6a71',1717849386),(118,0,'files/0b7c793ac8281dc07cabfdac2b4e52ad',1717849386),(119,0,'files/aa6c31aac2fb137baa6ce6837855a4e1',1717849386),(123,0,'files/9523448d04e1dbd64f78bf916ae84ab2',1717849386),(127,0,'files/47ca8e63f1862a63ca72570b48d8c1b6',1717849386),(128,0,'files/6526cd46096d5b80605726f6c7ba7926',1717849386),(129,0,'files/1163602126f9e41f360f6ca3fff6c9ba',1717849386),(130,0,'files/cc310158192712c8c3f8d3fccf238b3d',1717849386),(131,0,'files/013aad08f047b691f4dcc2781272d988',1717849386),(132,0,'files/dd6284d8e8b65a56644659e8ececbb79',1717849386),(133,0,'files/885f617baf14120655bbbc8d41a274be',1717849386),(134,0,'files/c2909f8357bdb55caa3cfab3244b491d',1717849386),(138,0,'files/70e45c5922aeaf3fd4bc012830eec4db',1717849386),(142,0,'files/7fa9efc3bcafd47a4c857213c7909671',1717849386),(143,0,'files/42d6929d4d51419be9e65287f1555f01',1717849386),(144,0,'files/0aa8d89b68d08bfd293192ba412330de',1717849386),(145,0,'files/f9a05a3df78e2f8ce4d0b8cffcbe1845',1717849386),(146,0,'files/06c95dc221ddd988dfecf529d90d0523',1717849386),(147,0,'files/9ce735bc6e5f58236b387cd0f0c2c9e5',1717849386),(152,0,'files/6edab654a6bd015cd93c973b10b7fbcf',1717849609),(153,0,'files/2d6d47d86e1052d31e2834af94b6aa2e',1717849609),(154,0,'files/53c957c1d68722b6b6e80f34c50babbb',1717849609),(155,0,'files/27c4fa27d7f6fa78aaff79b3d4fc7828',1717849609),(156,0,'files/7026b3e984ad3987e1f2700a90591819',1717849609),(157,0,'files/77296dfbcd743e345d53b76accd67cc2',1717849609),(158,0,'files/a7cbbe2af620c21a0c8834e23b08d024',1717849609),(162,0,'files/6c36c796229e57c870c3703a39c55628',1717849609),(163,0,'files/88f16849eec5c6ec30b417f743a98830',1717849609),(164,0,'files/46f715622b1813d86d01885236450d23',1717849609),(165,0,'files/4b398a3292e3ebb9f210046a0f0bea46',1717849609),(166,0,'files/8cdf7606595bc0936456eb346ba5029d',1717849609),(167,0,'files/183eebc2174776c52022274b58473683',1717849609),(168,0,'files/911ca602bc4d497be38f208b52e3e924',1717849609),(172,0,'files/e37ec209f4ab111a3437483543eb515f',1717849609),(173,0,'files/dd7edbe236b30fe0459f447297ea57ad',1717849609),(174,0,'files/76b33d7df9c5328f99dfc197b2368ccb',1717849609),(175,0,'files/378cf697dbd0362a18312ff925d8260b',1717849609),(176,0,'files/e84385b54e66e121f1c824a4f46d96bf',1717849609),(177,0,'files/96f14f3e36add1c85cbfed2101e5f289',1717849609),(178,0,'files/e8dce61a909911fbf84ca995ca20fdb2',1717849609),(179,0,'files/9e868403ab4be93a1bd30ed7c8015492',1717849609),(180,0,'files/3a8ec760385a0e18e41d327fcf789486',1717849609),(181,0,'files/e1169e8e8e8be7b95f27255426033af7',1717849609),(182,0,'files/c971c750cf05af215a475d58e659683c',1717849609),(183,0,'files/e1efcf0de5ff0dc14fe79fdfb3dca583',1717849609),(184,0,'files/5c93ebb015ee0001ae6acedf4b1c22a1',1717849609),(185,0,'files/ced7d15b5cff557e4746d6588b4fe7fe',1717849609),(186,0,'files/5d6588c9e6b1f8cef0d38d2b8355126d',1717849609),(187,0,'files/09c3d7e818d336069e2bcba8a46b0b57',1717849609),(188,0,'files/09dc1b564ec6e0bfbc080dca28ed9af3',1717849609),(189,0,'files/fac44c56cce13a07d2f318167417cdd5',1717849609),(190,0,'files/4014289508e8850356ea7739ecf22e2b',1717849609),(191,0,'files/af42eea9466c8941c0f5779b15a60bbd',1717849609),(192,0,'files/4890cce2ad8bdfa053d8035b6f93b4d2',1717849609),(193,0,'files/f7b10f9d89b9dbe21316356566857bd1',1717849609),(194,0,'files/9dc35e9d7074d082a450de47fe11fc30',1717849609),(195,0,'files/744a1b989a030a9cabcf60ae4f3880f9',1717849609),(196,0,'files/e69e3e38b9893ef8cb3c1ebc67b2bb2a',1717849609),(199,0,'files/fbed8057505877bfbc711c809a79a15e',1717849609),(201,0,'files/76f4c73b545e08cea45d806526415381',1717849609),(205,0,'files/d8a65ca6da44c3d64b0bb38675aaf239',1717849609),(209,0,'files/d7f93e169178cf12e2d72f9d6f2f7631',1717849609),(213,0,'files/53e0ae94c2b5b13e6f5f39283b91082f',1717849609),(214,0,'files/9e81bec2effa64f15886e4f927b2b6bd',1717849609),(215,0,'files/cf1862d11a14ca433246a6d2a77bc769',1717849609),(216,0,'files/72f3cdd2e08194bbe29bb0eda87c51ad',1717849609),(217,0,'files/a909ebf6efc2c96b25ca08b0a8f21335',1717849609),(218,0,'files/9e70a2b997042582a08f8c37d650df5b',1717849609),(219,0,'files/b9a842382a5869da254c9d18677a4ea6',1717849609),(220,0,'files/e2de670156a8c37038d4c0151d92a048',1717849609),(221,0,'files/953f5a9f189d69571aca5805d23dee39',1717849609),(222,0,'files/995e25f12dbdc64e038dd0e1d9b58976',1717849609),(223,0,'files/24cf2c4f6a669b92fbe94181a6ceb5f9',1717849609),(226,0,'files/bf37f95f1699b3984e9340cc9910c910',1717849609),(231,0,'files/7a81b929a761fa5458cf7bc718701ce0',1717849610),(232,0,'files/63da1046796ed7b42a64761b0142aa5e',1717849610),(233,0,'files/53183597c771e970a1061187199681b0',1717849610),(234,0,'files/8f7a8cefe2cb09e40b0c124aa0943222',1717849610),(235,0,'files/c11c548eadec81d3894ee73c16c71797',1717849610),(236,0,'files/aa52455999f331f5edc85646d494d8ce',1717849610),(237,0,'files/c10f7d3771c7825da44ef62a7f67bdb5',1717849610),(238,0,'files/247d3a9cbc1bec69726a9ee80de51d1f',1717849610),(239,0,'files/5735bec3228c0fbd1788a6666f164498',1717849610),(240,0,'files/e7e3ed6342293c9193c494c56fa9e14f',1717849610),(241,0,'files/aca32f5893ce3688200214dadb6c7562',1717849610),(242,0,'files/9598c3199ddb35b2856905d6a9707f72',1717849610),(243,0,'files/773e482cd928b08c5d7039c89d1f98a7',1717849610),(244,0,'files/fa8b49ccd03e69f7eaf9dda531a53e32',1717849610),(245,0,'files/5a86d5b0c8c638e544d7e8a9a1aac72d',1717849610),(247,0,'files/7ab9621419566fa64ae8cc7048d0571d',1717849610),(248,0,'files/998701cf572224f529baee0de30265af',1717849610),(249,0,'files/dbba70daf599a04f02826db0a6460221',1717849610),(250,0,'files/4096d40c6cac6680abdbefd9b361bf32',1717849610),(251,0,'files/fc89a039b3d51a71e00d902f4ccab27e',1717849610),(253,0,'files/2b81019c579c5974e58c8991e45d5293',1717849610),(254,0,'files/9a0525bd0b3a95b51d8beeebbfddaf16',1717849610),(256,0,'files/ea14fe470f502a4f0acf449c0d6756a2',1717849610),(257,0,'files/7a832a274adb07a4c400224cc58fc623',1717849610),(258,0,'files/2aeef720c0e37b910f87447ab3ea2465',1717849610),(259,0,'files/b74317c4a642a02fdbc69e6018999635',1717849610),(260,0,'files/14ebe94dd866f44db0e5dc426c50b45c',1717849610),(261,0,'files/9c6b5bd619f63b6923bd25f870cb1691',1717849610),(262,0,'files/ed67ddd54c8c5e073856084bb9448e12',1717849610),(265,0,'files/52a339061f458ebaf8ac51482ef5a7b6',1717849610),(270,0,'files/2f246069f2b9f7ff5ec68f75bd8d196d',1717849610);
/*!40000 ALTER TABLE `oc_file_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache`
--

DROP TABLE IF EXISTS `oc_filecache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache` (
  `fileid` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage` bigint(20) NOT NULL DEFAULT 0,
  `path` varchar(4000) DEFAULT NULL,
  `path_hash` varchar(32) NOT NULL DEFAULT '',
  `parent` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(250) DEFAULT NULL,
  `mimetype` bigint(20) NOT NULL DEFAULT 0,
  `mimepart` bigint(20) NOT NULL DEFAULT 0,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `mtime` bigint(20) NOT NULL DEFAULT 0,
  `storage_mtime` bigint(20) NOT NULL DEFAULT 0,
  `encrypted` int(11) NOT NULL DEFAULT 0,
  `unencrypted_size` bigint(20) NOT NULL DEFAULT 0,
  `etag` varchar(40) DEFAULT NULL,
  `permissions` int(11) DEFAULT 0,
  `checksum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`),
  KEY `fs_parent_name_hash` (`parent`,`name`),
  KEY `fs_storage_mimetype` (`storage`,`mimetype`),
  KEY `fs_storage_mimepart` (`storage`,`mimepart`),
  KEY `fs_storage_size` (`storage`,`size`,`fileid`),
  KEY `fs_id_storage_size` (`fileid`,`storage`,`size`),
  KEY `fs_parent` (`parent`),
  KEY `fs_mtime` (`mtime`),
  KEY `fs_size` (`size`),
  KEY `fs_storage_path_prefix` (`storage`,`path`(64))
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` VALUES (1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,39171419,1717846010,1717845635,0,0,'66643ffa63ada',23,''),(2,1,'files','45b963397aa40d4a0063e0d85e4fe7a1',1,'files',2,1,28558534,1717846010,1717845640,0,0,'66643ffa63ada',31,''),(3,1,'files/Documents','0ad78ba05b6961d92f7970b2b3922eca',2,'Documents',2,1,1108865,1717845635,1717845635,0,0,'66643e83be32e',31,''),(4,1,'files/Documents/Example.md','efe0853470dd0663db34818b444328dd',3,'Example.md',4,3,1095,1717845635,1717845635,0,0,'3345b182ea088a83ddc285c8cac20695',27,''),(5,1,'files/Documents/Nextcloud flyer.pdf','9c5b4dc7182a7435767708ac3e8d126c',3,'Nextcloud flyer.pdf',6,5,1083339,1717845635,1717845635,0,0,'5ea721a721e5df15153f6b8420e79574',27,''),(6,1,'files/Documents/Readme.md','51ec9e44357d147dd5c212b850f6910f',3,'Readme.md',4,3,136,1717845635,1717845635,0,0,'81703ddce11a21389a8d27d9ca41aa94',27,''),(7,1,'files/Documents/Welcome to Nextcloud Hub.docx','b44cb84f22ceddc4ca2826e026038091',3,'Welcome to Nextcloud Hub.docx',7,5,24295,1717845635,1717845635,0,0,'bdc2788b9eb88c84e03a1efaf62eb333',27,''),(8,1,'files/Nextcloud intro.mp4','e4919345bcc87d4585a5525daaad99c0',2,'Nextcloud intro.mp4',9,8,3963036,1717845635,1717845635,0,0,'1f2f46429e8053533cfa12d206bd5a92',27,''),(9,1,'files/Nextcloud Manual.pdf','2bc58a43566a8edde804a4a97a9c7469',2,'Nextcloud Manual.pdf',6,5,16692071,1717845636,1717845636,0,0,'93cebce7c1d32a1f4db6fec2d516c731',27,''),(10,1,'files/Nextcloud.png','2bcc0ff06465ef1bfc4a868efde1e485',2,'Nextcloud.png',11,10,50598,1717845636,1717845636,0,0,'533fc45103c1e48587bd5f720ef38102',27,''),(11,1,'files/Photos','d01bb67e7b71dd49fd06bad922f521c9',2,'Photos',2,1,5656463,1717845637,1717845637,0,0,'66643e8595bc8',31,''),(12,1,'files/Photos/Birdie.jpg','cd31c7af3a0ec6e15782b5edd2774549',11,'Birdie.jpg',12,10,593508,1717845636,1717845636,0,0,'613b0482b55a62a5fc75d711841c0c60',27,''),(13,1,'files/Photos/Frog.jpg','d6219add1a9129ed0c1513af985e2081',11,'Frog.jpg',12,10,457744,1717845636,1717845636,0,0,'cf3c640c03a40c7fcff1481018e87e81',27,''),(14,1,'files/Photos/Gorilla.jpg','6d5f5956d8ff76a5f290cebb56402789',11,'Gorilla.jpg',12,10,474653,1717845636,1717845636,0,0,'8a3b4c9c7a43ccd84ebc4367d425d5a9',27,''),(15,1,'files/Photos/Library.jpg','0b785d02a19fc00979f82f6b54a05805',11,'Library.jpg',12,10,2170375,1717845636,1717845636,0,0,'2e51590a64294276a30608cf33187b67',27,''),(16,1,'files/Photos/Nextcloud community.jpg','b9b3caef83a2a1c20354b98df6bcd9d0',11,'Nextcloud community.jpg',12,10,797325,1717845637,1717845637,0,0,'2be530ef0f170aea3071762c6e7bc298',27,''),(17,1,'files/Photos/Readme.md','2a4ac36bb841d25d06d164f291ee97db',11,'Readme.md',4,3,150,1717845637,1717845637,0,0,'3fe4e294ba400eb07ac4cffc7ba1338b',27,''),(18,1,'files/Photos/Steps.jpg','7b2ca8d05bbad97e00cbf5833d43e912',11,'Steps.jpg',12,10,567689,1717845637,1717845637,0,0,'e5db486d69347063963c0582db0ca215',27,''),(19,1,'files/Photos/Toucan.jpg','681d1e78f46a233e12ecfa722cbc2aef',11,'Toucan.jpg',12,10,167989,1717845637,1717845637,0,0,'be34f065c1673392017fe98838fddbaa',27,''),(20,1,'files/Photos/Vineyard.jpg','14e5f2670b0817614acd52269d971db8',11,'Vineyard.jpg',12,10,427030,1717845637,1717845637,0,0,'536a5b1fde004dc24a8da3da9f579238',27,''),(21,1,'files/Readme.md','49af83716f8dcbfa89aaf835241c0b9f',2,'Readme.md',4,3,206,1717845637,1717845637,0,0,'6533beda05c99cfce7d122ed76daa98d',27,''),(22,1,'files/Reasons to use Nextcloud.pdf','418b19142a61c5bef296ea56ee144ca3',2,'Reasons to use Nextcloud.pdf',6,5,976625,1717845637,1717845637,0,0,'10f0d98f1f2f371e8b561d0bf61ace7e',27,''),(23,1,'files/Templates','530b342d0b8164ff3b4754c2273a453e',2,'Templates',2,1,108267,1717846010,1717845640,0,0,'66643ffa63ada',31,''),(24,1,'files/Templates/Business model canvas.odg','6a8f3e02bdf45c8b0671967969393bcb',23,'Business model canvas.odg',13,5,16988,1717845637,1717845637,0,0,'7f311d96490bc9a473546424b23465eb',27,''),(31,1,'files/Templates/Impact effort matrix.whiteboard','c5e3b589ec8f9dd6afdebe0ac6feeac8',23,'Impact effort matrix.whiteboard',16,5,52674,1717845638,1717845638,0,0,'7cabe62f8fae783fbcb5cf8bdb8363c1',27,''),(45,1,'files/Templates/SWOT analysis.whiteboard','3fd0e44b3e6f0e7144442ef6fc71a663',23,'SWOT analysis.whiteboard',16,5,38605,1717845640,1717845640,0,0,'4bf592d2e47017d14e438d4101c09448',27,''),(49,1,'files/Templates credits.md','f7c01e3e0b55bb895e09dc08d19375b3',2,'Templates credits.md',4,3,2403,1717845640,1717845640,0,0,'8c7dbd754ceadfaee76bdb3cd5d577f6',27,''),(50,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,0,1717845683,1717845683,0,0,'66643eb34004c',23,''),(51,2,'appdata_oc11dudfeyz7','acb87e3d6a0e7039633b192561567210',50,'appdata_oc11dudfeyz7',2,1,0,1717845694,1717845694,0,0,'66643eb0f2675',31,''),(52,2,'appdata_oc11dudfeyz7/js','3bd6af36f71220137b0ff62a19ec7d70',51,'js',2,1,0,1717845681,1717845681,0,0,'66643eb106d17',31,''),(53,2,'appdata_oc11dudfeyz7/js/core','589f10c9b6d745a1d243447be2b3be7c',52,'core',2,1,0,1717845681,1717845681,0,0,'66643eb10af99',31,''),(54,2,'appdata_oc11dudfeyz7/js/core/merged-template-prepend.js','65e149b0868e6e85adadc2da7faa8d5d',53,'merged-template-prepend.js',18,5,12288,1717845681,1717845681,0,0,'ecff693a74dd2a195175c1da860ac9bb',27,''),(55,2,'appdata_oc11dudfeyz7/js/core/merged-template-prepend.js.deps','b437c09d6a7d8c9dcfe23165aae7bed7',53,'merged-template-prepend.js.deps',16,5,250,1717845681,1717845681,0,0,'2cae7922b5a2fb3b6984a52f2fc89421',27,''),(56,2,'appdata_oc11dudfeyz7/js/core/merged-template-prepend.js.gzip','21ccde160d8589888a76391363bee910',53,'merged-template-prepend.js.gzip',19,5,3130,1717845681,1717845681,0,0,'1db9d9ca81a8eda21ac8ac89d9dcdbb1',27,''),(57,2,'appdata_oc11dudfeyz7/theming','b904939988c7f1122319da030a9f416a',51,'theming',2,1,0,1717845681,1717845681,0,0,'66643eb133987',31,''),(58,2,'appdata_oc11dudfeyz7/theming/global','fd9dd2a95c18f0c7109b934435527a86',57,'global',2,1,0,1717845694,1717845694,0,0,'66643eb136d9e',31,''),(59,2,'appdata_oc11dudfeyz7/appstore','09378d34d918cfd401f59693fa5e296f',51,'appstore',2,1,0,1717845779,1717845779,0,0,'66643eb32811a',31,''),(60,2,'appdata_oc11dudfeyz7/appstore/apps.json','743ca28a533fe4f4896f1af9f36ed129',59,'apps.json',20,5,2546184,1717845685,1717845685,0,0,'1fd7104915d234d719a2a026ec52297b',27,''),(61,2,'appdata_oc11dudfeyz7/avatar','c779dd072cf24ca2c239b55f3ff7ed0f',51,'avatar',2,1,0,1717845693,1717845693,0,0,'66643ebde4569',31,''),(62,2,'appdata_oc11dudfeyz7/avatar/admin','1dc920d2706c8e0218374b65bf5e7a2f',61,'admin',2,1,0,1717845873,1717845873,0,0,'66643ebdebe4b',31,''),(63,2,'appdata_oc11dudfeyz7/preview','99b992c0e9ad66aea8873ee10adabe0f',51,'preview',2,1,0,1717845694,1717845694,0,0,'66643ebe57244',31,''),(64,2,'appdata_oc11dudfeyz7/theming/global/0','f408b7dafc4ad24ec4ce7189ec81fd77',58,'0',2,1,0,1717846009,1717846009,0,0,'66643ebe5bc4d',31,''),(65,2,'appdata_oc11dudfeyz7/theming/global/0/icon-core-#0082c9filetypes_file.svg','591eb855bbac28b3f77050d5e5877106',64,'icon-core-#0082c9filetypes_file.svg',21,10,228,1717845694,1717845694,0,0,'323c80b20626f034536e88ca5ab17094',27,''),(66,2,'appdata_oc11dudfeyz7/preview/6','121e7f8e7131e45d0737ddef4c20c7df',63,'6',2,1,-1,1717845694,1717845694,0,0,'66643ebe6be73',31,''),(67,2,'appdata_oc11dudfeyz7/preview/6/7','fe6c629e2f7315c2c37ca83e7131ba3a',66,'7',2,1,-1,1717845694,1717845694,0,0,'66643ebe6a38e',31,''),(68,2,'appdata_oc11dudfeyz7/preview/f','5220fa52afc6d4c2cfd3d88125578e48',63,'f',2,1,-1,1717845694,1717845694,0,0,'66643ebe6db72',31,''),(69,2,'appdata_oc11dudfeyz7/preview/6/7/c','9ce0ff88df3e2cdaa42fe72f2bc071d4',67,'c',2,1,-1,1717845694,1717845694,0,0,'66643ebe689fe',31,''),(70,2,'appdata_oc11dudfeyz7/preview/6/7/c/6','a6d52d406c25e12b84e3264d6f27a80b',69,'6',2,1,-1,1717845694,1717845694,0,0,'66643ebe663d7',31,''),(71,2,'appdata_oc11dudfeyz7/preview/d','ee74617c0a38b76d50ad69a0565ab079',63,'d',2,1,-1,1717845694,1717845694,0,0,'66643ebe7202f',31,''),(72,2,'appdata_oc11dudfeyz7/preview/6/4','73c154758d0f65f2fcb37effb42d4d08',66,'4',2,1,-1,1717845694,1717845694,0,0,'66643ebe7423f',31,''),(73,2,'appdata_oc11dudfeyz7/preview/f/4','353de982dae1f2be035edbbf11b60244',68,'4',2,1,-1,1717845694,1717845694,0,0,'66643ebe6c7a6',31,''),(74,2,'appdata_oc11dudfeyz7/preview/d/9','65bf36ae99ea31e0e9c24151721589f9',71,'9',2,1,-1,1717845694,1717845694,0,0,'66643ebe6ead9',31,''),(75,2,'appdata_oc11dudfeyz7/preview/6/4/2','6baf0077fd0cb67119b08b452132e70f',72,'2',2,1,-1,1717845694,1717845694,0,0,'66643ebe6da4a',31,''),(76,2,'appdata_oc11dudfeyz7/preview/6/7/c/6/a','0b12477c290435367b30b2bf20988744',70,'a',2,1,-1,1717845694,1717845694,0,0,'66643ebe6572f',31,''),(77,2,'appdata_oc11dudfeyz7/preview/f/4/5','be42d81636fc49bd48aeed8db8a86b9f',73,'5',2,1,-1,1717845694,1717845694,0,0,'66643ebe6aba8',31,''),(78,2,'appdata_oc11dudfeyz7/preview/d/9/d','ac2142718eef897b90c3871a7f381df9',74,'d',2,1,-1,1717845694,1717845694,0,0,'66643ebe6dcb0',31,''),(79,2,'appdata_oc11dudfeyz7/preview/6/4/2/e','4093d4798b6ceb2080eed972b107378a',75,'e',2,1,-1,1717845694,1717845694,0,0,'66643ebe6c977',31,''),(80,2,'appdata_oc11dudfeyz7/preview/6/7/c/6/a/1','72f0128d145e1cfa4f2632c479d11759',76,'1',2,1,-1,1717845694,1717845694,0,0,'66643ebe64280',31,''),(81,2,'appdata_oc11dudfeyz7/preview/d/9/d/4','6b8ee3c7190e83ebe990ded831464049',78,'4',2,1,-1,1717845694,1717845694,0,0,'66643ebe6cf53',31,''),(82,2,'appdata_oc11dudfeyz7/preview/6/4/2/e/9','f94e959091ad6ae2f07e07f9f0eb6628',79,'9',2,1,-1,1717845694,1717845694,0,0,'66643ebe6a68e',31,''),(83,2,'appdata_oc11dudfeyz7/preview/f/4/5/7','7137e01aa9454e3b55d310441ad8a17d',77,'7',2,1,-1,1717845694,1717845694,0,0,'66643ebe69ef1',31,''),(84,2,'appdata_oc11dudfeyz7/preview/6/7/c/6/a/1/e','5ba5e557a153a31e6168e5b3f0ab5b13',80,'e',2,1,-1,1717845694,1717845694,0,0,'66643ebe627b6',31,''),(85,2,'appdata_oc11dudfeyz7/preview/f/4/5/7/c','b0baab46143990e6e9c102a18ae85318',83,'c',2,1,-1,1717845694,1717845694,0,0,'66643ebe6898b',31,''),(86,2,'appdata_oc11dudfeyz7/preview/6/4/2/e/9/2','d178c6b44de59e54d65430d03046b2c5',82,'2',2,1,-1,1717845694,1717845694,0,0,'66643ebe69319',31,''),(87,2,'appdata_oc11dudfeyz7/preview/d/9/d/4/f','21340287828e43faf02902b9ed5ceec2',81,'f',2,1,-1,1717845694,1717845694,0,0,'66643ebe6ba1a',31,''),(88,2,'appdata_oc11dudfeyz7/preview/f/4/5/7/c/5','2404346d40f7599b2a19fca1bd1aa219',85,'5',2,1,-1,1717845694,1717845694,0,0,'66643ebe66768',31,''),(89,2,'appdata_oc11dudfeyz7/preview/6/4/2/e/9/2/e','55c2d388faef7a6d904436c3b4a64601',86,'e',2,1,-1,1717845694,1717845694,0,0,'66643ebe684de',31,''),(90,2,'appdata_oc11dudfeyz7/preview/6/7/c/6/a/1/e/47','7964b2c910658204642fb7bd71e94a77',84,'47',2,1,0,1717845694,1717845694,0,0,'66643ebe612b4',31,''),(91,2,'appdata_oc11dudfeyz7/preview/d/9/d/4/f/4','f5f17dbce4603df0df3875527d1c5156',87,'4',2,1,-1,1717845694,1717845694,0,0,'66643ebe6a262',31,''),(92,2,'appdata_oc11dudfeyz7/preview/f/4/5/7/c/5/4','c156b52ae99bb3ce9cf3c3b293678907',88,'4',2,1,-1,1717845694,1717845694,0,0,'66643ebe656b4',31,''),(93,2,'appdata_oc11dudfeyz7/preview/f/4/5/7/c/5/4/49','b2fca98bbb0381b80b63f671ef070949',92,'49',2,1,0,1717845695,1717845695,0,0,'66643ebe6437e',31,''),(94,2,'appdata_oc11dudfeyz7/preview/6/4/2/e/9/2/e/48','4a2f00bb30ef3e56d7f5cd6ead992954',89,'48',2,1,0,1717845694,1717845694,0,0,'66643ebe66965',31,''),(95,2,'appdata_oc11dudfeyz7/preview/d/9/d/4/f/4/9','e292c43709cf36bd461b006e67e08c5e',91,'9',2,1,-1,1717845694,1717845694,0,0,'66643ebe68bf1',31,''),(96,2,'appdata_oc11dudfeyz7/preview/d/9/d/4/f/4/9/46','1a5b1300f70cdc5ab029ba58171ec8c1',95,'46',2,1,0,1717845694,1717845694,0,0,'66643ebe67f6b',31,''),(97,2,'appdata_oc11dudfeyz7/preview/1','64e960fcb4f4e4c6d611d2b3a0ce7479',63,'1',2,1,-1,1717845694,1717845694,0,0,'66643ebee3bde',31,''),(98,2,'appdata_oc11dudfeyz7/preview/1/9','dd7a18b6e2deffb8d0fde98101f754e3',97,'9',2,1,-1,1717845694,1717845694,0,0,'66643ebee26f7',31,''),(99,2,'appdata_oc11dudfeyz7/preview/a','1e39b98db5166c823bdfe21d6222675f',63,'a',2,1,-1,1717845694,1717845694,0,0,'66643ebee7c5f',31,''),(100,2,'appdata_oc11dudfeyz7/preview/1/9/c','3f26e916b8ac765722dfabbfe5af791d',98,'c',2,1,-1,1717845694,1717845694,0,0,'66643ebee090e',31,''),(101,2,'appdata_oc11dudfeyz7/preview/a/5','64cc4d822853f6ec8fab11e79e4eb746',99,'5',2,1,-1,1717845694,1717845694,0,0,'66643ebee70e7',31,''),(102,2,'appdata_oc11dudfeyz7/preview/1/9/c/a','c59fc139b595b48155d352d0a125fded',100,'a',2,1,-1,1717845694,1717845694,0,0,'66643ebedfdcc',31,''),(103,2,'appdata_oc11dudfeyz7/preview/a/5/b','0b91b5b669eecbbbea9f30c4f5ffc2a8',101,'b',2,1,-1,1717845694,1717845694,0,0,'66643ebee43fa',31,''),(104,2,'appdata_oc11dudfeyz7/preview/1/9/c/a/1','a52cd5c8128493682af340c4ad538da1',102,'1',2,1,-1,1717845694,1717845694,0,0,'66643ebedf102',31,''),(105,2,'appdata_oc11dudfeyz7/preview/a/5/b/f','eee0e3a22279b82b8abd86efe7866e83',103,'f',2,1,-1,1717845694,1717845694,0,0,'66643ebee31af',31,''),(106,2,'appdata_oc11dudfeyz7/preview/1/9/c/a/1/4','4195e846aa55377a65f3880387551419',104,'4',2,1,-1,1717845694,1717845694,0,0,'66643ebeddcea',31,''),(107,2,'appdata_oc11dudfeyz7/preview/a/5/b/f/c','6df88313bcf8614d0b7e5584f4a913a7',105,'c',2,1,-1,1717845694,1717845694,0,0,'66643ebee1574',31,''),(108,2,'appdata_oc11dudfeyz7/preview/1/9/c/a/1/4/e','9b919f3a4b98549b0645e0dff65f6e13',106,'e',2,1,-1,1717845694,1717845694,0,0,'66643ebedbd9f',31,''),(109,2,'appdata_oc11dudfeyz7/preview/a/5/b/f/c/9','7323c30b5379366af632554f4ff7d551',107,'9',2,1,-1,1717845694,1717845694,0,0,'66643ebee0470',31,''),(110,2,'appdata_oc11dudfeyz7/preview/1/9/c/a/1/4/e/36','f57381323b68ebe5ee864b325e402c9a',108,'36',2,1,0,1717845694,1717845694,0,0,'66643ebedb309',31,''),(111,2,'appdata_oc11dudfeyz7/preview/a/5/b/f/c/9/e','013790ad07e5342a8a2132b71d6d0f54',109,'e',2,1,-1,1717845694,1717845694,0,0,'66643ebedf9c0',31,''),(112,2,'appdata_oc11dudfeyz7/preview/a/5/b/f/c/9/e/37','be7825c8ebb4516a32628ce5e327095a',111,'37',2,1,0,1717845694,1717845694,0,0,'66643ebedf032',31,''),(113,2,'appdata_oc11dudfeyz7/preview/f/4/5/7/c/5/4/49/4096-4096-max.png','c8eb902de0404d8e708864f3b2e07df5',93,'4096-4096-max.png',11,10,198113,1717845695,1717845695,0,0,'a368a93744f7dee915cd4989f208a20c',27,''),(114,2,'appdata_oc11dudfeyz7/preview/f/4/5/7/c/5/4/49/256-256-crop.png','fc068a92047315cc2991c322440a00e9',93,'256-256-crop.png',11,10,34261,1717845695,1717845695,0,0,'bff648a6c8bfd78f21ca8fd08eae4744',27,''),(115,2,'appdata_oc11dudfeyz7/avatar/admin/avatar.png','64eb7093657269501de2362c2e48f682',62,'avatar.png',11,10,15643,1717845695,1717845695,0,0,'118fe787afc6b83e76b1370349e27256',27,''),(116,2,'appdata_oc11dudfeyz7/avatar/admin/generated','479d13d085356e5f808f8ae0add09f79',62,'generated',16,5,0,1717845695,1717845695,0,0,'159c7ba7a220e9b9cf6ae1065d9ff99d',27,''),(117,2,'appdata_oc11dudfeyz7/avatar/admin/avatar.64.png','659bf697da22c3c3878d1ca856c4cadf',62,'avatar.64.png',11,10,792,1717845695,1717845695,0,0,'2b78fe9ecf0f23853e075c87fe892e56',27,''),(118,2,'appdata_oc11dudfeyz7/preview/9','da38f8594ff4c1beea2ecbd0423730ea',63,'9',2,1,-1,1717845768,1717845768,0,0,'66643f08aa57b',31,''),(119,2,'appdata_oc11dudfeyz7/preview/c','d46daaba359f0b8471cf8b1891b14dbc',63,'c',2,1,-1,1717845768,1717845768,0,0,'66643f08ab401',31,''),(120,2,'appdata_oc11dudfeyz7/preview/c/7','873bef85a4acd623b1c425676bb19750',119,'7',2,1,-1,1717845768,1717845768,0,0,'66643f08a9d12',31,''),(121,2,'appdata_oc11dudfeyz7/preview/9/8','fe32ee01500e39d166f86914b4da14a4',118,'8',2,1,-1,1717845768,1717845768,0,0,'66643f08a90df',31,''),(122,2,'appdata_oc11dudfeyz7/preview/9/8/f','d00825652cd66c286057240873de91bf',121,'f',2,1,-1,1717845768,1717845768,0,0,'66643f08a7f1b',31,''),(123,2,'appdata_oc11dudfeyz7/preview/c/7/4','cc62f3765e0895b4ea3091e8fe05b135',120,'4',2,1,-1,1717845768,1717845768,0,0,'66643f08a8b46',31,''),(124,2,'appdata_oc11dudfeyz7/preview/c/7/4/d','ccd098649658d4507bd8b6622421537f',123,'d',2,1,-1,1717845768,1717845768,0,0,'66643f08a7f1f',31,''),(125,2,'appdata_oc11dudfeyz7/preview/9/8/f/1','914902b0bc772545a8aabd5ccb5e132c',122,'1',2,1,-1,1717845768,1717845768,0,0,'66643f08a6e61',31,''),(126,2,'appdata_oc11dudfeyz7/preview/c/7/4/d/9','203b85ade84c4122ee4c68abf5465de2',124,'9',2,1,-1,1717845768,1717845768,0,0,'66643f08a6ac3',31,''),(127,2,'appdata_oc11dudfeyz7/preview/1/f','c53d49d63852713a2a92045d90ed6658',97,'f',2,1,-1,1717845768,1717845768,0,0,'66643f08b1543',31,''),(128,2,'appdata_oc11dudfeyz7/preview/9/8/f/1/3','e75023a9f818c8bef8b71e64a487a0c0',125,'3',2,1,-1,1717845768,1717845768,0,0,'66643f08a625b',31,''),(129,2,'appdata_oc11dudfeyz7/preview/9/8/f/1/3/7','a0177f63f5b454e015d446ef2a10bf33',128,'7',2,1,-1,1717845768,1717845768,0,0,'66643f08a4df1',31,''),(130,2,'appdata_oc11dudfeyz7/preview/c/7/4/d/9/7','46f2ca4f963cecefe7421a05cfd9f30b',126,'7',2,1,-1,1717845768,1717845768,0,0,'66643f08a4ad6',31,''),(131,2,'appdata_oc11dudfeyz7/preview/1/f/0','c855dcefbec73e7b56f5dbf6a84d4f67',127,'0',2,1,-1,1717845768,1717845768,0,0,'66643f08aff6f',31,''),(132,2,'appdata_oc11dudfeyz7/preview/c/7/4/d/9/7/b','aa723ec4665baa182269d8819f58b09d',130,'b',2,1,-1,1717845768,1717845768,0,0,'66643f08a3b4e',31,''),(133,2,'appdata_oc11dudfeyz7/preview/9/8/f/1/3/7/0','1befa3e221844e078c292ffaa63672d6',129,'0',2,1,-1,1717845768,1717845768,0,0,'66643f08a3968',31,''),(134,2,'appdata_oc11dudfeyz7/preview/1/f/0/e','bf0dff845875aabb81a6c371e3be1829',131,'e',2,1,-1,1717845768,1717845768,0,0,'66643f08ae838',31,''),(135,2,'appdata_oc11dudfeyz7/preview/c/7/4/d/9/7/b/16','c921b2a4328d21a95097a2b790e003df',132,'16',2,1,0,1717845961,1717845961,0,0,'66643f08a2e21',31,''),(136,2,'appdata_oc11dudfeyz7/preview/9/8/f/1/3/7/0/20','dc62885ff6e7b40e73817936587bdad0',133,'20',2,1,0,1717845961,1717845961,0,0,'66643f08a2fde',31,''),(137,2,'appdata_oc11dudfeyz7/preview/1/f/0/e/3','b310c793afd0607b85dcb739b2721d35',134,'3',2,1,-1,1717845768,1717845768,0,0,'66643f08ac9d2',31,''),(138,2,'appdata_oc11dudfeyz7/preview/1/f/0/e/3/d','dbdfbe5ebb55ded4d1a0006f287b7473',137,'d',2,1,-1,1717845768,1717845768,0,0,'66643f08aba94',31,''),(139,2,'appdata_oc11dudfeyz7/preview/1/f/0/e/3/d/a','1a5e07031ecdcd669c2bc5f00e6a1507',138,'a',2,1,-1,1717845768,1717845768,0,0,'66643f08aa44c',31,''),(140,2,'appdata_oc11dudfeyz7/preview/1/f/0/e/3/d/a/19','dac35afaeab41ba12ce7cac3e91fa175',139,'19',2,1,0,1717845769,1717845769,0,0,'66643f08a8b04',31,''),(141,2,'appdata_oc11dudfeyz7/preview/1/f/0/e/3/d/a/19/1600-1067-max.jpg','3afcb4c4d4f1cb77ab89ce93d3d9e3a9',140,'1600-1067-max.jpg',12,10,137923,1717845769,1717845769,0,0,'cba7f2d850f4c834a61f22487bb7a4bb',27,''),(142,2,'appdata_oc11dudfeyz7/preview/6/f','64e8e14d9c3ec641383c3ab3dc6baaa5',66,'f',2,1,-1,1717845769,1717845769,0,0,'66643f091496f',31,''),(143,2,'appdata_oc11dudfeyz7/preview/6/f/4','ab3b29b0ecd0d9ea5a6c329c02d89497',142,'4',2,1,-1,1717845769,1717845769,0,0,'66643f0912b96',31,''),(144,2,'appdata_oc11dudfeyz7/preview/9/8/f/1/3/7/0/20/1920-1281-max.jpg','87e92789e686fa20c1a5362ee98368a5',136,'1920-1281-max.jpg',12,10,294390,1717845769,1717845769,0,0,'e8619daf2e7c639084aa9f84dfee6b35',27,''),(145,2,'appdata_oc11dudfeyz7/preview/6/f/4/9','4672aac98bfb1af126521b9d6f5437f8',143,'9',2,1,-1,1717845769,1717845769,0,0,'66643f0911f42',31,''),(146,2,'appdata_oc11dudfeyz7/preview/6/f/4/9/2','327dbf6e042287891dffee057ea5091b',145,'2',2,1,-1,1717845769,1717845769,0,0,'66643f09106fc',31,''),(147,2,'appdata_oc11dudfeyz7/preview/6/f/4/9/2/2','0a358e5ce78195dd572c383c429c20d3',146,'2',2,1,-1,1717845769,1717845769,0,0,'66643f090f923',31,''),(148,2,'appdata_oc11dudfeyz7/preview/6/f/4/9/2/2/f','9f09154be69eb68123f467ad72149678',147,'f',2,1,-1,1717845769,1717845769,0,0,'66643f090d669',31,''),(149,2,'appdata_oc11dudfeyz7/preview/6/f/4/9/2/2/f/18','32b367657ec0f9d06bbde2920c99df45',148,'18',2,1,0,1717845769,1717845769,0,0,'66643f090bd21',31,''),(150,2,'appdata_oc11dudfeyz7/preview/1/f/0/e/3/d/a/19/64-43.jpg','81acd7a4151c891596db99c887738f70',140,'64-43.jpg',12,10,1783,1717845769,1717845769,0,0,'b73e4242414c90308a5546966a975b7b',27,''),(151,2,'appdata_oc11dudfeyz7/preview/9/8/f/1/3/7/0/20/64-43.jpg','369288a685ae8310da40676e7de6e919',136,'64-43.jpg',12,10,1556,1717845769,1717845769,0,0,'943901e70a8ffdf002a629ba9ceb284e',27,''),(152,2,'appdata_oc11dudfeyz7/preview/c/7/4/d/9/7/b/16/3000-2000-max.jpg','4cc76b0be65e29f18c9fc9e932824668',135,'3000-2000-max.jpg',12,10,808212,1717845769,1717845769,0,0,'a498fe609b3bffdb3f1a0f0a3922e04a',27,''),(153,2,'appdata_oc11dudfeyz7/preview/6/f/4/9/2/2/f/18/1200-1800-max.jpg','1ea5dc34ff6575201562402631291dce',149,'1200-1800-max.jpg',12,10,207095,1717845769,1717845769,0,0,'0656a35b623168a341a1d0425480d8a0',27,''),(154,2,'appdata_oc11dudfeyz7/preview/6/f/4/9/2/2/f/18/43-64.jpg','cc678d468a7b334d2b6e47edd17d602a',149,'43-64.jpg',12,10,1188,1717845769,1717845769,0,0,'9a22356785f4fe1bf815c78debd5ea8b',27,''),(155,2,'appdata_oc11dudfeyz7/preview/1/f/0/e/3/d/a/19/1024-683.jpg','fc1486e81b0bee2082962a59ad6680bf',140,'1024-683.jpg',12,10,85790,1717845769,1717845769,0,0,'ea7517af296777f980c2a28a41ab9398',27,''),(156,2,'appdata_oc11dudfeyz7/preview/c/7/4/d/9/7/b/16/1024-683.jpg','a125b807049d3e7d5ae4fec283a7c9ac',135,'1024-683.jpg',12,10,170172,1717845769,1717845769,0,0,'ac7fc0ffb6fab0edc5bce54b81066788',27,''),(157,2,'appdata_oc11dudfeyz7/preview/6/f/4/9/2/2/f/18/683-1024.jpg','6e7b853232bec841dc61af0cbacc770c',149,'683-1024.jpg',12,10,67059,1717845769,1717845769,0,0,'053c479ba676403b859517bb6c4427b2',27,''),(158,2,'appdata_oc11dudfeyz7/appstore/categories.json','c58c38f63c772f4fa9f5d58f10ec8844',59,'categories.json',20,5,163493,1717845779,1717845779,0,0,'7fc7e6f2161490c8020120d7f82d2aff',27,''),(159,2,'appdata_oc11dudfeyz7/preview/a/5/7','06ad6cccc8467aceb16d3526d42f91ee',101,'7',2,1,-1,1717845786,1717845786,0,0,'66643f1a197d6',31,''),(160,2,'appdata_oc11dudfeyz7/preview/a/5/7/7','eb77b31fd90d8e348767621a11be80a8',159,'7',2,1,-1,1717845786,1717845786,0,0,'66643f1a184ad',31,''),(161,2,'appdata_oc11dudfeyz7/preview/a/5/7/7/1','4f14ae9a0eb687f16452a63df1b3b007',160,'1',2,1,-1,1717845786,1717845786,0,0,'66643f1a17197',31,''),(162,2,'appdata_oc11dudfeyz7/preview/a/5/7/7/1/b','7e3da06a0c926656e193007f3f8e9eae',161,'b',2,1,-1,1717845786,1717845786,0,0,'66643f1a16696',31,''),(163,2,'appdata_oc11dudfeyz7/preview/d/6','993ee3652f322e3213716b21ec77ba32',71,'6',2,1,-1,1717845786,1717845786,0,0,'66643f1a1e833',31,''),(164,2,'appdata_oc11dudfeyz7/preview/a/5/7/7/1/b/c','6d933f50224a2acfcab5c8d4e08a9752',162,'c',2,1,-1,1717845786,1717845786,0,0,'66643f1a15221',31,''),(165,2,'appdata_oc11dudfeyz7/preview/d/6/7','74442c0f09ba1fc1461aea5171e8bd77',163,'7',2,1,-1,1717845786,1717845786,0,0,'66643f1a1dccb',31,''),(166,2,'appdata_oc11dudfeyz7/preview/d/6/7/d','0fb302d71fa857cc197faa460c42e028',165,'d',2,1,-1,1717845786,1717845786,0,0,'66643f1a1ce7f',31,''),(167,2,'appdata_oc11dudfeyz7/preview/a/5/7/7/1/b/c/38','d20344c8f69d3f0442fa91f44d678a99',164,'38',2,1,0,1717845786,1717845786,0,0,'66643f1a141d4',31,''),(168,2,'appdata_oc11dudfeyz7/preview/d/6/7/d/8','d80f7edbc6be5a1c60419dc399d3b840',166,'8',2,1,-1,1717845786,1717845786,0,0,'66643f1a1bd44',31,''),(169,2,'appdata_oc11dudfeyz7/preview/d/6/4','ee001f91b158e12af7d470840c93fd70',163,'4',2,1,-1,1717845786,1717845786,0,0,'66643f1a2410b',31,''),(170,2,'appdata_oc11dudfeyz7/preview/d/6/7/d/8/a','ddc240185ba86f87558cae22d84dcf53',168,'a',2,1,-1,1717845786,1717845786,0,0,'66643f1a1a383',31,''),(171,2,'appdata_oc11dudfeyz7/preview/d/6/7/d/8/a/b','ec18dfeb83b6a2d1e48a1e38c40661fe',170,'b',2,1,-1,1717845786,1717845786,0,0,'66643f1a199c5',31,''),(172,2,'appdata_oc11dudfeyz7/preview/d/6/4/5','877abecc2997e1232894f3de8aa08f73',169,'5',2,1,-1,1717845786,1717845786,0,0,'66643f1a21db9',31,''),(173,2,'appdata_oc11dudfeyz7/preview/d/6/7/d/8/a/b/39','6e3a8086125db422403093a43cdcc782',171,'39',2,1,0,1717845786,1717845786,0,0,'66643f1a18cad',31,''),(174,2,'appdata_oc11dudfeyz7/preview/d/6/4/5/9','2b321f5dcc56f671e962faa98be91ed9',172,'9',2,1,-1,1717845786,1717845786,0,0,'66643f1a20c9b',31,''),(175,2,'appdata_oc11dudfeyz7/preview/d/6/4/5/9/2','5f34920dce0b979fbd649899de0ce19f',174,'2',2,1,-1,1717845786,1717845786,0,0,'66643f1a2022a',31,''),(176,2,'appdata_oc11dudfeyz7/preview/d/6/4/5/9/2/0','5a82d818676da52b9b5fa71b8ab5aeed',175,'0',2,1,-1,1717845786,1717845786,0,0,'66643f1a1e58b',31,''),(177,2,'appdata_oc11dudfeyz7/preview/d/6/4/5/9/2/0/40','40c3b76f82ad2a5912403e6dc3f3880a',176,'40',2,1,0,1717845786,1717845786,0,0,'66643f1a1d730',31,''),(178,2,'appdata_oc11dudfeyz7/preview/3','e676bc547ace1dab0a85c9763a07f0f5',63,'3',2,1,-1,1717845786,1717845786,0,0,'66643f1a399ea',31,''),(179,2,'appdata_oc11dudfeyz7/preview/3/4','cc6ad671409fafd5ec314ba07a5f1eb8',178,'4',2,1,-1,1717845786,1717845786,0,0,'66643f1a39026',31,''),(180,2,'appdata_oc11dudfeyz7/preview/3/4/1','638f5dfcc6b6ed7746b2582110711059',179,'1',2,1,-1,1717845786,1717845786,0,0,'66643f1a38621',31,''),(181,2,'appdata_oc11dudfeyz7/preview/3/4/1/6','4f4b1652573555f89c38b31e0a171b5b',180,'6',2,1,-1,1717845786,1717845786,0,0,'66643f1a3705c',31,''),(182,2,'appdata_oc11dudfeyz7/preview/3/4/1/6/a','47f7c2c7c1e4e6a84d61851af621fc71',181,'a',2,1,-1,1717845786,1717845786,0,0,'66643f1a3651b',31,''),(183,2,'appdata_oc11dudfeyz7/preview/3/4/1/6/a/7','d0b4d1bda1ab5725ea7a37f283ea274a',182,'7',2,1,-1,1717845786,1717845786,0,0,'66643f1a34ee5',31,''),(184,2,'appdata_oc11dudfeyz7/preview/3/4/1/6/a/7/5','366aa1df7c3c7d6e46f67b8e5dc739e3',183,'5',2,1,-1,1717845786,1717845786,0,0,'66643f1a34162',31,''),(185,2,'appdata_oc11dudfeyz7/preview/3/4/1/6/a/7/5/41','3410904009178374c0942597b62bd998',184,'41',2,1,0,1717845786,1717845786,0,0,'66643f1a32934',31,''),(186,2,'appdata_oc11dudfeyz7/preview/a/1','60ae57919b26e3f28c441afed92e43b9',99,'1',2,1,-1,1717845786,1717845786,0,0,'66643f1a6f64f',31,''),(187,2,'appdata_oc11dudfeyz7/preview/a/1/d','700cec2a9c82f0ae06fba1b9884ac557',186,'d',2,1,-1,1717845786,1717845786,0,0,'66643f1a6efc2',31,''),(188,2,'appdata_oc11dudfeyz7/preview/a/1/d/0','c77937f3314c40fe94f1f226f7394162',187,'0',2,1,-1,1717845786,1717845786,0,0,'66643f1a6e8f9',31,''),(189,2,'appdata_oc11dudfeyz7/preview/a/1/d/0/c','37b58dcaa60bf5a2522015625280a378',188,'c',2,1,-1,1717845786,1717845786,0,0,'66643f1a6dbcb',31,''),(190,2,'appdata_oc11dudfeyz7/preview/a/1/d/0/c/6','55eeefa28202e1410213f6c3e4f03475',189,'6',2,1,-1,1717845786,1717845786,0,0,'66643f1a6c912',31,''),(191,2,'appdata_oc11dudfeyz7/preview/a/1/d/0/c/6/e','94005deae976931ea2737f96dbc3e766',190,'e',2,1,-1,1717845786,1717845786,0,0,'66643f1a6c213',31,''),(192,2,'appdata_oc11dudfeyz7/preview/a/1/d/0/c/6/e/42','220e64a972fc57c092a5d18064f73e25',191,'42',2,1,0,1717845786,1717845786,0,0,'66643f1a6bb21',31,''),(193,2,'appdata_oc11dudfeyz7/avatar/admin/avatar-dark.64.png','2aabd2cd79757210b138c5ee42df2d9f',62,'avatar-dark.64.png',11,10,827,1717845873,1717845873,0,0,'26026bfbf2e3c424352dfeb0464fc9d3',27,''),(194,2,'appdata_oc11dudfeyz7/preview/9/8/f/1/3/7/0/20/1024-683.jpg','8114e3fc83bfdea28b35a6b9e1e17cf0',136,'1024-683.jpg',12,10,101252,1717845961,1717845961,0,0,'0dea79829db9fb1d370cf639abd8f733',27,''),(195,2,'appdata_oc11dudfeyz7/preview/c/7/4/d/9/7/b/16/64-43.jpg','070b01e292d8b7cc0b5b484c5be63557',135,'64-43.jpg',12,10,1747,1717845961,1717845961,0,0,'df2e45a5c85ebafa74826e0e71a24026',27,''),(196,2,'appdata_oc11dudfeyz7/theming/global/0/icon-core-#04577efiletypes_x-office-spreadsheet.svg','24dd2adff02a4417a0f8c3defed61ffc',64,'icon-core-#04577efiletypes_x-office-spreadsheet.svg',21,10,317,1717846008,1717846008,0,0,'909d3f0364cf7e9d6c484dfa08372901',27,''),(197,2,'appdata_oc11dudfeyz7/theming/global/0/icon-core-#04577efiletypes_x-office-document.svg','d7296b2ef9a2e715d3cd6b441ca2d260',64,'icon-core-#04577efiletypes_x-office-document.svg',21,10,304,1717846008,1717846008,0,0,'4786a39c40fb5f386fa317f2936f3fd0',27,''),(198,2,'appdata_oc11dudfeyz7/theming/global/0/icon-core-#04577efiletypes_x-office-presentation.svg','d3b0bbf195786cfef9e4d353a322d17f',64,'icon-core-#04577efiletypes_x-office-presentation.svg',21,10,221,1717846008,1717846008,0,0,'c9206ac7c3a0790e7e16ddbc74eec532',27,''),(199,2,'appdata_oc11dudfeyz7/theming/global/0/icon-core-#04577efiletypes_file.svg','79b27bfa04cdd59df273ec1583beb3fd',64,'icon-core-#04577efiletypes_file.svg',21,10,228,1717846008,1717846008,0,0,'9e409e72ba9975c9ed2ef10529cdeb69',27,''),(200,2,'appdata_oc11dudfeyz7/preview/f/7','4ef505c0a92a7d76e21943c27b3e99ee',68,'7',2,1,-1,1717846009,1717846009,0,0,'66643ff917317',31,''),(201,2,'appdata_oc11dudfeyz7/preview/f/7/1','3065bdb213afdadce03efc62037da63a',200,'1',2,1,-1,1717846009,1717846009,0,0,'66643ff9161a8',31,''),(202,2,'appdata_oc11dudfeyz7/preview/f/7/1/7','24c5b6e30e3472d7e7023c7c8d063000',201,'7',2,1,-1,1717846009,1717846009,0,0,'66643ff915757',31,''),(203,2,'appdata_oc11dudfeyz7/preview/f/7/1/7/7','3304e138794400cbedd5d1263d6c7ae4',202,'7',2,1,-1,1717846009,1717846009,0,0,'66643ff914877',31,''),(204,2,'appdata_oc11dudfeyz7/preview/f/7/1/7/7/1','1f1e3536577602b3a69e895b489c33b8',203,'1',2,1,-1,1717846009,1717846009,0,0,'66643ff912911',31,''),(205,2,'appdata_oc11dudfeyz7/preview/f/7/1/7/7/1/6','f7e97bf8d717ea266fa4dba3737f77ea',204,'6',2,1,-1,1717846009,1717846009,0,0,'66643ff910d7d',31,''),(206,2,'appdata_oc11dudfeyz7/preview/f/7/1/7/7/1/6/44','b21ea426fee50960404050ee45423631',205,'44',2,1,0,1717846009,1717846009,0,0,'66643ff90ef51',31,''),(207,2,'appdata_oc11dudfeyz7/theming/global/0/icon-core-#04577efiletypes_text.svg','64e6312d1c48e5675f08636ce41ba575',64,'icon-core-#04577efiletypes_text.svg',21,10,299,1717846009,1717846009,0,0,'959be64c63a1faef03458ffa7fc01b32',27,''),(208,2,'appdata_oc11dudfeyz7/preview/1/7','824b939f5a3132ebdd6ddf703939c4bf',97,'7',2,1,-1,1717846009,1717846009,0,0,'66643ff94d03b',31,''),(209,2,'appdata_oc11dudfeyz7/preview/1/7/e','4a483f9e0e73c86b61c2799787cf28c0',208,'e',2,1,-1,1717846009,1717846009,0,0,'66643ff94b248',31,''),(210,2,'appdata_oc11dudfeyz7/preview/1/7/e/6','6cd020a4ff0e4d3caff018bdabb1853f',209,'6',2,1,-1,1717846009,1717846009,0,0,'66643ff94a348',31,''),(211,2,'appdata_oc11dudfeyz7/preview/1/7/e/6/2','4cc2c3fbf469ee43d02d614e21197bf9',210,'2',2,1,-1,1717846009,1717846009,0,0,'66643ff948e0d',31,''),(212,2,'appdata_oc11dudfeyz7/preview/1/7/e/6/2/1','f584bf194ba9a89665cc473da53d16ec',211,'1',2,1,-1,1717846009,1717846009,0,0,'66643ff946916',31,''),(213,2,'appdata_oc11dudfeyz7/preview/1/7/e/6/2/1/6','931077e0d3a8d9334a78a7933a2bc311',212,'6',2,1,-1,1717846009,1717846009,0,0,'66643ff94414b',31,''),(214,2,'appdata_oc11dudfeyz7/preview/1/7/e/6/2/1/6/43','554cf062b701415e77e614b68d02712d',213,'43',2,1,0,1717846009,1717846009,0,0,'66643ff943147',31,''),(215,2,'appdata_oc11dudfeyz7/theming/global/0/icon-core-#04577efiletypes_x-office-drawing.svg','26bcc3c01e4ec9525028074023f77246',64,'icon-core-#04577efiletypes_x-office-drawing.svg',21,10,369,1717846009,1717846009,0,0,'583080b965fc2477daaa8449b5ec72ea',27,''),(216,2,'appdata_oc11dudfeyz7/preview/1/c','39e69da859a4af7cb809d3e8285e12c1',97,'c',2,1,-1,1717846009,1717846009,0,0,'66643ff98ee0c',31,''),(217,2,'appdata_oc11dudfeyz7/preview/1/c/3','dbfa811ecfe1bd5cdf542f1bd5a5c461',216,'3',2,1,-1,1717846009,1717846009,0,0,'66643ff98d1e4',31,''),(218,2,'appdata_oc11dudfeyz7/preview/1/c/3/8','007f11871a280de91cfb41efd594f3b9',217,'8',2,1,-1,1717846009,1717846009,0,0,'66643ff98bef8',31,''),(219,2,'appdata_oc11dudfeyz7/preview/e','ba0a878b002a8dae12f5c55bc4962570',63,'e',2,1,-1,1717846009,1717846009,0,0,'66643ff993a03',31,''),(220,2,'appdata_oc11dudfeyz7/preview/1/c/3/8/3','40e36ee9048c960e442d43891c722f92',218,'3',2,1,-1,1717846009,1717846009,0,0,'66643ff98ac36',31,''),(221,2,'appdata_oc11dudfeyz7/preview/e/3','5f7ab42b24f86b5470b8239c1c8189fa',219,'3',2,1,-1,1717846009,1717846009,0,0,'66643ff9913d3',31,''),(222,2,'appdata_oc11dudfeyz7/preview/1/c/3/8/3/c','2f6a12ae5bce2f62e3cdb51a90f68182',220,'c',2,1,-1,1717846009,1717846009,0,0,'66643ff9887ac',31,''),(223,2,'appdata_oc11dudfeyz7/preview/e/3/6','2e7dafd499eba8a34a82d580d064ce07',221,'6',2,1,-1,1717846009,1717846009,0,0,'66643ff98f687',31,''),(224,2,'appdata_oc11dudfeyz7/preview/1/c/3/8/3/c/d','f6796051cb292ac1c880ff7f2087e9cf',222,'d',2,1,-1,1717846009,1717846009,0,0,'66643ff98780d',31,''),(225,2,'appdata_oc11dudfeyz7/preview/e/3/6/9','d0c223989736e829ade011b788c1cc96',223,'9',2,1,-1,1717846009,1717846009,0,0,'66643ff98e0d0',31,''),(226,2,'appdata_oc11dudfeyz7/preview/1/c/3/8/3/c/d/35','7d27b14e8581cc24b7488ef13eea181e',224,'35',2,1,0,1717846009,1717846009,0,0,'66643ff985c28',31,''),(227,2,'appdata_oc11dudfeyz7/preview/e/3/6/9/8','41b7536fba4316ecb4c60b2c1746cf63',225,'8',2,1,-1,1717846009,1717846009,0,0,'66643ff98c7e0',31,''),(228,2,'appdata_oc11dudfeyz7/preview/e/3/6/9/8/5','5d27702216c2d75168417c1ea7794666',227,'5',2,1,-1,1717846009,1717846009,0,0,'66643ff98b208',31,''),(229,2,'appdata_oc11dudfeyz7/preview/e/3/6/9/8/5/3','c205943592791dd78926bdf5282349fe',228,'3',2,1,-1,1717846009,1717846009,0,0,'66643ff9887ac',31,''),(230,2,'appdata_oc11dudfeyz7/preview/e/3/6/9/8/5/3/34','ae49d3835df58761892fb16f78f70f3b',229,'34',2,1,0,1717846009,1717846009,0,0,'66643ff987f7f',31,''),(231,2,'appdata_oc11dudfeyz7/preview/6/3','341b848f200b10cd14121e5012bd3879',66,'3',2,1,-1,1717846009,1717846009,0,0,'66643ff9a11c1',31,''),(232,2,'appdata_oc11dudfeyz7/preview/6/3/6','0a691dd90c4c5f8269efcf9081e61c2f',231,'6',2,1,-1,1717846009,1717846009,0,0,'66643ff99fd8b',31,''),(233,2,'appdata_oc11dudfeyz7/preview/6/3/6/4','1bfe326d1d0cbbd8ed98ea5c189c4f7b',232,'4',2,1,-1,1717846009,1717846009,0,0,'66643ff99e81a',31,''),(234,2,'appdata_oc11dudfeyz7/preview/1/8','43a559cb258053bdbb3a8731dfb64b15',97,'8',2,1,-1,1717846009,1717846009,0,0,'66643ff9a5b11',31,''),(235,2,'appdata_oc11dudfeyz7/preview/6/3/6/4/d','a1be9f33776f57d6aafde84db4205d1e',233,'d',2,1,-1,1717846009,1717846009,0,0,'66643ff99c3bd',31,''),(236,2,'appdata_oc11dudfeyz7/preview/1/8/2','519df1adc4a9beb79f5af1906e7ab519',234,'2',2,1,-1,1717846009,1717846009,0,0,'66643ff9a476e',31,''),(237,2,'appdata_oc11dudfeyz7/preview/6/3/6/4/d/3','7499052a4c36667002ff692421376429',235,'3',2,1,-1,1717846009,1717846009,0,0,'66643ff99b698',31,''),(238,2,'appdata_oc11dudfeyz7/preview/1/8/2/b','6dbb97317adaf9140a7755a86589d859',236,'b',2,1,-1,1717846009,1717846009,0,0,'66643ff9a11cb',31,''),(239,2,'appdata_oc11dudfeyz7/preview/6/3/6/4/d/3/f','db910f0d55560f025c06d9995a666701',237,'f',2,1,-1,1717846009,1717846009,0,0,'66643ff999087',31,''),(240,2,'appdata_oc11dudfeyz7/preview/1/8/2/b/e','8fa4b8be743399b5973db8732675be24',238,'e',2,1,-1,1717846009,1717846009,0,0,'66643ff9a0461',31,''),(241,2,'appdata_oc11dudfeyz7/preview/6/3/6/4/d/3/f/32','46c98b2923e2980e3ebf642bf7b52df3',239,'32',2,1,0,1717846009,1717846009,0,0,'66643ff9982ac',31,''),(242,2,'appdata_oc11dudfeyz7/preview/1/8/2/b/e/0','73097123db90ea8cf6a14fb65a347c29',240,'0',2,1,-1,1717846009,1717846009,0,0,'66643ff99e9e4',31,''),(243,2,'appdata_oc11dudfeyz7/preview/1/8/2/b/e/0/c','8c4ca0a1c5aaa88ee7b34e684bcbfcd8',242,'c',2,1,-1,1717846009,1717846009,0,0,'66643ff99c3bd',31,''),(244,2,'appdata_oc11dudfeyz7/preview/1/8/2/b/e/0/c/33','3dbe98eccbc7c3f7f10e6424d8248465',243,'33',2,1,0,1717846009,1717846009,0,0,'66643ff99b651',31,''),(245,2,'appdata_oc11dudfeyz7/preview/3/4/1/7','1119ae653c4ea73b941bf4c06bae5197',180,'7',2,1,-1,1717846009,1717846009,0,0,'66643ff9d0862',31,''),(246,2,'appdata_oc11dudfeyz7/preview/6/e','f3f5f6829bcc78c87496b00cc6aebf4e',66,'e',2,1,-1,1717846009,1717846009,0,0,'66643ff9d0a98',31,''),(247,2,'appdata_oc11dudfeyz7/preview/3/4/1/7/3','c06bba2def23ad87434826a74bb8012d',245,'3',2,1,-1,1717846009,1717846009,0,0,'66643ff9ce486',31,''),(248,2,'appdata_oc11dudfeyz7/preview/6/e/a','ffe57c94835904c9ee39ffe281ed8097',246,'a',2,1,-1,1717846009,1717846009,0,0,'66643ff9ce82e',31,''),(249,2,'appdata_oc11dudfeyz7/preview/3/4/1/7/3/c','3e660b6754cb86ca952e05745164694d',247,'c',2,1,-1,1717846009,1717846009,0,0,'66643ff9cca39',31,''),(250,2,'appdata_oc11dudfeyz7/preview/6/e/a/9','fd3ca41735a6487d2e68643fd2a83cce',248,'9',2,1,-1,1717846009,1717846009,0,0,'66643ff9cd25b',31,''),(251,2,'appdata_oc11dudfeyz7/preview/3/4/1/7/3/c/b','34ac265ece848ff8d539db73639fb191',249,'b',2,1,-1,1717846009,1717846009,0,0,'66643ff9ca023',31,''),(252,2,'appdata_oc11dudfeyz7/preview/6/e/a/9/a','9732f731944385647a2b8b24861f879d',250,'a',2,1,-1,1717846009,1717846009,0,0,'66643ff9cc653',31,''),(253,2,'appdata_oc11dudfeyz7/preview/6/e/a/9/a/b','441fe2d1d2afcf7f6152b7f71539d27d',252,'b',2,1,-1,1717846009,1717846009,0,0,'66643ff9c9b34',31,''),(254,2,'appdata_oc11dudfeyz7/preview/6/e/a/9/a/b/1','63da5eaf51ca7555b973fdfce572547b',253,'1',2,1,-1,1717846009,1717846009,0,0,'66643ff9c75fb',31,''),(255,2,'appdata_oc11dudfeyz7/preview/3/4/1/7/3/c/b/30','d5abab5dd1f83d67c020bf649bb2e79c',251,'30',2,1,0,1717846009,1717846009,0,0,'66643ff9c65a1',31,''),(256,2,'appdata_oc11dudfeyz7/preview/6/e/a/9/a/b/1/29','b44944eb7904b2c4116e73dd95d90b86',254,'29',2,1,0,1717846009,1717846009,0,0,'66643ff9c57f1',31,''),(257,2,'appdata_oc11dudfeyz7/preview/0','1b218233aed96a1a4189e28e87698483',63,'0',2,1,-1,1717846010,1717846010,0,0,'66643ffa1d128',31,''),(258,2,'appdata_oc11dudfeyz7/preview/0/2','87317d540d532a6f2df298e9882b3c0c',257,'2',2,1,-1,1717846010,1717846010,0,0,'66643ffa1b5a1',31,''),(259,2,'appdata_oc11dudfeyz7/preview/0/2/e','7f96054531a98043bff1345ef9f80985',258,'e',2,1,-1,1717846010,1717846010,0,0,'66643ffa1ab98',31,''),(260,2,'appdata_oc11dudfeyz7/preview/0/2/e/7','2d2515caeac0850b4225c5fc0c084b0a',259,'7',2,1,-1,1717846010,1717846010,0,0,'66643ffa1a0dd',31,''),(261,2,'appdata_oc11dudfeyz7/preview/0/2/e/7/4','bd1588ee3cbeb2671f85ea4fe610f1ed',260,'4',2,1,-1,1717846010,1717846010,0,0,'66643ffa19410',31,''),(262,2,'appdata_oc11dudfeyz7/preview/0/2/e/7/4/f','032f82e4625e85de3048b8a36e29e3f6',261,'f',2,1,-1,1717846010,1717846010,0,0,'66643ffa17156',31,''),(263,2,'appdata_oc11dudfeyz7/preview/0/2/e/7/4/f/1','bb5f7ac9f5c4d7dbd4ffabedfd60aa23',262,'1',2,1,-1,1717846010,1717846010,0,0,'66643ffa16165',31,''),(264,2,'appdata_oc11dudfeyz7/preview/0/2/e/7/4/f/1/27','24b3d64eed9c76a1cd82bc9bd28f6953',263,'27',2,1,0,1717846010,1717846010,0,0,'66643ffa147fe',31,''),(265,2,'appdata_oc11dudfeyz7/preview/8','e2b62cd7e2f691078658a34d5800a4f4',63,'8',2,1,-1,1717846010,1717846010,0,0,'66643ffa2f706',31,''),(266,2,'appdata_oc11dudfeyz7/preview/8/e','79ce04513761e0fede23d9b4fec37bf9',265,'e',2,1,-1,1717846010,1717846010,0,0,'66643ffa2e216',31,''),(267,2,'appdata_oc11dudfeyz7/preview/3/3','7e156b288d3667ab76791930271177ba',178,'3',2,1,-1,1717846010,1717846010,0,0,'66643ffa33c1b',31,''),(268,2,'appdata_oc11dudfeyz7/preview/8/e/2','ae20dd1f9fa29ec6ae8f6ebb7186c8cf',266,'2',2,1,-1,1717846010,1717846010,0,0,'66643ffa2d786',31,''),(269,2,'appdata_oc11dudfeyz7/preview/3/3/e','0de5cbfd7bca8addacfff823f3e61921',267,'e',2,1,-1,1717846010,1717846010,0,0,'66643ffa33337',31,''),(270,2,'appdata_oc11dudfeyz7/preview/8/e/2/9','65b9fcb58086b986b65f3e691a210443',268,'9',2,1,-1,1717846010,1717846010,0,0,'66643ffa2b14c',31,''),(271,2,'appdata_oc11dudfeyz7/preview/3/3/e/7','776279fba9d0fe0b93c655fab29343ed',269,'7',2,1,-1,1717846010,1717846010,0,0,'66643ffa32854',31,''),(272,2,'appdata_oc11dudfeyz7/preview/4','3921ebe388e4eb61e99f4aca14991fd2',63,'4',2,1,-1,1717846010,1717846010,0,0,'66643ffa38fa3',31,''),(273,2,'appdata_oc11dudfeyz7/preview/8/e/2/9/6','bc4c95f6e0444a8f18c03167e08d7939',270,'6',2,1,-1,1717846010,1717846010,0,0,'66643ffa29495',31,''),(274,2,'appdata_oc11dudfeyz7/preview/3/3/e/7/5','7d4d2e2bcd7620a7c945705cbc5a9984',271,'5',2,1,-1,1717846010,1717846010,0,0,'66643ffa2fcd1',31,''),(275,2,'appdata_oc11dudfeyz7/preview/8/e/2/9/6/a','1bb4d1b9f34edb4d4453436840e43df6',273,'a',2,1,-1,1717846010,1717846010,0,0,'66643ffa26aef',31,''),(276,2,'appdata_oc11dudfeyz7/preview/4/e','e5a90f71368e5c6a6ea9f3349f59548d',272,'e',2,1,-1,1717846010,1717846010,0,0,'66643ffa36a65',31,''),(277,2,'appdata_oc11dudfeyz7/preview/3/3/e/7/5/f','7681013db4bb60e14e57ac9444520b47',274,'f',2,1,-1,1717846010,1717846010,0,0,'66643ffa2e5d1',31,''),(278,2,'appdata_oc11dudfeyz7/preview/3/3/e/7/5/f/f','e1bef9cdd501565470dedb92052c4791',277,'f',2,1,-1,1717846010,1717846010,0,0,'66643ffa2d8ff',31,''),(279,2,'appdata_oc11dudfeyz7/preview/8/e/2/9/6/a/0','db95e1763b16f772356d804d9622dbdc',275,'0',2,1,-1,1717846010,1717846010,0,0,'66643ffa25645',31,''),(280,2,'appdata_oc11dudfeyz7/preview/4/e/7','a9cebf05b1c212689f8493759c5c050f',276,'7',2,1,-1,1717846010,1717846010,0,0,'66643ffa33dcd',31,''),(281,2,'appdata_oc11dudfeyz7/preview/3/3/e/7/5/f/f/28','814bef3cd3840725ab73d68873fc2c33',278,'28',2,1,0,1717846010,1717846010,0,0,'66643ffa2ca40',31,''),(282,2,'appdata_oc11dudfeyz7/preview/8/e/2/9/6/a/0/25','4f66867ad4ac7200218490bf7c372751',279,'25',2,1,0,1717846010,1717846010,0,0,'66643ffa23125',31,''),(283,2,'appdata_oc11dudfeyz7/preview/4/e/7/3','3082716eaa36a1a4854ea8ef66ce3325',280,'3',2,1,-1,1717846010,1717846010,0,0,'66643ffa33614',31,''),(284,2,'appdata_oc11dudfeyz7/preview/4/e/7/3/2','330a48ac707d2ad328a24046b979d7b3',283,'2',2,1,-1,1717846010,1717846010,0,0,'66643ffa329ff',31,''),(285,2,'appdata_oc11dudfeyz7/preview/4/e/7/3/2/c','227ade3695158f190878448a0b0712bb',284,'c',2,1,-1,1717846010,1717846010,0,0,'66643ffa31820',31,''),(286,2,'appdata_oc11dudfeyz7/preview/4/e/7/3/2/c/e','caa89c8e0ca56e47777e317e143aa427',285,'e',2,1,-1,1717846010,1717846010,0,0,'66643ffa2f56c',31,''),(287,2,'appdata_oc11dudfeyz7/preview/4/e/7/3/2/c/e/26','4ad0aea8c7e528ed63ad4af5d86c97fd',286,'26',2,1,0,1717846010,1717846010,0,0,'66643ffa2df8b',31,'');
/*!40000 ALTER TABLE `oc_filecache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache_extended`
--

DROP TABLE IF EXISTS `oc_filecache_extended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache_extended` (
  `fileid` bigint(20) unsigned NOT NULL,
  `metadata_etag` varchar(40) DEFAULT NULL,
  `creation_time` bigint(20) NOT NULL DEFAULT 0,
  `upload_time` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`fileid`),
  KEY `fce_ctime_idx` (`creation_time`),
  KEY `fce_utime_idx` (`upload_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache_extended`
--

LOCK TABLES `oc_filecache_extended` WRITE;
/*!40000 ALTER TABLE `oc_filecache_extended` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_filecache_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_metadata`
--

DROP TABLE IF EXISTS `oc_files_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_metadata` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `json` longtext NOT NULL,
  `sync_token` varchar(15) NOT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_meta_fileid` (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_metadata`
--

LOCK TABLES `oc_files_metadata` WRITE;
/*!40000 ALTER TABLE `oc_files_metadata` DISABLE KEYS */;
INSERT INTO `oc_files_metadata` VALUES (1,8,'{\"photos-original_date_time\":{\"value\":1717845635,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0}}','qTCNRer','2024-06-08 11:20:35'),(2,10,'{\"photos-original_date_time\":{\"value\":1717845636,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":500,\"height\":500},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','tTJAQPB','2024-06-08 11:20:36'),(3,12,'{\"photos-original_date_time\":{\"value\":1341059531,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/125\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":3,\"ISOSpeedRatings\":320,\"UndefinedTag__x____\":320,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 12:32:11\",\"DateTimeDigitized\":\"2012:06:30 12:32:11\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"7\\/1\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"189284\\/33461\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"280\\/1\",\"SubSecTime\":\"83\",\"SubSecTimeOriginal\":\"83\",\"SubSecTimeDigitized\":\"83\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"1920000\\/487\",\"FocalPlaneYResolution\":\"320000\\/81\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"0000000000\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"DateTime\":\"2012:06:30 12:32:11\",\"Exif_IFD_Pointer\":174},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','tvzWrf7','2024-06-08 11:20:36'),(4,13,'{\"photos-original_date_time\":{\"value\":1341072915,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/500\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":1,\"ISOSpeedRatings\":8000,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 16:15:15\",\"DateTimeDigitized\":\"2012:06:30 16:15:15\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"9\\/1\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"6149\\/1087\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"280\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"134321\\/34\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":1,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.3.1\",\"DateTime\":\"2012:06:30 16:15:15\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','v1c8xUW','2024-06-08 11:20:36'),(5,14,'{\"photos-original_date_time\":{\"value\":1341064060,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/640\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":1,\"ISOSpeedRatings\":12800,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 13:47:40\",\"DateTimeDigitized\":\"2012:06:30 13:47:40\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"75\\/8\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"6149\\/1087\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"235\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"134321\\/34\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":1,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.3.1\",\"DateTime\":\"2012:06:30 13:47:40\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','jkiUpYb','2024-06-08 11:20:36'),(6,15,'{\"photos-original_date_time\":{\"value\":1341258636,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/80\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":400,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:07:02 19:50:36\",\"DateTimeDigitized\":\"2012:07:02 19:50:36\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"51\\/8\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"32\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1066,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"185679\\/47\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"GIMP 2.8.0\",\"DateTime\":\"2012:07:02 22:06:14\",\"Exif_IFD_Pointer\":198},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1066},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','GEEAkx6','2024-06-08 11:20:36'),(7,16,'{\"photos-original_date_time\":{\"value\":1717845637,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":3000,\"height\":2000},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','Pg49Q2O','2024-06-08 11:20:37'),(8,18,'{\"photos-original_date_time\":{\"value\":1372319469,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/160\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":100,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2013:06:27 07:51:09\",\"DateTimeDigitized\":\"2013:06:27 07:51:09\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"59\\/8\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"2\\/3\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"45\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1200,\"ExifImageLength\":1800,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"185679\\/47\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"000052602c\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.4.5\",\"DateTime\":\"2013:06:27 07:51:09\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1200,\"height\":1800},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','BPXbEu1','2024-06-08 11:20:37'),(9,19,'{\"photos-original_date_time\":{\"value\":1444907264,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/320\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":640,\"UndefinedTag__x____\":640,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2015:10:15 11:07:44\",\"DateTimeDigitized\":\"2015:10:15 11:07:44\",\"ShutterSpeedValue\":\"27970\\/3361\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"1\\/3\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"200\\/1\",\"SubSecTimeOriginal\":\"63\",\"SubSecTimeDigitized\":\"63\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"1600\\/1\",\"FocalPlaneYResolution\":\"1600\\/1\",\"FocalPlaneResolutionUnit\":3,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"000084121f\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"240\\/1\",\"YResolution\":\"240\\/1\",\"ResolutionUnit\":2,\"Software\":\"Adobe Photoshop Lightroom 6.2.1 (Macintosh)\",\"DateTime\":\"2015:10:16 14:40:21\",\"Exif_IFD_Pointer\":230},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','z7XJYuE','2024-06-08 11:20:37'),(10,20,'{\"photos-original_date_time\":{\"value\":1526500980,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"10\\/12500\",\"FNumber\":\"35\\/10\",\"ExposureProgram\":3,\"ISOSpeedRatings\":100,\"DateTimeOriginal\":\"2018:05:16 20:03:00\",\"DateTimeDigitized\":\"2018:05:16 20:03:00\",\"ExposureBiasValue\":\"0\\/6\",\"MaxApertureValue\":\"30\\/10\",\"MeteringMode\":5,\"LightSource\":0,\"Flash\":16,\"FocalLength\":\"700\\/10\",\"MakerNote\":\"Nikon\",\"UserComment\":\"Christoph WurstCC-SA 4.0\",\"SubSecTime\":\"30\",\"SubSecTimeOriginal\":\"30\",\"SubSecTimeDigitized\":\"30\",\"ColorSpace\":1,\"SensingMethod\":2,\"FileSource\":\"\",\"SceneType\":\"\",\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"DigitalZoomRatio\":\"1\\/1\",\"FocalLengthIn__mmFilm\":70,\"SceneCaptureType\":0,\"GainControl\":0,\"Contrast\":1,\"Saturation\":0,\"Sharpness\":1,\"SubjectDistanceRange\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"ImageDescription\":\"Christoph WurstCC-SA 4.0\",\"Make\":\"NIKON CORPORATION\",\"Model\":\"NIKON D610\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"GIMP 2.10.14\",\"DateTime\":\"2019:12:10 08:51:16\",\"Artist\":\"Christoph Wurst                     \",\"Copyright\":\"Christoph Wurst                                       \",\"Exif_IFD_Pointer\":402,\"GPS_IFD_Pointer\":13738,\"DateTimeOriginal\":\"2018:05:16 20:03:00\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1920,\"height\":1281},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','uykXwBi','2024-06-08 11:20:37');
/*!40000 ALTER TABLE `oc_files_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_metadata_index`
--

DROP TABLE IF EXISTS `oc_files_metadata_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_metadata_index` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `meta_key` varchar(31) DEFAULT NULL,
  `meta_value_string` varchar(63) DEFAULT NULL,
  `meta_value_int` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `f_meta_index` (`file_id`,`meta_key`,`meta_value_string`),
  KEY `f_meta_index_i` (`file_id`,`meta_key`,`meta_value_int`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_metadata_index`
--

LOCK TABLES `oc_files_metadata_index` WRITE;
/*!40000 ALTER TABLE `oc_files_metadata_index` DISABLE KEYS */;
INSERT INTO `oc_files_metadata_index` VALUES (1,8,'photos-original_date_time',NULL,1717845635),(3,10,'photos-original_date_time',NULL,1717845636),(5,12,'photos-original_date_time',NULL,1341059531),(7,13,'photos-original_date_time',NULL,1341072915),(9,14,'photos-original_date_time',NULL,1341064060),(11,15,'photos-original_date_time',NULL,1341258636),(13,16,'photos-original_date_time',NULL,1717845637),(15,18,'photos-original_date_time',NULL,1372319469),(17,19,'photos-original_date_time',NULL,1444907264),(19,20,'photos-original_date_time',NULL,1526500980);
/*!40000 ALTER TABLE `oc_files_metadata_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_reminders`
--

DROP TABLE IF EXISTS `oc_files_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `due_date` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `notified` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reminders_uniq_idx` (`user_id`,`file_id`,`due_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_reminders`
--

LOCK TABLES `oc_files_reminders` WRITE;
/*!40000 ALTER TABLE `oc_files_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_files_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_trash`
--

DROP TABLE IF EXISTS `oc_files_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_trash` (
  `auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(250) NOT NULL DEFAULT '',
  `user` varchar(64) NOT NULL DEFAULT '',
  `timestamp` varchar(12) NOT NULL DEFAULT '',
  `location` varchar(512) NOT NULL DEFAULT '',
  `type` varchar(4) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `id_index` (`id`),
  KEY `timestamp_index` (`timestamp`),
  KEY `user_index` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_trash`
--

LOCK TABLES `oc_files_trash` WRITE;
/*!40000 ALTER TABLE `oc_files_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_files_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_versions`
--

DROP TABLE IF EXISTS `oc_files_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_versions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `size` bigint(20) NOT NULL,
  `mimetype` bigint(20) NOT NULL,
  `metadata` longtext NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`metadata`)),
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_versions_uniq_index` (`file_id`,`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_versions`
--

LOCK TABLES `oc_files_versions` WRITE;
/*!40000 ALTER TABLE `oc_files_versions` DISABLE KEYS */;
INSERT INTO `oc_files_versions` VALUES (1,4,1717845635,1095,4,'{\"author\":\"admin\"}'),(2,5,1717845635,1083339,6,'{\"author\":\"admin\"}'),(3,6,1717845635,136,4,'{\"author\":\"admin\"}'),(4,7,1717845635,24295,7,'{\"author\":\"admin\"}'),(5,8,1717845635,3963036,9,'{\"author\":\"admin\"}'),(6,9,1717845636,16692071,6,'{\"author\":\"admin\"}'),(7,10,1717845636,50598,11,'{\"author\":\"admin\"}'),(8,12,1717845636,593508,12,'{\"author\":\"admin\"}'),(9,13,1717845636,457744,12,'{\"author\":\"admin\"}'),(10,14,1717845636,474653,12,'{\"author\":\"admin\"}'),(11,15,1717845636,2170375,12,'{\"author\":\"admin\"}'),(12,16,1717845637,797325,12,'{\"author\":\"admin\"}'),(13,17,1717845637,150,4,'{\"author\":\"admin\"}'),(14,18,1717845637,567689,12,'{\"author\":\"admin\"}'),(15,19,1717845637,167989,12,'{\"author\":\"admin\"}'),(16,20,1717845637,427030,12,'{\"author\":\"admin\"}'),(17,21,1717845637,206,4,'{\"author\":\"admin\"}'),(18,22,1717845637,976625,6,'{\"author\":\"admin\"}'),(19,24,1717845637,16988,13,'{\"author\":\"admin\"}'),(20,25,1717845638,52843,14,'{\"author\":\"admin\"}'),(21,26,1717845638,13378,14,'{\"author\":\"admin\"}'),(22,27,1717845638,14316,15,'{\"author\":\"admin\"}'),(23,28,1717845638,13441,14,'{\"author\":\"admin\"}'),(24,29,1717845638,11836,13,'{\"author\":\"admin\"}'),(25,30,1717845638,3509628,15,'{\"author\":\"admin\"}'),(26,31,1717845638,52674,16,'{\"author\":\"admin\"}'),(27,32,1717845638,17276,17,'{\"author\":\"admin\"}'),(28,33,1717845638,15961,17,'{\"author\":\"admin\"}'),(29,34,1717845638,326,4,'{\"author\":\"admin\"}'),(30,35,1717845638,13653,13,'{\"author\":\"admin\"}'),(31,36,1717845639,317015,15,'{\"author\":\"admin\"}'),(32,37,1717845639,340061,17,'{\"author\":\"admin\"}'),(33,38,1717845639,13878,13,'{\"author\":\"admin\"}'),(34,39,1717845639,868111,17,'{\"author\":\"admin\"}'),(35,40,1717845639,5155877,17,'{\"author\":\"admin\"}'),(36,41,1717845639,573,4,'{\"author\":\"admin\"}'),(37,42,1717845639,554,4,'{\"author\":\"admin\"}'),(38,43,1717845639,39404,17,'{\"author\":\"admin\"}'),(39,44,1717845639,14810,15,'{\"author\":\"admin\"}'),(40,45,1717845640,38605,16,'{\"author\":\"admin\"}'),(41,46,1717845640,30354,17,'{\"author\":\"admin\"}'),(42,47,1717845640,88394,14,'{\"author\":\"admin\"}'),(43,48,1717845640,81196,15,'{\"author\":\"admin\"}'),(44,49,1717845640,2403,4,'{\"author\":\"admin\"}');
/*!40000 ALTER TABLE `oc_files_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_checks`
--

DROP TABLE IF EXISTS `oc_flow_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) NOT NULL DEFAULT '',
  `operator` varchar(16) NOT NULL DEFAULT '',
  `value` longtext DEFAULT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_checks`
--

LOCK TABLES `oc_flow_checks` WRITE;
/*!40000 ALTER TABLE `oc_flow_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations`
--

DROP TABLE IF EXISTS `oc_flow_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) NOT NULL DEFAULT '',
  `name` varchar(256) DEFAULT '',
  `checks` longtext DEFAULT NULL,
  `operation` longtext DEFAULT NULL,
  `entity` varchar(256) NOT NULL DEFAULT 'OCA\\WorkflowEngine\\Entity\\File',
  `events` longtext NOT NULL DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations`
--

LOCK TABLES `oc_flow_operations` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations_scope`
--

DROP TABLE IF EXISTS `oc_flow_operations_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations_scope` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_id` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_scope` (`operation_id`,`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations_scope`
--

LOCK TABLES `oc_flow_operations_scope` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_admin`
--

DROP TABLE IF EXISTS `oc_group_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_admin` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `group_admin_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_admin`
--

LOCK TABLES `oc_group_admin` WRITE;
/*!40000 ALTER TABLE `oc_group_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_group_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_user`
--

DROP TABLE IF EXISTS `oc_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_user` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `gu_uid_index` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_user`
--

LOCK TABLES `oc_group_user` WRITE;
/*!40000 ALTER TABLE `oc_group_user` DISABLE KEYS */;
INSERT INTO `oc_group_user` VALUES ('admin','admin');
/*!40000 ALTER TABLE `oc_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_groups`
--

DROP TABLE IF EXISTS `oc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_groups` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(255) NOT NULL DEFAULT 'name',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_groups`
--

LOCK TABLES `oc_groups` WRITE;
/*!40000 ALTER TABLE `oc_groups` DISABLE KEYS */;
INSERT INTO `oc_groups` VALUES ('admin','admin');
/*!40000 ALTER TABLE `oc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_jobs`
--

DROP TABLE IF EXISTS `oc_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL DEFAULT '',
  `argument` varchar(4000) NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT 0,
  `last_checked` int(11) DEFAULT 0,
  `reserved_at` int(11) DEFAULT 0,
  `execution_duration` int(11) DEFAULT 0,
  `argument_hash` varchar(32) DEFAULT NULL,
  `time_sensitive` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `job_class_index` (`class`),
  KEY `job_lastcheck_reserved` (`last_checked`,`reserved_at`),
  KEY `job_argument_hash` (`class`,`argument_hash`),
  KEY `jobs_time_sensitive` (`time_sensitive`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_jobs`
--

LOCK TABLES `oc_jobs` WRITE;
/*!40000 ALTER TABLE `oc_jobs` DISABLE KEYS */;
INSERT INTO `oc_jobs` VALUES (1,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',1717845683,1717845683,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(2,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',1717845693,1717845693,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(3,'OCA\\Activity\\BackgroundJob\\DigestMail','null',1717845761,1717845761,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(4,'OCA\\Activity\\BackgroundJob\\RemoveFormerActivitySettings','null',1717845767,1717845767,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(5,'OCA\\Circles\\Cron\\Maintenance','null',1717845778,1717845778,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(6,'OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob','null',1717845785,1717845785,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(7,'OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob','null',1717845839,1717845839,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(8,'OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob','null',1717845872,1717845872,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(9,'OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob','null',1717845881,1717845881,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(10,'OCA\\DAV\\BackgroundJob\\EventReminderJob','null',1717845970,1717845970,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(11,'OCA\\DAV\\BackgroundJob\\CalendarRetentionJob','null',1717845973,1717845973,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(12,'OCA\\DAV\\BackgroundJob\\PruneOutdatedSyncTokensJob','null',1717846008,1717846008,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(13,'OCA\\Federation\\SyncJob','null',1717846027,1717846027,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(14,'OCA\\Files\\BackgroundJob\\ScanFiles','null',0,1717845630,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(15,'OCA\\Files\\BackgroundJob\\DeleteOrphanedItems','null',0,1717845630,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(16,'OCA\\Files\\BackgroundJob\\CleanupFileLocks','null',0,1717845630,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(17,'OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens','null',0,1717845630,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(18,'OCA\\Files\\BackgroundJob\\DeleteExpiredOpenLocalEditor','null',0,1717845630,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(19,'OCA\\FilesReminders\\BackgroundJob\\CleanUpReminders','null',0,1717845630,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(20,'OCA\\FilesReminders\\BackgroundJob\\ScheduledNotifications','null',0,1717845630,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(21,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',0,1717845631,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(22,'OCA\\Files_Sharing\\ExpireSharesJob','null',0,1717845631,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(23,'OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob','null',0,1717845631,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(24,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',0,1717845631,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(25,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',0,1717845631,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(26,'OCA\\NextcloudAnnouncements\\Cron\\Crawler','null',0,1717845631,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(27,'OCA\\Notifications\\BackgroundJob\\GenerateUserSettings','null',0,1717845632,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(28,'OCA\\Notifications\\BackgroundJob\\SendNotificationMails','null',0,1717845632,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(29,'OCA\\OAuth2\\BackgroundJob\\CleanupExpiredAuthorizationCode','null',0,1717845632,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(30,'OCA\\Photos\\Jobs\\AutomaticPlaceMapperJob','null',0,1717845632,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(31,'OCA\\ServerInfo\\Jobs\\UpdateStorageStats','null',0,1717845633,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(32,'OCA\\Support\\BackgroundJobs\\CheckSubscription','null',0,1717845633,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(33,'OCA\\Text\\Cron\\Cleanup','null',0,1717845633,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(34,'OCA\\UpdateNotification\\BackgroundJob\\UpdateAvailableNotifications','null',0,1717845633,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(35,'OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob','null',0,1717845634,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(36,'OCA\\WorkflowEngine\\BackgroundJobs\\Rotate','null',0,1717845634,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(37,'OC\\Authentication\\Token\\TokenCleanupJob','null',0,1717845634,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(38,'OC\\Log\\Rotate','null',0,1717845634,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(39,'OC\\Preview\\BackgroundCleanupJob','null',0,1717845634,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(40,'OC\\TextProcessing\\RemoveOldTasksBackgroundJob','null',0,1717845634,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(41,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",4]',0,1717845635,0,0,'e62f2aa4dcabea5a64f838d9a4b55d2f',1),(42,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",5]',0,1717845635,0,0,'c470b185ccc2ec23301160b830a7b4e3',1),(43,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",6]',0,1717845635,0,0,'2a3fb69fa95d26049122d56e69babcf1',1),(44,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",7]',0,1717845635,0,0,'b5be68f82ae3e193fe0dcfadf3042b0e',1),(45,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",8]',0,1717845635,0,0,'1da639856154562536985db08334dfdd',1),(46,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",9]',0,1717845636,0,0,'3328486f2967f42b5b23b2c5b43195d9',1),(47,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",10]',0,1717845636,0,0,'bbe4131a2928fb64f41564271cef67ad',1),(48,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",12]',0,1717845636,0,0,'ca0e223f8f1e0c6a497e971f1894d94f',1),(49,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",13]',0,1717845636,0,0,'364b822567bb6e12566dbbd922872f91',1),(50,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",14]',0,1717845636,0,0,'b6b27b599e51fd4ad880f9be0ceefe06',1),(51,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",15]',0,1717845636,0,0,'bc1ada73b672ad0ce638e8dafb81a920',1),(52,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",16]',0,1717845637,0,0,'7515775697fa62191a46f60168193267',1),(53,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",17]',0,1717845637,0,0,'60d90b87066d68be23a60f60c7935e80',1),(54,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",18]',0,1717845637,0,0,'a3fa8db327c0646e9066492abf5c3dd5',1),(55,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",19]',0,1717845637,0,0,'ee854b67c714733040991f9451eb4b6a',1),(56,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",20]',0,1717845637,0,0,'de90440ad5794d297d4f02180e905185',1),(57,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",21]',0,1717845637,0,0,'a4589d2dc441282b16e08c6ca1520c4b',1),(58,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",22]',0,1717845637,0,0,'086db7c981321be9f768d97076364693',1),(59,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",24]',0,1717845637,0,0,'f7b34ebe4aad3e9005a092fc16364b83',1),(60,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",25]',0,1717845638,0,0,'d9e4b556537e1a71a19ffbb481f2422d',1),(61,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",26]',0,1717845638,0,0,'bf3401c192825b51d5206ad4f8684cc9',1),(62,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",27]',0,1717845638,0,0,'80cca205cd42533b0175d71e644409c9',1),(63,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",28]',0,1717845638,0,0,'0a079c4303b6144e8d0c77ba2a4c7186',1),(64,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",29]',0,1717845638,0,0,'4f2bbad2494bc4fdaeade92808117a3a',1),(65,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",30]',0,1717845638,0,0,'5c1593b613f29e8d85b4e206c5f57519',1),(66,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",31]',0,1717845638,0,0,'c7eab2e8320dd11cb5a3dd9ca50223c7',1),(67,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",32]',0,1717845638,0,0,'44f6e305e0134b57367c0acf8b616423',1),(68,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",33]',0,1717845638,0,0,'6b5ad2da35d2d5162e2febadfa838776',1),(69,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",34]',0,1717845638,0,0,'e9c2d4465cc11019e89aa1d067d259f0',1),(70,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",35]',0,1717845639,0,0,'8ca5260f378d7c542b7dcc7831f590b1',1),(71,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",36]',0,1717845639,0,0,'8376e15e64bae9755f0a3e33637d64ca',1),(72,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",37]',0,1717845639,0,0,'9da89cb19670152513b5905d2b521ef5',1),(73,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",38]',0,1717845639,0,0,'a28441683133c69629c823328a30f080',1),(74,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",39]',0,1717845639,0,0,'9956ea85a9cd622bc51a751d16d942dd',1),(75,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",40]',0,1717845639,0,0,'aede0d6d84a156a480cda8310a47ca51',1),(76,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",41]',0,1717845639,0,0,'b24d130e88d0e89f3dca2d89f3c16584',1),(77,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",42]',0,1717845639,0,0,'28bb92682ae20fdec83a4befc16f5619',1),(78,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",43]',0,1717845639,0,0,'74846da95da685539f86600b3740e1fa',1),(79,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",44]',0,1717845639,0,0,'241d1c8a53db5c77a65b3b0f97044054',1),(80,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",45]',0,1717845640,0,0,'55500c6bf8308c53b831300241f8ca1d',1),(81,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",46]',0,1717845640,0,0,'c37bf95c7290f3db87e2659965a2832a',1),(82,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",47]',0,1717845640,0,0,'1344e03698e286512e2f45df7db315fa',1),(83,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",48]',0,1717845640,0,0,'fb491bd2087a734c67bd7440a71d7be8',1),(84,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",49]',0,1717845640,0,0,'30b172cbb46b89614df699888d9eab3f',1),(85,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"admin\"}',0,1717845691,0,0,'b974bbc90ef800c3b1539ac4f2aeddb7',1);
/*!40000 ALTER TABLE `oc_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_known_users`
--

DROP TABLE IF EXISTS `oc_known_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_known_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `known_to` varchar(255) NOT NULL,
  `known_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ku_known_to` (`known_to`),
  KEY `ku_known_user` (`known_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_known_users`
--

LOCK TABLES `oc_known_users` WRITE;
/*!40000 ALTER TABLE `oc_known_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_known_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_login_flow_v2`
--

DROP TABLE IF EXISTS `oc_login_flow_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_login_flow_v2` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) unsigned NOT NULL,
  `started` smallint(5) unsigned NOT NULL DEFAULT 0,
  `poll_token` varchar(255) NOT NULL,
  `login_token` varchar(255) NOT NULL,
  `public_key` text NOT NULL,
  `private_key` text NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `app_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poll_token` (`poll_token`),
  UNIQUE KEY `login_token` (`login_token`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_login_flow_v2`
--

LOCK TABLES `oc_login_flow_v2` WRITE;
/*!40000 ALTER TABLE `oc_login_flow_v2` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_login_flow_v2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_migrations`
--

DROP TABLE IF EXISTS `oc_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_migrations` (
  `app` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`app`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_migrations`
--

LOCK TABLES `oc_migrations` WRITE;
/*!40000 ALTER TABLE `oc_migrations` DISABLE KEYS */;
INSERT INTO `oc_migrations` VALUES ('activity','2006Date20170808154933'),('activity','2006Date20170808155040'),('activity','2006Date20170919095939'),('activity','2007Date20181107114613'),('activity','2008Date20181011095117'),('activity','2010Date20190416112817'),('activity','2011Date20201006132544'),('activity','2011Date20201006132545'),('activity','2011Date20201006132546'),('activity','2011Date20201006132547'),('activity','2011Date20201207091915'),('circles','0022Date20220526111723'),('circles','0022Date20220526113601'),('circles','0022Date20220703115023'),('circles','0023Date20211216113101'),('circles','0024Date20220203123901'),('circles','0024Date20220203123902'),('circles','0024Date20220317190331'),('circles','0028Date20230705222601'),('contactsinteraction','010000Date20200304152605'),('core','13000Date20170705121758'),('core','13000Date20170718121200'),('core','13000Date20170814074715'),('core','13000Date20170919121250'),('core','13000Date20170926101637'),('core','14000Date20180129121024'),('core','14000Date20180404140050'),('core','14000Date20180516101403'),('core','14000Date20180518120534'),('core','14000Date20180522074438'),('core','14000Date20180626223656'),('core','14000Date20180710092004'),('core','14000Date20180712153140'),('core','15000Date20180926101451'),('core','15000Date20181015062942'),('core','15000Date20181029084625'),('core','16000Date20190207141427'),('core','16000Date20190212081545'),('core','16000Date20190427105638'),('core','16000Date20190428150708'),('core','17000Date20190514105811'),('core','18000Date20190920085628'),('core','18000Date20191014105105'),('core','18000Date20191204114856'),('core','19000Date20200211083441'),('core','20000Date20201109081915'),('core','20000Date20201109081918'),('core','20000Date20201109081919'),('core','20000Date20201111081915'),('core','21000Date20201120141228'),('core','21000Date20201202095923'),('core','21000Date20210119195004'),('core','21000Date20210309185126'),('core','21000Date20210309185127'),('core','22000Date20210216080825'),('core','23000Date20210721100600'),('core','23000Date20210906132259'),('core','23000Date20210930122352'),('core','23000Date20211203110726'),('core','23000Date20211213203940'),('core','24000Date20211210141942'),('core','24000Date20211213081506'),('core','24000Date20211213081604'),('core','24000Date20211222112246'),('core','24000Date20211230140012'),('core','24000Date20220131153041'),('core','24000Date20220202150027'),('core','24000Date20220404230027'),('core','24000Date20220425072957'),('core','25000Date20220515204012'),('core','25000Date20220602190540'),('core','25000Date20220905140840'),('core','25000Date20221007010957'),('core','27000Date20220613163520'),('core','27000Date20230309104325'),('core','27000Date20230309104802'),('core','28000Date20230616104802'),('core','28000Date20230728104802'),('core','28000Date20230803221055'),('core','28000Date20230906104802'),('core','28000Date20231004103301'),('core','28000Date20231103104802'),('core','28000Date20231126110901'),('core','29000Date20231126110901'),('core','29000Date20231213104850'),('core','29000Date20240124132201'),('core','29000Date20240124132202'),('core','29000Date20240131122720'),('dav','1004Date20170825134824'),('dav','1004Date20170919104507'),('dav','1004Date20170924124212'),('dav','1004Date20170926103422'),('dav','1005Date20180413093149'),('dav','1005Date20180530124431'),('dav','1006Date20180619154313'),('dav','1006Date20180628111625'),('dav','1008Date20181030113700'),('dav','1008Date20181105104826'),('dav','1008Date20181105104833'),('dav','1008Date20181105110300'),('dav','1008Date20181105112049'),('dav','1008Date20181114084440'),('dav','1011Date20190725113607'),('dav','1011Date20190806104428'),('dav','1012Date20190808122342'),('dav','1016Date20201109085907'),('dav','1017Date20210216083742'),('dav','1018Date20210312100735'),('dav','1024Date20211221144219'),('dav','1025Date20240308063933'),('dav','1027Date20230504122946'),('dav','1029Date20221114151721'),('dav','1029Date20231004091403'),('dav','1030Date20240205103243'),('federatedfilesharing','1010Date20200630191755'),('federatedfilesharing','1011Date20201120125158'),('federation','1010Date20200630191302'),('files','11301Date20191205150729'),('files','12101Date20221011153334'),('files_downloadlimit','000000Date20210910094923'),('files_reminders','10000Date20230725162149'),('files_sharing','11300Date20201120141438'),('files_sharing','21000Date20201223143245'),('files_sharing','22000Date20210216084241'),('files_sharing','24000Date20220208195521'),('files_sharing','24000Date20220404142216'),('files_trashbin','1010Date20200630192639'),('files_versions','1020Date20221114144058'),('notifications','2004Date20190107135757'),('notifications','2010Date20210218082811'),('notifications','2010Date20210218082855'),('notifications','2011Date20210930134607'),('notifications','2011Date20220826074907'),('oauth2','010401Date20181207190718'),('oauth2','010402Date20190107124745'),('oauth2','011601Date20230522143227'),('oauth2','011602Date20230613160650'),('oauth2','011603Date20230620111039'),('photos','20000Date20220727125801'),('photos','20001Date20220830131446'),('photos','20003Date20221102170153'),('photos','20003Date20221103094628'),('photos','3000Date20240417075404'),('privacy','100Date20190217131943'),('text','010000Date20190617184535'),('text','030001Date20200402075029'),('text','030201Date20201116110353'),('text','030201Date20201116123153'),('text','030501Date20220202101853'),('text','030701Date20230207131313'),('text','030901Date20231114150437'),('twofactor_backupcodes','1002Date20170607104347'),('twofactor_backupcodes','1002Date20170607113030'),('twofactor_backupcodes','1002Date20170919123342'),('twofactor_backupcodes','1002Date20170926101419'),('twofactor_backupcodes','1002Date20180821043638'),('updatenotification','011901Date20240305120000'),('user_status','0001Date20200602134824'),('user_status','0002Date20200902144824'),('user_status','1000Date20201111130204'),('user_status','1003Date20210809144824'),('user_status','1008Date20230921144701'),('workflowengine','2000Date20190808074233'),('workflowengine','2200Date20210805101925');
/*!40000 ALTER TABLE `oc_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mimetypes`
--

DROP TABLE IF EXISTS `oc_mimetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mimetypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mimetype_id_index` (`mimetype`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mimetypes`
--

LOCK TABLES `oc_mimetypes` WRITE;
/*!40000 ALTER TABLE `oc_mimetypes` DISABLE KEYS */;
INSERT INTO `oc_mimetypes` VALUES (5,'application'),(19,'application/gzip'),(18,'application/javascript'),(20,'application/json'),(16,'application/octet-stream'),(6,'application/pdf'),(13,'application/vnd.oasis.opendocument.graphics'),(15,'application/vnd.oasis.opendocument.presentation'),(14,'application/vnd.oasis.opendocument.spreadsheet'),(17,'application/vnd.oasis.opendocument.text'),(7,'application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(1,'httpd'),(2,'httpd/unix-directory'),(10,'image'),(22,'image/heic'),(12,'image/jpeg'),(11,'image/png'),(21,'image/svg+xml'),(23,'image/webp'),(3,'text'),(4,'text/markdown'),(8,'video'),(9,'video/mp4'),(24,'video/quicktime');
/*!40000 ALTER TABLE `oc_mimetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mounts`
--

DROP TABLE IF EXISTS `oc_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage_id` bigint(20) NOT NULL,
  `root_id` bigint(20) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `mount_point` varchar(4000) NOT NULL,
  `mount_id` bigint(20) DEFAULT NULL,
  `mount_provider_class` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mounts_storage_index` (`storage_id`),
  KEY `mounts_root_index` (`root_id`),
  KEY `mounts_mount_id_index` (`mount_id`),
  KEY `mounts_user_root_path_index` (`user_id`,`root_id`,`mount_point`(128)),
  KEY `mounts_class_index` (`mount_provider_class`),
  KEY `mount_user_storage` (`storage_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mounts`
--

LOCK TABLES `oc_mounts` WRITE;
/*!40000 ALTER TABLE `oc_mounts` DISABLE KEYS */;
INSERT INTO `oc_mounts` VALUES (1,1,1,'admin','/admin/',NULL,'OC\\Files\\Mount\\LocalHomeMountProvider');
/*!40000 ALTER TABLE `oc_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications`
--

DROP TABLE IF EXISTS `oc_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(32) NOT NULL,
  `user` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `object_type` varchar(64) NOT NULL,
  `object_id` varchar(64) NOT NULL,
  `subject` varchar(64) NOT NULL,
  `subject_parameters` longtext DEFAULT NULL,
  `message` varchar(64) DEFAULT NULL,
  `message_parameters` longtext DEFAULT NULL,
  `link` varchar(4000) DEFAULT NULL,
  `icon` varchar(4000) DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `oc_notifications_app` (`app`),
  KEY `oc_notifications_user` (`user`),
  KEY `oc_notifications_timestamp` (`timestamp`),
  KEY `oc_notifications_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications`
--

LOCK TABLES `oc_notifications` WRITE;
/*!40000 ALTER TABLE `oc_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_pushhash`
--

DROP TABLE IF EXISTS `oc_notifications_pushhash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_pushhash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `token` int(11) NOT NULL DEFAULT 0,
  `deviceidentifier` varchar(128) NOT NULL,
  `devicepublickey` varchar(512) NOT NULL,
  `devicepublickeyhash` varchar(128) NOT NULL,
  `pushtokenhash` varchar(128) NOT NULL,
  `proxyserver` varchar(256) NOT NULL,
  `apptype` varchar(32) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oc_npushhash_uid` (`uid`,`token`),
  KEY `oc_npushhash_di` (`deviceidentifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_pushhash`
--

LOCK TABLES `oc_notifications_pushhash` WRITE;
/*!40000 ALTER TABLE `oc_notifications_pushhash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notifications_pushhash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_settings`
--

DROP TABLE IF EXISTS `oc_notifications_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `batch_time` int(11) NOT NULL DEFAULT 0,
  `last_send_id` bigint(20) NOT NULL DEFAULT 0,
  `next_send_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notset_user` (`user_id`),
  KEY `notset_nextsend` (`next_send_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_settings`
--

LOCK TABLES `oc_notifications_settings` WRITE;
/*!40000 ALTER TABLE `oc_notifications_settings` DISABLE KEYS */;
INSERT INTO `oc_notifications_settings` VALUES (1,'admin',0,0,0);
/*!40000 ALTER TABLE `oc_notifications_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_access_tokens`
--

DROP TABLE IF EXISTS `oc_oauth2_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `hashed_code` varchar(128) NOT NULL,
  `encrypted_token` varchar(786) NOT NULL,
  `code_created_at` bigint(20) unsigned NOT NULL DEFAULT 0,
  `token_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_access_hash_idx` (`hashed_code`),
  KEY `oauth2_access_client_id_idx` (`client_id`),
  KEY `oauth2_tk_c_created_idx` (`token_count`,`code_created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_access_tokens`
--

LOCK TABLES `oc_oauth2_access_tokens` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_clients`
--

DROP TABLE IF EXISTS `oc_oauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `client_identifier` varchar(64) NOT NULL,
  `secret` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_client_id_idx` (`client_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_clients`
--

LOCK TABLES `oc_oauth2_clients` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_open_local_editor`
--

DROP TABLE IF EXISTS `oc_open_local_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_open_local_editor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `path_hash` varchar(64) NOT NULL,
  `expiration_time` bigint(20) unsigned NOT NULL,
  `token` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openlocal_user_path_token` (`user_id`,`path_hash`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_open_local_editor`
--

LOCK TABLES `oc_open_local_editor` WRITE;
/*!40000 ALTER TABLE `oc_open_local_editor` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_open_local_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums`
--

DROP TABLE IF EXISTS `oc_photos_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums` (
  `album_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `last_added_photo` bigint(20) NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `pa_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums`
--

LOCK TABLES `oc_photos_albums` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums_collabs`
--

DROP TABLE IF EXISTS `oc_photos_albums_collabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums_collabs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `collaborator_id` varchar(64) NOT NULL,
  `collaborator_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `album_collabs_uniq_collab` (`album_id`,`collaborator_id`,`collaborator_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums_collabs`
--

LOCK TABLES `oc_photos_albums_collabs` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums_collabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums_collabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums_files`
--

DROP TABLE IF EXISTS `oc_photos_albums_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums_files` (
  `album_file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `added` bigint(20) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`album_file_id`),
  UNIQUE KEY `paf_album_file` (`album_id`,`file_id`),
  KEY `paf_folder` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums_files`
--

LOCK TABLES `oc_photos_albums_files` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_preferences`
--

DROP TABLE IF EXISTS `oc_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_preferences` (
  `userid` varchar(64) NOT NULL DEFAULT '',
  `appid` varchar(32) NOT NULL DEFAULT '',
  `configkey` varchar(64) NOT NULL DEFAULT '',
  `configvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`userid`,`appid`,`configkey`),
  KEY `preferences_app_key` (`appid`,`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_preferences`
--

LOCK TABLES `oc_preferences` WRITE;
/*!40000 ALTER TABLE `oc_preferences` DISABLE KEYS */;
INSERT INTO `oc_preferences` VALUES ('admin','activity','configured','yes'),('admin','avatar','generated','true'),('admin','core','lang','ru'),('admin','core','templateDirectory',''),('admin','dashboard','firstRun','0'),('admin','dashboard','layout','activity'),('admin','files','lastSeenQuotaUsage','0.02'),('admin','firstrunwizard','apphint','18'),('admin','firstrunwizard','show','29.0.2'),('admin','login','lastLogin','1717845634'),('admin','notifications','sound_notification','no'),('admin','notifications','sound_talk','no'),('admin','password_policy','failedLoginAttempts','0'),('admin','theming','background_color','#04577e'),('admin','theming','background_image','stefanus-martanto-setyo-husodo-underwater-ocean.jpg'),('admin','theming','enabled-themes','[\"dark\"]'),('admin','theming','userCacheBuster','1'),('admin','weather_status','address','Иркутск, Россия'),('admin','weather_status','altitude','430'),('admin','weather_status','lat','52.2891225'),('admin','weather_status','lon','104.279829'),('admin','weather_status','mode','2');
/*!40000 ALTER TABLE `oc_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_privacy_admins`
--

DROP TABLE IF EXISTS `oc_privacy_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_privacy_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayname` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_privacy_admins`
--

LOCK TABLES `oc_privacy_admins` WRITE;
/*!40000 ALTER TABLE `oc_privacy_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_privacy_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_profile_config`
--

DROP TABLE IF EXISTS `oc_profile_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_profile_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `config` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_config_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_profile_config`
--

LOCK TABLES `oc_profile_config` WRITE;
/*!40000 ALTER TABLE `oc_profile_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_profile_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_properties`
--

DROP TABLE IF EXISTS `oc_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) NOT NULL DEFAULT '',
  `propertypath` varchar(255) NOT NULL DEFAULT '',
  `propertyname` varchar(255) NOT NULL DEFAULT '',
  `propertyvalue` longtext NOT NULL,
  `valuetype` smallint(6) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `properties_path_index` (`userid`,`propertypath`),
  KEY `properties_pathonly_index` (`propertypath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_properties`
--

LOCK TABLES `oc_properties` WRITE;
/*!40000 ALTER TABLE `oc_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_ratelimit_entries`
--

DROP TABLE IF EXISTS `oc_ratelimit_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_ratelimit_entries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hash` varchar(128) NOT NULL,
  `delete_after` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ratelimit_hash` (`hash`),
  KEY `ratelimit_delete_after` (`delete_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_ratelimit_entries`
--

LOCK TABLES `oc_ratelimit_entries` WRITE;
/*!40000 ALTER TABLE `oc_ratelimit_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_ratelimit_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_reactions`
--

DROP TABLE IF EXISTS `oc_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_reactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL,
  `message_id` bigint(20) unsigned NOT NULL,
  `actor_type` varchar(64) NOT NULL DEFAULT '',
  `actor_id` varchar(64) NOT NULL DEFAULT '',
  `reaction` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_reaction_unique` (`parent_id`,`actor_type`,`actor_id`,`reaction`),
  KEY `comment_reaction` (`reaction`),
  KEY `comment_reaction_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_reactions`
--

LOCK TABLES `oc_reactions` WRITE;
/*!40000 ALTER TABLE `oc_reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_recent_contact`
--

DROP TABLE IF EXISTS `oc_recent_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_recent_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_uid` varchar(64) NOT NULL,
  `uid` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `federated_cloud_id` varchar(255) DEFAULT NULL,
  `card` longblob NOT NULL,
  `last_contact` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recent_contact_actor_uid` (`actor_uid`),
  KEY `recent_contact_id_uid` (`id`,`actor_uid`),
  KEY `recent_contact_uid` (`uid`),
  KEY `recent_contact_email` (`email`),
  KEY `recent_contact_fed_id` (`federated_cloud_id`),
  KEY `recent_contact_last_contact` (`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_recent_contact`
--

LOCK TABLES `oc_recent_contact` WRITE;
/*!40000 ALTER TABLE `oc_recent_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_recent_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_schedulingobjects`
--

DROP TABLE IF EXISTS `oc_schedulingobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_schedulingobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedulobj_principuri_index` (`principaluri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_schedulingobjects`
--

LOCK TABLES `oc_schedulingobjects` WRITE;
/*!40000 ALTER TABLE `oc_schedulingobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_schedulingobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share`
--

DROP TABLE IF EXISTS `oc_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `share_type` smallint(6) NOT NULL DEFAULT 0,
  `share_with` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `uid_owner` varchar(64) NOT NULL DEFAULT '',
  `uid_initiator` varchar(64) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `item_type` varchar(64) NOT NULL DEFAULT '',
  `item_source` varchar(255) DEFAULT NULL,
  `item_target` varchar(255) DEFAULT NULL,
  `file_source` bigint(20) DEFAULT NULL,
  `file_target` varchar(512) DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT 0,
  `stime` bigint(20) NOT NULL DEFAULT 0,
  `accepted` smallint(6) NOT NULL DEFAULT 0,
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT 0,
  `share_name` varchar(64) DEFAULT NULL,
  `password_by_talk` tinyint(1) DEFAULT 0,
  `note` longtext DEFAULT NULL,
  `hide_download` smallint(6) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  `attributes` longtext DEFAULT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`attributes`)),
  `password_expiration_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_share_type_index` (`item_type`,`share_type`),
  KEY `file_source_index` (`file_source`),
  KEY `token_index` (`token`),
  KEY `share_with_index` (`share_with`),
  KEY `parent_index` (`parent`),
  KEY `owner_index` (`uid_owner`),
  KEY `initiator_index` (`uid_initiator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share`
--

LOCK TABLES `oc_share` WRITE;
/*!40000 ALTER TABLE `oc_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share_external`
--

DROP TABLE IF EXISTS `oc_share_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share_external` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent` bigint(20) DEFAULT -1,
  `share_type` int(11) DEFAULT NULL,
  `remote` varchar(512) NOT NULL,
  `remote_id` varchar(255) DEFAULT '',
  `share_token` varchar(64) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `name` varchar(4000) NOT NULL,
  `owner` varchar(64) NOT NULL,
  `user` varchar(64) NOT NULL,
  `mountpoint` varchar(4000) NOT NULL,
  `mountpoint_hash` varchar(32) NOT NULL,
  `accepted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sh_external_mp` (`user`,`mountpoint_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share_external`
--

LOCK TABLES `oc_share_external` WRITE;
/*!40000 ALTER TABLE `oc_share_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_shares_limits`
--

DROP TABLE IF EXISTS `oc_shares_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_shares_limits` (
  `id` varchar(32) NOT NULL,
  `limit` bigint(20) NOT NULL,
  `downloads` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_shares_limits`
--

LOCK TABLES `oc_shares_limits` WRITE;
/*!40000 ALTER TABLE `oc_shares_limits` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_shares_limits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages`
--

DROP TABLE IF EXISTS `oc_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages` (
  `numeric_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(64) DEFAULT NULL,
  `available` int(11) NOT NULL DEFAULT 1,
  `last_checked` int(11) DEFAULT NULL,
  PRIMARY KEY (`numeric_id`),
  UNIQUE KEY `storages_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages`
--

LOCK TABLES `oc_storages` WRITE;
/*!40000 ALTER TABLE `oc_storages` DISABLE KEYS */;
INSERT INTO `oc_storages` VALUES (1,'home::admin',1,NULL),(2,'local::/data/nextcloud/data/',1,NULL);
/*!40000 ALTER TABLE `oc_storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages_credentials`
--

DROP TABLE IF EXISTS `oc_storages_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages_credentials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(64) DEFAULT NULL,
  `identifier` varchar(64) NOT NULL,
  `credentials` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocred_ui` (`user`,`identifier`),
  KEY `stocred_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages_credentials`
--

LOCK TABLES `oc_storages_credentials` WRITE;
/*!40000 ALTER TABLE `oc_storages_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_storages_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag`
--

DROP TABLE IF EXISTS `oc_systemtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `visibility` smallint(6) NOT NULL DEFAULT 1,
  `editable` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_ident` (`name`,`visibility`,`editable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag`
--

LOCK TABLES `oc_systemtag` WRITE;
/*!40000 ALTER TABLE `oc_systemtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_group`
--

DROP TABLE IF EXISTS `oc_systemtag_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_group` (
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `gid` varchar(255) NOT NULL,
  PRIMARY KEY (`gid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_group`
--

LOCK TABLES `oc_systemtag_group` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_object_mapping`
--

DROP TABLE IF EXISTS `oc_systemtag_object_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_object_mapping` (
  `objectid` varchar(64) NOT NULL DEFAULT '',
  `objecttype` varchar(64) NOT NULL DEFAULT '',
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`objecttype`,`objectid`,`systemtagid`),
  KEY `systag_by_tagid` (`systemtagid`,`objecttype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_object_mapping`
--

LOCK TABLES `oc_systemtag_object_mapping` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text2image_tasks`
--

DROP TABLE IF EXISTS `oc_text2image_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text2image_tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `input` longtext NOT NULL,
  `status` int(11) DEFAULT 0,
  `number_of_images` int(11) NOT NULL DEFAULT 1,
  `user_id` varchar(64) DEFAULT NULL,
  `app_id` varchar(32) NOT NULL DEFAULT '',
  `identifier` varchar(255) DEFAULT '',
  `last_updated` datetime DEFAULT NULL,
  `completion_expected_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `t2i_tasks_updated` (`last_updated`),
  KEY `t2i_tasks_status` (`status`),
  KEY `t2i_tasks_uid_appid_ident` (`user_id`,`app_id`,`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text2image_tasks`
--

LOCK TABLES `oc_text2image_tasks` WRITE;
/*!40000 ALTER TABLE `oc_text2image_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text2image_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_documents`
--

DROP TABLE IF EXISTS `oc_text_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_documents` (
  `id` bigint(20) unsigned NOT NULL,
  `current_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version_time` bigint(20) unsigned NOT NULL,
  `last_saved_version_etag` varchar(64) DEFAULT '',
  `base_version_etag` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_documents`
--

LOCK TABLES `oc_text_documents` WRITE;
/*!40000 ALTER TABLE `oc_text_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_sessions`
--

DROP TABLE IF EXISTS `oc_text_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) DEFAULT NULL,
  `guest_name` varchar(64) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `token` varchar(64) NOT NULL,
  `document_id` bigint(20) NOT NULL,
  `last_contact` bigint(20) unsigned NOT NULL,
  `last_awareness_message` longtext DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `rd_session_token_idx` (`token`),
  KEY `ts_lastcontact` (`last_contact`),
  KEY `ts_docid_lastcontact` (`document_id`,`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_sessions`
--

LOCK TABLES `oc_text_sessions` WRITE;
/*!40000 ALTER TABLE `oc_text_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_steps`
--

DROP TABLE IF EXISTS `oc_text_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_steps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned NOT NULL,
  `session_id` bigint(20) unsigned NOT NULL,
  `data` longtext NOT NULL,
  `version` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rd_steps_did_idx` (`document_id`),
  KEY `rd_steps_version_idx` (`version`),
  KEY `textstep_session` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_steps`
--

LOCK TABLES `oc_text_steps` WRITE;
/*!40000 ALTER TABLE `oc_text_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_textprocessing_tasks`
--

DROP TABLE IF EXISTS `oc_textprocessing_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_textprocessing_tasks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `input` longtext NOT NULL,
  `output` longtext DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `user_id` varchar(64) DEFAULT NULL,
  `app_id` varchar(32) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `last_updated` int(10) unsigned DEFAULT 0,
  `completion_expected_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tp_tasks_updated` (`last_updated`),
  KEY `tp_tasks_status_type_nonunique` (`status`,`type`),
  KEY `tp_tasks_uid_appid_ident` (`user_id`,`app_id`,`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_textprocessing_tasks`
--

LOCK TABLES `oc_textprocessing_tasks` WRITE;
/*!40000 ALTER TABLE `oc_textprocessing_tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_textprocessing_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_trusted_servers`
--

DROP TABLE IF EXISTS `oc_trusted_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_trusted_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(512) NOT NULL,
  `url_hash` varchar(255) NOT NULL DEFAULT '',
  `token` varchar(128) DEFAULT NULL,
  `shared_secret` varchar(256) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `sync_token` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_hash` (`url_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_trusted_servers`
--

LOCK TABLES `oc_trusted_servers` WRITE;
/*!40000 ALTER TABLE `oc_trusted_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_trusted_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_backupcodes`
--

DROP TABLE IF EXISTS `oc_twofactor_backupcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_backupcodes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `code` varchar(128) NOT NULL,
  `used` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `twofactor_backupcodes_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_backupcodes`
--

LOCK TABLES `oc_twofactor_backupcodes` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_providers`
--

DROP TABLE IF EXISTS `oc_twofactor_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_providers` (
  `provider_id` varchar(32) NOT NULL,
  `uid` varchar(64) NOT NULL,
  `enabled` smallint(6) NOT NULL,
  PRIMARY KEY (`provider_id`,`uid`),
  KEY `twofactor_providers_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_providers`
--

LOCK TABLES `oc_twofactor_providers` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_providers` DISABLE KEYS */;
INSERT INTO `oc_twofactor_providers` VALUES ('backup_codes','admin',0);
/*!40000 ALTER TABLE `oc_twofactor_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_status`
--

DROP TABLE IF EXISTS `oc_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `status_timestamp` int(10) unsigned NOT NULL,
  `is_user_defined` tinyint(1) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `custom_icon` varchar(255) DEFAULT NULL,
  `custom_message` longtext DEFAULT NULL,
  `clear_at` int(10) unsigned DEFAULT NULL,
  `is_backup` tinyint(1) DEFAULT 0,
  `status_message_timestamp` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_status_uid_ix` (`user_id`),
  KEY `user_status_clr_ix` (`clear_at`),
  KEY `user_status_tstmp_ix` (`status_timestamp`),
  KEY `user_status_iud_ix` (`is_user_defined`,`status`),
  KEY `user_status_mtstmp_ix` (`status_message_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_status`
--

LOCK TABLES `oc_user_status` WRITE;
/*!40000 ALTER TABLE `oc_user_status` DISABLE KEYS */;
INSERT INTO `oc_user_status` VALUES (1,'admin','online',1717846668,0,NULL,NULL,'¯\\_(ツ)_/¯',NULL,0,1717845721);
/*!40000 ALTER TABLE `oc_user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_transfer_owner`
--

DROP TABLE IF EXISTS `oc_user_transfer_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_transfer_owner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_user` varchar(64) NOT NULL,
  `target_user` varchar(64) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `node_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_transfer_owner`
--

LOCK TABLES `oc_user_transfer_owner` WRITE;
/*!40000 ALTER TABLE `oc_user_transfer_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_user_transfer_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_users`
--

DROP TABLE IF EXISTS `oc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_users` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(64) DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `uid_lower` varchar(64) DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `user_uid_lower` (`uid_lower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_users`
--

LOCK TABLES `oc_users` WRITE;
/*!40000 ALTER TABLE `oc_users` DISABLE KEYS */;
INSERT INTO `oc_users` VALUES ('admin',NULL,'3|$argon2id$v=19$m=65536,t=4,p=1$dmdtMjdVRmxaVEF2cTRxLw$fJwpVNIDpdNTzfuTQ6F89WzDuz4d2R1tJmKmlwkMlYY','admin');
/*!40000 ALTER TABLE `oc_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory`
--

DROP TABLE IF EXISTS `oc_vcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`),
  KEY `type_index` (`type`),
  KEY `category_index` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory`
--

LOCK TABLES `oc_vcategory` WRITE;
/*!40000 ALTER TABLE `oc_vcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc_vcategory_to_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory_to_object` (
  `objid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `categoryid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`,`objid`,`type`),
  KEY `vcategory_objectd_index` (`objid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory_to_object`
--

LOCK TABLES `oc_vcategory_to_object` WRITE;
/*!40000 ALTER TABLE `oc_vcategory_to_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory_to_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_webauthn`
--

DROP TABLE IF EXISTS `oc_webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_webauthn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `public_key_credential_id` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webauthn_uid` (`uid`),
  KEY `webauthn_publicKeyCredentialId` (`public_key_credential_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_webauthn`
--

LOCK TABLES `oc_webauthn` WRITE;
/*!40000 ALTER TABLE `oc_webauthn` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_webauthn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_whats_new`
--

DROP TABLE IF EXISTS `oc_whats_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_whats_new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(64) NOT NULL DEFAULT '11',
  `etag` varchar(64) NOT NULL DEFAULT '',
  `last_check` int(10) unsigned NOT NULL DEFAULT 0,
  `data` longtext NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`),
  KEY `version_etag_idx` (`version`,`etag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_whats_new`
--

LOCK TABLES `oc_whats_new` WRITE;
/*!40000 ALTER TABLE `oc_whats_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_whats_new` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-08 11:51:10
