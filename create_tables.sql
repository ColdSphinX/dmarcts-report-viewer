-- MySQL dump 10.16  Distrib 10.1.30-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: dmarcviewer
-- ------------------------------------------------------
-- Server version	10.1.30-MariaDB

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
-- Table structure for table `failure`
--

DROP TABLE IF EXISTS `failure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failure` (
  `serial` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `org` varchar(255) NOT NULL,
  `bouncedomain` varchar(255) DEFAULT NULL,
  `bouncebox` varchar(255) DEFAULT NULL,
  `fromdomain` varchar(255) DEFAULT NULL,
  `frombox` varchar(255) DEFAULT NULL,
  `arrival` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sourceip` int(10) unsigned DEFAULT NULL,
  `sourceip6` binary(16) DEFAULT NULL,
  `headers` text,
  `authres` text,
  PRIMARY KEY (`serial`),
  KEY `sourceip` (`sourceip`),
  KEY `fromdomain` (`fromdomain`),
  KEY `bouncedomain` (`bouncedomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `report` (
  `serial` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `maxdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `domain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `org` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reportid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_contact_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_adkim` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_aspf` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_p` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_sp` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_pct` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`serial`),
  UNIQUE KEY `domain` (`domain`,`reportid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rptrecord`
--

DROP TABLE IF EXISTS `rptrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rptrecord` (
  `serial` int(10) unsigned NOT NULL,
  `ip` int(10) unsigned DEFAULT NULL,
  `ip6` binary(16) DEFAULT NULL,
  `rcount` int(10) unsigned NOT NULL,
  `disposition` enum('none','quarantine','reject') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dkimdomain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dkimresult` enum('none','pass','fail','neutral','policy','temperror','permerror') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spfdomain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spfresult` enum('none','neutral','pass','fail','softfail','temperror','permerror') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spf_align` enum('fail','pass') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dkim_align` enum('fail','pass') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `identifier_hfrom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  KEY `serial` (`serial`,`ip`),
  KEY `serial6` (`serial`,`ip6`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPRESSED;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
