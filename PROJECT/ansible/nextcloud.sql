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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts_data`
--

LOCK TABLES `oc_accounts_data` WRITE;
/*!40000 ALTER TABLE `oc_accounts_data` DISABLE KEYS */;
INSERT INTO `oc_accounts_data` VALUES (1,'admin','displayname','admin'),(3,'admin','address',''),(5,'admin','website',''),(7,'admin','email',''),(9,'admin','phone',''),(11,'admin','twitter',''),(13,'admin','fediverse',''),(15,'admin','organisation',''),(17,'admin','role',''),(19,'admin','headline',''),(21,'admin','biography',''),(23,'admin','profile_enabled','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity`
--

LOCK TABLES `oc_activity` WRITE;
/*!40000 ALTER TABLE `oc_activity` DISABLE KEYS */;
INSERT INTO `oc_activity` VALUES (1,1716437238,30,'file_created','admin','admin','files','created_self','[{\"5\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://nc.local/index.php/apps/files/?dir=/','files',5),(3,1716437238,30,'file_changed','admin','admin','files','changed_self','[{\"5\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://nc.local/index.php/apps/files/?dir=/','files',5),(5,1716437239,30,'file_created','admin','admin','files','created_self','[{\"7\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://nc.local/index.php/apps/files/?dir=/','files',7),(7,1716437239,30,'file_changed','admin','admin','files','changed_self','[{\"7\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://nc.local/index.php/apps/files/?dir=/','files',7),(9,1716437239,30,'file_created','admin','admin','files','created_self','[{\"9\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://nc.local/index.php/apps/files/?dir=/','files',9),(11,1716437239,30,'file_changed','admin','admin','files','changed_self','[{\"9\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://nc.local/index.php/apps/files/?dir=/','files',9),(13,1716437239,30,'file_created','admin','admin','files','created_self','[{\"11\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://nc.local/index.php/apps/files/?dir=/','files',11),(15,1716437240,30,'file_changed','admin','admin','files','changed_self','[{\"11\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://nc.local/index.php/apps/files/?dir=/','files',11),(17,1716437240,30,'file_created','admin','admin','files','created_self','[{\"13\":\"\\/Documents\"}]','','[]','/Documents','http://nc.local/index.php/apps/files/?dir=/','files',13),(19,1716437240,30,'file_created','admin','admin','files','created_self','[{\"15\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://nc.local/index.php/apps/files/?dir=/Documents','files',15),(21,1716437240,30,'file_changed','admin','admin','files','changed_self','[{\"15\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://nc.local/index.php/apps/files/?dir=/Documents','files',15),(23,1716437240,30,'file_created','admin','admin','files','created_self','[{\"17\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://nc.local/index.php/apps/files/?dir=/Documents','files',17),(25,1716437240,30,'file_changed','admin','admin','files','changed_self','[{\"17\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://nc.local/index.php/apps/files/?dir=/Documents','files',17),(27,1716437240,30,'file_created','admin','admin','files','created_self','[{\"19\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://nc.local/index.php/apps/files/?dir=/Documents','files',19),(29,1716437241,30,'file_changed','admin','admin','files','changed_self','[{\"19\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://nc.local/index.php/apps/files/?dir=/Documents','files',19),(31,1716437241,30,'file_created','admin','admin','files','created_self','[{\"21\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://nc.local/index.php/apps/files/?dir=/Documents','files',21),(33,1716437241,30,'file_changed','admin','admin','files','changed_self','[{\"21\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://nc.local/index.php/apps/files/?dir=/Documents','files',21),(35,1716437241,30,'file_created','admin','admin','files','created_self','[{\"23\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http://nc.local/index.php/apps/files/?dir=/','files',23),(37,1716437241,30,'file_changed','admin','admin','files','changed_self','[{\"23\":\"\\/Templates credits.md\"}]','','[]','/Templates credits.md','http://nc.local/index.php/apps/files/?dir=/','files',23),(39,1716437241,30,'file_created','admin','admin','files','created_self','[{\"25\":\"\\/Templates\"}]','','[]','/Templates','http://nc.local/index.php/apps/files/?dir=/','files',25),(41,1716437241,30,'file_created','admin','admin','files','created_self','[{\"27\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',27),(43,1716437241,30,'file_changed','admin','admin','files','changed_self','[{\"27\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',27),(45,1716437242,30,'file_created','admin','admin','files','created_self','[{\"29\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://nc.local/index.php/apps/files/?dir=/Templates','files',29),(47,1716437242,30,'file_changed','admin','admin','files','changed_self','[{\"29\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://nc.local/index.php/apps/files/?dir=/Templates','files',29),(49,1716437242,30,'file_created','admin','admin','files','created_self','[{\"31\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',31),(51,1716437242,30,'file_changed','admin','admin','files','changed_self','[{\"31\":\"\\/Templates\\/Timesheet.ods\"}]','','[]','/Templates/Timesheet.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',31),(53,1716437242,30,'file_created','admin','admin','files','created_self','[{\"33\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',33),(55,1716437242,30,'file_changed','admin','admin','files','changed_self','[{\"33\":\"\\/Templates\\/Gotong royong.odp\"}]','','[]','/Templates/Gotong royong.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',33),(57,1716437242,30,'file_created','admin','admin','files','created_self','[{\"35\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',35),(59,1716437242,30,'file_changed','admin','admin','files','changed_self','[{\"35\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',35),(61,1716437243,30,'file_created','admin','admin','files','created_self','[{\"37\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',37),(63,1716437243,30,'file_changed','admin','admin','files','changed_self','[{\"37\":\"\\/Templates\\/Party invitation.odt\"}]','','[]','/Templates/Party invitation.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',37),(65,1716437243,30,'file_created','admin','admin','files','created_self','[{\"39\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',39),(67,1716437243,30,'file_changed','admin','admin','files','changed_self','[{\"39\":\"\\/Templates\\/Resume.odt\"}]','','[]','/Templates/Resume.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',39),(69,1716437243,30,'file_created','admin','admin','files','created_self','[{\"41\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',41),(71,1716437243,30,'file_changed','admin','admin','files','changed_self','[{\"41\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',41),(73,1716437243,30,'file_created','admin','admin','files','created_self','[{\"43\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://nc.local/index.php/apps/files/?dir=/Templates','files',43),(75,1716437243,30,'file_changed','admin','admin','files','changed_self','[{\"43\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://nc.local/index.php/apps/files/?dir=/Templates','files',43),(77,1716437243,30,'file_created','admin','admin','files','created_self','[{\"45\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',45),(79,1716437244,30,'file_changed','admin','admin','files','changed_self','[{\"45\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',45),(81,1716437244,30,'file_created','admin','admin','files','created_self','[{\"47\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',47),(83,1716437244,30,'file_changed','admin','admin','files','changed_self','[{\"47\":\"\\/Templates\\/Photo book.odt\"}]','','[]','/Templates/Photo book.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',47),(85,1716437244,30,'file_created','admin','admin','files','created_self','[{\"49\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',49),(87,1716437244,30,'file_changed','admin','admin','files','changed_self','[{\"49\":\"\\/Templates\\/Mother\'s day.odt\"}]','','[]','/Templates/Mother\'s day.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',49),(89,1716437244,30,'file_created','admin','admin','files','created_self','[{\"51\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',51),(91,1716437244,30,'file_changed','admin','admin','files','changed_self','[{\"51\":\"\\/Templates\\/Syllabus.odt\"}]','','[]','/Templates/Syllabus.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',51),(93,1716437244,30,'file_created','admin','admin','files','created_self','[{\"53\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',53),(95,1716437245,30,'file_changed','admin','admin','files','changed_self','[{\"53\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',53),(97,1716437245,30,'file_created','admin','admin','files','created_self','[{\"55\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',55),(99,1716437245,30,'file_changed','admin','admin','files','changed_self','[{\"55\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',55),(101,1716437245,30,'file_created','admin','admin','files','created_self','[{\"57\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://nc.local/index.php/apps/files/?dir=/Templates','files',57),(103,1716437245,30,'file_changed','admin','admin','files','changed_self','[{\"57\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://nc.local/index.php/apps/files/?dir=/Templates','files',57),(105,1716437245,30,'file_created','admin','admin','files','created_self','[{\"59\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',59),(107,1716437245,30,'file_changed','admin','admin','files','changed_self','[{\"59\":\"\\/Templates\\/Modern company.odp\"}]','','[]','/Templates/Modern company.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',59),(109,1716437245,30,'file_created','admin','admin','files','created_self','[{\"61\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://nc.local/index.php/apps/files/?dir=/Templates','files',61),(111,1716437245,30,'file_changed','admin','admin','files','changed_self','[{\"61\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://nc.local/index.php/apps/files/?dir=/Templates','files',61),(113,1716437246,30,'file_created','admin','admin','files','created_self','[{\"63\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',63),(115,1716437246,30,'file_changed','admin','admin','files','changed_self','[{\"63\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',63),(117,1716437246,30,'file_created','admin','admin','files','created_self','[{\"65\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://nc.local/index.php/apps/files/?dir=/Templates','files',65),(119,1716437246,30,'file_changed','admin','admin','files','changed_self','[{\"65\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://nc.local/index.php/apps/files/?dir=/Templates','files',65),(121,1716437246,30,'file_created','admin','admin','files','created_self','[{\"67\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',67),(123,1716437246,30,'file_changed','admin','admin','files','changed_self','[{\"67\":\"\\/Templates\\/Yellow idea.odp\"}]','','[]','/Templates/Yellow idea.odp','http://nc.local/index.php/apps/files/?dir=/Templates','files',67),(125,1716437246,30,'file_created','admin','admin','files','created_self','[{\"69\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',69),(127,1716437246,30,'file_changed','admin','admin','files','changed_self','[{\"69\":\"\\/Templates\\/Business model canvas.ods\"}]','','[]','/Templates/Business model canvas.ods','http://nc.local/index.php/apps/files/?dir=/Templates','files',69),(129,1716437246,30,'file_created','admin','admin','files','created_self','[{\"71\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',71),(131,1716437247,30,'file_changed','admin','admin','files','changed_self','[{\"71\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',71),(133,1716437247,30,'file_created','admin','admin','files','created_self','[{\"73\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',73),(135,1716437247,30,'file_changed','admin','admin','files','changed_self','[{\"73\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://nc.local/index.php/apps/files/?dir=/Templates','files',73),(137,1716437247,30,'file_created','admin','admin','files','created_self','[{\"75\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',75),(139,1716437247,30,'file_changed','admin','admin','files','changed_self','[{\"75\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://nc.local/index.php/apps/files/?dir=/Templates','files',75),(141,1716437247,30,'file_created','admin','admin','files','created_self','[{\"77\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://nc.local/index.php/apps/files/?dir=/','files',77),(143,1716437247,30,'file_changed','admin','admin','files','changed_self','[{\"77\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://nc.local/index.php/apps/files/?dir=/','files',77),(145,1716437247,30,'file_created','admin','admin','files','created_self','[{\"79\":\"\\/Photos\"}]','','[]','/Photos','http://nc.local/index.php/apps/files/?dir=/','files',79),(147,1716437248,30,'file_created','admin','admin','files','created_self','[{\"81\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',81),(149,1716437248,30,'file_changed','admin','admin','files','changed_self','[{\"81\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',81),(151,1716437248,30,'file_created','admin','admin','files','created_self','[{\"83\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://nc.local/index.php/apps/files/?dir=/Photos','files',83),(153,1716437248,30,'file_changed','admin','admin','files','changed_self','[{\"83\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://nc.local/index.php/apps/files/?dir=/Photos','files',83),(155,1716437248,30,'file_created','admin','admin','files','created_self','[{\"85\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',85),(157,1716437248,30,'file_changed','admin','admin','files','changed_self','[{\"85\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',85),(159,1716437248,30,'file_created','admin','admin','files','created_self','[{\"87\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',87),(161,1716437249,30,'file_changed','admin','admin','files','changed_self','[{\"87\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',87),(163,1716437249,30,'file_created','admin','admin','files','created_self','[{\"89\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',89),(165,1716437249,30,'file_changed','admin','admin','files','changed_self','[{\"89\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',89),(167,1716437249,30,'file_created','admin','admin','files','created_self','[{\"91\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',91),(169,1716437249,30,'file_changed','admin','admin','files','changed_self','[{\"91\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',91),(171,1716437249,30,'file_created','admin','admin','files','created_self','[{\"93\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',93),(173,1716437249,30,'file_changed','admin','admin','files','changed_self','[{\"93\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',93),(175,1716437249,30,'file_created','admin','admin','files','created_self','[{\"95\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',95),(177,1716437250,30,'file_changed','admin','admin','files','changed_self','[{\"95\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',95),(179,1716437250,30,'file_created','admin','admin','files','created_self','[{\"97\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',97),(181,1716437250,30,'file_changed','admin','admin','files','changed_self','[{\"97\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://nc.local/index.php/apps/files/?dir=/Photos','files',97),(183,1716437882,30,'calendar','admin','admin','dav','calendar_add_self','{\"actor\":\"admin\",\"calendar\":{\"id\":1,\"uri\":\"personal\",\"name\":\"Personal\"}}','','[]','','','calendar',1),(185,1716437903,30,'contacts','admin','admin','dav','addressbook_add_self','{\"actor\":\"admin\",\"addressbook\":{\"id\":1,\"uri\":\"-\",\"name\":\"\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u044b\"}}','','[]','','','addressbook',1),(187,1716437915,30,'file_created','admin','admin','files','created_self','[{\"349\":\"\\/Talk\"}]','','[]','/Talk','http://nc.local/index.php/apps/files/?dir=/','files',349),(189,1716440750,30,'file_changed','admin','admin','files','changed_self','[{\"17\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://nc.local/index.php/apps/files/?dir=/Documents','files',17),(191,1716440768,30,'file_created','admin','admin','files','created_self','[{\"497\":\"\\/\\u0417\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438\"}]','','[]','/Заметки','http://nc.local/index.php/apps/files/?dir=/','files',497),(193,1716440794,30,'file_created','admin','admin','files','created_self','[{\"499\":\"\\/\\u0417\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438\\/\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438.md\"}]','','[]','/Заметки/Пример заметки.md','http://nc.local/index.php/apps/files/?dir=/%D0%97%D0%B0%D0%BC%D0%B5%D1%82%D0%BA%D0%B8','files',499),(195,1716440794,30,'file_changed','admin','admin','files','changed_self','[{\"499\":\"\\/\\u0417\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438\\/\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438.md\"}]','','[]','/Заметки/Пример заметки.md','http://nc.local/index.php/apps/files/?dir=/%D0%97%D0%B0%D0%BC%D0%B5%D1%82%D0%BA%D0%B8','files',499),(197,1716440817,30,'file_changed','admin','admin','files','changed_self','[{\"499\":\"\\/\\u0417\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438\\/\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438.md\"}]','','[]','/Заметки/Пример заметки.md','http://nc.local/index.php/apps/files/?dir=/%D0%97%D0%B0%D0%BC%D0%B5%D1%82%D0%BA%D0%B8','files',499),(199,1716441359,30,'file_created','admin','admin','files','created_self','[{\"509\":\"\\/\\u0417\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438\\/New note.md\"}]','','[]','/Заметки/New note.md','http://nc.local/index.php/apps/files/?dir=/%D0%97%D0%B0%D0%BC%D0%B5%D1%82%D0%BA%D0%B8','files',509),(201,1716441362,30,'file_created','admin','admin','files','created_self','[{\"511\":\"\\/\\u0417\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438\\/New note (2).md\"}]','','[]','/Заметки/New note (2).md','http://nc.local/index.php/apps/files/?dir=/%D0%97%D0%B0%D0%BC%D0%B5%D1%82%D0%BA%D0%B8','files',511),(203,1716441364,30,'file_created','admin','admin','files','created_self','[{\"513\":\"\\/\\u0417\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438\\/New note (3).md\"}]','','[]','/Заметки/New note (3).md','http://nc.local/index.php/apps/files/?dir=/%D0%97%D0%B0%D0%BC%D0%B5%D1%82%D0%BA%D0%B8','files',513),(205,1716441692,30,'file_deleted','admin','admin','files','deleted_self','[{\"513\":\"\\/\\u0417\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438\\/New note (3).md\"}]','','[]','/Заметки/New note (3).md','http://nc.local/index.php/apps/files/?dir=/%D0%97%D0%B0%D0%BC%D0%B5%D1%82%D0%BA%D0%B8','files',513),(207,1716441697,30,'file_deleted','admin','admin','files','deleted_self','[{\"511\":\"\\/\\u0417\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438\\/New note (2).md\"}]','','[]','/Заметки/New note (2).md','http://nc.local/index.php/apps/files/?dir=/%D0%97%D0%B0%D0%BC%D0%B5%D1%82%D0%BA%D0%B8','files',511),(209,1716441701,30,'file_deleted','admin','admin','files','deleted_self','[{\"509\":\"\\/\\u0417\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438\\/New note.md\"}]','','[]','/Заметки/New note.md','http://nc.local/index.php/apps/files/?dir=/%D0%97%D0%B0%D0%BC%D0%B5%D1%82%D0%BA%D0%B8','files',509);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbooks`
--

LOCK TABLES `oc_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc_addressbooks` DISABLE KEYS */;
INSERT INTO `oc_addressbooks` VALUES (1,'principals/users/admin','Контакты','-',NULL,1);
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
INSERT INTO `oc_appconfig` VALUES ('activity','enabled','yes',2,0),('activity','installed_version','2.21.1',2,0),('activity','types','filesystem',2,0),('backgroundjob','lastjob','37',2,0),('calendar','enabled','yes',2,0),('calendar','installed_version','4.7.4',2,0),('calendar','types','',2,0),('circles','enabled','yes',2,0),('circles','installed_version','29.0.0-dev',2,0),('circles','loopback_tmp_scheme','http',2,0),('circles','types','filesystem,dav',2,0),('cloud_federation_api','enabled','yes',2,0),('cloud_federation_api','installed_version','1.12.0',2,0),('cloud_federation_api','types','filesystem',2,0),('comments','enabled','yes',2,0),('comments','installed_version','1.19.0',2,0),('comments','types','logging',2,0),('contacts','enabled','yes',2,0),('contacts','installed_version','6.0.0',2,0),('contacts','types','dav',2,0),('contactsinteraction','enabled','yes',2,0),('contactsinteraction','installed_version','1.10.0',2,0),('contactsinteraction','types','dav',2,0),('core','files_metadata','{\"photos-original_date_time\":{\"value\":null,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-exif\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":null,\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}',2,0),('core','files_metadata_installed','1',2,0),('core','installedat','1716437227.9375',2,0),('core','lastcron','1716441345',8,0),('core','lastupdateResult','[]',2,0),('core','lastupdatedat','1716441210',8,0),('core','oc.integritycheck.checker','[]',64,1),('core','public_files','files_sharing/public.php',2,0),('core','vendor','nextcloud',2,0),('dashboard','enabled','yes',2,0),('dashboard','installed_version','7.9.0',2,0),('dashboard','types','',2,0),('dav','enabled','yes',2,0),('dav','installed_version','1.30.1',2,0),('dav','types','filesystem',2,0),('federatedfilesharing','enabled','yes',2,0),('federatedfilesharing','installed_version','1.19.0',2,0),('federatedfilesharing','types','',2,0),('federation','enabled','yes',2,0),('federation','installed_version','1.19.0',2,0),('federation','types','authentication',2,0),('files','enabled','yes',2,0),('files','installed_version','2.1.0',2,0),('files','types','filesystem',2,0),('files_downloadlimit','enabled','yes',2,0),('files_downloadlimit','installed_version','2.0.0',2,0),('files_downloadlimit','types','',2,0),('files_pdfviewer','enabled','yes',2,0),('files_pdfviewer','installed_version','2.10.0',2,0),('files_pdfviewer','types','',2,0),('files_reminders','enabled','yes',2,0),('files_reminders','installed_version','1.2.0',2,0),('files_reminders','types','',2,0),('files_sharing','enabled','yes',2,0),('files_sharing','installed_version','1.21.0',2,0),('files_sharing','types','filesystem',2,0),('files_trashbin','enabled','yes',2,0),('files_trashbin','installed_version','1.19.0',2,0),('files_trashbin','types','filesystem,dav',2,0),('files_versions','enabled','yes',2,0),('files_versions','installed_version','1.22.0',2,0),('files_versions','types','filesystem,dav',2,0),('firstrunwizard','enabled','yes',2,0),('firstrunwizard','installed_version','2.18.0',2,0),('firstrunwizard','types','logging',2,0),('logreader','enabled','yes',2,0),('logreader','installed_version','2.14.0',2,0),('logreader','types','logging',2,0),('lookup_server_connector','enabled','yes',2,0),('lookup_server_connector','installed_version','1.17.0',2,0),('lookup_server_connector','types','authentication',2,0),('mail','enabled','yes',2,0),('mail','installed_version','3.6.1',2,0),('mail','types','',2,0),('nextcloud_announcements','enabled','yes',2,0),('nextcloud_announcements','installed_version','1.18.0',2,0),('nextcloud_announcements','pub_date','Thu, 24 Oct 2019 00:00:00 +0200',2,0),('nextcloud_announcements','types','logging',2,0),('notes','enabled','yes',2,0),('notes','installed_version','4.10.0',2,0),('notes','types','',2,0),('notifications','enabled','yes',2,0),('notifications','installed_version','2.17.0',2,0),('notifications','types','logging',2,0),('oauth2','enabled','yes',2,0),('oauth2','installed_version','1.17.0',2,0),('oauth2','types','authentication',2,0),('password_policy','enabled','yes',2,0),('password_policy','installed_version','1.19.0',2,0),('password_policy','types','authentication',2,0),('photos','enabled','yes',2,0),('photos','installed_version','2.5.0',2,0),('photos','types','dav,authentication',2,0),('privacy','enabled','yes',2,0),('privacy','installed_version','1.13.0',2,0),('privacy','types','',2,0),('provisioning_api','enabled','yes',2,0),('provisioning_api','installed_version','1.19.0',2,0),('provisioning_api','types','prevent_group_restriction',2,0),('recommendations','enabled','yes',2,0),('recommendations','installed_version','2.1.0',2,0),('recommendations','types','',2,0),('related_resources','enabled','yes',2,0),('related_resources','installed_version','1.4.0',2,0),('related_resources','types','',2,0),('richdocuments','enabled','yes',2,0),('richdocuments','installed_version','8.4.2',2,0),('richdocuments','types','prevent_group_restriction',2,0),('serverinfo','enabled','yes',2,0),('serverinfo','installed_version','1.19.0',2,0),('serverinfo','types','',2,0),('settings','enabled','yes',2,0),('settings','installed_version','1.12.0',2,0),('settings','types','',2,0),('sharebymail','enabled','yes',2,0),('sharebymail','installed_version','1.19.0',2,0),('sharebymail','types','filesystem',2,0),('spreed','enabled','yes',2,0),('spreed','installed_version','19.0.0',2,0),('spreed','signaling_token_privkey_es256','-----BEGIN PRIVATE KEY-----\nMIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQg+a+54L+BT6cLPyaE\nTcOm5P+6PYo9G9Y5gKahXnH2GVmhRANCAAQM5Qa1m6iPeQP76MHokNo1/Tt6/bIi\nmeh0i0DCWR6JQeanPbQDcw9O22NJcATe+F6U43AoeqcAdrAREf7zxfQr\n-----END PRIVATE KEY-----\n',2,0),('spreed','signaling_token_pubkey_es256','-----BEGIN PUBLIC KEY-----\nMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEDOUGtZuoj3kD++jB6JDaNf07ev2y\nIpnodItAwlkeiUHmpz20A3MPTttjSXAE3vhelONwKHqnAHawERH+88X0Kw==\n-----END PUBLIC KEY-----\n',2,0),('spreed','types','dav,prevent_group_restriction',2,0),('support','enabled','yes',2,0),('support','installed_version','1.12.0',2,0),('support','types','session',2,0),('survey_client','enabled','yes',2,0),('survey_client','installed_version','1.17.0',2,0),('survey_client','types','',2,0),('systemtags','enabled','yes',2,0),('systemtags','installed_version','1.19.0',2,0),('systemtags','types','logging',2,0),('text','enabled','yes',2,0),('text','installed_version','3.10.0',2,0),('text','types','dav',2,0),('theming','enabled','yes',2,0),('theming','installed_version','2.4.0',2,0),('theming','types','logging',2,0),('twofactor_backupcodes','enabled','yes',2,0),('twofactor_backupcodes','installed_version','1.18.0',2,0),('twofactor_backupcodes','types','',2,0),('updatenotification','enabled','yes',2,0),('updatenotification','installed_version','1.19.1',2,0),('updatenotification','types','',2,0),('updatenotification','update_check_errors','0',8,0),('user_status','enabled','yes',2,0),('user_status','installed_version','1.9.0',2,0),('user_status','types','',2,0),('viewer','enabled','yes',2,0),('viewer','installed_version','2.3.0',2,0),('viewer','types','',2,0),('weather_status','enabled','yes',2,0),('weather_status','installed_version','1.9.0',2,0),('weather_status','types','',2,0),('workflowengine','enabled','yes',2,0),('workflowengine','installed_version','2.11.0',2,0),('workflowengine','types','filesystem',2,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
INSERT INTO `oc_authtoken` VALUES (1,'admin','admin','efVS+hhez2ZfIsn1vZm6O2JXTjdi2MjL3rWLk9cziQcraGJAlcjS+cYiCOQe594hp6ufuoJwWpVmq3SLxutxiyCObIrNrrjQODmfyuMdgCIlA8nzlQJP8cNfRkfLvPrTahtWzvajaQaVaGIw+IE6r7j7K6Vo6FgBnwhjl1JI/dzHnN9oFs65KFpo0d350H+ZOKZXPtZ4Cxz6GXLYcLRAgyEhxq8kikBF9J+uIT4wdNcAUJLfx8YLZhdITxTbY5I1WMWFGEsnAeJf4OGwWFFo7du4968PrSVDjBnV2eubjBVs4xyeNEQl5+LcpYMwvsP0mYD6QQvQBV92yLu7dNOwUQ==','Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36','583e599cb3b0d9faaaedea56de5789ec53b79f40d18c3bc1ea48485b2cc6f4d56437c475bc30aa75523de990922c1323374297b3f9ae08275d66436f537e6e9c',0,0,1716446855,1716446765,NULL,NULL,'47666b3f408194d4912c0c3b1e98a5d16553e5bafbefc0752804ffd5988a883406de8fe7711ef2c07d7357e53501d9c7a46bc0e52037dcfe9aa8f82f186b6060cb2883b78a826e7f957738e56ded81cbaf1e97485f19435afaabc4bb8b4ae7a730157ce60c9eebb56ba181e06981e9f5ed0435668226d818aa694bf2db6b6f3ce88af617a49cd13a1cc5ee073d46b8a34f705eec30d30a6da3594a9532e51a4e2bd5fd792d3e42bf0944c183731e989d39aa2c0d272c2c42c41d94d5e4bde994b400dcf15d09e71d0005a4d4f1b3b8dabccfa2a79232f1c7a923ac7944643fbd31e02c1767357dacd4bdd8a5379b902deb9a3a869bf9c71b0efc12f7252be93bcf4803f282c21403a6146a27f83c7629205f21fc771fe820b42969e40ff0151ca72e66becba1f80fa72b7a9dee5950c54f35d92e7c0daf3268bc413b3688efda0c7996ec060720fb30ebd7a04e3924308c34d74b3e998097b360af3da93ee568c6629f694a1957bb5ce64456f48f6449c3dafb36f0b7b9b7210060c0f075ebce2691e905eb0610e3f16b755ae2cbf319323a9dc490052e5b05f61e725165b6f4ab086dde33950af2ba0c245ca14e86dda7bdb4aab4100f8f61bf2751a47e48531e0834ba6b3bf51b9c63e368935ebb17e0c12126177d19db9597c50dda41e036d819be7f21a53e20a2e1ea8cd26e7cd9bdd79f45eb175653592afab237413356e56ab3854bece55a218fa3f3df46f4ccbd73dce5546ceccfacebfc31829de34d3f8a220b52283280466cb070e364866c255f7524d8ca3cf79785f9a042f576d7e1deb8286289626c1edf1f317a1215202f15ff97d66fca9b3f2d5c69888db398a85e449880d6541831f1d663543fdbd03e1a8d8e95c6e811dca1fa84980ffb5e3899cd4eaabf282925976a855d90bad635222a5dd276ea2b23d2a12c30f6ffa9f5b11cc775b6a7f4632eef4de22eb9639f3494a338f17ccbd7181d06397eae9e3c33da73efc8654817f9c2251376bc34e755596bc170619e1e1d1b381346ea2be28ff0060471a8448f0d3bd82d29177a0cecad470d6b7eeabce690b4424725c5e137d9f12bb8bebc5c49d9fc52f39f24dc86e43f50493f652ea37a4bfa1a03512c383bbea8e7bdc4ed50a8edcb307fd06b482b3a40a74c1dbbae4288333e43662a10ae2bd3a63247c94cfce5d83ac218ee3420e4e93e2082b0ac8b01198f7e2a6760408e338fa3a53f9e645fb3ec8d0ac0226f36b98b4a8d2d123a25c57b035b5ea186bfb3f96620115f0dbf34f2ee732a09a1f962470c04a61acb88c6cc6b16ac06ea09179c221a1d1bd705ae660ececc5cdabca75d6175f7896cc1d37d58db4065e0e91c837656853938ef5d1bdd13b19a61088c1cc92f4abfbeb08231e32cb334192f77d30cc2aeac6a27de37b322b426ba82a777fb3823d136bf88293897a9bfb38a536f87610606cb9680ae08fc2a08104aaa9e8a59cb6a74ca8dbdfe3c692dce03fd96970988f67fd707c97946c13e4dc0ab03c07328f1a77bd47d5a5f6625254baebe8867174584a5bd4af15440f6f2e16d92fb92c53214e5041107fcf600bbe62c0c35ea718b4332ad4545731ebaf952a012fc7fabb22cdd393cab9cbce87c4bfe0c12cb46552c53871e47eadf3e709df7e7e8d42865155d6d19799b630b888acaf82f136944c1bc9e02d583732733c71d7bd3f7151e1cbc823fba26a0e6e5cd6b2ccf9be3b0e0f3f17c5ff879b70d5f591f84c2d16126491e42b954963779c6f8fd5330c65c4da7ef58a4b6963617cee054493eaa63686cad1d30eb78e79b60cf1f18754677bb2ed47045c5e76926636a17e1a023a47d6545e97c665c4e1e153fc4abfb07c0020b641dd47a6d449775797a3e93cc02ef756df64703c57bb11853f84267398dec978ba1f3cb034cab51f58fc45d62886535f58f931e33c3435f674fc185f865d950c9d8e5bbbf094973bacd7e3fdd7c8de806bc83d5f03fc5a8c319199be74ebbe029817df9324d87b6ba69c2fc0a111ab51d85343865d73b9b46fdad38e4f45c89052f3d8465227c8440ff86d28572a34759f9d6d33e1c226527fd4a645448ae20c39a6fa34345574a3f19fd119172d7aa4f31718a1cecb1e1788e7025760fc92dff9d16b80fe4d46649abaebd2fbff2b9f883e7406a511ea7108c56920a7c6392dec09413a1f58b7444eb7cdbc2d9777cf8740d8b3581da19f46af720542303e38333eb30995261990b7f26803dbffeb31def44f4399fb97ab239cdf3612454485f37f2bce15c3a8bad4cd1399a9a82f1bbc9ea79be6da97ff412e52d4ee88bd9ccdf9e12b44d83c4af45c4a28a2b92eb386590abda8accae23a390d682272fdc357b145f0a88995463bfe88c881a924bcee55f350dbc2ade4ef37fb9b1f1d50ce6e905fe|5e91527f11754e670bfa64fbac9a042a|23425744b07d20055ac79aed329fdab47cc5f275c200586ecfab5a2b191cb1ac5cd0bf5320f39085cddddc9d2508175edaf3fbd7a35b1c8a4c71bf06587213b6|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAyJWp2kGOhlmPVhfXC7BM\nYqMEr4DNWZ4ALPeX+3FlyffV2ieziXt1W/ldVMHTpUGAleX0NwI2ID3ajOmevzRD\nFrDB+8S4Sqx/V5kwICDMxZ+2WvvOAj8+v9xpvvZhFVEbTzUY2Gu2mAswsWowDpL9\n1l/DZL7+DJrp3I6Gf4bMNH1CbEJt2qErmILRt+S1bgkGBcmzCPONrzPno16bNAwu\nHXmmoekbutm/YjJYYkGY5d29Ny4mizbjrxaDmxhFFdG0B6vMGWh6Gc+/nDoy4zKt\nDG2xXA8RVCkTMiKjpRZH5DweG+ednkFEfDoose/P54pxy9k/Vrzb9CACuFP8v3ZD\nhQIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'3|$argon2id$v=19$m=65536,t=4,p=1$ZUouYXFXU0o3Y0lrVlZDNg$aECmCTAsihEdZn+hWSBbjpJddeGnOIzbvNy4jrPsd40'),(3,'admin','admin','GAyd9z2lCgRHKqdjwgp1JUfSC2dKai/nD1pTyHFiCY395KuuYaQ1jBW+q53q2YF+g4ZXbqaJ+LWWvQEGNY6AxTmeFepbJMee48uUjpu1WXi0UveLKyz7xsBffc0+PutZaKvXnNyiS0u/iU6m4QVoIBS4zW05Pdo5XfxA65ZEMq7jxjbpWxXQysyrSMkX06QzhN04yhUfEVKitYR1F2Z0g9S1er5+8qT4xwNHFbdRh1gH6EEgpX7RDpnQygvSeJUHFE7k7B0xF67qfvIwqvy57gxIaSCAJVDwV37oKIQJdvEPJU9pDVrN9qOs5Tf3v63MFQO3z2z/4yc9h9+lDRe1rQ==','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0','13e20af2bbcbc8089e29fed20b5f0aab96790d5e80241b272dbcb494eae227cf542e28333bd3df0bfe526c9ac3040c8622de7ebaa3ce50f67c7d7b321cad6bee',0,1,1716446175,1716446175,NULL,NULL,'d65323b08c37f7c5919c2d927e545bf564a89558daa51f90983e6bc6e5a3db68852408eb50427b87c7a766ad97fa695f06b74c47a9e44b7d302b142c93f202834cb4fb29b0bdf6e0ed3673214900498dd5d4bca9e3da6bb24d751d8720a6e45404b80410cd0e98919a381d2092318a1c029ec12034104247a83e5b2c84c988c02f07028d7395bfd02fbaa021d713aa9d2e12711a2dfb98f49b4e1eb6dae4487bf06c00f0c64fd8eb4fe2c601bc5c8dd4f331c2b915b2dc2f7c0f4f3bb819c4f2c0a5a8fdca1836a43f87636cc73f2f88f29e935b869d51e94df088e8c09b64c60009dca3a89799ff424df98365edef3c8514668d7ea6df42e7666a54b445f3d7de3648472e1b242f4a6f2c59cde03e5c528d1821efb4ab52abaea73c16f9932b518dac72d4ec57664e725424ab0aa216bb06f1260162aea19857489397028473943d3141f2ad496c30e2eed5721744b671ea67e3dd64e75fa0ba5175b502d20192ad2fa9357ad44fcf05894ad99f07e7d928e008d4fe2c4f22b636c4e0eca6c3f7c9812246622323aec06bd1bf65432e80e4608aeda877363ea0eb782ded73101db2f12f7ecd203e1053a1fc657c5ae2522ff8dbee50fcc4bc093155d0d0f879e3eef556736ac9c15c1b09d1955acd0f100431fc9763e2771447f34a2627d1b47cf9088dadf21200c3abbda1275102027ece6654b602154d4a71631f061fc3fe18d252dd2ec66f348905f3a71ae5e79cc1f1a639844719823c8eefd2209ab6dc26ec8ebbb39e5c831a8529f0f99fa85573340d2218896277a8442e4e33e952446167fdbb185d66aa899cabfc2fd50f189c7c0078fa98c1e591dea1d22b55b02407e34160c61bc019bfb0aa2c0209081e3dfb60864fb7f2d85ff90ad3f3ba1c322568e93a4b1d3c3890fdb0a8d2319622ee488bcdf50fb3740a6f1d5d853cbef4d9588adeab2d7f5cceca2abd629cbd7efcf6873b8f179af2b59b2528ac50ab4e305830f5372a110de6d5658c06d55b89ba7ed5e1ee9e04b7887ace731ed920688efbc8a0b5fee86608c88e04585e046d6ad8176fae735449a67612c48368f6b4248f25545841b09c70dd7d2e247eb1a19a204ee23abf8589cc071846554e34a4b51ac79aad3bff7625e5a3b18a264a0df281bfb83b1d99b512116d5d29f3303db62f1b2a4472032481cc246ce53e2eb36a893c7815cfa292333ae86168bd5fcd8066b1be3948d1cd1eaa0b07eac250d036818032c2fd400b308192cdb323df58829305440de47f84c19bb8406051bc33956e44cf4bbb9e9aa6cb986a6f9079adfca9d248eca21c5cd16f255984637fba8e003d3418ca9237efe149ec4f3a271145cfe307f1247630a29900622b0887706b9c42b43c06e25c647e352dcffc63c8f69931fa398d315cbea9c9cb39defd3bf97aae5e01d8ba6a791ac236bdab436df4329fc8b5a41194d5fca02136037cf67788557be05c91ae50bb3e59efb964a9adf57ba24f368a69bcffe99d9e3fc2a5d1e206f33aaf5a34794b80a35f985517f5ee663f29b8e0403209c0403bb96df5b4f15e99066d4572c5648b9c789eda17ac3d3118f5b0eed03d49e852ea2b6526ded6b0b7ea49f97320082754c3d557d2542998b072b86187421ebb7e03368eb874505985e2f6ce033ce3f06d6137a3f65f197144266294a34f053bc314c6eb7f409d17055da1da8aec9fae454840c1a76b7d813a7dfcb7c791597b916d159add269006737055ccc8feedae1ce7680aad1c8886927977b797ad07d549af88489d5fa5930bc168a78f879fdc9bfa325e773160d872124028327bd6fe6544c07153d49b7d0b01890f1f5893f23d014ac1e3edfa79c7de5065d590f885e8f68cadd3d1b9b436d3894cc4604340088160e1764b3aebf3e7074bb04483b6c6e3763d3ed6c761f19067c70566aa6da5a06ad82685a9ce7dacaea5f6096ca686f2e405f61722d8b6874b538b720a2ba425953d2d7bde7c0af1095606dd12efcf3a5757fc14f2e57f8361a79e5389f3a35a0b6cd3b17d2a0bc3388552da4b8d1cb3e567f678ee73c7adbbc018b244f02c93d32a639104459aa00a2f8b335597dd1e3196072881a36d64e39a3da90679dfb567af6a2163656ca619a3d78a3a99b6d1de3f6d6ccae0eb8a85e4ac3fa39ce8a311f5944a5f792ff84a7cb00a89ce8d26ca5f68a3b3a7d71c02f5769df5e09df569fc8bebc321f96b75753d05ea096a334c8c4b6dfbf77e7b9ae2846e11a7e1979b94c9c5d1610ca2f465fa556ac6c40672053e8db6f47bacbe90c81f8de60ae791a893ccb9e9be02f09b97de78d629e155a28984e119f34f0656ca891ef751da147e155169f105f3894fec3a5dcdc58014730cee3d51613e92a00de66083f005cb7d2e7766adcabd95478b19ea0448295e7ba6|30cb8c8290d20246ca613dd3a5bb2260|bcb7e565455a86c76a43e7e15c73e1c75fabf2c37650cb6430cee9d4d423978873b518cbc1045163d860aaeeb2ae091feac58047ee8883c4267c1e661eaf5aef|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnGKRiUWNuBftPVBNxSye\n86hqE/SNZvF7VyYJYYamK3x2kef7H+eU1q94nrJ5yBV36dYHy38iuD6k2x9xIoQF\n+4UfA+pVcZjmVX6SrOUhcQaoXDxP2YVaeUOUPzrvD7gtMg1mTlUvjdQXmWa4jtKf\nlbTVW2NJAFA/mKLzCa5LQa5HLLF7AbdIPD6IzPWyBRyrSHEGFnv3sdae4mybg8wf\nMF2HtxRt2XlHTcdT16YlK940PEsPnox+Mu+ujv9AkGdsyY8Zl5QJZSm2qN+0ThPx\n6LmW7w90u6vVMUlSlVEz+1wZSSGh+/q3oIOZ2ujvJk/0FSKuOaFIcx4UvGZbeTWN\nEQIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'3|$argon2id$v=19$m=65536,t=4,p=1$ZUouYXFXU0o3Y0lrVlZDNg$aECmCTAsihEdZn+hWSBbjpJddeGnOIzbvNy4jrPsd40');
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
-- Table structure for table `oc_calendar_appt_bookings`
--

DROP TABLE IF EXISTS `oc_calendar_appt_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_appt_bookings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appt_config_id` bigint(20) unsigned NOT NULL,
  `created_at` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `display_name` varchar(128) NOT NULL,
  `description` longtext DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `timezone` varchar(32) NOT NULL,
  `confirmed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cal_appt_bk_token_uniq_idx` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_appt_bookings`
--

LOCK TABLES `oc_calendar_appt_bookings` WRITE;
/*!40000 ALTER TABLE `oc_calendar_appt_bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_appt_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_appt_configs`
--

DROP TABLE IF EXISTS `oc_calendar_appt_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_appt_configs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext DEFAULT NULL,
  `location` longtext DEFAULT NULL,
  `visibility` varchar(10) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `target_calendar_uri` varchar(255) NOT NULL,
  `calendar_freebusy_uris` longtext DEFAULT NULL,
  `availability` longtext DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `end` int(11) DEFAULT NULL,
  `length` int(11) NOT NULL,
  `increment` int(11) NOT NULL,
  `preparation_duration` int(11) NOT NULL DEFAULT 0,
  `followup_duration` int(11) NOT NULL DEFAULT 0,
  `time_before_next_slot` int(11) DEFAULT NULL,
  `daily_max` int(11) DEFAULT NULL,
  `future_limit` int(11) DEFAULT NULL,
  `create_talk_room` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cal_appt_token_uniq_idx` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_appt_configs`
--

LOCK TABLES `oc_calendar_appt_configs` WRITE;
/*!40000 ALTER TABLE `oc_calendar_appt_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_appt_configs` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendars`
--

LOCK TABLES `oc_calendars` WRITE;
/*!40000 ALTER TABLE `oc_calendars` DISABLE KEYS */;
INSERT INTO `oc_calendars` VALUES (1,'principals/users/admin','Personal','personal',1,NULL,0,NULL,NULL,'VEVENT,VTODO',0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_circle`
--

LOCK TABLES `oc_circles_circle` WRITE;
/*!40000 ALTER TABLE `oc_circles_circle` DISABLE KEYS */;
INSERT INTO `oc_circles_circle` VALUES (1,'CrzpqsNNOxi4LRZ3hermeyY5lbJMv62','user:admin:CrzpqsNNOxi4LRZ3hermeyY5lbJMv62','admin','','',1,1,'[]','','2024-05-23 04:07:17',0,''),(3,'e2gr86ezZbzdcW6wsZPPv1Gbpvu1Cny','app:circles:e2gr86ezZbzdcW6wsZPPv1Gbpvu1Cny','Circles','','',8193,10001,'[]','','2024-05-23 04:07:17',0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_member`
--

LOCK TABLES `oc_circles_member` WRITE;
/*!40000 ALTER TABLE `oc_circles_member` DISABLE KEYS */;
INSERT INTO `oc_circles_member` VALUES (1,'e2gr86ezZbzdcW6wsZPPv1Gbpvu1Cny','e2gr86ezZbzdcW6wsZPPv1Gbpvu1Cny','e2gr86ezZbzdcW6wsZPPv1Gbpvu1Cny','circles',10000,'',NULL,9,'Member','[]','Circles','2024-05-23 04:07:17','',NULL,'2024-05-23 04:07:17'),(3,'CrzpqsNNOxi4LRZ3hermeyY5lbJMv62','CrzpqsNNOxi4LRZ3hermeyY5lbJMv62','CrzpqsNNOxi4LRZ3hermeyY5lbJMv62','admin',1,'','e2gr86ezZbzdcW6wsZPPv1Gbpvu1Cny',9,'Member','[]','admin','2024-05-23 04:07:18','',NULL,'2024-05-23 04:07:18');
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
INSERT INTO `oc_circles_membership` VALUES ('CrzpqsNNOxi4LRZ3hermeyY5lbJMv62','CrzpqsNNOxi4LRZ3hermeyY5lbJMv62',9,'CrzpqsNNOxi4LRZ3hermeyY5lbJMv62','CrzpqsNNOxi4LRZ3hermeyY5lbJMv62',1,'[\"CrzpqsNNOxi4LRZ3hermeyY5lbJMv62\"]'),('e2gr86ezZbzdcW6wsZPPv1Gbpvu1Cny','e2gr86ezZbzdcW6wsZPPv1Gbpvu1Cny',9,'e2gr86ezZbzdcW6wsZPPv1Gbpvu1Cny','e2gr86ezZbzdcW6wsZPPv1Gbpvu1Cny',1,'[\"e2gr86ezZbzdcW6wsZPPv1Gbpvu1Cny\"]');
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
) ENGINE=InnoDB AUTO_INCREMENT=743 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` VALUES (1,0,'files/e358852d1799ec24cd00329ffe6b7ec1',1716445301),(49,0,'files/a1aaca92a58b718607287feb132f6124',1716441520),(51,0,'files/2e932672c8018ad2cd61ceea5489936c',1716441520),(63,0,'files/26cd9350853f31c7ddbebc2ba742c83a',1716441520),(65,0,'files/3f691ebbe45f5a02b2c9970742bcc9dc',1716441520),(77,0,'files/95c117288cb4e9d4c8bcbb76b06c3962',1716441521),(79,0,'files/a80d2b3d8fc599eb03a0ebe405bb777d',1716441521),(109,0,'files/84fc6d08ed3bd071bcdab33a99d2d7d9',1716441521),(113,0,'files/b6ef755cfc70b5eb94f5d3aad8ba833d',1716445301),(115,0,'files/3513aba8aa4305d3ad33fc7122d4af30',1716441521),(117,0,'files/6828fbc3ff4f7529a868dc166a6a4cb7',1716441515),(123,0,'files/6b2de085d9b53fa93fa74433933ff37f',1716444318),(129,0,'files/cbc6f4e337332b94c2e02444d64b1c16',1716444350),(131,0,'files/2c7eaecb9090bd89cef1dcd4d0d5881a',1716444350),(137,0,'files/585273f764f7401d20c06a646f408e8a',1716441521),(139,0,'files/2b7e5de9afe8b3f7b056c0ba2a04af46',1716441521),(143,0,'files/f37e84450589af913f25de4ba5bc231d',1716441520),(153,0,'files/be91a0daf1c31613c2397e27c9a5910d',1716441520),(155,0,'files/c39848507e7544f2f0a1d5ea4dac9e07',1716441520),(157,0,'files/056b0fa875fb4572676ca9ea3e29ec0a',1716441520),(159,0,'files/cd4c0d980ca455429c5313ed78bbc46b',1716441520),(161,0,'files/9d515673ca7336568d9751a6a3472a7f',1716441520),(163,0,'files/0bf48801c8b4ee15b3e9b55734fd55ac',1716441520),(165,0,'files/c47e23db1860a503479a074993cc6560',1716441520),(167,0,'files/71aef53f80bc4e80cd467c0cfc48c735',1716441520),(169,0,'files/cd6ea233e75d23f2c29f8ff1c1ac6e26',1716441520),(171,0,'files/4278c9647749c82c3f20aea99d3e98b8',1716441520),(173,0,'files/f12b2e6f95e4aa5d2c08c82e6776c0ad',1716441520),(175,0,'files/9c5edfec0e90b13a1c3f441e9084c0a8',1716441520),(179,0,'files/b8cc7fe527d2bdaca926a000a1582271',1716441520),(181,0,'files/bae5871b22f91c6a09baed7affe52ecd',1716441520),(183,0,'files/4a4ccbbe322fafc54624110c087edd4b',1716441520),(199,0,'files/b6f24cd38cff82f61399bb6e58960403',1716441521),(203,0,'files/8d8113b721e4cc44c89dae324bfc56d4',1716441521),(205,0,'files/8ff565bc65a37922079ad424018cc1cf',1716441521),(207,0,'files/2970a93f3a7d090dcf1397b96f70789b',1716441521),(211,0,'files/cd726da6ccc884f8f18d20658c182db8',1716441521),(213,0,'files/0b878f9e6a40beb7459048b583a39f46',1716441521),(215,0,'files/225eb86b8beffab61866bc95b1b84f3a',1716441521),(217,0,'files/ba9752551316455a9357e932ec204c2d',1716441521),(225,0,'files/cecfa4eb5a3277d2b93f3c58256f99d8',1716441521),(473,0,'files/20e1c92eec23770cd2ab62aede0a112e',1716444319),(475,0,'files/1f0e51490c32ffd039c8dd7a9ecdb2c7',1716444319),(477,0,'files/a04b39dcd97c1b9b98bb1b0c99d08678',1716444319),(479,0,'files/96654b9e7532ec2dfdfc39cde03ea02b',1716444319),(481,0,'files/1f8506713c74689d9dbeb7c51c5a886e',1716444319),(483,0,'files/1a06792041266774db79e84d09b07084',1716444319),(485,0,'files/16565c84625344efb12b728c0c1f2d27',1716444319),(487,0,'files/7ac711b3804132e191ac8edb47491c4b',1716444319),(489,0,'files/04f1f783b31a05c55920f766f750fd99',1716444319),(491,0,'files/95e6285f2fc01d259d046675684e9a16',1716444319),(493,0,'files/4a2b9f67e518f14c61c7bff4bfc15680',1716444319),(495,0,'files/5a39d2f997a4ccf69670fcb98b23f7f5',1716444319),(499,0,'files/b6d5de020d6591ac0751d4b8ec5538ad',1716444319),(501,0,'files/3da318a20823a1597abb78a369d3d690',1716444319),(505,0,'files/7ba9703fd5da0bc21a9499fab3fdfabc',1716444319),(507,0,'files/2bf68b2a16fc277d714d2d21043f5e22',1716444319),(511,0,'files/cb7dbc33462c9a9661414c36578b2f2b',1716444319),(515,0,'files/4c6052223c2757c6a1fac581e057a43a',1716444319),(517,0,'files/7f697fff871bf98613679a04c6eac4f5',1716444319),(519,0,'files/c2253dc657cf631119c09b829c02c023',1716444319),(521,0,'files/5e785f596afe347657437c466e8da003',1716444319),(523,0,'files/fc2657566deab0d207d9adc4b68e4dcb',1716444319),(525,0,'files/0bf86c68e2e978afca12d467df39d975',1716444319),(529,0,'files/52898e4d72338b63378560a510bd7113',1716444319),(533,0,'files/d6e4c5dd21b490fd11162a0d1a346d2e',1716444319),(539,0,'files/83f44a83c313ebf8afb1ece18b387c24',1716444320),(555,0,'files/feb14c67dbb028093a7ac788792e38a7',1716445301),(561,0,'files/ea34cac6410e86d5e073923dca81f43c',1716444836),(633,0,'files/8bdf935f365789331188ec1f79ca1f93',1716445301),(649,0,'files/7216a225a93d07e4a79e1efb5bd53ebc',1716445297),(665,0,'files/e0e17ffcd7b84aa3eda04be3c4efed6a',1716445293),(697,0,'files/d79143a4f702e9a6331fa625467a00c8',1716445293),(715,0,'files/0cbee41904d71b1382b33888af6fab27',1716445297),(741,0,'files/70f1d536399a94d177be0ab0d03afc2d',1716445301);
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
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` VALUES (1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',3,1,38786066,1716441701,1716441693,0,0,'664ed2657f783',23,''),(3,1,'files','45b963397aa40d4a0063e0d85e4fe7a1',1,'files',3,1,38785501,1716441701,1716440768,0,0,'664ed2657f783',31,''),(5,1,'files/Readme.md','49af83716f8dcbfa89aaf835241c0b9f',3,'Readme.md',7,5,206,1716437238,1716437238,0,0,'61096d995c285c570f6a1d118d9a2aa0',27,''),(7,1,'files/Nextcloud Manual.pdf','2bc58a43566a8edde804a4a97a9c7469',3,'Nextcloud Manual.pdf',11,9,16305464,1716437239,1716437239,0,0,'8c25a16494a879fc3fbd1e5e63151ebb',27,''),(9,1,'files/Reasons to use Nextcloud.pdf','418b19142a61c5bef296ea56ee144ca3',3,'Reasons to use Nextcloud.pdf',11,9,976625,1716437239,1716437239,0,0,'08e04fc91fd46735086d0b8aed0f0049',27,''),(11,1,'files/Nextcloud.png','2bcc0ff06465ef1bfc4a868efde1e485',3,'Nextcloud.png',15,13,50598,1716437240,1716437240,0,0,'e0d9d39e3b982449c13970fb39dcb6bb',27,''),(13,1,'files/Documents','0ad78ba05b6961d92f7970b2b3922eca',3,'Documents',3,1,1108864,1716440750,1716437241,0,0,'664eceae4b4c4',31,''),(15,1,'files/Documents/Nextcloud flyer.pdf','9c5b4dc7182a7435767708ac3e8d126c',13,'Nextcloud flyer.pdf',11,9,1083339,1716437240,1716437240,0,0,'cd46e77e3ccb5083d3296fb1b802bc67',27,''),(17,1,'files/Documents/Readme.md','51ec9e44357d147dd5c212b850f6910f',13,'Readme.md',7,5,135,1716440750,1716440750,0,0,'f19ee6e34908517794f4b6dc1b45f9f1',27,''),(19,1,'files/Documents/Example.md','efe0853470dd0663db34818b444328dd',13,'Example.md',7,5,1095,1716437240,1716437240,0,0,'79d9bdd60d0495dc750ed67306d63733',27,''),(21,1,'files/Documents/Welcome to Nextcloud Hub.docx','b44cb84f22ceddc4ca2826e026038091',13,'Welcome to Nextcloud Hub.docx',17,9,24295,1716437241,1716437241,0,0,'92117ffcc8fa90b2ebaf85b305fd9327',27,''),(23,1,'files/Templates credits.md','f7c01e3e0b55bb895e09dc08d19375b3',3,'Templates credits.md',7,5,2403,1716437241,1716437241,0,0,'3e0701e07fe5786fc0f53934267cc164',27,''),(25,1,'files/Templates','530b342d0b8164ff3b4754c2273a453e',3,'Templates',3,1,10721152,1716437247,1716437247,0,0,'664ec0ff7c578',31,''),(27,1,'files/Templates/Mindmap.odg','74cff798fc1b9634ee45380599b2a6da',25,'Mindmap.odg',19,9,13653,1716437241,1716437241,0,0,'519796b16e1515df2a75be3555e5877c',27,''),(29,1,'files/Templates/Readme.md','71fa2e74ab30f39eed525572ccc3bbec',25,'Readme.md',7,5,554,1716437242,1716437242,0,0,'cf4e20b1391577f3a3e60f35bb788ace',27,''),(31,1,'files/Templates/Timesheet.ods','cb79c81e41d3c3c77cd31576dc7f1a3a',25,'Timesheet.ods',21,9,88394,1716437242,1716437242,0,0,'a2b04b1fa222071934f3ddc938e4d2ad',27,''),(33,1,'files/Templates/Gotong royong.odp','14b958f5aafb7cfd703090226f3cbd1b',25,'Gotong royong.odp',23,9,3509628,1716437242,1716437242,0,0,'1cea636221fed4f100a5294924f71986',27,''),(35,1,'files/Templates/Flowchart.odg','832942849155883ceddc6f3cede21867',25,'Flowchart.odg',19,9,11836,1716437242,1716437242,0,0,'c9ef130aae18db593d7be6946937995a',27,''),(37,1,'files/Templates/Party invitation.odt','439f95f734be87868374b1a5a312c550',25,'Party invitation.odt',25,9,868111,1716437243,1716437243,0,0,'663a9d07298e3bf303b834f79707ff05',27,''),(39,1,'files/Templates/Resume.odt','ace8f81202eadb2f0c15ba6ecc2539f5',25,'Resume.odt',25,9,39404,1716437243,1716437243,0,0,'918a9f2230f15df458a4fd41ff975a49',27,''),(41,1,'files/Templates/Invoice.odt','40fdccb51b6c3e3cf20532e06ed5016e',25,'Invoice.odt',25,9,17276,1716437243,1716437243,0,0,'08044062a13aaac7f67c0274d700e51d',27,''),(43,1,'files/Templates/Product plan.md','a9fbf58bf31cebb8143f7ad3a5205633',25,'Product plan.md',7,5,573,1716437243,1716437243,0,0,'04d0b650590a0f0e54e95de4b4a9f996',27,''),(45,1,'files/Templates/Elegant.odp','f3ec70ed694c0ca215f094b98eb046a7',25,'Elegant.odp',23,9,14316,1716437244,1716437244,0,0,'de8a278b4d644a65de8d6d045441dd11',27,''),(47,1,'files/Templates/Photo book.odt','ea35993988e2799424fef3ff4f420c24',25,'Photo book.odt',25,9,5155877,1716437244,1716437244,0,0,'a55f163b177a4f28d21950f3434eac4e',27,''),(49,1,'files/Templates/Mother\'s day.odt','cb66c617dbb4acc9b534ec095c400b53',25,'Mother\'s day.odt',25,9,340061,1716437244,1716437244,0,0,'f67a01526d6238bd89fa96994220ec5e',27,''),(51,1,'files/Templates/Syllabus.odt','03b3147e6dae00674c1d50fe22bb8496',25,'Syllabus.odt',25,9,30354,1716437244,1716437244,0,0,'f8770f5f85d9577d57ca43911e06fad2',27,''),(53,1,'files/Templates/Simple.odp','a2c90ff606d31419d699b0b437969c61',25,'Simple.odp',23,9,14810,1716437245,1716437245,0,0,'72bd8b11e7db9b1ea1fbbd090240b7a1',27,''),(55,1,'files/Templates/Expense report.ods','d0a4025621279b95d2f94ff4ec09eab3',25,'Expense report.ods',21,9,13441,1716437245,1716437245,0,0,'2b4aa34fc29ebd5e026ecf379a7163b1',27,''),(57,1,'files/Templates/Impact effort matrix.whiteboard','c5e3b589ec8f9dd6afdebe0ac6feeac8',25,'Impact effort matrix.whiteboard',27,9,52674,1716437245,1716437245,0,0,'06842df7b4e00caf88f3ce4b3a1fa36f',27,''),(59,1,'files/Templates/Modern company.odp','96ad2c06ebb6a79bcdf2f4030421dee3',25,'Modern company.odp',23,9,317015,1716437245,1716437245,0,0,'08eaa7379b3362db40e6eea8f37b47b0',27,''),(61,1,'files/Templates/Meeting notes.md','c0279758bb570afdcdbc2471b2f16285',25,'Meeting notes.md',7,5,326,1716437245,1716437245,0,0,'99057e09177815112ca1f489defc04f9',27,''),(63,1,'files/Templates/Diagram & table.ods','0a89f154655f6d4a0098bc4e6ca87367',25,'Diagram & table.ods',21,9,13378,1716437246,1716437246,0,0,'d182f7a53593e08d3543f5028c96009e',27,''),(65,1,'files/Templates/SWOT analysis.whiteboard','3fd0e44b3e6f0e7144442ef6fc71a663',25,'SWOT analysis.whiteboard',27,9,38605,1716437246,1716437246,0,0,'a58767681a12ee8653a36ec8b4c96467',27,''),(67,1,'files/Templates/Yellow idea.odp','3a57051288d7b81bef3196a2123f4af5',25,'Yellow idea.odp',23,9,81196,1716437246,1716437246,0,0,'6036295543b262f25018f56908318bd8',27,''),(69,1,'files/Templates/Business model canvas.ods','86c10a47dedf156bf4431cb75e0f76ec',25,'Business model canvas.ods',21,9,52843,1716437246,1716437246,0,0,'ffd132063399d498df2537ae8d729c6c',27,''),(71,1,'files/Templates/Business model canvas.odg','6a8f3e02bdf45c8b0671967969393bcb',25,'Business model canvas.odg',19,9,16988,1716437247,1716437247,0,0,'2641e44548c6e94284db6ce8203981d2',27,''),(73,1,'files/Templates/Org chart.odg','fd846bc062b158abb99a75a5b33b53e7',25,'Org chart.odg',19,9,13878,1716437247,1716437247,0,0,'eb030256607f30096b1020497f6beb7e',27,''),(75,1,'files/Templates/Letter.odt','15545ade0e9863c98f3a5cc0fbf2836a',25,'Letter.odt',25,9,15961,1716437247,1716437247,0,0,'76d9e9992e3e30df74be54189c41d7d4',27,''),(77,1,'files/Nextcloud intro.mp4','e4919345bcc87d4585a5525daaad99c0',3,'Nextcloud intro.mp4',31,29,3963036,1716437247,1716437247,0,0,'f3792883faa97c7f96a73b43db67e959',27,''),(79,1,'files/Photos','d01bb67e7b71dd49fd06bad922f521c9',3,'Photos',3,1,5656463,1716437250,1716437250,0,0,'664ec10256144',31,''),(81,1,'files/Photos/Frog.jpg','d6219add1a9129ed0c1513af985e2081',79,'Frog.jpg',33,13,457744,1716437248,1716437248,0,0,'153880320c44a0e2e5a27fe523bbee28',27,''),(83,1,'files/Photos/Readme.md','2a4ac36bb841d25d06d164f291ee97db',79,'Readme.md',7,5,150,1716437248,1716437248,0,0,'54176e84cd37c73c553241941d41fb7f',27,''),(85,1,'files/Photos/Nextcloud community.jpg','b9b3caef83a2a1c20354b98df6bcd9d0',79,'Nextcloud community.jpg',33,13,797325,1716437248,1716437248,0,0,'4ffe2ced2c1291daff2f1cf2470c14ab',27,''),(87,1,'files/Photos/Toucan.jpg','681d1e78f46a233e12ecfa722cbc2aef',79,'Toucan.jpg',33,13,167989,1716437248,1716437248,0,0,'54d5384ac6ce926f7dd3d3ace127ed7f',27,''),(89,1,'files/Photos/Gorilla.jpg','6d5f5956d8ff76a5f290cebb56402789',79,'Gorilla.jpg',33,13,474653,1716437249,1716437249,0,0,'0698c15438bc2102d17133a77c199297',27,''),(91,1,'files/Photos/Birdie.jpg','cd31c7af3a0ec6e15782b5edd2774549',79,'Birdie.jpg',33,13,593508,1716437249,1716437249,0,0,'8f1d114641e6f5098d317e226705bbb5',27,''),(93,1,'files/Photos/Vineyard.jpg','14e5f2670b0817614acd52269d971db8',79,'Vineyard.jpg',33,13,427030,1716437249,1716437249,0,0,'34afed82f815b9e49f558da23ace6e8a',27,''),(95,1,'files/Photos/Steps.jpg','7b2ca8d05bbad97e00cbf5833d43e912',79,'Steps.jpg',33,13,567689,1716437250,1716437250,0,0,'9703994bcf33eaf4a809418428b6451f',27,''),(97,1,'files/Photos/Library.jpg','0b785d02a19fc00979f82f6b54a05805',79,'Library.jpg',33,13,2170375,1716437250,1716437250,0,0,'e99d504bebd6d4a1f85147cc7b5f6151',27,''),(99,3,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',3,1,-1,1716437296,1716437296,0,0,'664ec130a851c',23,''),(101,3,'appdata_oc4g4egl95q3','b770a8263d7c5d8c489199937a9be987',99,'appdata_oc4g4egl95q3',3,1,-1,1716437923,1716437923,0,0,'664ec12d9cf79',31,''),(103,3,'appdata_oc4g4egl95q3/js','6f8327ea8120bcb10b4d7e43fbc24bcb',101,'js',3,1,0,1716437293,1716437293,0,0,'664ec12dab2ed',31,''),(105,3,'appdata_oc4g4egl95q3/js/core','9cefe37307820268fd9248d7fd725845',103,'core',3,1,0,1716437293,1716437293,0,0,'664ec12db30bb',31,''),(107,3,'appdata_oc4g4egl95q3/js/core/merged-template-prepend.js','119b0f780beeb8f77f196f644d749b65',105,'merged-template-prepend.js',35,9,12288,1716437293,1716437293,0,0,'239dedb6094b7b29593de1c5860dc824',27,''),(109,3,'appdata_oc4g4egl95q3/js/core/merged-template-prepend.js.deps','ae7d4c851cb15e2f9f0dbfd752951266',105,'merged-template-prepend.js.deps',27,9,250,1716437293,1716437293,0,0,'9a13322fec0cf575d179cddb57c46c72',27,''),(111,3,'appdata_oc4g4egl95q3/js/core/merged-template-prepend.js.gzip','1201f32c13dfa6e1b89c2c0531980ba8',105,'merged-template-prepend.js.gzip',37,9,3130,1716437293,1716437293,0,0,'6d26cd4fc67aa91b9bd96607e756ccc6',27,''),(113,3,'appdata_oc4g4egl95q3/theming','1ccf7f38e1184db7b6b6c176be5056df',101,'theming',3,1,0,1716437294,1716437294,0,0,'664ec12e0a092',31,''),(115,3,'appdata_oc4g4egl95q3/theming/global','5d3b457526b1cdef547f9625f315afe7',113,'global',3,1,0,1716437921,1716437921,0,0,'664ec12e142ca',31,''),(117,3,'appdata_oc4g4egl95q3/appstore','8d128199a7db34a02edab3644d652178',101,'appstore',3,1,0,1716437299,1716437299,0,0,'664ec1307a8de',31,''),(119,3,'appdata_oc4g4egl95q3/appstore/apps.json','b7a1d3d9d2151e32f3165a0cf9894f57',117,'apps.json',39,9,2560927,1716441212,1716441212,0,0,'b952b8717968491fd088fedbfe45a639',27,''),(121,3,'appdata_oc4g4egl95q3/richdocuments','1231255e39f969db502d6ed167569f8a',101,'richdocuments',3,1,0,1716437618,1716437618,0,0,'664ec27270189',31,''),(123,3,'appdata_oc4g4egl95q3/richdocuments/fonts','32bd57dd0195d6eb96ddf9e65951e665',121,'fonts',3,1,0,1716437619,1716437619,0,0,'664ec2727a002',31,''),(125,3,'appdata_oc4g4egl95q3/richdocuments/fonts/Lora-wght.ttf','841d853275006954d5894d2a3e22fe3a',123,'Lora-wght.ttf',41,9,212196,1716437618,1716437618,0,0,'f891162589489335648d6aab19ac6d48',27,''),(127,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews','889d0aa0e7b87fcc6afc1ce572907e43',121,'font-overviews',3,1,0,1716437619,1716437619,0,0,'664ec272924bd',31,''),(129,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/Lora-wght.ttf.png','ed8e131c67b022f8ace5b10b52d97af2',127,'Lora-wght.ttf.png',15,13,2692,1716437618,1716437618,0,0,'e97260277b62792a9a104f1db50eb2ac',27,''),(131,3,'appdata_oc4g4egl95q3/richdocuments/fonts/AmaticSC-Regular.ttf','c22974d5c0d8ea028653f65bed8a572c',123,'AmaticSC-Regular.ttf',41,9,151624,1716437618,1716437618,0,0,'e5a473274b3c485d70d516892ee19087',27,''),(133,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/AmaticSC-Regular.ttf.png','e69e2a3b60e7530e52fd5ed7be3d6ede',127,'AmaticSC-Regular.ttf.png',15,13,2000,1716437618,1716437618,0,0,'3c156083c64cafb810bf9b8b3ee37ea7',27,''),(135,3,'appdata_oc4g4egl95q3/richdocuments/fonts/Lobster-Regular.ttf','c0a5d6d03880b829bed9561d29ccb8ad',123,'Lobster-Regular.ttf',41,9,406076,1716437618,1716437618,0,0,'151048298c775daed8935829c4c0aa07',27,''),(137,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/Lobster-Regular.ttf.png','f8015b798c7569cb778242344597d961',127,'Lobster-Regular.ttf.png',15,13,2722,1716437618,1716437618,0,0,'ab2d4c721a311bf3eca06b4040bba2f0',27,''),(139,3,'appdata_oc4g4egl95q3/richdocuments/fonts/Spectral-Regular.ttf','3e2e0e9098263c36d4469f78c1a9d166',123,'Spectral-Regular.ttf',41,9,276492,1716437618,1716437618,0,0,'6840afbf7149285f201d2cb55bec168d',27,''),(141,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/Spectral-Regular.ttf.png','e0a03e5789374c12f5afb36a8ecfc3b0',127,'Spectral-Regular.ttf.png',15,13,2097,1716437618,1716437618,0,0,'5bdd1b1be83a83a520abbeb269df6c0e',27,''),(143,3,'appdata_oc4g4egl95q3/richdocuments/fonts/PlayfairDisplay-wght.ttf','71a2bd348fe9839094483180d7bddb6b',123,'PlayfairDisplay-wght.ttf',41,9,300724,1716437618,1716437618,0,0,'3ca5eda32f25c0f0ed0df197b64eca7e',27,''),(145,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/PlayfairDisplay-wght.ttf.png','eccadbd66c9a1d09564848beaf62d616',127,'PlayfairDisplay-wght.ttf.png',15,13,2525,1716437618,1716437618,0,0,'5d9a3df2d7f57342f6356e2ff202e19e',27,''),(147,3,'appdata_oc4g4egl95q3/richdocuments/fonts/AmaticSC-Bold.ttf','ba16fca9c0113fa0104f97dfdb0b0fef',123,'AmaticSC-Bold.ttf',41,9,156180,1716437618,1716437618,0,0,'a41536901d62205a07cc657871ad6af5',27,''),(149,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/AmaticSC-Bold.ttf.png','5f123a214baf6a25e37a8b0d14c41d52',127,'AmaticSC-Bold.ttf.png',15,13,2298,1716437618,1716437618,0,0,'b5fdcd49a3e70d445eb0d98646354020',27,''),(151,3,'appdata_oc4g4egl95q3/richdocuments/fonts/Roboto-wdtg-wght.ttf','9bd092066129e9032609676f5c8b4a8d',123,'Roboto-wdtg-wght.ttf',41,9,469380,1716437619,1716437619,0,0,'d6f99a0d4d05c73fa5ffc55bf35c637a',27,''),(153,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/Roboto-wdtg-wght.ttf.png','3dd66605b62db90ae28e0f38f4aefa1b',127,'Roboto-wdtg-wght.ttf.png',15,13,2185,1716437619,1716437619,0,0,'4f12288b04cda2539a1fb2fd209300ec',27,''),(155,3,'appdata_oc4g4egl95q3/richdocuments/fonts/Nunito-wght.ttf','d388bba60d0c805265396562ed1d116d',123,'Nunito-wght.ttf',41,9,276932,1716437619,1716437619,0,0,'9f44ec675d9fbaae10e9bcc5d6652fe3',27,''),(157,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/Nunito-wght.ttf.png','22ba2ec68b171c664826f72d2edad4df',127,'Nunito-wght.ttf.png',15,13,2150,1716437619,1716437619,0,0,'4d17b2d1380e706d4990ea70241355b2',27,''),(159,3,'appdata_oc4g4egl95q3/richdocuments/fonts/Pacifico-Regular.ttf','f3a6d2708a42bdfb8f07b9bb23e2ecfe',123,'Pacifico-Regular.ttf',41,9,329380,1716437619,1716437619,0,0,'80238bbbedef90b8a454d97811ba3d0b',27,''),(161,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/Pacifico-Regular.ttf.png','53aeed50ab6e0ff6ecde43590fe52631',127,'Pacifico-Regular.ttf.png',15,13,2734,1716437619,1716437619,0,0,'c39ba9fc6e44fd940ec9a49e6d3dac92',27,''),(163,3,'appdata_oc4g4egl95q3/richdocuments/fonts/Oswald-wght.ttf','b5768bfe1980cb501e3deec6281c092a',123,'Oswald-wght.ttf',41,9,172088,1716437619,1716437619,0,0,'29f2e583fc5d2bdcbccfcdfa14d526ba',27,''),(165,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/Oswald-wght.ttf.png','9d2560478acc2a22cd0b1e4707c91a8d',127,'Oswald-wght.ttf.png',15,13,1949,1716437619,1716437619,0,0,'16403fa61a9b094774ad49d8d5801d1b',27,''),(167,3,'appdata_oc4g4egl95q3/richdocuments/fonts/Caveat-wght.ttf','4d6400deaae8a4dd84276c5d51c23e7e',123,'Caveat-wght.ttf',41,9,403648,1716437619,1716437619,0,0,'ecf3ac81c9da7704b003c895ae1b9db6',27,''),(169,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/Caveat-wght.ttf.png','6003b60dabe31b656fa1114283603e20',127,'Caveat-wght.ttf.png',15,13,2020,1716437619,1716437619,0,0,'7483de20de89ff4b2406392bc6bf6834',27,''),(171,3,'appdata_oc4g4egl95q3/richdocuments/fonts/Lexend-wght.ttf','772cc0d5ad1e9269aafc1c44789b33d2',123,'Lexend-wght.ttf',41,9,175756,1716437619,1716437619,0,0,'4f242ce003a1e2d517dd2569134683e7',27,''),(173,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/Lexend-wght.ttf.png','0d8a7ba3fd55c0dcd2c4d2a4daffcf90',127,'Lexend-wght.ttf.png',15,13,2310,1716437619,1716437619,0,0,'88e85c880ef1506b95a1e594b534c067',27,''),(175,3,'appdata_oc4g4egl95q3/richdocuments/fonts/EBGaramond-wght.ttf','c05aee780a2f8f347c4eb04a2360220d',123,'EBGaramond-wght.ttf',41,9,968340,1716437619,1716437619,0,0,'6d5a9c4c76ef209775a8ac2e798408fb',27,''),(177,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/EBGaramond-wght.ttf.png','4435f68abd2b39861352cd7991ffd906',127,'EBGaramond-wght.ttf.png',15,13,2317,1716437619,1716437619,0,0,'cf9203c9d1edb15ccee29e65f29ddf6c',27,''),(179,3,'appdata_oc4g4egl95q3/richdocuments/fonts/Comfortaa-wght.ttf','8a1c3509791ff2058731c9ac424c1064',123,'Comfortaa-wght.ttf',41,9,201756,1716437619,1716437619,0,0,'e7ea8c4712469da3b1ba27f153eedc43',27,''),(181,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/Comfortaa-wght.ttf.png','bd7ce5bd40571181499caff95d40f3a4',127,'Comfortaa-wght.ttf.png',15,13,2606,1716437619,1716437619,0,0,'0f9e0cbdff787f89ce9d806ac580696f',27,''),(183,3,'appdata_oc4g4egl95q3/richdocuments/fonts/Montserrat-wght.ttf','8bfbb5f33a1c08c199260cb33a51fecf',123,'Montserrat-wght.ttf',41,9,419440,1716437619,1716437619,0,0,'fbfc1c98f6c2f9beaca4241d35a25d01',27,''),(185,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/Montserrat-wght.ttf.png','ca0ca191d3ea663a6bd8b60823eae604',127,'Montserrat-wght.ttf.png',15,13,1943,1716437619,1716437619,0,0,'cdb5d811d185c1e977195dc8621e453e',27,''),(187,3,'appdata_oc4g4egl95q3/richdocuments/fonts/RobotoMono-wght.ttf','f73dadf48a1ea27bd3aa7583720822d9',123,'RobotoMono-wght.ttf',41,9,184768,1716437619,1716437619,0,0,'c569877b44094541b4e034276a3031b2',27,''),(189,3,'appdata_oc4g4egl95q3/richdocuments/font-overviews/RobotoMono-wght.ttf.png','55f1183c806ec83d422b0f0a0ba6a07a',127,'RobotoMono-wght.ttf.png',15,13,2523,1716437619,1716437619,0,0,'3bf77cc6b7e0759285e13169d5e2d565',27,''),(191,3,'appdata_oc4g4egl95q3/avatar','5824aa3e2a7def023b3f58ee40dfd718',101,'avatar',3,1,0,1716437650,1716437650,0,0,'664ec292357a3',31,''),(193,3,'appdata_oc4g4egl95q3/avatar/admin','3c42632749d74185893c2149c63edd9e',191,'admin',3,1,0,1716441188,1716441188,0,0,'664ec29249828',31,''),(195,3,'appdata_oc4g4egl95q3/preview','9766bd2462c3d9fcfd7c900b96d8ee2e',101,'preview',3,1,-1,1716437650,1716437650,0,0,'664ec292a5566',31,''),(197,3,'appdata_oc4g4egl95q3/preview/e','7120092b2b51c5aaf5163ba0306fed02',195,'e',3,1,-1,1716437650,1716437650,0,0,'664ec292e2ff9',31,''),(199,3,'appdata_oc4g4egl95q3/preview/e/2','e93a4287f9ff1fa8b2128ac53b8463cf',197,'2',3,1,-1,1716437650,1716437650,0,0,'664ec292de323',31,''),(201,3,'appdata_oc4g4egl95q3/preview/8','c0e30b85e0634307ba88c8f1b73f722c',195,'8',3,1,-1,1716437650,1716437650,0,0,'664ec292e6c83',31,''),(203,3,'appdata_oc4g4egl95q3/preview/8/1','122e720ed09f0c9a424aa8ae4ecf485e',201,'1',3,1,-1,1716437650,1716437650,0,0,'664ec292e4533',31,''),(205,3,'appdata_oc4g4egl95q3/preview/e/2/e','ef956c28b0e48fa02cfedd0df176c3f8',199,'e',3,1,-1,1716437650,1716437650,0,0,'664ec292cded1',31,''),(207,3,'appdata_oc4g4egl95q3/preview/8/1/2','3f5966efb85d50c1c48218554ba222d5',203,'2',3,1,-1,1716437650,1716437650,0,0,'664ec292e227a',31,''),(209,3,'appdata_oc4g4egl95q3/preview/e/2/e/f','bdb055bb2a33eeb6589bd44a1f606ea2',205,'f',3,1,-1,1716437650,1716437650,0,0,'664ec292cab37',31,''),(211,3,'appdata_oc4g4egl95q3/preview/8/1/2/b','d69ad91d84efbc0482fa8e37e146291f',207,'b',3,1,-1,1716437650,1716437650,0,0,'664ec292ddc5b',31,''),(213,3,'appdata_oc4g4egl95q3/preview/e/2/e/f/5','b10e506173705824a57f07d92ffd49c7',209,'5',3,1,-1,1716437650,1716437650,0,0,'664ec292c8b1d',31,''),(215,3,'appdata_oc4g4egl95q3/preview/8/1/2/b/4','e3782f9f221a4f0e1558b9dc8deddc6c',211,'4',3,1,-1,1716437650,1716437650,0,0,'664ec292cdb58',31,''),(217,3,'appdata_oc4g4egl95q3/preview/e/2/e/f/5/2','44a6fe7f25972e5dacc3b2807c513b6b',213,'2',3,1,-1,1716437650,1716437650,0,0,'664ec292c68ba',31,''),(219,3,'appdata_oc4g4egl95q3/preview/8/1/2/b/4/b','40aa8733e10fd92f657eba2b5146e49d',215,'b',3,1,-1,1716437650,1716437650,0,0,'664ec292ca51a',31,''),(221,3,'appdata_oc4g4egl95q3/preview/e/2/e/f/5/2/4','5421a2128058c7bb8e91cb04b468b9da',217,'4',3,1,-1,1716437650,1716437650,0,0,'664ec292b7f1b',31,''),(223,3,'appdata_oc4g4egl95q3/preview/8/1/2/b/4/b/a','532b326c9211517b2c41dee81a120aaa',219,'a',3,1,-1,1716437650,1716437650,0,0,'664ec292c37aa',31,''),(225,3,'appdata_oc4g4egl95q3/preview/e/2/e/f/5/2/4/97','329b1730f7b6fd4b758755fc457c9f09',221,'97',3,1,0,1716437654,1716437654,0,0,'664ec292b6a28',31,''),(227,3,'appdata_oc4g4egl95q3/preview/8/1/2/b/4/b/a/95','434c571ee67df708d27279aa2dc5beb9',223,'95',3,1,0,1716437652,1716437652,0,0,'664ec292ba215',31,''),(229,3,'appdata_oc4g4egl95q3/preview/7','084799064ba5ee02747b3a01197a164c',195,'7',3,1,-1,1716437651,1716437651,0,0,'664ec3a075960',31,''),(231,3,'appdata_oc4g4egl95q3/preview/7/6','ceebbef70b97aa65bc983ed65ea0aecc',229,'6',3,1,-1,1716437651,1716437651,0,0,'664ec3a06c481',31,''),(233,3,'appdata_oc4g4egl95q3/preview/7/6/4','75a27dbebeb9efd8513d272a3973d753',231,'4',3,1,-1,1716437651,1716437651,0,0,'664ec2935d4ba',31,''),(235,3,'appdata_oc4g4egl95q3/preview/7/6/4/7','6ea115541df26dd98998ec2d3a0d8b14',233,'7',3,1,-1,1716437651,1716437651,0,0,'664ec2935b8a1',31,''),(237,3,'appdata_oc4g4egl95q3/preview/7/6/4/7/9','2dceb1f1f627671f7a2775d11a4dcf68',235,'9',3,1,-1,1716437651,1716437651,0,0,'664ec29359475',31,''),(239,3,'appdata_oc4g4egl95q3/preview/7/6/4/7/9/6','e0a1f69c2111a55d74ce8064ce5f6422',237,'6',3,1,-1,1716437651,1716437651,0,0,'664ec2934fc8d',31,''),(241,3,'appdata_oc4g4egl95q3/preview/8/1/2/b/4/b/a/95/1200-1800-max.jpg','9f96761c5f04a68ce59464065c7a8309',227,'1200-1800-max.jpg',33,13,207095,1716437651,1716437651,0,0,'4b6d66ea902291d16cd868bd8f48d7f9',27,''),(243,3,'appdata_oc4g4egl95q3/preview/7/6/4/7/9/6/6','5e48ed4650bc040b70d7974103be31f3',239,'6',3,1,-1,1716437651,1716437651,0,0,'664ec2934de8b',31,''),(245,3,'appdata_oc4g4egl95q3/preview/7/6/4/7/9/6/6/89','f64e09a5a8b948a7d638abb7359c4f6b',243,'89',3,1,0,1716437653,1716437653,0,0,'664ec2934be27',31,''),(247,3,'appdata_oc4g4egl95q3/preview/8/1/2/b/4/b/a/95/256-256-crop.jpg','75b12d7d84284813097d61e66a15d101',227,'256-256-crop.jpg',33,13,8560,1716437652,1716437652,0,0,'1f984c767c7da62c608ac851d63e337d',27,''),(249,3,'appdata_oc4g4egl95q3/preview/7/6/4/7/9/6/6/89/1600-1067-max.jpg','32cfb1fd44574c4824df34154b1029ac',245,'1600-1067-max.jpg',33,13,232378,1716437652,1716437652,0,0,'a9cb693ca17cc8925bc5d4a8d0e4bd92',27,''),(251,3,'appdata_oc4g4egl95q3/preview/5','a923ad76b5d11ba254d17b969a6d1fd2',195,'5',3,1,-1,1716437922,1716437922,0,0,'664ec3a0d7c61',31,''),(253,3,'appdata_oc4g4egl95q3/preview/5/4','56f5ac0f7ca8eb3b1ab9d150031fcd8b',251,'4',3,1,-1,1716437652,1716437652,0,0,'664ec3a0caff3',31,''),(255,3,'appdata_oc4g4egl95q3/preview/5/4/2','39f5d0e1ad9f2419f0f8d4b662e251c9',253,'2',3,1,-1,1716437652,1716437652,0,0,'664ec294ca1f9',31,''),(257,3,'appdata_oc4g4egl95q3/preview/5/4/2/2','cfb457fc17337de77c7ebb8e6b395296',255,'2',3,1,-1,1716437652,1716437652,0,0,'664ec294c47a9',31,''),(259,3,'appdata_oc4g4egl95q3/preview/5/4/2/2/9','fa6251ff9c17b7f281b90218374fccb4',257,'9',3,1,-1,1716437652,1716437652,0,0,'664ec294bea32',31,''),(261,3,'appdata_oc4g4egl95q3/preview/5/4/2/2/9/a','2b08981022f2f254d0abd754c199286e',259,'a',3,1,-1,1716437652,1716437652,0,0,'664ec294baf9e',31,''),(263,3,'appdata_oc4g4egl95q3/preview/5/4/2/2/9/a/b','1d826604845e805bc747b2642a964934',261,'b',3,1,-1,1716437652,1716437652,0,0,'664ec294b3874',31,''),(265,3,'appdata_oc4g4egl95q3/preview/5/4/2/2/9/a/b/91','3db2f1cf939f4f6ac1dec10dc1566295',263,'91',3,1,0,1716437655,1716437655,0,0,'664ec2949ce21',31,''),(267,3,'appdata_oc4g4egl95q3/preview/e/2/e/f/5/2/4/97/1600-1066-max.jpg','b3af85462151d6e77dbd90a01f118d86',225,'1600-1066-max.jpg',33,13,351167,1716437653,1716437653,0,0,'60350383ae06b57820dcfe559c8e9ff6',27,''),(269,3,'appdata_oc4g4egl95q3/avatar/admin/avatar.png','89c3bf93145e07d5a2dc26477d51e620',193,'avatar.png',15,13,15643,1716437653,1716437653,0,0,'c9cda149db066b23a378367186fca566',27,''),(271,3,'appdata_oc4g4egl95q3/preview/7/6/4/7/9/6/6/89/256-256-crop.jpg','c7dde3dbeaebe1d354233f6f57722905',245,'256-256-crop.jpg',33,13,13856,1716437653,1716437653,0,0,'4b4af7d6e44b77093435c29164ab9df8',27,''),(273,3,'appdata_oc4g4egl95q3/preview/9','f828865fa04b32b12facd0cd2b8ced32',195,'9',3,1,-1,1716437653,1716437653,0,0,'664ec3a14bcf1',31,''),(275,3,'appdata_oc4g4egl95q3/preview/9/8','a1c350956c1178b003a94b357f23e132',273,'8',3,1,-1,1716437653,1716437653,0,0,'664ec3a146a12',31,''),(277,3,'appdata_oc4g4egl95q3/preview/9/8/d','c24fa7c322dff4fa04fe3b6e31eb38c0',275,'d',3,1,-1,1716437653,1716437653,0,0,'664ec29624357',31,''),(279,3,'appdata_oc4g4egl95q3/avatar/admin/generated','b8de79dfb35023f13f169464d1305bac',193,'generated',27,9,0,1716437654,1716437654,0,0,'fa92f56804c3545247580b129fac6d06',27,''),(281,3,'appdata_oc4g4egl95q3/preview/9/8/d/c','9a4b3c5704e40fc26df787ddb5e3fa1f',277,'c',3,1,-1,1716437653,1716437653,0,0,'664ec2961f04e',31,''),(283,3,'appdata_oc4g4egl95q3/preview/9/8/d/c/e','eb9f9bb73045431635bba231e2750c1d',281,'e',3,1,-1,1716437653,1716437653,0,0,'664ec29611fb5',31,''),(285,3,'appdata_oc4g4egl95q3/preview/9/8/d/c/e/8','fbb55766317594cbd40894c4272115a3',283,'8',3,1,-1,1716437653,1716437653,0,0,'664ec2960bc1e',31,''),(287,3,'appdata_oc4g4egl95q3/preview/9/8/d/c/e/8/3','8b3aa21704e79401ec29f1917fd30bec',285,'3',3,1,-1,1716437653,1716437653,0,0,'664ec29600cfa',31,''),(289,3,'appdata_oc4g4egl95q3/avatar/admin/avatar.64.png','138bc084c848982df68d0f37e9276376',193,'avatar.64.png',15,13,792,1716437654,1716437654,0,0,'5f0e453bb36964c761010d5d71be9649',27,''),(291,3,'appdata_oc4g4egl95q3/preview/9/8/d/c/e/8/3/93','74edd8b3290abb014cb0f564df994a87',287,'93',3,1,0,1716437655,1716437655,0,0,'664ec295eaa0c',31,''),(293,3,'appdata_oc4g4egl95q3/preview/5/4/2/2/9/a/b/91/1600-1067-max.jpg','3dd33bde5101a66aa70bafc589f54689',265,'1600-1067-max.jpg',33,13,165982,1716437654,1716437654,0,0,'22dbe7b9476afc85d7d870f0267f8a5c',27,''),(295,3,'appdata_oc4g4egl95q3/preview/e/2/e/f/5/2/4/97/256-256-crop.jpg','90a812f7fdb04b3c9523a045acf15d4c',225,'256-256-crop.jpg',33,13,18049,1716437654,1716437654,0,0,'565958f2ac5e2b522aa3ce0a190d3ce6',27,''),(297,3,'appdata_oc4g4egl95q3/preview/5/4/2/2/9/a/b/91/256-256-crop.jpg','c9d2d170807f5ecdcbe0d9f38a848b42',265,'256-256-crop.jpg',33,13,13155,1716437655,1716437655,0,0,'7603e2e019699003bcdbd7b6c01dcf7e',27,''),(299,3,'appdata_oc4g4egl95q3/preview/9/8/d/c/e/8/3/93/1920-1281-max.jpg','1920dc347ccc4f150a51bf2df24e24c9',291,'1920-1281-max.jpg',33,13,294390,1716437655,1716437655,0,0,'0f1bec6a8115255b268f1595f9653238',27,''),(301,3,'appdata_oc4g4egl95q3/preview/9/8/d/c/e/8/3/93/256-256-crop.jpg','01af4b50a8cda1de0e23351161ce124d',291,'256-256-crop.jpg',33,13,15764,1716437655,1716437655,0,0,'98172bd40b80e4f6700089fe723f71fe',27,''),(303,3,'appdata_oc4g4egl95q3/preview/4','a005812dc70601fc6b64dbe09433ae5c',195,'4',3,1,-1,1716437680,1716437680,0,0,'664ec2b0b86f9',31,''),(305,3,'appdata_oc4g4egl95q3/preview/4/3','29404819793bdc87e94be202f50a8918',303,'3',3,1,-1,1716437680,1716437680,0,0,'664ec2b0b55c5',31,''),(307,3,'appdata_oc4g4egl95q3/preview/4/3/e','b7cd8afad0a889cb50a5e6e141083093',305,'e',3,1,-1,1716437680,1716437680,0,0,'664ec2b0b1191',31,''),(309,3,'appdata_oc4g4egl95q3/preview/4/3/e/c','a6f0ad1f5b29550fe0fe48ddbfbb4f72',307,'c',3,1,-1,1716437680,1716437680,0,0,'664ec2b0ab661',31,''),(311,3,'appdata_oc4g4egl95q3/preview/4/3/e/c/5','bcda39c8049ad6938fdc6902c7b28826',309,'5',3,1,-1,1716437680,1716437680,0,0,'664ec2b0a9688',31,''),(313,3,'appdata_oc4g4egl95q3/preview/4/3/e/c/5/1','4570c42e3ec0722a95460aeadb53986c',311,'1',3,1,-1,1716437680,1716437680,0,0,'664ec2b0a5b0b',31,''),(315,3,'appdata_oc4g4egl95q3/preview/4/3/e/c/5/1/7','9ff9ddb755cc0cee37c3b11b5785869b',313,'7',3,1,-1,1716437680,1716437680,0,0,'664ec2b0a30a2',31,''),(317,3,'appdata_oc4g4egl95q3/preview/4/3/e/c/5/1/7/81','1787d6d73be4de9f71d9739886f5145d',315,'81',3,1,0,1716437681,1716437681,0,0,'664ec2b09bedf',31,''),(319,3,'appdata_oc4g4egl95q3/preview/f','1ac10e0ae1566dd06cb508050182e739',195,'f',3,1,-1,1716437680,1716437680,0,0,'664ec2b0e2e84',31,''),(321,3,'appdata_oc4g4egl95q3/preview/f/e','565b55ee24432b659467c1f6cc62625f',319,'e',3,1,-1,1716437680,1716437680,0,0,'664ec2b0d703f',31,''),(323,3,'appdata_oc4g4egl95q3/preview/f/e/9','546a072736eba74765b83141592d23d6',321,'9',3,1,-1,1716437680,1716437680,0,0,'664ec2b0d40f7',31,''),(325,3,'appdata_oc4g4egl95q3/preview/f/e/9/f','1d32f02e00cda566d260f126998f9e37',323,'f',3,1,-1,1716437680,1716437680,0,0,'664ec2b0cf11e',31,''),(327,3,'appdata_oc4g4egl95q3/preview/f/e/9/f/c','313bdeb1175b8e510a8a249d24cd86f7',325,'c',3,1,-1,1716437680,1716437680,0,0,'664ec2b0cb7bc',31,''),(329,3,'appdata_oc4g4egl95q3/preview/f/e/9/f/c/2','47fcc38ce7db3ed27625f7d4d6bd78e4',327,'2',3,1,-1,1716437680,1716437680,0,0,'664ec2b0c73f0',31,''),(331,3,'appdata_oc4g4egl95q3/preview/f/e/9/f/c/2/8','5dc4b9afc8a3df4fbd16178615fac1f1',329,'8',3,1,-1,1716437680,1716437680,0,0,'664ec2b0c4529',31,''),(333,3,'appdata_oc4g4egl95q3/preview/f/e/9/f/c/2/8/83','2ef1c0600c67fda0df1b16af4d457a8a',331,'83',3,1,0,1716437682,1716437682,0,0,'664ec2b0c22e2',31,''),(335,3,'appdata_oc4g4egl95q3/preview/4/3/e/c/5/1/7/81/1600-1067-max.jpg','ba4d6126aca232615722972ccd1f6bde',317,'1600-1067-max.jpg',33,13,147631,1716437681,1716437681,0,0,'e0ce78514cb1e439c753518ba4a50931',27,''),(337,3,'appdata_oc4g4egl95q3/preview/f/e/9/f/c/2/8/83/4096-4096-max.png','3798a39bc18443caa57733ef9fa6d980',333,'4096-4096-max.png',15,13,37129,1716437681,1716437681,0,0,'1787c2bed201cd74797b0e0d87dde98f',27,''),(339,3,'appdata_oc4g4egl95q3/preview/4/3/e/c/5/1/7/81/256-256-crop.jpg','7ba17ba806236d6fc7c3351edbf3bfe1',317,'256-256-crop.jpg',33,13,8559,1716437681,1716437681,0,0,'81a3d316365aed56abd8e37756ac8dbf',27,''),(341,3,'appdata_oc4g4egl95q3/preview/f/e/9/f/c/2/8/83/256-256-crop.png','9b8117a6c8ae23da0958a8f6c8d37778',333,'256-256-crop.png',15,13,6750,1716437682,1716437682,0,0,'25c9b754265c12bf8c722b2c720662c0',27,''),(343,1,'cache','0fea6a13c52b4d4725368f24b045ca84',1,'cache',3,1,0,1716437747,1716437747,0,0,'664ec2f31be7a',31,''),(345,3,'appdata_oc4g4egl95q3/avatar/admin/avatar.512.png','8694171438519affe3d0cd647eae2481',193,'avatar.512.png',15,13,6447,1716437792,1716437792,0,0,'7a2e810e5ebef6fb876e83752d797c9d',27,''),(347,3,'appdata_oc4g4egl95q3/avatar/admin/avatar-dark.64.png','b3e01184ca212af263f750988f1a074b',193,'avatar-dark.64.png',15,13,827,1716437867,1716437867,0,0,'f088e88fd82db69e09df80386eda3b97',27,''),(349,1,'files/Talk','a12e821edb92901676dee9cfe1487de3',3,'Talk',3,1,0,1716437915,1716437915,0,0,'664ec39b0b08f',31,''),(351,3,'appdata_oc4g4egl95q3/preview/2','fb0608923a03927f7be169dafb04643a',195,'2',3,1,-1,1716437920,1716437920,0,0,'664ec3a09a1fd',31,''),(353,3,'appdata_oc4g4egl95q3/preview/2/8','8c8a113aee144241f941cc1401c8813f',351,'8',3,1,-1,1716437920,1716437920,0,0,'664ec3a09625c',31,''),(355,3,'appdata_oc4g4egl95q3/preview/2/8/d','e0560bcc68b5faf4db92b5b96fdf7a6e',353,'d',3,1,-1,1716437920,1716437920,0,0,'664ec3a09051b',31,''),(357,3,'appdata_oc4g4egl95q3/preview/2/8/d/d','f92692b7a40f16cafeca9b223f8083a8',355,'d',3,1,-1,1716437920,1716437920,0,0,'664ec3a08bc67',31,''),(359,3,'appdata_oc4g4egl95q3/preview/6','58c72dc98e4dd1675d3e0b86d64d9e38',195,'6',3,1,-1,1716437920,1716437920,0,0,'664ec3a0cdbc3',31,''),(361,3,'appdata_oc4g4egl95q3/preview/2/8/d/d/2','b95106c7945a103512c7d8463b958a64',357,'2',3,1,-1,1716437920,1716437920,0,0,'664ec3a080805',31,''),(363,3,'appdata_oc4g4egl95q3/preview/6/5','5ac96bd08a8aefa549bd8efd66814a53',359,'5',3,1,-1,1716437920,1716437920,0,0,'664ec3a0c0800',31,''),(365,3,'appdata_oc4g4egl95q3/preview/2/8/d/d/2/c','dc194d54cf4e77dbf041498165647956',361,'c',3,1,-1,1716437920,1716437920,0,0,'664ec3a077584',31,''),(367,3,'appdata_oc4g4egl95q3/preview/6/5/1','320827785c7287cf9e67513ef5c63111',363,'1',3,1,-1,1716437920,1716437920,0,0,'664ec3a0af6e6',31,''),(369,3,'appdata_oc4g4egl95q3/preview/2/8/d/d/2/c/7','c10b99fb36e5538082d5bb416281d6ef',365,'7',3,1,-1,1716437920,1716437920,0,0,'664ec3a071ede',31,''),(371,3,'appdata_oc4g4egl95q3/preview/2/8/d/d/2/c/7/77','2999b5d69eb255708e049afa4deabebc',369,'77',3,1,0,1716437920,1716437920,0,0,'664ec3a06ef54',31,''),(373,3,'appdata_oc4g4egl95q3/preview/6/5/1/2','17bc0f49a15f96516021b60c3b3c8f76',367,'2',3,1,-1,1716437920,1716437920,0,0,'664ec3a0964e3',31,''),(375,3,'appdata_oc4g4egl95q3/preview/6/5/1/2/b','be9e9ea4816efddbd984f3c9f490db65',373,'b',3,1,-1,1716437920,1716437920,0,0,'664ec3a089de6',31,''),(377,3,'appdata_oc4g4egl95q3/preview/6/5/1/2/b/d','cbc4604a9d972eae414a7466ede078a9',375,'d',3,1,-1,1716437920,1716437920,0,0,'664ec3a079c88',31,''),(379,3,'appdata_oc4g4egl95q3/preview/6/5/1/2/b/d/4','d0b512e7543e8b38ebd98530b1382a6a',377,'4',3,1,-1,1716437920,1716437920,0,0,'664ec3a0747fd',31,''),(381,3,'appdata_oc4g4egl95q3/preview/6/5/1/2/b/d/4/11','da2e11909e6b39672727f6518e8ab6ea',379,'11',3,1,0,1716437921,1716437921,0,0,'664ec3a06f28d',31,''),(383,3,'appdata_oc4g4egl95q3/preview/3','6289373a9d90985e628a45b2805454d4',195,'3',3,1,-1,1716437921,1716437921,0,0,'664ec3a146569',31,''),(385,3,'appdata_oc4g4egl95q3/preview/3/7','53d1b6b610975e47e62570fb2b8166f7',383,'7',3,1,-1,1716437921,1716437921,0,0,'664ec3a14277c',31,''),(387,3,'appdata_oc4g4egl95q3/preview/3/7/6','a9844682d20c87062b37a62c8bf971f5',385,'6',3,1,-1,1716437921,1716437921,0,0,'664ec3a13f274',31,''),(389,3,'appdata_oc4g4egl95q3/preview/3/7/6/9','f43182f62b3dd50b208187a73728470c',387,'9',3,1,-1,1716437921,1716437921,0,0,'664ec3a13a661',31,''),(391,3,'appdata_oc4g4egl95q3/preview/3/7/6/9/3','786e31bfb2ac653838840676a43c063c',389,'3',3,1,-1,1716437921,1716437921,0,0,'664ec3a12fe0b',31,''),(393,3,'appdata_oc4g4egl95q3/preview/3/7/6/9/3/c','f7fa942303979ab261543cc03237cf03',391,'c',3,1,-1,1716437921,1716437921,0,0,'664ec3a12db8e',31,''),(395,3,'appdata_oc4g4egl95q3/preview/3/7/6/9/3/c/f','1f21b35f189f659f31d8b93fc4583d32',393,'f',3,1,-1,1716437921,1716437921,0,0,'664ec3a12a133',31,''),(397,3,'appdata_oc4g4egl95q3/preview/3/7/6/9/3/c/f/23','be48e2076ce04acbaa638f8eedbc22a3',395,'23',3,1,0,1716437923,1716437923,0,0,'664ec3a126969',31,''),(399,3,'appdata_oc4g4egl95q3/preview/6/5/1/2/b/d/4/11/500-500-max.png','62a90d2a4e5bee7d4745402cd0823081',381,'500-500-max.png',15,13,50545,1716437921,1716437921,0,0,'88c720321ae9d75bd8dffab7e5f62156',27,''),(401,3,'appdata_oc4g4egl95q3/preview/5/4096-4096-max.png','6206c0e595266a727e0b5967fec07ed9',251,'4096-4096-max.png',15,13,47775,1716437921,1716437921,0,0,'15a061cf7571dd97424ea9151de55435',27,''),(403,3,'appdata_oc4g4egl95q3/preview/6/5/1/2/b/d/4/11/64-64-crop.png','6848538b80a85592599d0d0cc2c671dd',381,'64-64-crop.png',15,13,4459,1716437921,1716437921,0,0,'d4ca7c1a9c515b84c8d5cd0aa92bf19f',27,''),(405,3,'appdata_oc4g4egl95q3/theming/global/0','ab50f44c03a14b9073a31e1c85555c80',115,'0',3,1,0,1716437921,1716437921,0,0,'664ec3a19cbd5',31,''),(407,3,'appdata_oc4g4egl95q3/theming/global/0/icon-core-#0082c9filetypes_folder.svg','b1882c229ce3663b11418af2b8e0e480',405,'icon-core-#0082c9filetypes_folder.svg',43,13,255,1716437921,1716437921,0,0,'5dbe07d86c253636b2d6b3386398c4bf',27,''),(409,3,'appdata_oc4g4egl95q3/theming/global/0/icon-core-#0082c9filetypes_image.svg','3fdf517d976e43d08bedc3b541c09483',405,'icon-core-#0082c9filetypes_image.svg',43,13,378,1716437921,1716437921,0,0,'1bd1032bffe0ad503b16c8dff6f5aafc',27,''),(411,3,'appdata_oc4g4egl95q3/preview/3/7/6/9/3/c/f/23/4096-4096-max.png','15db11a82ec4b6575e795867cd83c208',397,'4096-4096-max.png',15,13,198113,1716437921,1716437921,0,0,'a7c30e558c9a77d3cf7ee88f0626c6ed',27,''),(413,3,'appdata_oc4g4egl95q3/preview/5/64-64-crop.png','7dfe5cb704b4d5e1bc143e924df3a51e',251,'64-64-crop.png',15,13,1159,1716437922,1716437922,0,0,'c9f97f77673fed728ad34063516e1023',27,''),(415,3,'appdata_oc4g4egl95q3/text','d9932a4e029c9dff35f8fa3f1bb03615',101,'text',3,1,0,1716437923,1716437923,0,0,'664ec3a35623f',31,''),(417,3,'appdata_oc4g4egl95q3/preview/3/7/6/9/3/c/f/23/64-64-crop.png','88e182c9925d8e901beab89eca233e88',397,'64-64-crop.png',15,13,3254,1716437923,1716437923,0,0,'112df242f6f8684fe3178c93192571fc',27,''),(419,3,'appdata_oc4g4egl95q3/text/documents','9af7afcec463be2d95ba1a4b3be10005',415,'documents',3,1,0,1716440817,1716440817,0,0,'664ec3a35f9da',31,''),(421,3,'appdata_oc4g4egl95q3/text/documents/5.yjs','b4511c7683770c83d9c15ff0b0001e65',419,'5.yjs',27,9,520,1716440719,1716440719,0,0,'53072f62a4cf03c7dd6bbfe2fd301d59',27,''),(423,3,'appdata_oc4g4egl95q3/preview/7/0','11fb166ad68f99d01de21108145981bd',229,'0',3,1,0,1716440719,1716440719,0,0,'664ece8f77d82',31,''),(425,3,'appdata_oc4g4egl95q3/preview/7/0/e','db52c28442657a4359d720cd9f4ca5f0',423,'e',3,1,0,1716440719,1716440719,0,0,'664ece8f7412f',31,''),(427,3,'appdata_oc4g4egl95q3/preview/9/b','57af6bb179ce65393486eab1119d6b3f',273,'b',3,1,-1,1716440719,1716440719,0,0,'664ece8f7a7db',31,''),(429,3,'appdata_oc4g4egl95q3/preview/7/0/e/f','3f25bcbb585952004564ce4d7a2fa997',425,'f',3,1,0,1716440719,1716440719,0,0,'664ece8f70039',31,''),(431,3,'appdata_oc4g4egl95q3/preview/9/b/f','8bcd7fb30eb40053f4864a4d0a014423',427,'f',3,1,-1,1716440719,1716440719,0,0,'664ece8f765b7',31,''),(433,3,'appdata_oc4g4egl95q3/preview/7/0/e/f/d','2bb05970d81e85de172a8c05058f17cc',429,'d',3,1,0,1716440719,1716440719,0,0,'664ece8f69ee5',31,''),(435,3,'appdata_oc4g4egl95q3/preview/9/b/f/3','0465bcd07607cb9870db4972046fd41d',431,'3',3,1,-1,1716440719,1716440719,0,0,'664ece8f7216a',31,''),(437,3,'appdata_oc4g4egl95q3/preview/7/0/e/f/d/f','877c164d5ae4fca00a752f347f6b0416',433,'f',3,1,0,1716440719,1716440719,0,0,'664ece8f680e6',31,''),(439,3,'appdata_oc4g4egl95q3/preview/7/0/e/f/d/f/2','a380aaf324f8390f28e9dc588bf41cbf',437,'2',3,1,0,1716440750,1716440750,0,0,'664ece8f627f5',31,''),(441,3,'appdata_oc4g4egl95q3/preview/9/b/f/3/1','85945b85d8d825c9ecafd036aa1ce3bc',435,'1',3,1,-1,1716440719,1716440719,0,0,'664ece8f6ba62',31,''),(445,3,'appdata_oc4g4egl95q3/preview/9/b/f/3/1/c','7b1d534b0c5459b1126c6fb1a4221a31',441,'c',3,1,-1,1716440719,1716440719,0,0,'664ece8f6822a',31,''),(447,3,'appdata_oc4g4egl95q3/preview/9/b/f/3/1/c/7','3c506517acbf884030f318f2cae0eaec',445,'7',3,1,-1,1716440719,1716440719,0,0,'664ece8f622d3',31,''),(449,3,'appdata_oc4g4egl95q3/preview/9/b/f/3/1/c/7/15','3b85fcfe399dd23b57e3dd5cae43d446',447,'15',3,1,0,1716440719,1716440719,0,0,'664ece8f5f4a4',31,''),(451,3,'appdata_oc4g4egl95q3/preview/3/c','033e07eb37abc98350a9a8a8b2c50a57',383,'c',3,1,-1,1716440719,1716440719,0,0,'664ece8fae381',31,''),(453,3,'appdata_oc4g4egl95q3/preview/3/c/5','3718ea7d3f82b5e0cb08914e7a801e89',451,'5',3,1,-1,1716440719,1716440719,0,0,'664ece8fa4b3d',31,''),(455,3,'appdata_oc4g4egl95q3/preview/3/c/5/9','cceb06fa4d747dd16ff1fa8178656560',453,'9',3,1,-1,1716440719,1716440719,0,0,'664ece8f9bf1a',31,''),(457,3,'appdata_oc4g4egl95q3/preview/3/c/5/9/d','028705672f0f3ba5745d06be7f8cd054',455,'d',3,1,-1,1716440719,1716440719,0,0,'664ece8f96132',31,''),(459,3,'appdata_oc4g4egl95q3/preview/1','ad356dc9ae64002fded3c61efeccf575',195,'1',3,1,-1,1716440719,1716440719,0,0,'664ece8fc1628',31,''),(461,3,'appdata_oc4g4egl95q3/preview/1/f','593057125497be002dbf3c1fb4214b40',459,'f',3,1,-1,1716440719,1716440719,0,0,'664ece8fbbe8c',31,''),(463,3,'appdata_oc4g4egl95q3/preview/3/c/5/9/d/c','f4bfd4d1037deacd986696767a3ac23c',457,'c',3,1,-1,1716440719,1716440719,0,0,'664ece8f926fd',31,''),(465,3,'appdata_oc4g4egl95q3/preview/1/f/0','da4f77028be951a87b9a29f641a69bdc',461,'0',3,1,-1,1716440719,1716440719,0,0,'664ece8fb1167',31,''),(467,3,'appdata_oc4g4egl95q3/preview/3/c/5/9/d/c/0','a5c4fa44cb8378485049c4b736bf5f72',463,'0',3,1,-1,1716440719,1716440719,0,0,'664ece8f8f94f',31,''),(469,3,'appdata_oc4g4egl95q3/preview/1/f/0/e','bd5f68c453131783efeba43074e4afde',465,'e',3,1,-1,1716440719,1716440719,0,0,'664ece8fa741f',31,''),(471,3,'appdata_oc4g4egl95q3/preview/3/c/5/9/d/c/0/21','4d533c5e8b7ffdc747f790b225abc845',467,'21',3,1,0,1716440719,1716440719,0,0,'664ece8f8ca3c',31,''),(473,3,'appdata_oc4g4egl95q3/preview/1/f/0/e/3','584158145bc99235302368bc8fecd1c6',469,'3',3,1,-1,1716440719,1716440719,0,0,'664ece8f9bb7e',31,''),(475,3,'appdata_oc4g4egl95q3/preview/1/f/0/e/3/d','d23eff55b6f9b8ba268345cdee09ebb6',473,'d',3,1,-1,1716440719,1716440719,0,0,'664ece8f9625e',31,''),(477,3,'appdata_oc4g4egl95q3/preview/1/f/0/e/3/d/a','5fdaa7695d715ef445026d164071ab88',475,'a',3,1,-1,1716440719,1716440719,0,0,'664ece8f8fbb6',31,''),(479,3,'appdata_oc4g4egl95q3/preview/1/f/0/e/3/d/a/19','b9820bafc829b659e9760ffbff8cf403',477,'19',3,1,0,1716440721,1716440721,0,0,'664ece8f8b18a',31,''),(483,3,'appdata_oc4g4egl95q3/preview/1/f/0/e/3/d/a/19/4096-4096-max.png','96a4e5b98e9a6e2a3d6accfb25a2c781',479,'4096-4096-max.png',15,13,199884,1716440720,1716440720,0,0,'73167d08c86af116fc8abad25449ffd5',27,''),(487,3,'appdata_oc4g4egl95q3/preview/1/f/0/e/3/d/a/19/64-64-crop.png','aa4b8c55734de63d4239ae2d94ed8ca0',479,'64-64-crop.png',15,13,3563,1716440721,1716440721,0,0,'79fff8932f91c2a4b3bbdeee1f5e62fc',27,''),(489,1,'files_versions','9692aae50022f45f1098646939b287b1',1,'files_versions',3,1,565,1716440817,1716440817,0,0,'664ecef18756e',31,''),(491,1,'files_versions/Documents','31726c44088c2bcb7763e1f483a37c67',489,'Documents',3,1,136,1716440750,1716440750,0,0,'664eceae40550',31,''),(493,1,'files_versions/Documents/Readme.md.v1716437240','befa323169756eca4f364f0204032d85',491,'Readme.md.v1716437240',7,5,136,1716440750,1716440750,0,0,'dbf247a178165bd79725cee33e536589',27,''),(495,3,'appdata_oc4g4egl95q3/text/documents/17.yjs','fc7029044552dac4a1133d7e3bb1903a',419,'17.yjs',27,9,408,1716440750,1716440750,0,0,'fd9a5b68b03378435d9f54322960ef30',27,''),(497,1,'files/Заметки','caa60ff5e55e2020048b942e09b51bd5',3,'Заметки',3,1,690,1716441701,1716441701,0,0,'664ed2657f783',31,''),(499,1,'files/Заметки/Пример заметки.md','1c0642e74759321787335065af44ce21',497,'Пример заметки.md',7,5,690,1716440817,1716440817,0,0,'a350b3aac6e1eb7ecfa676977659a4a3',27,''),(501,1,'files_versions/Заметки','0b6c4ce5296621e3aee3a954f6496716',489,'Заметки',3,1,429,1716440817,1716440817,0,0,'664ecef18756e',31,''),(503,1,'files_versions/Заметки/Пример заметки.md.v1716440794','d946ea3ee89d0b4dae603a7d2dd218f8',501,'Пример заметки.md.v1716440794',7,5,429,1716440817,1716440817,0,0,'a2523338a2cf40e9ee3122f3bdac13bf',27,''),(505,3,'appdata_oc4g4egl95q3/text/documents/499.yjs','6f9c5d8e9a60ff69e328e966a5987ccd',419,'499.yjs',27,9,2624,1716440817,1716440817,0,0,'5ff467627a7e2a28527040a283dd4a01',27,''),(507,3,'appdata_oc4g4egl95q3/avatar/admin/avatar-dark.512.png','1168a53b9209c0f7b5584a9731c7472d',193,'avatar-dark.512.png',15,13,6633,1716441188,1716441188,0,0,'4dbbbcc096447e65e44b07d08295313c',27,''),(509,1,'files_trashbin/files/New note.md.d1716441701','0ef3c75e473f7312d7b80c6777650bc8',517,'New note.md.d1716441701',7,5,0,1716441359,1716441359,0,0,'9aacdbe59e3568168bc159a751c44345',27,''),(511,1,'files_trashbin/files/New note (2).md.d1716441697','7566fc492a6e3eb90444fad19a82c45e',517,'New note (2).md.d1716441697',7,5,0,1716441362,1716441362,0,0,'e9c8b3a3b75c7c694283aefb51b9f10b',27,''),(513,1,'files_trashbin/files/New note (3).md.d1716441693','386bf6b92f2b9f5d62e4bf6a6a9a6b73',517,'New note (3).md.d1716441693',7,5,0,1716441364,1716441364,0,0,'f4b9c023208b0fac9c99c65bcce9a3ac',27,''),(515,1,'files_trashbin','fb66dca5f27af6f15c1d1d81e6f8d28b',1,'files_trashbin',3,1,0,1716441701,1716441693,0,0,'664ed2656b34a',31,''),(517,1,'files_trashbin/files','3014a771cbe30761f2e9ff3272110dbf',515,'files',3,1,0,1716441701,1716441697,0,0,'664ed2656b34a',31,''),(519,1,'files_trashbin/versions','c639d144d3f1014051e14a98beac5705',515,'versions',3,1,0,1716441693,1716441693,0,0,'664ed25d16ea0',31,''),(521,1,'files_trashbin/keys','9195c7cfc1b867f229ac78cc1b6a0be3',515,'keys',3,1,0,1716441693,1716441693,0,0,'664ed25d1e6af',31,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_metadata`
--

LOCK TABLES `oc_files_metadata` WRITE;
/*!40000 ALTER TABLE `oc_files_metadata` DISABLE KEYS */;
INSERT INTO `oc_files_metadata` VALUES (1,11,'{\"photos-original_date_time\":{\"value\":1716437240,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":500,\"height\":500},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','8Y9lDcP','2024-05-23 04:07:22'),(3,77,'{\"photos-original_date_time\":{\"value\":1716437247,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0}}','2PVD6ud','2024-05-23 04:07:30'),(5,81,'{\"photos-original_date_time\":{\"value\":1341072915,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/500\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":1,\"ISOSpeedRatings\":8000,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 16:15:15\",\"DateTimeDigitized\":\"2012:06:30 16:15:15\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"9\\/1\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"6149\\/1087\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"280\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"134321\\/34\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":1,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.3.1\",\"DateTime\":\"2012:06:30 16:15:15\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','HWWWixd','2024-05-23 04:07:30'),(7,85,'{\"photos-original_date_time\":{\"value\":1716437248,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":3000,\"height\":2000},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','KssNO4E','2024-05-23 04:07:31'),(9,87,'{\"photos-original_date_time\":{\"value\":1444907264,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/320\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":640,\"UndefinedTag__x____\":640,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2015:10:15 11:07:44\",\"DateTimeDigitized\":\"2015:10:15 11:07:44\",\"ShutterSpeedValue\":\"27970\\/3361\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"1\\/3\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"200\\/1\",\"SubSecTimeOriginal\":\"63\",\"SubSecTimeDigitized\":\"63\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"1600\\/1\",\"FocalPlaneYResolution\":\"1600\\/1\",\"FocalPlaneResolutionUnit\":3,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"000084121f\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"240\\/1\",\"YResolution\":\"240\\/1\",\"ResolutionUnit\":2,\"Software\":\"Adobe Photoshop Lightroom 6.2.1 (Macintosh)\",\"DateTime\":\"2015:10:16 14:40:21\",\"Exif_IFD_Pointer\":230},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','H7bg3ft','2024-05-23 04:07:31'),(11,89,'{\"photos-original_date_time\":{\"value\":1341064060,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/640\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":1,\"ISOSpeedRatings\":12800,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 13:47:40\",\"DateTimeDigitized\":\"2012:06:30 13:47:40\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"75\\/8\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"6149\\/1087\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"235\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"134321\\/34\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":1,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.3.1\",\"DateTime\":\"2012:06:30 13:47:40\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','9ojIznq','2024-05-23 04:07:31'),(13,91,'{\"photos-original_date_time\":{\"value\":1341059531,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/125\",\"FNumber\":\"28\\/5\",\"ExposureProgram\":3,\"ISOSpeedRatings\":320,\"UndefinedTag__x____\":320,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:06:30 12:32:11\",\"DateTimeDigitized\":\"2012:06:30 12:32:11\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"7\\/1\",\"ApertureValue\":\"5\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"189284\\/33461\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"280\\/1\",\"SubSecTime\":\"83\",\"SubSecTimeOriginal\":\"83\",\"SubSecTimeDigitized\":\"83\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1067,\"FocalPlaneXResolution\":\"1920000\\/487\",\"FocalPlaneYResolution\":\"320000\\/81\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"0000000000\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"DateTime\":\"2012:06:30 12:32:11\",\"Exif_IFD_Pointer\":174},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1067},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','uHn2cir','2024-05-23 04:07:31'),(15,93,'{\"photos-original_date_time\":{\"value\":1526500980,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"10\\/12500\",\"FNumber\":\"35\\/10\",\"ExposureProgram\":3,\"ISOSpeedRatings\":100,\"DateTimeOriginal\":\"2018:05:16 20:03:00\",\"DateTimeDigitized\":\"2018:05:16 20:03:00\",\"ExposureBiasValue\":\"0\\/6\",\"MaxApertureValue\":\"30\\/10\",\"MeteringMode\":5,\"LightSource\":0,\"Flash\":16,\"FocalLength\":\"700\\/10\",\"MakerNote\":\"Nikon\",\"UserComment\":\"Christoph WurstCC-SA 4.0\",\"SubSecTime\":\"30\",\"SubSecTimeOriginal\":\"30\",\"SubSecTimeDigitized\":\"30\",\"ColorSpace\":1,\"SensingMethod\":2,\"FileSource\":\"\",\"SceneType\":\"\",\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"DigitalZoomRatio\":\"1\\/1\",\"FocalLengthIn__mmFilm\":70,\"SceneCaptureType\":0,\"GainControl\":0,\"Contrast\":1,\"Saturation\":0,\"Sharpness\":1,\"SubjectDistanceRange\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"ImageDescription\":\"Christoph WurstCC-SA 4.0\",\"Make\":\"NIKON CORPORATION\",\"Model\":\"NIKON D610\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"GIMP 2.10.14\",\"DateTime\":\"2019:12:10 08:51:16\",\"Artist\":\"Christoph Wurst                     \",\"Copyright\":\"Christoph Wurst                                       \",\"Exif_IFD_Pointer\":402,\"GPS_IFD_Pointer\":13738,\"DateTimeOriginal\":\"2018:05:16 20:03:00\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1920,\"height\":1281},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','TnpsXNh','2024-05-23 04:07:32'),(17,95,'{\"photos-original_date_time\":{\"value\":1372319469,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/160\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":100,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2013:06:27 07:51:09\",\"DateTimeDigitized\":\"2013:06:27 07:51:09\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"59\\/8\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"2\\/3\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"45\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1200,\"ExifImageLength\":1800,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"185679\\/47\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0,\"UndefinedTag__xA___\":\"000052602c\"},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"Aperture 3.4.5\",\"DateTime\":\"2013:06:27 07:51:09\",\"Exif_IFD_Pointer\":202},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1200,\"height\":1800},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','e2OocTi','2024-05-23 04:07:32'),(19,97,'{\"photos-original_date_time\":{\"value\":1341258636,\"type\":\"int\",\"etag\":\"\",\"indexed\":true,\"editPermission\":0},\"photos-exif\":{\"value\":{\"ExposureTime\":\"1\\/80\",\"FNumber\":\"4\\/1\",\"ExposureProgram\":3,\"ISOSpeedRatings\":400,\"ExifVersion\":\"0230\",\"DateTimeOriginal\":\"2012:07:02 19:50:36\",\"DateTimeDigitized\":\"2012:07:02 19:50:36\",\"ComponentsConfiguration\":\"\",\"ShutterSpeedValue\":\"51\\/8\",\"ApertureValue\":\"4\\/1\",\"ExposureBiasValue\":\"0\\/1\",\"MaxApertureValue\":\"4\\/1\",\"MeteringMode\":5,\"Flash\":16,\"FocalLength\":\"32\\/1\",\"SubSecTime\":\"00\",\"SubSecTimeOriginal\":\"00\",\"SubSecTimeDigitized\":\"00\",\"FlashPixVersion\":\"0100\",\"ColorSpace\":1,\"ExifImageWidth\":1600,\"ExifImageLength\":1066,\"FocalPlaneXResolution\":\"382423\\/97\",\"FocalPlaneYResolution\":\"185679\\/47\",\"FocalPlaneResolutionUnit\":2,\"CustomRendered\":0,\"ExposureMode\":0,\"WhiteBalance\":0,\"SceneCaptureType\":0},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-ifd0\":{\"value\":{\"Make\":\"Canon\",\"Model\":\"Canon EOS 5D Mark III\",\"Orientation\":1,\"XResolution\":\"72\\/1\",\"YResolution\":\"72\\/1\",\"ResolutionUnit\":2,\"Software\":\"GIMP 2.8.0\",\"DateTime\":\"2012:07:02 22:06:14\",\"Exif_IFD_Pointer\":198},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0},\"photos-size\":{\"value\":{\"width\":1600,\"height\":1066},\"type\":\"array\",\"etag\":\"\",\"indexed\":false,\"editPermission\":0}}','ZToSBNd','2024-05-23 04:07:32');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_metadata_index`
--

LOCK TABLES `oc_files_metadata_index` WRITE;
/*!40000 ALTER TABLE `oc_files_metadata_index` DISABLE KEYS */;
INSERT INTO `oc_files_metadata_index` VALUES (3,11,'photos-original_date_time',NULL,1716437240),(5,77,'photos-original_date_time',NULL,1716437247),(9,81,'photos-original_date_time',NULL,1341072915),(13,85,'photos-original_date_time',NULL,1716437248),(17,87,'photos-original_date_time',NULL,1444907264),(21,89,'photos-original_date_time',NULL,1341064060),(25,91,'photos-original_date_time',NULL,1341059531),(29,93,'photos-original_date_time',NULL,1526500980),(33,95,'photos-original_date_time',NULL,1372319469),(37,97,'photos-original_date_time',NULL,1341258636);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_trash`
--

LOCK TABLES `oc_files_trash` WRITE;
/*!40000 ALTER TABLE `oc_files_trash` DISABLE KEYS */;
INSERT INTO `oc_files_trash` VALUES (1,'New note (3).md','admin','1716441693','Заметки',NULL,NULL),(3,'New note (2).md','admin','1716441697','Заметки',NULL,NULL),(5,'New note.md','admin','1716441701','Заметки',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_versions`
--

LOCK TABLES `oc_files_versions` WRITE;
/*!40000 ALTER TABLE `oc_files_versions` DISABLE KEYS */;
INSERT INTO `oc_files_versions` VALUES (1,5,1716437238,206,7,'{\"author\":\"admin\"}'),(3,7,1716437239,16305464,11,'{\"author\":\"admin\"}'),(5,9,1716437239,976625,11,'{\"author\":\"admin\"}'),(7,11,1716437240,50598,15,'{\"author\":\"admin\"}'),(9,15,1716437240,1083339,11,'{\"author\":\"admin\"}'),(11,17,1716437240,136,7,'{\"author\":\"admin\"}'),(13,19,1716437240,1095,7,'{\"author\":\"admin\"}'),(15,21,1716437241,24295,17,'{\"author\":\"admin\"}'),(17,23,1716437241,2403,7,'{\"author\":\"admin\"}'),(19,27,1716437241,13653,19,'{\"author\":\"admin\"}'),(21,29,1716437242,554,7,'{\"author\":\"admin\"}'),(23,31,1716437242,88394,21,'{\"author\":\"admin\"}'),(25,33,1716437242,3509628,23,'{\"author\":\"admin\"}'),(27,35,1716437242,11836,19,'{\"author\":\"admin\"}'),(29,37,1716437243,868111,25,'{\"author\":\"admin\"}'),(31,39,1716437243,39404,25,'{\"author\":\"admin\"}'),(33,41,1716437243,17276,25,'{\"author\":\"admin\"}'),(35,43,1716437243,573,7,'{\"author\":\"admin\"}'),(37,45,1716437244,14316,23,'{\"author\":\"admin\"}'),(39,47,1716437244,5155877,25,'{\"author\":\"admin\"}'),(41,49,1716437244,340061,25,'{\"author\":\"admin\"}'),(43,51,1716437244,30354,25,'{\"author\":\"admin\"}'),(45,53,1716437245,14810,23,'{\"author\":\"admin\"}'),(47,55,1716437245,13441,21,'{\"author\":\"admin\"}'),(49,57,1716437245,52674,27,'{\"author\":\"admin\"}'),(51,59,1716437245,317015,23,'{\"author\":\"admin\"}'),(53,61,1716437245,326,7,'{\"author\":\"admin\"}'),(55,63,1716437246,13378,21,'{\"author\":\"admin\"}'),(57,65,1716437246,38605,27,'{\"author\":\"admin\"}'),(59,67,1716437246,81196,23,'{\"author\":\"admin\"}'),(61,69,1716437246,52843,21,'{\"author\":\"admin\"}'),(63,71,1716437247,16988,19,'{\"author\":\"admin\"}'),(65,73,1716437247,13878,19,'{\"author\":\"admin\"}'),(67,75,1716437247,15961,25,'{\"author\":\"admin\"}'),(69,77,1716437247,3963036,31,'{\"author\":\"admin\"}'),(71,81,1716437248,457744,33,'{\"author\":\"admin\"}'),(73,83,1716437248,150,7,'{\"author\":\"admin\"}'),(75,85,1716437248,797325,33,'{\"author\":\"admin\"}'),(77,87,1716437248,167989,33,'{\"author\":\"admin\"}'),(79,89,1716437249,474653,33,'{\"author\":\"admin\"}'),(81,91,1716437249,593508,33,'{\"author\":\"admin\"}'),(83,93,1716437249,427030,33,'{\"author\":\"admin\"}'),(85,95,1716437250,567689,33,'{\"author\":\"admin\"}'),(87,97,1716437250,2170375,33,'{\"author\":\"admin\"}'),(89,17,1716440750,135,7,'{\"author\":\"admin\"}'),(91,499,1716440794,429,7,'{\"author\":\"admin\"}'),(93,499,1716440817,690,7,'{\"author\":\"admin\"}');
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
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_jobs`
--

LOCK TABLES `oc_jobs` WRITE;
/*!40000 ALTER TABLE `oc_jobs` DISABLE KEYS */;
INSERT INTO `oc_jobs` VALUES (1,'OCA\\Support\\BackgroundJobs\\CheckSubscription','null',1716437296,1716437296,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(3,'OCA\\NextcloudAnnouncements\\Cron\\Crawler','null',1716437649,1716437649,0,2,'37a6259cc0c1dae299a7866489dff0bd',1),(5,'OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob','null',1716437678,1716437678,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(7,'OCA\\WorkflowEngine\\BackgroundJobs\\Rotate','null',1716437752,1716437752,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(9,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',1716437793,1716437793,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(11,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',1716437804,1716437804,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(13,'OCA\\Activity\\BackgroundJob\\DigestMail','null',1716437853,1716437853,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(15,'OCA\\Activity\\BackgroundJob\\RemoveFormerActivitySettings','null',1716437866,1716437866,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(17,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',1716437881,1716437881,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(19,'OCA\\Files_Sharing\\ExpireSharesJob','null',1716437902,1716437902,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(21,'OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob','null',1716437907,1716437907,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(23,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',1716437919,1716437919,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(25,'OCA\\OAuth2\\BackgroundJob\\CleanupExpiredAuthorizationCode','null',1716440757,1716440757,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(27,'OCA\\Notifications\\BackgroundJob\\GenerateUserSettings','null',1716440768,1716440768,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(29,'OCA\\Notifications\\BackgroundJob\\SendNotificationMails','null',1716441188,1716441187,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(31,'OCA\\UpdateNotification\\BackgroundJob\\UpdateAvailableNotifications','null',1716441210,1716441210,0,2,'37a6259cc0c1dae299a7866489dff0bd',1),(33,'OCA\\Files\\BackgroundJob\\ScanFiles','null',1716441218,1716441218,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(35,'OCA\\Files\\BackgroundJob\\DeleteOrphanedItems','null',1716441342,1716441342,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(37,'OCA\\Files\\BackgroundJob\\CleanupFileLocks','null',1716441345,1716441345,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(39,'OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens','null',0,1716437231,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(41,'OCA\\Files\\BackgroundJob\\DeleteExpiredOpenLocalEditor','null',0,1716437231,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(43,'OCA\\FilesReminders\\BackgroundJob\\CleanUpReminders','null',0,1716437232,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(45,'OCA\\FilesReminders\\BackgroundJob\\ScheduledNotifications','null',0,1716437232,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(47,'OCA\\Circles\\Cron\\Maintenance','null',0,1716437232,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(49,'OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob','null',0,1716437233,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(51,'OCA\\ServerInfo\\Jobs\\UpdateStorageStats','null',0,1716437233,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(53,'OCA\\Text\\Cron\\Cleanup','null',0,1716437233,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(55,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',0,1716437234,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(57,'OCA\\Federation\\SyncJob','null',0,1716437234,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(59,'OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob','null',0,1716437236,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(61,'OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob','null',0,1716437236,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(63,'OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob','null',0,1716437236,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(65,'OCA\\DAV\\BackgroundJob\\EventReminderJob','null',0,1716437236,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(67,'OCA\\DAV\\BackgroundJob\\CalendarRetentionJob','null',0,1716437236,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(69,'OCA\\DAV\\BackgroundJob\\PruneOutdatedSyncTokensJob','null',0,1716437236,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(71,'OCA\\Photos\\Jobs\\AutomaticPlaceMapperJob','null',0,1716437236,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(73,'OC\\Authentication\\Token\\TokenCleanupJob','null',0,1716437236,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(75,'OC\\Log\\Rotate','null',0,1716437236,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(77,'OC\\Preview\\BackgroundCleanupJob','null',0,1716437236,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(79,'OC\\TextProcessing\\RemoveOldTasksBackgroundJob','null',0,1716437236,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(81,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",5]',0,1716437238,0,0,'c470b185ccc2ec23301160b830a7b4e3',1),(83,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",7]',0,1716437239,0,0,'b5be68f82ae3e193fe0dcfadf3042b0e',1),(85,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",9]',0,1716437239,0,0,'3328486f2967f42b5b23b2c5b43195d9',1),(87,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",11]',0,1716437240,0,0,'8bcc892c4e3eecacfe66af5aede2ccfa',1),(89,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",15]',0,1716437240,0,0,'bc1ada73b672ad0ce638e8dafb81a920',1),(91,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",17]',0,1716440750,0,0,'60d90b87066d68be23a60f60c7935e80',1),(93,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",19]',0,1716437241,0,0,'ee854b67c714733040991f9451eb4b6a',1),(95,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",21]',0,1716437241,0,0,'a4589d2dc441282b16e08c6ca1520c4b',1),(97,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",23]',0,1716437241,0,0,'6c643f48300f26df5a9a8771f6291415',1),(99,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",27]',0,1716437241,0,0,'80cca205cd42533b0175d71e644409c9',1),(101,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",29]',0,1716437242,0,0,'4f2bbad2494bc4fdaeade92808117a3a',1),(103,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",31]',0,1716437242,0,0,'c7eab2e8320dd11cb5a3dd9ca50223c7',1),(105,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",33]',0,1716437242,0,0,'6b5ad2da35d2d5162e2febadfa838776',1),(107,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",35]',0,1716437242,0,0,'8ca5260f378d7c542b7dcc7831f590b1',1),(109,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",37]',0,1716437243,0,0,'9da89cb19670152513b5905d2b521ef5',1),(111,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",39]',0,1716437243,0,0,'9956ea85a9cd622bc51a751d16d942dd',1),(113,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",41]',0,1716437243,0,0,'b24d130e88d0e89f3dca2d89f3c16584',1),(115,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",43]',0,1716437243,0,0,'74846da95da685539f86600b3740e1fa',1),(117,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",45]',0,1716437244,0,0,'55500c6bf8308c53b831300241f8ca1d',1),(119,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",47]',0,1716437244,0,0,'1344e03698e286512e2f45df7db315fa',1),(121,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",49]',0,1716437244,0,0,'30b172cbb46b89614df699888d9eab3f',1),(123,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",51]',0,1716437244,0,0,'81698c65fd6f64971999caf72f8e62da',1),(125,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",53]',0,1716437245,0,0,'c61ca989cf4578192b8663f22135dbc9',1),(127,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",55]',0,1716437245,0,0,'466644a24af95481af995937261cebe7',1),(129,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",57]',0,1716437245,0,0,'24b7f24303f6bde103da268445ff5ca6',1),(131,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",59]',0,1716437245,0,0,'2775e8fb4eae0ceeeae958244b2b4c72',1),(133,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",61]',0,1716437246,0,0,'c55549db134092519456719d40213352',1),(135,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",63]',0,1716437246,0,0,'09df7ffe6e4d1433d66b4ca5ad23d3c9',1),(137,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",65]',0,1716437246,0,0,'2ef340360d2cb07b49f8cfc6160e2142',1),(139,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",67]',0,1716437246,0,0,'8791605823c0b2fa21bbd82c50a99963',1),(141,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",69]',0,1716437246,0,0,'215f3315036acdddf84e3606cc29ee03',1),(143,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",71]',0,1716437247,0,0,'8b41799ce944f2e3fa70eb713fde9707',1),(145,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",73]',0,1716437247,0,0,'b7d84cb87bcc4f258e2066cf29958442',1),(147,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",75]',0,1716437247,0,0,'22613ba0324f76226de2876bd174c8d8',1),(149,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",77]',0,1716437247,0,0,'9c4afb7d6f8da0924d7d165c33cc6b62',1),(151,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",81]',0,1716437248,0,0,'429c745d19af00c626bec46520c2cac1',1),(153,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",83]',0,1716437248,0,0,'788277eabc4aaa23e5578f09530111ea',1),(155,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",85]',0,1716437248,0,0,'ff93a1bcc28fe316792c05914fd44aa9',1),(157,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",87]',0,1716437249,0,0,'4eeeae66bc4a4d4502c81327c3a267fc',1),(159,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",89]',0,1716437249,0,0,'8055ef83162f2deb2cbe34855e396b79',1),(161,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",91]',0,1716437249,0,0,'ea8cf45ce05ae7486e01b0ec4019d485',1),(163,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",93]',0,1716437249,0,0,'02192e73fea359bf0384ee24f4852d54',1),(165,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",95]',0,1716437250,0,0,'0eb7d9580a17dc9ffd156151011fdc07',1),(167,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",97]',0,1716437250,0,0,'9f2ce54f388fec7a0bdc8bf43372ce2b',1),(169,'OCA\\Calendar\\BackgroundJob\\CleanUpOutdatedBookingsJob','null',0,1716437558,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(171,'OCA\\Contacts\\Cron\\SocialUpdateRegistration','null',0,1716437585,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(173,'OCA\\Mail\\BackgroundJob\\CleanupJob','null',0,1716437610,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(175,'OCA\\Mail\\BackgroundJob\\OutboxWorkerJob','null',0,1716437610,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(177,'OCA\\Mail\\BackgroundJob\\IMipMessageJob','null',0,1716437610,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(179,'OCA\\Mail\\BackgroundJob\\DraftsJob','null',0,1716437610,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(181,'OCA\\Mail\\BackgroundJob\\TrashRetentionJob','null',0,1716437610,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(183,'OCA\\Mail\\BackgroundJob\\WakeJob','null',0,1716437610,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(185,'OCA\\Richdocuments\\Backgroundjobs\\ObtainCapabilities','null',0,1716437618,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(187,'OCA\\Richdocuments\\Backgroundjobs\\Cleanup','null',0,1716437618,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(189,'OCA\\Talk\\BackgroundJob\\CheckHostedSignalingServer','null',0,1716437642,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(191,'OCA\\Talk\\BackgroundJob\\CheckMatterbridges','null',0,1716437642,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(193,'OCA\\Talk\\BackgroundJob\\CheckReferenceIdColumn','null',0,1716437642,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(195,'OCA\\Talk\\BackgroundJob\\CheckTurnCertificate','null',0,1716437642,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(197,'OCA\\Talk\\BackgroundJob\\ExpireChatMessages','null',0,1716437642,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(199,'OCA\\Talk\\BackgroundJob\\ExpireSignalingMessage','null',0,1716437642,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(201,'OCA\\Talk\\BackgroundJob\\Reminder','null',0,1716437642,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(203,'OCA\\Talk\\BackgroundJob\\RemoveEmptyRooms','null',0,1716437642,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(205,'OCA\\Talk\\BackgroundJob\\ResetAssignedSignalingServer','null',0,1716437642,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(207,'OCA\\Talk\\BackgroundJob\\RetryNotificationsJob','null',0,1716437642,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(209,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"admin\"}',0,1716437676,0,0,'b974bbc90ef800c3b1539ac4f2aeddb7',1),(211,'OC\\Command\\CommandJob','\"O:33:\\\"OCA\\\\Files_Versions\\\\Command\\\\Expire\\\":2:{s:39:\\\"\\u0000OCA\\\\Files_Versions\\\\Command\\\\Expire\\u0000user\\\";s:5:\\\"admin\\\";s:43:\\\"\\u0000OCA\\\\Files_Versions\\\\Command\\\\Expire\\u0000fileName\\\";s:20:\\\"\\/Documents\\/Readme.md\\\";}\"',0,1716440750,0,0,'4640b9f1c007bb610fceafa0b8c2dbb7',1),(213,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",499]',0,1716440817,0,0,'5e97afbf47914ea97538ba2fa41e8eec',1),(215,'OC\\Command\\CommandJob','\"O:33:\\\"OCA\\\\Files_Versions\\\\Command\\\\Expire\\\":2:{s:39:\\\"\\u0000OCA\\\\Files_Versions\\\\Command\\\\Expire\\u0000user\\\";s:5:\\\"admin\\\";s:43:\\\"\\u0000OCA\\\\Files_Versions\\\\Command\\\\Expire\\u0000fileName\\\";s:46:\\\"\\/\\u0417\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438\\/\\u041f\\u0440\\u0438\\u043c\\u0435\\u0440 \\u0437\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438.md\\\";}\"',0,1716440817,0,0,'d6e49a080a17943c23b95d1992767b69',1),(217,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",509]',0,1716441359,0,0,'3fdd0b0fc374564cbdc1f143f0a7d60e',1),(219,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",511]',0,1716441362,0,0,'060fb30a5ada618bc2939e16aabe7764',1),(221,'OC\\FilesMetadata\\Job\\UpdateSingleMetadata','[\"admin\",513]',0,1716441364,0,0,'f9a4e94c45adc31e49d4fa502652eb3e',1),(223,'OC\\Command\\CommandJob','\"O:33:\\\"OCA\\\\Files_Trashbin\\\\Command\\\\Expire\\\":1:{s:39:\\\"\\u0000OCA\\\\Files_Trashbin\\\\Command\\\\Expire\\u0000user\\\";s:5:\\\"admin\\\";}\"',0,1716441701,0,0,'ca04d14eddadbe79d239365e539f2a65',1);
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
-- Table structure for table `oc_mail_accounts`
--

DROP TABLE IF EXISTS `oc_mail_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `inbound_host` varchar(64) NOT NULL DEFAULT '',
  `inbound_port` varchar(6) NOT NULL DEFAULT '',
  `inbound_ssl_mode` varchar(10) NOT NULL DEFAULT '',
  `inbound_user` varchar(64) NOT NULL DEFAULT '',
  `inbound_password` varchar(2048) DEFAULT NULL,
  `outbound_host` varchar(64) DEFAULT NULL,
  `outbound_port` varchar(6) DEFAULT NULL,
  `outbound_ssl_mode` varchar(10) DEFAULT NULL,
  `outbound_user` varchar(64) DEFAULT NULL,
  `outbound_password` varchar(2048) DEFAULT NULL,
  `signature` text DEFAULT '',
  `last_mailbox_sync` int(11) NOT NULL DEFAULT 0,
  `editor_mode` varchar(64) NOT NULL DEFAULT 'plaintext',
  `order` int(11) NOT NULL DEFAULT 1,
  `show_subscribed_only` tinyint(1) DEFAULT 0,
  `personal_namespace` varchar(255) DEFAULT NULL,
  `drafts_mailbox_id` int(11) DEFAULT NULL,
  `sent_mailbox_id` int(11) DEFAULT NULL,
  `trash_mailbox_id` int(11) DEFAULT NULL,
  `sieve_enabled` tinyint(1) DEFAULT 0,
  `sieve_host` varchar(64) DEFAULT NULL,
  `sieve_port` varchar(6) DEFAULT NULL,
  `sieve_ssl_mode` varchar(10) DEFAULT NULL,
  `sieve_user` varchar(64) DEFAULT NULL,
  `sieve_password` varchar(2048) DEFAULT NULL,
  `provisioning_id` int(11) DEFAULT NULL,
  `signature_above_quote` tinyint(1) DEFAULT 0,
  `signature_mode` smallint(6) NOT NULL DEFAULT 0,
  `auth_method` varchar(255) NOT NULL DEFAULT 'password',
  `archive_mailbox_id` int(11) DEFAULT NULL,
  `oauth_refresh_token` varchar(3000) DEFAULT NULL,
  `oauth_token_ttl` int(11) DEFAULT NULL,
  `oauth_access_token` longtext DEFAULT NULL,
  `smime_certificate_id` int(11) DEFAULT NULL,
  `junk_mailbox_id` int(11) DEFAULT NULL,
  `quota_percentage` int(11) DEFAULT NULL,
  `trash_retention_days` int(11) DEFAULT NULL,
  `snooze_mailbox_id` int(11) DEFAULT NULL,
  `search_body` tinyint(1) DEFAULT 0,
  `ooo_follows_system` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `mail_userid_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_accounts`
--

LOCK TABLES `oc_mail_accounts` WRITE;
/*!40000 ALTER TABLE `oc_mail_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_aliases`
--

DROP TABLE IF EXISTS `oc_mail_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL,
  `signature` text DEFAULT '',
  `signature_mode` smallint(6) NOT NULL DEFAULT 0,
  `smime_certificate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_aliases`
--

LOCK TABLES `oc_mail_aliases` WRITE;
/*!40000 ALTER TABLE `oc_mail_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_attachments`
--

DROP TABLE IF EXISTS `oc_mail_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_message_id` int(11) DEFAULT NULL,
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT 0,
  `mime_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_attach_userid_index` (`user_id`),
  KEY `IDX_6C63D3AD31594979` (`local_message_id`),
  CONSTRAINT `attachment_local_message` FOREIGN KEY (`local_message_id`) REFERENCES `oc_mail_local_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_attachments`
--

LOCK TABLES `oc_mail_attachments` WRITE;
/*!40000 ALTER TABLE `oc_mail_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_classifiers`
--

DROP TABLE IF EXISTS `oc_mail_classifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_classifiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `estimator` varchar(255) NOT NULL,
  `app_version` varchar(31) NOT NULL,
  `training_set_size` int(11) NOT NULL,
  `validation_set_size` int(11) NOT NULL,
  `recall_important` decimal(10,5) NOT NULL,
  `precision_important` decimal(10,5) NOT NULL,
  `f1_score_important` decimal(10,5) NOT NULL,
  `duration` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_clssfr_accnt_id_type` (`account_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_classifiers`
--

LOCK TABLES `oc_mail_classifiers` WRITE;
/*!40000 ALTER TABLE `oc_mail_classifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_classifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_coll_addresses`
--

DROP TABLE IF EXISTS `oc_mail_coll_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_coll_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_coll_addr_userid_index` (`user_id`),
  KEY `mail_coll_addr_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_coll_addresses`
--

LOCK TABLES `oc_mail_coll_addresses` WRITE;
/*!40000 ALTER TABLE `oc_mail_coll_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_coll_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_local_messages`
--

DROP TABLE IF EXISTS `oc_mail_local_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_local_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL,
  `account_id` int(11) NOT NULL,
  `alias_id` int(11) DEFAULT NULL,
  `send_at` int(11) DEFAULT NULL,
  `subject` tinytext NOT NULL,
  `body` longtext NOT NULL,
  `html` tinyint(1) DEFAULT 0,
  `in_reply_to_message_id` text DEFAULT NULL,
  `failed` tinyint(1) DEFAULT 0,
  `editor_body` longtext DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `smime_sign` tinyint(1) DEFAULT 0,
  `smime_certificate_id` int(11) DEFAULT NULL,
  `smime_encrypt` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_local_messages`
--

LOCK TABLES `oc_mail_local_messages` WRITE;
/*!40000 ALTER TABLE `oc_mail_local_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_local_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_mailboxes`
--

DROP TABLE IF EXISTS `oc_mail_mailboxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_mailboxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `account_id` int(11) NOT NULL,
  `attributes` varchar(255) NOT NULL DEFAULT '[]',
  `delimiter` varchar(1) DEFAULT NULL,
  `messages` int(11) NOT NULL,
  `unseen` int(11) NOT NULL,
  `selectable` tinyint(1) DEFAULT 0,
  `special_use` varchar(255) NOT NULL DEFAULT '[]',
  `sync_new_lock` int(11) DEFAULT NULL,
  `sync_changed_lock` int(11) DEFAULT NULL,
  `sync_vanished_lock` int(11) DEFAULT NULL,
  `sync_new_token` varchar(255) DEFAULT NULL,
  `sync_changed_token` varchar(255) DEFAULT NULL,
  `sync_vanished_token` varchar(255) DEFAULT NULL,
  `sync_in_background` tinyint(1) DEFAULT 0,
  `my_acls` varchar(32) DEFAULT NULL,
  `shared` tinyint(1) DEFAULT 0,
  `name_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_mb_account_id_name_hash` (`account_id`,`name_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_mailboxes`
--

LOCK TABLES `oc_mail_mailboxes` WRITE;
/*!40000 ALTER TABLE `oc_mail_mailboxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_mailboxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_message_tags`
--

DROP TABLE IF EXISTS `oc_mail_message_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_message_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imap_message_id` varchar(1023) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_msg_imap_id_idx` (`imap_message_id`(128))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_message_tags`
--

LOCK TABLES `oc_mail_message_tags` WRITE;
/*!40000 ALTER TABLE `oc_mail_message_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_message_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_messages`
--

DROP TABLE IF EXISTS `oc_mail_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `message_id` varchar(1023) DEFAULT NULL,
  `mailbox_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL,
  `flag_answered` tinyint(1) DEFAULT 0,
  `flag_deleted` tinyint(1) DEFAULT 0,
  `flag_draft` tinyint(1) DEFAULT 0,
  `flag_flagged` tinyint(1) DEFAULT 0,
  `flag_seen` tinyint(1) DEFAULT 0,
  `flag_forwarded` tinyint(1) DEFAULT 0,
  `flag_junk` tinyint(1) DEFAULT 0,
  `flag_notjunk` tinyint(1) DEFAULT 0,
  `flag_attachments` tinyint(1) DEFAULT 0,
  `flag_important` tinyint(1) DEFAULT 0,
  `structure_analyzed` tinyint(1) DEFAULT 0,
  `preview_text` varchar(255) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `references` longtext DEFAULT NULL,
  `in_reply_to` varchar(1023) DEFAULT NULL,
  `thread_root_id` varchar(1023) DEFAULT NULL,
  `flag_mdnsent` tinyint(1) DEFAULT 0,
  `imip_message` tinyint(1) DEFAULT 0,
  `imip_processed` tinyint(1) DEFAULT 0,
  `imip_error` tinyint(1) DEFAULT 0,
  `encrypted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `mail_messages_id_flags` (`mailbox_id`,`flag_important`,`flag_deleted`,`flag_seen`),
  KEY `mail_messages_id_flags2` (`mailbox_id`,`flag_deleted`,`flag_flagged`),
  KEY `mail_messages_msgid_idx` (`message_id`(128)),
  KEY `mail_msg_thrd_root_snt_idx` (`mailbox_id`,`thread_root_id`(64),`sent_at`),
  KEY `mail_messages_mb_id_uid` (`mailbox_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_messages`
--

LOCK TABLES `oc_mail_messages` WRITE;
/*!40000 ALTER TABLE `oc_mail_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_messages_retention`
--

DROP TABLE IF EXISTS `oc_mail_messages_retention`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_messages_retention` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `known_since` int(11) NOT NULL,
  `mailbox_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_msg_retention_mbuid_idx` (`mailbox_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_messages_retention`
--

LOCK TABLES `oc_mail_messages_retention` WRITE;
/*!40000 ALTER TABLE `oc_mail_messages_retention` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_messages_retention` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_messages_snoozed`
--

DROP TABLE IF EXISTS `oc_mail_messages_snoozed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_messages_snoozed` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `snoozed_until` int(11) NOT NULL,
  `src_mailbox_id` int(11) DEFAULT NULL,
  `mailbox_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_msg_snoozed_mbuid_idx` (`mailbox_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_messages_snoozed`
--

LOCK TABLES `oc_mail_messages_snoozed` WRITE;
/*!40000 ALTER TABLE `oc_mail_messages_snoozed` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_messages_snoozed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_provisionings`
--

DROP TABLE IF EXISTS `oc_mail_provisionings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_provisionings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provisioning_domain` varchar(63) NOT NULL DEFAULT '',
  `email_template` varchar(255) NOT NULL DEFAULT '',
  `imap_user` varchar(128) NOT NULL DEFAULT '',
  `imap_host` varchar(255) NOT NULL DEFAULT '',
  `imap_port` smallint(5) unsigned NOT NULL,
  `imap_ssl_mode` varchar(64) NOT NULL DEFAULT '',
  `smtp_user` varchar(128) NOT NULL DEFAULT '',
  `smtp_host` varchar(255) NOT NULL DEFAULT '',
  `smtp_port` smallint(5) unsigned NOT NULL,
  `smtp_ssl_mode` varchar(64) NOT NULL DEFAULT '',
  `sieve_enabled` tinyint(1) DEFAULT 0,
  `sieve_user` varchar(128) DEFAULT NULL,
  `sieve_host` varchar(128) DEFAULT NULL,
  `sieve_port` smallint(5) unsigned DEFAULT NULL,
  `sieve_ssl_mode` varchar(64) DEFAULT NULL,
  `ldap_aliases_provisioning` tinyint(1) DEFAULT 0,
  `ldap_aliases_attribute` varchar(255) DEFAULT '',
  `master_password_enabled` tinyint(1) DEFAULT 0,
  `master_password` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_provsng_dm_idx` (`provisioning_domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_provisionings`
--

LOCK TABLES `oc_mail_provisionings` WRITE;
/*!40000 ALTER TABLE `oc_mail_provisionings` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_provisionings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_recipients`
--

DROP TABLE IF EXISTS `oc_mail_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_recipients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `local_message_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_recipient_msg_id_idx` (`message_id`),
  KEY `mail_recipient_email_idx` (`email`),
  KEY `IDX_715DB7E31594979` (`local_message_id`),
  CONSTRAINT `recipient_local_message` FOREIGN KEY (`local_message_id`) REFERENCES `oc_mail_local_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_recipients`
--

LOCK TABLES `oc_mail_recipients` WRITE;
/*!40000 ALTER TABLE `oc_mail_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_smime_certificates`
--

DROP TABLE IF EXISTS `oc_mail_smime_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_smime_certificates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `certificate` longtext NOT NULL,
  `private_key` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_smime_certs_uid_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_smime_certificates`
--

LOCK TABLES `oc_mail_smime_certificates` WRITE;
/*!40000 ALTER TABLE `oc_mail_smime_certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_smime_certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_tags`
--

DROP TABLE IF EXISTS `oc_mail_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `imap_label` varchar(64) NOT NULL,
  `display_name` varchar(128) NOT NULL,
  `color` varchar(9) DEFAULT '#fff',
  `is_default_tag` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_msg_tags_usr_lbl_idx` (`user_id`,`imap_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_tags`
--

LOCK TABLES `oc_mail_tags` WRITE;
/*!40000 ALTER TABLE `oc_mail_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_trusted_senders`
--

DROP TABLE IF EXISTS `oc_mail_trusted_senders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_trusted_senders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'individual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_trusted_sender_uniq` (`email`,`user_id`),
  KEY `mail_trusted_senders_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_trusted_senders`
--

LOCK TABLES `oc_mail_trusted_senders` WRITE;
/*!40000 ALTER TABLE `oc_mail_trusted_senders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_trusted_senders` ENABLE KEYS */;
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
INSERT INTO `oc_migrations` VALUES ('activity','2006Date20170808154933'),('activity','2006Date20170808155040'),('activity','2006Date20170919095939'),('activity','2007Date20181107114613'),('activity','2008Date20181011095117'),('activity','2010Date20190416112817'),('activity','2011Date20201006132544'),('activity','2011Date20201006132545'),('activity','2011Date20201006132546'),('activity','2011Date20201006132547'),('activity','2011Date20201207091915'),('calendar','2040Date20210908101001'),('calendar','3000Date20211109132439'),('calendar','3010Date20220111090252'),('calendar','4050Date20230614163505'),('circles','0022Date20220526111723'),('circles','0022Date20220526113601'),('circles','0022Date20220703115023'),('circles','0023Date20211216113101'),('circles','0024Date20220203123901'),('circles','0024Date20220203123902'),('circles','0024Date20220317190331'),('circles','0028Date20230705222601'),('contactsinteraction','010000Date20200304152605'),('core','13000Date20170705121758'),('core','13000Date20170718121200'),('core','13000Date20170814074715'),('core','13000Date20170919121250'),('core','13000Date20170926101637'),('core','14000Date20180129121024'),('core','14000Date20180404140050'),('core','14000Date20180516101403'),('core','14000Date20180518120534'),('core','14000Date20180522074438'),('core','14000Date20180626223656'),('core','14000Date20180710092004'),('core','14000Date20180712153140'),('core','15000Date20180926101451'),('core','15000Date20181015062942'),('core','15000Date20181029084625'),('core','16000Date20190207141427'),('core','16000Date20190212081545'),('core','16000Date20190427105638'),('core','16000Date20190428150708'),('core','17000Date20190514105811'),('core','18000Date20190920085628'),('core','18000Date20191014105105'),('core','18000Date20191204114856'),('core','19000Date20200211083441'),('core','20000Date20201109081915'),('core','20000Date20201109081918'),('core','20000Date20201109081919'),('core','20000Date20201111081915'),('core','21000Date20201120141228'),('core','21000Date20201202095923'),('core','21000Date20210119195004'),('core','21000Date20210309185126'),('core','21000Date20210309185127'),('core','22000Date20210216080825'),('core','23000Date20210721100600'),('core','23000Date20210906132259'),('core','23000Date20210930122352'),('core','23000Date20211203110726'),('core','23000Date20211213203940'),('core','24000Date20211210141942'),('core','24000Date20211213081506'),('core','24000Date20211213081604'),('core','24000Date20211222112246'),('core','24000Date20211230140012'),('core','24000Date20220131153041'),('core','24000Date20220202150027'),('core','24000Date20220404230027'),('core','24000Date20220425072957'),('core','25000Date20220515204012'),('core','25000Date20220602190540'),('core','25000Date20220905140840'),('core','25000Date20221007010957'),('core','27000Date20220613163520'),('core','27000Date20230309104325'),('core','27000Date20230309104802'),('core','28000Date20230616104802'),('core','28000Date20230728104802'),('core','28000Date20230803221055'),('core','28000Date20230906104802'),('core','28000Date20231004103301'),('core','28000Date20231103104802'),('core','28000Date20231126110901'),('core','29000Date20231126110901'),('core','29000Date20231213104850'),('core','29000Date20240124132201'),('core','29000Date20240124132202'),('core','29000Date20240131122720'),('dav','1004Date20170825134824'),('dav','1004Date20170919104507'),('dav','1004Date20170924124212'),('dav','1004Date20170926103422'),('dav','1005Date20180413093149'),('dav','1005Date20180530124431'),('dav','1006Date20180619154313'),('dav','1006Date20180628111625'),('dav','1008Date20181030113700'),('dav','1008Date20181105104826'),('dav','1008Date20181105104833'),('dav','1008Date20181105110300'),('dav','1008Date20181105112049'),('dav','1008Date20181114084440'),('dav','1011Date20190725113607'),('dav','1011Date20190806104428'),('dav','1012Date20190808122342'),('dav','1016Date20201109085907'),('dav','1017Date20210216083742'),('dav','1018Date20210312100735'),('dav','1024Date20211221144219'),('dav','1025Date20240308063933'),('dav','1027Date20230504122946'),('dav','1029Date20221114151721'),('dav','1029Date20231004091403'),('dav','1030Date20240205103243'),('federatedfilesharing','1010Date20200630191755'),('federatedfilesharing','1011Date20201120125158'),('federation','1010Date20200630191302'),('files','11301Date20191205150729'),('files','12101Date20221011153334'),('files_downloadlimit','000000Date20210910094923'),('files_reminders','10000Date20230725162149'),('files_sharing','11300Date20201120141438'),('files_sharing','21000Date20201223143245'),('files_sharing','22000Date20210216084241'),('files_sharing','24000Date20220208195521'),('files_sharing','24000Date20220404142216'),('files_trashbin','1010Date20200630192639'),('files_versions','1020Date20221114144058'),('mail','0100Date20180825194217'),('mail','0110Date20180825195812'),('mail','0110Date20180825201241'),('mail','0130Date20190408134101'),('mail','0156Date20190828140357'),('mail','0161Date20190902103559'),('mail','0161Date20190902103701'),('mail','0161Date20190902114635'),('mail','0180Date20190927124207'),('mail','0190Date20191118160843'),('mail','0210Date20191212144925'),('mail','1020Date20191002091034'),('mail','1020Date20191002091035'),('mail','1020Date20200206134751'),('mail','1030Date20200228105714'),('mail','1040Date20200422130220'),('mail','1040Date20200422142920'),('mail','1040Date20200506111214'),('mail','1040Date20200515080614'),('mail','1040Date20200529124657'),('mail','1050Date20200624101359'),('mail','1050Date20200831124954'),('mail','1050Date20200921141700'),('mail','1050Date20200923180030'),('mail','1060Date20201015084952'),('mail','1080Date20201119084820'),('mail','1080Date20210108093802'),('mail','1090Date20210127160127'),('mail','1090Date20210216154409'),('mail','1096Date20210407150016'),('mail','1100Date20210304143008'),('mail','1100Date20210317164707'),('mail','1100Date20210326103929'),('mail','1100Date20210409091311'),('mail','1100Date20210419080523'),('mail','1100Date20210419121734'),('mail','1100Date20210421113423'),('mail','1100Date20210512142306'),('mail','1101Date20210616141806'),('mail','1105Date20210922104324'),('mail','1110Date20210908114229'),('mail','1115Date20211216144446'),('mail','1120Date20220223094709'),('mail','1124Date20220531094751'),('mail','1124Date20220601084530'),('mail','1130Date20220412111833'),('mail','1130Date20220520062301'),('mail','1140Date20220628174152'),('mail','1140Date20220701103556'),('mail','1140Date20220808203258'),('mail','1140Date20221027171138'),('mail','1140Date20221113205737'),('mail','1140Date20221206162029'),('mail','2000Date20220908130842'),('mail','2010Date20221002201527'),('mail','2020Date20221103140538'),('mail','2100Date20221013143851'),('mail','2300Date20221205160349'),('mail','2300Date20221215143450'),('mail','2300Date20221216115727'),('mail','2300Date20230120085320'),('mail','2300Date20230127093733'),('mail','2300Date20230214104736'),('mail','2300Date20230221170502'),('mail','3000Date20230301152454'),('mail','3001Date20230307113544'),('mail','3300Date20230706140531'),('mail','3300Date20230801124717'),('mail','3400Date20230807300513'),('mail','3400Date20230814160451'),('mail','3400Date20230818160236'),('mail','3400Date20230819161945'),('mail','3400Date20230823153943'),('mail','3400Date20230907103114'),('mail','3500Date20231005091430'),('mail','3500Date20231009102414'),('mail','3500Date20231114180656'),('mail','3500Date20231115182612'),('mail','3500Date20231115184458'),('mail','3600Date20240205180726'),('mail','3600Date20240220134813'),('mail','3600Date20240220134814'),('mail','3600Date20240227172825'),('notes','3005Date20200528204430'),('notes','3005Date20200528204431'),('notifications','2004Date20190107135757'),('notifications','2010Date20210218082811'),('notifications','2010Date20210218082855'),('notifications','2011Date20210930134607'),('notifications','2011Date20220826074907'),('oauth2','010401Date20181207190718'),('oauth2','010402Date20190107124745'),('oauth2','011601Date20230522143227'),('oauth2','011602Date20230613160650'),('oauth2','011603Date20230620111039'),('photos','20000Date20220727125801'),('photos','20001Date20220830131446'),('photos','20003Date20221102170153'),('photos','20003Date20221103094628'),('privacy','100Date20190217131943'),('richdocuments','2060Date20200302131958'),('richdocuments','2060Date20200302132145'),('richdocuments','30704Date20200626072306'),('richdocuments','30709Date20201111104147'),('richdocuments','30717Date20210310164901'),('richdocuments','50200Date20211220212457'),('spreed','10000Date20200819121721'),('spreed','10000Date20201012144235'),('spreed','10000Date20201015134000'),('spreed','10000Date20201015143852'),('spreed','10000Date20201015150000'),('spreed','11000Date20200922161218'),('spreed','11000Date20201011082810'),('spreed','11000Date20201201102528'),('spreed','11000Date20201204110210'),('spreed','11000Date20201209142525'),('spreed','11000Date20201209142526'),('spreed','11001Date20210211111527'),('spreed','11001Date20210212105406'),('spreed','12000Date20210217134030'),('spreed','12000Date20210401124139'),('spreed','12000Date20210528100404'),('spreed','13000Date20210625232111'),('spreed','13000Date20210901164235'),('spreed','13000Date20210921142733'),('spreed','13000Date20211007192733'),('spreed','14000Date20211203132513'),('spreed','14000Date20220217115327'),('spreed','14000Date20220328153054'),('spreed','14000Date20220330141647'),('spreed','15000Date20220427183026'),('spreed','15000Date20220503121308'),('spreed','15000Date20220506005058'),('spreed','16000Date20221110151714'),('spreed','16000Date20221116163301'),('spreed','16000Date20221208013745'),('spreed','16000Date20230502145340'),('spreed','18000Date20230504205823'),('spreed','18000Date20230808120823'),('spreed','18000Date20230821112014'),('spreed','18000Date20230824123939'),('spreed','18000Date20230920182747'),('spreed','18000Date20230928131717'),('spreed','18000Date20231005091416'),('spreed','18000Date20231018065816'),('spreed','18000Date20231024141626'),('spreed','18000Date20231024141627'),('spreed','19000Date20240212155937'),('spreed','19000Date20240214095011'),('spreed','19000Date20240227084313'),('spreed','19000Date20240305115243'),('spreed','19000Date20240312105627'),('spreed','19000Date20240313134926'),('spreed','19000Date20240416104656'),('spreed','2000Date20170707093535'),('spreed','2000Date20171026140256'),('spreed','2000Date20171026140257'),('spreed','2001Date20170707115443'),('spreed','2001Date20170913104501'),('spreed','2001Date20170921145301'),('spreed','2001Date20170929092606'),('spreed','2001Date20171009132424'),('spreed','2001Date20171026134605'),('spreed','2001Date20171026141336'),('spreed','2001Date20171031102049'),('spreed','2001Date20180103144447'),('spreed','2001Date20180103150836'),('spreed','3002Date20180319104030'),('spreed','3003Date20180707222130'),('spreed','3003Date20180718112436'),('spreed','3003Date20180718133519'),('spreed','3003Date20180720162342'),('spreed','3003Date20180722152733'),('spreed','3003Date20180722152849'),('spreed','3003Date20180730080327'),('spreed','4099Date20181001123058'),('spreed','5099Date20190121102337'),('spreed','5099Date20190319134820'),('spreed','6099Date20190627172429'),('spreed','7000Date20190717141457'),('spreed','7000Date20190724121136'),('spreed','7000Date20190724121137'),('spreed','8000Date20200331144101'),('spreed','8000Date20200402124456'),('spreed','8000Date20200407073807'),('spreed','8000Date20200407115318'),('text','010000Date20190617184535'),('text','030001Date20200402075029'),('text','030201Date20201116110353'),('text','030201Date20201116123153'),('text','030501Date20220202101853'),('text','030701Date20230207131313'),('text','030901Date20231114150437'),('twofactor_backupcodes','1002Date20170607104347'),('twofactor_backupcodes','1002Date20170607113030'),('twofactor_backupcodes','1002Date20170919123342'),('twofactor_backupcodes','1002Date20170926101419'),('twofactor_backupcodes','1002Date20180821043638'),('updatenotification','011901Date20240305120000'),('user_status','0001Date20200602134824'),('user_status','0002Date20200902144824'),('user_status','1000Date20201111130204'),('user_status','1003Date20210809144824'),('user_status','1008Date20230921144701'),('workflowengine','2000Date20190808074233'),('workflowengine','2200Date20210805101925');
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mimetypes`
--

LOCK TABLES `oc_mimetypes` WRITE;
/*!40000 ALTER TABLE `oc_mimetypes` DISABLE KEYS */;
INSERT INTO `oc_mimetypes` VALUES (9,'application'),(41,'application/font-sfnt'),(37,'application/gzip'),(35,'application/javascript'),(39,'application/json'),(27,'application/octet-stream'),(11,'application/pdf'),(19,'application/vnd.oasis.opendocument.graphics'),(23,'application/vnd.oasis.opendocument.presentation'),(21,'application/vnd.oasis.opendocument.spreadsheet'),(25,'application/vnd.oasis.opendocument.text'),(17,'application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(1,'httpd'),(3,'httpd/unix-directory'),(13,'image'),(33,'image/jpeg'),(15,'image/png'),(43,'image/svg+xml'),(5,'text'),(7,'text/markdown'),(29,'video'),(31,'video/mp4');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
-- Table structure for table `oc_notes_meta`
--

DROP TABLE IF EXISTS `oc_notes_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notes_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `last_update` int(11) NOT NULL,
  `etag` varchar(32) NOT NULL,
  `content_etag` varchar(32) NOT NULL,
  `file_etag` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notes_meta_file_user_index` (`file_id`,`user_id`),
  KEY `notes_meta_file_id_index` (`file_id`),
  KEY `notes_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notes_meta`
--

LOCK TABLES `oc_notes_meta` WRITE;
/*!40000 ALTER TABLE `oc_notes_meta` DISABLE KEYS */;
INSERT INTO `oc_notes_meta` VALUES (3,499,'admin',1716440817,'68c61c2c46d355dcfdb82f333342b7eb','369db3272aa1ee8e94afcb70be8293f2','a350b3aac6e1eb7ecfa676977659a4a3');
/*!40000 ALTER TABLE `oc_notes_meta` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications`
--

LOCK TABLES `oc_notifications` WRITE;
/*!40000 ALTER TABLE `oc_notifications` DISABLE KEYS */;
INSERT INTO `oc_notifications` VALUES (1,'firstrunwizard','admin',1716437643,'app','recognize','apphint-recognize','[]','','[]','','','[]'),(3,'firstrunwizard','admin',1716437643,'app','groupfolders','apphint-groupfolders','[]','','[]','','','[]'),(5,'firstrunwizard','admin',1716437643,'app','forms','apphint-forms','[]','','[]','','','[]'),(7,'firstrunwizard','admin',1716437643,'app','deck','apphint-deck','[]','','[]','','','[]'),(9,'firstrunwizard','admin',1716437643,'app','tasks','apphint-tasks','[]','','[]','','','[]');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
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
INSERT INTO `oc_preferences` VALUES ('admin','activity','configured','yes'),('admin','avatar','generated','true'),('admin','core','lang','en'),('admin','core','templateDirectory','Templates/'),('admin','core','timezone','Asia/Irkutsk'),('admin','dashboard','firstRun','0'),('admin','files','lastSeenQuotaUsage','0.16'),('admin','firstrunwizard','apphint','18'),('admin','firstrunwizard','show','29.0.0'),('admin','login','lastLogin','1716437746'),('admin','login_token','wwfscXoop8Gi0f0xy4pwzj6WNKBdnt/x','1716437749'),('admin','notes','notesLastViewedNote','509'),('admin','notes','settings','{\"notesPath\":\"\\u0417\\u0430\\u043c\\u0435\\u0442\\u043a\\u0438\"}'),('admin','notifications','sound_notification','no'),('admin','notifications','sound_talk','no'),('admin','password_policy','failedLoginAttempts','0'),('admin','theming','enabled-themes','[\"dark\"]');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_profile_config`
--

LOCK TABLES `oc_profile_config` WRITE;
/*!40000 ALTER TABLE `oc_profile_config` DISABLE KEYS */;
INSERT INTO `oc_profile_config` VALUES (1,'admin','{\"talk\":{\"visibility\":\"show_users_only\"},\"address\":{\"visibility\":\"show_users_only\"},\"avatar\":{\"visibility\":\"show\"},\"biography\":{\"visibility\":\"show\"},\"displayname\":{\"visibility\":\"show\"},\"headline\":{\"visibility\":\"show\"},\"organisation\":{\"visibility\":\"show\"},\"role\":{\"visibility\":\"show\"},\"email\":{\"visibility\":\"show_users_only\"},\"phone\":{\"visibility\":\"show_users_only\"},\"twitter\":{\"visibility\":\"show\"},\"website\":{\"visibility\":\"show\"}}');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_ratelimit_entries`
--

LOCK TABLES `oc_ratelimit_entries` WRITE;
/*!40000 ALTER TABLE `oc_ratelimit_entries` DISABLE KEYS */;
INSERT INTO `oc_ratelimit_entries` VALUES (3,'c34f70923ccc03928093f4b78c64a7fc5541f5c5499899a1475a1e9b3c2e0019ca966ff3b4d3fd9d2302bea45f4910ff775b140f6ef808b0e897b85517c20913','2024-05-23 05:23:27');
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
-- Table structure for table `oc_richdocuments_assets`
--

DROP TABLE IF EXISTS `oc_richdocuments_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_richdocuments_assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) DEFAULT NULL,
  `fileid` bigint(20) NOT NULL,
  `token` varchar(64) DEFAULT NULL,
  `timestamp` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rd_assets_token_idx` (`token`),
  UNIQUE KEY `rd_assets_timestamp_idx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_richdocuments_assets`
--

LOCK TABLES `oc_richdocuments_assets` WRITE;
/*!40000 ALTER TABLE `oc_richdocuments_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_richdocuments_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_richdocuments_direct`
--

DROP TABLE IF EXISTS `oc_richdocuments_direct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_richdocuments_direct` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(64) DEFAULT NULL,
  `uid` varchar(64) DEFAULT NULL,
  `fileid` bigint(20) NOT NULL,
  `timestamp` bigint(20) unsigned DEFAULT 0,
  `template_destination` bigint(20) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `share` varchar(64) DEFAULT NULL,
  `initiator_host` varchar(255) DEFAULT NULL,
  `initiator_token` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rd_direct_token_idx` (`token`),
  KEY `rd_direct_timestamp_idx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_richdocuments_direct`
--

LOCK TABLES `oc_richdocuments_direct` WRITE;
/*!40000 ALTER TABLE `oc_richdocuments_direct` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_richdocuments_direct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_richdocuments_template`
--

DROP TABLE IF EXISTS `oc_richdocuments_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_richdocuments_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) DEFAULT NULL,
  `fileid` bigint(20) NOT NULL,
  `templateid` bigint(20) NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rd_t_user_file` (`userid`,`fileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_richdocuments_template`
--

LOCK TABLES `oc_richdocuments_template` WRITE;
/*!40000 ALTER TABLE `oc_richdocuments_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_richdocuments_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_richdocuments_wopi`
--

DROP TABLE IF EXISTS `oc_richdocuments_wopi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_richdocuments_wopi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_uid` varchar(64) DEFAULT NULL,
  `editor_uid` varchar(64) DEFAULT NULL,
  `guest_displayname` varchar(64) DEFAULT NULL,
  `fileid` bigint(20) NOT NULL,
  `version` bigint(20) DEFAULT 0,
  `canwrite` tinyint(1) DEFAULT 0,
  `server_host` varchar(255) NOT NULL DEFAULT 'localhost',
  `token` varchar(32) DEFAULT '',
  `expiry` bigint(20) unsigned DEFAULT NULL,
  `template_destination` bigint(20) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `hide_download` tinyint(1) DEFAULT 0,
  `direct` tinyint(1) DEFAULT 0,
  `remote_server` varchar(255) DEFAULT '',
  `remote_server_token` varchar(32) DEFAULT '',
  `share` varchar(64) DEFAULT NULL,
  `token_type` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rd_wopi_token_idx` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_richdocuments_wopi`
--

LOCK TABLES `oc_richdocuments_wopi` WRITE;
/*!40000 ALTER TABLE `oc_richdocuments_wopi` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_richdocuments_wopi` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages`
--

LOCK TABLES `oc_storages` WRITE;
/*!40000 ALTER TABLE `oc_storages` DISABLE KEYS */;
INSERT INTO `oc_storages` VALUES (1,'home::admin',1,NULL),(3,'local::/data/nextcloud/data/',1,NULL);
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
-- Table structure for table `oc_talk_attachments`
--

DROP TABLE IF EXISTS `oc_talk_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_attachments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `message_id` bigint(20) unsigned NOT NULL,
  `message_time` bigint(20) unsigned NOT NULL,
  `object_type` varchar(64) NOT NULL,
  `actor_type` varchar(64) NOT NULL,
  `actor_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `objects_in_room` (`room_id`,`object_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_attachments`
--

LOCK TABLES `oc_talk_attachments` WRITE;
/*!40000 ALTER TABLE `oc_talk_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_attendees`
--

DROP TABLE IF EXISTS `oc_talk_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_attendees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `actor_type` varchar(32) NOT NULL,
  `actor_id` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT '',
  `pin` varchar(32) DEFAULT NULL,
  `participant_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `favorite` tinyint(1) DEFAULT 0,
  `notification_level` int(11) DEFAULT 0,
  `last_joined_call` int(10) unsigned NOT NULL DEFAULT 0,
  `last_read_message` bigint(20) DEFAULT 0,
  `last_mention_message` bigint(20) DEFAULT 0,
  `read_privacy` smallint(5) unsigned DEFAULT 0,
  `access_token` varchar(64) DEFAULT NULL,
  `remote_id` varchar(255) DEFAULT NULL,
  `last_mention_direct` bigint(20) NOT NULL DEFAULT 0,
  `permissions` int(11) NOT NULL DEFAULT 0,
  `notification_calls` int(11) NOT NULL DEFAULT 1,
  `phone_number` varchar(255) DEFAULT '',
  `call_id` varchar(255) DEFAULT '',
  `invited_cloud_id` varchar(255) DEFAULT NULL,
  `state` smallint(5) unsigned NOT NULL DEFAULT 0,
  `unread_messages` bigint(20) unsigned NOT NULL DEFAULT 0,
  `last_attendee_activity` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ta_ident` (`room_id`,`actor_type`,`actor_id`),
  KEY `ta_roompin` (`room_id`,`pin`),
  KEY `ta_room` (`room_id`),
  KEY `ta_actor` (`actor_type`,`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_attendees`
--

LOCK TABLES `oc_talk_attendees` WRITE;
/*!40000 ALTER TABLE `oc_talk_attendees` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_bots_conversation`
--

DROP TABLE IF EXISTS `oc_talk_bots_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_bots_conversation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bot_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `token` varchar(64) DEFAULT NULL,
  `state` smallint(5) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `talk_bots_convo_uniq` (`bot_id`,`token`),
  KEY `talk_bots_convo_token` (`token`,`state`),
  KEY `talk_bots_convo_id` (`bot_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_bots_conversation`
--

LOCK TABLES `oc_talk_bots_conversation` WRITE;
/*!40000 ALTER TABLE `oc_talk_bots_conversation` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_bots_conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_bots_server`
--

DROP TABLE IF EXISTS `oc_talk_bots_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_bots_server` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(4000) NOT NULL,
  `url_hash` varchar(64) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `secret` varchar(128) NOT NULL,
  `error_count` bigint(20) unsigned NOT NULL DEFAULT 0,
  `last_error_date` datetime DEFAULT NULL,
  `last_error_message` varchar(4000) DEFAULT NULL,
  `state` smallint(5) unsigned DEFAULT 0,
  `features` int(10) unsigned NOT NULL DEFAULT 3,
  PRIMARY KEY (`id`),
  UNIQUE KEY `talk_bots_server_urlhash` (`url_hash`),
  UNIQUE KEY `talk_bots_server_secret` (`secret`),
  KEY `talk_bots_server_state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_bots_server`
--

LOCK TABLES `oc_talk_bots_server` WRITE;
/*!40000 ALTER TABLE `oc_talk_bots_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_bots_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_bridges`
--

DROP TABLE IF EXISTS `oc_talk_bridges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_bridges` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `json_values` longtext NOT NULL,
  `enabled` smallint(5) unsigned NOT NULL DEFAULT 0,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbr_room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_bridges`
--

LOCK TABLES `oc_talk_bridges` WRITE;
/*!40000 ALTER TABLE `oc_talk_bridges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_bridges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_commands`
--

DROP TABLE IF EXISTS `oc_talk_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(64) DEFAULT '',
  `name` varchar(64) NOT NULL,
  `command` varchar(64) NOT NULL,
  `script` longtext NOT NULL,
  `response` int(11) NOT NULL DEFAULT 1,
  `enabled` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_commands`
--

LOCK TABLES `oc_talk_commands` WRITE;
/*!40000 ALTER TABLE `oc_talk_commands` DISABLE KEYS */;
INSERT INTO `oc_talk_commands` VALUES (1,'','talk','help','help',1,3);
/*!40000 ALTER TABLE `oc_talk_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_consent`
--

DROP TABLE IF EXISTS `oc_talk_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_consent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL,
  `actor_type` varchar(64) NOT NULL,
  `actor_id` varchar(64) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `talk_reccons_token` (`token`),
  KEY `talk_reccons_actor` (`actor_id`,`actor_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_consent`
--

LOCK TABLES `oc_talk_consent` WRITE;
/*!40000 ALTER TABLE `oc_talk_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_internalsignaling`
--

DROP TABLE IF EXISTS `oc_talk_internalsignaling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_internalsignaling` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` varchar(255) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tis_recipient_time` (`recipient`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_internalsignaling`
--

LOCK TABLES `oc_talk_internalsignaling` WRITE;
/*!40000 ALTER TABLE `oc_talk_internalsignaling` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_internalsignaling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_invitations`
--

DROP TABLE IF EXISTS `oc_talk_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_invitations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `state` smallint(5) unsigned NOT NULL DEFAULT 0,
  `local_room_id` bigint(20) unsigned NOT NULL,
  `access_token` varchar(64) NOT NULL,
  `remote_server_url` varchar(512) NOT NULL,
  `remote_token` varchar(32) NOT NULL,
  `remote_attendee_id` bigint(20) unsigned NOT NULL,
  `inviter_cloud_id` varchar(255) DEFAULT NULL,
  `inviter_display_name` varchar(255) DEFAULT NULL,
  `local_cloud_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `talk_fedinv_remote` (`remote_server_url`,`remote_attendee_id`),
  KEY `talk_fedinv_lri` (`local_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_invitations`
--

LOCK TABLES `oc_talk_invitations` WRITE;
/*!40000 ALTER TABLE `oc_talk_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_poll_votes`
--

DROP TABLE IF EXISTS `oc_talk_poll_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_poll_votes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `poll_id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `actor_type` varchar(64) NOT NULL,
  `actor_id` varchar(64) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `talk_poll_vote` (`poll_id`,`actor_type`,`actor_id`),
  KEY `talk_vote_room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_poll_votes`
--

LOCK TABLES `oc_talk_poll_votes` WRITE;
/*!40000 ALTER TABLE `oc_talk_poll_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_poll_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_polls`
--

DROP TABLE IF EXISTS `oc_talk_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_polls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) NOT NULL,
  `question` longtext DEFAULT NULL,
  `options` longtext DEFAULT NULL,
  `votes` longtext DEFAULT NULL,
  `num_voters` bigint(20) DEFAULT 0,
  `actor_type` varchar(64) NOT NULL,
  `actor_id` varchar(64) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `status` smallint(6) DEFAULT 0,
  `result_mode` smallint(6) DEFAULT 0,
  `max_votes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `talk_poll_room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_polls`
--

LOCK TABLES `oc_talk_polls` WRITE;
/*!40000 ALTER TABLE `oc_talk_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_proxy_messages`
--

DROP TABLE IF EXISTS `oc_talk_proxy_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_proxy_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `local_token` varchar(32) NOT NULL,
  `remote_server_url` varchar(512) NOT NULL,
  `remote_token` varchar(32) NOT NULL,
  `remote_message_id` bigint(20) unsigned NOT NULL,
  `actor_type` varchar(64) NOT NULL,
  `actor_id` varchar(64) NOT NULL,
  `actor_display_name` varchar(255) DEFAULT NULL,
  `message_type` varchar(64) NOT NULL,
  `system_message` varchar(64) DEFAULT NULL,
  `expiration_datetime` datetime DEFAULT NULL,
  `message` longtext DEFAULT NULL,
  `message_parameters` longtext DEFAULT NULL,
  `creation_datetime` datetime DEFAULT NULL,
  `meta_data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `talk_pcm_remote` (`remote_server_url`,`remote_token`,`remote_message_id`),
  KEY `talk_pmc_local` (`local_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_proxy_messages`
--

LOCK TABLES `oc_talk_proxy_messages` WRITE;
/*!40000 ALTER TABLE `oc_talk_proxy_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_proxy_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_reminders`
--

DROP TABLE IF EXISTS `oc_talk_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_reminders` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `message_id` bigint(20) unsigned NOT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `talk_reminder_user_msg` (`user_id`,`message_id`),
  KEY `talk_reminder_exectime` (`date_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_reminders`
--

LOCK TABLES `oc_talk_reminders` WRITE;
/*!40000 ALTER TABLE `oc_talk_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_retry_ocm`
--

DROP TABLE IF EXISTS `oc_talk_retry_ocm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_retry_ocm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `remote_server` varchar(255) NOT NULL,
  `num_attempts` int(10) unsigned NOT NULL DEFAULT 0,
  `next_retry` datetime DEFAULT NULL,
  `notification_type` varchar(64) NOT NULL,
  `resource_type` varchar(64) NOT NULL,
  `provider_id` varchar(64) NOT NULL,
  `notification` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `talk_retry_ocm_next` (`next_retry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_retry_ocm`
--

LOCK TABLES `oc_talk_retry_ocm` WRITE;
/*!40000 ALTER TABLE `oc_talk_retry_ocm` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_retry_ocm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_rooms`
--

DROP TABLE IF EXISTS `oc_talk_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `token` varchar(32) DEFAULT '',
  `type` int(11) NOT NULL,
  `password` varchar(255) DEFAULT '',
  `active_since` datetime DEFAULT NULL,
  `active_guests` int(10) unsigned NOT NULL DEFAULT 0,
  `last_activity` datetime DEFAULT NULL,
  `last_message` bigint(20) DEFAULT 0,
  `object_type` varchar(64) DEFAULT '',
  `object_id` varchar(64) DEFAULT '',
  `read_only` int(11) NOT NULL DEFAULT 0,
  `lobby_state` int(11) NOT NULL DEFAULT 0,
  `lobby_timer` datetime DEFAULT NULL,
  `assigned_hpb` int(11) DEFAULT NULL,
  `sip_enabled` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` longtext DEFAULT '',
  `listable` smallint(5) unsigned DEFAULT 0,
  `call_flag` int(11) NOT NULL DEFAULT 0,
  `default_permissions` int(11) NOT NULL DEFAULT 0,
  `call_permissions` int(11) NOT NULL DEFAULT 0,
  `remote_server` varchar(512) DEFAULT NULL,
  `remote_token` varchar(32) DEFAULT NULL,
  `message_expiration` int(11) NOT NULL DEFAULT 0,
  `breakout_room_mode` int(11) NOT NULL DEFAULT 0,
  `breakout_room_status` int(11) NOT NULL DEFAULT 0,
  `avatar` varchar(24) DEFAULT '',
  `call_recording` int(11) NOT NULL DEFAULT 0,
  `recording_consent` smallint(5) unsigned NOT NULL DEFAULT 0,
  `has_federation` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tr_room_token` (`token`),
  KEY `last_active` (`last_activity`),
  KEY `tr_listable` (`listable`),
  KEY `remote_id` (`remote_server`,`remote_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_rooms`
--

LOCK TABLES `oc_talk_rooms` WRITE;
/*!40000 ALTER TABLE `oc_talk_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_sessions`
--

DROP TABLE IF EXISTS `oc_talk_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_sessions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attendee_id` bigint(20) unsigned NOT NULL,
  `session_id` varchar(512) NOT NULL,
  `in_call` int(11) NOT NULL DEFAULT 0,
  `last_ping` int(10) unsigned NOT NULL DEFAULT 0,
  `state` smallint(5) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ts_session` (`session_id`),
  KEY `ts_in_call` (`in_call`),
  KEY `ts_last_ping` (`last_ping`),
  KEY `ts_attendee_id` (`attendee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_sessions`
--

LOCK TABLES `oc_talk_sessions` WRITE;
/*!40000 ALTER TABLE `oc_talk_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_sessions` ENABLE KEYS */;
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
INSERT INTO `oc_text_documents` VALUES (5,0,1,1716437238,'61096d995c285c570f6a1d118d9a2aa0','664ec3a3684fb'),(17,0,3,1716440750,'f19ee6e34908517794f4b6dc1b45f9f1','664ece8f810fb'),(499,0,31,1716440817,'a350b3aac6e1eb7ecfa676977659a4a3','664ecedbdcd71');
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
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_sessions`
--

LOCK TABLES `oc_text_sessions` WRITE;
/*!40000 ALTER TABLE `oc_text_sessions` DISABLE KEYS */;
INSERT INTO `oc_text_sessions` VALUES (77,'admin',NULL,'#d09e6d','00rTlZUAise0UZOGTre4zXgd16ntAW0rJM/zBPk/9sbYKAaPjx8QF+sfZQJYSKve',17,1716440749,'AWEB6Ne2ngYCWXsidXNlciI6eyJuYW1lIjoiYWRtaW4iLCJjbGllbnRJZCI6MTY3NDQyMzI3MiwiY29sb3IiOiIjZDA5ZTZkIiwibGFzdFVwZGF0ZSI6MTcxNjQzNzkyNX19'),(79,'admin',NULL,'#d09e6d','GI89RSvKZ6gG636+VCGP0TXCUgKYuD2zVfPMnG8a2g4N/DRdscnNvtKwQcf8/8WW',499,1716441162,'AWAB5s/8tAIcWHsidXNlciI6eyJuYW1lIjoiYWRtaW4iLCJjbGllbnRJZCI6NjQ3OTY0NjQ2LCJjb2xvciI6IiNkMDllNmQiLCJsYXN0VXBkYXRlIjoxNzE2NDQwODAxfX0='),(81,'admin',NULL,'#d09e6d','YvzOrLTWZ5L4hWoSF5Vi7Ua5f0N4i8d79U4n4uk4cGOJKUwnnmhITLRi5CnLm7sG',499,1716441172,'AWAB5s/8tAIcWHsidXNlciI6eyJuYW1lIjoiYWRtaW4iLCJjbGllbnRJZCI6NjQ3OTY0NjQ2LCJjb2xvciI6IiNkMDllNmQiLCJsYXN0VXBkYXRlIjoxNzE2NDQwODAxfX0='),(203,'admin',NULL,'#d09e6d','EAM5CAjAA/Iq87af46atw/jHWAuDs9r8+uFulKVGeFs3jHAcr69/i829qKXA+mIY',499,1716446176,'AW8B0v/c5gVaZ3sidXNlciI6eyJuYW1lIjoiYWRtaW4iLCJjbGllbnRJZCI6MTU1NzYxMDQ1MCwiY29sb3IiOiIjZDA5ZTZkIiwibGFzdFVwZGF0ZSI6MTcxNjQ0MTcyN30sImN1cnNvciI6bnVsbH0=');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_steps`
--

LOCK TABLES `oc_text_steps` WRITE;
/*!40000 ALTER TABLE `oc_text_steps` DISABLE KEYS */;
INSERT INTO `oc_text_steps` VALUES (1,5,1,'[\"AAK0AgEKAAAHAQdkZWZhdWx0AwdoZWFkaW5nBwAAAAYEAAABJldlbGNvbWUgdG8gTmV4dGNsb3VkISDwn5OxIOKYge+4jyDwn5K7KAAAAAVsZXZlbAF9ASgAAAACaWQBfygAAAAEdXVpZAF\\/hwAAAwlwYXJhZ3JhcGgHAAAjBgQAACSkAUhlcmUgeW91IGNhbiBhZGQgYSBkZXNjcmlwdGlvbiBvciBhbnkgb3RoZXIgaW5mbyByZWxldmFudCBmb3IgdGhlIGZvbGRlci4gSXQgd2lsbCBzaG93IGFzIGEgIlJlYWRtZS5tZCIgYW5kIGluIHRoZSB3ZWIgaW50ZXJmYWNlIGFsc28gZW1iZWRkZWQgbmljZWx5IHVwIGF0IHRoZSB0b3AuhwAjAwlwYXJhZ3JhcGgA\",\"AAJTAQL1oZ+GBwCoACEBdxZoLXdlbGNvbWUtdG8tbmV4dGNsb3VkqAAiAXckOTY3NmFhMmUtYWFjOS00NjhmLTg4MGQtZWIxOTUzMTFjOTJkAQABIQI=\"]',2147483647),(3,17,77,'[\"AALsAQEKAAAHAQdkZWZhdWx0AwdoZWFkaW5nBwAAAAYEAAABCURvY3VtZW50cygAAAAFbGV2ZWwBfQEoAAAAAmlkAX8oAAAABHV1aWQBf4cAAAMJcGFyYWdyYXBoBwAADgYEAAAPek5leHRjbG91ZCB3b3JrcyB3ZWxsIHdpdGggYWxsIHRoZSBjb21tb24gZG9jdW1lbnQgZm9ybWF0cy4gWW91IGNhbiBldmVuIGNvbGxhYm9yYXRlIHdpdGggb3RoZXJzIG9uIE9EVCBhbmQgTWFya2Rvd24gZmlsZXMhhwAOAwlwYXJhZ3JhcGgA\",\"AAJIAQLo17aeBgCoAAwBdwtoLWRvY3VtZW50c6gADQF3JGVhNGJiODZiLTE0YTMtNGYzYy1iYjIwLTg0ZWZkZjJkYzZhNAEAAQwC\"]',2147483647),(5,499,79,'[\"AAKzCgFaAAAHAQdkZWZhdWx0AwdoZWFkaW5nBwAAAAYEAAABG9Cf0YDQuNC80LXRgCDQt9Cw0LzQtdGC0LrQuCgAAAAFbGV2ZWwBfQEoAAAAAmlkAX8oAAAABHV1aWQBf4cAAAMKYnVsbGV0TGlzdAcAABMDCGxpc3RJdGVtBwAAFAMJcGFyYWdyYXBoBwAAFQYEAAAWKfCfk4UgMTUgSmFudWFyeSAyMDIxLCB2aWEgTmV4dGNsb3VkIE5vdGVzhwAUAwhsaXN0SXRlbQcAAD4DCXBhcmFncmFwaAcAAD8GBAAAQCLwn5GlIE1lLCB5b3UsIGFuZCBhbGwgb3VyIGZyaWVuZHMhKAAAEwZidWxsZXQBdwEqhwATAwdoZWFkaW5nBwAAYgYEAABjENCX0LDQtNCw0YfQuCDinIUoAABiBWxldmVsAX0CKAAAYgJpZAF\\/KAAAYgR1dWlkAX+HAGIDCHRhc2tMaXN0BwAAbwMIdGFza0l0ZW0HAABwAwlwYXJhZ3JhcGgHAABxBgQAAHIVV3JpdGUgbmljZSB0b2RvIGxpc3RzKAAAcAdjaGVja2VkAXmHAHADCHRhc2tJdGVtBwAAiQEDCXBhcmFncmFwaAcAAIoBBgQAAIsBCUJ1eSBGcmllcygAAIkBB2NoZWNrZWQBeYcAiQEDCHRhc2tJdGVtBwAAlgEDCXBhcmFncmFwaAcAAJcBBgQAAJgBA+KApigAAJYBB2NoZWNrZWQBeSgAAG8GYnVsbGV0AXcBKocAbwMHaGVhZGluZwcAAJwBBgQAAJ0BCUJpcnRoZGF5cygAAJwBBWxldmVsAX0CKAAAnAECaWQBfygAAJwBBHV1aWQBf4cAnAEDCmJ1bGxldExpc3QHAACqAQMIbGlzdEl0ZW0HAACrAQMJcGFyYWdyYXBoBwAArAEGBAAArQETSmVuLCBpbiB0aHJlZSBkYXlzIYcAqwEDCGxpc3RJdGVtBwAAwQEDCXBhcmFncmFwaAcAAMIBBgQAAMMBEE1vc3MsIDIxLjAzLjE5NzOHAMEBAwhsaXN0SXRlbQcAANQBAwlwYXJhZ3JhcGgHAADVAQYEAADWAQlSb3ksIDE5NzkoAACqAQZidWxsZXQBdwEqhwCqAQMHaGVhZGluZwcAAOEBBgQAAOIBEVJldmlldyBTdGVwcyDwn5SBKAAA4QEFbGV2ZWwBfQIoAADhAQJpZAF\\/KAAA4QEEdXVpZAF\\/hwDhAQMLb3JkZXJlZExpc3QHAAD1AQMIbGlzdEl0ZW0HAAD2AQMJcGFyYWdyYXBoBwAA9wEGBAAA+AELVHVybiBQQyBvZmaHAPYBAwhsaXN0SXRlbQcAAIQCAwlwYXJhZ3JhcGgHAACFAgYEAACGAgpUdXJuIFBDIG9uhwCEAgMIbGlzdEl0ZW0HAACRAgMJcGFyYWdyYXBoBwAAkgIGBAAAkwIMVGhlbiBjYWxsIElUKAAA9QEFc3RhcnQBfQGHAPUBAwdoZWFkaW5nBwAAoQIGBAAAogILUXVvdGVzIPCfkqwoAAChAgVsZXZlbAF9AigAAKECAmlkAX8oAAChAgR1dWlkAX+HAKECAwpibG9ja3F1b3RlBwAArwIDCXBhcmFncmFwaAcAALACBgQAALECVU5leHRjbG91ZCDigJQg0LHQtdC30L7Qv9Cw0YHQvdC+0LUg0LzQtdGB0YLQviDQtNC70Y8g0LLRgdC10YUg0LLQsNGI0LjRhSDQtNCw0L3QvdGL0YWHAK8CAwlwYXJhZ3JhcGgA\",\"AALIAgEK5s\\/8tAIAqAARAXcQaC1wcmltZXItemFtZXRraagAEgF3JDYxOTA2YjVmLTY3MmMtNDZmYi05N2ZjLTMzYzM5MWUxYTY0YqgAbQF3CWgtemFkYWNoaagAbgF3JDkwM2IzNzU3LTcxY2ItNDQ3NC1iZjk1LWQ1MTgxNWMxODRkOagAqAEBdwtoLWJpcnRoZGF5c6gAqQEBdyRiYTZmMWQ2YS1kMGY4LTRiNGItODdmNC1kZjdkYTFiMWZlZmWoAPMBAXcOaC1yZXZpZXctc3RlcHOoAPQBAXckNWYwMGI0NGUtYmM1Ny00YTViLTlhMmItNDk3ODM4MTVkZTI2qACtAgF3CGgtcXVvdGVzqACuAgF3JDM0M2JlMGVkLTQyOGItNDk0Ny05OTZhLTczZGIzNWZlYWMxMwEABRECbQKoAQLzAQKtAgI=\"]',2147483647),(7,499,81,'[\"AAIYAQGLhM23AwCHAOQCAwlwYXJhZ3JhcGgA\"]',2147483647),(9,499,81,'[\"AAIoAQKLhM23AwEHAIuEzbcDAAYEAIuEzbcDAQ3wn6S34oCN4pmA77iPAA==\",\"AAIeAQGLhM23AweEi4TNtwMGDfCfpLfigI3imYDvuI8A\"]',2147483647),(11,499,81,'[\"AAIeAQGLhM23AwyEi4TNtwMLDfCfpLfigI3imYDvuI8A\",\"AAIeAQGLhM23AxGEi4TNtwMQDfCfpLfigI3imYDvuI8A\"]',2147483647),(13,499,81,'[\"AAIeAQGLhM23AxaEi4TNtwMVDfCfpLfigI3imYDvuI8A\",\"AAIeAQGLhM23AxuEi4TNtwMaDfCfpLfigI3imYDvuI8A\"]',2147483647),(15,499,81,'[\"AAIeAQGLhM23AyCEi4TNtwMfDfCfpLfigI3imYDvuI8A\",\"AAIeAQGLhM23AyWEi4TNtwMkDfCfpLfigI3imYDvuI8A\"]',2147483647),(17,499,81,'[\"AAIeAQGLhM23AyqEi4TNtwMpDfCfpLfigI3imYDvuI8A\",\"AAIeAQGLhM23Ay+Ei4TNtwMuDfCfpLfigI3imYDvuI8A\"]',2147483647),(19,499,81,'[\"AAIeAQGLhM23AzSEi4TNtwMzDfCfpLfigI3imYDvuI8A\",\"AAIeAQGLhM23AzmEi4TNtwM4DfCfpLfigI3imYDvuI8A\"]',2147483647),(21,499,81,'[\"AAIeAQGLhM23Az6Ei4TNtwM9DfCfpLfigI3imYDvuI8A\",\"AAIeAQGLhM23A0OEi4TNtwNCDfCfpLfigI3imYDvuI8A\"]',2147483647),(23,499,81,'[\"AAIeAQGLhM23A0iEi4TNtwNHDfCfpLfigI3imYDvuI8A\",\"AAIeAQGLhM23A02Ei4TNtwNMDfCfpLfigI3imYDvuI8A\"]',2147483647),(25,499,81,'[\"AAIeAQGLhM23A1KEi4TNtwNRDfCfpLfigI3imYDvuI8A\",\"AAIeAQGLhM23A1eEi4TNtwNWDfCfpLfigI3imYDvuI8A\"]',2147483647),(27,499,81,'[\"AAIeAQGLhM23A1yEi4TNtwNbDfCfpLfigI3imYDvuI8A\"]',2147483647),(29,499,81,'[\"AAIeAQGLhM23A2GEi4TNtwNgDfCfpLfigI3imYDvuI8A\"]',2147483647),(31,499,81,'[\"AAIbAQGLhM23A2aHi4TNtwMAAwlwYXJhZ3JhcGgA\"]',2147483647);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_status`
--

LOCK TABLES `oc_user_status` WRITE;
/*!40000 ALTER TABLE `oc_user_status` DISABLE KEYS */;
INSERT INTO `oc_user_status` VALUES (1,'admin','away',1716446074,0,NULL,NULL,NULL,NULL,0,0);
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
INSERT INTO `oc_users` VALUES ('admin',NULL,'3|$argon2id$v=19$m=65536,t=4,p=1$ZnRjdUtZcTgxbElpQjAwZQ$EB0TlSbf3AoST65aryqOA+u25zWBAiRqy81qar/63XM','admin');
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

-- Dump completed on 2024-05-23  6:48:00
