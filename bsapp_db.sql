CREATE DATABASE  IF NOT EXISTS `bsapp_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bsapp_db`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 65.2.82.9    Database: bsapp_db
-- ------------------------------------------------------
-- Server version	8.0.30-0ubuntu0.20.04.2

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
-- Table structure for table `ad_status_mast`
--

DROP TABLE IF EXISTS `ad_status_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad_status_mast` (
  `ad_status_id` int NOT NULL AUTO_INCREMENT,
  `ad_status` varchar(126) DEFAULT NULL,
  `ad_status_message` varchar(512) DEFAULT NULL,
  `ad_status_filter_name` varchar(256) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ad_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_status_mast`
--

LOCK TABLES `ad_status_mast` WRITE;
/*!40000 ALTER TABLE `ad_status_mast` DISABLE KEYS */;
INSERT INTO `ad_status_mast` VALUES (1,'IN PROGRESS','This ad is being processed and it will be live soon.','test filter','2022-07-19 09:31:11',NULL),(2,'Active','Your product is live foe selling.','Active Ads','2022-06-16 06:26:28',NULL),(3,'REJECTED','Your AD has some irrelevant information. Please edit it.','Rejected Ads','2022-06-16 06:27:14',NULL),(4,'Sponsored','Your product will reach the buyers faster than other sellers.','Sponsored Ads','2022-06-16 06:28:41',NULL),(5,'Deactivated','Your AD has been temporarily paused.','Deactive Ads','2022-06-16 06:30:07',NULL),(6,'Sold','This AD was marked as sold.','Sold Ads','2022-06-16 06:30:43',NULL),(7,'Expired','Your AD\'s termination date has surpassed its maximum.','Expired Ads','2022-06-16 06:31:28',NULL);
/*!40000 ALTER TABLE `ad_status_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_mast`
--

DROP TABLE IF EXISTS `ads_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_mast` (
  `ads_id` bigint NOT NULL,
  `inventory_id` int DEFAULT NULL,
    `user_id` varchar(126) DEFAULT NULL,
  `inventory_code` varchar(126) DEFAULT NULL,
  `inventory_type` varchar(126) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `ad_status_id` int DEFAULT NULL,
  `likes` int DEFAULT NULL,
  `views` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_mast`
--

LOCK TABLES `ads_mast` WRITE;
/*!40000 ALTER TABLE `ads_mast` DISABLE KEYS */;
INSERT INTO `ads_mast` VALUES (220722000025,81,5,'mobile_81','mobile','2022-07-22','2022-08-19',2,0,0,'2022-07-22 17:14:31',NULL),(220722000026,82,1,'mobile_82','mobile','2022-07-22','2022-08-19',2,0,0,'2022-07-22 17:18:18',NULL),(220722000027,14,1,'car_rent_14','car','2022-07-22','2022-08-19',2,0,0,'2022-07-22 17:20:23',NULL),(220722000028,102,1,'all_102','all','2022-07-22','2022-08-19',2,0,0,'2022-07-22 17:27:39',NULL),(220722000029,83,5,'mobile_83','mobile','2022-07-22','2022-08-19',2,0,0,'2022-07-22 17:37:22',NULL),(220722000030,103,145,'all_103','all','2022-07-22','2022-08-19',2,0,0,'2022-07-22 17:44:33',NULL),(220722000031,84,5,'mobile_84','mobile','2022-07-22','2022-08-19',2,0,0,'2022-07-22 17:53:31',NULL),(220723000001,85,5,'mobile_85','mobile','2022-07-23','2022-08-20',2,0,0,'2022-07-23 05:38:05','2022-07-28 16:32:56'),(220723000002,86,5,'mobile_86','mobile','2022-07-23','2022-08-20',2,0,0,'2022-07-23 05:42:02','2022-07-28 16:32:47'),(220723000003,87,5,'mobile_87','mobile','2022-07-23','2022-08-20',2,0,0,'2022-07-23 05:43:41','2022-07-28 16:32:36'),(220723000004,88,5,'mobile_88','mobile','2022-07-23','2022-08-20',2,0,0,'2022-07-23 05:45:09','2022-07-28 16:32:20'),(220723000005,9,4,'car_sell_9','car','2022-07-23','2022-08-20',2,0,0,'2022-07-23 05:54:51','2022-07-28 16:28:16'),(220723000006,10,4,'car_sell_10','car','2022-07-23','2022-08-20',3,0,0,'2022-07-23 05:54:57','2022-07-28 16:33:21'),(220723000007,89,5,'mobile_89','mobile','2022-07-23','2022-08-20',3,0,0,'2022-07-23 05:58:11','2022-07-28 16:33:30'),(220723000008,15,1,'car_rent_15','car','2022-07-23','2022-08-20',3,0,0,'2022-07-23 05:58:46','2022-07-28 16:33:39'),(220723000009,16,1,'car_rent_16','car','2022-07-23','2022-08-20',4,0,0,'2022-07-23 05:58:50','2022-07-28 16:33:51'),(220723000010,11,4,'car_sell_11','car','2022-07-23','2022-08-20',4,0,0,'2022-07-23 05:59:04','2022-07-28 16:34:00'),(220723000011,17,1,'car_rent_17','car','2022-07-23','2022-08-20',4,0,0,'2022-07-23 06:00:38','2022-07-28 16:34:08'),(220723000012,11,10,'office_11','office','2022-07-23','2022-08-20',4,0,0,'2022-07-23 06:02:12','2022-07-28 16:34:21'),(220723000013,12,10,'office_12','office','2022-07-23','2022-08-20',5,0,0,'2022-07-23 06:02:16','2022-07-28 16:34:30'),(220723000014,13,10,'office_13','office','2022-07-23','2022-08-20',5,0,0,'2022-07-23 06:40:48','2022-07-28 16:34:41'),(220723000015,11,1,'bike_11','bike','2022-07-23','2022-08-20',5,0,0,'2022-07-23 06:48:43','2022-07-28 16:34:48'),(220723000016,12,1,'bike_12','bike','2022-07-23','2022-08-20',6,0,0,'2022-07-23 06:49:00','2022-07-28 16:35:03'),(220723000017,13,1,'bike_13','bike','2022-07-23','2022-08-20',6,0,0,'2022-07-23 06:49:12','2022-07-28 16:35:10'),(220723000018,14,1,'bike_14','bike','2022-07-23','2022-08-20',6,0,0,'2022-07-23 07:11:28','2022-07-28 16:35:16'),(220723000019,15,1,'bike_15','bike','2022-07-23','2022-08-20',7,0,0,'2022-07-23 07:11:43','2022-07-28 16:35:26'),(220723000020,16,1,'bike_16','bike','2022-07-23','2022-08-20',7,0,0,'2022-07-23 07:16:35','2022-07-28 16:35:34'),(220723000021,6,3,'job_6','job','2022-07-23','2022-08-20',7,0,0,'2022-07-23 07:36:41','2022-07-28 16:35:43'),(220723000022,7,3,'job_7','job','2022-07-23','2022-08-20',7,0,0,'2022-07-23 07:36:47','2022-07-28 16:35:50'),(220723000023,8,3,'job_8','job','2022-07-23','2022-08-20',2,0,0,'2022-07-23 07:39:31',NULL),(220723000024,13,5,'property_sell_13','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 08:50:53',NULL),(220723000025,14,5,'property_sell_14','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 08:50:58',NULL),(220723000026,15,5,'property_sell_15','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 08:55:24',NULL),(220723000027,16,1,'property_rent_16','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 08:59:11',NULL),(220723000028,17,1,'property_rent_17','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 08:59:14','2022-07-31 04:33:58'),(220723000029,18,1,'property_rent_18','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 09:11:43',NULL),(220723000030,18,1,'car_rent_18','car','2022-07-23','2022-08-20',2,0,0,'2022-07-23 10:25:50',NULL),(220723000031,90,1,'mobile_90','mobile','2022-07-23','2022-08-20',2,0,0,'2022-07-23 10:25:59',NULL),(220723000032,104,1,'all_104','all','2022-07-23','2022-08-20',2,0,0,'2022-07-23 11:35:07',NULL),(220723000033,12,4,'car_sell_12','car','2022-07-23','2022-08-20',2,0,0,'2022-07-23 11:38:25',NULL),(220723000034,14,10,'office_14','office','2022-07-23','2022-08-20',2,0,0,'2022-07-23 11:41:55',NULL),(220723000035,17,1,'bike_17','bike','2022-07-23','2022-08-20',2,0,0,'2022-07-23 11:43:51',NULL),(220723000036,9,3,'job_9','job','2022-07-23','2022-08-20',2,0,0,'2022-07-23 11:54:29',NULL),(220723000037,19,5,'property_sell_19','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 11:58:03',NULL),(220723000038,20,1,'property_rent_20','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 11:59:48',NULL),(220723000039,105,125,'all_105','all','2022-07-23','2022-08-20',2,0,0,'2022-07-23 15:46:58',NULL),(220723000040,91,5,'mobile_91','mobile','2022-07-23','2022-08-20',2,0,0,'2022-07-23 17:00:00',NULL),(220723000041,92,5,'mobile_92','mobile','2022-07-23','2022-08-20',2,0,0,'2022-07-23 18:30:16',NULL),(220723000042,93,145,'mobile_93','mobile','2022-07-23','2022-08-20',2,0,0,'2022-07-23 19:15:38',NULL),(220723000043,94,145,'mobile_94','mobile','2022-07-23','2022-08-20',2,0,0,'2022-07-23 19:45:21',NULL),(220723000044,95,145,'mobile_95','mobile','2022-07-23','2022-08-20',2,0,0,'2022-07-23 19:45:53',NULL),(220723000045,106,145,'all_106','all','2022-07-23','2022-08-20',2,0,0,'2022-07-23 19:57:39',NULL),(220723000046,13,145,'car_sell_13','car','2022-07-23','2022-08-20',2,0,0,'2022-07-23 20:07:52',NULL),(220723000047,19,145,'car_rent_19','car','2022-07-23','2022-08-20',2,0,0,'2022-07-23 20:09:10',NULL),(220723000048,21,145,'property_sell_21','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 20:34:14',NULL),(220723000049,22,145,'property_sell_22','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 20:34:21',NULL),(220723000050,23,145,'property_sell_23','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 20:35:21',NULL),(220723000051,24,145,'property_sell_24','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 20:35:33',NULL),(220723000052,25,145,'property_sell_25','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 20:36:07',NULL),(220723000053,26,145,'property_sell_26','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 20:45:51',NULL),(220723000054,27,145,'property_sell_27','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 20:46:07',NULL),(220723000055,28,145,'property_sell_28','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 20:49:16',NULL),(220723000056,29,145,'property_sell_29','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 20:49:30',NULL),(220723000057,30,145,'property_sell_30','property','2022-07-23','2022-08-20',2,0,0,'2022-07-23 20:57:48',NULL),(220723000058,15,145,'office_15','office','2022-07-23','2022-08-20',2,0,0,'2022-07-23 20:58:41',NULL),(220724000001,96,125,'mobile_96','mobile','2022-07-24','2022-08-21',2,0,0,'2022-07-24 05:06:34',NULL),(220724000002,107,125,'all_107','all','2022-07-24','2022-08-21',2,0,0,'2022-07-24 05:08:14',NULL),(220724000003,97,5,'mobile_97','mobile','2022-07-24','2022-08-21',2,0,0,'2022-07-24 06:55:35',NULL),(220724000004,98,5,'mobile_98','mobile','2022-07-24','2022-08-21',2,0,0,'2022-07-24 07:41:37',NULL),(220724000005,99,125,'mobile_99','mobile','2022-07-24','2022-08-21',2,0,0,'2022-07-24 07:47:28',NULL),(220724000006,16,10,'office_16','office','2022-07-24','2022-08-21',2,0,0,'2022-07-24 09:10:59',NULL),(220724000007,17,10,'office_17','office','2022-07-24','2022-08-21',2,0,0,'2022-07-24 09:11:22',NULL),(220724000008,18,10,'office_18','office','2022-07-24','2022-08-21',2,0,0,'2022-07-24 09:18:42',NULL),(220724000009,19,1,'office_19','office','2022-07-24','2022-08-21',2,0,0,'2022-07-24 09:27:04',NULL),(220724000010,20,1,'office_20','office','2022-07-24','2022-08-21',2,0,0,'2022-07-24 09:33:01',NULL),(220724000011,21,1,'office_21','office','2022-07-24','2022-08-21',2,0,0,'2022-07-24 14:42:13',NULL),(220724000012,22,1,'office_22','office','2022-07-24','2022-08-21',2,0,0,'2022-07-24 14:42:32',NULL),(220724000013,23,145,'office_23','office','2022-07-24','2022-08-21',2,0,0,'2022-07-24 16:01:42',NULL),(220724000014,108,145,'all_108','all','2022-07-24','2022-08-21',2,0,0,'2022-07-24 16:02:21',NULL),(220724000015,31,145,'property_sell_31','property','2022-07-24','2022-08-21',2,0,0,'2022-07-24 16:03:34',NULL),(220724000016,32,145,'property_sell_32','property','2022-07-24','2022-08-21',2,0,0,'2022-07-24 16:04:56',NULL),(220724000017,33,145,'property_sell_33','property','2022-07-24','2022-08-21',2,0,0,'2022-07-24 16:10:47',NULL),(220724000018,34,145,'property_sell_34','property','2022-07-24','2022-08-21',2,0,0,'2022-07-24 18:34:52',NULL),(220724000019,35,145,'property_sell_35','property','2022-07-24','2022-08-21',2,0,0,'2022-07-24 18:38:31',NULL),(220724000020,36,145,'property_sell_36','property','2022-07-24','2022-08-21',2,0,0,'2022-07-24 18:39:29',NULL),(220724000021,24,145,'office_24','office','2022-07-24','2022-08-21',2,0,0,'2022-07-24 19:05:58',NULL),(220724000022,18,145,'comm_vehicle_18','commercial vehicle','2022-07-24','2022-08-21',2,0,0,'2022-07-24 19:06:45',NULL),(220725000001,109,125,'all_109','all','2022-07-25','2022-08-22',2,0,0,'2022-07-25 04:41:22',NULL),(220725000002,14,145,'car_sell_14','car','2022-07-25','2022-08-22',2,0,0,'2022-07-25 04:45:39',NULL),(220725000003,100,125,'mobile_100','mobile','2022-07-25','2022-08-22',2,0,0,'2022-07-25 04:45:46',NULL),(220725000004,101,125,'mobile_101','mobile','2022-07-25','2022-08-22',2,0,0,'2022-07-25 04:46:23',NULL),(220725000005,15,145,'car_sell_15','car','2022-07-25','2022-08-22',2,0,0,'2022-07-25 04:46:51',NULL),(220725000006,110,125,'all_110','all','2022-07-25','2022-08-22',2,0,0,'2022-07-25 04:47:12',NULL),(220725000007,16,125,'car_sell_16','car','2022-07-25','2022-08-22',2,0,0,'2022-07-25 04:49:57','2022-08-05 08:57:21'),(220725000008,17,125,'car_sell_17','car','2022-07-25','2022-08-22',2,0,0,'2022-07-25 04:53:33',NULL),(220725000009,102,125,'mobile_102','mobile','2022-07-25','2022-08-22',2,0,0,'2022-07-25 04:58:22',NULL),(220725000010,37,125,'property_sell_37','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 05:00:45',NULL),(220725000011,19,42,'comm_vehicle_19','commercial vehicle','2022-07-25','2022-08-22',2,0,0,'2022-07-25 05:38:31',NULL),(220725000012,20,42,'comm_vehicle_20','commercial vehicle','2022-07-25','2022-08-22',2,0,0,'2022-07-25 05:49:49',NULL),(220725000013,21,42,'comm_vehicle_21','commercial vehicle','2022-07-25','2022-08-22',2,0,0,'2022-07-25 05:51:43',NULL),(220725000014,22,42,'comm_vehicle_22','commercial vehicle','2022-07-25','2022-08-22',2,0,0,'2022-07-25 05:52:09',NULL),(220725000015,23,42,'comm_vehicle_23','commercial vehicle','2022-07-25','2022-08-22',2,0,0,'2022-07-25 05:53:19',NULL),(220725000016,24,42,'comm_vehicle_24','commercial vehicle','2022-07-25','2022-08-22',2,0,0,'2022-07-25 05:57:18',NULL),(220725000017,18,125,'car_sell_18','car','2022-07-25','2022-08-22',2,0,0,'2022-07-25 05:57:23',NULL),(220725000018,25,42,'comm_vehicle_25','commercial vehicle','2022-07-25','2022-08-22',2,0,0,'2022-07-25 05:58:43',NULL),(220725000019,103,5,'mobile_103','mobile','2022-07-25','2022-08-22',2,0,0,'2022-07-25 06:11:11',NULL),(220725000020,111,1,'all_111','all','2022-07-25','2022-08-22',2,0,0,'2022-07-25 06:15:44',NULL),(220725000021,112,1,'all_112','all','2022-07-25','2022-08-22',2,0,0,'2022-07-25 06:18:05',NULL),(220725000022,26,1,'bike_26','bike','2022-07-25','2022-08-22',2,0,0,'2022-07-25 06:19:48',NULL),(220725000023,20,1,'car_rent_20','car','2022-07-25','2022-08-22',2,0,0,'2022-07-25 06:22:45',NULL),(220725000024,19,4,'car_sell_19','car','2022-07-25','2022-08-22',2,0,0,'2022-07-25 06:24:02',NULL),(220725000025,10,3,'job_10','job','2022-07-25','2022-08-22',2,0,0,'2022-07-25 06:25:21',NULL),(220725000026,11,3,'job_11','job','2022-07-25','2022-08-22',2,0,0,'2022-07-25 06:27:59',NULL),(220725000027,104,5,'mobile_104','mobile','2022-07-25','2022-08-22',2,0,0,'2022-07-25 06:31:44',NULL),(220725000028,25,10,'office_25','office','2022-07-25','2022-08-22',2,0,0,'2022-07-25 06:33:01',NULL),(220725000029,12,3,'job_12','job','2022-07-25','2022-08-22',2,0,0,'2022-07-25 06:41:32',NULL),(220725000030,38,1,'property_rent_38','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 06:43:34','2022-08-01 07:51:39'),(220725000031,105,125,'mobile_105','mobile','2022-07-25','2022-08-22',2,0,0,'2022-07-25 08:22:08',NULL),(220725000032,39,145,'property_sell_39','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 10:12:03',NULL),(220725000033,40,145,'property_sell_40','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 10:17:59',NULL),(220725000034,41,145,'property_sell_41','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 10:18:22',NULL),(220725000035,42,145,'property_sell_42','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 10:19:48',NULL),(220725000036,43,145,'property_sell_43','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 10:19:58',NULL),(220725000037,44,5,'property_sell_44','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 10:22:46',NULL),(220725000038,45,145,'property_sell_45','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 10:22:58',NULL),(220725000039,46,145,'property_sell_46','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 10:23:40',NULL),(220725000040,47,145,'property_sell_47','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 10:23:48',NULL),(220725000041,48,145,'property_sell_48','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 10:23:56',NULL),(220725000042,49,145,'property_sell_49','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 10:24:07',NULL),(220725000043,50,145,'property_sell_50','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 10:28:17',NULL),(220725000044,51,145,'property_sell_51','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 10:31:16',NULL),(220725000045,106,5,'mobile_106','mobile','2022-07-25','2022-08-22',2,0,0,'2022-07-25 16:58:02',NULL),(220725000046,52,145,'property_sell_52','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 17:10:34',NULL),(220725000047,53,145,'property_sell_53','property','2022-07-25','2022-08-22',2,0,0,'2022-07-25 17:20:52',NULL),(220725000048,107,145,'mobile_107','mobile','2022-07-25','2022-08-22',2,0,0,'2022-07-25 18:38:15',NULL),(220725000049,113,145,'all_113','all','2022-07-25','2022-08-22',2,0,0,'2022-07-25 18:38:40',NULL),(220725000050,20,145,'car_sell_20','car','2022-07-25','2022-08-22',2,0,0,'2022-07-25 18:39:13',NULL),(220725000051,21,145,'car_rent_21','car','2022-07-25','2022-08-22',2,0,0,'2022-07-25 18:39:30',NULL),(220725000052,26,145,'office_26','office','2022-07-25','2022-08-22',2,0,0,'2022-07-25 18:39:53',NULL),(220725000053,13,145,'job_13','job','2022-07-25','2022-08-22',2,0,0,'2022-07-25 18:45:52',NULL),(220725000054,27,145,'bike_27','bike','2022-07-25','2022-08-22',2,0,0,'2022-07-25 18:50:22',NULL),(220725000055,114,145,'all_114','all','2022-07-25','2022-08-22',2,0,0,'2022-07-25 18:50:42',NULL),(220725000056,28,145,'comm_vehicle_28','commercial vehicle','2022-07-25','2022-08-22',2,0,0,'2022-07-25 18:51:42',NULL),(220725000057,29,145,'comm_vehicle_29','commercial vehicle','2022-07-25','2022-08-22',4,0,0,'2022-07-25 18:54:14','2022-07-30 22:15:08'),(220726000001,21,125,'car_sell_21','car','2022-07-26','2022-08-23',2,0,0,'2022-07-26 02:25:54',NULL),(220726000002,54,125,'property_sell_54','property','2022-07-26','2022-08-23',6,0,0,'2022-07-26 02:26:51','2022-07-30 21:18:09'),(220726000006,109,125,'mobile_109','mobile','2022-07-26','2022-08-23',2,0,0,'2022-07-26 11:08:17',NULL),(220726000007,116,125,'all_116','all','2022-07-26','2022-08-23',2,0,0,'2022-07-26 11:08:38',NULL),(220726000008,22,125,'car_sell_22','car','2022-07-26','2022-08-23',6,0,0,'2022-07-26 11:09:00','2022-07-30 22:23:35'),(220726000009,23,125,'car_sell_23','car','2022-07-26','2022-08-23',2,0,0,'2022-07-26 11:09:32','2022-07-30 22:24:04'),(220726000010,110,128,'mobile_110','mobile','2022-07-26','2022-08-23',2,0,0,'2022-07-26 14:39:01',NULL),(220726000011,117,128,'all_117','all','2022-07-26','2022-08-23',2,0,0,'2022-07-26 16:32:45',NULL),(220727000001,118,128,'all_118','all','2022-07-27','2022-08-24',2,0,0,'2022-07-27 12:26:53',NULL),(220727000002,119,NULL,'all_119','all','2022-07-27','2022-08-24',2,0,0,'2022-07-27 16:54:15',NULL),(220727000003,120,124,'all_120','all','2022-07-27','2022-08-24',2,0,0,'2022-07-27 16:55:02',NULL),(220727000004,121,124,'all_121','all','2022-07-27','2022-08-24',2,0,0,'2022-07-27 16:55:50',NULL),(220727000005,31,124,'bike_31','bike','2022-07-27','2022-08-24',2,0,0,'2022-07-27 17:29:34',NULL),(220728000001,122,125,'all_122','all','2022-07-28','2022-08-25',2,0,0,'2022-07-28 03:34:52','2022-08-01 02:46:50'),(220728000002,123,124,'all_123','all','2022-07-28','2022-08-25',2,0,0,'2022-07-28 17:49:53',NULL),(220728000003,111,124,'mobile_111','mobile','2022-07-28','2022-08-25',2,0,0,'2022-07-28 17:51:27',NULL),(220728000004,112,125,'mobile_112','mobile','2022-07-28','2022-08-25',2,0,0,'2022-07-28 17:51:30',NULL),(220728000005,124,125,'all_124','all','2022-07-28','2022-08-25',2,0,0,'2022-07-28 17:57:50',NULL),(220728000006,24,125,'car_sell_24','car','2022-07-28','2022-08-25',2,0,0,'2022-07-28 17:59:12','2022-08-01 04:26:30'),(220728000007,22,125,'car_rent_22','car','2022-07-28','2022-08-25',5,0,0,'2022-07-28 17:59:50','2022-07-31 05:52:35'),(220728000008,125,125,'all_125','all','2022-07-28','2022-08-25',6,0,0,'2022-07-28 18:00:13','2022-07-31 04:18:02'),(220728000009,55,125,'property_sell_55','property','2022-07-28','2022-08-25',5,0,0,'2022-07-28 18:01:43','2022-07-30 22:25:22'),(220728000010,56,125,'property_sell_56','property','2022-07-28','2022-08-25',5,0,0,'2022-07-28 18:02:25','2022-07-30 21:53:07'),(220728000011,27,125,'office_27','office','2022-07-28','2022-08-25',5,0,0,'2022-07-28 18:03:05','2022-07-30 21:41:49'),(220728000012,28,125,'office_28','office','2022-07-28','2022-08-25',5,0,0,'2022-07-28 18:03:51','2022-07-30 21:51:40'),(220728000013,14,125,'job_14','job','2022-07-28','2022-08-25',5,0,0,'2022-07-28 18:04:20','2022-07-30 21:42:56'),(220728000014,32,125,'bike_32','bike','2022-07-28','2022-08-25',6,0,0,'2022-07-28 18:04:58','2022-07-30 21:42:07'),(220728000015,33,125,'comm_vehicle_33','commercial vehicle','2022-07-28','2022-08-25',5,0,0,'2022-07-28 18:05:34','2022-07-31 05:45:03'),(220729000001,15,3,'job_15','job','2022-07-29','2022-08-26',2,0,0,'2022-07-29 07:50:10',NULL),(220729000002,16,3,'job_16','job','2022-07-29','2022-08-26',2,0,0,'2022-07-29 07:57:28',NULL),(220729000003,17,3,'job_17','job','2022-07-29','2022-08-26',2,0,0,'2022-07-29 08:09:44',NULL),(220729000004,113,125,'mobile_113','mobile','2022-07-29','2022-08-26',6,0,0,'2022-07-29 09:33:40','2022-07-30 21:25:31'),(220729000005,114,125,'mobile_114','mobile','2022-07-29','2022-08-26',6,0,0,'2022-07-29 12:34:00','2022-07-30 22:24:31'),(220729000006,115,125,'mobile_115','mobile','2022-07-29','2022-08-26',6,0,0,'2022-07-29 12:53:44','2022-07-30 21:06:48'),(220729000007,116,125,'mobile_116','mobile','2022-07-29','2022-08-26',6,0,0,'2022-07-29 12:55:40','2022-07-30 21:07:53'),(220730000001,18,125,'job_18','job','2022-07-30','2022-08-27',4,0,0,'2022-07-30 03:23:18','2022-07-30 22:15:48'),(220731000001,117,125,'mobile_117','mobile','2022-07-31','2022-08-28',5,0,0,'2022-07-31 05:56:40','2022-07-31 15:21:12'),(220731000002,126,125,'all_126','all','2022-07-31','2022-08-28',5,0,0,'2022-07-31 05:59:27','2022-07-31 12:45:32'),(220731000003,25,125,'car_sell_25','car','2022-07-31','2022-08-28',6,0,0,'2022-07-31 06:02:22','2022-07-31 12:45:15'),(220801000001,118,125,'mobile_118','mobile','2022-08-01','2022-08-29',2,0,0,'2022-08-01 04:56:36',NULL),(220801000002,26,125,'car_sell_26','car','2022-08-01','2022-08-29',2,0,0,'2022-08-01 04:57:19',NULL),(220801000003,57,125,'property_sell_57','property','2022-08-01','2022-08-29',2,0,0,'2022-08-01 05:08:12',NULL),(220801000005,29,125,'office_29','office','2022-08-01','2022-08-29',6,0,0,'2022-08-01 05:09:47','2022-08-02 09:40:33'),(220801000006,59,125,'property_sell_59','property','2022-08-01','2022-08-29',5,0,0,'2022-08-01 05:15:40','2022-08-02 09:40:27'),(220801000007,60,125,'property_sell_60','property','2022-08-01','2022-08-29',6,0,0,'2022-08-01 05:16:40','2022-08-02 09:32:23'),(220801000008,30,125,'office_30','office','2022-08-01','2022-08-29',5,0,0,'2022-08-01 05:18:02','2022-08-02 09:32:15'),(220801000009,19,125,'job_19','job','2022-08-01','2022-08-29',5,0,0,'2022-08-01 05:23:20','2022-08-02 09:30:56'),(220801000013,62,125,'property_sell_62','property','2022-08-01','2022-08-29',6,0,0,'2022-08-01 06:23:06','2022-08-02 15:30:19'),(220801000014,36,125,'bike_36','bike','2022-08-01','2022-08-29',6,0,0,'2022-08-01 06:47:22','2022-08-01 23:29:38'),(220801000015,20,125,'job_20','job','2022-08-01','2022-08-29',6,0,0,'2022-08-01 08:58:18','2022-08-01 23:21:14'),(220802000001,37,125,'bike_37','bike','2022-08-02','2022-08-30',6,0,0,'2022-08-02 06:45:45','2022-08-02 09:31:30'),(220802000002,38,125,'bike_38','bike','2022-08-02','2022-08-30',6,0,0,'2022-08-02 06:49:19','2022-08-02 09:30:59'),(220802000003,39,125,'bike_39','bike','2022-08-02','2022-08-30',6,0,0,'2022-08-02 07:02:25','2022-08-02 09:07:08'),(220802000004,63,125,'property_sell_63','property','2022-08-02','2022-08-30',5,0,0,'2022-08-02 07:02:46','2022-08-02 15:29:55'),(220802000005,21,125,'job_21','job','2022-08-02','2022-08-30',2,0,0,'2022-08-02 10:49:42','2022-08-02 15:52:17'),(220802000006,64,125,'property_sell_64','property','2022-08-02','2022-08-30',2,0,0,'2022-08-02 15:47:38','2022-08-02 15:52:06'),(220802000007,27,125,'car_sell_27','car','2022-08-02','2022-08-30',2,0,0,'2022-08-02 15:57:27','2022-08-04 13:49:48'),(220802000008,28,125,'car_sell_28','car','2022-08-02','2022-08-30',5,0,0,'2022-08-02 17:52:01','2022-08-04 11:51:08'),(220803000001,128,125,'all_128','all','2022-08-03','2022-08-31',6,0,0,'2022-08-03 15:31:12','2022-08-04 09:18:29'),(220805000001,129,125,'all_129','all','2022-08-05','2022-09-02',2,0,0,'2022-08-05 07:37:42',NULL),(220805000002,119,125,'mobile_119','mobile','2022-08-05','2022-09-02',2,0,0,'2022-08-05 09:00:17',NULL),(220805000003,29,125,'car_sell_29','car','2022-08-05','2022-09-02',2,0,0,'2022-08-05 09:07:45',NULL),(220805000004,120,125,'mobile_120','mobile','2022-08-05','2022-09-02',2,0,0,'2022-08-05 09:12:44',NULL),(220805000008,23,125,'car_rent_23','car','2022-08-05','2022-09-02',2,0,0,'2022-08-05 10:36:54',NULL),(220805000009,65,125,'property_sell_65','property','2022-08-05','2022-09-02',2,0,0,'2022-08-05 10:37:14',NULL),(220805000010,122,125,'mobile_122','mobile','2022-08-05','2022-09-02',2,0,0,'2022-08-05 10:43:11',NULL),(220805000011,131,125,'all_131','all','2022-08-05','2022-09-02',2,0,0,'2022-08-05 10:44:10',NULL),(220805000012,31,125,'car_sell_31','car','2022-08-05','2022-09-02',2,0,0,'2022-08-05 10:47:38',NULL),(220805000013,24,125,'car_rent_24','car','2022-08-05','2022-09-02',2,0,0,'2022-08-05 10:49:44',NULL),(220805000014,132,125,'all_132','all','2022-08-05','2022-09-02',2,0,0,'2022-08-05 10:51:22',NULL),(220805000015,66,125,'property_sell_66','property','2022-08-05','2022-09-02',2,0,0,'2022-08-05 10:55:14',NULL),(220805000016,31,125,'office_31','office','2022-08-05','2022-09-02',2,0,0,'2022-08-05 10:57:28',NULL),(220805000017,67,125,'property_sell_67','property','2022-08-05','2022-09-02',2,0,0,'2022-08-05 11:15:05',NULL),(220805000018,68,125,'property_sell_68','property','2022-08-05','2022-09-02',2,0,0,'2022-08-05 11:21:40',NULL),(220805000019,40,125,'bike_40','bike','2022-08-05','2022-09-02',2,0,0,'2022-08-05 11:34:35',NULL),(220805000020,41,125,'comm_vehicle_41','commercial vehicle','2022-08-05','2022-09-02',2,0,0,'2022-08-05 11:35:10',NULL),(220805000021,42,125,'comm_vehicle_42','commercial vehicle','2022-08-05','2022-09-02',2,0,0,'2022-08-05 11:39:30',NULL),(220808000001,69,125,'property_sell_69','property','2022-08-08','2022-09-05',2,0,0,'2022-08-08 06:10:33',NULL);
/*!40000 ALTER TABLE `ads_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_sequence_mast`
--

DROP TABLE IF EXISTS `ads_sequence_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_sequence_mast` (
  `seq_date` date NOT NULL,
  `seq_id` bigint NOT NULL,
  PRIMARY KEY (`seq_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_sequence_mast`
--

LOCK TABLES `ads_sequence_mast` WRITE;
/*!40000 ALTER TABLE `ads_sequence_mast` DISABLE KEYS */;
INSERT INTO `ads_sequence_mast` VALUES ('2022-07-21',220721000005),('2022-07-22',220722000031),('2022-07-23',220723000058),('2022-07-24',220724000022),('2022-07-25',220725000057),('2022-07-26',220726000011),('2022-07-27',220727000005),('2022-07-28',220728000015),('2022-07-29',220729000007),('2022-07-30',220730000001),('2022-07-31',220731000003),('2022-08-01',220801000016),('2022-08-02',220802000008),('2022-08-03',220803000001),('2022-08-05',220805000021),('2022-08-08',220808000001);
/*!40000 ALTER TABLE `ads_sequence_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `all_inventory_mast`
--

DROP TABLE IF EXISTS `all_inventory_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_inventory_mast` (
  `all_inventory_id` int NOT NULL,
    `user_id` varchar(126) DEFAULT NULL,
  `all_inventory_code` varchar(126) DEFAULT NULL,
  `inventory_type` varchar(126) DEFAULT 'all',
  `cat_id` int DEFAULT NULL,
  `sub_cat_id` int DEFAULT NULL,
  `title` varchar(126) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `picture_link_1` varchar(512) DEFAULT NULL,
  `picture_link_2` varchar(512) DEFAULT NULL,
  `picture_link_3` varchar(512) DEFAULT NULL,
  `picture_link_4` varchar(512) DEFAULT NULL,
  `picture_link_5` varchar(512) DEFAULT NULL,
  `picture_link_6` varchar(512) DEFAULT NULL,
  `picture_link_7` varchar(512) DEFAULT NULL,
  `picture_link_8` varchar(512) DEFAULT NULL,
  `picture_link_9` varchar(512) DEFAULT NULL,
  `picture_link_10` varchar(512) DEFAULT NULL,
  `show_mo_no` tinyint DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `location` varchar(512) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`all_inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `all_inventory_mast`
--

LOCK TABLES `all_inventory_mast` WRITE;
/*!40000 ALTER TABLE `all_inventory_mast` DISABLE KEYS */;
INSERT INTO `all_inventory_mast` VALUES (1,1,'all_1','all',4,3,'Samsung charger',380,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652508048/gam9uwyfgw4nrqw6rp5t.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Mobile charger with fast charging','surat',21.27023100,70.67279600,'2022-05-14 06:00:48',NULL),(2,1,'all_2','all',4,3,'boAt Airpods',1250,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652508143/q1zkvdyj5vajs4aej06f.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'boAt Airpods with good sound quality','surat',20.62181300,78.94652300,'2022-05-14 06:02:23',NULL),(3,1,'all_3','all',4,3,'Samsung 100cm Data cable',150,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652508260/cq2vtai3tggqbqk96coy.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Samsung 100cm Data cable','surat',20.62181300,78.94652300,'2022-05-14 06:04:20',NULL),(4,1,'all_4','all',5,6,'fuel injection',7500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652521468/exlq3h8ed0vnwbo1lppa.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Honda Fuel injection','surat',20.62181300,78.94652300,'2022-05-14 09:44:28',NULL),(5,1,'all_5','all',5,6,'Gear Lever',390,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652521633/pmwmdobli5u42y4yndwf.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Maruti Gear lever','surat',20.62181300,78.94652300,'2022-05-14 09:47:14',NULL),(6,1,'all_6','all',5,6,'car hood',4700,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652521779/d0ikqslmdaht0mx79yel.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Car hood','surat',20.62181300,78.94652300,'2022-05-14 09:49:40',NULL),(7,1,'all_7','all',4,3,'Accessories 11',1550,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652694744/mtclp4otggf77edvuwvb.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652694745/nvyhmpldhy6vkfoaxfnb.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652694747/j0nd0wdgurrcyjvx2lwd.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652694748/jmjgdrkgvbvl8otzmrpd.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652694750/csyz3jzvgcaqklw7zlrf.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652694751/h1ltvemuhvkwtixvf1yj.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652694753/tyrrb8mth9vufbcxkytm.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652694754/nzwm8faexpmar8qafpnp.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652694756/l2vucml5hhimcskjldq2.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652694758/wriynqpfddwj36ca0akz.jpg',1,'Descritpion for accessoiry & mobile app test....!','Vesu surat,Gujarat',20.62181300,78.94652300,'2022-05-16 09:52:38',NULL),(8,1,'all_8','all',4,3,'Accresory two',5200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652772356/lpx9blxyuifburpwxmxl.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772358/lgi604udluowbs8gxagi.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772360/stdbn3vhbpefrrckx7a8.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772361/hucpxfvrme8ufkxqfkyz.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772362/hxo1iw0dxsvl02vodfe1.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772364/cx1tb9ev6yyknz7rgt9t.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772366/dvqi6xcmngrwjb54e0si.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772367/ftygombnr6pcj6bjiug5.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772369/bcjhljq45btbhztnqebv.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772370/enskvkg4x5teg3mzufi0.jpg',1,'Test Description for mobile items....!','Vesu surat,Gujarat',20.62181300,78.94652300,'2022-05-17 07:26:11',NULL),(9,1,'all_9','all',4,3,'Pokemon',2553,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652772480/zpe4ax3gcxto3ro0eumv.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772483/yqnq3zj4vcn7gvlhorwp.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772487/bcmuvhwnvxyo37vj9itd.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772490/z4tptdbzbrqdybaj8hbj.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772492/b6muylsftw0umfwiqp6q.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772494/f6kbxlgxf6fuv2vhwpk1.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772497/egl9o3mo5o7uxnw4ze5e.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772500/nu9xnfd59pqu7zkloyqn.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772502/monxg0jxabjm2ue262ea.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1652772506/kqwm3depuhkx2lykkvn0.jpg',1,'Top test demo ....!!!!','Vesu surat,Gujarat',20.62181300,78.94652300,'2022-05-17 07:28:27',NULL),(10,1,'all_10','all',5,5,'title',2000,NULL,NULL,NULL,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1655879305/woy73rbac6d6yfrsbvqi.jpg',NULL,NULL,NULL,1,'description','surat',12.23650000,78.25580000,'2022-06-22 06:28:25',NULL),(11,1,'all_11','all',5,5,'title',3000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656410648/idodokxfqpuxt2ldqlif.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'description','vadodara',22.30720000,73.18120000,'2022-06-28 10:04:08',NULL),(12,1,'all_12','all',5,5,'title',4000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656411397/okylws5hsdjbk0lbex3c.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo ','kamrej',21.26950000,72.95770000,'2022-06-28 10:16:37',NULL),(13,1,'all_13','all',4,4,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658398484/lp5wjps6zuhnbdzcnb6i.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Ahemdabad',23.02250000,72.57140000,'2022-06-28 10:41:03','2022-07-21 10:14:44'),(20,1,'all_20','all',5,5,'title',2000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656485515/pgnotm2w4eksssjkmvdh.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'description','surat',12.23650000,78.25580000,'2022-06-29 06:51:55',NULL),(21,5,'all_21','all',5,5,'title',2000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656496511/eog1kkfqedday3topcwc.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'description','surat',12.23650000,78.25580000,'2022-06-29 09:55:11',NULL),(22,1,'all_22','all',4,3,'demovgyuhjknm, ',4567,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656534269/orai1zywsyxj7jbprezf.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'gdfchvjbkl','n nmkl',12.23650000,78.25580000,'2022-06-29 20:24:30',NULL),(25,1,'all_25','all',4,3,'mobile charger',250,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656572782/omchoob5sav5qx9doki0.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'hello I am sending you ','vesu,surat',12.23650000,78.25580000,'2022-06-30 07:06:22',NULL),(26,1,'all_26','all',5,6,'car accessories',15000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656572884/qn7gly0ghssgybxzwckv.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'to connect with you and ','bhatar,surat',12.23650000,78.25580000,'2022-06-30 07:08:04',NULL),(27,1,'all_27','all',4,3,'ford endeavour',2500000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656582267/s4wigckmfrr0d0nsp6kl.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'to connect with you and ','delhi',12.23650000,78.25580000,'2022-06-30 09:44:27',NULL),(28,1,'all_28','all',4,3,'bungalow 4Bhk',2564000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656586307/pxjivtexomuraxx7j7ey.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'to connect with you and ','mumbai',12.23650000,78.25580000,'2022-06-30 10:51:48',NULL),(29,1,'all_29','all',4,3,'iphone 13 256Gb',700000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656586545/eweepbd10enbhjseaqz4.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'to connect with you and ','Ahmedabad',12.23650000,78.25580000,'2022-06-30 10:55:46',NULL),(30,1,'all_30','all',4,3,'It job development',250000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656597642/dqsg994pznzibqkviwci.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'to connect with you and ','Mumbai',12.23650000,78.25580000,'2022-06-30 14:00:42',NULL),(31,1,'all_31','all',4,3,'he\'ll be in ',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656655758/i4xmqid0uadducn7hkbh.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make ','surqt',12.23650000,78.25580000,'2022-07-01 06:09:18',NULL),(32,1,'all_32','all',5,5,'red mi',23850,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657017719/jot6qlichsxlkur7iges.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1657017720/j5eymdggb4d97vkosc2m.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1657017721/aza6ytscfugiy8e9rkcp.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Das','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-05 10:42:02',NULL),(33,1,'all_33','all',5,5,'test',2358,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657018016/xbeynkaluftc5oluqxrr.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Qegvxs decades','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-05 10:46:57',NULL),(34,1,'all_34','all',5,5,'cable',200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657020079/lymhvj3s8iqdyjbkcvhx.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Dasdsadsadv','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-05 11:21:19',NULL),(35,1,'all_35','all',5,5,'cable ',1273,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657020532/v5tjaigchc1xhryyk8gd.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Sdws','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-05 11:28:52',NULL),(36,1,'all_36','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658473260/f7cncbsnlyq16otbc3c5.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Ahemdabad',23.02250000,72.57140000,'2022-07-05 11:34:14','2022-07-22 07:01:00'),(37,1,'all_37','all',5,5,'Ada',400,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657020947/fea4kvuz6jafg9fnwv9f.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Are fs','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-05 11:35:47',NULL),(38,1,'all_38','all',5,5,'Bettry',1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657021250/j2gzuegndogldbrdw8q0.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Hrdhbdr ','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-05 11:40:51',NULL),(39,1,'all_39','all',5,5,'one plus cabel',3400,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657022559/txnyhrj2wm5xtkswvngq.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Feeders cwaswdwa','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-05 12:02:40',NULL),(40,1,'all_40','all',5,5,'Samsung cable',654,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657022706/tjodugwt2txzorrmtgsl.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1657022708/bqqpzky3auuqtmva5xhg.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Wades ','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-05 12:05:08',NULL),(41,1,'all_41','all',5,5,'aaaaa',1515,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657023922/xupeuhkgakqoyvyhj4h6.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1657023925/iqxcp9voz0txy5oh9ebn.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Aaaa','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-05 12:25:25',NULL),(42,1,'all_42','all',4,4,'Title ',10000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657188383/dtqlmb9lumhpkrjp8lda.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo ahemdabad','Ahemdabad',23.02250000,72.57140000,'2022-07-07 10:06:24',NULL),(43,1,'all_43','all',4,3,'Samsung charger',2300,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657191124/epkyan6izzebtuyy6dwx.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Charger is available','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-07 10:52:05',NULL),(44,1,'all_44','all',4,3,'one plus bettery',2450,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657193494/shbegrz6hxqau4pcvhpy.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Fed ghoul hug','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-07 11:31:34',NULL),(45,125,'all_45','all',4,3,'mobile accessories',599,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657540482/ficoa4usvfdtwx3ehi2d.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'best products mobile','Vesu, Surat',72.78005080,21.14187010,'2022-07-11 11:54:42',NULL),(46,125,'all_46','all',4,3,'how to make sure ',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657540643/c8fik2up7tdxsk6sanb2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you ','Vesu, Surat',72.78005080,21.14187010,'2022-07-11 11:57:24',NULL),(47,1,'all_47','all',4,3,'Khushali Testing',87986,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657540724/ozerfq6snyhf6yd7uzn5.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Khushali Testing','Surat',20.62191300,78.94652400,'2022-07-11 11:58:44',NULL),(48,125,'all_48','all',4,3,'he\'ll be in the ',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657556238/mn7xr078wmo10wkvudue.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'he\'ll be in the task ','Vesu, Surat',72.78005080,21.14187010,'2022-07-11 16:17:19',NULL),(49,125,'all_49','all',4,3,'HELLO I am sending you the ',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657556279/kqy5ofcihlbnesdteqnt.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Hello Kitty and I will be ','Vesu, Surat',72.78005080,21.14187010,'2022-07-11 16:17:59',NULL),(50,143,'all_50','all',4,3,'demo accessories',15000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657557291/swjff7znoi82t1pmr2ef.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo data description.','Sardar Nagar, Bhavnagar',72.15359390,21.75263230,'2022-07-11 16:34:51',NULL),(51,143,'all_51','all',4,3,'demo 10:7 today',1233,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657557473/puteppwvxkpsfrhfj1ry.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo data added in today','Sardar Nagar, Bhavnagar',72.15359390,21.75263230,'2022-07-11 16:37:54',NULL),(52,125,'all_52','all',4,3,'hello I am sending you ',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657557811/tqjnuhcspleozgpnryp8.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'he\'ll be in the task ','Vesu, Surat',72.83516167,21.15307000,'2022-07-11 16:43:32',NULL),(53,143,'all_53','all',4,3,'Demo data 10:13 today',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657557823/upkpgphyt3n3pgucwzsw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Demo dtaa added','Sardar Nagar, Bhavnagar',72.15359390,21.75263230,'2022-07-11 16:43:43',NULL),(54,125,'all_54','all',4,3,'He was a temporary server ',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657610692/pkxpxwpigscdfhq2shzd.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are ','Vesu, Surat',72.78014240,21.14183410,'2022-07-12 07:24:53',NULL),(55,1,'all_55','all',4,3,'Samsung galaxy charger',2000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657729254/qk7rowuexqw6pgoqb3te.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1657729255/lyk9czywvqqzq6yxcjkh.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Charger is sell ','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-13 16:20:56',NULL),(56,1,'all_56','all',4,3,'one plus+ bettry',234,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657729772/jh0v2cjsfit8onyoyrz5.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Bettry is available ','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-13 16:29:34',NULL),(57,1,'all_57','all',4,3,'realme 10 pro',1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657730466/pj6wsjm5glrmnbbvxmkq.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1657730467/bai5ebsbyutosw3w3jke.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Sa dghwgdw dwqsw','Mumbai, MH, India',19.01761470,72.85616440,'2022-07-13 16:41:08',NULL),(58,145,'all_58','all',4,3,'demo dara ghvj',53467,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657821044/edhayqf99qciu27vnrtc.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'fgchvjbn mvguyhkjnm vgjb','Udhana, Surat',72.83106070,21.17024380,'2022-07-14 17:50:45',NULL),(59,145,'all_59','all',4,3,'hjgtyfrcdv njuihgjbgvn ',435678,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657822736/hoahhg34qmslfzqcjjrm.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'tyfughijknm bvcghjknm vghjknm ','Udhana, Surat',72.83106070,21.17024380,'2022-07-14 18:18:57',NULL),(60,146,'all_60','all',4,3,'how to make sure you ',25800,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657828485/tgsh9t0yb5qoyzcwgbrl.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are ','Vesu, Surat',72.78023100,21.14188800,'2022-07-14 19:54:45',NULL),(61,146,'all_61','all',4,3,'how to make sure you ',25555,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657888382/s5mjsgrshukwbtukpbqc.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you ','Vesu, Surat',72.78005080,21.14187010,'2022-07-15 12:33:02',NULL),(62,145,'all_62','all',4,3,'demo data fh',123344,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657892919/v7efzhdxprcfud0kfpeu.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2qgbc gm51m56j 6b','Udhana, Surat',72.83106070,21.17024380,'2022-07-15 13:48:39',NULL),(63,145,'all_63','all',4,3,'demo data fh',123344,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657892926/rosqd6bq9mxwm2il75lk.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'2qgbc gm51m56j 6b','Udhana, Surat',72.83106070,21.17024380,'2022-07-15 13:48:47',NULL),(64,145,'all_64','all',4,3,'edrbgf hytfg hjtyfj',521520,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657895446/ci7cqu0dpet3pgbg5emu.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'c,mk BN b have just just just ','Udhana, Surat',72.83106070,21.17024380,'2022-07-15 14:30:46',NULL),(65,145,'all_65','all',4,3,'sedfesw grgresdg r',152000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657895845/dx6cukiwpsdiboolm3ab.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,' jmjn just jbjb jnbh just just hnhj','Udhana, Surat',72.83106070,21.17024380,'2022-07-15 14:37:26',NULL),(66,145,'all_66','all',4,3,'demo data all rpduct ',1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657896115/cjbpycsg7vqaqhb2dsg5.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo data aded','Udhana, Surat',72.83106070,21.17024380,'2022-07-15 14:41:56',NULL),(67,5,'all_67','all',15,69,'dadsadasdas',212,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658159228/ipofme3m22hn5x5tw640.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',1,'1212121212','1212121',21.19434240,72.82688000,'2022-07-18 15:47:08',NULL),(68,5,'all_68','all',10,46,'dadsadasdas',212,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658159245/lfzie9b3n0wu5kyb6gcr.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',1,'1212121212','1212121',21.19434240,72.82688000,'2022-07-18 15:47:26',NULL),(69,145,'all_69','all',4,3,'demokjhb nm',456,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658176652/ulgm2xm2kzxrrxhjjfgy.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'kjnlm , hi njkhbj nmmnjkhb m','Udhana, Surat',72.83106070,21.17024380,'2022-07-18 20:37:33',NULL),(70,125,'all_70','all',4,3,'how to make sure you ',2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658323046/xguarudyzcuzapkphl7t.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you ','Vesu, Surat',72.78023760,21.14186090,'2022-07-20 13:17:27',NULL),(71,1,'all_71','all',4,4,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658399710/tvfpmw45v8qpvpt727do.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Ahemdabad',23.02250000,72.57140000,'2022-07-21 10:19:45','2022-07-21 10:35:10'),(72,1,'all_72','all',4,4,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658399802/d5ihjf99bxdwdvtb9gb3.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Ahemdabad',23.02250000,72.57140000,'2022-07-21 10:36:42',NULL),(73,1,'all_73','all',4,4,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658400270/fpyaenaoljd5iqya1rae.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Ahemdabad',23.02250000,72.57140000,'2022-07-21 10:44:30',NULL),(74,1,'all_74','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658489336/t7bnycdmymjzgbbgqeyw.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-21 10:51:57','2022-07-22 11:28:56'),(76,1,'all_76','all',4,4,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658402513/waqbrpiyaukdomat2ti1.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Ahemdabad',23.02250000,72.57140000,'2022-07-21 11:21:53',NULL),(77,1,'all_77','all',4,4,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658402815/w8edhvakxczhjcecyucr.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Ahemdabad',23.02250000,72.57140000,'2022-07-21 11:26:55',NULL),(78,1,'all_78','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658473268/fkvxgx9dvfnkjbmgmw2i.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Ahemdabad',23.02250000,72.57140000,'2022-07-22 07:01:08',NULL),(79,1,'all_79','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658480952/lzznwsklhhzx6tg2g7mp.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Ahemdabad',23.02250000,72.57140000,'2022-07-22 09:09:13',NULL),(80,125,'all_80','all',4,3,'how to make sure you are ',2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658483706/bz8auwkwtr36nmijjsxq.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-22 09:55:06',NULL),(81,125,'all_81','all',5,6,'how to make sure you are ',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658483827/xjbdtzwioaydmibwis1a.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-22 09:57:08',NULL),(82,125,'all_82','all',8,25,'how to make sure you are ',2,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658484118/gnzjhbyvpq4nexxsf7u0.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-22 10:01:58',NULL),(83,125,'all_83','all',8,33,'how to make sure you are ',2,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658484142/jeq7zozibnw1ji8zlb9l.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-22 10:02:23',NULL),(84,125,'all_84','all',9,41,'how to make sure you are ',2,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658484249/hunukg9dj8ujuw3exnxy.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-22 10:04:09',NULL),(85,125,'all_85','all',9,42,'how to make sure you are ',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658484271/focivbghpgt3nqlktnnc.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-22 10:04:32',NULL),(86,125,'all_86','all',10,43,'how to make sure you are ',2,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658485644/ywvlmymzubrm1lncrrqs.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-22 10:27:25',NULL),(87,125,'all_87','all',11,53,'how to make sure you are ',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658485738/gxwdvpobkdfbxhdvvtcj.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-22 10:28:59',NULL),(88,125,'all_88','all',12,54,'how to make sure you are ',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658485765/gpy4v2nzn2mjvvkkhpzb.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-22 10:29:26',NULL),(89,125,'all_89','all',13,58,'how to make sure you are ',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658485785/mzqa0rqkr6my7w2d3vue.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-22 10:29:45',NULL),(90,125,'all_90','all',15,69,'how to make sure you are ',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658485808/axzznov8s2hkzethglnl.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-22 10:30:08',NULL),(91,1,'all_91','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658485912/avcofiywgdkos5zrwqbk.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Ahemdabad',23.02250000,72.57140000,'2022-07-22 10:31:53',NULL),(92,1,'all_92','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658486038/n2mnaqbk8l1zqqowqiqm.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Ahemdabad',23.02250000,72.57140000,'2022-07-22 10:33:58',NULL),(93,1,'all_93','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658486620/q6yg3vmlkowmzkbwusj7.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Ahemdabad',23.02250000,72.57140000,'2022-07-22 10:43:41',NULL),(94,1,'all_94','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658489340/ekpozbkcn9be19f7wboj.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-22 10:45:31','2022-07-22 11:29:01'),(95,1,'all_95','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658487549/quttdi1dxlcycwxzcxua.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-22 10:59:10',NULL),(96,1,'all_96','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658487588/mzbtv6xad2ww2kucilnv.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-22 10:59:49',NULL),(97,1,'all_97','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658487710/uiisqfsxxakyaowpbgaw.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-22 11:01:51',NULL),(98,1,'all_98','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658489347/mownef6iszgx9sqyjhpz.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-22 11:29:07',NULL),(99,1,'all_99','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658489384/cpsfme13pazgioilrmvw.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-22 11:29:45',NULL),(100,1,'all_100','all',5,5,'Title ',10000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658494135/cdlhgubp15245d9ervfm.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-22 12:48:56',NULL),(101,1,'all_101','all',5,5,'Title ',10000,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658509418/q9op9ngnreqplbqqyh2w.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-22 17:03:38',NULL),(102,1,'all_102','all',4,4,'Title ',10000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658510859/ijin80g8jlq2aw9dtg2i.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo ahemdabad','Ahemdabad',23.02250000,72.57140000,'2022-07-22 17:27:39',NULL),(103,145,'all_103','all',4,3,'Mobile Battery',1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658511872/aexkingma3tf1emqg6rx.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'100% gutternty available','Udhana, Surat',72.83106070,21.17024380,'2022-07-22 17:44:33',NULL),(104,1,'all_104','all',4,4,'Title ',10000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658576107/lh2kb8ephig1siqeihed.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo ahemdabad','Ahemdabad',23.02250000,72.57140000,'2022-07-23 11:35:07',NULL),(105,125,'all_105','all',4,3,'fngkvkvkvmvmv',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658591218/wmbdnzk5zj9yrfixvlad.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'gjfjvmvkvkvl','Vesu, Surat',72.78015750,21.14161140,'2022-07-23 15:46:58',NULL),(106,145,'all_106','all',4,3,'demo accessories',1500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658606259/n2jlax4c54ggwkhelghs.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo description of the day','Udhana, Surat',72.83106070,21.17024380,'2022-07-23 19:57:39',NULL),(107,125,'all_107','all',4,3,'how to make sure ',2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658639293/g3ee7u7bh8kxygoldhxf.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you ','Udhana, Surat',21.15318000,72.83492000,'2022-07-24 05:08:14',NULL),(108,145,'all_108','all',4,3,'chg vbnkiuygjhv bnkhjbn ',4567,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658678541/xvyyixfsd7pvnntrpq97.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'hjb nkiujh juhj iujhbjh m','Udhana, Surat',21.17024000,72.83106000,'2022-07-24 16:02:21',NULL),(109,125,'all_109','all',4,3,'how to make sure ',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658724082/xvzcrykikuwj0nnxmnna.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you ','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 04:41:22',NULL),(110,125,'all_110','all',4,3,'how to make sure you are',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658724431/wzypbunfsoqlogla1sxw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you are','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 04:47:12',NULL),(111,1,'all_111','all',5,5,'Title ',10000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658729870/cpjtbppviojq3sabe3zo.png',NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658729872/r05jdlmjudcdrgpl6rhr.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-25 06:15:44','2022-07-25 06:17:53'),(112,1,'all_112','all',5,5,'Title ',10000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658729890/va3w5ekdoii99jmq4nra.png',NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658729892/kqbw1d3f6hcts5oaq0gr.png',NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-25 06:18:05','2022-07-25 06:18:13'),(113,145,'all_113','all',4,3,'svsfv 5 2 efs',3224352,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658774319/kmpmbs7owtzvsqbzvzfb.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'vsdvsd. SF. SF. vs','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 18:38:40',NULL),(114,145,'all_114','all',10,43,'wvsdf b dvc',2345,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658775042/ghtuloq8v1zkiwr5xhi0.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'rf3wevrdf vbdwdefvd','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 18:50:42',NULL),(115,125,'all_115','all',8,28,'vjvkgkgkhiho',255,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658833434/ge8vogxexfeirsfsfzid.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'hihinkniniji','Vesu, Surat',0.00000000,0.00000000,'2022-07-26 11:03:55',NULL),(116,125,'all_116','all',4,3,'how to make sure you y',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658833717/shzcvvirky85xyyhudvb.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you y','Vesu, Surat',0.00000000,0.00000000,'2022-07-26 11:08:38',NULL),(117,128,'all_117','all',4,3,'how to make sure you y',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658853164/tgs1wuygukmkcj0lhrwc.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you y','Vesu, Surat',0.00000000,0.00000000,'2022-07-26 16:32:45',NULL),(118,128,'all_118','all',12,55,'rrfhlbjchvhvjvkgu',25555555,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658924812/wt72ucysginfdgy5umst.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'gjguvjgjvkb','Vesu, Surat',0.00000000,0.00000000,'2022-07-27 12:26:53',NULL),(119,NULL,'all_119','all',NULL,NULL,'car all Title',5145,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658940855/jm67hbdfa7ygpsetbcqf.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'demo surat','Surat',23.02250000,72.57140000,'2022-07-27 16:54:15',NULL),(120,124,'all_120','all',5,5,'car all Title',5145,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658940902/ylemvbuorzjvq8zaeixc.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-27 16:55:02',NULL),(121,124,'all_121','all',5,5,'car all Title',5145,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658940950/ugh64zfo2yn46xjinntu.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-27 16:55:50',NULL),(122,125,'all_122','all',4,3,'mehul Rathod',2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658979292/n7nc00srphy93swq1rky.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'he\'ll be in the task of','Udhana, Surat',0.00000000,0.00000000,'2022-07-28 03:34:52',NULL),(123,124,'all_123','all',5,5,'car all Title',48741,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659030592/epkuk522qb68x38kchaa.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo surat','Surat',23.02250000,72.57140000,'2022-07-28 17:49:53',NULL),(124,125,'all_124','all',4,3,'mobile accessories',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659031070/qy89qpnurqyvzt4wryr2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Take a look at this ViewSonic 23.8 inch Full HD LED Backlit IPS Panel High viewing Angle Monitor (VA2418-SH) on Flipkart\nhttps://dl.flipkart.com/s/ezIxMINNNN','Vesu, Surat',0.00000000,0.00000000,'2022-07-28 17:57:50',NULL),(125,125,'all_125','all',5,6,'car accessories',2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659031212/gotzhajepzj2hjakvb80.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'Take a look at this ViewSonic 23.8 inch Full HD LED Backlit IPS Panel Hig','Vesu, Surat',0.00000000,0.00000000,'2022-07-28 18:00:13',NULL),(126,125,'all_126','all',4,3,'mobile accessories 31',25589,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659247166/bxkz60viqigwkcylbfxg.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you','Udhana, Surat',0.00000000,0.00000000,'2022-07-31 05:59:27',NULL),(127,125,'all_127','all',4,3,'010101 texting',10104040,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659359520/sshkdlucgbja8ja9oxfm.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you','Vesu, Surat',0.00000000,0.00000000,'2022-08-01 13:12:00',NULL),(128,125,'all_128','all',4,3,'how to make sure you',25555,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659540664/kxclng8zbjp9gyt8p9bs.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1659540666/wqpmtdzb7ihtmzznzyqi.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1659540668/bmxk86bksey787pmyui0.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1659540669/z1lhqxs8asodggz2eml1.png','http://res.cloudinary.com/mr-group-tech/image/upload/v1659540672/q74hozvor99hx2we3tic.jpg',NULL,NULL,NULL,NULL,NULL,0,'how to make sure you','Vesu, Surat',0.00000000,0.00000000,'2022-08-03 15:31:12',NULL),(129,125,'all_129','all',4,3,'how to make sure',99500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659685062/ndnebpdypdcudd6bkbfv.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 07:37:42',NULL),(130,125,'all_130','all',4,3,'Mobile accessories testing',1234,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659692700/s26fbhsf1ppqxbkdwbjl.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Mobile accessories testing...','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 09:45:00',NULL),(131,125,'all_131','all',4,3,'Mobile accessories testing',1234,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659696250/iw9cnn5fscinisz6ptvz.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Mobile accessories testing...','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 10:44:10',NULL),(132,125,'all_132','all',5,6,'Car spare parts form testing',1234,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659696682/ll8v1qzjesrtn2spggtq.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Car spare parts form testing...','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 10:51:22',NULL);
/*!40000 ALTER TABLE `all_inventory_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_mast`
--

DROP TABLE IF EXISTS `banner_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banner_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_mast`
--

LOCK TABLES `banner_mast` WRITE;
/*!40000 ALTER TABLE `banner_mast` DISABLE KEYS */;
INSERT INTO `banner_mast` VALUES (1,'http://res.cloudinary.com/mr-group-tech/image/upload/v1654592571/fzksn9blbrvs8xq0bodq.png','2022-06-01','2022-06-30',1,'2022-06-07 08:56:34','2022-06-07 09:02:52'),(2,'http://res.cloudinary.com/mr-group-tech/image/upload/v1654592646/wrxq26kmvigqitrouo7c.png','2022-07-01','2022-07-30',0,'2022-06-07 08:58:49','2022-06-07 09:04:07'),(3,NULL,'2022-06-01','2022-06-30',1,'2022-06-07 09:00:06',NULL),(5,NULL,NULL,NULL,NULL,'2022-06-07 10:12:43',NULL);
/*!40000 ALTER TABLE `banner_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bike_brand_mast`
--

DROP TABLE IF EXISTS `bike_brand_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bike_brand_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bike_brand_mast`
--

LOCK TABLES `bike_brand_mast` WRITE;
/*!40000 ALTER TABLE `bike_brand_mast` DISABLE KEYS */;
INSERT INTO `bike_brand_mast` VALUES (1,'Honda','2022-05-30 06:26:41','2022-07-11 12:33:59'),(2,'Honda','2022-05-30 06:27:06',NULL),(3,'TVS','2022-07-04 15:28:19',NULL),(4,'KTM','2022-07-04 15:28:28',NULL),(5,'Suzuki','2022-07-04 15:29:05',NULL),(6,'Bajaj','2022-07-04 15:29:10',NULL),(7,'Yamaha','2022-07-04 15:29:35',NULL),(8,'Honda','2022-07-11 12:33:38',NULL);
/*!40000 ALTER TABLE `bike_brand_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_brand_mast`
--

DROP TABLE IF EXISTS `car_brand_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_brand_mast` (
  `car_brand_id` int NOT NULL AUTO_INCREMENT,
  `car_brand_name` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`car_brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_brand_mast`
--

LOCK TABLES `car_brand_mast` WRITE;
/*!40000 ALTER TABLE `car_brand_mast` DISABLE KEYS */;
INSERT INTO `car_brand_mast` VALUES (1,'Maruti','2022-06-25 10:28:39',NULL),(2,'Hyundai','2022-06-25 10:29:17',NULL),(3,'Honda','2022-06-25 10:29:27',NULL),(4,'Tata','2022-06-25 10:29:31',NULL),(5,'Toyota','2022-06-25 10:29:40',NULL),(6,'Ford','2022-06-25 10:29:46',NULL),(7,'Audi','2022-06-25 10:32:32','2022-07-06 11:54:10'),(8,'Mahindra','2022-06-25 10:34:48','2022-07-06 11:54:29'),(9,'BMW','2022-06-25 10:34:54','2022-07-06 11:55:33'),(10,'Datsun','2022-06-25 10:35:08','2022-07-06 11:55:51'),(11,'Jaguar','2022-07-06 11:40:07','2022-07-06 11:56:08'),(12,'MG','2022-07-06 11:56:24','2022-07-06 11:56:34'),(13,'Nissan','2022-07-06 11:57:10',NULL),(14,'Kia','2022-07-06 11:57:40',NULL),(15,'Volvo','2022-07-06 11:58:05','2022-07-06 11:58:19');
/*!40000 ALTER TABLE `car_brand_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_fuel_type_mast`
--

DROP TABLE IF EXISTS `car_fuel_type_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_fuel_type_mast` (
  `car_fuel_id` int NOT NULL AUTO_INCREMENT,
  `car_fuel_name` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`car_fuel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_fuel_type_mast`
--

LOCK TABLES `car_fuel_type_mast` WRITE;
/*!40000 ALTER TABLE `car_fuel_type_mast` DISABLE KEYS */;
INSERT INTO `car_fuel_type_mast` VALUES (5,'Petrol','2022-07-04 15:54:14',NULL),(6,'Diesel','2022-07-04 15:54:50',NULL),(7,'Electric','2022-07-04 15:54:57',NULL),(8,'LPG','2022-07-04 15:55:05',NULL),(9,'CNG & Hybrids','2022-07-04 15:56:09',NULL);
/*!40000 ALTER TABLE `car_fuel_type_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_model_name_mast`
--

DROP TABLE IF EXISTS `car_model_name_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_model_name_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `brand_id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_model_name_mast`
--

LOCK TABLES `car_model_name_mast` WRITE;
/*!40000 ALTER TABLE `car_model_name_mast` DISABLE KEYS */;
INSERT INTO `car_model_name_mast` VALUES (7,'Verna',2,'2022-06-25 11:42:42',NULL),(8,'i10',2,'2022-06-25 11:42:58',NULL),(9,'i20',2,'2022-06-25 11:43:03',NULL),(10,'creta',2,'2022-06-25 11:43:09',NULL),(11,'Auro',2,'2022-06-25 11:43:16',NULL),(12,'Santro',2,'2022-06-25 11:43:23',NULL),(13,'Jazz',3,'2022-06-25 11:43:41',NULL),(14,'Civic',3,'2022-06-25 11:43:56',NULL),(15,'City',3,'2022-06-25 11:44:03',NULL),(16,'Amaze',3,'2022-06-25 11:44:12',NULL),(17,'Brio',3,'2022-06-25 11:44:17',NULL),(18,'WR-V',3,'2022-06-25 11:44:28',NULL),(20,'Ertiga',1,'2022-07-04 16:51:48',NULL),(21,'Baleno',1,'2022-07-04 16:51:57',NULL),(22,'Alto',1,'2022-07-04 16:52:10',NULL),(23,'Dzire',1,'2022-07-04 16:52:21',NULL),(24,'Ciaz',1,'2022-07-04 16:52:30',NULL),(25,'Eeco',1,'2022-07-04 16:52:37',NULL),(26,'Swift',1,'2022-07-04 16:52:46',NULL),(27,'Creta',2,'2022-07-04 16:53:17',NULL),(28,'I2O',2,'2022-07-04 16:53:32',NULL),(29,'Venue',2,'2022-07-04 16:53:42',NULL),(30,'Verna',2,'2022-07-04 16:53:48',NULL),(31,'Santro',2,'2022-07-04 16:53:57',NULL),(32,'Aura',2,'2022-07-04 16:54:10',NULL),(33,'City',3,'2022-07-04 16:54:29',NULL),(34,'WR-V',3,'2022-07-04 16:54:41',NULL),(35,'Amaze',3,'2022-07-04 16:54:47',NULL),(36,'Jazz',3,'2022-07-04 16:54:53',NULL),(37,'Nexon',4,'2022-07-04 16:55:19',NULL),(38,'Harrier',4,'2022-07-04 16:55:28',NULL),(39,'Altroz',4,'2022-07-04 16:55:39',NULL),(40,'Tiago',4,'2022-07-04 16:55:45',NULL),(41,'Safari',4,'2022-07-04 16:55:54',NULL),(42,'Camry',5,'2022-07-04 16:56:29',NULL),(43,'Fortuner',5,'2022-07-04 16:56:37',NULL),(44,'Vellfire',5,'2022-07-04 16:56:44',NULL),(45,'Glanza',5,'2022-07-04 16:56:55',NULL),(46,'Innovo',5,'2022-07-04 16:57:09',NULL),(47,'EcoSport',6,'2022-07-04 16:58:09',NULL),(48,'Figo',6,'2022-07-04 16:58:17',NULL),(49,'Everest',6,'2022-07-04 16:58:22',NULL),(50,'Aspire',6,'2022-07-04 16:58:31',NULL),(51,'Aspire',6,'2022-07-04 16:58:47',NULL);
/*!40000 ALTER TABLE `car_model_name_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_owner_mast`
--

DROP TABLE IF EXISTS `car_owner_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_owner_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_owner_mast`
--

LOCK TABLES `car_owner_mast` WRITE;
/*!40000 ALTER TABLE `car_owner_mast` DISABLE KEYS */;
INSERT INTO `car_owner_mast` VALUES (1,'1st',NULL,NULL),(3,'2nd',NULL,NULL),(6,'3rd','2022-07-04 17:10:45',NULL),(7,'4th','2022-07-04 17:10:55',NULL),(8,'4+','2022-07-04 17:11:07',NULL);
/*!40000 ALTER TABLE `car_owner_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_registration_mast`
--

DROP TABLE IF EXISTS `car_registration_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_registration_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_registration_mast`
--

LOCK TABLES `car_registration_mast` WRITE;
/*!40000 ALTER TABLE `car_registration_mast` DISABLE KEYS */;
INSERT INTO `car_registration_mast` VALUES (1,'MH','2022-07-05 08:42:02',NULL),(2,'GJ','2022-07-05 08:42:07',NULL),(3,'DL','2022-07-05 08:42:49',NULL),(4,'RJ','2022-07-05 08:42:53',NULL),(5,'HR','2022-07-05 08:43:03',NULL),(6,'MP','2022-07-05 08:43:23',NULL),(7,'PB','2022-07-05 08:43:31',NULL),(8,'DD','2022-07-05 08:43:41',NULL),(9,'AP','2022-07-05 08:43:49',NULL),(10,'KL','2022-07-05 08:43:57',NULL),(11,'BR','2022-07-05 08:44:13',NULL),(12,'WB','2022-07-05 08:44:16',NULL);
/*!40000 ALTER TABLE `car_registration_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_rent_inventory_mast`
--

DROP TABLE IF EXISTS `car_rent_inventory_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_rent_inventory_mast` (
  `car_rent_inventory_id` int NOT NULL AUTO_INCREMENT,
    `user_id` varchar(126) DEFAULT NULL,
  `car_rent_inventory_code` varchar(45) DEFAULT NULL,
  `inventory_type` varchar(45) NOT NULL DEFAULT 'car',
  `car_title` varchar(126) DEFAULT NULL,
  `c_price` int DEFAULT NULL,
  `c_picture_link_1` varchar(512) DEFAULT NULL,
  `c_picture_link_2` varchar(512) DEFAULT NULL,
  `c_picture_link_3` varchar(512) DEFAULT NULL,
  `c_picture_link_4` varchar(512) DEFAULT NULL,
  `c_picture_link_5` varchar(512) DEFAULT NULL,
  `c_picture_link_6` varchar(512) DEFAULT NULL,
  `c_picture_link_7` varchar(512) DEFAULT NULL,
  `c_picture_link_8` varchar(512) DEFAULT NULL,
  `c_picture_link_9` varchar(512) DEFAULT NULL,
  `c_picture_link_10` varchar(512) DEFAULT NULL,
  `c_km_limit` int DEFAULT NULL,
  `c_car_type` int DEFAULT NULL,
  `c_extra_charge` int DEFAULT NULL,
  `c_per_day_charge` int DEFAULT NULL,
  `car_fuel_id` int DEFAULT NULL,
  `c_with_fuel` tinyint DEFAULT NULL,
  `c_driver` tinyint DEFAULT NULL,
  `c_transmission` tinyint DEFAULT NULL,
  `c_show_mo_no` tinyint DEFAULT NULL,
  `c_description` varchar(512) DEFAULT NULL,
  `c_location` varchar(512) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  `sub_cat_id` int DEFAULT NULL,
  PRIMARY KEY (`car_rent_inventory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_rent_inventory_mast`
--

LOCK TABLES `car_rent_inventory_mast` WRITE;
/*!40000 ALTER TABLE `car_rent_inventory_mast` DISABLE KEYS */;
INSERT INTO `car_rent_inventory_mast` VALUES (1,1,'car_rent_1','car','Toyota 7 seater car for rent',1000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1653732436/lw2ffornsu9bjeevynjn.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,1,15,20,1,1,1,1,1,'Toyota car rent for rs 3000','surat',20.62191300,78.94652400,'2022-05-28 10:07:16',NULL,5,5),(2,2,'car_rent_2','car','BMW 5 series ',750000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656066011/ot9xxohesjqqpkucz4q6.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2500,2,0,5000,2,1,0,1,1,'Anti-Lock Braking System (ABS)No Electronic Brake-force Distribution (EBD)\nNo Brake Assist (BA)No Electronic Stability Program (ESP)\nNo Four-Wheel-DriveNo Hill Hold Contro','Katargam',20.62191300,78.94652400,'2022-06-24 10:20:11',NULL,5,5),(3,2,'car_rent_3','car','Audi A4 ',220078,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656066149/qzxjofk4b87y9fmxvh2x.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000,1,0,8870,1,1,1,1,1,'The A4, even with the facelift, might still look a tad too subtle compared to the competition, but it\'s only once you get behind the wheel that you know its true potential. No, it\'s not a driver\'s car like the BMW 3, or as charming as the Mercedes-Benz C-Class, but the new A4 is a very fine balance of sporty and elegance.','Bhestan',20.62191300,78.94652400,'2022-06-24 10:22:29',NULL,5,5),(4,1,'car_rent_4','car','Nano Tata for rent',800,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656481569/lf8e75sowunazz5weiqs.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,300,2,0,800,1,1,0,0,0,'tata nano for rent ','bhestan ',12.23650000,78.25580000,'2022-06-29 05:46:09',NULL,5,5),(5,1,'car_rent_5','car','Toyota 7 seater car for rent',1000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657437819/byayhqvandg23jnyz1dc.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,1,0,20,1,1,1,1,1,'Toyota car rent for rs 3000','surat',20.62170000,78.94652900,'2022-07-10 07:23:39',NULL,5,5),(6,1,'car_rent_6','car','Toyota 7 seater car for rent',1000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657437996/qzsko58r6de4hnimo9pc.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,1,0,20,1,1,1,1,1,'Toyota car rent for rs 3000','surat',20.62170000,78.94652900,'2022-07-10 07:26:36',NULL,5,5),(7,5,'car_rent_7','car','Test Rent Car',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657438817/hodr1uyzxvpvcsv0r1bb.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',125,7,0,2000,6,1,1,1,1,'fsdfdsfsdfdsfdsf','dsfds',21.20745270,72.83498750,'2022-07-10 07:40:18',NULL,0,8),(8,5,'car_rent_8','car','ddddddddddd',656565,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657439098/jaacbruucutykralhlz1.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',520,1,0,5000,9,1,1,1,1,'dddddddddddddddddddddddddddddd','ddd',21.20745270,72.83498750,'2022-07-10 07:44:59',NULL,0,8),(9,5,'car_rent_9','car','dwedededewdewd',212,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657439203/qbl2arjy7drhf4ukipsb.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',212,1,0,212,8,1,1,1,1,'1212121212121','21212121',21.20745270,72.83498750,'2022-07-10 07:46:44',NULL,0,8),(10,5,'car_rent_10','car','Test Car Demo',123,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657454343/xpqcoxhdirhbgnwsitvn.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',125,1,0,250,6,1,1,1,1,'12313212123123123132','123131',21.20745270,72.83498750,'2022-07-10 11:59:03',NULL,0,8),(11,5,'car_rent_11','car','fsdfdsfdsfdsfds',12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657966309/ijbn9vubngraeils9oef.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',12,1,0,12,6,1,1,1,1,'1212121212','212121',21.22880810,72.82797690,'2022-07-16 10:11:49',NULL,5,5),(12,5,'car_rent_12','car','fsdfsdfsdfsdf',12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657966572/nl7awdff1hxyflejfln4.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',12,8,0,12,6,1,1,1,1,'12121212121','121212121',21.20745270,72.83498750,'2022-07-16 10:16:12',NULL,5,5),(13,145,'car_rent_13','car','jhg bnjbhk kjn',56789,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658414155/y7kpqetx68dc8grmwzcy.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3456,8,0,456,9,1,1,0,1,' hbyuihjknlm fgc vbnjnkknm','Udhana, Surat',72.83106070,21.17024380,'2022-07-21 14:35:55',NULL,5,5),(14,1,'car_rent_14','car','Toyota 7 seater car for rent',1000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658510422/yp0ck2dm4qi4pbmystdv.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,1,0,20,1,1,1,1,1,'Toyota car rent for rs 3000','surat',20.62170000,78.94652900,'2022-07-22 17:20:23',NULL,5,5),(15,1,'car_rent_15','car','Toyota 7 seater car for rent',1000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658555926/ououkiwnbz2yhsciyjgx.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,1,0,20,1,1,1,1,1,'Toyota car rent for rs 3000','surat',20.62170000,78.94652900,'2022-07-23 05:58:46',NULL,5,5),(16,1,'car_rent_16','car','Toyota 7 seater car for rent',1000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658555930/w3ggumramflpzulvwpqx.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,1,0,20,1,1,1,1,1,'Toyota car rent for rs 3000','surat',20.62170000,78.94652900,'2022-07-23 05:58:50',NULL,5,5),(17,1,'car_rent_17','car','Toyota 7 seater car for rent',1000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658556037/vh61ztgbhr2jacfkgwoq.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,1,0,20,1,1,1,1,1,'Toyota car rent for rs 3000','surat',20.62170000,78.94652900,'2022-07-23 06:00:38',NULL,5,5),(18,1,'car_rent_18','car','Toyota 7 seater car for rent',1000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658571950/dgbenpndxfbae6gwq8ej.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,1,0,20,1,1,1,1,1,'Toyota car rent for rs 3000','surat',20.62170000,78.94652900,'2022-07-23 10:25:50',NULL,5,5),(19,145,'car_rent_19','car','Car rent title',40000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658606949/zhm21ym9hpnrrhktlmwt.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4500,7,0,450000,7,1,1,0,1,'demo car rental definitely','Udhana, Surat',72.83106070,21.17024380,'2022-07-23 20:09:10',NULL,5,5),(20,1,'car_rent_20','car','Toyota 7 seater car for rent',1000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658730171/o5jwzcbn0swcfbugt8ib.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,1,0,20,1,1,1,1,1,'Toyota car rent for rs 3000','surat',20.62170000,78.94652900,'2022-07-25 06:22:45','2022-07-25 06:22:51',5,5),(21,145,'car_rent_21','car','sv fsvrfd vb',345,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658774370/j5ralaeap1ekel8iys0t.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,0,0,0,0,0,'dgbfvb vdfbgv bvvc','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 18:39:30',NULL,5,5),(22,125,'car_rent_22','car','car rent test',2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659031189/dbuvawnsml2vvew2nqq7.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,99,8,0,250,7,0,1,0,1,'Take a look at this ViewSonic 23.8 inch Full HD LED Backlit IPS Panel Hig','Vesu, Surat',0.00000000,0.00000000,'2022-07-28 17:59:50',NULL,5,5),(23,125,'car_rent_23','car','Car rent testing',1234,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659695814/dxptxvxtl3rytfkfspwm.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000,8,0,1000,9,1,0,0,0,'Car rent testing ...','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 10:36:54',NULL,5,5),(24,125,'car_rent_24','car','Car rent form testing',1234,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659696584/ob95tikgyxkyatnp6e77.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2000,8,0,1000,9,1,1,0,1,'Car rent form testing...','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 10:49:44',NULL,5,5);
/*!40000 ALTER TABLE `car_rent_inventory_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_sell_inventory_mast`
--

DROP TABLE IF EXISTS `car_sell_inventory_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_sell_inventory_mast` (
  `car_sell_inventory_id` int NOT NULL,
    `user_id` varchar(126) DEFAULT NULL,
  `car_sell_inventory_code` varchar(45) DEFAULT NULL,
  `inventory_type` varchar(45) NOT NULL DEFAULT 'car',
  `car_title` varchar(126) DEFAULT NULL,
  `car_brand_id` int DEFAULT NULL,
  `car_model_name` int DEFAULT NULL,
  `c_owner` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `c_registration` int DEFAULT NULL,
  `c_km` int DEFAULT NULL,
  `c_price` int DEFAULT NULL,
  `c_picture_link_1` varchar(512) DEFAULT NULL,
  `c_picture_link_2` varchar(512) DEFAULT NULL,
  `c_picture_link_3` varchar(512) DEFAULT NULL,
  `c_picture_link_4` varchar(512) DEFAULT NULL,
  `c_picture_link_5` varchar(512) DEFAULT NULL,
  `c_picture_link_6` varchar(512) DEFAULT NULL,
  `c_picture_link_7` varchar(512) DEFAULT NULL,
  `c_picture_link_8` varchar(512) DEFAULT NULL,
  `c_picture_link_9` varchar(512) DEFAULT NULL,
  `c_picture_link_10` varchar(512) DEFAULT NULL,
  `year_of_registration` varchar(126) DEFAULT NULL,
  `c_colour` varchar(45) DEFAULT NULL,
  `engine_capacity` varchar(126) DEFAULT NULL,
  `mileage` varchar(126) DEFAULT NULL,
  `car_fuel_id` int DEFAULT NULL,
  `transmission` tinyint DEFAULT NULL,
  `c_insurance` tinyint DEFAULT NULL,
  `i_description` varchar(512) DEFAULT NULL,
  `c_show_mo_no` tinyint DEFAULT NULL,
  `c_description` varchar(512) DEFAULT NULL,
  `c_location` varchar(512) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  `sub_cat_id` int DEFAULT NULL,
  PRIMARY KEY (`car_sell_inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_sell_inventory_mast`
--

LOCK TABLES `car_sell_inventory_mast` WRITE;
/*!40000 ALTER TABLE `car_sell_inventory_mast` DISABLE KEYS */;
INSERT INTO `car_sell_inventory_mast` VALUES (1,1,'car_sell_1','car','Honda City',2,1,1,1,1,10000,100000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1653731232/dytjpkcpifs2h9yrjtkz.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018/may','black','1900 cc','22.35 to 22.94 kmpl',1,1,1,'description',1,'Honda City with good condition','surat',20.62191300,78.94652400,'2022-05-28 09:47:13',NULL,5,4),(2,1,'car_sell_2','car','Honda City xs ',1,1,2,2012,1,25098,277000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656064579/hic2sfi8acnmvjt2wnb1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018/may','white','1900 cc','22.35 kmpl',1,1,1,'3rd party insurance ',1,'Honda City with good condition','surat',20.62181300,78.94652300,'2022-06-24 09:56:19',NULL,5,4),(3,5,'car_sell_3','car','Maruti suzuki vitara brezza ',2,2,2,2017,1,57984,189650,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656065724/vwiutcj3trhpora1yrqi.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018/may','Red','1700 cc','14 kmpl',2,2,0,NULL,1,'No Overspeed WarningNo Lane Departure Warning\nNo Emergency Brake Light FlashingNo Puncture Repair Kit\nNo Forward Collision Warning (FCW)No Automatic Emergency Braking (AEB)','VIP road',20.62181300,78.94652300,'2022-06-24 10:15:24',NULL,5,4),(4,5,'car_sell_4','car','audii',2,2,1,2012,1,40000,127840,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656065724/vwiutcj3trhpora1yrqi.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018/may','black','40000 cc','7 kmpl',2,2,0,'demo',1,'audi','Mumbai',19.07600000,72.87770000,'2022-06-28 16:15:15',NULL,5,4),(5,4,'car_sell_5','car','Honda City',1,1,1,1,1,10000,100000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656946201/bjzeuptgexi98nemipqi.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018/may','black','1900 cc','22.35 to 22.94 kmpl',1,1,1,'description',1,'Honda City with good condition','surat',20.62191300,78.94652400,'2022-07-04 14:50:02',NULL,5,4),(6,4,'car_sell_6','car','Honda City',1,1,1,1,1,10000,100000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657305299/yhayz9fr5eow88nyu20c.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018/may','black','1900 cc','22.35 to 22.94 kmpl',1,1,1,'description',1,'Honda City with good condition','surat',20.62191300,78.94652400,'2022-07-08 18:35:00',NULL,5,4),(7,145,'car_sell_7','car','svdfjh. jkhb n',3,14,1,15,5,5678,76,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658415335/ihwrwyugvk5bmxkktap8.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5','HJ','56789','789',8,1,1,'kjh jhv ghjjbh jm',1,'bhhj GH hg b JB JB JB JB JB JB ','Udhana, Surat',72.83106070,21.17024380,'2022-07-21 14:55:36',NULL,5,4),(8,145,'car_sell_8','car','hfdgthf ftjftjtf',2,10,3,14,5,231,6116,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658429397/xnaqzxpmxv6bo00sb7be.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5','colrr','210','51',6,1,0,NULL,1,'rdesg gdrgdghd hdthfztzf','Udhana, Surat',72.83106070,21.17024380,'2022-07-21 18:49:58',NULL,5,4),(9,4,'car_sell_9','car','Honda City',1,1,1,1,1,10000,100000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658555690/fj7rphgyjmkn6e5ycmdi.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018/may','black','1900 cc','22.35 to 22.94 kmpl',1,1,1,'description',1,'Honda City with good condition','surat',20.62191300,78.94652400,'2022-07-23 05:54:51',NULL,5,4),(10,4,'car_sell_10','car','Honda City',1,1,1,1,1,10000,100000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658555696/xj680es9bfr763cbycew.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018/may','black','1900 cc','22.35 to 22.94 kmpl',1,1,1,'description',1,'Honda City with good condition','surat',20.62191300,78.94652400,'2022-07-23 05:54:57',NULL,5,4),(11,4,'car_sell_11','car','Honda City',1,1,1,1,1,10000,100000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658555943/o9vbkffz9gygsjjndy4r.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018/may','black','1900 cc','22.35 to 22.94 kmpl',1,1,1,'description',1,'Honda City with good condition','surat',20.62191300,78.94652400,'2022-07-23 05:59:04',NULL,5,4),(12,4,'car_sell_12','car','Honda City',1,1,1,1,1,10000,100000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658576304/vumlznulye2eaqq3ovwq.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018/may','black','1900 cc','22.35 to 22.94 kmpl',1,1,1,'description',1,'Honda City with good condition','surat',20.62191300,78.94652400,'2022-07-23 11:38:25',NULL,5,4),(13,145,'car_sell_13','car','demo car sell',3,14,3,15,6,50,5000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658606871/plmiickigtbcnjqjhjb9.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6','black dark','45000','4500',6,1,1,'no not now',1,'demo car sell description','Udhana, Surat',72.83106070,21.17024380,'2022-07-23 20:07:52',NULL,5,4),(14,145,'car_sell_14','car','ewjkv j jh j',5,43,6,16,7,46,45678,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658724338/yatyfmmr8qjuac29kf7l.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7','jh mn k kj','5678','567',7,1,1,'no',1,' khj NJ hjbnjnjhn kjnm','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 04:45:39',NULL,5,4),(15,145,'car_sell_15','car','bjh j j jh k',4,38,1,14,5,3456,45675,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658724410/r9xzadf5umu5qgkxncva.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5','tgvbhnjk','45678','45678',6,1,1,'gvjhbkn ',0,'ghjbknlm, JK kjl ','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 04:46:51',NULL,5,4),(16,125,'car_sell_16','car','how to make sure you are',5,42,6,16,7,2555,250000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658724597/iunu4sxqhjdy86s2wg19.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7','black','2500','25',8,1,0,NULL,1,'how to make sure you are','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 04:49:57',NULL,5,4),(17,125,'car_sell_17','car','how to make sure you are',6,47,6,16,8,25,25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658724813/qjaujw6mwzfmk2chxxs9.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','r','6','2',8,0,0,NULL,0,'how to make sure you are','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 04:53:33',NULL,5,4),(18,125,'car_sell_18','car','He was a temporary server ',6,48,7,17,5,25,2555,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658728642/z0262ilmeaozpin2fbrw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5','','','',0,0,0,NULL,0,'ama return value nathi malti','Vesu, Surat',0.00000000,0.00000000,'2022-07-25 05:57:23',NULL,5,4),(19,4,'car_sell_19','car','Honda City',1,1,1,1,1,10000,100000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658730254/oduxlit8pf3pliasg7c3.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018/may','black','1900 cc','22.35 to 22.94 kmpl',1,1,1,'description',1,'Honda City with good condition','surat',20.62191300,78.94652400,'2022-07-25 06:24:02','2022-07-25 06:24:15',5,4),(20,145,'car_sell_20','car','svfs sf fs.',4,37,3,15,6,23,21324,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658774352/dvtt23wcy6gityswlijm.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6',NULL,NULL,NULL,0,0,0,NULL,0,'so xdf CV of vc','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 18:39:13',NULL,5,4),(21,125,'car_sell_21','car','how to make sure you',6,47,7,16,7,25,22500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658802348/mpv3ycjfvefw6tlfsrm9.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7',NULL,NULL,NULL,NULL,0,0,NULL,0,'how to make sure you','Udhana, Surat',0.00000000,0.00000000,'2022-07-26 02:25:50',NULL,5,4),(22,125,'car_sell_22','car','how to make sure you y',5,43,7,16,8,2,85,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658833740/ybhtst1rzhomigteuypt.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8',NULL,NULL,NULL,NULL,0,0,NULL,0,'how to make sure you y','Vesu, Surat',0.00000000,0.00000000,'2022-07-26 11:09:00',NULL,5,4),(23,125,'car_sell_23','car','how to make sure you y',6,49,6,16,7,25,25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658833772/fbovyyjjimydgngglftd.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7','h',NULL,NULL,9,0,0,NULL,0,'how to make sure you y','Vesu, Surat',0.00000000,0.00000000,'2022-07-26 11:09:32',NULL,5,4),(24,125,'car_sell_24','car','car sell test',2,9,3,16,6,2500,25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659031151/dd09muyx8smxh0pes3td.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6','black','2500','25',6,0,1,'hello',1,'Take a look at this ViewSonic 23.8 inch Full HD LED Backlit IPS Panel Hig','Vesu, Surat',0.00000000,0.00000000,'2022-07-28 17:59:12',NULL,5,4),(25,125,'car_sell_25','car','31 car sell',4,37,6,17,5,25000,256400,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659247342/ekn9fr7cibox9xneml4s.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5','bike','250','2500',9,1,1,'thirty party',1,'how kskdksaldbhs','Udhana, Surat',0.00000000,0.00000000,'2022-07-31 06:02:22',NULL,5,4),(26,125,'car_sell_26','car','car sell test',5,42,6,16,5,2500,2555,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659329839/ndu1yqxbwx5hzh67txzk.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5','how to make sure you are','69','899',6,1,1,'yhh',1,'how to make sure you are','Vesu, Surat',0.00000000,0.00000000,'2022-08-01 04:57:19',NULL,5,4),(27,125,'car_sell_27','car','JUGUAR CAR TOP CONDITION',4,37,1,11,2,25000,450000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659455846/wy45mnslrcs3vqapnvwg.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2',NULL,NULL,NULL,NULL,0,0,NULL,0,'however the task','Vesu, Surat',0.00000000,0.00000000,'2022-08-02 15:57:27',NULL,5,4),(28,125,'car_sell_28','car','car form test',4,37,6,16,7,35000,250000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659462720/wmnactsvc25z6slfwkpl.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7','tggd','65656','66868',6,1,1,'fjdjdj',1,'jcjddj djdjdjdj','Vesu, Surat',0.00000000,0.00000000,'2022-08-02 17:52:01',NULL,5,4),(29,125,'car_sell_29','car','car sell form',3,15,1,16,6,25,25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659690464/zelgl4tmvg7cfysnxunl.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6','black','2500','2500',6,1,1,'yes',1,'how to sale','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 09:07:45',NULL,5,4),(30,125,'car_sell_30','car','Car sell testing',3,17,6,13,6,9000,1234,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659692955/y3jaq8vdyfbifboimait.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6','silver','1500','15',9,1,0,NULL,1,'Car sell testing...','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 09:49:15',NULL,5,4),(31,125,'car_sell_31','car','Car sell form testing',3,33,3,15,1,123456,1234,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659696458/zdwiacchx5q3nnayvxwd.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','Grey','1900','15',9,1,1,'3rd party insurance testing',1,'Car sell form testing...','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 10:47:38',NULL,5,4);
/*!40000 ALTER TABLE `car_sell_inventory_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_type_mast`
--

DROP TABLE IF EXISTS `car_type_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_type_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_type_mast`
--

LOCK TABLES `car_type_mast` WRITE;
/*!40000 ALTER TABLE `car_type_mast` DISABLE KEYS */;
INSERT INTO `car_type_mast` VALUES (1,'Sedan',NULL,NULL),(7,'Hatchback','2022-07-04 15:48:59',NULL),(8,'SUV','2022-07-04 15:50:11',NULL),(9,'MPV','2022-07-04 15:51:14',NULL);
/*!40000 ALTER TABLE `car_type_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_mast`
--

DROP TABLE IF EXISTS `category_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(126) DEFAULT NULL,
  `cat_picture_link` varchar(512) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2015 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_mast`
--

LOCK TABLES `category_mast` WRITE;
/*!40000 ALTER TABLE `category_mast` DISABLE KEYS */;
INSERT INTO `category_mast` VALUES (4,'Mobiles','http://res.cloudinary.com/mr-group-tech/image/upload/v1654691593/d7okiei2i80saoiowncv.png','2022-04-26 11:49:23','2022-06-08 12:33:14'),(5,'Cars','http://res.cloudinary.com/mr-group-tech/image/upload/v1654691618/uwaqgccxzm9rb4ypeyci.png','2022-04-26 11:49:54','2022-06-08 12:33:39'),(6,'Real Estate','http://res.cloudinary.com/mr-group-tech/image/upload/v1654691643/v4ob8nnsxcs8ynf3t5do.png','2022-04-26 11:50:27','2022-06-08 12:34:04'),(7,'Jobs','http://res.cloudinary.com/mr-group-tech/image/upload/v1654691659/oh8bnmiq0zhaal0peave.png','2022-04-26 11:51:09','2022-06-08 12:34:19'),(8,'Electronics & Appliances','http://res.cloudinary.com/mr-group-tech/image/upload/v1654691674/djq8hvt5dkle15qyddsb.png','2022-04-26 11:52:23','2022-06-08 12:34:34'),(9,'Two Wheeler','http://res.cloudinary.com/mr-group-tech/image/upload/v1654691690/m9f4sul6vn5yyxqjnkyp.png','2022-04-26 11:53:48','2022-06-08 12:34:50'),(10,'Furniture','http://res.cloudinary.com/mr-group-tech/image/upload/v1654691870/ubqtl87jd4doufzaht10.png','2022-04-26 11:54:45','2022-06-08 12:37:50'),(11,'Commercial Vehicle','http://res.cloudinary.com/mr-group-tech/image/upload/v1654691724/jqsbddkqqfrfeljsqflv.png','2022-04-26 12:15:18','2022-06-08 12:35:24'),(12,'Fashion','http://res.cloudinary.com/mr-group-tech/image/upload/v1654691737/ixg3ks4pliwa1vcbxda6.png','2022-04-26 12:15:46','2022-06-08 12:35:37'),(13,'Books & Sports','http://res.cloudinary.com/mr-group-tech/image/upload/v1654691776/q21icsox7md5sjuydulm.png','2022-04-26 11:55:23','2022-06-08 12:36:16'),(14,'Pets','http://res.cloudinary.com/mr-group-tech/image/upload/v1654691795/yjclmvnhmbzksvcliuzk.png','2022-04-26 11:56:10','2022-06-08 12:36:36'),(15,'Services','http://res.cloudinary.com/mr-group-tech/image/upload/v1654691815/kib1woqaxc5vkmflayce.png','2022-04-26 11:56:46','2022-06-08 12:36:55');
/*!40000 ALTER TABLE `category_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commercial_brand_mast`
--

DROP TABLE IF EXISTS `commercial_brand_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commercial_brand_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commercial_brand_mast`
--

LOCK TABLES `commercial_brand_mast` WRITE;
/*!40000 ALTER TABLE `commercial_brand_mast` DISABLE KEYS */;
INSERT INTO `commercial_brand_mast` VALUES (1,'Bus',NULL,'2022-07-06 15:33:39'),(2,'Auto riskshow',NULL,'2022-07-06 15:33:53'),(4,'Tractor','2022-07-06 15:34:06',NULL),(5,'Truck','2022-07-06 15:34:19',NULL);
/*!40000 ALTER TABLE `commercial_brand_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_mast`
--

DROP TABLE IF EXISTS `device_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_mast`
--

LOCK TABLES `device_mast` WRITE;
/*!40000 ALTER TABLE `device_mast` DISABLE KEYS */;
INSERT INTO `device_mast` VALUES (1,'iphone','2022-07-13 06:01:01',NULL),(3,'android','2022-07-13 07:15:29',NULL),(4,'android','2022-07-13 07:15:56',NULL),(5,'android','2022-07-13 07:15:57',NULL),(6,'android','2022-07-18 06:42:59',NULL),(7,'android','2022-07-18 06:48:12',NULL);
/*!40000 ALTER TABLE `device_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_token_mast`
--

DROP TABLE IF EXISTS `device_token_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_token_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_type` int DEFAULT NULL,
  `device_unq_id` int DEFAULT NULL,
    `user_id` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `device_token` varchar(244) DEFAULT NULL,
  `subscribe` tinyint DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_token_mast`
--

LOCK TABLES `device_token_mast` WRITE;
/*!40000 ALTER TABLE `device_token_mast` DISABLE KEYS */;
INSERT INTO `device_token_mast` VALUES (4,3,3,2,'2022-07-13 07:14:08','2022-07-20 06:01:10','demo',1),(5,3,3,2,'2022-07-13 07:14:24','2022-07-13 10:17:09','demo',1),(6,3,3,2,'2022-07-13 07:17:03','2022-07-13 10:17:09','demo',1),(7,3,3,3,'2022-07-13 09:45:15','2022-07-13 10:16:16','demo',1),(8,3,3,1,'2022-07-13 09:51:50','2022-07-13 10:17:32','demo1',1);
/*!40000 ALTER TABLE `device_token_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `display_type_mast`
--

DROP TABLE IF EXISTS `display_type_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `display_type_mast` (
  `display_type_id` int NOT NULL AUTO_INCREMENT,
  `display_type_type` varchar(256) DEFAULT NULL,
  `display_type_created_date` datetime DEFAULT NULL,
  `display_type_modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`display_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `display_type_mast`
--

LOCK TABLES `display_type_mast` WRITE;
/*!40000 ALTER TABLE `display_type_mast` DISABLE KEYS */;
INSERT INTO `display_type_mast` VALUES (2,'NearByLocation','2022-08-01 06:07:21',NULL),(3,'ProductDetails','2022-08-01 06:07:59',NULL),(4,'ProductClick','2022-08-01 06:08:07',NULL),(5,'Details',NULL,NULL);
/*!40000 ALTER TABLE `display_type_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_field_mast`
--

DROP TABLE IF EXISTS `dynamic_field_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_field_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `db_field` varchar(126) DEFAULT NULL,
  `display_name` varchar(256) DEFAULT NULL,
  `display_type_id` int DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  `sequence` int DEFAULT NULL,
  `icon` varchar(256) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_field_mast`
--

LOCK TABLES `dynamic_field_mast` WRITE;
/*!40000 ALTER TABLE `dynamic_field_mast` DISABLE KEYS */;
INSERT INTO `dynamic_field_mast` VALUES (1,'ad_5','demo1',NULL,1,5,'home',1),(2,'ad_5','demo1',1,1,5,'home',1),(3,'ad_5','demo1',1,1,5,'home',1),(4,'ad_5','demo1',2,1,5,'home',1),(5,'bad_room','',1,5,1,'badroom',1),(6,'brand_name ','Brand',3,4,1,' ',1),(7,'mo_ram','RAM',3,4,2,' ',1),(8,'mo_rom','ROM',3,4,3,' ',1);
/*!40000 ALTER TABLE `dynamic_field_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites_mast`
--

DROP TABLE IF EXISTS `favourites_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourites_mast` (
  `fav_id` int NOT NULL AUTO_INCREMENT,
  `inventory_id` int DEFAULT NULL,
    `user_id` varchar(126) DEFAULT NULL,
  `inventory_code` varchar(126) DEFAULT NULL,
  `inventory_type` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`fav_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites_mast`
--

LOCK TABLES `favourites_mast` WRITE;
/*!40000 ALTER TABLE `favourites_mast` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourites_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filter_mast`
--

DROP TABLE IF EXISTS `filter_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_mast` (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `cat_id` int DEFAULT NULL,
  `sub_cat_id` int DEFAULT NULL,
  `from_price` int DEFAULT NULL,
  `to_price` int DEFAULT NULL,
  `price_description` varchar(126) DEFAULT NULL,
  `from_distance` int DEFAULT NULL,
  `to_distance` int DEFAULT NULL,
  `distance_description` varchar(126) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `m_brand_id` int DEFAULT NULL,
  `p_type_id` int DEFAULT NULL,
  `p_bedroom` int DEFAULT NULL,
  `p_bathroom` int DEFAULT NULL,
  `p_status_id` int DEFAULT NULL,
  `car_brand` varchar(126) DEFAULT NULL,
  `car_year` int DEFAULT NULL,
  `car_kms` int DEFAULT NULL,
  `v_type_id` int DEFAULT NULL,
  `j_type_id` int DEFAULT NULL,
  `j_position_type_id` int DEFAULT NULL,
  `j_s_period_id` int DEFAULT NULL,
  `from_salary` int DEFAULT NULL,
  `to_salary` int DEFAULT NULL,
  `salary_description` varchar(126) DEFAULT NULL,
  `budget` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='						';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filter_mast`
--

LOCK TABLES `filter_mast` WRITE;
/*!40000 ALTER TABLE `filter_mast` DISABLE KEYS */;
INSERT INTO `filter_mast` VALUES (2,4,1,0,0,'Rs.0  -  Rs.0',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',3,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',20000,'2022-05-05 07:21:25',NULL),(3,5,4,0,0,'Rs.0  -  Rs.0',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',350000,'2022-05-05 07:23:08',NULL),(4,5,4,0,0,'Rs.0  -  Rs.0',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'honda',2017,100000,0,0,0,0,0,0,'Rs.0  -  Rs.0',50000,'2022-05-05 07:24:01',NULL),(5,6,7,0,0,'Rs.0  -  Rs.0',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,1,3,2,1,'0',0,0,0,0,0,0,0,0,'Rs.0  -  Rs.0',400000,'2022-05-05 07:26:23',NULL),(6,6,7,0,0,'Rs.0  -  Rs.0',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,1,5,4,2,'0',0,0,0,0,0,0,0,0,'Rs.0  -  Rs.0',450000,'2022-05-05 07:27:06',NULL),(7,7,11,0,0,'Rs.0  -  Rs.0',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'0',0,0,0,2,1,3,15000,50000,'Rs.15000  -  Rs.50000',0,'2022-05-05 07:28:45',NULL),(8,7,11,0,0,'Rs.0  -  Rs.0',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'0',0,0,0,1,3,2,5000,30000,'Rs.5000  -  Rs.30000',0,'2022-05-05 07:29:06',NULL),(9,4,1,0,0,'Rs.0  -  Rs.0',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',4,0,0,0,0,'0',0,0,0,0,0,0,0,0,'Rs.0  -  Rs.0',2000,'2022-05-05 07:32:28',NULL),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-05-05 07:40:41',NULL),(11,6,7,0,0,'Rs.0  -  Rs.0',10,0,'10 Km  -  0 Km','2022-05-03 00:00:00',9,4,0,0,4,'0',0,0,0,11,12,10,10,7,'Rs.10  -  Rs.7',2000,'2022-05-05 08:58:57',NULL),(12,7,11,15,10,'Rs.15  -  Rs.10',10,0,'10 Km  -  0 Km','2022-05-03 00:00:00',11,2,0,0,7,'0',0,0,0,12,13,11,10,9,'Rs.10  -  Rs.9',1000,'2022-05-05 09:08:32',NULL),(13,8,25,12,11,'Rs.12  -  Rs.11',9,0,'9 Km  -  0 Km','2022-05-03 00:00:00',8,13,0,0,9,'0',0,0,0,11,15,10,6,9,'Rs.6  -  Rs.9',1500,'2022-05-05 09:10:12',NULL),(14,9,39,11,13,'Rs.11  -  Rs.13',11,0,'11 Km  -  0 Km','2022-05-03 00:00:00',9,11,0,0,9,'0',0,0,1,11,15,10,8,10,'Rs.8  -  Rs.10',1200,'2022-05-05 09:13:28',NULL),(15,10,43,10,11,'Rs.10  -  Rs.11',14,0,'14 Km  -  0 Km','2022-05-03 00:00:00',9,12,0,0,10,'0',0,0,0,0,0,0,0,10,'Rs.0  -  Rs.10',1300,'2022-05-05 09:15:02',NULL),(16,11,52,11,12,'Rs.11  -  Rs.12',11,0,'11 Km  -  0 Km','2022-05-03 00:00:00',10,9,0,0,10,'0',0,0,1,0,0,0,0,10,'Rs.0  -  Rs.10',1350,'2022-05-05 09:19:52',NULL),(17,12,54,12,8,'Rs.12  -  Rs.8',7,0,'7 Km  -  0 Km','2022-05-03 00:00:00',11,6,0,0,10,'0',0,0,0,0,0,0,0,0,'Rs.0  -  Rs.0',1450,'2022-05-05 09:23:32',NULL),(18,13,57,8,9,'Rs.8  -  Rs.9',12,0,'12 Km  -  0 Km','2022-05-03 00:00:00',8,4,0,0,10,'0',0,0,0,0,0,0,0,0,'Rs.0  -  Rs.0',1500,'2022-05-05 09:24:35',NULL),(19,14,62,10,11,'Rs.10  -  Rs.11',3,0,'3 Km  -  0 Km','2022-05-03 00:00:00',9,5,0,0,0,'0',0,0,0,0,0,0,0,0,'Rs.0  -  Rs.0',1200,'2022-05-05 09:26:19',NULL),(20,15,67,1,2,'Rs.1  -  Rs.2',3,0,'3 Km  -  0 Km','2022-05-03 00:00:00',3,10,0,0,0,'0',0,0,0,0,0,0,0,0,'Rs.0  -  Rs.0',999,'2022-05-05 09:27:27',NULL),(24,5,4,500,1000,'Rs.500  -  Rs.1000',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:26:32',NULL),(25,5,4,500,1000,'Rs.500  -  Rs.1000',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:26:34',NULL),(26,5,4,500,1000,'Rs.500  -  Rs.1000',NULL,10,NULL,'2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:26:38',NULL),(27,5,4,500,1000,'Rs.500  -  Rs.1000',NULL,10,NULL,'2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:26:40',NULL),(28,5,4,500,1000,'Rs.500  -  Rs.1000',NULL,10,NULL,'2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:26:42',NULL),(29,5,4,500,1000,'Rs.500  -  Rs.1000',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:26:44',NULL),(30,5,4,500,1000,'Rs.500  -  Rs.1000',NULL,10,NULL,'2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:27:08',NULL),(31,5,4,500,1000,'Rs.500  -  Rs.1000',NULL,10,NULL,'2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:27:10',NULL),(32,5,4,500,1000,'Rs.500  -  Rs.1000',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:28:12',NULL),(33,5,4,500,1000,'Rs.500  -  Rs.1000',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:28:46',NULL),(34,5,4,500,1000,'Rs.500  -  Rs.1000',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:28:49',NULL),(35,5,4,500,1000,'Rs.500  -  Rs.1000',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:28:54',NULL),(36,5,4,500,1000,'Rs.500  -  Rs.1000',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:29:06',NULL),(37,5,4,500,1000,'Rs.500  -  Rs.1000',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:30:52',NULL),(38,5,4,500,1000,'Rs.500  -  Rs.1000',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:31:10',NULL),(39,5,4,500,1000,'Rs.500  -  Rs.1000',1,10,'1 Km  -  10 Km','2022-05-03 00:00:00',0,0,0,0,0,'toyata',2021,150,0,0,0,0,0,0,'Rs.0  -  Rs.0',0,'2022-07-12 07:31:27',NULL);
/*!40000 ALTER TABLE `filter_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_inventory_mast`
--

DROP TABLE IF EXISTS `job_inventory_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_inventory_mast` (
  `job_inventory_id` int NOT NULL,
    `user_id` varchar(126) DEFAULT NULL,
  `job_inventory_code` varchar(45) DEFAULT NULL,
  `inventory_type` varchar(45) DEFAULT 'job',
  `j_title` varchar(126) DEFAULT NULL,
  `from_salary` int DEFAULT NULL,
  `to_salary` int DEFAULT NULL,
  `j_picture_link_1` varchar(512) DEFAULT NULL,
  `j_picture_link_2` varchar(512) DEFAULT NULL,
  `j_picture_link_3` varchar(512) DEFAULT NULL,
  `j_picture_link_4` varchar(512) DEFAULT NULL,
  `j_picture_link_5` varchar(512) DEFAULT NULL,
  `j_picture_link_6` varchar(512) DEFAULT NULL,
  `j_picture_link_7` varchar(512) DEFAULT NULL,
  `j_picture_link_8` varchar(512) DEFAULT NULL,
  `j_picture_link_9` varchar(512) DEFAULT NULL,
  `j_picture_link_10` varchar(512) DEFAULT NULL,
  `j_type_id` int DEFAULT NULL,
  `s_p_id` int DEFAULT NULL,
  `p_type_id` int DEFAULT NULL,
  `j_designation` varchar(126) DEFAULT NULL,
  `j_show_mo_no` tinyint DEFAULT NULL,
  `j_description` varchar(512) DEFAULT NULL,
  `j_location` varchar(512) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  `sub_cat_id` int DEFAULT NULL,
  PRIMARY KEY (`job_inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_inventory_mast`
--

LOCK TABLES `job_inventory_mast` WRITE;
/*!40000 ALTER TABLE `job_inventory_mast` DISABLE KEYS */;
INSERT INTO `job_inventory_mast` VALUES (1,1,'job_1','job','Graphic designer of 2 years of exp.',15000,40000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652859831/qysi7f6dnrxytzobbsqs.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'Jr. Graphic designer ',1,'Graphic designer of 2 years of exp.','surat',20.62181300,78.94652300,'2022-05-18 07:43:52',NULL,7,14),(2,1,'job_2','job','Physics Teacher',10000,52000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652859952/h5pnp59yxipqfwduao8g.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'Physics Teacher',1,'Physics Teacher for 11th science stundent','surat',20.62181300,78.94652300,'2022-05-18 07:45:53',NULL,7,13),(3,3,'job_3','job','job title',10,120000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657910153/d7enzly5i2nal3xxp9oi.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'de',1,'demo','surat',20.62958500,78.94652300,'2022-07-15 18:35:53',NULL,7,12),(4,5,'job_4','job','dsfdsfsdfdsfdsf',12,12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657945364/m5lwoqs6blortrtawhga.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',5,5,7,'dffds',1,'fsdfsfsffsafsdf','1212',21.20745270,72.83498750,'2022-07-16 04:22:45',NULL,7,12),(5,5,'job_5','job','dssdssdsdsds',11,12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657973623/d6fhd9coaaikzads3frg.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',7,4,6,'121',1,'121212121212','12121212',21.20745270,72.83498750,'2022-07-16 12:13:43',NULL,7,12),(6,3,'job_6','job','job title',10,120000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658561801/v2vdyhnqjcsh3kbhpea0.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'de',1,'demo','surat',20.62958500,78.94652300,'2022-07-23 07:36:41',NULL,7,12),(7,3,'job_7','job','job title',10,120000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658561806/awkcv4gx0idh0ui4qdjh.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'de',1,'demo','surat',20.62958500,78.94652300,'2022-07-23 07:36:47',NULL,7,12),(8,3,'job_8','job','job title',10,120000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658561970/t4dthyj4y1s0pgx7ow8f.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'de',1,'demo','surat',20.62958500,78.94652300,'2022-07-23 07:39:31',NULL,7,12),(9,3,'job_9','job','job title',10,120000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658577269/fik5oa38jlwfqxlvsfwm.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'de',1,'demo','surat',20.62958500,78.94652300,'2022-07-23 11:54:29',NULL,7,12),(10,3,'job_10','job','job title',10,120000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658730321/t3omn7sqhastjshj4kwk.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'de',1,'demo','surat',20.62958500,78.94652300,'2022-07-25 06:25:21',NULL,7,12),(11,3,'job_11','job','job title',10,120000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658731286/qklocdqfd8tyfmgtddut.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'de',1,'demo','surat',20.62958500,78.94652300,'2022-07-25 06:27:59','2022-07-25 06:41:27',7,12),(12,3,'job_12','job','job title',10,120000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658731298/brnpqrbeyhdd1pitwr9m.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'de',1,'demo','surat',20.62958500,78.94652300,'2022-07-25 06:41:32','2022-07-25 06:41:38',7,12),(13,145,'job_13','job','sdvf scd d',23,2143,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658774752/zxfxepnddo7szfbomdyx.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,0,'asvd cbsdvcv','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 18:45:52',NULL,7,11),(14,125,'job_14','job','job form test',2500,2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659031460/l6gaefmzcpsspcya8jua.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,11,8,'how',0,'Take a look at this ViewSonic 23.8 inch Full HD LED Backlit IPS Panel Hig','Vesu, Surat',0.00000000,0.00000000,'2022-07-28 18:04:20',NULL,7,11),(15,3,'job_15','job','job title',10,120000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659081010/d8ytzjinzw2lcl2smu6g.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'de',1,'demo','surat',20.62958500,78.94652300,'2022-07-29 07:50:10',NULL,7,12),(16,3,'job_16','job','job title',10,120000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659081445/dsxifmvfnlpcyjt4dhuj.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1659081446/nq4itfjyciq6iyfhplmn.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1659081447/p4lehzrdmmwvtowvrqdl.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'de',1,'demo','surat',20.62958500,78.94652300,'2022-07-29 07:57:28',NULL,7,12),(17,3,'job_17','job','job title',10,120000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659082182/sncxyp1ex3gjjmmmwkk4.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1659082183/iv1vfvaih1hsuldcyig1.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1659082184/hdf5vprowl95ubvqtjhf.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1,'de',1,'demo','surat',20.62958500,78.94652300,'2022-07-29 08:09:44',NULL,7,12),(18,125,'job_18','job','job job job',10000,100000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659151397/gv9sfahg7lsc3cs1jgjo.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,7,'tt',0,'how to make sure you','Udhana, Surat',0.00000000,0.00000000,'2022-07-30 03:23:18',NULL,7,15),(19,125,'job_19','job','job twst form',2555,25555,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659331399/kxgdsdnfjotocyfdiswu.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,6,6,'tdjdj',1,'how to make sure you are','Vesu, Surat',0.00000000,0.00000000,'2022-08-01 05:23:20',NULL,7,11),(20,125,'job_20','job','ogwiheixhrih',2555,2555,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659344297/zoptjhq9wsgarnmnqj4s.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,0,'if it jgjbigjgjgu','Vesu, Surat',0.00000000,0.00000000,'2022-08-01 08:58:18',NULL,7,12),(21,125,'job_21','job','BEST JOB IN SURAT',20000,30000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659437381/c8y0fy7lekqmppto5qfk.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,6,NULL,0,'how to make sure you','Vesu, Surat',0.00000000,0.00000000,'2022-08-02 10:49:41',NULL,7,23);
/*!40000 ALTER TABLE `job_inventory_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_type_mast`
--

DROP TABLE IF EXISTS `job_type_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_type_mast` (
  `j_type_id` int NOT NULL AUTO_INCREMENT,
  `j_type_name` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`j_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_type_mast`
--

LOCK TABLES `job_type_mast` WRITE;
/*!40000 ALTER TABLE `job_type_mast` DISABLE KEYS */;
INSERT INTO `job_type_mast` VALUES (5,'part-time','2022-07-04 15:12:44',NULL),(7,'full-time','2022-07-04 15:13:26',NULL);
/*!40000 ALTER TABLE `job_type_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_sequence_mast`
--

DROP TABLE IF EXISTS `login_sequence_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_sequence_mast` (
  `seq_date` date NOT NULL,
  `seq_id` bigint NOT NULL,
  PRIMARY KEY (`seq_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_sequence_mast`
--

LOCK TABLES `login_sequence_mast` WRITE;
/*!40000 ALTER TABLE `login_sequence_mast` DISABLE KEYS */;
INSERT INTO `login_sequence_mast` VALUES ('2022-07-19',2207190001),('2022-07-20',2207200010),('2022-07-21',22072100006),('2022-07-22',220722000002),('2022-07-23',220723000005),('2022-07-24',220724000002),('2022-07-25',220725000001),('2022-07-26',220726000007),('2022-07-28',220728000002),('2022-08-02',220802000008),('2022-08-03',220803000001),('2022-08-05',220805000002);
/*!40000 ALTER TABLE `login_sequence_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_brand_mast`
--

DROP TABLE IF EXISTS `mobile_brand_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mobile_brand_mast` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_brand_mast`
--

LOCK TABLES `mobile_brand_mast` WRITE;
/*!40000 ALTER TABLE `mobile_brand_mast` DISABLE KEYS */;
INSERT INTO `mobile_brand_mast` VALUES (1,'Apple','2022-05-02 11:21:06',NULL),(2,'Keypad','2022-05-02 11:21:32',NULL),(3,'samsung','2022-05-02 11:21:40',NULL),(4,'Oppo','2022-05-24 09:34:42',NULL),(5,'Vivo','2022-05-24 09:45:50',NULL),(6,'Redmi','2022-05-24 09:46:21',NULL),(7,'OnePlus','2022-05-24 09:48:35',NULL),(8,'Micromax','2022-05-24 09:49:59',NULL),(9,'Motorola','2022-05-24 09:50:11',NULL),(10,'Reliance Digital','2022-05-24 09:51:36',NULL),(11,'Poco','2022-05-24 09:51:57',NULL),(12,'Lenovo','2022-05-24 09:52:25',NULL),(13,'Lava','2022-05-24 09:52:43',NULL),(14,'Jio','2022-05-24 09:52:57',NULL),(15,'Iball','2022-05-24 09:53:17',NULL),(16,'Google','2022-05-24 09:53:39',NULL);
/*!40000 ALTER TABLE `mobile_brand_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_inventory_mast`
--

DROP TABLE IF EXISTS `mobile_inventory_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mobile_inventory_mast` (
  `mo_inventory_id` int NOT NULL,
    `user_id` varchar(126) DEFAULT NULL,
  `mo_inventory_code` varchar(45) DEFAULT NULL,
  `inventory_type` varchar(45) NOT NULL DEFAULT 'mobile',
  `mo_title` varchar(126) DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `model_name` varchar(126) DEFAULT NULL,
  `mo_ram` int DEFAULT NULL,
  `mo_rom` int DEFAULT NULL,
  `mo_colour` varchar(45) DEFAULT NULL,
  `mo_price` int DEFAULT NULL,
  `mo_picture_link_1` varchar(512) DEFAULT NULL,
  `mo_picture_link_2` varchar(512) DEFAULT NULL,
  `mo_picture_link_3` varchar(512) DEFAULT NULL,
  `mo_picture_link_4` varchar(512) DEFAULT NULL,
  `mo_picture_link_5` varchar(512) DEFAULT NULL,
  `mo_picture_link_6` varchar(512) DEFAULT NULL,
  `mo_picture_link_7` varchar(512) DEFAULT NULL,
  `mo_picture_link_8` varchar(512) DEFAULT NULL,
  `mo_picture_link_9` varchar(512) DEFAULT NULL,
  `mo_picture_link_10` varchar(512) DEFAULT NULL,
  `mo_front_camera` varchar(126) DEFAULT NULL,
  `mo_rear_camera` varchar(126) DEFAULT NULL,
  `mo_battery` varchar(45) DEFAULT NULL,
  `mo_bill` tinyint DEFAULT NULL,
  `mo_box` tinyint DEFAULT NULL,
  `mo_charger` tinyint DEFAULT NULL,
  `mo_headset` tinyint DEFAULT NULL,
  `mo_warranty` tinyint DEFAULT NULL,
  `insurance` tinyint DEFAULT NULL,
  `show_mo_no` tinyint DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `location` varchar(512) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  `sub_cat_id` int DEFAULT NULL,
  PRIMARY KEY (`mo_inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_inventory_mast`
--

LOCK TABLES `mobile_inventory_mast` WRITE;
/*!40000 ALTER TABLE `mobile_inventory_mast` DISABLE KEYS */;
INSERT INTO `mobile_inventory_mast` VALUES (1,5,'mobile_1','mobile','OPPO F15',1,'OPPO',1,4,'WHITE',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1653729856/jiegti1uezdzprmt6gtb.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62191300,78.94652400,'2022-05-28 09:13:25','2022-05-28 09:24:16',4,1),(2,5,'mobile_2','mobile','Iphone 8 plus ',1,'Iphone 8 plus',4,64,'silver',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656070122/nfmeiylkw6ab8vwo6ryd.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1500',1,1,1,0,0,1,1,'Front Facing Stereo Speakers, GPS\n4K Video Recording (2160p)','VIP road ',20.62191300,78.94652400,'2022-06-24 11:28:42',NULL,4,1),(3,5,'mobile_3','mobile','Samsung galaxy s8 in good condition ',2,'Samsung galaxy s8',6,32,'Blue ',16700,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656073912/djrvquogmbcl3dcdtl1s.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12','8','3500',1,1,1,0,0,1,1,'Fingerprint Scanner, Iris Scanner, Heart Rate Sensor, GPS','VIP road ',20.62191300,78.94652400,'2022-06-24 12:31:52',NULL,4,1),(4,7,'mobile_4','mobile','One plus 6T for sell ',2,'One plus 6T',8,256,'Black',14600,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656074314/eso974mhk1hgxttjo6gy.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12','8','4500',1,1,1,0,1,1,0,'4K Video Recording (2160p)\nFeaturesGPS, Fingerprint Scanner','piplod',20.62191300,78.94652400,'2022-06-24 12:38:34',NULL,4,1),(5,11,'mobile_5','mobile','Redmi note 7 pro ',2,'Redmi note 7 pro ',4,64,'Blue',4000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656074786/l4kha8sx1d29njvt5yvn.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'20','48','4100',1,1,1,0,0,0,1,'this phone is in good condition with fingerprint scanner , with good display ','Mehsana',20.62191300,78.94652400,'2022-06-24 12:46:26',NULL,4,1),(6,1,'mobile_6','mobile','demo datattatctdtctaddtd',5,'hgvjhbklkjhgvb',2,5,'Black',467567,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656425477/p1ywsjit7q0ntdiuryer.png','http://res.cloudinary.com/mr-group-tech/image/upload/v1656425479/sqwl2skzu1leyxntzzek.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1656425481/fcyyavyddz8anh95thet.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'23','rt65','456789',0,0,0,0,0,0,0,'gvhbjnkjlmvb kjnhb nnjkhjbn mklhjbn ','vb nmmkljn ',12.23650000,78.25580000,'2022-06-28 14:11:22',NULL,5,5),(7,1,'mobile_7','mobile','Dhaval Mobile Demo',1,'Demo Model',3,3,'Demo COlor',50000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656425854/vplduo3rz2fdahllppaf.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1656425856/nvdbpqmdeleoilv1xmey.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1656425858/vdnemwz2l7ype7pqahls.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1656425860/cqgvp7g7x9tvhw4hiwvi.png',NULL,NULL,NULL,NULL,NULL,NULL,'12','12','49999',1,1,1,1,1,1,1,'Demo Description data','Surat',12.23650000,78.25580000,'2022-06-28 14:17:40',NULL,5,5),(8,1,'mobile_8','mobile','demo 1 mobile',3,'top',2,5,'black',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656426197/wzkh0cwaq1inbjcsoeyn.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'top condition of experience','surat',12.23650000,78.25580000,'2022-06-28 14:23:18',NULL,5,5),(9,1,'mobile_9','mobile','how to make ',4,'how to ',4,3,'black',250,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656475884/if5o1520xadgxprgcsv8.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure ','surat',12.23650000,78.25580000,'2022-06-29 04:11:25',NULL,5,5),(10,1,'mobile_10','mobile','khushiiiiiiiiii',3,'Iphone 7',2,6,'pink',8000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656480213/gujmnftxyelwxedrh5lw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13','8','3000',1,0,1,0,0,0,1,'Demo tesing for apple','surat',12.23650000,78.25580000,'2022-06-29 05:23:34',NULL,5,5),(11,1,'mobile_11','mobile','by the task of ',3,'good ',3,6,'tt',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656499911/xebj0rntyaw7xm6im1ir.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you ','v',12.23650000,78.25580000,'2022-06-29 10:51:51',NULL,5,5),(12,1,'mobile_12','mobile','how to make sure',5,'model',3,4,'black',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656504401/qgldtq0kjuyjm4kjj7x4.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'hello I am sending you ','surat',12.23650000,78.25580000,'2022-06-29 12:06:42',NULL,5,5),(13,1,'mobile_13','mobile','hello I am sending you ',3,'iphone',3,4,'black',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656527379/u56mfhfcepsc49acpbk6.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'he\'ll be in the task ','Surat ',12.23650000,78.25580000,'2022-06-29 18:29:40',NULL,4,1),(14,1,'mobile_14','mobile','Hello Kitty and I ',4,'it ',3,4,'black',2580,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656568263/lbq1ljqbymmbjmkmnj2n.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you ','surat',12.23650000,78.25580000,'2022-06-30 05:51:04',NULL,4,1),(15,1,'mobile_15','mobile','how to make sure ',1,'how ',0,3,'black',25800,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656570886/of5yxluuvflbc1uvk8xh.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure ','surat',12.23650000,78.25580000,'2022-06-30 06:34:47',NULL,4,1),(16,1,'mobile_16','mobile','how to make sure you ',2,'how ',0,0,'how ',2580,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656570952/vckglw4jcn5tcssqbxrg.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure ','surat',12.23650000,78.25580000,'2022-06-30 06:35:52',NULL,4,1),(17,1,'mobile_17','mobile','best mobile',3,'best ',2,2,'black',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656588707/owb4fibjmbuykwr8mjrw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12','12','50000',1,1,1,1,1,0,1,'money problem no any issues mobile','surat',12.23650000,78.25580000,'2022-06-30 11:31:49',NULL,4,1),(18,5,'mobile_18','mobile','OPPO F15',1,'Test Model Name',4,8,'WHITE',12000,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-01 16:39:02',NULL,0,8),(19,5,'mobile_19','mobile','OPPO F15',1,'Test Model Name',4,8,'WHITE',12000,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-01 16:40:06',NULL,0,8),(20,5,'mobile_20','mobile','OPPO F15',1,'Test Model Name',4,8,'WHITE',12000,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 05:01:36',NULL,0,8),(21,5,'mobile_21','mobile','OPPO F15',1,'Test Model Name',4,8,'WHITE',12000,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 05:10:27',NULL,0,8),(22,5,'mobile_22','mobile','OPPO F15',1,'Test Model Name',4,8,'WHITE',12000,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 05:10:46',NULL,0,8),(23,5,'mobile_23','mobile',NULL,1,'Test Model Name',4,8,'WHITE',12000,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 05:14:47',NULL,0,8),(24,5,'mobile_24','mobile','dadadaadasdsa',1,'Test Model Name',4,8,'WHITE',12000,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 05:45:03',NULL,0,8),(25,5,'mobile_25','mobile','sdfdsfdsffdsf',5,'Test Model Name',4,8,'WHITE',12000,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 05:45:50',NULL,0,8),(26,5,'mobile_26','mobile','vdfvdfvfdvfdvdf',3,'vdfvdfvdfdv',4,8,'WHITE',12000,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 05:46:39',NULL,0,8),(27,5,'mobile_27','mobile','vdfvfdvdfdfg',5,'gdfgdfgfdgfdgdf',4,8,'WHITE',12000,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 05:53:34',NULL,0,8),(28,5,'mobile_28','mobile','sdvsdvsdvsdvs',5,'sdvsdvdsvsvdssdv',4,8,'ssvsdvsdvsdvs',12000,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 05:56:16',NULL,0,8),(29,5,'mobile_29','mobile','sdfsdfsdfsdfsd',5,'sdfdsfsdfsdfsdf',4,8,'fsdfdsfdsfsdfd',5164,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 06:00:26',NULL,0,8),(30,5,'mobile_30','mobile','vdfdfvfddfvdf',5,'dvdfvfdv',4,8,'dfvfdvdvd',414141,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 06:04:43',NULL,0,8),(31,5,'mobile_31','mobile','bddfbfdbdffb',5,'dfbdbdfb',4,8,'dfbdbd',86532,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bdfbd','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 06:08:37',NULL,0,8),(32,5,'mobile_32','mobile','sdfdgdfgdf',5,'dfgdfgdf',4,8,'dfgdfgdfg',4852,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'85','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 06:13:43',NULL,0,8),(33,5,'mobile_33','mobile','fdgdgdfgdfgdfg',5,'dfgdfgdfg',4,8,'dfgdfgdfg',8451,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'54654','8','2000',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 06:15:04',NULL,0,8),(34,5,'mobile_34','mobile','dscsdcdscdcs',4,'csdcdscdscdscsd',4,8,'cdscdscdscd',5120,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'85','8','85',5,5,5,5,6,5,5,'5hcsdygcgcyudsc','s',9.00000000,6.00000000,'2022-07-03 07:58:40',NULL,0,8),(35,5,'mobile_35','mobile','sdvsdfdsfdsfsf',3,'sdfsdfdsf',4,8,'232323',2323232,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'32323','8','2323232323',5,5,5,5,6,5,5,'32323232323232','32323',9.00000000,6.00000000,'2022-07-03 08:00:56',NULL,0,8),(36,5,'mobile_36','mobile','hhfghfghgfhf',1,'fghgfhgfhfghf',4,8,'hgfhgfhfgh',4747474,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'74747','8','74747',5,5,5,5,6,5,5,'4747474747474','474747',9.00000000,6.00000000,'2022-07-03 08:04:00',NULL,0,8),(37,5,'mobile_37','mobile','gdfgdfgdfgdf',15,'gdfgdfgdfgfd',4,8,'dgfdgdfg',515132,'12000',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4','8','4',5,5,5,5,6,5,5,'cddsfdsfdsfdsfsdfdsf','fsdf',21.19761920,72.83671040,'2022-07-03 08:06:10',NULL,0,8),(38,5,'mobile_38','mobile','25252525255',5,'5552',4,8,'25252',25252525,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656837287/zkvu4vtrtmokneqklpz1.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2525','8','25252',5,5,5,5,6,5,5,'52525252252','5252',21.19761920,72.83671040,'2022-07-03 08:34:47',NULL,0,8),(39,5,'mobile_39','mobile','dasdsadsadassa',2,'dasdasdas',3,3,'adsadsadasd',2121,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657042435/e941plhuketzzhwyxt6g.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12','8','122',5,5,5,5,6,5,5,'1212121212121','211212',21.20745270,72.83498750,'2022-07-05 17:33:56',NULL,0,8),(40,5,'mobile_40','mobile','wewewewqewqeqe',3,'esesffwef',3,3,'ewweew',34434,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657044648/ksa35e7jamgbuagsgelh.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3434','8','3434',5,5,5,5,6,5,5,'4343434343434','434343',21.20745270,72.83498750,'2022-07-05 18:10:49',NULL,0,8),(41,5,'mobile_41','mobile','Tetststsss',4,'ssssss',12,64,'sssss',12212212,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657124985/n9hr82kzqecuzhdk3p6q.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12','8','12',5,5,5,5,6,5,5,'121212122121212','21212',21.20745270,72.83498750,'2022-07-06 16:29:45',NULL,0,8),(42,5,'mobile_42','mobile','OPPO F15',1,'OPPO',1,3,'WHITE',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657128663/fp7eebnmvhlugbhiwnza.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-06 17:31:03',NULL,4,1),(43,5,'mobile_43','mobile','Add Product Information',3,'Add Product Information',3,64,'Add Product Information',323233,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657208354/rpf8xsbufmn83joqsnok.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12','8','12121212',1,1,1,1,1,1,1,'gssfgsgsdgsggsdgsg','sgsdgsgsdgds',21.20745270,72.83498750,'2022-07-07 15:39:14',NULL,0,8),(44,5,'mobile_44','mobile','Add Product Information',4,'Add Product Information',3,64,'Add Product Information',323232,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657208559/ehpwjvvdtvdex5h9g5j0.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1212','8','2121',1,0,0,0,1,0,1,'efsfdsfdsfsdfsfdsfdsfdsfsdf','fdsfdsfdsfdsf',21.19761920,72.82688000,'2022-07-07 15:42:39',NULL,0,8),(45,5,'mobile_45','mobile','Add Product Information',4,'Add Product Information',3,32,'Add Product Information',12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657209686/xanchwwp7pwusy10zvvc.png','http://res.cloudinary.com/mr-group-tech/image/upload/v1657209688/ldx40no5j5i0omatiam9.png','http://res.cloudinary.com/mr-group-tech/image/upload/v1657209689/pyzukxuuiewibwsbjepk.png','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined','12','8','12',1,1,1,1,1,1,1,'12121221212','212121',21.19761920,72.82688000,'2022-07-07 16:01:30',NULL,0,8),(46,5,'mobile_46','mobile','Add Product Information',3,'Add Product Information',12,64,'Add Product Information',12121,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657209947/hgu9gp4s0xtk0owy18hf.png','http://res.cloudinary.com/mr-group-tech/image/upload/v1657209949/r2ks4pcyvy5fcvphwg8c.png','http://res.cloudinary.com/mr-group-tech/image/upload/v1657209951/yxqu6tayf7mqcvxbjayg.png','http://res.cloudinary.com/mr-group-tech/image/upload/v1657209953/mkzcb6p0y1tcswdcnljl.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1657209955/lnsyj3c9uxgywfo2tbio.png','http://res.cloudinary.com/mr-group-tech/image/upload/v1657209958/klwvc6zepwnzfgqclisw.png','undefined',NULL,'undefined',NULL,'12','8','1221',1,1,1,1,1,1,1,'121212121212','21212',21.19761920,72.82688000,'2022-07-07 16:05:59',NULL,0,8),(47,5,'mobile_47','mobile','Add Product Information',1,'Add Product Information',4,8,'red',12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657212188/c9wjexmjgkvoemzkxrjj.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'undefined','8','undefined',5,5,5,5,6,5,5,'12121212121212121212121','21212121212',21.19761920,72.82688000,'2022-07-07 16:43:09',NULL,0,8),(48,5,'mobile_48','mobile','Test Car 1',2,'Test 1',4,8,'red',250000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657212628/j4rhxe2xsay7v3phrn51.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'undefined','8','undefined',5,5,5,5,6,5,5,'Test descrion','asa',21.19761920,72.82688000,'2022-07-07 16:50:29',NULL,0,8),(49,5,'mobile_49','mobile','errerererere',1,'24',4,8,'ewe',12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657298310/yx4sk6oemcudyxafrxlx.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'undefined','8','undefined',5,5,5,5,6,5,5,'121212112121','212121',21.22879020,72.82801560,'2022-07-08 16:38:30',NULL,0,8),(50,125,'mobile_50','mobile','hello I am sending ',2,'b',0,0,'b',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657556216/rnoi9gzkra2gsgdub3zn.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'he\'ll be in the task of experience ','Vesu, Surat',72.78005080,21.14187010,'2022-07-11 16:16:57',NULL,4,1),(51,125,'mobile_51','mobile','how to make sure you ',2,'b',0,0,'b',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657556414/ebetgfkatcupc9zudqrx.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'Hello Kitty and I will ','Vesu, Surat',72.78005080,21.14187010,'2022-07-11 16:20:14',NULL,4,1),(52,143,'mobile_52','mobile','Demo Data Mobile 1',5,'Demo',2,2,'Black',23000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657556778/y0sebry5p7pejr1widtc.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1657556779/ur4tg7mzsg12xjyrhgwm.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12','34','5000',0,0,0,0,0,0,0,'Demo mobile 1 now','Sardar Nagar, Bhavnagar',72.15359390,21.75263230,'2022-07-11 16:26:20',NULL,4,1),(53,143,'mobile_53','mobile','Demo Mobile Vivo',5,'Demo Vivo',3,4,'White',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657556871/sgdrdslak7l9o4brbcu6.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1657556872/cctrtx3jywosyv5o2sro.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12','23','5000',1,1,1,1,1,1,1,'demo mobile data','Sardar Nagar, Bhavnagar',72.15359390,21.75263230,'2022-07-11 16:27:53',NULL,4,1),(54,143,'mobile_54','mobile','jkhbmn cgfh',5,'bn bkh nm,j',3,3,'knnjk m,j',6789765,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657568038/otel3qrolqkigbhpkjrn.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'78','89','6789',0,0,0,0,0,0,0,'sdfbgfnhgv b','Sardar Nagar, Bhavnagar',72.15359390,21.75263230,'2022-07-11 19:33:58',NULL,4,1),(55,143,'mobile_55','mobile','jkuigyvb njuhbh ',4,'khygjv nbvqwert',3,3,'qwerfhgjhjkk',3456,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657568475/my3uob2ayezhfiav9wkz.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4','35','4567',0,0,0,0,0,0,0,'jycgh vbuvg uyjhvgb jjghjnb','Sardar Nagar, Bhavnagar',72.15359390,21.75263230,'2022-07-11 19:41:16',NULL,4,1),(56,143,'mobile_56','mobile','Demo Data aadde',4,'demo ',3,4,'White',27777,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657568663/x8jpxflgfmujyofeswtt.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1657568665/zpjfta67uglftucvsdjh.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'23','45','67893',0,0,0,0,0,0,0,'drgfhvjbkiouyigjvhb njuiygjvnb ','Sardar Nagar, Bhavnagar',72.15359390,21.75263230,'2022-07-11 19:44:27',NULL,4,1),(57,125,'mobile_57','mobile','how to make sure you ',2,'black',0,0,'white',250000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657605015/xlbpu2dpzio1pgr0rir6.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'Hello Kitty and I will ','Vesu, Surat',72.78009440,21.14250830,'2022-07-12 05:50:16',NULL,4,1),(58,125,'mobile_58','mobile','how to make sure you ',2,'black',0,0,'white',250000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657605023/pbdb3tsrqwrplhzzds3u.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'Hello Kitty and I will ','Vesu, Surat',72.78009440,21.14250830,'2022-07-12 05:50:23',NULL,4,1),(59,125,'mobile_59','mobile','nishi\'s phone ',7,'one plus nord',2,6,'black',5000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657608039/axofv4d8y9gnlmbzmunr.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13','40','5000',1,0,0,1,0,0,1,'nishi\'s phone','Vesu, Surat',72.78005080,21.14187010,'2022-07-12 06:40:39',NULL,4,1),(60,142,'mobile_60','mobile','mobile phone',6,'note 7pro',1,5,'blue',5000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657608068/yvuktl0qiacym26zygaz.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'13','48','4000',1,1,1,1,1,1,1,'this mobile is in good condition\n','Vesu, Surat',72.78013280,21.14172450,'2022-07-12 06:41:09',NULL,4,1),(61,125,'mobile_61','mobile','how to make sure you ',4,'brand',3,5,'black',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657627780/ifyyyvjuhirttteacvqn.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you are ','Vesu, Surat',72.78011210,21.14199830,'2022-07-12 12:09:40',NULL,4,1),(62,5,'mobile_62','mobile','red me pro black',6,'red me',1,3,'black',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657796260/kepuiveh3qiz79hwka0m.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-14 10:57:41',NULL,4,1),(63,125,'mobile_63','mobile','gbgvnghhhh',3,'hjm',3,4,'hh',25585,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657803480/gtgeoywg7r2dgrho7kxq.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',1,1,0,0,0,0,0,'gghhhghgggg','Udhana, Surat',72.83506000,21.15340667,'2022-07-14 12:58:01',NULL,4,1),(64,146,'mobile_64','mobile','how to make sure you ',3,'hjj',3,4,'h',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657828446/g5rwunrytcldojjbw0zl.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'HH Sheikh Zayed road Dubai UAE ','Vesu, Surat',72.78023100,21.14188800,'2022-07-14 19:54:06',NULL,4,1),(65,125,'mobile_65','mobile','how to make sure you ',5,'g',5,6,'f',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657853623/fbvwrnfegoogi1tj6lus.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you are ','Vesu, Surat',72.77993780,21.14249170,'2022-07-15 02:53:44',NULL,4,1),(66,146,'mobile_66','mobile','how to make sure you are ',4,'b',3,4,'Black',25880,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657888056/coharnu5vokwzutcik8e.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'hhhjj to the task of ','Vesu, Surat',72.78020770,21.14179010,'2022-07-15 12:27:36',NULL,4,1),(67,146,'mobile_67','mobile','key features to me that ',5,'yh',4,5,'n',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657888127/lzp4a1iprg9e52l0fzuy.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you ','Vesu, Surat',72.78020770,21.14179010,'2022-07-15 12:28:47',NULL,4,1),(68,146,'mobile_68','mobile','how to make sure you ',5,'but tame impala ',5,6,'h',25555,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657888318/ylguych8q45nw5ioof3t.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'hhhjj to the task of experience ','Vesu, Surat',72.78005080,21.14187010,'2022-07-15 12:31:58',NULL,4,1),(69,5,'mobile_69','mobile','Test Mobile',3,'6562',4,16,'21',12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657963450/yjfax9dulnud0meu6yyy.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined','12','12','12',1,1,1,1,1,NULL,1,'1212121212121','2121212',21.20745270,72.83498750,'2022-07-16 09:24:10',NULL,4,1),(70,5,'mobile_70','mobile','TEst Mobile ',3,'wqw',3,16,'wq',12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657963590/myqpaugtxbitxaparvov.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined','12','21','1112',1,1,1,1,1,NULL,1,'2121212121212121','121212',21.20745270,72.83498750,'2022-07-16 09:26:31',NULL,4,1),(71,5,'mobile_71','mobile','TEst Table',3,'wqw',3,16,'wq',12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657963616/rqq0hhmwfi6crqk8atg8.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined','12','21','1112',1,1,1,1,1,NULL,1,'2121212121212121','121212',21.20745270,72.83498750,'2022-07-16 09:26:56',NULL,4,2),(72,5,'mobile_72','mobile','red me pro black',6,'red me',1,3,'black',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657969666/urfueetm94obrxgrqn95.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-16 11:07:46',NULL,4,1),(73,5,'mobile_73','mobile','red me pro black',1,'red me',1,3,'black',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657969673/dx0awbhgbhyiqg157akn.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-16 11:07:53',NULL,4,1),(74,125,'mobile_74','mobile','hello hhhh to the task of experience ',4,'b',3,4,'black',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658242166/tcgaltdqyeuevf0qp47q.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-19 14:49:26',NULL,4,1),(75,125,'mobile_75','mobile','Hello hdjdjxjdjxkkdx',5,'how to make sure ',4,5,'black',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658242375/fimbrtlvwzsqicsev2gv.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'hello ','','',0,0,0,0,0,0,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-19 14:52:55',NULL,4,1),(76,125,'mobile_76','mobile','HH Sheikh Zayed road Dubai UAE Tel ',5,'hjjj',3,4,'black ',25555,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658242692/z187xjhkqfh3cw0exkny.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you are not ','Vesu, Surat',72.78005080,21.14187010,'2022-07-19 14:58:12',NULL,4,2),(77,146,'mobile_77','mobile','mehul rwthod',4,'me',3,6,'black',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658253061/s70qiauuhupmk6dvmhcx.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'mehul','','',0,0,0,0,0,0,0,'He was a temporary server error ','Udhana, Surat',72.83690630,21.15851810,'2022-07-19 17:51:01',NULL,4,1),(78,125,'mobile_78','mobile','how can you are interested ',5,'n',4,5,'b',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658323086/s4smy8r1dytzf4vg9z9m.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you are ','Vesu, Surat',72.78023760,21.14186090,'2022-07-20 13:18:07',NULL,4,1),(79,125,'mobile_79','mobile','how to make sure you are ',6,'h',4,6,'b',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658483629/proit50fu3mvkpdph6qr.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-22 09:53:50',NULL,4,1),(80,125,'mobile_80','mobile','how to make sure you are ',6,'h',4,4,'h',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658483681/gcuvcwsqzavihhmjcyzh.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you are ','Vesu, Surat',72.78005080,21.14187010,'2022-07-22 09:54:42',NULL,4,2),(81,5,'mobile_81','mobile','OPPO F15',1,'OPPO',1,3,'WHITE',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658510070/dryn2ru2rqxomnmobmar.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-22 17:14:31',NULL,4,1),(82,1,'mobile_82','mobile','OPPO F15',1,'OPPO',1,3,'WHITE',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658510297/hx8bo6gpzlqhencm7l76.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-22 17:18:18',NULL,4,1),(83,5,'mobile_83','mobile','test test test',3,'test',12,32,'red',120,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658511441/kqfqjs2ymib0m7ry6l5h.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined','12','12','12',1,1,1,1,1,NULL,1,'adasdasdasdasdasdsadasd','adasdas',21.20745270,72.83498750,'2022-07-22 17:37:22',NULL,4,1),(84,5,'mobile_84','mobile','Test New Mobile ',3,'F20s',12,128,'red',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658512407/egpkogq1hloumswctrmb.png','http://res.cloudinary.com/mr-group-tech/image/upload/v1658512409/rets1gpphghkwnpx06wf.png','http://res.cloudinary.com/mr-group-tech/image/upload/v1658512410/y2ksrt7mlxujajhq66xl.png','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined','12','12','1200',1,1,1,1,1,NULL,1,'Test description ','surat',21.22880410,72.82798450,'2022-07-22 17:53:31',NULL,4,1),(85,5,'mobile_85','mobile','OPPO F15',1,'OPPO',1,3,'WHITE',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658554684/wotdjvetzvfma5wljlq2.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-23 05:38:05',NULL,4,1),(86,5,'mobile_86','mobile','OPPO F15',1,'OPPO',1,3,'WHITE',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658554921/kag7doer24jd9dt7rinw.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-23 05:42:02',NULL,4,1),(87,5,'mobile_87','mobile','OPPO F15',1,'OPPO',1,3,'WHITE',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658555021/roou4nbeplqevyf0qnsw.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-23 05:43:41',NULL,4,1),(88,5,'mobile_88','mobile','OPPO F15',1,'OPPO',1,3,'WHITE',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658555108/wmhl5fcquyknmhferz9n.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-23 05:45:09',NULL,4,1),(89,5,'mobile_89','mobile','OPPO F15',1,'OPPO',1,3,'WHITE',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658555891/bsy8tjxkdnlc3neukj6f.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-23 05:58:11',NULL,4,1),(90,1,'mobile_90','mobile','OPPO F15',1,'OPPO',1,3,'WHITE',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658571958/lksgdd0njrmiqjolgkz3.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-23 10:25:59',NULL,4,1),(91,5,'mobile_91','mobile','fsdfsdfdss',3,'fsdf',12,64,'sdf',122,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658595599/ubcu3amdx1gdcpubq1e3.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined','12','12','12',1,1,1,1,1,NULL,1,'121212121121212','12121212',21.22881020,72.82795850,'2022-07-23 17:00:00',NULL,4,1),(92,5,'mobile_92','mobile','Test 11111',3,'11',4,8,'red',1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658601014/ols7la9zgvyqkr5pxey7.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined','12','12','12',1,1,1,1,1,NULL,1,'122364651561651','surat',21.20417280,72.83015680,'2022-07-23 18:30:16',NULL,4,1),(93,145,'mobile_93','mobile','OPPO F15',1,'OPPO',1,3,'WHITE',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658603738/sbauq4xbwqsv0ihhrhhg.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-23 19:15:38',NULL,4,1),(94,145,'mobile_94','mobile','Oppo reno 3',4,'reno',4,7,'black',40000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658605521/xlacudj80ahrdyjzmbf3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'500','450','40000',1,1,1,1,1,1,1,'phone conversation is so good','Udhana, Surat',72.83106070,21.17024380,'2022-07-23 19:45:21',NULL,4,1),(95,145,'mobile_95','mobile','Oppo reno 3',4,'reno',4,6,'black',40000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658605552/t3zjcg8xxby3eb0pitom.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'500','450','40000',1,1,1,1,1,1,1,'phone conversation is so good','Udhana, Surat',72.83106070,21.17024380,'2022-07-23 19:45:53',NULL,4,1),(96,125,'mobile_96','mobile','how to make sure you ',5,'g',4,6,'t',2,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658639193/aa6csghvo5553folqgqq.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you ','Udhana, Surat',21.15318000,72.83492000,'2022-07-24 05:06:34',NULL,4,1),(97,5,'mobile_97','mobile','dsfsfsdfsdf',3,'2112',6,8,'1212',212,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658645734/m3kuwgtup6wj460djyws.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined','12','12','12',1,1,1,1,1,NULL,1,'121212121212','12121',21.20417280,72.83015680,'2022-07-24 06:55:35',NULL,4,1),(98,5,'mobile_98','mobile','Test Mobile 1',10,'Test Mobile ',4,4,'Red',1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658648497/ndo8zg5lezsmjusmxcgi.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined','12','18','3500',1,1,1,1,1,NULL,1,'Test desctipn','surat',21.20417280,72.83015680,'2022-07-24 07:41:37',NULL,4,1),(99,125,'mobile_99','mobile','how to make sure you ',6,'v',4,6,'g',2,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658648848/pzlwttdu2gvs7hgs4ixm.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you ','Udhana, Surat',21.15318000,72.83492000,'2022-07-24 07:47:28',NULL,4,1),(100,125,'mobile_100','mobile','how to make sure you are ',6,'h',4,6,'y',2,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658724345/raxxu8jg1douqbhblaxs.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you are','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 04:45:46',NULL,4,1),(101,125,'mobile_101','mobile','how to make sure you are',5,'u',4,3,'y',2,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658724383/biiqunbbm2qtvj4b3pgu.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you are','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 04:46:23',NULL,4,1),(102,125,'mobile_102','mobile','how to make sure you are',6,'t',5,7,'t',250,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658725102/ohvxbsrnyei4dmwic2oy.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'how to make sure you are','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 04:58:22',NULL,4,1),(103,5,'mobile_103','mobile','OPPO F15',1,'OPPO',1,3,'WHITE',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658730693/nijjsogwchatlgcgdmbz.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-25 06:11:11','2022-07-25 06:31:34',4,1),(104,5,'mobile_104','mobile','OPPO F15',1,'OPPO',1,3,'WHITE',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658730708/jhjo1acbloshjqzjla4v.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'44MP','44MP','1000',1,1,0,1,0,1,1,'demo','surat',20.62181100,78.94655000,'2022-07-25 06:31:44','2022-07-25 06:31:49',4,1),(105,125,'mobile_105','mobile','hello hello hello hello hello ',5,'h',3,5,'black',25555,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658737328/ixewgaiyc8uegerdbivm.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','',0,0,0,0,0,0,0,'Hello hello hello','Vesu, Surat',0.00000000,0.00000000,'2022-07-25 08:22:08',NULL,4,1),(106,5,'mobile_106','mobile','Test Title 123',3,'ererere',4,4,'red',1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658768279/uyclltt8kgrexh1wsjyq.png','http://res.cloudinary.com/mr-group-tech/image/upload/v1658768280/seehaeyqlql83mqcvr49.png','http://res.cloudinary.com/mr-group-tech/image/upload/v1658768282/n6ucjprv9oezrecmv3wh.png','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined','12','12','12',1,1,1,1,1,NULL,1,'12121212112','121211',21.20089600,72.83343360,'2022-07-25 16:58:02',NULL,4,1),(107,145,'mobile_107','mobile','afvs rversfv',3,'wfv',3,4,'svd',353,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658774294/vkzmysmtrpx9zct99qsh.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,'sdvsvv SD FS vsf','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 18:38:15',NULL,4,1),(108,125,'mobile_108','mobile','hello hhhh to the task',7,'t',5,6,'y',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658802825/sxmemtaifhmpdv7xn9zy.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,'Hello Kitty and I','Udhana, Surat',0.00000000,0.00000000,'2022-07-26 02:33:48',NULL,4,1),(109,125,'mobile_109','mobile','how to make sure you y',5,'y',4,4,'b',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658833697/fxqitd1jlguczazlmkvm.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,'how to make sure you y','Vesu, Surat',0.00000000,0.00000000,'2022-07-26 11:08:17',NULL,4,1),(110,128,'mobile_110','mobile','hello I am sending you',8,'y',4,7,'black',2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658846341/apqa6fwcmm4bivxjpffk.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,'how to make sure you y','Vesu, Surat',0.00000000,0.00000000,'2022-07-26 14:39:01',NULL,4,1),(111,124,'mobile_111','mobile','Mobile 123',3,'123',1,1,'black',14250,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659030685/wlpn3k0ptc9mni3lmkpc.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12','12','12000',1,1,1,0,0,0,0,'no description','Udhana, Surat',0.00000000,0.00000000,'2022-07-28 17:51:26',NULL,4,1),(112,125,'mobile_112','mobile','Mehul stating form',5,'y',5,6,'uu',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659030690/juod03retagzlmlx7yvv.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,'how to make sure you are','Vesu, Surat',0.00000000,0.00000000,'2022-07-28 17:51:30',NULL,4,1),(113,125,'mobile_113','mobile','me and I will',5,'h',6,6,'h',2,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659087219/nnptvqirgtetmu3mmaft.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,'Take a look at this ZEBRONICS Zeb-Power Wired Optical Mouse on Flipkart\nhttps://dl.flipkart.com/s/wVlMEVNNNN','Udhana, Surat',0.00000000,0.00000000,'2022-07-29 09:33:40',NULL,4,1),(114,125,'mobile_114','mobile','today hkjhjj',5,'tik',3,6,'gg',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659098040/rb3kef4nghpjqbptwewr.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,'how to make sure you','Udhana, Surat',0.00000000,0.00000000,'2022-07-29 12:34:00',NULL,4,1),(115,125,'mobile_115','mobile','test active',5,'h',3,7,'t',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659099224/hypxmgxr1bnxzl0swisq.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,'how to make sure you','Udhana, Surat',0.00000000,0.00000000,'2022-07-29 12:53:44',NULL,4,1),(116,125,'mobile_116','mobile','today final',5,'t',3,5,'t',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659099340/q056wyoigx4r8f2brz5m.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,'how to make sure you','Udhana, Surat',0.00000000,0.00000000,'2022-07-29 12:55:40',NULL,4,1),(117,125,'mobile_117','mobile','31 07 mobile phone',6,'narzo',5,8,'black',3558,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659247000/yaosnafpmfsjdzckzbhi.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ti','j','6',1,1,0,1,1,0,0,'how to make sure you','Udhana, Surat',0.00000000,0.00000000,'2022-07-31 05:56:40',NULL,4,1),(118,125,'mobile_118','mobile','mobile form test',4,'hello',5,6,'black',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659329796/hfwb7t0uwqwjvmlhc1m3.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'23','78','358',1,1,1,1,1,1,1,'how to make sure you are','Vesu, Surat',0.00000000,0.00000000,'2022-08-01 04:56:36',NULL,4,1),(119,125,'mobile_119','mobile','mobile phone test',4,'j',2,4,'y',25088,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659690016/kvjjyze77fh87ppehqc5.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'899','oio','2500',0,0,0,0,0,0,0,'how to make a separate','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 09:00:17',NULL,4,1),(120,125,'mobile_120','mobile','how to sale',3,'tt',5,5,'black',2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659690764/ij7eqptkeicrigx5idqq.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'g','h','6',1,1,1,1,1,1,1,'how to sale','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 09:12:44',NULL,4,1),(121,125,'mobile_121','mobile','Testing of mobile form',3,'Samsung A1 for testing',2,4,'White',1234,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659692581/isiufpatcrrnewhk90kk.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12','13','5000',1,0,1,0,1,0,1,'Testing mobile form ...','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 09:43:02',NULL,4,1),(122,125,'mobile_122','mobile','Mobile form testing',4,'Samsung A1',3,6,'Grey',1234,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659696191/eipigo4nv8nfspc4wq5j.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'12','8','5000',1,1,1,1,1,1,1,'Mobile form testing ..','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 10:43:11',NULL,4,1);
/*!40000 ALTER TABLE `mobile_inventory_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_ram_mast`
--

DROP TABLE IF EXISTS `mobile_ram_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mobile_ram_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_ram_mast`
--

LOCK TABLES `mobile_ram_mast` WRITE;
/*!40000 ALTER TABLE `mobile_ram_mast` DISABLE KEYS */;
INSERT INTO `mobile_ram_mast` VALUES (1,'4 GB','2022-06-25 10:08:10',NULL),(2,'6 GB','2022-06-25 10:08:17',NULL),(3,'8 GB','2022-06-25 10:08:24',NULL),(4,'12 GB','2022-06-25 10:08:31',NULL),(5,'3 GB','2022-06-25 10:08:43',NULL),(6,'2 GB','2022-06-25 10:08:50',NULL),(7,'1 GB','2022-06-25 10:08:55',NULL),(8,'2gb','2022-06-29 17:10:18',NULL);
/*!40000 ALTER TABLE `mobile_ram_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_rom_mast`
--

DROP TABLE IF EXISTS `mobile_rom_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mobile_rom_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobile_rom_mast`
--

LOCK TABLES `mobile_rom_mast` WRITE;
/*!40000 ALTER TABLE `mobile_rom_mast` DISABLE KEYS */;
INSERT INTO `mobile_rom_mast` VALUES (1,'4 GB','2022-06-25 10:14:28',NULL),(2,'8 GB','2022-06-25 10:14:33',NULL),(3,'16 GB','2022-06-25 10:14:41',NULL),(4,'32 GB','2022-06-25 10:14:48',NULL),(5,'64 GB','2022-06-25 10:14:55',NULL),(6,'128 GB','2022-06-25 10:15:03',NULL),(7,'256 GB','2022-06-25 10:15:09',NULL),(8,'512 GB','2022-06-25 10:15:17',NULL),(9,'1  TB','2022-06-25 10:15:26',NULL);
/*!40000 ALTER TABLE `mobile_rom_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_cabin_mast`
--

DROP TABLE IF EXISTS `office_cabin_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_cabin_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_cabin_mast`
--

LOCK TABLES `office_cabin_mast` WRITE;
/*!40000 ALTER TABLE `office_cabin_mast` DISABLE KEYS */;
INSERT INTO `office_cabin_mast` VALUES (1,1,NULL,'2022-07-06 15:18:24'),(3,2,NULL,'2022-07-06 15:18:30'),(4,3,NULL,'2022-07-06 15:18:39'),(5,4,NULL,'2022-07-06 15:18:43'),(6,5,'2022-07-06 15:17:46','2022-07-06 15:18:50'),(7,6,'2022-07-06 15:19:23',NULL),(8,7,'2022-07-06 15:19:27',NULL),(9,8,'2022-07-06 15:19:30',NULL),(10,9,'2022-07-06 15:19:32',NULL),(11,10,'2022-07-06 15:19:40',NULL);
/*!40000 ALTER TABLE `office_cabin_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_car_parking_mast`
--

DROP TABLE IF EXISTS `office_car_parking_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_car_parking_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_car_parking_mast`
--

LOCK TABLES `office_car_parking_mast` WRITE;
/*!40000 ALTER TABLE `office_car_parking_mast` DISABLE KEYS */;
INSERT INTO `office_car_parking_mast` VALUES (1,'1'),(3,'2'),(4,'3'),(5,'4'),(6,'5'),(7,'6+');
/*!40000 ALTER TABLE `office_car_parking_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_employee_capacity_mast`
--

DROP TABLE IF EXISTS `office_employee_capacity_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_employee_capacity_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_employee_capacity_mast`
--

LOCK TABLES `office_employee_capacity_mast` WRITE;
/*!40000 ALTER TABLE `office_employee_capacity_mast` DISABLE KEYS */;
INSERT INTO `office_employee_capacity_mast` VALUES (5,'01 To 05','2022-07-04 16:00:38',NULL),(6,'06 To 10','2022-07-04 16:00:50',NULL),(7,'11 To 15','2022-07-04 17:23:02',NULL),(8,'16 To 20','2022-07-04 17:23:11',NULL),(9,'21 To 25','2022-07-04 17:23:21',NULL),(10,'26 To 30','2022-07-04 17:23:36',NULL),(11,'31 To 40','2022-07-04 17:23:46',NULL),(12,'41 To 50','2022-07-04 17:23:58',NULL),(13,'51 +','2022-07-04 17:24:08',NULL);
/*!40000 ALTER TABLE `office_employee_capacity_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_furnishing_mast`
--

DROP TABLE IF EXISTS `office_furnishing_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_furnishing_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_furnishing_mast`
--

LOCK TABLES `office_furnishing_mast` WRITE;
/*!40000 ALTER TABLE `office_furnishing_mast` DISABLE KEYS */;
INSERT INTO `office_furnishing_mast` VALUES (1,'furnished'),(3,'Semi-Furnished'),(4,'Un-Furnished');
/*!40000 ALTER TABLE `office_furnishing_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_inventory_mast`
--

DROP TABLE IF EXISTS `office_inventory_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_inventory_mast` (
  `office_inventory_id` int NOT NULL,
    `user_id` varchar(126) DEFAULT NULL,
  `office_inventory_code` varchar(45) DEFAULT NULL,
  `inventory_type` varchar(45) DEFAULT 'office',
  `o_title` varchar(126) DEFAULT NULL,
  `p_type_id` int DEFAULT NULL,
  `p_name` varchar(126) DEFAULT NULL,
  `cabin` int DEFAULT NULL,
  `washroom` int DEFAULT NULL,
  `o_sq_ft` decimal(12,6) DEFAULT NULL,
  `o_price` int DEFAULT NULL,
  `o_picture_link_1` varchar(512) DEFAULT NULL,
  `o_picture_link_2` varchar(512) DEFAULT NULL,
  `o_picture_link_3` varchar(512) DEFAULT NULL,
  `o_picture_link_4` varchar(512) DEFAULT NULL,
  `o_picture_link_5` varchar(512) DEFAULT NULL,
  `o_picture_link_6` varchar(512) DEFAULT NULL,
  `o_picture_link_7` varchar(512) DEFAULT NULL,
  `o_picture_link_8` varchar(512) DEFAULT NULL,
  `o_picture_link_9` varchar(512) DEFAULT NULL,
  `o_picture_link_10` varchar(512) DEFAULT NULL,
  `p_furnishing_id` int DEFAULT NULL,
  `p_car_parking_id` int DEFAULT NULL,
  `o_sup_builtup_area` decimal(12,6) DEFAULT NULL,
  `o_carpet_area` decimal(12,6) DEFAULT NULL,
  `p_listed_by_id` int DEFAULT NULL,
  `employee_capacity` int DEFAULT NULL,
  `o_maintenance` int DEFAULT NULL,
  `o_show_mo_no` tinyint DEFAULT NULL,
  `o_description` varchar(512) DEFAULT NULL,
  `o_location` varchar(512) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  `sub_cat_id` int DEFAULT NULL,
  PRIMARY KEY (`office_inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_inventory_mast`
--

LOCK TABLES `office_inventory_mast` WRITE;
/*!40000 ALTER TABLE `office_inventory_mast` DISABLE KEYS */;
INSERT INTO `office_inventory_mast` VALUES (1,1,'office_1','office','Furnished Office with 3 cabin',1,'Aagem arcade',3,1,1800.000000,200000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652509795/gfny4nft6b7qmc3xzitd.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,1500.000000,1800.000000,1,1,8000,1,'Furnished Office with 3 cabin','surat',20.62181300,78.94652300,'2022-05-14 06:29:55',NULL,6,9),(2,1,'office_2','office','Office near by adajan area',2,'Galaxy star',5,2,2500.000000,2300000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652509968/vfif2kmfau2zfbt4vmwr.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,3,2000.000000,2200.000000,1,55,20000,1,'HIgh furnitured office for urgent sell','surat',20.62181300,78.94652300,'2022-05-14 06:32:48',NULL,6,9),(3,6,'office_3','office','Unfurnished office for sell',1,'Podar ',2,2,1300.000000,145800,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652510788/hpgq4emgoxetvotgxdef.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,1400.000000,1300.000000,2,40,15000,1,'unfurnished office near Pal','surat',20.62181300,78.94652300,'2022-05-14 06:46:28',NULL,6,9),(4,11,'office_4','office','Office for urgent rent',1,'VIP plaza',1,0,9000.000000,23000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652511614/q3uz2dc3nrzmasf8bijx.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,8000.000000,9000.000000,1,15,4500,1,'urgent unfurnished office for rent','surat',20.62181300,78.94652300,'2022-05-14 07:00:14',NULL,6,10),(5,27,'office_5','office','Rent a office',1,'Luxaria',4,2,18000.000000,85000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652511967/zwgdagkwggaadg9toatv.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,3,17000.000000,18000.000000,2,450,25000,1,'Office with all furnished and with 4 cabin ','surat',20.62181300,78.94652300,'2022-05-14 07:06:08',NULL,6,10),(6,1,'office_6','office','ofc furniture option check',1,'ofc furniture option check',1,1,2650.000000,38999,'http://res.cloudinary.com/mr-group-tech/image/upload/v1652954889/coruaqamznix4aywv9dc.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,2600.000000,2300.000000,1,43,4356,1,'ofc furniture option check','Bharuch',20.62181300,78.94652300,'2022-05-19 10:08:09',NULL,6,9),(7,126,'office_7','office','dem data test',2,'Demornot',1,4,1215.000000,61000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656964721/llqp4dgq05yagqipgemp.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,150.000000,256.000000,0,0,1500,1,'Demo Data tons dornoto','Surat',12.23650000,78.25580000,'2022-07-04 19:58:41',NULL,6,9),(8,5,'office_8','office','sdsdadasdasdsa',5,'21',5,5,12.000000,12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657649514/jiz8kerxmdkm41fupwtf.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',5,4,12.000000,12.000000,3,12,12,1,'1212121212121212121','21212121212121',21.20745270,72.83498750,'2022-07-12 18:11:55',NULL,6,6),(9,5,'office_9','office','weewewqeqwe',3,'12',5,5,12.000000,12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657651417/txcongxxf7byfoekb0fh.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',2,4,12.000000,12.000000,3,9,12,1,'1212121212121','212121212',21.20745270,72.83498750,'2022-07-12 18:43:38',NULL,6,6),(10,5,'office_10','office','Test Office Form',2,'12',4,4,12.000000,12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657652096/wjiqxm7qboxdupcdqrp6.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',3,5,12.000000,12.000000,1,8,12,1,'tes test stest','122121212',21.22879430,72.82798800,'2022-07-12 18:54:56',NULL,6,6),(11,10,'office_11','office','OFFICCE PROPERTY',1,'PROPERTY name',1,1,12.000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658556131/upodozrprczknpbmn7o9.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.000000,10.000000,1,10,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-23 06:02:12',NULL,6,7),(12,10,'office_12','office','OFFICCE PROPERTY',1,'PROPERTY name',1,1,12.000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658556135/txfolirg0npwzrxjij8t.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.000000,10.000000,1,10,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-23 06:02:16',NULL,6,7),(13,10,'office_13','office','OFFICCE PROPERTY',1,'PROPERTY name',1,1,12.000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658558447/jhshaf8bsftkjbsuqlly.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.000000,10.000000,1,10,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-23 06:40:48',NULL,6,7),(14,10,'office_14','office','OFFICCE PROPERTY',1,'PROPERTY name',1,1,12.000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658576514/tfmlrt6u7zspi8j4raz9.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.000000,10.000000,1,10,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-23 11:41:55',NULL,6,7),(15,145,'office_15','office','vbhmgh dfc',2,'nikb h',3,6,465.000000,56,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658609920/b0algf1yttnpkefcezm1.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,6,5469.000000,4569.000000,6,10,425,1,' hgkgku go gkgykgykg ','Udhana, Surat',21.17024000,72.83106000,'2022-07-23 20:58:41',NULL,6,9),(16,10,'office_16','office','OFFICCE PROPERTY',1,'PROPERTY name',1,1,12.000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658653859/jtgh1y9qv8fqqzmtmpkx.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.000000,10.000000,1,10,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-24 09:10:59',NULL,6,7),(17,10,'office_17','office','OFFICCE PROPERTY',1,'PROPERTY name',1,1,12.000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658653882/ektmbw66objorzdtcoqv.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.000000,10.000000,1,10,10000,1,'demo','surat',27.32432300,72.43545400,'2022-07-24 09:11:22',NULL,6,7),(18,10,'office_18','office','OFFICCE PROPERTY',1,'PROPERTY name',1,1,12.000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658654322/fkvmryzqwwf1o0a2warx.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.000000,10.000000,1,10,10000,1,'demo','surat',21.22903595,72.91100202,'2022-07-24 09:18:42',NULL,6,7),(19,1,'office_19','office','jejrrjjrrheg',3,'djdhjdjde',3,3,8383.000000,12323,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658654824/m9zqvfef7qzh14ojpd3v.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,3,7373.000000,8382.000000,6,7,32332,1,'Vdhdhdhdhhhhh','Surat, GJ, India',21.22903595,72.91100202,'2022-07-24 09:27:04',NULL,6,9),(20,1,'office_20','office','jejrrjjrrheg',3,'djdhjdjde',3,3,8383.000000,12323,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658655180/wyw48b2zp1dlnwkf7glc.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,3,7373.000000,8382.000000,6,7,32332,1,'Vdhdhdhdhhhhh','Surat, GJ, India',21.22903595,72.91100202,'2022-07-24 09:33:01',NULL,6,9),(21,1,'office_21','office','jejrrjjrrheg',3,'djdhjdjde',3,3,8383.000000,12323,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658673732/stbtccjen4xoh1gqo7la.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,3,7373.000000,8382.000000,6,7,32332,1,'Vdhdhdhdhhhhh','Surat, GJ, India',21.22903595,72.91100202,'2022-07-24 14:42:13',NULL,6,9),(22,1,'office_22','office','jejrrjjrrheg',3,'djdhjdjde',3,3,8383.000000,12323,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658673751/vibmlpn4sie2vgalslt9.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,3,7373.000000,8382.000000,6,7,32332,1,'Vdhdhdhdhhhhh','Surat, GJ, India',21.22903595,72.91100202,'2022-07-24 14:42:32',NULL,6,9),(23,145,'office_23','office','vbhmgh dfc',2,'nikb h',3,6,465.000000,56,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658678501/nf2stbjspgoylki2pmfq.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,6,5469.000000,4569.000000,6,10,425,1,' hgkgku go gkgykgykg ','Udhana, Surat',21.17024000,72.83106000,'2022-07-24 16:01:42',NULL,6,9),(24,145,'office_24','office','sdvsbsb ds fs ffs f',2,'4tg ege',4,6,34.000000,32534244,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658689558/xg2tibrrr2q4zqgarhwh.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,5,4344.000000,444.000000,7,7,34544,1,' egtgr get get gr','Udhana, Surat',0.00000000,0.00000000,'2022-07-24 19:05:58',NULL,6,9),(25,10,'office_25','office','OFFICCE PROPERTY',1,'PROPERTY name',1,1,12.000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658730790/fbz36almk5ukfqmqwgea.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.000000,10.000000,1,10,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-25 06:33:01','2022-07-25 06:33:11',6,7),(26,145,'office_26','office','sdvfd vcsvdfd v',2,NULL,6,0,34.000000,3245,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658774393/yoeadnbtjjbdnlkg0xus.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,NULL,0,0,NULL,0,'svfd cbvfesvd fcb','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 18:39:53',NULL,6,10),(27,125,'office_27','office','sell office',2,'tt',5,1,250.000000,2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659031385/oycmauq1dfoebi6jzjef.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,5,25.000000,25.000000,7,9,250,0,'how to make sure','Vesu, Surat',0.00000000,0.00000000,'2022-07-28 18:03:05',NULL,6,9),(28,125,'office_28','office','rent office',2,'how to make',5,7,250.000000,25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659031431/wbhjj8mdx6dz9uwx7pp6.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,7,250.000000,250.000000,8,10,250,0,'Take a look at this ViewSonic 23.8 inch Full HD LED Backlit IPS Panel Hig','Vesu, Surat',0.00000000,0.00000000,'2022-07-28 18:03:51',NULL,6,10),(29,125,'office_29','office','office sell',2,'yh',5,6,25.000000,255,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659330587/uerk1mahkmohwticzmzc.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,7,250.000000,55.000000,6,11,55,0,'how to make sure you are','Vesu, Surat',0.00000000,0.00000000,'2022-08-01 05:09:47',NULL,6,9),(30,125,'office_30','office','sell office',2,'rk',5,3,2500.000000,2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659331081/t5qeoual1q1vrnef5o6n.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,4,2500.000000,3000.000000,7,9,2500,0,'hdjdkdkdkdj','Vesu, Surat',0.00000000,0.00000000,'2022-08-01 05:18:02',NULL,6,9),(31,125,'office_31','office','Sell office sell office',2,'Rajhansh',3,3,1800.000000,1234,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659697047/siqdd9q4s6zmkxlfdueu.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,4,1801.000000,1802.000000,1,6,4321,1,'Sell office sell office...','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 10:57:28',NULL,6,9);
/*!40000 ALTER TABLE `office_inventory_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_listed_by_mast`
--

DROP TABLE IF EXISTS `office_listed_by_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_listed_by_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_listed_by_mast`
--

LOCK TABLES `office_listed_by_mast` WRITE;
/*!40000 ALTER TABLE `office_listed_by_mast` DISABLE KEYS */;
INSERT INTO `office_listed_by_mast` VALUES (1,'Owner'),(5,'Builder'),(6,'Dealer'),(7,'owner'),(8,'owner'),(9,'owner');
/*!40000 ALTER TABLE `office_listed_by_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_type_mast`
--

DROP TABLE IF EXISTS `office_type_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_type_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_type_mast`
--

LOCK TABLES `office_type_mast` WRITE;
/*!40000 ALTER TABLE `office_type_mast` DISABLE KEYS */;
INSERT INTO `office_type_mast` VALUES (2,'Corporate Office'),(3,'Luxurious Office'),(4,'Shop'),(5,'Commercial Shop'),(6,'Corporate Office 1');
/*!40000 ALTER TABLE `office_type_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `office_washroom_mast`
--

DROP TABLE IF EXISTS `office_washroom_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office_washroom_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office_washroom_mast`
--

LOCK TABLES `office_washroom_mast` WRITE;
/*!40000 ALTER TABLE `office_washroom_mast` DISABLE KEYS */;
INSERT INTO `office_washroom_mast` VALUES (1,1,NULL,NULL),(3,2,NULL,NULL),(4,3,NULL,'2022-07-06 15:22:26'),(5,4,'2022-07-06 15:22:33',NULL),(6,5,'2022-07-06 15:22:36',NULL),(7,6,'2022-07-06 15:22:40',NULL);
/*!40000 ALTER TABLE `office_washroom_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_inventory_mast`
--

DROP TABLE IF EXISTS `package_inventory_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_inventory_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
    `user_id` varchar(126) DEFAULT NULL,
  `inventory_code` varchar(126) DEFAULT NULL,
  `inventory_type` varchar(126) DEFAULT NULL,
  `purchase_ads_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `is_active` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_inventory_mast`
--

LOCK TABLES `package_inventory_mast` WRITE;
/*!40000 ALTER TABLE `package_inventory_mast` DISABLE KEYS */;
INSERT INTO `package_inventory_mast` VALUES (1,1,'bike_3','bike',4,'2022-06-01 11:44:34',NULL,NULL,NULL,NULL),(2,3,'all_1','all',1,'2022-06-01 11:45:52',NULL,NULL,NULL,NULL),(3,1,'car_sell_1','car',2,'2022-06-01 11:48:14',NULL,NULL,NULL,NULL),(4,2,'car_rent_1','car',2,'2022-06-01 11:51:19',NULL,NULL,NULL,NULL),(5,2,'job_2','job',2,'2022-06-01 11:52:18',NULL,NULL,NULL,NULL),(6,2,'mobile_1','mobile',2,'2022-06-07 04:41:42',NULL,NULL,NULL,NULL),(7,2,'all_2','all',2,'2022-06-07 04:41:55',NULL,NULL,NULL,NULL),(8,2,'office_5','office',2,'2022-06-07 04:42:00',NULL,NULL,NULL,NULL),(9,3,'all_3','all',1,'2022-06-15 04:03:26',NULL,NULL,NULL,NULL),(10,3,'all_4','all',1,'2022-06-15 04:03:50',NULL,NULL,NULL,NULL),(11,4,'property_rent_4','property',5,'2022-06-16 06:28:52',NULL,NULL,NULL,NULL),(12,4,'all_4','all',5,'2022-07-05 12:07:54',NULL,NULL,NULL,NULL),(13,4,'all_4','all',5,'2022-07-14 18:02:56',NULL,'2022-07-01 05:22:55','2022-07-16 05:22:55',0),(14,4,'all_4','all',10,'2022-08-01 05:22:55',NULL,'2022-08-01 05:22:55','2022-08-16 05:22:55',NULL),(15,4,'all_4','all',10,'2022-08-01 06:16:34',NULL,'2022-07-01 05:22:55','2022-07-16 06:16:34',0);
/*!40000 ALTER TABLE `package_inventory_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `package_price_mast`
--

DROP TABLE IF EXISTS `package_price_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_price_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `package_days` int DEFAULT NULL,
  `total_ads` int DEFAULT NULL,
  `package_price` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  `message` varchar(126) DEFAULT NULL,
  `total_month` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package_price_mast`
--

LOCK TABLES `package_price_mast` WRITE;
/*!40000 ALTER TABLE `package_price_mast` DISABLE KEYS */;
INSERT INTO `package_price_mast` VALUES (1,15,1,99,'2022-05-26 05:46:26',NULL,1,NULL,3),(3,15,1,99,'2022-05-26 05:58:39',NULL,3,NULL,3),(5,15,1,99,'2022-05-26 05:58:53',NULL,3,NULL,3),(6,15,1,99,'2022-05-26 06:18:06','2022-07-15 07:23:39',6,'get the best response of upto 4 times more buyers',3),(7,15,1,99,'2022-07-14 18:03:04',NULL,5,NULL,3),(8,15,1,99,'2022-07-14 18:19:27',NULL,5,NULL,3),(9,15,1,99,'2022-07-14 18:29:16',NULL,5,NULL,3),(10,15,1,99,'2022-07-28 10:14:38','2022-07-28 10:21:46',6,'get the best response of upto 4 times more buyers',3);
/*!40000 ALTER TABLE `package_price_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_type_mast`
--

DROP TABLE IF EXISTS `position_type_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position_type_mast` (
  `p_type_id` int NOT NULL AUTO_INCREMENT,
  `p_type_name` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`p_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_type_mast`
--

LOCK TABLES `position_type_mast` WRITE;
/*!40000 ALTER TABLE `position_type_mast` DISABLE KEYS */;
INSERT INTO `position_type_mast` VALUES (6,'Freelancer','2022-07-04 15:25:00',NULL),(7,'Remotely','2022-07-04 15:25:12',NULL),(8,'At work place','2022-07-04 15:25:33',NULL);
/*!40000 ALTER TABLE `position_type_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_bathroom_mast`
--

DROP TABLE IF EXISTS `property_bathroom_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_bathroom_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_bathroom_mast`
--

LOCK TABLES `property_bathroom_mast` WRITE;
/*!40000 ALTER TABLE `property_bathroom_mast` DISABLE KEYS */;
INSERT INTO `property_bathroom_mast` VALUES (1,1,NULL,'2022-07-06 15:01:43'),(3,2,NULL,'2022-07-06 15:01:49'),(4,3,NULL,'2022-07-06 15:01:58'),(5,4,'2022-07-06 15:00:41','2022-07-06 15:02:04'),(6,5,'2022-07-06 15:02:44',NULL),(7,6,'2022-07-06 15:02:55',NULL),(8,7,'2022-07-06 15:02:57',NULL),(9,8,'2022-07-06 15:03:00',NULL),(10,9,'2022-07-06 15:03:03',NULL);
/*!40000 ALTER TABLE `property_bathroom_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_bedroom_mast`
--

DROP TABLE IF EXISTS `property_bedroom_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_bedroom_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_bedroom_mast`
--

LOCK TABLES `property_bedroom_mast` WRITE;
/*!40000 ALTER TABLE `property_bedroom_mast` DISABLE KEYS */;
INSERT INTO `property_bedroom_mast` VALUES (2,1,NULL,'2022-07-06 14:59:04'),(3,2,NULL,'2022-07-06 14:59:10'),(4,3,'2022-05-30 09:24:11','2022-07-06 14:59:18'),(5,4,'2022-05-30 09:24:14','2022-07-06 14:59:23'),(6,5,'2022-07-06 14:55:27','2022-07-06 14:59:29'),(7,6,'2022-07-06 14:55:37','2022-07-06 14:59:35'),(8,7,'2022-07-06 14:56:17','2022-07-06 14:59:41'),(9,8,'2022-07-06 14:57:42','2022-07-06 14:59:47'),(10,9,'2022-07-06 14:58:27','2022-07-06 14:59:54');
/*!40000 ALTER TABLE `property_bedroom_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_car_parking_mast`
--

DROP TABLE IF EXISTS `property_car_parking_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_car_parking_mast` (
  `p_car_parking_id` int NOT NULL AUTO_INCREMENT,
  `p_car_parking_name` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`p_car_parking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_car_parking_mast`
--

LOCK TABLES `property_car_parking_mast` WRITE;
/*!40000 ALTER TABLE `property_car_parking_mast` DISABLE KEYS */;
INSERT INTO `property_car_parking_mast` VALUES (1,'1','2022-05-25 07:55:32',NULL),(2,'2','2022-05-25 07:55:40',NULL),(3,'3','2022-05-25 07:55:45',NULL),(4,'4','2022-05-25 07:55:52','2022-07-06 15:09:39'),(5,'5+','2022-07-06 15:09:16','2022-07-06 15:09:46');
/*!40000 ALTER TABLE `property_car_parking_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_furnishing_mast`
--

DROP TABLE IF EXISTS `property_furnishing_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_furnishing_mast` (
  `p_furnishing_id` int NOT NULL AUTO_INCREMENT,
  `p_furnishing_name` varchar(512) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`p_furnishing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_furnishing_mast`
--

LOCK TABLES `property_furnishing_mast` WRITE;
/*!40000 ALTER TABLE `property_furnishing_mast` DISABLE KEYS */;
INSERT INTO `property_furnishing_mast` VALUES (2,'Semi-Furnished','2022-05-25 07:58:05',NULL),(3,'Unfurnished','2022-05-25 07:58:23',NULL),(5,'Furnished','2022-07-06 15:08:03',NULL);
/*!40000 ALTER TABLE `property_furnishing_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_inventory_mast`
--

DROP TABLE IF EXISTS `property_inventory_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_inventory_mast` (
  `property_inventory_id` int NOT NULL,
    `user_id` varchar(126) DEFAULT NULL,
  `property_inventory_code` varchar(45) DEFAULT NULL,
  `inventory_type` varchar(45) DEFAULT 'property',
  `p_title` varchar(126) DEFAULT NULL,
  `p_type_id` int DEFAULT NULL,
  `p_name` varchar(126) DEFAULT NULL,
  `p_bedroom` int DEFAULT NULL,
  `p_bathroom` int DEFAULT NULL,
  `p_sq_ft` decimal(20,8) DEFAULT NULL,
  `p_price` int DEFAULT NULL,
  `p_picture_link_1` varchar(512) DEFAULT NULL,
  `p_picture_link_2` varchar(512) DEFAULT NULL,
  `p_picture_link_3` varchar(512) DEFAULT NULL,
  `p_picture_link_4` varchar(512) DEFAULT NULL,
  `p_picture_link_5` varchar(512) DEFAULT NULL,
  `p_picture_link_6` varchar(512) DEFAULT NULL,
  `p_picture_link_7` varchar(512) DEFAULT NULL,
  `p_picture_link_8` varchar(512) DEFAULT NULL,
  `p_picture_link_9` varchar(512) DEFAULT NULL,
  `p_picture_link_10` varchar(512) DEFAULT NULL,
  `p_furnishing_id` int DEFAULT NULL,
  `p_car_parking_id` int DEFAULT NULL,
  `p_sup_builtup_area` decimal(12,8) DEFAULT NULL,
  `p_carpet_area` decimal(12,8) DEFAULT NULL,
  `p_listed_by_id` int DEFAULT NULL,
  `p_status_id` int DEFAULT NULL,
  `p_preferred_renters_id` int DEFAULT NULL,
  `p_maintenance` int DEFAULT NULL,
  `p_show_mo_no` tinyint DEFAULT NULL,
  `p_description` varchar(512) DEFAULT NULL,
  `p_location` varchar(512) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  `sub_cat_id` int DEFAULT NULL,
  PRIMARY KEY (`property_inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_inventory_mast`
--

LOCK TABLES `property_inventory_mast` WRITE;
/*!40000 ALTER TABLE `property_inventory_mast` DISABLE KEYS */;
INSERT INTO `property_inventory_mast` VALUES (1,5,'property_sell_1','property','2 BHK apartment for sell ',1,'sunshine residency',2,2,1250.00000000,3800000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656068068/hvyqz2xajdoelubruvjw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,1300.00000000,1200.00000000,1,2,NULL,7500,1,'2 bhk flate for sell','vesu',20.62191300,78.94652400,'2022-06-24 10:54:28',NULL,6,7),(2,1,'property_sell_2','property','well furnished flate for sell',3,'Nandanvan 2',3,2,1760.00000000,6800900,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656068227/fcar5mio6apopuqoo4jq.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,1750.00000000,1500.00000000,1,1,NULL,12000,1,'\nIt is a 3 bhk fully furnished flat at main location.With 2 balcony and all electronic items are included. Hospital,mall,all market like fruit and vegetables are nearby.With 24/7 smc water supply and piped gas.less','Adajan',20.62191300,78.94652400,'2022-06-24 10:57:07',NULL,6,7),(3,1,'property_sell_3','property','Farmhouse for sell',3,'YOLOFarms 600',5,4,3400.00000000,35000999,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656068623/dbvrhafhxarsvx4p6rpr.jpg','http://res.cloudinary.com/mr-group-tech/image/upload/v1656068625/qkpaua1hyiwjsmspahdu.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3500.00000000,2800.00000000,2,1,NULL,20000,1,'Anniversary at YOLOFarms,Baby Shower,Bachelor Party,Birthday at YOLOFarms,Corporate Events at YOLOFarms,Family Picnic,Friends Hangout,Marriage,Photoshoots at YOLOFarms,Weekend Stay','Navsari',20.62191300,78.94652400,'2022-06-24 11:03:46',NULL,6,7),(4,3,'property_rent_4','property','Villa for rent',1,'Fh  ALISHAN VILLA',3,2,4300.00000000,7000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656069127/uc6dplxtlac3e3hda2su.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,3900.00000000,4200.00000000,1,NULL,1,6789,1,'Farm house for rent on best price','palanpur',20.62191300,78.94652400,'2022-06-24 11:12:08',NULL,6,8),(5,3,'property_rent_5','property','4 BHK flats ',1,'surya flats ',4,3,1300.00000000,17000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1656069553/eaijkfobdnupjwmwqezn.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,3,1250.00000000,1300.00000000,1,NULL,1,3400,1,'This is a beautiful 2 bhk flat for rent in adajan, surat. It is a part of 2bhk semifurnished flatand has a super built-Up area of 1220 sq.Ft. This flat with a single balcony is on 4th floor of 12 floors. It is available for family. This apartment has 2 bathroom(s). This is an east facing flat. It is in a gated society. This property has an expected monthly rental of rs. 14000.00/- (Price negotiable). Some of the additional costs include security of rs. 3.00 the brokerage amount is rs 14000.00(Fixed) les','Pal',20.62191300,78.94652400,'2022-06-24 11:19:14',NULL,6,8),(6,5,'property_sell_6','property','fsfdsfdssffs',1,'21212',6,6,1.00000000,2121,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657453391/pw3bfhnk6g5l1cbdbjz3.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',2,5,1.00000000,2121.00000000,3,4,NULL,2121,1,'2121212121112121','121212121',21.20745270,72.83498750,'2022-07-10 11:43:12',NULL,6,6),(7,5,'property_sell_7','property','dfsfsfsfsdfsdfsdf',3,'11',5,5,1.00000000,1,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657453470/ygwndeukclyyqaagtmyk.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',5,2,1.00000000,11.00000000,2,3,NULL,111,1,'111111111111111111111111111111111','111111111111111',21.22880690,72.82800550,'2022-07-10 11:44:31',NULL,6,6),(8,5,'property_sell_8','property','Test Property',1,'New Property ',2,1,1.00000000,1,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657454069/j8zhhvvxhmrmigvqrqx4.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',5,1,1.00000000,123.00000000,1,3,NULL,123,1,'1234567891025','212122',21.20745270,72.83498750,'2022-07-10 11:54:29',NULL,6,6),(9,5,'property_sell_9','property','ddwdfsdfsdfsdfsd',1,'21',2,1,12.00000000,1212,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657637530/wlskefzzuu5lmuereqwj.png','http://res.cloudinary.com/mr-group-tech/image/upload/v1657637531/ffumxo1lij0hljvhf1tk.png','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',2,1,12.00000000,12.00000000,1,3,NULL,12,1,'2121121212121','12121',21.22879420,72.82798900,'2022-07-12 14:52:12',NULL,6,6),(10,5,'property_rent_10','property','test deddede',1,'12',2,1,12.00000000,12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657639640/ngot6zcwuxqg1moijblg.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',2,3,21.00000000,12.00000000,2,NULL,NULL,121,1,'1212121211212','1212121',21.20745270,72.83498750,'2022-07-12 15:27:21',NULL,6,6),(11,5,'property_rent_11','property','Test Property Rent',1,'Hello House',5,5,50.00000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657652672/hhecy9pvkbpsymub0the.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',5,2,12.00000000,12.00000000,1,NULL,2,12,1,'Test TEst Test ','Tets ',21.20745270,72.83498750,'2022-07-12 19:04:34',NULL,6,6),(12,5,'property_sell_12','property','ffsdfsdfdsfs',1,'12',4,5,12.00000000,12,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657967256/l38rzffeh50ytrezlfcx.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',2,4,12.00000000,12.00000000,2,3,NULL,12121,1,'12121212121','12121212',21.20745270,72.83498750,'2022-07-16 10:27:36',NULL,6,7),(13,5,'property_sell_13','property','name',1,'PROPERTY name',1,1,12.00000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658566252/c5kcvdjvmwjcusq9togu.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.00000000,10.00000000,1,1,NULL,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-23 08:50:53',NULL,6,6),(14,5,'property_sell_14','property','name',1,'PROPERTY name',1,1,12.00000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658566258/sexnsymbjvhpmtgkpnfd.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.00000000,10.00000000,1,1,NULL,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-23 08:50:58',NULL,6,6),(15,5,'property_sell_15','property','name',1,'PROPERTY name',1,1,12.00000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658566523/jhfzwxnvyhdjnzohd5qf.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.00000000,10.00000000,1,1,NULL,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-23 08:55:24',NULL,6,6),(16,1,'property_rent_16','property','PROPERTY',1,'PROPERTY name',1,1,12.00000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658566750/uhzbmfv8lexwdu3jbivf.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.00000000,10.00000000,1,NULL,1,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-23 08:59:11',NULL,6,8),(17,1,'property_rent_17','property','PROPERTY',1,'PROPERTY name',1,1,12.00000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658566754/k2doswm5ynk0gq40ojsf.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.00000000,10.00000000,1,NULL,1,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-23 08:59:14',NULL,6,8),(18,1,'property_rent_18','property','PROPERTY',1,'PROPERTY name',1,1,12.00000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658567503/x88e4zjoiet1stmubvvw.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.00000000,10.00000000,1,NULL,1,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-23 09:11:43',NULL,6,8),(19,5,'property_sell_19','property','name',1,'PROPERTY name',1,1,12.00000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658577483/uvye9dm8zp8qfqa7ojn2.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.00000000,10.00000000,1,1,NULL,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-23 11:58:03',NULL,6,6),(20,1,'property_rent_20','property','PROPERTY',1,'PROPERTY name',1,1,12.00000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658577587/pprlcf88yreley4iwgxu.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.00000000,10.00000000,1,NULL,1,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-23 11:59:48',NULL,6,8),(21,145,'property_sell_21','property','sell property',1,'20250',4,5,4510.00000000,45000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658608454/h2psog0xxnrl9clkzvsm.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,2000.00000000,2020.00000000,4,6,NULL,250520,1,'ewfgt mnerg ER g','Udhana, Surat',72.83106070,21.17024380,'2022-07-23 20:34:14',NULL,6,7),(22,145,'property_sell_22','property','sell property',1,'20250',4,5,4510.00000000,45000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658608461/si2bwmu4aqrfmfx0olpv.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,2000.00000000,2020.00000000,4,6,NULL,250520,1,'ewfgt mnerg ER g','Udhana, Surat',72.83106070,21.17024380,'2022-07-23 20:34:21',NULL,6,7),(23,145,'property_sell_23','property','sell property',1,'20250',4,5,4510.00000000,45000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658608520/xgetxifrgkbfrd8qfiy2.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,2000.00000000,2020.00000000,4,6,NULL,250520,1,'ewfgt mnerg ER g','Udhana, Surat',72.83106070,21.17024380,'2022-07-23 20:35:21',NULL,6,7),(24,145,'property_sell_24','property','sell property',1,'20250',4,5,4510.00000000,45000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658608532/lqzg87jfpjojkrrf48tb.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,2000.00000000,2020.00000000,4,6,NULL,250520,1,'ewfgt mnerg ER g','Udhana, Surat',72.83106070,21.17024380,'2022-07-23 20:35:33',NULL,6,7),(25,145,'property_sell_25','property','sell property',1,'20250',4,5,4510.00000000,45000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658608566/xb3qt6nuyhwf8jhmsioe.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,2000.00000000,2020.00000000,4,6,NULL,250520,1,'ewfgt mnerg ER g','Udhana, Surat',72.83106070,21.17024380,'2022-07-23 20:36:07',NULL,6,7),(26,145,'property_sell_26','property','Property sell',2,'fhbgfc6',4,5,400.00000000,2165156,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658609151/lisug6ruieiyake0o7rn.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,3,651.00000000,2032.00000000,2,4,NULL,21520,1,'DCF dfhfdhftgh fgth','Udhana, Surat',72.83106070,21.17024380,'2022-07-23 20:45:51',NULL,6,7),(27,145,'property_sell_27','property','Property sell',2,'fhbgfc6',4,5,400.00000000,2165156,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658609166/rq3kg6u33rgzg4d7tqfd.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,3,651.00000000,2032.00000000,2,4,NULL,21520,1,'DCF dfhfdhftgh fgth','Udhana, Surat',72.83106070,21.17024380,'2022-07-23 20:46:07',NULL,6,7),(28,145,'property_sell_28','property','hf fth fthftghfth',3,'fgx df',4,5,45.00000000,25100,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658609355/dsdh6zqwn2sxtdb5pqus.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,2,515.00000000,451.00000000,2,6,NULL,5152,1,'rse tgrd gdhgd','Udhana, Surat',21.17024000,72.83106000,'2022-07-23 20:49:16',NULL,6,7),(29,145,'property_sell_29','property','hf fth fthftghfth',3,'fgx df',4,5,45.00000000,25100,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658609370/vtbbfbxxjedcaptxyivq.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,2,515.00000000,451.00000000,2,6,NULL,5152,1,'rse tgrd gdhgd','Udhana, Surat',21.17024000,72.83106000,'2022-07-23 20:49:30',NULL,6,7),(30,145,'property_sell_30','property','sefgrsewg gfhb',2,'ghj',2,4,2105.00000000,6515,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658609868/lxbxyad1sh2kkymqb7ud.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,4,145.00000000,5.00000000,1,NULL,NULL,1235241,1,'hgvk. ghkc gckkg','Udhana, Surat',21.17024000,72.83106000,'2022-07-23 20:57:48',NULL,6,8),(31,145,'property_sell_31','property','ewfrgdt. hj n,jn',1,'4567bhj kl,',3,6,345.00000000,45678,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658678614/pg4yvthkjx7tuynhcvwc.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,2,5678.00000000,567.00000000,3,6,NULL,5678,1,'BJ nkjiuhbj iuhbjn hiujkbn m','Udhana, Surat',21.17024000,72.83106000,'2022-07-24 16:03:34',NULL,6,7),(32,145,'property_sell_32','property','ewfrgdt. hj n,jn',1,'4567bhj kl,',3,6,345.00000000,45678,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658678696/hco77phkpephlposu5wm.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,2,5678.00000000,567.00000000,3,6,NULL,5678,1,'BJ nkjiuhbj iuhbjn hiujkbn m','Udhana, Surat',21.17024000,72.83106000,'2022-07-24 16:04:56',NULL,6,7),(33,145,'property_sell_33','property','ewfrgdt. hj n,jn',1,'4567bhj kl,',3,6,345.00000000,45678,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658679046/peykha5weiqvoy4dxnvf.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,2,5678.00000000,567.00000000,3,6,NULL,5678,1,'BJ nkjiuhbj iuhbjn hiujkbn m','Udhana, Surat',21.17024000,72.83106000,'2022-07-24 16:10:47',NULL,6,7),(34,145,'property_sell_34','property','ewfrgdt. hj n,jn',1,'4567bhj kl,',3,6,345.00000000,45678,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658687692/yc5w3fdfcn4u8hkkgxxh.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,2,5678.00000000,567.00000000,3,6,NULL,5678,1,'BJ nkjiuhbj iuhbjn hiujkbn m','Udhana, Surat',21.17024000,72.83106000,'2022-07-24 18:34:52',NULL,6,7),(35,145,'property_sell_35','property','khjsrfb rjkg hjer vjhe ',2,'wefdgfb ew df',4,5,54.00000000,23454,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658687910/zemldpnwh8gddku41pap.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,3,234.00000000,234.00000000,2,3,NULL,2435,1,'sfdgbv vdf vfdv bf','Udhana, Surat',0.00000000,0.00000000,'2022-07-24 18:38:31',NULL,6,7),(36,145,'property_sell_36','property','wf jvefkmlme fjk',3,'fwrevfd vc d',4,5,23.00000000,121342314,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658687968/q9nccn7abpy1qdj1yhbz.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,445.00000000,4545.00000000,3,NULL,NULL,435,1,'  m,jvk JK rbjk rjkbh rhjb hjf BJ gj','Udhana, Surat',0.00000000,0.00000000,'2022-07-24 18:39:29',NULL,6,8),(37,125,'property_sell_37','property','how to make sure you are',2,'rkdkd',4,5,250.00000000,25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658725244/ytfajk8e2mhqqowos5rs.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,1,25.00000000,255.00000000,3,6,NULL,25,0,'how to make sure you are','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 05:00:45',NULL,6,7),(38,1,'property_rent_38','property','PROPERTY',1,'PROPERTY name',1,1,12.00000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658731473/yjg0c6gss9rfrlezdmow.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.00000000,10.00000000,1,NULL,1,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-25 06:43:34','2022-07-25 06:44:34',6,8),(39,145,'property_sell_39','property','D FGDFGB DHT',3,'0',4,6,14.00000000,46466,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658743923/qyqnartjk5jsqvge5z7y.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0.00000000,0.00000000,0,0,NULL,0,0,'frjmcgkmxgfjkx','Udhana, Surat',0.00000000,NULL,'2022-07-25 10:12:03',NULL,6,7),(40,145,'property_sell_40','property','D FGDFGB DHT',3,'0',4,6,14.50000000,46466,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658744279/pzdyyxyshowladqw9sg7.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0.00000000,0.00000000,0,0,NULL,0,0,'frjmcgkmxgfjkx','Udhana, Surat',0.00000000,NULL,'2022-07-25 10:17:59',NULL,6,7),(41,145,'property_sell_41','property','D FGDFGB DHT',3,'0',4,6,5000.12000000,46466,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658744301/bpzexpoaa3o5gjcscm7f.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0.00000000,0.00000000,0,0,NULL,0,0,'frjmcgkmxgfjkx','Udhana, Surat',0.00000000,NULL,'2022-07-25 10:18:22',NULL,6,7),(42,145,'property_sell_42','property','D FGDFGB DHT',3,'0',4,6,5000.12000000,46466,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658744388/haytw4fryhhch3m8qqgk.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0.00000000,0.00000000,0,0,NULL,0,0,'frjmcgkmxgfjkx','Udhana, Surat',21.17024000,NULL,'2022-07-25 10:19:48',NULL,6,7),(43,145,'property_sell_43','property','D FGDFGB DHT',3,'0',4,6,5000.12000000,46466,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658744397/godzzotetjec2iqb6be3.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0.00000000,0.00000000,0,0,NULL,0,0,'frjmcgkmxgfjkx','Udhana, Surat',21.17024001,NULL,'2022-07-25 10:19:58',NULL,6,7),(44,5,'property_sell_44','property','name',1,'PROPERTY name',1,1,50000.51000000,1200,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658744565/we99ag0jc342cwp8s1za.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,10.00000000,10.00000000,1,1,NULL,10000,1,'demo','surat',0.00000000,0.00000000,'2022-07-25 10:22:46',NULL,6,6),(45,145,'property_sell_45','property','D FGDFGB DHT',3,'0',4,6,50000.12000000,46466,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658744577/uipyvogtd0xoco0by8zz.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0.00000000,0.00000000,0,0,NULL,0,0,'frjmcgkmxgfjkx','Udhana, Surat',21.17024001,NULL,'2022-07-25 10:22:58',NULL,6,7),(46,145,'property_sell_46','property','D FGDFGB DHT',3,'0',4,6,500000.12000000,46466,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658744620/fh1ougkteyt18rbxpa99.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0.00000000,0.00000000,0,0,NULL,0,0,'frjmcgkmxgfjkx','Udhana, Surat',21.17024001,NULL,'2022-07-25 10:23:40',NULL,6,7),(47,145,'property_sell_47','property','D FGDFGB DHT',3,'0',4,6,5000000.12000000,46466,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658744627/f0mesrh8lusye7iv03yi.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0.00000000,0.00000000,0,0,NULL,0,0,'frjmcgkmxgfjkx','Udhana, Surat',21.17024001,NULL,'2022-07-25 10:23:48',NULL,6,7),(48,145,'property_sell_48','property','D FGDFGB DHT',3,'0',4,6,500000000.12000000,46466,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658744636/nagnmaigyouju5xjtbjg.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0.00000000,0.00000000,0,0,NULL,0,0,'frjmcgkmxgfjkx','Udhana, Surat',21.17024001,NULL,'2022-07-25 10:23:56',NULL,6,7),(49,145,'property_sell_49','property','D FGDFGB DHT',3,'0',4,6,500.12000000,46466,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658744646/xifwjbuspdoqis1zqmgo.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0.00000000,0.00000000,0,0,NULL,0,0,'frjmcgkmxgfjkx','Udhana, Surat',21.17024001,NULL,'2022-07-25 10:24:07',NULL,6,7),(50,145,'property_sell_50','property','D FGDFGB DHT',3,'0',4,6,500.00000000,46466,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658744897/abgfzswh0micydyouxof.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0.00000000,0.00000000,0,0,NULL,0,0,'frjmcgkmxgfjkx','Udhana, Surat',21.17024001,NULL,'2022-07-25 10:28:17',NULL,6,7),(51,145,'property_sell_51','property','vb hjvjhv thtrh',1,'0',4,4,121515.00000000,67567,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658745075/m93ksoaftrkxp9dczbd0.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0.00000000,0.00000000,0,0,NULL,0,0,'fnyxy have hrfhf hfrt hfth','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 10:31:16',NULL,6,7),(52,145,'property_sell_52','property','wsrdbg wfervdg. dd',2,NULL,5,4,23.00000000,23423,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658769033/m2chvwdm6qugl3sw7ivx.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL,NULL,0,'rwgerbf VC defrdbgf fdefdc','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 17:10:34',NULL,6,7),(53,145,'property_sell_53','property','sdvcbn jb dsjv j',1,NULL,2,4,23.00000000,2323,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658769651/npnrpwlqvnkmzo0xi8k0.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,NULL,NULL,0,0,NULL,NULL,0,'hi hi hi hi hgvhvh','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 17:20:52',NULL,6,7),(54,125,'property_sell_54','property','how to make sure you',1,NULL,2,5,25.00000000,2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658802404/zjjl7frabowdjbyvawsd.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,4,NULL,NULL,NULL,NULL,NULL,NULL,0,'how to make sure you','Udhana, Surat',0.00000000,0.00000000,'2022-07-26 02:26:47',NULL,6,7),(55,125,'property_sell_55','property','sell property test',1,'tkdkdkd',4,7,2500.00000000,2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659031302/t5scy2gzkjboqcua97pc.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,2,25.00000000,25.00000000,3,4,NULL,250,0,'he is in the task of','Vesu, Surat',0.00000000,0.00000000,'2022-07-28 18:01:43',NULL,6,7),(56,125,'property_sell_56','property','rent property',1,'ghxjdjd',2,5,25.00000000,2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659031344/mx9v0ezyjxppyewrsaqg.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,4,25.00000000,25.00000000,2,NULL,NULL,2500,0,'Take a look at this ViewSonic 23.8 inch Full HD LED Backlit IPS Panel Hig','Vesu, Surat',0.00000000,0.00000000,'2022-07-28 18:02:25',NULL,6,8),(57,125,'property_sell_57','property','property sell',1,'gg',4,5,6.00000000,255,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659330491/xahy6a6c8ob7wv88cfqp.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,25.00000000,65.00000000,2,4,NULL,25,0,'how to make sure you are','Vesu, Surat',0.00000000,0.00000000,'2022-08-01 05:08:12',NULL,6,7),(58,125,'property_sell_58','property','rent property',1,'vv',4,5,25.00000000,255,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659330533/hvdgbew2ib7rclbcqkge.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,4,25.00000000,58.00000000,3,NULL,NULL,555,0,'how to make sure you are','Vesu, Surat',0.00000000,0.00000000,'2022-08-01 05:08:53',NULL,6,8),(59,125,'property_sell_59','property','sell property 2',1,'jj',2,5,255.00000000,2558,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659330940/xhzrvfcfdbg5zvmxthig.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,4,255.00000000,255.00000000,2,3,NULL,2500,0,'how to make sure you are','Vesu, Surat',0.00000000,0.00000000,'2022-08-01 05:15:40',NULL,6,7),(60,125,'property_sell_60','property','rent property',2,'tii',3,5,100.00000000,2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659330999/oulrwvfca8dr1iavlphu.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,4,200.00000000,300.00000000,2,NULL,NULL,2500,1,'how to make sure you are','Vesu, Surat',0.00000000,0.00000000,'2022-08-01 05:16:40',NULL,6,8),(61,125,'property_sell_61','property','sell Property 2',1,'jj',2,5,255.00000000,2558,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659334503/jng8fihlhkxd3wls8fjk.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,4,255.00000000,255.00000000,2,3,NULL,2500,0,'how to make sure you are','Udhana, Surat',0.00000000,0.00000000,'2022-08-01 06:15:04',NULL,6,7),(62,125,'property_sell_62','property','Rent Property',2,'till',3,5,100.00000000,2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659334986/gsrjlo5h2wv2qtbdpyvt.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,4,200.00000000,300.00000000,2,NULL,NULL,2500,1,'how to make sure you are','Udhana, Surat',0.00000000,0.00000000,'2022-08-01 06:23:06',NULL,6,8),(63,125,'property_sell_63','property','rental office in',1,'vvbb',4,3,2500.00000000,2555,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659423766/xoo0zeqcqo5ziwmu1lcu.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,5,2550.00000000,2500.00000000,3,NULL,NULL,2555,1,'how to make sure you are','Udhana, Surat',0.00000000,0.00000000,'2022-08-02 07:02:46',NULL,6,8),(64,125,'property_sell_64','property','3BHK FLAT IN PRIME AREA',1,'jay Shree',2,5,355.00000000,2500000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659455257/p24oule122vrmegpjvfs.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,3,2500.00000000,250.00000000,4,4,NULL,250,0,'today final fantasy','Vesu, Surat',0.00000000,0.00000000,'2022-08-02 15:47:38',NULL,6,7),(65,125,'property_sell_65','property','property sell',1,'m',2,3,2.00000000,2,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659695834/rucfhwhhptzbs84ztb05.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,25.00000000,25.00000000,2,3,NULL,250,0,'how to make sure','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 10:37:14',NULL,6,7),(66,125,'property_sell_66','property','sell property form testing',3,'Rajhansh',3,4,1800.00000000,1234,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659696913/sbr8ucvfxpu3yokijk8l.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,2,1801.00000000,1802.00000000,2,3,NULL,4321,1,'sell property form testing ...','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 10:55:14',NULL,6,7),(67,125,'property_sell_67','property','rent property test',1,'1',1,1,1.00000000,10000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659698105/v7acy49vkz5bzedbfy57.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,1,1.00000000,1.00000000,1,NULL,NULL,1,0,'ha ha ha ha ha ha','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 11:15:05',NULL,6,8),(68,125,'property_sell_68','property','rent property rent',1,'3',1,1,2.00000000,2,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659698499/ykgpcjupkjx2uto7fdgq.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,2,2.00000000,2.00000000,3,NULL,NULL,25,1,'ha ha ha ha ha ha','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 11:21:40',NULL,6,8),(69,125,'property_sell_69','property','property sell form',1,'2',3,5,2500.00000000,25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659939033/bqg69nqtbhdtwjsme4xi.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,2,2.00000000,2.00000000,1,3,NULL,25000,0,'how to make sure you are','Vesu, Surat',0.00000000,0.00000000,'2022-08-08 06:10:33',NULL,6,7);
/*!40000 ALTER TABLE `property_inventory_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_listed_by_mast`
--

DROP TABLE IF EXISTS `property_listed_by_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_listed_by_mast` (
  `p_listed_by_id` int NOT NULL AUTO_INCREMENT,
  `p_listed_by_name` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`p_listed_by_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_listed_by_mast`
--

LOCK TABLES `property_listed_by_mast` WRITE;
/*!40000 ALTER TABLE `property_listed_by_mast` DISABLE KEYS */;
INSERT INTO `property_listed_by_mast` VALUES (1,'Builder','2022-05-25 08:00:00',NULL),(2,'Dealer','2022-05-25 08:00:08',NULL),(3,'Owner','2022-05-25 08:00:18',NULL),(4,'list_1','2022-07-10 10:51:49',NULL),(5,NULL,'2022-07-10 10:52:14',NULL);
/*!40000 ALTER TABLE `property_listed_by_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_preferred_renters_mast`
--

DROP TABLE IF EXISTS `property_preferred_renters_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_preferred_renters_mast` (
  `p_preferred_renters_id` int NOT NULL AUTO_INCREMENT,
  `p_preferred_renters_name` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`p_preferred_renters_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_preferred_renters_mast`
--

LOCK TABLES `property_preferred_renters_mast` WRITE;
/*!40000 ALTER TABLE `property_preferred_renters_mast` DISABLE KEYS */;
INSERT INTO `property_preferred_renters_mast` VALUES (2,'Family','2022-05-25 07:54:53',NULL);
/*!40000 ALTER TABLE `property_preferred_renters_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_status_mast`
--

DROP TABLE IF EXISTS `property_status_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_status_mast` (
  `p_status_id` int NOT NULL AUTO_INCREMENT,
  `p_status_title` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`p_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_status_mast`
--

LOCK TABLES `property_status_mast` WRITE;
/*!40000 ALTER TABLE `property_status_mast` DISABLE KEYS */;
INSERT INTO `property_status_mast` VALUES (3,'Ready to move','2022-05-25 07:51:18',NULL),(4,'Under Contruction','2022-05-25 07:51:38','2022-07-06 15:12:47'),(6,'New launch','2022-07-06 15:11:55','2022-07-06 15:13:44');
/*!40000 ALTER TABLE `property_status_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_type_mast`
--

DROP TABLE IF EXISTS `property_type_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `property_type_mast` (
  `p_type_id` int NOT NULL AUTO_INCREMENT,
  `p_type_name` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`p_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_type_mast`
--

LOCK TABLES `property_type_mast` WRITE;
/*!40000 ALTER TABLE `property_type_mast` DISABLE KEYS */;
INSERT INTO `property_type_mast` VALUES (1,'Apartment','2022-05-25 08:01:42',NULL),(2,'Building Floor','2022-05-25 08:02:17',NULL),(3,'Farm House','2022-05-25 08:02:29',NULL),(4,'Houses $ Villas','2022-05-25 08:02:43',NULL),(5,'Bungalow','2022-07-06 15:06:03','2022-07-06 15:06:47'),(6,'p_type_1','2022-07-23 11:56:53',NULL);
/*!40000 ALTER TABLE `property_type_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_ads_mast`
--

DROP TABLE IF EXISTS `purchase_ads_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_ads_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
    `user_id` varchar(126) DEFAULT NULL,
  `pkt_id` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `start_date_time` datetime DEFAULT NULL,
  `end_date_time` datetime DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `total_ad` int DEFAULT '0',
  `use_ad` int DEFAULT '0',
  `ava_ad` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_ads_mast`
--

LOCK TABLES `purchase_ads_mast` WRITE;
/*!40000 ALTER TABLE `purchase_ads_mast` DISABLE KEYS */;
INSERT INTO `purchase_ads_mast` VALUES (1,3,3,99,0,'2022-06-01 11:41:25','2022-07-31 11:41:25','2022-06-01',3,3,0),(2,2,5,99,0,'2022-06-01 11:42:04','2022-07-29 11:42:04','2022-06-01',3,3,0),(3,1,5,99,0,'2022-06-01 11:42:46','2022-07-28 11:42:46','2022-06-01',3,0,3),(4,1,5,99,0,'2022-06-01 11:43:18','2022-07-28 11:43:18','2022-06-01',3,3,0),(5,4,6,99,0,'2022-06-01 11:57:55','2022-07-30 11:57:55','2022-06-01',3,3,0),(6,4,6,99,0,'2022-07-11 11:10:28','2022-07-26 11:10:28','2022-07-11',3,0,3),(7,4,6,99,0,'2022-07-11 11:52:45','2022-07-26 11:52:45','2022-07-11',3,0,3),(8,4,6,99,1,'2022-07-11 11:58:34','2022-08-26 11:58:34','2022-07-11',3,0,3),(9,4,6,99,0,'2022-07-11 05:55:35','2022-07-26 05:55:35','2022-07-29',3,0,3),(10,4,6,99,1,'2022-07-29 05:56:54','2022-10-29 05:56:54','2022-07-29',3,2,1);
/*!40000 ALTER TABLE `purchase_ads_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_us_mast`
--

DROP TABLE IF EXISTS `rate_us_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate_us_mast` (
  `rate_id` int NOT NULL AUTO_INCREMENT,
    `user_id` varchar(126) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_us_mast`
--

LOCK TABLES `rate_us_mast` WRITE;
/*!40000 ALTER TABLE `rate_us_mast` DISABLE KEYS */;
INSERT INTO `rate_us_mast` VALUES (1,1,3.70,'2022-06-09 08:19:32','2022-06-09 08:26:36'),(2,5,2.00,'2022-06-09 08:27:00',NULL),(3,7,1.00,'2022-06-09 08:35:27','2022-06-09 08:40:03');
/*!40000 ALTER TABLE `rate_us_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rejected_reasons_mast`
--

DROP TABLE IF EXISTS `rejected_reasons_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rejected_reasons_mast` (
  `reject_id` int NOT NULL AUTO_INCREMENT,
  `reasons` varchar(512) DEFAULT NULL,
  `sequence_no` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`reject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rejected_reasons_mast`
--

LOCK TABLES `rejected_reasons_mast` WRITE;
/*!40000 ALTER TABLE `rejected_reasons_mast` DISABLE KEYS */;
INSERT INTO `rejected_reasons_mast` VALUES (1,'This ad is considered a duplicate',1,'2022-07-05 05:55:40',NULL,1),(3,'Pictured posted are unclear or objectional',4,'2022-07-05 05:57:22',NULL,1),(4,'Title or Description is inappropriate',5,'2022-07-05 05:57:56',NULL,1),(5,'test',5,'2022-07-10 06:35:48',NULL,1);
/*!40000 ALTER TABLE `rejected_reasons_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_mast`
--

DROP TABLE IF EXISTS `report_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
    `user_id` varchar(126) DEFAULT NULL,
  `report_msg_id` int DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_mast`
--

LOCK TABLES `report_mast` WRITE;
/*!40000 ALTER TABLE `report_mast` DISABLE KEYS */;
INSERT INTO `report_mast` VALUES (1,1,1,'comment','2022-06-07 06:59:22',NULL),(2,2,2,'comment','2022-06-07 07:00:44',NULL),(3,1,2,'comment','2022-06-07 07:02:20','2022-06-07 07:03:26');
/*!40000 ALTER TABLE `report_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_message_mast`
--

DROP TABLE IF EXISTS `report_message_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_message_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `report_msg` varchar(255) DEFAULT NULL,
  `type` varchar(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_message_mast`
--

LOCK TABLES `report_message_mast` WRITE;
/*!40000 ALTER TABLE `report_message_mast` DISABLE KEYS */;
INSERT INTO `report_message_mast` VALUES (1,'Demo msg 1','AD','2022-06-07 06:51:17','2022-06-07 06:52:47'),(2,'Demo msg 2','PROFILE','2022-06-07 06:51:54',NULL);
/*!40000 ALTER TABLE `report_message_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_period_mast`
--

DROP TABLE IF EXISTS `salary_period_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_period_mast` (
  `s_p_id` int NOT NULL AUTO_INCREMENT,
  `s_p_name` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`s_p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_period_mast`
--

LOCK TABLES `salary_period_mast` WRITE;
/*!40000 ALTER TABLE `salary_period_mast` DISABLE KEYS */;
INSERT INTO `salary_period_mast` VALUES (4,'hourly','2022-07-04 15:20:15',NULL),(5,'weekly','2022-07-04 15:20:46',NULL),(6,'monthly','2022-07-04 15:21:00',NULL),(11,'Yearly','2022-07-06 14:45:21',NULL);
/*!40000 ALTER TABLE `salary_period_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_mast`
--

DROP TABLE IF EXISTS `state_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state_name` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_mast`
--

LOCK TABLES `state_mast` WRITE;
/*!40000 ALTER TABLE `state_mast` DISABLE KEYS */;
INSERT INTO `state_mast` VALUES (1,'Gujarat','2022-06-22 07:53:32',NULL),(2,'Maharashtra','2022-06-22 07:54:00',NULL);
/*!40000 ALTER TABLE `state_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category_mast`
--

DROP TABLE IF EXISTS `sub_category_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_category_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cat_id` int DEFAULT NULL,
  `sub_cat_name` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category_mast`
--

LOCK TABLES `sub_category_mast` WRITE;
/*!40000 ALTER TABLE `sub_category_mast` DISABLE KEYS */;
INSERT INTO `sub_category_mast` VALUES (1,4,'Mobiles',NULL,'2022-05-13 09:48:48'),(2,4,'Tablet',NULL,NULL),(3,4,'Accessories',NULL,NULL),(4,5,'Car sell',NULL,NULL),(5,5,'Car rent',NULL,NULL),(6,5,'Spare parts',NULL,NULL),(7,6,'Sell Property',NULL,NULL),(8,6,'Rent Property',NULL,NULL),(9,6,'Sell office',NULL,NULL),(10,6,'Rent office',NULL,NULL),(11,7,'IT Engineer',NULL,NULL),(12,7,'Accountant',NULL,NULL),(13,7,'Teacher',NULL,NULL),(14,7,'Designer',NULL,NULL),(15,7,'Receptionist & Front Office',NULL,NULL),(16,7,'Data Entry & Back Office',NULL,NULL),(17,7,'Sales & Marketing',NULL,NULL),(18,7,'Hotel & Travel Executive',NULL,NULL),(19,7,'BPO & Tele-caller',NULL,NULL),(20,7,'Office Assistant',NULL,NULL),(21,7,'Operator & Technician',NULL,NULL),(22,7,'Driver',NULL,NULL),(23,7,'Delivery Boy & Collection',NULL,NULL),(24,7,'Cook',NULL,NULL),(25,8,'Computers & Laptops',NULL,NULL),(26,8,'Televisions',NULL,NULL),(27,8,'Fridges',NULL,NULL),(28,8,'Air-Conditioner',NULL,NULL),(29,8,'Fans',NULL,NULL),(30,8,'Washing Machines',NULL,NULL),(31,8,'Camera & Lenses',NULL,NULL),(32,8,'Speaker',NULL,NULL),(33,8,'Clock',NULL,NULL),(34,8,'Games & Entertainment',NULL,NULL),(35,8,'Hard Disk & Printer & Monitor',NULL,NULL),(36,8,'Home Appliances & Mini kitchen',NULL,NULL),(37,8,'Computer Accessories',NULL,NULL),(38,8,'Others',NULL,NULL),(39,9,'Bikes',NULL,NULL),(40,9,'Scooters',NULL,NULL),(41,9,'Bicycles',NULL,NULL),(42,9,'Spare parts',NULL,NULL),(43,10,'Sofa',NULL,NULL),(44,10,'Beds',NULL,NULL),(45,10,'Table',NULL,NULL),(46,10,'Chair',NULL,NULL),(47,10,'Wardrobe',NULL,NULL),(48,10,'Dining Table',NULL,NULL),(49,10,'Kid Accessories',NULL,NULL),(50,10,'Decor Accessories',NULL,NULL),(51,10,'Others',NULL,NULL),(52,11,'Commercial Vehicles',NULL,NULL),(53,11,'Spare parts',NULL,NULL),(54,12,'Men',NULL,NULL),(55,12,'Women',NULL,NULL),(56,12,'Kids',NULL,NULL),(57,13,'Books',NULL,NULL),(58,13,'GYM & Fitness',NULL,NULL),(59,13,'Musical Instruments',NULL,NULL),(60,13,'Sports Equipment',NULL,NULL),(61,13,'Others',NULL,NULL),(62,14,'Dogs',NULL,NULL),(63,14,'Cats',NULL,NULL),(64,14,'Fish & Aquarium',NULL,NULL),(65,14,'Pet Food & Accessories',NULL,NULL),(66,14,'Others',NULL,NULL),(67,15,'Taxi & Drivers',NULL,NULL),(68,15,'Electronics & Computer Repair',NULL,NULL),(69,15,'Education & Classes',NULL,NULL),(70,15,'Health & Beauty Services',NULL,NULL);
/*!40000 ALTER TABLE `sub_category_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_category_mast`
--

DROP TABLE IF EXISTS `user_category_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_category_mast` (
  `cat_id` varchar(5) NOT NULL,
  `cat_name` varchar(16) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_category_mast`
--

LOCK TABLES `user_category_mast` WRITE;
/*!40000 ALTER TABLE `user_category_mast` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_category_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_followers_mast`
--

DROP TABLE IF EXISTS `user_followers_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_followers_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
    `user_id` varchar(126) DEFAULT NULL,
  `follower_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_followers_mast`
--

LOCK TABLES `user_followers_mast` WRITE;
/*!40000 ALTER TABLE `user_followers_mast` DISABLE KEYS */;
INSERT INTO `user_followers_mast` VALUES (2,3,1,'2022-06-10 11:58:09'),(4,4,3,'2022-06-10 11:58:22'),(5,3,2,'2022-06-10 11:59:00'),(6,4,1,'2022-06-10 12:01:00'),(7,2,4,'2022-06-10 12:01:25'),(8,3,11,'2022-07-05 11:12:31'),(9,2,4,'2022-07-22 18:10:09');
/*!40000 ALTER TABLE `user_followers_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_mast`
--

DROP TABLE IF EXISTS `user_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_mast` (
  `login_id` bigint(20) NOT NULL,
  `mobile_no` varchar(16) DEFAULT NULL,
  `mail_id` varchar(64) DEFAULT NULL,
  `name` varchar(126) DEFAULT NULL,
  `bio_description` varchar(512) DEFAULT NULL,
  `profile_picture_link` varchar(512) DEFAULT NULL,
  `mobile_cc_code` varchar(8) DEFAULT NULL,
  `user_cat` varchar(5) DEFAULT NULL,
  `password` varchar(126) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `is_verify` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `user_id` varchar(250) DEFAULT NULL,
  `is_facebook_linked` varchar(5) NOT NULL DEFAULT 'false',
  `is_google_linked` varchar(5) NOT NULL DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_mast`
--

INSERT INTO `user_mast` (`login_id`, `mobile_no`, `mail_id`, `name`, `bio_description`, `profile_picture_link`, `mobile_cc_code`, `user_cat`, `password`, `otp`, `is_verify`, `created_at`, `modified_at`, `user_id`, `is_facebook_linked`, `is_google_linked`) VALUES
(2, '1234567899', 'abc@gmail.com', 'demo', 'for check', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650352234/ptsh2mgln7qkccpfpo0a.png', '91', 'U', '1234', 1234, 0, NULL, '2022-06-09 07:21:38', NULL, 'false', 'false'),
(3, '4343434334', 'abc@gmail.com', 'demo', 'for check', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650352350/klhhf4tad7g6qgm5029k.png', '91', 'U', 'demo@123456', 1234, 0, NULL, '2022-06-09 07:20:46', NULL, 'false', 'false'),
(4, '9090909090', 'abc@gmail.com', 'TestDemo', 'for test check', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650352731/q9tdspkewmkq0vhpdbnc.png', '91', 'U', 'demo@123456', 3862, 0, NULL, '2022-06-09 07:20:46', NULL, 'false', 'false'),
(5, '4343434334', 'abc@gmail.com', 'demo', 'for check', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650354356/l1hvqsgzdfqpcdid8fuf.jpg', '91', 'U', 'demo@123456', 1234, 0, NULL, '2022-06-09 07:20:46', NULL, 'false', 'false'),
(6, '2727272727', 'mrgrouptect@gmail.com', 'Test mobile', 'Testing for mobile side....!', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650354536/gbeephjb2gmqxva5fa36.jpg', '91', 'U', NULL, 1234, 0, NULL, NULL, NULL, 'false', 'false'),
(7, '2727272727', 'mrgrouptect@gmail.com', 'Test mobile', 'Testing for mobile side....!', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650354609/frwfaw8nw0bpnew9w3g3.jpg', '91', 'U', NULL, 1234, 0, NULL, NULL, NULL, 'false', 'false'),
(8, '2727272727', 'mrgrouptect@gmail.com', 'Test mobile', 'Testing for mobile side....!', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650355544/puxcamv7fpuoybpnydsn.jpg', '91', 'U', NULL, 1234, 0, NULL, NULL, NULL, 'false', 'false'),
(9, '9234567890', NULL, NULL, NULL, NULL, '91', 'U', NULL, 9244, 0, NULL, NULL, NULL, 'false', 'false'),
(12, '123456', 'abc@gmail.com', 'demo', 'for check', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650361914/mkm920mmrampto0wcv0x.png', '91', 'U', 'demo@123456', 1234, 1, NULL, '2022-06-09 07:20:46', NULL, 'false', 'false'),
(13, '1234567899', 'abc@gmail.com', 'demo', 'for check', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650437450/fywlah6mltx6f2fcwueg.png', '91', 'U', '1234', 1234, 0, '2022-04-20 06:50:50', '2022-06-09 07:21:38', NULL, 'false', 'false'),
(14, '1234567899', 'abc@gmail.com', 'demo', 'for check', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650437459/eobqmhtr1cmtp3qtpec0.png', '91', 'U', '1234', 1234, 0, '2022-04-20 06:50:59', '2022-06-09 07:21:38', NULL, 'false', 'false'),
(15, '7777777777', 'ghkgkg@ghkhg.com', 'BBBBB', 'PPPPPPP', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650439311/y4njvdf0rn9ns1evmagf.jpg', '91', 'U', NULL, 1234, 0, '2022-04-20 07:21:51', NULL, NULL, 'false', 'false'),
(16, '7777777777', 'ghkgkg@ghkhg.com', 'opopopopopo', 'PPPPPPP', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650439378/bcsytmsfz02aqvlrkbmb.jpg', '91', 'U', NULL, 1234, 0, '2022-04-20 07:22:58', NULL, NULL, 'false', 'false'),
(17, '8888888888', 'opop@gmail.com', 'ttytytytytyty', 'qwqwqwqwqwqw', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650439600/zgvlxncoqhbfh1vyih7y.jpg', '91', 'U', NULL, 5784, 1, '2022-04-20 07:26:40', NULL, NULL, 'false', 'false'),
(18, '8888888888', 'opop@gmail.com', 'ttytytytytyty', 'qwqwqwqwqwqw', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650439631/pboxqxnpbj66hxqylku4.jpg', '91', 'U', NULL, 5784, 1, '2022-04-20 07:27:11', NULL, NULL, 'false', 'false'),
(19, '6766767764', 'Guygsu@gmail.com', 'TYTYWETYET', 'KHGSDKGDJg', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650439883/v276hs5rbumuqwk8uouu.jpg', '91', 'U', NULL, 1234, 0, '2022-04-20 07:31:24', NULL, NULL, 'false', 'false'),
(20, '5555555555', 'rewr@gmail.com', 'eeeeeee', 'ttttttttt', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650440112/gkzim2gixazngrbou8ba.jpg', '91', 'U', NULL, 9110, 0, '2022-04-20 07:35:12', NULL, NULL, 'false', 'false'),
(21, '6767676767', 'rfghfgh@gfg.com', 'trtert', 'ertertertertertertre ertertrertr ertertert ert ret ', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650440233/zlw17rsv9gp2r75zce7z.jpg', '91', 'U', NULL, 1234, 0, '2022-04-20 07:37:13', NULL, NULL, 'false', 'false'),
(22, '6767676767', 'rfghfgh@gfg.com', 'trtert', 'ertertertertertertre ertertrertr ertertert ert ret ', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650440277/frjdyohakuocv7syh3se.jpg', '91', 'U', NULL, 1234, 0, '2022-04-20 07:37:57', NULL, NULL, 'false', 'false'),
(23, '5454454545', 'dgdfg@gfg.in', 'rewqrwer', 'werwerwe', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650440344/hfna0y37xrscyscbk9vt.jpg', '91', 'U', NULL, 1234, 0, '2022-04-20 07:39:05', NULL, NULL, 'false', 'false'),
(24, '6363636363', 'gjdgh@hgkj.com', 'Gjhjjsdfv', 'kksdfgkghksdg  gAji ', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650440841/m7nq8urzzxfhhjqlag43.jpg', '91', 'U', NULL, 1234, 0, '2022-04-20 07:47:22', NULL, NULL, 'false', 'false'),
(25, '5555556666', 'werwer@gfdg.com', 'rwerwer', 'werwerwe  rwerwe rwer ', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650440948/veco0f4baweczkgce7oe.jpg', '91', 'U', NULL, 1234, 0, '2022-04-20 07:49:09', NULL, NULL, 'false', 'false'),
(26, '09090909090', 'hkldh @hkf .com', 'uyertuert iwqeuo', 'hweiuryhwe hgikwrhwe ikrhrwey iuhroiwu ', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650441085/hkcgmuczm8woqnd5dgi8.jpg', '91', 'U', NULL, 1234, 0, '2022-04-20 07:51:26', NULL, NULL, 'false', 'false'),
(27, '1234567899', 'abc@gmail.com', 'demo', 'for check', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650449574/f7vrab2d3fpqylog01x9.png', '91', 'U', '1234', 1234, 0, '2022-04-20 10:12:55', '2022-06-09 07:21:38', NULL, 'false', 'false'),
(28, '79908 08193', NULL, NULL, NULL, NULL, ' +91', 'U', NULL, 4002, 0, NULL, NULL, NULL, 'false', 'false'),
(29, '7990808193', NULL, NULL, NULL, NULL, ' +91', 'U', NULL, 7674, 0, NULL, NULL, NULL, 'false', 'false'),
(30, '7990808193', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 7582, 0, NULL, NULL, NULL, 'false', 'false'),
(31, '7990608193', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 2732, 0, NULL, NULL, NULL, 'false', 'false'),
(32, '7980808193', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 5473, 0, NULL, NULL, NULL, 'false', 'false'),
(33, '7980908193', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 2412, 0, NULL, NULL, NULL, 'false', 'false'),
(34, '1234567899', 'abc@gmail.com', 'demo', 'for check', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1651130764/hoaryvehzz62102gimjy.png', '91', 'U', '1234', 1234, 0, '2022-04-28 07:26:04', '2022-06-09 07:21:38', NULL, 'false', 'false'),
(35, '7990808192', NULL, NULL, NULL, NULL, '91', 'U', NULL, 7126, 0, NULL, NULL, NULL, 'false', 'false'),
(36, '8469999535', NULL, NULL, NULL, NULL, '+ 91 ', 'U', NULL, 9424, 0, NULL, NULL, NULL, 'false', 'false'),
(37, '7990808192', NULL, NULL, NULL, NULL, '+ 91 ', 'U', NULL, 2656, 0, NULL, NULL, NULL, 'false', 'false'),
(38, '8886663322', NULL, NULL, NULL, NULL, '+ 91 ', 'U', NULL, 9528, 0, NULL, NULL, NULL, 'false', 'false'),
(44, '9234567896', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 4965, 1, NULL, NULL, NULL, 'false', 'false'),
(45, '9234567896', NULL, NULL, NULL, NULL, '+ 91 ', 'U', NULL, 1436, 0, NULL, NULL, NULL, 'false', 'false'),
(46, '9234567896', NULL, NULL, NULL, NULL, '+91 ', 'U', NULL, 8178, 0, NULL, NULL, NULL, 'false', 'false'),
(47, '9234567896', NULL, NULL, NULL, NULL, '91', 'U', NULL, 4837, 1, NULL, NULL, NULL, 'false', 'false'),
(48, '9511757318', 'xyz@gmail.com', NULL, NULL, NULL, '+91', 'U', NULL, 3280, 1, NULL, NULL, NULL, 'false', 'false'),
(49, '9730594195', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 8744, 1, NULL, NULL, NULL, 'false', 'false'),
(50, '9898202994', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 9382, 0, NULL, NULL, NULL, 'false', 'false'),
(51, '8347331291', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 2913, 1, NULL, NULL, NULL, 'false', 'false'),
(52, '8866035567', NULL, NULL, NULL, NULL, '+91', 'U', '1234', 8780, 1, NULL, '2022-06-09 08:13:37', NULL, 'false', 'false'),
(53, NULL, 'demo@gmail.com', NULL, NULL, NULL, NULL, 'U', 'demo@123456', 7541, 1, '2022-06-09 04:07:31', '2022-06-09 07:16:05', NULL, 'false', 'false'),
(54, '1238569744', NULL, NULL, NULL, NULL, '91', 'U', 'demo@123', 9370, 0, NULL, '2022-06-09 07:15:07', NULL, 'false', 'false'),
(55, '8523697411', 'testting@gmail.com', 'demo', 'for check', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1654760124/nz8gdwbwi2rjhsoxx7vx.png', '91', 'U', 'test', 0, 0, '2022-06-09 07:35:24', NULL, NULL, 'false', 'false'),
(56, '8523697411', 'testting@gmail.com', 'demo', 'for check', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1654760313/sgcahjb2nev62cmbrgfu.png', '91', 'U', 'test', 0, 0, '2022-06-09 07:38:33', NULL, NULL, 'false', 'false'),
(57, '9512211132', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 5273, 1, '2022-06-13 10:49:47', NULL, NULL, 'false', 'false'),
(58, '9856689889', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 8526, 1, '2022-06-13 14:28:05', NULL, NULL, 'false', 'false'),
(59, '9924944405', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 6979, 0, '2022-06-13 18:04:13', NULL, NULL, 'false', 'false'),
(60, '1238569744', NULL, NULL, NULL, NULL, '00', 'U', NULL, 5387, 1, '2022-06-14 16:16:52', NULL, NULL, 'false', 'false'),
(61, '9879528579', NULL, NULL, NULL, NULL, '91', 'U', NULL, 8602, 0, '2022-06-14 16:48:15', NULL, NULL, 'false', 'false'),
(62, '1111111111', NULL, NULL, NULL, NULL, '91', 'U', NULL, 9299, 0, '2022-06-14 17:01:03', NULL, NULL, 'false', 'false'),
(63, '6666666666', NULL, NULL, NULL, NULL, '91', 'U', NULL, 7770, 0, '2022-06-14 17:03:29', NULL, NULL, 'false', 'false'),
(64, '9999999999', NULL, NULL, NULL, NULL, '91', 'U', NULL, 5802, 1, '2022-06-14 17:11:36', NULL, NULL, 'false', 'false'),
(65, '9879582576', NULL, NULL, NULL, NULL, '91', 'U', NULL, 4647, 0, '2022-06-14 17:30:12', NULL, NULL, 'false', 'false'),
(66, '3333333333', NULL, NULL, NULL, NULL, '91', 'U', NULL, 8987, 1, '2022-06-14 17:36:31', NULL, NULL, 'false', 'false'),
(67, '9879525698', NULL, NULL, NULL, NULL, '91', 'U', NULL, 5885, 0, '2022-06-14 17:37:16', NULL, NULL, 'false', 'false'),
(68, '9879582578', NULL, NULL, NULL, NULL, '91', 'U', NULL, 2688, 0, '2022-06-14 17:52:41', NULL, NULL, 'false', 'false'),
(69, '9879582579', NULL, NULL, NULL, NULL, '91', 'U', NULL, 6848, 0, '2022-06-14 17:54:19', NULL, NULL, 'false', 'false'),
(70, '9696969696', NULL, NULL, NULL, NULL, '91', 'U', NULL, 3744, 1, '2022-06-14 18:08:03', NULL, NULL, 'false', 'false'),
(71, '9898989898', NULL, NULL, NULL, NULL, '91', 'U', NULL, 5804, 0, '2022-06-14 18:09:47', NULL, NULL, 'false', 'false'),
(72, '9879563984', NULL, NULL, NULL, NULL, '91', 'U', NULL, 1802, 1, '2022-06-14 18:12:33', NULL, NULL, 'false', 'false'),
(73, '9698565655', NULL, NULL, NULL, NULL, '91', 'U', NULL, 5548, 1, '2022-06-14 18:15:25', NULL, NULL, 'false', 'false'),
(74, NULL, 'khushali141516@gmail.com', NULL, NULL, NULL, NULL, 'U', NULL, 9217, 0, '2022-06-15 12:32:08', NULL, NULL, 'false', 'false'),
(75, '', NULL, NULL, NULL, NULL, '91', 'U', NULL, 6021, 0, '2022-06-15 14:26:30', NULL, NULL, 'false', 'false'),
(76, '8530689354', NULL, NULL, NULL, NULL, '91', 'U', NULL, 7804, 1, '2022-06-15 14:39:31', NULL, NULL, 'false', 'false'),
(77, NULL, 'tirth@work.in', NULL, NULL, NULL, NULL, 'U', NULL, 7403, 0, '2022-06-15 15:14:41', NULL, NULL, 'false', 'false'),
(78, NULL, 'tirth@work.com', NULL, NULL, NULL, NULL, 'U', NULL, 1741, 1, '2022-06-15 15:27:41', NULL, NULL, 'false', 'false'),
(79, NULL, 'tirth@work.co', NULL, NULL, NULL, NULL, 'U', NULL, 6255, 0, '2022-06-15 15:32:36', NULL, NULL, 'false', 'false'),
(80, '6565656565', NULL, NULL, NULL, NULL, '91', 'U', NULL, 3689, 0, '2022-06-15 16:28:03', NULL, NULL, 'false', 'false'),
(81, '5656565655', NULL, NULL, NULL, NULL, '91', 'U', NULL, 4604, 0, '2022-06-15 16:30:30', NULL, NULL, 'false', 'false'),
(82, '8530698774', NULL, NULL, NULL, NULL, '91', 'U', NULL, 9929, 1, '2022-06-15 16:38:29', NULL, NULL, 'false', 'false'),
(83, '8530689656', NULL, NULL, NULL, NULL, '91', 'U', NULL, 7025, 1, '2022-06-15 16:48:50', NULL, NULL, 'false', 'false'),
(84, '8598575295', NULL, NULL, NULL, NULL, '91', 'U', NULL, 7174, 1, '2022-06-15 16:51:15', NULL, NULL, 'false', 'false'),
(85, '9595959595', NULL, NULL, NULL, NULL, '91', 'U', NULL, 4927, 1, '2022-06-16 15:37:10', NULL, NULL, 'false', 'false'),
(86, '9898989888', NULL, NULL, NULL, NULL, '91', 'U', NULL, 7872, 0, '2022-06-16 15:49:45', NULL, NULL, 'false', 'false'),
(87, '5656565658', NULL, NULL, NULL, NULL, '91', 'U', NULL, 9645, 0, '2022-06-16 15:51:13', NULL, NULL, 'false', 'false'),
(88, '9898989899', NULL, NULL, NULL, NULL, '91', 'U', NULL, 8234, 1, '2022-06-16 16:01:13', NULL, NULL, 'false', 'false'),
(89, '8585858585', NULL, NULL, NULL, NULL, '91', 'U', NULL, 7811, 1, '2022-06-16 16:18:58', NULL, NULL, 'false', 'false'),
(90, '5345645658', NULL, NULL, NULL, NULL, '91', 'U', NULL, 6257, 1, '2022-06-16 16:32:56', NULL, NULL, 'false', 'false'),
(91, '9988998888', NULL, NULL, NULL, NULL, '91', 'U', NULL, 5745, 1, '2022-06-16 16:59:07', NULL, NULL, 'false', 'false'),
(92, '8888888887', NULL, NULL, NULL, NULL, '91', 'U', NULL, 6360, 1, '2022-06-16 17:04:36', NULL, NULL, 'false', 'false'),
(93, '8858587450', NULL, NULL, NULL, NULL, '91', 'U', NULL, 8845, 1, '2022-06-16 17:20:34', NULL, NULL, 'false', 'false'),
(94, '8585641652', NULL, NULL, NULL, NULL, '91', 'U', NULL, 9952, 1, '2022-06-16 17:25:26', NULL, NULL, 'false', 'false'),
(95, '9898988888', NULL, NULL, NULL, NULL, '91', 'U', NULL, 3455, 1, '2022-06-16 17:27:07', NULL, NULL, 'false', 'false'),
(96, '2222222222', NULL, NULL, NULL, NULL, '91', 'U', NULL, 8106, 1, '2022-06-16 17:31:53', NULL, NULL, 'false', 'false'),
(97, '5656566556', NULL, NULL, NULL, NULL, '91', 'U', NULL, 5151, 1, '2022-06-16 17:32:39', NULL, NULL, 'false', 'false'),
(98, '8585974652', NULL, NULL, NULL, NULL, '91', 'U', NULL, 2265, 1, '2022-06-16 17:34:16', NULL, NULL, 'false', 'false'),
(99, '5656565656', NULL, NULL, NULL, NULL, '91', 'U', NULL, 2102, 1, '2022-06-16 17:37:38', NULL, NULL, 'false', 'false'),
(100, '5896367456', NULL, NULL, NULL, NULL, '91', 'U', NULL, 6873, 1, '2022-06-16 17:40:05', NULL, NULL, 'false', 'false'),
(101, '2525267565', NULL, NULL, NULL, NULL, '91', 'U', NULL, 1156, 1, '2022-06-16 17:45:02', NULL, NULL, 'false', 'false'),
(102, '8989898999', NULL, NULL, NULL, NULL, '91', 'U', NULL, 3551, 1, '2022-06-16 18:00:26', NULL, NULL, 'false', 'false'),
(103, '', NULL, NULL, NULL, NULL, '', 'U', NULL, 8978, 0, '2022-06-17 05:23:21', NULL, NULL, 'false', 'false'),
(104, '1238569744', NULL, NULL, NULL, NULL, '', 'U', NULL, 1396, 0, '2022-06-17 05:24:40', NULL, NULL, 'false', 'false'),
(105, '1238569744', NULL, NULL, NULL, NULL, '0', 'U', NULL, 2118, 0, '2022-06-17 06:19:00', NULL, NULL, 'false', 'false'),
(106, NULL, NULL, NULL, NULL, NULL, '91', 'U', NULL, 4559, 0, '2022-06-17 15:51:10', NULL, NULL, 'false', 'false'),
(107, NULL, NULL, NULL, NULL, NULL, NULL, 'U', NULL, 6455, 0, '2022-06-17 15:56:25', NULL, NULL, 'false', 'false'),
(108, '9898202994', NULL, NULL, NULL, NULL, '91', 'U', NULL, 6678, 0, '2022-06-17 15:57:33', NULL, NULL, 'false', 'false'),
(109, NULL, NULL, NULL, NULL, NULL, '91', 'U', NULL, 8095, 0, '2022-06-17 15:59:12', NULL, NULL, 'false', 'false'),
(110, '9889888888', NULL, NULL, NULL, NULL, '91', 'U', NULL, 5269, 1, '2022-06-17 16:11:54', NULL, NULL, 'false', 'false'),
(111, '9874563214', NULL, NULL, NULL, NULL, '', 'U', NULL, 6515, 1, '2022-06-18 11:34:06', NULL, NULL, 'false', 'false'),
(112, '1109309009', NULL, NULL, NULL, NULL, '91', 'U', NULL, 7128, 1, '2022-06-19 10:20:44', NULL, NULL, 'false', 'false'),
(113, NULL, 'tirth@gmail.com', NULL, NULL, NULL, NULL, 'U', NULL, 8576, 1, '2022-06-22 18:15:01', NULL, NULL, 'false', 'false'),
(114, '9313722544', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 5712, 1, '2022-06-30 06:59:29', NULL, NULL, 'false', 'false'),
(115, '5415151556', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 4167, 1, '2022-06-30 15:47:27', NULL, NULL, 'false', 'false'),
(116, '1234567897', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 1384, 1, '2022-06-30 16:42:45', NULL, NULL, 'false', 'false'),
(117, '1234567890', NULL, NULL, NULL, NULL, '+91', 'U', NULL, 3525, 1, '2022-06-30 19:26:09', NULL, NULL, 'false', 'false'),
(118, '9090909090', NULL, NULL, NULL, NULL, '91', 'U', NULL, 8672, 0, '2022-07-04 05:58:15', NULL, NULL, 'false', 'false'),
(119, '9090909090', NULL, NULL, NULL, NULL, '91', 'U', NULL, 4110, 0, '2022-07-04 05:58:18', NULL, NULL, 'false', 'false'),
(120, '1238569744', NULL, 'khushi', NULL, NULL, '91', 'U', NULL, 2449, 0, '2022-07-04 08:38:54', NULL, NULL, 'false', 'false'),
(121, '1238569744', NULL, 'wegf', NULL, NULL, '91', 'U', NULL, 9436, 0, '2022-07-04 13:37:22', NULL, NULL, 'false', 'false'),
(122, '1238569744', NULL, '', NULL, NULL, '91', 'U', NULL, 3378, 0, '2022-07-04 13:46:08', NULL, NULL, 'false', 'false'),
(123, '1238569744', NULL, 'Dhaval', NULL, NULL, '91', 'U', NULL, 6153, 0, '2022-07-04 13:47:56', NULL, NULL, 'false', 'false'),
(124, '8347331291', NULL, '', NULL, NULL, '+91', 'U', NULL, 6312, 1, '2022-07-04 14:00:26', NULL, NULL, 'false', 'false'),
(125, '8866035567', NULL, '', NULL, NULL, '+91', 'U', NULL, 4831, 1, '2022-07-04 16:27:21', NULL, NULL, 'false', 'false'),
(126, '5451556414', NULL, '', NULL, NULL, '+91', 'U', NULL, 1910, 1, '2022-07-04 19:56:55', NULL, NULL, 'false', 'false'),
(127, '8866035564', NULL, '', NULL, NULL, '+91', 'U', NULL, 5549, 0, '2022-07-06 14:45:49', NULL, NULL, 'false', 'false'),
(128, '9898202994', NULL, '', NULL, NULL, '+91', 'U', NULL, 8791, 0, '2022-07-07 06:44:39', NULL, NULL, 'false', 'false'),
(129, '7990808193', NULL, '', NULL, NULL, '91', 'U', NULL, 2051, 1, '2022-07-07 09:29:01', NULL, NULL, 'false', 'false'),
(130, NULL, 'mehulr941@gmail.com', NULL, NULL, NULL, NULL, 'U', NULL, 8193, 0, '2022-07-07 09:35:19', NULL, NULL, 'false', 'false'),
(131, NULL, 'idea.postpaid98@gmail.com', NULL, NULL, NULL, NULL, 'U', NULL, 4328, 0, '2022-07-07 09:36:27', NULL, NULL, 'false', 'false'),
(132, NULL, 'khushalipatel1059@gmail.com', NULL, NULL, NULL, NULL, 'U', NULL, 8240, 0, '2022-07-07 09:40:04', NULL, NULL, 'false', 'false'),
(133, '7990808193', NULL, '', NULL, NULL, '+91', 'U', NULL, 7326, 0, '2022-07-07 10:38:04', NULL, NULL, 'false', 'false'),
(134, NULL, 'idea.postpaid@gmail.com', NULL, NULL, NULL, NULL, 'U', NULL, 1599, 0, '2022-07-07 12:25:30', NULL, NULL, 'false', 'false'),
(135, NULL, 'idea.postpaid00@gmail.com', NULL, NULL, NULL, NULL, 'U', NULL, 8157, 0, '2022-07-07 12:25:37', NULL, NULL, 'false', 'false'),
(136, NULL, 'meenakhatri057@gmail.com', NULL, NULL, NULL, NULL, 'U', NULL, 3798, 0, '2022-07-07 12:26:25', NULL, NULL, 'false', 'false'),
(137, '1234454325', NULL, '', NULL, NULL, '+91', 'U', NULL, 2868, 0, '2022-07-07 13:36:54', NULL, NULL, 'false', 'false'),
(138, '2342456543', NULL, '', NULL, NULL, '+91', 'U', NULL, 5470, 0, '2022-07-07 13:37:21', NULL, NULL, 'false', 'false'),
(139, '1234567865', NULL, '', NULL, NULL, '+91', 'U', NULL, 2940, 1, '2022-07-07 13:38:27', NULL, NULL, 'false', 'false'),
(140, '3245678908', NULL, '', NULL, NULL, '+91', 'U', NULL, 5935, 1, '2022-07-07 13:44:10', NULL, NULL, 'false', 'false'),
(141, NULL, 'khuhshalipatel1059@gmail.com', NULL, NULL, NULL, NULL, 'U', NULL, 7666, 1, '2022-07-08 05:47:05', NULL, NULL, 'false', 'false'),
(142, '9558491059', NULL, '', NULL, NULL, '+91', 'U', NULL, 4736, 0, '2022-07-11 05:37:45', NULL, NULL, 'false', 'false'),
(143, '8724356924', NULL, '', NULL, NULL, '+91', 'U', NULL, 8580, 1, '2022-07-11 16:20:09', NULL, NULL, 'false', 'false'),
(144, '4567890876', NULL, '', NULL, NULL, '+91', 'U', NULL, 5011, 1, '2022-07-13 16:14:34', NULL, NULL, 'false', 'false'),
(145, '8347331291', NULL, 'BUYSOLD user', NULL, NULL, '+91', 'U', NULL, 5494, 1, '2022-07-14 16:56:15', NULL, NULL, 'false', 'false'),
(2207200009, '852312345', 'testting12345@gmail.com', 'demo', 'for check', NULL, '91', 'U', 'test', 0, 0, '2022-07-20 08:51:25', NULL, NULL, 'false', 'false'),
(2207200010, '852312346', 'testting12346@gmail.com', 'demo', 'for check', NULL, '91', 'U', 'test', 0, 0, '2022-07-20 08:56:49', NULL, NULL, 'false', 'false'),
(22072100004, NULL, 'abhishek@gmail.com', NULL, NULL, NULL, NULL, 'U', NULL, 7454, 0, '2022-07-21 09:30:50', NULL, NULL, 'false', 'false'),
(22072100005, '9191919191', NULL, 'TestDemo', NULL, NULL, '91', 'U', NULL, 3282, 0, '2022-07-21 09:32:16', NULL, NULL, 'false', 'false'),
(220722000001, NULL, 'tirthgodhani98@gmail.com', NULL, NULL, NULL, NULL, 'U', NULL, 7555, 1, '2022-07-22 18:07:05', NULL, NULL, 'false', 'false'),
(220722000002, '9313722544', NULL, '', NULL, NULL, '+91', 'U', NULL, 9973, 0, '2022-07-22 19:35:48', NULL, NULL, 'false', 'false'),
(220723000001, '8888888888', NULL, '', NULL, NULL, '91', 'U', NULL, 2267, 1, '2022-07-23 16:09:57', NULL, NULL, 'false', 'false'),
(220723000002, '5555555555', NULL, '', NULL, NULL, '91', 'U', NULL, 4949, 1, '2022-07-23 16:28:42', NULL, NULL, 'false', 'false'),
(220723000003, '2222222222', NULL, '', NULL, NULL, '91', 'U', NULL, 7632, 0, '2022-07-23 16:52:03', NULL, NULL, 'false', 'false'),
(220723000004, '2222525254', NULL, '', NULL, NULL, '91', 'U', NULL, 2943, 0, '2022-07-23 16:53:11', NULL, NULL, 'false', 'false'),
(220723000005, '6544645456', NULL, '', NULL, NULL, '91', 'U', NULL, 3563, 0, '2022-07-23 16:55:02', NULL, NULL, 'false', 'false'),
(220724000001, '1111111111', NULL, '', NULL, NULL, '91', 'U', NULL, 3760, 0, '2022-07-24 05:35:36', NULL, NULL, 'false', 'false'),
(220724000002, '1111111111', NULL, 'tirth', NULL, NULL, '91', 'U', NULL, 3263, 0, '2022-07-24 09:48:20', NULL, NULL, 'false', 'false'),
(220725000001, '1234567890', NULL, '', NULL, NULL, '91', 'U', NULL, 7677, 1, '2022-07-25 16:40:51', NULL, NULL, 'false', 'false'),
(220726000002, '9632587418', NULL, '', NULL, NULL, '+91', 'U', NULL, 4848, 0, '2022-07-26 11:14:17', NULL, NULL, 'false', 'false'),
(220726000003, '8866035555', NULL, '', NULL, NULL, '+91', 'U', NULL, 3876, 0, '2022-07-26 11:14:32', NULL, NULL, 'false', 'false'),
(220726000004, '9898982020', NULL, '', NULL, NULL, '+91', 'U', NULL, 8412, 0, '2022-07-26 11:14:51', NULL, NULL, 'false', 'false'),
(220726000005, '9625845658', NULL, '', NULL, NULL, '+91', 'U', NULL, 9586, 0, '2022-07-26 11:16:10', NULL, NULL, 'false', 'false'),
(220726000006, '6862646464', NULL, '', NULL, NULL, '+91', 'U', NULL, 5050, 0, '2022-07-26 11:17:29', NULL, NULL, 'false', 'false'),
(220726000007, '8965231478', NULL, 'TestDemo', NULL, NULL, '91', 'U', NULL, 1688, 0, '2022-07-26 11:18:14', NULL, NULL, 'false', 'false'),
(220728000001, '9727148777', 'nikunj.projects9893@gmail.com', 'demo_97', 'updat token api', NULL, '91', 'U', 'Admin@123', NULL, NULL, '2022-07-28 05:31:13', '2022-08-03 06:07:01', 'AnkitVora', 'false', 'false'),
(220728000002, '9727148777', 'demo@gmail.com', 'demo_97', 'updat token api', NULL, '91', 'U', NULL, NULL, NULL, '2022-07-28 05:39:42', '2022-08-08 04:29:49', 'sekjfhdjkghgh', 'false', 'false'),
(220802000001, '4567564325', NULL, '', NULL, NULL, '+91', 'U', NULL, 4940, 0, '2022-08-02 10:01:30', NULL, NULL, 'false', 'false'),
(220802000002, '9139827389', NULL, '', NULL, NULL, '+91', 'U', NULL, 1340, 0, '2022-08-02 10:01:39', NULL, NULL, 'false', 'false'),
(220802000003, '8347331281', NULL, '', NULL, NULL, '+91', 'U', NULL, 1668, 0, '2022-08-02 10:01:50', NULL, NULL, 'false', 'false'),
(220802000004, '2222222223', NULL, '', NULL, NULL, '+91', 'U', NULL, 8623, 0, '2022-08-02 11:18:02', NULL, NULL, 'false', 'false'),
(220802000005, '5665465456', NULL, '', NULL, NULL, '+91', 'U', NULL, 8655, 0, '2022-08-02 11:19:36', NULL, NULL, 'false', 'false'),
(220802000006, '2344567587', NULL, '', NULL, NULL, '+91', 'U', NULL, 9411, 0, '2022-08-02 11:58:07', NULL, NULL, 'false', 'false'),
(220802000007, '8847856847', NULL, '', NULL, NULL, '+91', 'U', NULL, 5548, 0, '2022-08-02 12:56:43', NULL, NULL, 'false', 'false'),
(220802000008, '8896065567', NULL, '', NULL, NULL, '+91', 'U', NULL, 2062, 0, '2022-08-02 16:27:46', NULL, NULL, 'false', 'false'),
(220803000001, '9727148777', 'demo@gmail.com', 'demo_97', 'updat token api', NULL, '91', 'U', NULL, NULL, NULL, '2022-08-03 05:56:51', NULL, NULL, 'false', 'false'),
(220805000001, '8866035597', NULL, 'BUYSOLD user', NULL, NULL, '+91', 'U', NULL, 9189, 0, '2022-08-05 19:07:28', NULL, NULL, 'false', 'false'),
(220805000002, '8866035567', NULL, 'BUYSOLD user', NULL, NULL, '+91', 'U', NULL, 5025, 0, '2022-08-05 19:07:35', NULL, NULL, 'false', 'false'),
(220805000003, NULL, 'test1@gmail.com', 'testing', 'got it', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650351368/ff0cert2x4dp4n3dtf5f.png', NULL, NULL, '12345', NULL, NULL, '2022-08-12 09:11:41', '2022-08-12 09:11:41', NULL, 'false', 'false'),
(220805000005, '1234567899', 'dev@gmail.com', 'demo account', 'for check', 'http://res.cloudinary.com/mr-group-tech/image/upload/v1650351368/ff0cert2x4dp4n3dtf5f.png', '91', NULL, NULL, NULL, NULL, NULL, NULL, 'ct32XuEjfHOTEWBHTWutoEMyOBk1', 'false', 'true');


--
-- Table structure for table `vehicle_inventory_mast`
--

DROP TABLE IF EXISTS `vehicle_inventory_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_inventory_mast` (
  `vehicle_inventory_id` int NOT NULL,
    `user_id` varchar(126) DEFAULT NULL,
  `vehicle_inventory_code` varchar(45) DEFAULT NULL,
  `inventory_type` varchar(45) NOT NULL,
  `v_title` varchar(126) DEFAULT NULL,
  `v_price` int DEFAULT NULL,
  `v_picture_link_1` varchar(512) DEFAULT NULL,
  `v_picture_link_2` varchar(512) DEFAULT NULL,
  `v_picture_link_3` varchar(512) DEFAULT NULL,
  `v_picture_link_4` varchar(512) DEFAULT NULL,
  `v_picture_link_5` varchar(512) DEFAULT NULL,
  `v_picture_link_6` varchar(512) DEFAULT NULL,
  `v_picture_link_7` varchar(512) DEFAULT NULL,
  `v_picture_link_8` varchar(512) DEFAULT NULL,
  `v_picture_link_9` varchar(512) DEFAULT NULL,
  `v_picture_link_10` varchar(512) DEFAULT NULL,
  `v_type_id` int DEFAULT NULL,
  `brand` varchar(126) DEFAULT NULL,
  `kms` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `insuarance` tinyint DEFAULT NULL,
  `i_description` varchar(512) DEFAULT NULL,
  `v_show_mo_no` tinyint DEFAULT NULL,
  `v_description` varchar(512) DEFAULT NULL,
  `v_location` varchar(512) DEFAULT NULL,
  `latitude` decimal(11,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `cat_id` int DEFAULT NULL,
  `sub_cat_id` int DEFAULT NULL,
  PRIMARY KEY (`vehicle_inventory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_inventory_mast`
--

LOCK TABLES `vehicle_inventory_mast` WRITE;
/*!40000 ALTER TABLE `vehicle_inventory_mast` DISABLE KEYS */;
INSERT INTO `vehicle_inventory_mast` VALUES (1,1,'bike_1','bike','bike title',12000,NULL,NULL,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1653892697/m7x1lvroylgmtrzcnvs8.png',NULL,NULL,NULL,NULL,NULL,'demo',10,NULL,4,1,'description',1,'demo','surat',12.23650000,78.25580000,'2022-05-30 06:25:13','2022-05-30 06:38:18',9,39),(2,1,'bike_2','bike','bike title',12000,NULL,NULL,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1653892676/hgmqalqanr2ukk10rtkm.png',NULL,NULL,NULL,NULL,NULL,'demo',10,NULL,4,1,'description',1,'demo','surat',20.23650000,78.25580000,'2022-05-30 06:36:20','2022-05-30 06:37:57',9,39),(3,1,'bike_3','bike','bike title',12000,NULL,NULL,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1653892703/zpx7sju8pxo75tsej8ai.png',NULL,NULL,NULL,NULL,NULL,'demo',10,NULL,4,1,'description',1,'demo','surat',20.23650000,78.25580000,'2022-05-30 06:38:23',NULL,9,39),(4,1,'bike_4','bike','bike title',12000,NULL,NULL,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1653892788/sdv34r0frlbwbauleleu.png',NULL,NULL,NULL,NULL,NULL,'demo',10,NULL,4,1,'description',1,'demo','surat',12.23650000,78.25580000,'2022-05-30 06:39:48',NULL,9,39),(5,1,'bike_5','bike','bike title',12000,NULL,NULL,NULL,NULL,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1653894300/zipgllofjh7wpncpghel.png',NULL,NULL,NULL,NULL,NULL,'demo',10,NULL,5,1,'description',1,'demo','surat',12.23650000,78.25580000,'2022-05-30 07:05:01',NULL,9,39),(6,42,'comm_vehicle_6','commercial vehicle','vehicle title',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1653895761/hs9xza9sbrw4ohjx4lyp.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo',10,10,6,0,NULL,1,'demo','surat',20.62202000,78.94590000,'2022-05-30 07:26:42','2022-05-30 07:29:21',11,52),(7,42,'comm_vehicle_7','commercial vehicle','vehicle title',12000,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658729393/lnzw8iazwy0ewwytkwpl.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo1',10,10,6,0,NULL,1,'demo','surat',20.62202000,78.94590000,'2022-06-22 07:19:41','2022-07-25 06:09:54',11,52),(8,42,'comm_vehicle_8','commerical vehicle','vehicle title',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1655882475/jn1bxr5bxae1o7hakeaj.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo',10,10,6,0,NULL,1,'demo','junagadh',21.52220000,70.45790000,'2022-06-22 06:20:00','2022-06-22 06:25:12',11,52),(9,126,'comm_vehicle_9','commercial vehicle','demo dsagschg hgv h',20000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657046660/zz4daolrvmdbihksybxn.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'dfeik',1500,NULL,0,1,'',1,'demo debj NM have jh','efews',78.25580000,78.25580000,'2022-07-05 18:44:20',NULL,11,52),(10,5,'comm_vehicle_10','commercial vehicle','32123123131321',121,'http://res.cloudinary.com/mr-group-tech/image/upload/v1657819093/ltvvhdtymvvmgkjygeaz.png','undefined','undefined','undefined','undefined',NULL,'undefined',NULL,'undefined','undefined',2,'12',12,NULL,10,1,'6',1,'12121212121212','1221',21.20089600,72.82688000,'2022-07-14 17:18:14',NULL,0,8),(11,1,'bike_11','bike','bike title',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658558922/xncrdad4hcx5oiantefb.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2',10,NULL,5,1,'description',1,'demo','surat',12.23650000,78.25580000,'2022-07-23 06:48:43',NULL,9,39),(12,1,'bike_12','bike','bike title',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658558940/johkemc3nvsukqjrgnzs.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2',10,NULL,5,1,'description',1,'demo','surat',12.23650000,78.25580000,'2022-07-23 06:49:00',NULL,9,39),(13,1,'bike_13','bike','bike title',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658558952/weu0uvmqdgjrknv3ykkf.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2',10,NULL,5,1,'description',1,'demo','surat',12.23650000,78.25580000,'2022-07-23 06:49:12',NULL,9,39),(14,1,'bike_14','bike','bike title',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658560287/hb1idpau9sxu2jjzqoc4.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2',10,NULL,5,1,'description',1,'demo','surat',12.23650000,78.25580000,'2022-07-23 07:11:28',NULL,9,39),(15,1,'bike_15','bike','bike title',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658560302/edldihfjt0xkxku1w94p.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2',10,NULL,5,1,'description',1,'demo','surat',12.23650000,78.25580000,'2022-07-23 07:11:43',NULL,9,39),(16,1,'bike_16','bike','bike title',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658560594/uq5z0qphopguc5ewzdy7.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2',10,NULL,5,1,'description',1,'demo','surat',12.23650000,78.25580000,'2022-07-23 07:16:35',NULL,9,39),(17,1,'bike_17','bike','bike title',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658576631/lrfs9xoooewinvxhmrsm.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2',10,NULL,5,1,'description',1,'demo','surat',12.23650000,78.25580000,'2022-07-23 11:43:51',NULL,9,39),(18,145,'comm_vehicle_18','commercial vehicle','rth urftuju tfujd',45746,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658689605/jtmwegungryrkokb791l.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'db dnfn',345345,NULL,0,1,'htrtnrftynr',1,'ntedn end the tente','Udhana, Surat',0.00000000,0.00000000,'2022-07-24 19:06:45',NULL,11,52),(19,42,'comm_vehicle_19','commercial vehicle','vehicle title',12000,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658727510/nbyqixcalgl42yvtwqht.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo1',10,10,6,0,NULL,1,'demo','surat',20.62202000,78.94590000,'2022-07-25 05:38:31',NULL,11,52),(20,42,'comm_vehicle_20','commercial vehicle','vehicle title',12000,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658728188/bkcjkqtd3ky9g5pbgrbp.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo1',10,10,6,0,NULL,1,'demo','surat',20.62202000,78.94590000,'2022-07-25 05:49:49',NULL,11,52),(21,42,'comm_vehicle_21','commercial vehicle','vehicle title',12000,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658728302/i4v1dbgfmm6plzkzaeqb.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo1',10,10,6,0,NULL,1,'demo','surat',20.62202000,78.94590000,'2022-07-25 05:51:43',NULL,11,52),(22,42,'comm_vehicle_22','commercial vehicle','vehicle title',12000,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658728329/h4mpagb8uhpv4b8xcie6.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo1',10,10,6,0,NULL,1,'demo','surat',20.62202000,78.94590000,'2022-07-25 05:52:09',NULL,11,52),(23,42,'comm_vehicle_23','commercial vehicle','vehicle title',12000,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658728398/wopa4acjwhbjzuinuux9.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo1',10,10,6,0,NULL,1,'demo','surat',20.62202000,78.94590000,'2022-07-25 05:53:19',NULL,11,52),(24,42,'comm_vehicle_24','commercial vehicle','vehicle title',12000,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658728637/qnagnkyk5xmbazapy2o9.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo1',10,10,6,0,NULL,1,'demo','surat',20.62202000,78.94590000,'2022-07-25 05:57:18',NULL,11,52),(25,42,'comm_vehicle_25','commercial vehicle','vehicle title',12000,NULL,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658728723/rkjrrpuqfkcf8r9aiy4g.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'demo1',10,10,6,0,NULL,1,'demo','surat',20.62202000,78.94590000,'2022-07-25 05:58:43',NULL,11,52),(26,1,'bike_26','bike','bike title',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658730033/wvs4qlzk0yfk7i0odncq.png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2',10,NULL,5,1,'description',1,'demo','surat',12.23650000,78.25580000,'2022-07-25 06:19:48','2022-07-25 06:20:34',9,39),(27,145,'bike_27','bike','qeawrvfbdg sfv dv',1234,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658775022/kzdgtrm6vawqtrofxvaq.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,'qefwvsfd vc','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 18:50:22',NULL,9,39),(28,145,'comm_vehicle_28','commercial vehicle','wfervebdg bvcvv',2345435,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658775100/vpw6k8tqnghscdtpgghy.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,NULL,0,NULL,0,'defsvfd vcbvcds x','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 18:51:42',NULL,11,52),(29,145,'comm_vehicle_29','commercial vehicle','qefwvfv swc',324,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658775253/kaf8rpq7mdyauxbq9k3q.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL,NULL,NULL,0,NULL,0,'r3f2ewvfed VC cs','Udhana, Surat',0.00000000,0.00000000,'2022-07-25 18:54:14',NULL,11,52),(30,125,'bike_30','bike','how to make sure you',555,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658802507/hfbqdhjzsbgqroppgim5.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4',NULL,NULL,NULL,0,NULL,0,'how to make sure you are','Udhana, Surat',0.00000000,0.00000000,'2022-07-26 02:28:31',NULL,9,39),(31,124,'bike_31','bike','bike title',1021,'http://res.cloudinary.com/mr-group-tech/image/upload/v1658942974/p9krccqxl0d7mshr5zha.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3',10,NULL,NULL,1,'f ht fthftghj fth',1,'demo fghf tghfth','surat',21.17024000,72.83106000,'2022-07-27 17:29:34',NULL,9,39),(32,125,'bike_32','bike','bike form test',2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659031498/gnzhw89cxjcujqvf1a95.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5',2500,NULL,15,1,'hello',1,'Take a look at this ViewSonic 23.8 inch Full HD LED Backlit IPS Panel Hig','Vesu, Surat',0.00000000,0.00000000,'2022-07-28 18:04:58',NULL,9,39),(33,125,'comm_vehicle_33','commercial vehicle','commercial vehicles',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659031533/shfbxzb1krom927zgumx.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,'brand',2500,NULL,16,1,'hello',0,'Take a look at this ViewSonic 23.8 inch Full HD LED Backlit IPS Panel Hig','Vesu, Surat',0.00000000,0.00000000,'2022-07-28 18:05:34',NULL,11,52),(34,125,'bike_34','bike','bike form test',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659331437/tkwhitgdyydusl5n9mdg.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4',2580,NULL,15,1,'hdjd',1,'how to make sure you are','Vesu, Surat',0.00000000,0.00000000,'2022-08-01 05:23:57',NULL,9,39),(35,125,'comm_vehicle_35','commercial vehicle','commercial vehicles',2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659331499/c7kbyupy8hcid3ee4pll.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'t',2500,NULL,15,1,'jdjd',1,'tdkdkdndndnd','Vesu, Surat',0.00000000,0.00000000,'2022-08-01 05:24:59',NULL,11,52),(36,125,'bike_36','bike','Bike Model add',2300,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659336441/ebssanhd5vsbpde5x6p7.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4',2300,NULL,15,1,'demo rotro',1,'deonnin just need what fjwr just need to make sure','Udhana, Surat',0.00000000,0.00000000,'2022-08-01 06:47:22',NULL,9,39),(37,125,'bike_37','bike','bike form form',25000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659422745/rz5yavaav1w4diq2hzu6.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4',255,NULL,15,1,'hello',0,'how to make sure you','Udhana, Surat',0.00000000,0.00000000,'2022-08-02 06:45:45',NULL,9,39),(38,125,'bike_38','bike','Hello Kitty and I',2555,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659422959/fd7dxkio6moidxiugtoe.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',55,NULL,12,1,NULL,1,'how to make sure you are','Udhana, Surat',0.00000000,0.00000000,'2022-08-02 06:49:19',NULL,9,39),(39,125,'bike_39','bike','demo ktm issue',12000,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659423745/nvcou8axnlyrprv86l3p.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'4',1200,NULL,15,1,'demon ktm insurance',0,'demo definitely be there','Udhana, Surat',0.00000000,0.00000000,'2022-08-02 07:02:25',NULL,9,39),(40,125,'bike_40','bike','how to make',25,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659699274/gonlkg8lv7b2rvvyj4tv.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1',25,NULL,18,1,'g',0,'how to sale','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 11:34:35',NULL,9,39),(41,125,'comm_vehicle_41','commercial vehicle','how to make',2,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659699310/c41os1tzp1bes3qp40jn.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'wt',250,NULL,11,1,'hh',1,'how to sale','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 11:35:10',NULL,11,52),(42,125,'comm_vehicle_42','commercial vehicle','how to make',2500,'http://res.cloudinary.com/mr-group-tech/image/upload/v1659699570/wii6bkwe7ebdq8yolfut.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'uu',25000,NULL,12,1,'iiii',1,'how to sale','Vesu, Surat',0.00000000,0.00000000,'2022-08-05 11:39:30',NULL,11,52);
/*!40000 ALTER TABLE `vehicle_inventory_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_type_mast`
--

DROP TABLE IF EXISTS `vehicle_type_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_type_mast` (
  `v_type_id` int NOT NULL AUTO_INCREMENT,
  `v_type_name` varchar(126) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`v_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_type_mast`
--

LOCK TABLES `vehicle_type_mast` WRITE;
/*!40000 ALTER TABLE `vehicle_type_mast` DISABLE KEYS */;
INSERT INTO `vehicle_type_mast` VALUES (1,'Bus','2022-07-05 06:38:30',NULL),(2,'Auto rikshaws','2022-07-05 06:38:45',NULL),(4,'Modeifeid Jeeps','2022-07-05 06:39:13',NULL),(5,'Heavey Machinery ','2022-07-05 06:39:32',NULL),(6,'Pick-up vans','2022-07-05 06:40:08',NULL),(7,'Scarp Cars ','2022-07-05 06:40:34',NULL),(8,'Taxi Cabs ','2022-07-05 06:40:48',NULL),(9,'Tracktors ','2022-07-05 06:40:59',NULL);
/*!40000 ALTER TABLE `vehicle_type_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views_count_mast`
--

DROP TABLE IF EXISTS `views_count_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `views_count_mast` (
  `view_id` int NOT NULL AUTO_INCREMENT,
  `ads_id` int DEFAULT NULL,
    `user_id` varchar(126) DEFAULT NULL,
  `views_count` int DEFAULT NULL,
  PRIMARY KEY (`view_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views_count_mast`
--

LOCK TABLES `views_count_mast` WRITE;
/*!40000 ALTER TABLE `views_count_mast` DISABLE KEYS */;
INSERT INTO `views_count_mast` VALUES (1,1,1,1),(2,2,2,1),(3,1,2,1),(4,1,3,1),(5,1,4,1),(6,1,5,1),(7,2,5,1),(8,2,7,1),(9,1,7,1),(10,12,7,1),(11,12,8,1),(12,12,9,1),(13,12,15,1),(14,12,17,1),(15,12,20,1),(16,3,1,1),(17,3,2,1),(18,3,4,1),(19,3,8,1),(20,3,9,1),(21,3,12,1),(22,4,1,1),(23,5,1,1),(24,6,1,1);
/*!40000 ALTER TABLE `views_count_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `year_mast`
--

DROP TABLE IF EXISTS `year_mast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `year_mast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Indexes for table `user_mast`
--
ALTER TABLE `user_mast`
  ADD PRIMARY KEY (`login_id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for table `user_mast`
--
ALTER TABLE `user_mast`
  MODIFY `login_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Dumping data for table `year_mast`
--

LOCK TABLES `year_mast` WRITE;
/*!40000 ALTER TABLE `year_mast` DISABLE KEYS */;
INSERT INTO `year_mast` VALUES (7,2020,'2022-07-04 17:13:50',NULL),(8,2022,'2022-07-04 17:13:57',NULL),(9,2021,'2022-07-04 17:14:02',NULL),(10,2020,'2022-07-04 17:14:06',NULL),(11,2019,'2022-07-04 17:14:11',NULL),(12,2018,'2022-07-04 17:14:16',NULL),(13,2017,'2022-07-04 17:14:19',NULL),(14,2016,'2022-07-04 17:14:22',NULL),(15,2015,'2022-07-04 17:14:27',NULL),(16,2014,'2022-07-04 17:14:30',NULL),(17,2013,'2022-07-04 17:14:33',NULL),(18,2012,'2022-07-04 17:14:36',NULL),(19,2011,'2022-07-04 17:14:40',NULL),(20,2010,'2022-07-04 17:14:43',NULL),(21,2009,'2022-07-04 17:14:50',NULL),(22,2008,'2022-07-04 17:14:54',NULL);
/*!40000 ALTER TABLE `year_mast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bsapp_db'
--

--
-- Dumping routines for database 'bsapp_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `asp_notification_subscribe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `asp_notification_subscribe`(
	IN in_device_token_id INT,
    IN in_subscribe BOOLEAN
)
BEGIN
   UPDATE bsapp_db.device_token_mast
	SET
	subscribe = in_subscribe,
    modified_at = now()
	WHERE idd = in_device_token_id;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ads_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ads_mast_delete`(
	IN in_ads_id bigint
)
BEGIN
	DELETE FROM bsapp_db.ads_mast WHERE ads_id = in_ads_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ads_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ads_mast_fill`(
	IN in_user_id VARCHAR(125),
    IN in_limit INT,
    IN in_page_no INT,
    IN in_ad_status VARCHAR(125)
)
BEGIN
DECLARE in_offset INT;
SET in_offset = (in_page_no -1) * in_limit;

select *,count(*) over() as total_record FROM(
(SELECT 
	AD.ads_id AS Ads_id,
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y') AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y')  AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    CS.c_picture_link_1 AS Image,
    CS.car_title AS Name,
    FORMAT(CS.c_price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    CS.c_location as location,
    DATE_FORMAT(CS.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(CS.modified_at,'%d %b %y') AS Modify_Date,
    CASE WHEN CS.modified_at > CS.created_at THEN CS.modified_at ELSE CS.created_at END AS ORDER_DATE,
    SM.state_name AS car_registration_state,
    CS.c_km AS car_km,
    CO.name AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    YM.value AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.car_sell_inventory_mast CS
        LEFT JOIN  bsapp_db.ads_mast AD ON CS.car_sell_inventory_id = AD.inventory_id   AND CS.car_sell_inventory_code = AD.inventory_code   AND CS.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN  bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
		LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
		LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
		LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
WHERE  AD.user_id = in_user_id)
UNION 
   (SELECT 
   AD.ads_id AS Ads_id,
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y')  AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y')  AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    AI.picture_link_1 AS Image,
    AI.title AS Name,
    FORMAT(AI.price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    AI.location as location,
    DATE_FORMAT(AI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(AI.modified_at,'%d %b %y') AS Modify_Date,
    CASE WHEN AI.modified_at > AI.created_at THEN AI.modified_at ELSE AI.created_at END AS ORDER_DATE,
    '' AS car_registration_state,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
  bsapp_db.all_inventory_mast  AI
        LEFT JOIN bsapp_db.ads_mast AD ON AI.all_inventory_id = AD.inventory_id    AND AI.all_inventory_code = AD.inventory_code   AND AI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN  bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
WHERE  AD.user_id = in_user_id)
UNION 
    (SELECT 
    AD.ads_id AS Ads_id,
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y')AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y')  AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y')   AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    CR.c_picture_link_1 AS Image,
    CR.car_title AS Name,
    FORMAT(CR.c_price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    CR.c_location as location,
    DATE_FORMAT(CR.created_at,'%d %b %y')  AS Create_Date,
    DATE_FORMAT(CR.modified_at,'%d %b %y')  AS Modify_Date,
    CASE WHEN CR.modified_at > CR.created_at THEN CR.modified_at ELSE CR.created_at END AS ORDER_DATE,
	'' AS car_registration_state,
    c_km_limit AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.car_rent_inventory_mast CR
        LEFT JOIN bsapp_db.ads_mast AD ON CR.car_rent_inventory_id = AD.inventory_id   AND CR.car_rent_inventory_code = AD.inventory_code     AND CR.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN  bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
WHERE  AD.user_id = in_user_id)
    UNION 
	(SELECT 
    AD.ads_id AS Ads_id,
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y')  AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y')   AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    JI.j_picture_link_1 AS Image,
    JI.j_title AS Name,
    0 AS price,
    JI.from_salary AS From_salary,
    JI.to_salary AS To_salary,
    JI.j_location as location,
    DATE_FORMAT(JI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(JI.modified_at,'%d %b %y')  AS Modify_Date,
    CASE WHEN JI.modified_at > JI.created_at THEN JI.modified_at ELSE JI.created_at END AS ORDER_DATE,
	'' AS car_registration_state,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    JT.j_type_name AS Job_type,
    SP.s_p_name AS Job_salary_period
FROM
     bsapp_db.job_inventory_mast JI
		LEFT JOIN bsapp_db.ads_mast AD ON JI.job_inventory_id = AD.inventory_id   AND JI.job_inventory_code = AD.inventory_code  AND JI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
WHERE  AD.user_id = in_user_id)
    UNION 
        (SELECT 
    AD.ads_id AS Ads_id,    
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y') AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y') AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    MI.mo_picture_link_1 AS Image,
    MI.mo_title AS Name,
    FORMAT(MI.mo_price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    MI.location as location,
    DATE_FORMAT(MI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(MI.modified_at,'%d %b %y') AS Modify_Date,
    CASE WHEN MI.modified_at > MI.created_at THEN MI.modified_at ELSE MI.created_at END AS ORDER_DATE,
    '' AS car_registration_state,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    RAM.value AS Mobile_ram,
    ROM.value AS Mobile_rom,
    BR.brand_name AS Mobile_brand,
    MI.mo_colour AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.mobile_inventory_mast MI
	    LEFT JOIN bsapp_db.ads_mast AD ON MI.mo_inventory_id = AD.inventory_id  AND MI.mo_inventory_code = AD.inventory_code  AND MI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.mobile_brand_mast BR  ON  MI.brand_id = BR.brand_id 
        LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
		LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
WHERE  AD.user_id = in_user_id)
UNION
      (SELECT 
    AD.ads_id AS Ads_id,  
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y') AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y') AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    OI.o_picture_link_1 AS Image,
    OI.o_title AS Name,
    FORMAT(OI.o_price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    OI.o_location as location,
    DATE_FORMAT(OI.created_at,'%d %b %y')  AS Create_Date,
    DATE_FORMAT(OI.modified_at,'%d %b %y')  AS Modify_Date,
    CASE WHEN OI.modified_at > OI.created_at THEN OI.modified_at ELSE OI.created_at END AS ORDER_DATE,
    '' AS car_registration_state,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    OC.value as Cabin,
	OW.value as Washroom,
    OI.o_sq_ft AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.office_inventory_mast OI
		LEFT JOIN bsapp_db.ads_mast AD ON OI.office_inventory_id = AD.inventory_id  AND OI.office_inventory_code = AD.inventory_code  AND OI.inventory_type = AD.inventory_type
        LEFT JOIN bsapp_db.office_cabin_mast  OC  ON  OI.cabin =OC.id
        LEFT JOIN bsapp_db.office_washroom_mast  OW  ON  OI.washroom =OW.id
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
WHERE  AD.user_id = in_user_id)
UNION 
(SELECT 
	AD.ads_id AS Ads_id,
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y') AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y')  AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    PI.p_picture_link_1 AS Image,
    PI.p_title AS Name,
    FORMAT(PI.p_price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    PI.p_location as location,
    DATE_FORMAT(PI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(PI.modified_at,'%d %b %y') AS Modify_Date,
    CASE WHEN PI.modified_at > PI.created_at THEN PI.modified_at ELSE PI.created_at END AS ORDER_DATE,
    '' AS car_registration_state,
    0 AS car_km,
    '' AS owner,
    BED.value as Bedroom,
	BAT.value as Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    PI.p_sq_ft AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
      bsapp_db.property_inventory_mast PI
	   LEFT JOIN bsapp_db.ads_mast AD ON PI.property_inventory_id = AD.inventory_id  AND PI.property_inventory_code = AD.inventory_code AND PI.inventory_type = AD.inventory_type
       LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
	   LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
       LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
        LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
       LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
WHERE  AD.user_id = in_user_id)
 UNION 
    (SELECT 
    AD.ads_id AS Ads_id,
    AD.inventory_id AS Inventory_id,
    AD.user_id AS User_id, 
    AD.inventory_code AS Inventory_code,
    AD.inventory_type AS Inventory_type,
    DATE_FORMAT(AD.from_date,'%d %b %y') AS From_date,
    DATE_FORMAT(AD.to_date,'%d %b %y')  AS To_date,
    ADS.ad_status_id AS Ad_status_code,
    ADS.ad_status AS Ad_status,
    ADS.ad_status_message AS Ad_status_message,
    AD.likes AS likes,
    AD.views AS views,
    AD.created_at AS Created_date,
    DATE_FORMAT(AD.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(AD.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    CAT.id AS Category_id,
    SUB.id AS Sub_category_id,
    SUB.sub_cat_name AS Sub_category,
    VI.v_picture_link_1 AS Image,
    VI.v_title AS Name,
    FORMAT(VI.v_price, 0) AS Price,
    0 AS from_salary,
    0 AS to_salary,
    VI.v_location as location,
    DATE_FORMAT(VI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(VI.modified_at,'%d %b %y') AS Modify_Date,
    CASE WHEN VI.modified_at > VI.created_at THEN VI.modified_at ELSE VI.created_at END AS ORDER_DATE,
    '' AS car_registration_state,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    YM.value AS year_of_registration,
    VI.kms AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
    bsapp_db.vehicle_inventory_mast VI
		LEFT JOIN bsapp_db.ads_mast AD  ON VI.vehicle_inventory_id = AD.inventory_id   AND VI.vehicle_inventory_code  = AD.inventory_code  AND VI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
        LEFT JOIN  bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id        
WHERE  AD.user_id = in_user_id))AS SUBQ WHERE find_in_set(Ad_status_code,in_ad_status) 
ORDER BY ORDER_DATE DESC
limit in_limit offset in_offset;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ads_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ads_mast_save`(
	IN in_ads_id INT,
    IN in_inventory_id INT,
    IN in_user_id VARCHAR(125),
    IN in_inventory_code VARCHAR(126),
    IN in_inventory_type VARCHAR(126),
    IN in_ad_status_id INT
)
BEGIN
DECLARE in_ads_seq_id BIGINT;
IF NOT EXISTS(SELECT user_id,inventory_id,inventory_code,UPPER(inventory_type),inventory_type FROM bsapp_db.ads_mast WHERE  user_id = in_user_id AND inventory_id = in_inventory_id AND inventory_code = in_inventory_code AND UPPER(inventory_type) = in_inventory_code AND inventory_type = in_inventory_type ) THEN
 call sp_ads_sequence();
   SET in_ads_seq_id = (select  seq_id  from bsapp_db.ads_sequence_mast where seq_date = CURDATE());
 	INSERT INTO bsapp_db.ads_mast
		(ads_id,inventory_id,user_id,inventory_code,inventory_type,from_date,to_date,ad_status_id,likes,views,created_at)
	VALUES
		(in_ads_seq_id,in_inventory_id,in_user_id,in_inventory_code,in_inventory_type,now(),ADDDATE(from_date, INTERVAL 28 DAY),in_ad_status_id,0,0,now());
	SELECT * FROM bsapp_db.ads_mast WHERE ads_id = LAST_INSERT_ID();
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ads_sequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ads_sequence`()
BEGIN

DECLARE max_seq_id BIGINT;
SET max_seq_id =(select  max(seq_id)  + 1  from bsapp_db.ads_sequence_mast where seq_date = CURDATE());
IF NOT EXISTS (SELECT seq_date FROM bsapp_db.ads_sequence_mast WHERE seq_date = CURDATE()) THEN

	INSERT INTO bsapp_db.ads_sequence_mast
		(seq_date,seq_id)
	VALUES
		(CURDATE(),(select concat((date_format(now(),'%y') * 10000 + date_format(now(),'%m') * 100 + date_format(now(),'%d')),'000001')));
	-- SELECT seq_id from bsapp_db.login_sequence_mast where seq_date = CURDATE();
    ELSE
		UPDATE bsapp_db.ads_sequence_mast
		SET
        seq_id = max_seq_id
        WHERE seq_date = CURDATE();

	-- SELECT max_seq_id as seq_id;
END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ads_status_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ads_status_update`(
	IN in_ads_id BIGINT,
    IN in_ad_status_id INT
)
BEGIN

   UPDATE bsapp_db.ads_mast
	SET
    ad_status_id = in_ad_status_id,
    modified_at = now()
	WHERE ads_id = in_ads_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ad_status_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ad_status_mast_delete`(
	IN in_ad_status_id INT
)
BEGIN
	DELETE FROM bsapp_db.ad_status_mast WHERE ad_status_id = in_ad_status_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ad_status_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ad_status_mast_fill`(
)
BEGIN
	SELECT * FROM bsapp_db.ad_status_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ad_status_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ad_status_mast_save`(
	IN in_ad_status_id INT,
    IN in_ad_status VARCHAR(126),
    IN in_ad_status_message VARCHAR(512),
    IN in_ad_status_filter_name VARCHAR(256)
)
BEGIN
IF NOT EXISTS(SELECT ad_status_id FROM bsapp_db.ad_status_mast WHERE ad_status_id = in_ad_status_id) THEN
 	INSERT INTO bsapp_db.ad_status_mast
		(ad_status,ad_status_message,ad_status_filter_name,created_at)
	VALUES
		(in_ad_status,in_ad_status_message,in_ad_status_filter_name,now());
ELSE
   UPDATE bsapp_db.ad_status_mast
	SET
	ad_status = in_ad_status,
    ad_status_message = in_ad_status_message,
    ad_status_filter_name = in_ad_status_filter_name,
    modified_at = now()
	WHERE ad_status_id = in_ad_status_id;
	
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ad_status_mast_save_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ad_status_mast_save_update`(
)
BEGIN
  UPDATE bsapp_db.ads_mast INNER JOIN bsapp_db.ad_status_mast on "IN PROGRESS" = bsapp_db.ad_status_mast.ad_status
  SET bsapp_db.ads_mast.ad_status_id = bsapp_db.ad_status_mast.ad_status_id
  WHERE bsapp_db.ads_mast.ad_status_id IS NULL 
  OR bsapp_db.ads_mast.ad_status_id = 0;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_all_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_all_inventory_mast_delete`(
  IN in_all_inventory_id INT,
  IN in_user_id VARCHAR(125)
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.all_inventory_mast AI  ON  AD.inventory_code= AI.all_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_all_inventory_id );
   DELETE FROM bsapp_db.all_inventory_mast WHERE all_inventory_id = in_all_inventory_id AND user_id = in_user_id ;
   call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_all_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_all_inventory_mast_fill`(
  IN in_all_inventory_code VARCHAR(126),
  IN in_cat_id INT
)
BEGIN
		SELECT 
			AI.all_inventory_id, IFNULL(AD.ads_id, "-") AS ads_id, IFNULL(AI.user_id, "-") AS user_id, 
			IFNULL(AI.all_inventory_code, "-") AS all_inventory_code, IFNULL(AI.inventory_type, "-") AS inventory_type, 
            IFNULL(CAT.cat_name, "-") AS cat_name, IFNULL(SUB.sub_cat_name, "-") AS sub_cat_name, 
            IFNULL(AI.title, "-") AS title, IFNULL(FORMAT(AI.price, 0), "-") AS Price, 
            AI.picture_link_1, AI.picture_link_2, AI.picture_link_3, AI.picture_link_4,
            AI.picture_link_5, AI.picture_link_6, AI.picture_link_7, AI.picture_link_8,
            AI.picture_link_9, AI.picture_link_10, 
            IFNULL(AI.show_mo_no, "-") AS show_mo_no, IFNULL(AI.description, "-") AS description,
            IFNULL(AI.location, "-") AS location, IFNULL(AI.latitude, "-") AS latitude, 
            IFNULL(AI.longitude, "-") AS longitude, 
            IFNULL(DATE_FORMAT(AI.created_at,'%d %b %y'), "-") as ad_created, 
            IFNULL(AI.modified_at, "-") AS modified_at,
            IFNULL(UM.profile_picture_link, "-") as profile_picture, IFNULL(UM.name, "-") as user_name,
            IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
        CAT.id as cat_id, SUB.id as sub_cat_id
        FROM bsapp_db.all_inventory_mast AI
        LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = AI.all_inventory_code 
        LEFT JOIN bsapp_db.user_mast UM ON UM.user_id = AI.user_id
        WHERE AI.all_inventory_code = in_all_inventory_code AND AI.cat_id = in_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_all_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_all_inventory_mast_save`(
	IN in_all_inventory_id INT,
    IN in_user_id VARCHAR(125),
    IN in_inventory_type VARCHAR(126),
    IN in_cat_id INT,
    IN in_sub_cat_id INT,
	IN in_title VARCHAR(126),
	IN in_price INT,
	IN in_picture_link_1 VARCHAR(512),
    IN in_picture_link_2 VARCHAR(512),
    IN in_picture_link_3 VARCHAR(512),
    IN in_picture_link_4 VARCHAR(512),
    IN in_picture_link_5 VARCHAR(512),
    IN in_picture_link_6 VARCHAR(512),
    IN in_picture_link_7 VARCHAR(512),
    IN in_picture_link_8 VARCHAR(512),
    IN in_picture_link_9 VARCHAR(512),
    IN in_picture_link_10 VARCHAR(512),
    IN in_show_mo_no  BOOLEAN,
	IN in_description VARCHAR(512),
	IN in_location VARCHAR(126),
    IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8)
)
BEGIN
DECLARE get_max_inventory_id INT;

select COALESCE(MAX(all_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.all_inventory_mast;

IF NOT EXISTS(select all_inventory_id from bsapp_db.all_inventory_mast where all_inventory_id = in_all_inventory_id AND user_id = in_user_id) THEN
	INSERT INTO bsapp_db.all_inventory_mast
    		(all_inventory_id,user_id,all_inventory_code,inventory_type,cat_id,sub_cat_id,title,price,picture_link_1,picture_link_2,picture_link_3,picture_link_4,picture_link_5,picture_link_6,picture_link_7,picture_link_8,picture_link_9,picture_link_10,show_mo_no,description,location,latitude,longitude,created_at)
	VALUES
			(get_max_inventory_id,in_user_id,concat("all_",get_max_inventory_id),IFNULL(in_inventory_type,'ALL'),in_cat_id,in_sub_cat_id,in_title,in_price,in_picture_link_1,in_picture_link_2,in_picture_link_3,in_picture_link_4,in_picture_link_5,in_picture_link_6,in_picture_link_7,in_picture_link_8,in_picture_link_9,in_picture_link_10,in_show_mo_no,in_description,in_location,in_latitude,in_longitude,now());
		call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("all_",get_max_inventory_id),"all",1);
        select * from bsapp_db.all_inventory_mast where all_inventory_id = get_max_inventory_id;
ELSE
	UPDATE bsapp_db.all_inventory_mast
	SET
    cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id,
	title = in_title,
    price = in_price,
    picture_link_1 = in_picture_link_1,
    picture_link_2 = in_picture_link_2,
    picture_link_3 = in_picture_link_3,
    picture_link_4 = in_picture_link_4,
    picture_link_5 = in_picture_link_5,
    picture_link_6 = in_picture_link_6,
    picture_link_7 = in_picture_link_7,
    picture_link_8 = in_picture_link_8,
    picture_link_9 = in_picture_link_9,
    picture_link_10 = in_picture_link_10,
	show_mo_no = in_show_mo_no,
    description = in_description,
	location = in_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now()
	WHERE all_inventory_id = in_all_inventory_id AND user_id = in_user_id;
    select * from bsapp_db.all_inventory_mast where all_inventory_id = in_all_inventory_id AND user_id = in_user_id;
END IF;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_all_table_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_all_table_mast_fill`(
        IN in_cat_id INT,
        IN in_sub_cat_id INT
)
BEGIN

 call sp_dd_bike_brand_mast_fill();
 call sp_dd_car_brand_mast_fill();
 
-- SELECT j_type_id as id,j_type_name as value  FROM bsapp_db.job_type_mast union
-- SELECT s_p_id as id,s_p_name as value  FROM bsapp_db.salary_period_mast union
-- select p_type_id as id,p_type_name as value  from bsapp_db.position_type_mast union
-- select id as id,value as value from bsapp_db.year_mast;


    
	  --  SELECT JB.j_type_id,JB.j_type_name 
      -- PT.p_type_id,PT.p_type_name,  YM.id, YM.value
        -- VT.v_type_id,VT.v_type_name,  CB.id,CB.name,  BB.id,BB.name,  OT.id,OT.value,  OC.id,OC.value,
        -- OFU.id,OFU.value,  OW.id,OW.value,  OCP.id,OCP.value,  OL.id,OL.value,  OEC.id,OCP.value,
        -- PRT.p_type_id,PRT.p_type_name,  PRL.p_listed_by_id,PRL.p_listed_by_name,
        -- PRF.p_furnishing_id,PRF.p_furnishing_name,  PRC.p_car_parking_id,PRC.p_car_parking_name,
        -- PPR.p_preferred_renters_id,PPR.p_preferred_renters_name,  PRB.id,PRB.value,
        -- PRBH.id,PRBH.value,  CRB.car_brand_id,CRB.car_brand_name,  CFT.car_fuel_id,CFT.car_fuel_name,
        -- CRT.id,CRT.value,  CRO.id,CRO.name
        
		 -- from bsapp_db.job_type_mast JB
		-- select SP.s_p_id,SP.s_p_name from bsapp_db.salary_period_mast SP; 
        -- , bsapp_db.position_type_mast PT
        -- , bsapp_db.year_mast YM
        -- , bsapp_db.vehicle_type_mast VT
        -- , bsapp_db.commercial_brand_mast CB
        -- , bsapp_db.bike_brand_mast BB
        -- , bsapp_db.office_type_mast OT
        -- , bsapp_db.office_cabin_mast OC
        -- , bsapp_db.office_furnishing_mast OFU
        -- , bsapp_db.office_washroom_mast OW 
        -- , bsapp_db.office_car_parking_mast OCP
        -- , bsapp_db.office_listed_by_mast OL
        -- , bsapp_db.office_employee_capacity_mast OEC
        -- , bsapp_db.property_type_mast PRT
        -- , bsapp_db.property_listed_by_mast PRL
        -- , bsapp_db.property_furnishing_mast PRF
        -- , bsapp_db.property_car_parking_mast PRC
		-- , bsapp_db.property_preferred_renters_mast PPR
        -- , bsapp_db.property_bedroom_mast PRB
        -- , bsapp_db.property_bathroom_mast PRBH
		-- , bsapp_db.car_brand_mast CRB
        -- , bsapp_db.car_fuel_type_mast CFT
        -- , bsapp_db.car_type_mast CRT
        -- , bsapp_db.car_owner_mast CRO
        -- where JB.j_type_id = in_cat_id and  SP.s_p_id = in_sub_cat_id;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_autocomplete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_autocomplete`(
	IN in_searchtxt VARCHAR(126),
	IN in_limit INT,
    IN in_page_no INT
)
BEGIN
DECLARE  in_offset INT;
SET in_offset = (in_page_no -1) * in_limit;
select *,COUNT(*) OVER() AS "total_count" FROM(
	(SELECT 
		CS.car_sell_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        CS.c_picture_link_1 as Image,
        CS.car_title as Name,
        FORMAT(CS.c_price, 0) as Price,
        0 as from_salary,
		0 as to_salary,
        CS.c_location as location,
		CS.latitude,
		CS.longitude,
        DATE_FORMAT(CS.created_at,'%d %b %y') as Create_Date,
        CS.modified_at as Modify_Date,
        "" as  office_furnished,
		SM.state_name as car_registration_state,
        CS.c_km as car_km,
        CS.c_owner as owner,
        0 as Bedroom,
		0 as Bathroom,
        0 as Cabin,
        0 as Washroom,
		0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
		YM.value as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.car_sell_inventory_mast AS CS
        LEFT JOIN bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
		LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
        LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
        LEFT JOIN bsapp_db.ads_mast  AD ON CS.car_sell_inventory_code = AD.inventory_code
    WHERE AD.ad_status_id = 1 ) 
    UNION 
    (SELECT 
		AI.all_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        AI.picture_link_1 as Image,
        AI.title as Name,
        FORMAT(AI.price, 0) as Price,
        0 as from_salary,
		0 as to_salary,
        AI.location as location,
		AI.latitude,
		AI.longitude,
		DATE_FORMAT(AI.created_at,'%d %b %y')as Create_Date,
        AI.modified_at as Modify_Date,
        "" as  office_furnished,
		'' as car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.all_inventory_mast AS AI
        LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON AI.all_inventory_code = AD.inventory_code
        WHERE AD.ad_status_id = 1) 
    UNION 
    (SELECT 
		CR.car_rent_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        CR.c_picture_link_1 as Image,
        CR.car_title as Name,
        FORMAT(CR.c_price, 0) as Price,
        0 as from_salary,
		0 as to_salary,
        CR.c_location as location,
		CR.latitude,
		CR.longitude,
        DATE_FORMAT(CR.created_at,'%d %b %y') as Create_Date,
        CR.modified_at as Modify_Date,
        "" as  office_furnished,
        '' as car_registration_state,
        c_km_limit as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.car_rent_inventory_mast CR
        LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON CR.car_rent_inventory_code = AD.inventory_code
	WHERE AD.ad_status_id = 1) UNION (SELECT 
		JI.job_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
	    JI.j_picture_link_1 as Image,
        JI.j_title as Name,
        0 as price,
        JI.from_salary as From_salary,
        JI.to_salary as To_salary,
        JI.j_location as location,
		JI.latitude,
		JI.longitude,
        DATE_FORMAT(JI.created_at,'%d %b %y') as Create_Date,
        JI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' as car_registration_state,
        0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
		0 as year_of_registration,
		0 as vehicle_km,
		JT.j_type_name as Job_type,
		SP.s_p_name as Job_salary_period
      
	FROM
		bsapp_db.job_inventory_mast JI
        LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
        LEFT JOIN bsapp_db.ads_mast  AD ON JI.job_inventory_code = AD.inventory_code
	WHERE AD.ad_status_id = 1) 
    UNION 
    (SELECT 
		MI.mo_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		MI.mo_picture_link_1 as Image,
        MI.mo_title as Name,
        FORMAT(MI.mo_price, 0) as Price,
		0 as from_salary,
		0 as to_salary,
        MI.location as location,
        MI.latitude,
		MI.longitude,
        DATE_FORMAT(MI.created_at,'%d %b %y') as Create_Date,
        MI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' as car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		MI.mo_ram as Mobile_ram,
        MI.mo_rom as Mobile_rom,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.mobile_inventory_mast MI
        LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON MI.mo_inventory_code = AD.inventory_code
	WHERE AD.ad_status_id = 1) UNION (SELECT 
		OI.office_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		OI.o_picture_link_1 as Image,
        OI.o_title as Name,
        FORMAT(OI.o_price, 0) as Price,
		0 as from_salary,
		0 as to_salary,
        OI.o_location as location,
        OI.latitude,
		OI.longitude,
        DATE_FORMAT(OI.created_at,'%d %b %y') as Create_Date,
        OI.modified_at as Modify_Date,
        PF.p_furnishing_name as  office_furnished,
        '' as car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
        OI.cabin as Cabin,
        OI.washroom as Washroom,
		OI.o_sq_ft as Square_Feet, 
		'' as Mobile_ram,
		'' as Mobile_rom,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
        
	FROM
		bsapp_db.office_inventory_mast OI
        LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  OI.p_furnishing_id =PF.p_furnishing_id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON OI.office_inventory_code = AD.inventory_code) 
    UNION 
    (SELECT 
		PI.property_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        PI.p_picture_link_1 as Image,
        PI.p_title as Name,
        FORMAT(PI.p_price, 0) as Price,
        0 as from_salary,
		0 as to_salary,
        PI.p_location as location,
		PI.latitude,
		PI.longitude,
        DATE_FORMAT(PI.created_at,'%d %b %y') as Create_Date,
        PI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' as car_registration_state,
		0 as car_km,
		'' as owner,
        PI.p_bedroom as Bedroom,
        PI.p_bathroom as Bathroom,
		0 as Cabin,
        0 as Washroom,
        PI.p_sq_ft as Square_Feet, 
		'' as Mobile_ram,
		'' as Mobile_rom,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.property_inventory_mast PI
        LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON PI.property_inventory_code = AD.inventory_code
	WHERE AD.ad_status_id = 1) 
    UNION 
    (SELECT 
		VI.vehicle_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		VI.v_picture_link_1 as Image,
        VI.v_title as Name,
        FORMAT(VI.v_price, 0) as Price,
		0 as from_salary,
		0 as to_salary,
        VI.v_location as location,
        VI.latitude,
		VI.longitude,
		DATE_FORMAT(VI.created_at,'%d %b %y') as Create_Date,
        VI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' as car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
		VI.year as year_of_registration,
		VI.kms as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.vehicle_inventory_mast VI
        LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON VI.vehicle_inventory_code = AD.inventory_code
	WHERE AD.ad_status_id = 1))AS SUBQ WHERE 
    (Name LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Job_type LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Category LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Sub_category LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR location LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Mobile_ram LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Mobile_rom LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR office_furnished LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%'))
            ORDER BY Create_Date DESC limit in_limit offset in_offset ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_autocomplete_title` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_autocomplete_title`(
	IN in_searchtxt VARCHAR(126),
	IN in_limit INT,
    IN in_page_no INT
)
BEGIN
	DECLARE in_offset INT;
	SET in_offset = (in_page_no -1) * in_limit;
    
	SELECT Name
    FROM
    ((SELECT 
        CS.car_title AS Name,
            CB.car_brand_name AS Brand,
            '' AS Type,
            CS.inventory_type AS Itype,
            CS.c_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            CS.c_location AS Location,
            CM.name AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            CS.c_colour AS Colour,
            CF.car_fuel_name AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(CS.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.car_sell_inventory_mast AS CS
    LEFT JOIN bsapp_db.car_brand_mast CB ON CS.car_brand_id = CB.car_brand_id
    LEFT JOIN bsapp_db.category_mast C ON CS.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON CS.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.car_model_name_mast CM ON CS.car_model_name = CM.name
    LEFT JOIN bsapp_db.car_fuel_type_mast CF ON CS.car_fuel_id = CF.car_fuel_id
    LEFT JOIN bsapp_db.ads_mast AD ON CS.car_sell_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        AI.title AS Name,
            '' AS Brand,
            '' AS Type,
            AI.inventory_type AS Itype,
            AI.description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            AI.location AS Location,
            '' AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(AI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.all_inventory_mast AS AI
    LEFT JOIN bsapp_db.category_mast C ON AI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON AI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.ads_mast AD ON AI.all_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        CR.car_title AS Name,
            '' AS Brand,
            CT.value AS Type,
            CR.inventory_type AS Itype,
            CR.c_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            CR.c_location AS Location,
            '' AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(CR.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.car_rent_inventory_mast CR
    LEFT JOIN bsapp_db.car_type_mast CT ON CR.c_car_type = CT.id
    LEFT JOIN bsapp_db.category_mast C ON CR.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON CR.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.ads_mast AD ON CR.car_rent_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        JI.j_title AS Name,
            '' AS Brand,
            JT.j_type_name AS Type,
            JI.inventory_type AS Itype,
            JI.j_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            JI.j_location AS Location,
            '' AS Model,
            JI.j_designation AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(JI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.job_inventory_mast JI
    LEFT JOIN bsapp_db.job_type_mast JT ON JI.j_type_id = JT.j_type_id
    LEFT JOIN bsapp_db.category_mast C ON JI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON JI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.ads_mast AD ON JI.job_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        MI.mo_title AS Name,
            MB.brand_name AS Brand,
            '' AS Type,
            MI.inventory_type AS Itype,
            MI.description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            MI.location AS Location,
            MI.model_name AS Model,
            '' AS Designation,
            RA.value AS RAM,
            RO.value AS ROM,
            MI.mo_colour AS Colour,
            '' AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(MI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.mobile_inventory_mast MI
    LEFT JOIN bsapp_db.mobile_brand_mast MB ON MI.brand_id = MB.brand_id
    LEFT JOIN bsapp_db.category_mast C ON MI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON MI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.mobile_ram_mast RA ON MI.mo_ram = RA.id
    LEFT JOIN bsapp_db.mobile_rom_mast RO ON MI.mo_rom = RO.id
    LEFT JOIN bsapp_db.ads_mast AD ON MI.mo_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        OI.o_title AS Name,
            '' AS Brand,
            PT.p_type_name AS Type,
            OI.inventory_type AS Itype,
            OI.o_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            OI.o_location AS Location,
            '' AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            PF.p_furnishing_name AS Furnished,
            '' AS Status,
            DATE_FORMAT(OI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.office_inventory_mast OI
    LEFT JOIN bsapp_db.property_type_mast PT ON OI.p_type_id = PT.p_type_id
    LEFT JOIN bsapp_db.category_mast C ON OI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON OI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.property_furnishing_mast PF ON OI.p_furnishing_id = PF.p_furnishing_id
    LEFT JOIN bsapp_db.ads_mast AD ON OI.office_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        PI.p_title AS Name,
            '' AS Brand,
            PT.p_type_name AS Type,
            PI.inventory_type AS Itype,
            PI.p_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            PI.p_location AS Location,
            '' AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            PF.p_furnishing_name AS Furnished,
            PS.p_status_title AS Status,
            DATE_FORMAT(PI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.property_inventory_mast PI
    LEFT JOIN bsapp_db.property_type_mast PT ON PI.p_type_id = PT.p_type_id
    LEFT JOIN bsapp_db.category_mast C ON PI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON PI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.property_furnishing_mast PF ON PI.p_furnishing_id = PF.p_furnishing_id
    LEFT JOIN bsapp_db.property_status_mast PS ON PI.p_status_id = PS.p_status_id
    LEFT JOIN bsapp_db.ads_mast AD ON PI.property_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1) UNION (SELECT 
        VI.v_title AS Name,
            BB.name AS Brand,
            VT.v_type_name AS Type,
            VI.inventory_type AS Itype,
            VI.v_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            VI.v_location AS Location,
            '' AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(VI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.vehicle_inventory_mast VI
    LEFT JOIN bsapp_db.bike_brand_mast BB ON VI.brand = BB.id
    LEFT JOIN bsapp_db.vehicle_type_mast VT ON VI.v_type_id = VT.v_type_id
    LEFT JOIN bsapp_db.category_mast C ON VI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON VI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.ads_mast AD ON VI.vehicle_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1
            AND VI.inventory_type = 'bike') UNION (SELECT 
        VI.v_title AS Name,
            VI.brand AS Brand,
            VT.v_type_name AS Type,
            VI.inventory_type AS Itype,
            VI.v_description AS Description,
            C.cat_name AS Category,
            SC.sub_cat_name AS Subcategory,
            VI.v_location AS Location,
            '' AS Model,
            '' AS Designation,
            '' AS RAM,
            '' AS ROM,
            '' AS Colour,
            '' AS Fuel,
            '' AS Furnished,
            '' AS Status,
            DATE_FORMAT(VI.created_at, '%d %b %y') AS Create_Date
    FROM
        bsapp_db.vehicle_inventory_mast VI
    LEFT JOIN bsapp_db.vehicle_type_mast VT ON VI.v_type_id = VT.v_type_id
    LEFT JOIN bsapp_db.category_mast C ON VI.cat_id = C.id
    LEFT JOIN bsapp_db.sub_category_mast SC ON VI.sub_cat_id = SC.id
    LEFT JOIN bsapp_db.ads_mast AD ON VI.vehicle_inventory_code = AD.inventory_code
    WHERE
        AD.ad_status_id = 1
            AND VI.inventory_type <> 'bike')) AS SUBQ
WHERE
    (Name LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Brand LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Type LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Itype LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Description LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Category LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Subcategory LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Location LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Model LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Designation LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR RAM LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR ROM LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Colour LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Fuel LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%')
        OR Furnished LIKE CONCAT('%',
            REPLACE(in_searchtxt, ' ', '%'),
            '%'))
ORDER BY Create_Date DESC
LIMIT IN_LIMIT OFFSET IN_OFFSET;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_banner_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_banner_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.banner_mast WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_banner_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_banner_mast_fill`(
	IN in_from_date DATE,
    IN in_to_date DATE
)
BEGIN
	SELECT * FROM bsapp_db.banner_mast WHERE from_date = in_from_date AND to_date = in_to_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_banner_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_banner_mast_save`(
	IN in_id INT,
    IN in_url VARCHAR(255),
    IN in_from_date DATE,
    IN in_to_date DATE,
    IN in_is_active BOOL
)
BEGIN
	IF NOT EXISTS (SELECT id FROM bsapp_db.banner_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.banner_mast (url, from_date, to_date, is_active, created_at)
        VALUES (in_url, in_from_date, in_to_date, in_is_active, now());
	ELSE
		UPDATE bsapp_db.banner_mast
        SET
        url = in_url,
        from_date = in_from_date,
        to_date = in_to_date,
        is_active = in_is_active,
        modified_at = now()
        WHERE id = in_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_bike_brand_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_bike_brand_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.bike_brand_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_bike_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_bike_brand_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.bike_brand_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_bike_brand_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_bike_brand_mast_save`(
	IN in_id INT,
	IN in_name VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.bike_brand_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.bike_brand_mast (name,created_at) VALUES (in_name,now());
	ELSE
		UPDATE bsapp_db.bike_brand_mast 
        SET 
        name = in_name ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_bike_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_bike_inventory_mast_delete`(
	IN in_vehicle_inventory_id INT,
	IN in_user_id VARCHAR(125)
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.vehicle_inventory_mast VI  ON  AD.inventory_code= VI.vehicle_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_vehicle_inventory_id );
		DELETE FROM bsapp_db.vehicle_inventory_mast WHERE vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id  ;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_bike_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_bike_inventory_mast_fill`(
	IN in_vehicle_inventory_code VARCHAR(126),
	IN in_cat_id INT
)
BEGIN
IF EXISTS(SELECT cat_id FROM bsapp_db.vehicle_inventory_mast WHERE cat_id = 9) THEN
	SELECT VI.vehicle_inventory_id, IFNULL(VI.user_id, "-") AS user_id, IFNULL(AD.ads_id, "-") AS ads_id, 
		IFNULL(VI.vehicle_inventory_code, "-") AS vehicle_inventory_code, IFNULL(VI.inventory_type, "-") AS inventory_type,
        IFNULL(VI.v_title, "-") AS v_title, IFNULL(FORMAT(VI.v_price, 0), "-") AS v_price, 
        VI.v_picture_link_1, VI.v_picture_link_2, VI.v_picture_link_3, VI.v_picture_link_4, 
        VI.v_picture_link_5, VI.v_picture_link_6, VI.v_picture_link_7, VI.v_picture_link_8, 
        VI.v_picture_link_9, VI.v_picture_link_10, 
        IFNULL(BM.name, "-") as brand, IFNULL(VI.kms, "-") AS kms, IFNULL(YM.value, "-") as year, 
        IFNULL(VI.insuarance, "-") AS insuarance, IFNULL(VI.i_description, "-") AS i_description, 
        IFNULL(VI.v_show_mo_no, "-") AS v_show_mo_no, IFNULL(VI.v_description, "-") AS v_description, 
        IFNULL(VI.v_location, "-") AS v_location, IFNULL(VI.latitude, "-") AS latitude, 
        IFNULL(VI.longitude, "-") AS longitude, IFNULL(DATE_FORMAT(VI.created_at,'%d %b %y'), "-") as ad_created, 
        IFNULL(VI.modified_at, "-") AS modified_at, IFNULL(CAT.cat_name, "-") AS cat_name, 
        IFNULL(SUB.sub_cat_name, "-") AS sub_cat_name, IFNULL(UM.profile_picture_link, "-") as profile_picture,
        IFNULL(UM.name, "-") as user_name , IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created
    FROM bsapp_db.vehicle_inventory_mast VI
	LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
	LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
    LEFT JOIN bsapp_db.bike_brand_mast BM ON VI.brand = BM.id 
    LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
    LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = VI.vehicle_inventory_code 
	LEFT JOIN bsapp_db.user_mast UM ON UM.user_id = VI.user_id
    WHERE VI.vehicle_inventory_code = in_vehicle_inventory_code AND VI.cat_id = in_cat_id  ;
    
ELSE
	SELECT  VI.vehicle_inventory_id, IFNULL(VI.user_id, "-") as user_id,
    IFNULL(VI.vehicle_inventory_code, "-") as vehicle_inventory_code, IFNULL(VI.inventory_type, "-") as inventory_type,
    IFNULL(VI.v_title, "-") as v_title, IFNULL(FORMAT(VI.v_price, 0), "-") as v_price,
    VI.v_picture_link_1, VI.v_picture_link_2, VI.v_picture_link_3, VI.v_picture_link_4, VI.v_picture_link_5,
    VI.v_picture_link_6, VI.v_picture_link_7, VI.v_picture_link_8, VI.v_picture_link_9, VI.v_picture_link_10,
    IFNULL(VT.v_type_name, "-") as v_type_name, IFNULL(CBM.name, "-") as brand,
    IFNULL(VI.kms, "-") as kms, IFNULL(VI.month, "-") as month,
    IFNULL(YM.value, "-") as year, IFNULL(VI.insuarance, "-") as insuarance,
    IFNULL(VI.i_description, "-") as i_description, IFNULL(VI.v_show_mo_no, "-") as v_show_mo_no,
    IFNULL(VI.v_description, "-") as v_description, IFNULL(VI.v_location, "-") as v_location,
    IFNULL(DATE_FORMAT(VI.created_at,'%d %b %y'), "-") as ad_created,
    IFNULL(VI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture,
    IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
    IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name,
    IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
    FROM bsapp_db.vehicle_inventory_mast VI
    LEFT JOIN bsapp_db.vehicle_type_mast VT ON VI.v_type_id = VT.v_type_id
    LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
    LEFT JOIN bsapp_db.commercial_brand_mast CBM ON VI.brand = CBM.id 
    LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
	LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
    LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = VI.vehicle_inventory_code 
	LEFT JOIN bsapp_db.user_mast UM ON UM.user_id = VI.user_id
    WHERE VI.vehicle_inventory_code = in_vehicle_inventory_code AND VI.cat_id = in_cat_id  ;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_bike_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_bike_inventory_mast_save`(
	IN in_vehicle_inventory_id INT,
    IN in_user_id VARCHAR(125),
    IN in_v_title VARCHAR(126),
	IN in_v_price INT,
	IN in_v_picture_link_1 VARCHAR(512),
    IN in_v_picture_link_2 VARCHAR(512),
    IN in_v_picture_link_3 VARCHAR(512),
    IN in_v_picture_link_4 VARCHAR(512),
    IN in_v_picture_link_5 VARCHAR(512),
    IN in_v_picture_link_6 VARCHAR(512),
    IN in_v_picture_link_7 VARCHAR(512),
    IN in_v_picture_link_8 VARCHAR(512),
    IN in_v_picture_link_9 VARCHAR(512),
    IN in_v_picture_link_10 VARCHAR(512),
    IN in_brand INT,
    IN in_kms INT,
    IN in_year INT,
    IN in_insuarance BOOLEAN,
    IN in_i_description VARCHAR(512),
    IN in_v_show_mo_no  BOOLEAN,
	IN in_v_description VARCHAR(512),
	IN in_v_location VARCHAR(512),
    IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
	IN in_cat_id INT,
    IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;

select COALESCE(MAX(vehicle_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.vehicle_inventory_mast;

IF NOT EXISTS(select vehicle_inventory_id from bsapp_db.vehicle_inventory_mast where vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id) THEN
	INSERT INTO bsapp_db.vehicle_inventory_mast
    		(vehicle_inventory_id,user_id,vehicle_inventory_code,inventory_type,v_title,v_price,v_picture_link_1,v_picture_link_2,v_picture_link_3,v_picture_link_4,v_picture_link_5,v_picture_link_6,v_picture_link_7,v_picture_link_8,v_picture_link_9,v_picture_link_10,brand,kms,year,insuarance,i_description,v_show_mo_no,v_description,v_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
			(get_max_inventory_id,in_user_id,concat("bike_",get_max_inventory_id),"bike",in_v_title,in_v_price,in_v_picture_link_1,in_v_picture_link_2,in_v_picture_link_3,in_v_picture_link_4,in_v_picture_link_5,in_v_picture_link_6,in_v_picture_link_7,in_v_picture_link_8,in_v_picture_link_9,in_v_picture_link_10,in_brand,in_kms,in_year,in_insuarance,CASE WHEN insuarance=TRUE THEN  in_i_description ELSE null END,in_v_show_mo_no,in_v_description,in_v_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
	call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("bike_",get_max_inventory_id),"bike",1);
    select * from bsapp_db.vehicle_inventory_mast where vehicle_inventory_id = get_max_inventory_id  AND user_id = in_user_id;
ELSE
	UPDATE bsapp_db.vehicle_inventory_mast
	SET
	v_title = in_v_title,
    v_price = in_v_price,
    v_picture_link_1 = in_v_picture_link_1,
    v_picture_link_2 = in_v_picture_link_2,
    v_picture_link_3 = in_v_picture_link_3,
    v_picture_link_4 = in_v_picture_link_4,
    v_picture_link_5 = in_v_picture_link_5,
    v_picture_link_6 = in_v_picture_link_6,
    v_picture_link_7 = in_v_picture_link_7,
    v_picture_link_8 = in_v_picture_link_8,
    v_picture_link_9 = in_v_picture_link_9,
    v_picture_link_10 = in_v_picture_link_10,
    brand = in_brand,
    kms = in_kms,
    year = in_year,
    insuarance = in_insuarance,
    i_description = CASE WHEN insuarance=TRUE THEN  in_i_description ELSE null END,
	v_show_mo_no = in_v_show_mo_no,
    v_description = in_v_description,
	v_location = in_v_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
    cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id;
select * from bsapp_db.vehicle_inventory_mast where vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_brand_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_brand_mast_delete`(
    in in_car_brand_id int
)
BEGIN
     DELETE FROM bsapp_db.car_brand_mast where car_brand_id = in_car_brand_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_brand_mast_fill`()
BEGIN
    SELECT * FROM bsapp_db.car_brand_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_brand_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_brand_mast_save`(
    in in_car_brand_id int,
    in in_car_brand_name varchar(126)
)
BEGIN
IF NOT EXISTS(select car_brand_id from bsapp_db.car_brand_mast where car_brand_id = in_car_brand_id) THEN
 	INSERT INTO bsapp_db.car_brand_mast
		(car_brand_name,created_at)
	VALUES
		(in_car_brand_name,now());
ELSE
   UPDATE bsapp_db.car_brand_mast
	SET
	car_brand_name = in_car_brand_name,
    modified_at = now()
	WHERE car_brand_id = in_car_brand_id;
	
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_fuel_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_fuel_type_mast_delete`(
 IN in_car_fuel_id int
)
BEGIN
	DELETE FROM bsapp_db.car_fuel_type_mast WHERE car_fuel_id = in_car_fuel_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_fuel_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_fuel_type_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.car_fuel_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_fuel_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_fuel_type_mast_save`(
	IN in_car_fuel_id INT,
    IN in_car_fuel_name VARCHAR(126)
)
BEGIN
 IF NOT EXISTS(select car_fuel_id from bsapp_db.car_fuel_type_mast where car_fuel_id = in_car_fuel_id) THEN
 	INSERT INTO bsapp_db.car_fuel_type_mast
		(car_fuel_name,created_at)
	VALUES
		(in_car_fuel_name,now());
ELSE
   UPDATE bsapp_db.car_fuel_type_mast
	SET
	car_fuel_name = in_car_fuel_name,
    modified_at = now()
	WHERE car_fuel_id = in_car_fuel_id;
  END IF;  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_model_name_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_model_name_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.car_model_name_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_model_name_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_model_name_mast_fill`(
	IN in_brand_id INT
)
BEGIN
	SELECT * FROM bsapp_db.car_model_name_mast WHERE brand_id = in_brand_id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_model_name_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_model_name_mast_save`(
	IN in_id INT,
	IN in_name VARCHAR(255),
    IN in_brand_id INT
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.car_model_name_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.car_model_name_mast (name, brand_id,created_at) VALUES (in_name, in_brand_id,now());
	ELSE
		UPDATE bsapp_db.car_model_name_mast
        SET 
        name = in_name, 
        brand_id = in_brand_id ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_owner_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_owner_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.car_owner_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_owner_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_owner_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.car_owner_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_owner_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_owner_mast_save`(
	IN in_id INT,
	IN in_name VARCHAR(255)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.car_owner_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.car_owner_mast (name,created_at) VALUES (in_name,now());
	ELSE
		UPDATE bsapp_db.car_owner_mast 
        SET 
        name = in_name ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_registration_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_registration_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.car_registration_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_registration_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_registration_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.car_registration_mast ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_registration_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_registration_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.car_registration_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.car_registration_mast (value,  created_at) 
        VALUES (in_value,  now());
	ELSE
		UPDATE bsapp_db.car_registration_mast
        SET
        value = in_value,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_rent_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_rent_inventory_mast_delete`(
   IN in_car_rent_inventory_id INT,
   IN in_user_id VARCHAR(125)
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.car_rent_inventory_mast CRI  ON  AD.inventory_code= CRI.car_rent_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_car_rent_inventory_id );
       DELETE FROM bsapp_db.car_rent_inventory_mast where car_rent_inventory_id = in_car_rent_inventory_id AND user_id = in_user_id ;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_rent_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_rent_inventory_mast_fill`(
	IN in_car_rent_inventory_code VARCHAR(126),
    IN in_cat_id INT
)
BEGIN
    	SELECT car_rent_inventory_id, 
			IFNULL(CR.user_id, "-") AS user_id, 
			IFNULL(AD.ads_id, "-") AS ads_id,
			IFNULL(CR.car_rent_inventory_code, "-") AS car_rent_inventory_code, 
			IFNULL(CR.car_title, "-") AS car_title,
			IFNULL(FORMAT(CR.c_price, 0), "-") AS c_price, CR.c_picture_link_1, 
			CR.c_picture_link_2, CR.c_picture_link_3, CR.c_picture_link_4, CR.c_picture_link_5, 
			CR.c_picture_link_6, CR.c_picture_link_7, CR.c_picture_link_8, CR.c_picture_link_9, 
			CR.c_picture_link_10, IFNULL(CR.c_km_limit, "-") AS c_km_limit,
			IFNULL(CT.value, "-") as c_car_type, 
			IFNULL(CR.c_extra_charge, "-") AS c_extra_charge,
			IFNULL(CR.c_per_day_charge, "-") AS c_per_day_charge, 
			IFNULL(CFT.car_fuel_name, "-") AS car_fuel_name,
			IFNULL(CR.c_with_fuel, "-") AS c_with_fuel, 
			IFNULL(CR.c_driver, "-") AS c_driver, 
			IFNULL(CR.c_transmission, "-") AS c_transmission,
			IFNULL(CR.c_show_mo_no, "-") AS c_show_mo_no,
			IFNULL(CR.c_description, "-") AS c_description, 
			IFNULL(CR.c_location, "-") AS c_location,
			IFNULL(CR.latitude, "-") AS latitude, 
			IFNULL(CR.longitude, "-") AS longitude,
			IFNULL(DATE_FORMAT(CR.created_at,'%d %b %y'), "-") AS ad_created,
			IFNULL(CAT.cat_name, "-") AS cat_name, 
			IFNULL(SUB.sub_cat_name, "-") AS sub_cat_name,
			IFNULL(UM.profile_picture_link, "-") as profile_picture, 
			IFNULL(UM.name, "-") as user_name,
			IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
			IFNULL(CR.cat_id, "-") as cat_id, 
			IFNULL(CR.sub_cat_id, "-") as sub_cat_id 
        FROM bsapp_db.car_rent_inventory_mast as CR
        LEFT JOIN bsapp_db.car_fuel_type_mast CFT ON CR.car_fuel_id = CFT.car_fuel_id
        LEFT JOIN bsapp_db.car_type_mast CT ON CT.id = CR.c_car_type
		LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = CR.car_rent_inventory_id 
        LEFT JOIN bsapp_db.user_mast UM ON UM.user_id = CR.user_id
        WHERE CR.car_rent_inventory_code = in_car_rent_inventory_code AND CR.cat_id = in_cat_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_rent_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_rent_inventory_mast_save`(
        IN in_car_rent_inventory_id INT,
        IN in_user_id VARCHAR(125),
		IN in_car_title VARCHAR(126),
		IN in_c_price INT,
		IN in_c_picture_link_1 VARCHAR(512),
		IN in_c_picture_link_2 VARCHAR(512),
		IN in_c_picture_link_3 VARCHAR(512),
		IN in_c_picture_link_4 VARCHAR(512),
		IN in_c_picture_link_5 VARCHAR(512),
		IN in_c_picture_link_6 VARCHAR(512),
		IN in_c_picture_link_7 VARCHAR(512),
		IN in_c_picture_link_8 VARCHAR(512),
		IN in_c_picture_link_9 VARCHAR(512),
		IN in_c_picture_link_10 VARCHAR(512),
		IN in_c_km_limit INT,
		IN in_c_car_type INT,
		IN in_c_extra_charge INT,
		IN in_c_per_day_charge INT,
        IN in_car_fuel_id INT,
		IN in_c_with_fuel BOOLEAN,
		IN in_c_driver BOOLEAN,
		IN in_c_transmission BOOLEAN,
		IN in_c_show_mo_no BOOLEAN,
        IN in_c_description VARCHAR(512),
		IN in_c_location VARCHAR(512),
        IN in_latitude DECIMAL(11,8),
		IN in_longitude DECIMAL(11,8),
		IN in_cat_id INT,
		IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;
select COALESCE(MAX(car_rent_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.car_rent_inventory_mast;

IF NOT EXISTS(select car_rent_inventory_id from bsapp_db.car_rent_inventory_mast where car_rent_inventory_id = in_car_rent_inventory_id AND user_id = in_user_id) THEN
 	INSERT INTO bsapp_db.car_rent_inventory_mast
		(car_rent_inventory_id,user_id,car_rent_inventory_code,car_title,c_price,c_picture_link_1,c_picture_link_2,c_picture_link_3,c_picture_link_4,c_picture_link_5,c_picture_link_6,c_picture_link_7,c_picture_link_8,c_picture_link_9,c_picture_link_10,c_km_limit,c_car_type,c_extra_charge,c_per_day_charge,car_fuel_id,c_with_fuel,c_driver,c_transmission,c_show_mo_no,c_description,c_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
		(get_max_inventory_id,in_user_id,concat("car_rent_",get_max_inventory_id),in_car_title,in_c_price,in_c_picture_link_1,in_c_picture_link_2,in_c_picture_link_3,in_c_picture_link_4,in_c_picture_link_5,in_c_picture_link_6,in_c_picture_link_7,in_c_picture_link_8,in_c_picture_link_9,in_c_picture_link_10,in_c_km_limit,in_c_car_type,in_c_extra_charge,in_c_per_day_charge,in_car_fuel_id,in_c_with_fuel,in_c_driver,in_c_transmission,in_c_show_mo_no,in_c_description,in_c_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("car_rent_",get_max_inventory_id),"car",1);
select * from  bsapp_db.car_rent_inventory_mast where car_rent_inventory_id = get_max_inventory_id AND user_id = in_user_id;

ELSE
   UPDATE bsapp_db.car_rent_inventory_mast
	SET
	car_title = in_car_title,
    c_price = in_c_price,
    c_picture_link_1 = in_c_picture_link_1,
    c_picture_link_2 = in_c_picture_link_2,
    c_picture_link_3 = in_c_picture_link_3,
    c_picture_link_4 = in_c_picture_link_4,
    c_picture_link_5 = in_c_picture_link_5,
    c_picture_link_6 = in_c_picture_link_6,
    c_picture_link_7 = in_c_picture_link_7,
    c_picture_link_8 = in_c_picture_link_8,
    c_picture_link_9 = in_c_picture_link_9,
    c_picture_link_10 = in_c_picture_link_10,
    c_km_limit = in_c_km_limit,
    c_car_type = in_c_car_type,
    c_extra_charge = in_c_extra_charge,    
    c_per_day_charge = in_c_per_day_charge,
    car_fuel_id = in_car_fuel_id,
    c_with_fuel = in_c_with_fuel,
    c_driver = in_c_driver,
    c_transmission = in_c_transmission,
    c_show_mo_no = in_c_show_mo_no,
    c_description = in_c_description,
    c_location = in_c_location,
	latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE car_rent_inventory_id = in_car_rent_inventory_id AND user_id = in_user_id;
select * from  bsapp_db.car_rent_inventory_mast where car_rent_inventory_id = in_car_rent_inventory_id AND user_id = in_user_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_sell_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_sell_inventory_mast_delete`(
	 IN in_car_sell_inventory_id INT,
     IN in_user_id VARCHAR(125)
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.car_sell_inventory_mast CSI  ON  AD.inventory_code= CSI.car_sell_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_car_sell_inventory_id );
	DELETE FROM bsapp_db.car_sell_inventory_mast WHERE car_sell_inventory_id=in_car_sell_inventory_id AND user_id = in_user_id;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_sell_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_sell_inventory_mast_fill`(
    IN in_car_sell_inventory_code VARCHAR(126),
    IN in_cat_id INT
)
BEGIN
    SELECT 
		CSI.car_sell_inventory_id, IFNULL(CSI.user_id, "-") as user_id, 
        IFNULL(AD.ads_id, "-") as ads_id, IFNULL(CSI.car_sell_inventory_code, "-") as car_sell_inventory_code, 
        IFNULL(CSI.inventory_type, "-") as inventory_type, IFNULL(CSI.car_title, "-") as car_title, 
        IFNULL(CBR.car_brand_name, "-") as car_brand_name, IFNULL(CM.name, "-") as car_model_name, 
        IFNULL(CO.name, "-") as c_owner, IFNULL(YM.value, "-") as year, 
        IFNULL(SM.state_name, "-") as c_registration_state, IFNULL(CSI.c_km, "-") as c_km, 
        IFNULL(FORMAT(CSI.c_price, 0), "-") as c_price, CSI.c_picture_link_1,
        CSI.c_picture_link_2, CSI.c_picture_link_3, CSI.c_picture_link_4, CSI.c_picture_link_5, 
        CSI.c_picture_link_6, CSI.c_picture_link_7, CSI.c_picture_link_8, CSI.c_picture_link_9, 
        CSI.c_picture_link_10, IFNULL(CSI.year_of_registration, "-") as year_of_registration, 
        IFNULL(CSI.c_colour, "-") as c_colour, IFNULL(CSI.engine_capacity, "-") as engine_capacity, 
        IFNULL(CSI.mileage, "-") as mileage, IFNULL(CFT.car_fuel_name, "-") as car_fuel_name,
        IFNULL(CSI.transmission, "-") as transmission, IFNULL(CSI.c_insurance, "-") as c_insurance, 
        IFNULL(CSI.i_description, "-") as i_description, IFNULL(CSI.c_show_mo_no, "-") as c_show_mo_no, 
        IFNULL(CSI.c_description, "-") as c_description, IFNULL(CSI.c_location, "-") as c_location, 
        IFNULL(DATE_FORMAT(CSI.created_at,'%d %b %y'), "-") as ad_created, IFNULL(CSI.modified_at, "-") as modified_at, 
        IFNULL(UM.profile_picture_link, "-") as profile_picture, IFNULL(UM.name, "-") as user_name,
        IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created, 
        IFNULL(CSI.cat_id, "-") as cat_id, IFNULL(CSI.sub_cat_id, "-") as sub_cat_id,
        IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name
	FROM bsapp_db.car_sell_inventory_mast CSI  
    LEFT JOIN bsapp_db.car_brand_mast CBR   ON  CSI.car_brand_id = CBR.car_brand_id 
    LEFT JOIN bsapp_db.car_fuel_type_mast CFT ON CSI.car_fuel_id = CFT.car_fuel_id
	LEFT JOIN bsapp_db.category_mast CAT ON CSI.cat_id = CAT.id
	LEFT JOIN bsapp_db.sub_category_mast SUB ON CSI.sub_cat_id = SUB.id
    LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = CSI.car_sell_inventory_code 
	LEFT JOIN bsapp_db.user_mast UM ON UM.user_id = CSI.user_id
    LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CSI.car_model_name
    LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CSI.c_owner
    LEFT JOIN bsapp_db.year_mast YM ON YM.id = CSI.year
    LEFT JOIN bsapp_db.state_mast SM ON SM.id = CSI.c_registration
    WHERE CSI.car_sell_inventory_code = in_car_sell_inventory_code AND CSI.cat_id = in_cat_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_sell_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_sell_inventory_mast_save`(
		IN in_car_sell_inventory_id INT,
        IN in_user_id VARCHAR(125),
		IN in_car_title VARCHAR(126),
		IN in_car_brand_id INT,
		IN in_car_model_name INT,
		IN in_c_owner  INT,
		IN in_year INT,
		IN in_c_registration INT,
		IN in_c_km INT,
		IN in_c_price INT,
		IN in_c_picture_link_1 VARCHAR(512),
		IN in_c_picture_link_2 VARCHAR(512),
		IN in_c_picture_link_3 VARCHAR(512),
		IN in_c_picture_link_4 VARCHAR(512),
		IN in_c_picture_link_5 VARCHAR(512),
		IN in_c_picture_link_6 VARCHAR(512),
		IN in_c_picture_link_7 VARCHAR(512),
		IN in_c_picture_link_8 VARCHAR(512),
		IN in_c_picture_link_9 VARCHAR(512),
		IN in_c_picture_link_10 VARCHAR(512),
		IN in_year_of_registration VARCHAR(126),
		IN in_c_colour VARCHAR(45),
		IN in_engine_capacity VARCHAR(126),
		IN in_mileage VARCHAR(126),
        IN in_car_fuel_id INT,
		IN in_transmission BOOLEAN,
		IN in_c_insurance BOOLEAN,
        IN in_i_description VARCHAR(512),
		IN in_c_show_mo_no BOOLEAN,
		IN in_c_description VARCHAR(512),
		IN in_c_location VARCHAR(512),
        IN in_latitude DECIMAL(11,8),
		IN in_longitude DECIMAL(11,8),
		IN in_cat_id INT,
		IN in_sub_cat_id INT
        
)
BEGIN
DECLARE get_max_inventory_id INT;
select COALESCE(MAX(car_sell_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.car_sell_inventory_mast;

IF NOT EXISTS(select car_sell_inventory_id from bsapp_db.car_sell_inventory_mast where car_sell_inventory_id = in_car_sell_inventory_id AND user_id = in_user_id) THEN
 	INSERT INTO bsapp_db.car_sell_inventory_mast
		(car_sell_inventory_id,user_id,car_sell_inventory_code,car_title,car_brand_id,car_model_name,c_owner,year,c_registration,c_km,c_price,c_picture_link_1,c_picture_link_2,c_picture_link_3,c_picture_link_4,c_picture_link_5,c_picture_link_6,c_picture_link_7,c_picture_link_8,c_picture_link_9,c_picture_link_10,year_of_registration,c_colour,engine_capacity,mileage,car_fuel_id,transmission,c_insurance,i_description,c_show_mo_no,c_description,c_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
		(get_max_inventory_id,in_user_id,concat("car_sell_",get_max_inventory_id),in_car_title,in_car_brand_id,in_car_model_name,in_c_owner,in_year,in_c_registration,in_c_km,in_c_price,in_c_picture_link_1,in_c_picture_link_2,in_c_picture_link_3,in_c_picture_link_4,in_c_picture_link_5,in_c_picture_link_6,in_c_picture_link_7,in_c_picture_link_8,in_c_picture_link_9,in_c_picture_link_10,in_year_of_registration,in_c_colour,in_engine_capacity,in_mileage,in_car_fuel_id,in_transmission,in_c_insurance,CASE WHEN c_insurance=TRUE THEN  in_i_description ELSE null END,in_c_show_mo_no,in_c_description,in_c_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("car_sell_",get_max_inventory_id),"car",1);
	select * from bsapp_db.car_sell_inventory_mast where car_sell_inventory_id = get_max_inventory_id AND user_id = in_user_id;
ELSE
   UPDATE bsapp_db.car_sell_inventory_mast
	SET
	car_title = in_car_title,
    car_brand_id = in_car_brand_id,
    car_model_name = in_car_model_name,
    c_owner = in_c_owner,
    year = in_year,
    c_registration = in_c_registration,
    c_km = in_c_km,
    c_price = in_c_price,
    c_picture_link_1 = in_c_picture_link_1,
    c_picture_link_2 = in_c_picture_link_2,
    c_picture_link_3 = in_c_picture_link_3,
    c_picture_link_4 = in_c_picture_link_4,
    c_picture_link_5 = in_c_picture_link_5,
    c_picture_link_6 = in_c_picture_link_6,
    c_picture_link_7 = in_c_picture_link_7,
    c_picture_link_8 = in_c_picture_link_8,
    c_picture_link_9 = in_c_picture_link_9,
    c_picture_link_10 = in_c_picture_link_10,
    year_of_registration = in_year_of_registration,
    c_colour = in_c_colour,
    engine_capacity = in_engine_capacity,    
    mileage = in_mileage,
    car_fuel_id = in_car_fuel_id,
    transmission = in_transmission,
    c_insurance = in_c_insurance,
    i_description = CASE WHEN c_insurance=TRUE THEN  in_i_description ELSE null END,
    c_show_mo_no = in_c_show_mo_no,
    c_description = in_c_description,
    c_location = in_c_location,
	latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE car_sell_inventory_id = in_car_sell_inventory_id AND user_id = in_user_id;
select * from bsapp_db.car_sell_inventory_mast where car_sell_inventory_id = in_car_sell_inventory_id AND user_id = in_user_id;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_type_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.car_type_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_type_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.car_type_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_car_type_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(50)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.car_type_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.car_type_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.car_type_mast
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_category_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_category_mast_delete`(
	IN  in_id int
)
BEGIN
	DELETE FROM bsapp_db.category_mast WHERE id = in_id ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_category_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_category_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.category_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_category_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_category_mast_save`(
	in in_id int,
    in in_cat_name varchar(126),
    IN in_cat_picture_link varchar(512)
)
BEGIN
IF NOT EXISTS(select id from bsapp_db.category_mast where id = in_id) THEN
 	INSERT INTO bsapp_db.category_mast
		(cat_name,cat_picture_link,created_at)
	VALUES
		(in_cat_name,in_cat_picture_link,now());
ELSE
   UPDATE bsapp_db.category_mast
	SET
	cat_name = in_cat_name,
     cat_picture_link = in_cat_picture_link,
     modified_at = now()
	WHERE id = in_id;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_commercial_brand_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_commercial_brand_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.commercial_brand_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_commercial_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_commercial_brand_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.commercial_brand_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_commercial_brand_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_commercial_brand_mast_save`(
	IN in_id INT,
	IN in_name VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.commercial_brand_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.commercial_brand_mast (name,created_at) VALUES (in_name,now());
	ELSE
		UPDATE bsapp_db.commercial_brand_mast
        SET 
        name = in_name ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_count_active_ads` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_count_active_ads`(
	IN in_user_id VARCHAR(125),
    IN in_ad_status_id INT
)
BEGIN
	SELECT COUNT(*) AS 'Active Ads' FROM bsapp_db.ads_mast 
    WHERE user_id = in_user_id AND ad_status_id = in_ad_status_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_bike_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_bike_brand_mast_fill`(

)
BEGIN
	SELECT id as id,name as value FROM bsapp_db.bike_brand_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_car_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_car_brand_mast_fill`(

)
BEGIN
	SELECT car_brand_id as id,car_brand_name as value FROM bsapp_db.car_brand_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_car_fuel_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_car_fuel_type_mast_fill`(

)
BEGIN
	SELECT car_fuel_id as id,car_fuel_name as value FROM bsapp_db.car_fuel_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_car_owner_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_car_owner_mast_fill`(

)
BEGIN
	SELECT id as id,name as value FROM bsapp_db.car_owner_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_car_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_car_type_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.car_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_commercial_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_commercial_brand_mast_fill`(

)
BEGIN
	SELECT id as id,name as value FROM bsapp_db.commercial_brand_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_job_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_job_type_mast_fill`(

)
BEGIN
	SELECT j_type_id as id,j_type_name as value FROM bsapp_db.job_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_mobile_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_mobile_brand_mast_fill`(

)
BEGIN
	SELECT brand_id as id, brand_name as value FROM bsapp_db.mobile_brand_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_mobile_ram_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_mobile_ram_mast_fill`(

)
BEGIN
	SELECT id as id, value as value FROM bsapp_db.mobile_ram_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_mobile_rom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_mobile_rom_mast_fill`(

)
BEGIN
	SELECT id as id, value as value FROM bsapp_db.mobile_rom_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_cabin_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_cabin_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_cabin_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_car_parking_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_car_parking_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_car_parking_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_employee_capacity_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_employee_capacity_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_employee_capacity_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_furnishing_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_furnishing_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_furnishing_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_listed_by_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_listed_by_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_listed_by_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_type_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_office_washroom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_office_washroom_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.office_washroom_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_position_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_position_type_mast_fill`(

)
BEGIN
	SELECT p_type_id as id,p_type_name as value FROM bsapp_db.position_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_bathroom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_bathroom_mast_fill`(

)
BEGIN
	SELECT id as id,value as value FROM bsapp_db.property_bathroom_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_bedroom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_bedroom_mast_fill`(

)
BEGIN
	SELECT id,value FROM bsapp_db.property_bedroom_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_car_parking_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_car_parking_mast_fill`(

)
BEGIN
	SELECT p_car_parking_id as id,p_car_parking_name as value FROM bsapp_db.property_car_parking_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_furnishing_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_furnishing_mast_fill`(

)
BEGIN
	SELECT p_furnishing_id as id,p_furnishing_name as value FROM bsapp_db.property_furnishing_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_listed_by_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_listed_by_mast_fill`(

)
BEGIN
	SELECT p_listed_by_id as id,p_listed_by_name as value FROM bsapp_db.property_listed_by_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_preferred_renters_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_preferred_renters_mast_fill`(

)
BEGIN
	SELECT p_preferred_renters_id as id,p_preferred_renters_name as value FROM bsapp_db.property_preferred_renters_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_property_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_property_type_mast_fill`(

)
BEGIN
	SELECT p_type_id as id,p_type_name as value FROM bsapp_db.property_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_salary_period_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_salary_period_mast_fill`(

)
BEGIN
	SELECT s_p_id as id,s_p_name as value FROM bsapp_db.salary_period_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_vehicle_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_vehicle_type_mast_fill`(

)
BEGIN
	SELECT v_type_id as id,v_type_name as value FROM bsapp_db.vehicle_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dd_year_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dd_year_mast_fill`(

)
BEGIN
	SELECT id,value FROM bsapp_db.year_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_device_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_device_mast_delete`(
	IN in_device_id INT
)
BEGIN
	DELETE FROM bsapp_db.device_mast WHERE id = in_device_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_device_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_device_mast_fill`(
)
BEGIN
select *  from bsapp_db.device_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_device_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_device_mast_save`(
    in in_device_id int,
    in in_device_name varchar(45)
    
)
BEGIN

IF NOT EXISTS(select id from bsapp_db.device_mast where id = in_device_id) THEN
 	INSERT INTO bsapp_db.device_mast
		(name,created_at)
	VALUES
		(in_device_name,now());
ELSE
   UPDATE bsapp_db.device_mast
	SET
	name = in_device_name,
    modified_at= now()
	WHERE id = in_device_id;
	
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_device_token_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_device_token_mast_delete`(
	IN in_device_token_id INT
)
BEGIN
	DELETE FROM bsapp_db.device_token_mast WHERE id = in_device_token_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_device_token_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_device_token_mast_fill`(
)
BEGIN
select *  from bsapp_db.device_token_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_device_token_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_device_token_mast_save`(
    in in_device_token_id int,
    in in_device_type int,
    in in_device_unq_id int,
    IN in_user_id VARCHAR(125)  ,
    in in_device_token varchar(244)
)
BEGIN
IF EXISTS(SELECT user_id from bsapp_db.device_token_mast where user_id = in_user_id) THEN
	 UPDATE bsapp_db.device_token_mast
	SET
	device_type = in_device_type,
    device_unq_id= in_device_unq_id,
    user_id = in_user_id,
    modified_at= now(),
    device_token = in_device_token
	WHERE user_id = in_user_id;
ELSEIF exists(select device_unq_id from bsapp_db.device_token_mast where device_unq_id = in_device_unq_id) THEN
	UPDATE bsapp_db.device_token_mast
	SET
	device_type = in_device_type,
    device_unq_id= in_device_unq_id,
    user_id = in_user_id,
    modified_at= now(),
    device_token = in_device_token
	WHERE device_token = in_device_token;
ELSE 
		INSERT INTO bsapp_db.device_token_mast
		(device_type,device_unq_id,user_id,created_at,device_token)
	VALUES
		(in_device_type,in_device_unq_id,in_user_id,now(),in_device_token);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dispaly_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dispaly_type_mast_save`(
    in in_display_type_id int,
    in in_display_type_type varchar(256)
    
)
BEGIN
IF NOT EXISTS(select display_type_id from bsapp_db.display_type_mast where display_type_id = in_display_type_id) THEN
 	INSERT INTO bsapp_db.display_type_mast
		(display_type_type,display_type_created_date)
	VALUES
		(in_display_type_type,now());
ELSE
   UPDATE bsapp_db.display_type_mast
	SET
	display_type_type = in_display_type_type,
    display_type_modified_date= now()
	WHERE display_type_id = in_display_type_id;
	
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_display_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_display_type_mast_delete`(
	IN in_display_type_id INT
)
BEGIN
	DELETE FROM bsapp_db.display_type_mast WHERE display_type_id = in_display_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_display_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_display_type_mast_fill`(
)
BEGIN
	SELECT * FROM bsapp_db.display_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dynamic_field_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dynamic_field_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.dynamic_field_mast
    WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dynamic_field_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dynamic_field_mast_fill`(
    IN in_display_type_id INT,
	IN in_cat_id INT
)
BEGIN
	SELECT bsapp_db.display_type_mast.display_type_type,
    bsapp_db.dynamic_field_mast.db_field,bsapp_db.dynamic_field_mast.display_name,
    bsapp_db.dynamic_field_mast.display_type_id,
    bsapp_db.dynamic_field_mast.cat_id,
    bsapp_db.dynamic_field_mast.sequence
    ,bsapp_db.dynamic_field_mast.icon,bsapp_db.dynamic_field_mast.is_active FROM bsapp_db.dynamic_field_mast 
    left join bsapp_db.display_type_mast on bsapp_db.dynamic_field_mast.display_type_id= bsapp_db.display_type_mast.display_type_id
    WHERE bsapp_db.dynamic_field_mast.display_type_id = in_display_type_id AND bsapp_db.dynamic_field_mast.cat_id = in_cat_id and is_active = true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_dynamic_field_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_dynamic_field_mast_save`(
	IN in_id INT,
    IN in_db_field VARCHAR(126),
    IN in_display_name VARCHAR(256),
    IN in_display_type_id INT,
    IN in_cat_id INT,
    IN in_sequence INT,
    IN in_icon VARCHAR(256),
    IN in_is_active BOOL
)
BEGIN
	IF NOT EXISTS(SELECT * FROM bsapp_db.dynamic_field_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.dynamic_field_mast 
        (db_field, display_name, display_type_id, cat_id, sequence, icon, is_active)
        VALUES (in_db_field, in_display_name, in_display_type_id, in_cat_id, in_sequence, in_icon, in_is_active);
    ELSE
		UPDATE bsapp_db.dynamic_field_mast
        SET
        db_field = in_db_field,
        display_name = in_display_name,
        display_type_id = in_display_type_id,
        cat_id = in_cat_id,
        sequence = in_sequence,
        icon = in_icon,
        is_active = in_is_active
        WHERE
		id = in_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_favourites_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_favourites_mast_delete`(
	IN in_fav_id INT
)
BEGIN
	DELETE FROM bsapp_db.favourites_mast WHERE fav_id = in_fav_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_favourites_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_favourites_mast_fill`(
    IN in_user_id VARCHAR(125),
    IN in_limit INT,
    IN in_page_no INT
)
BEGIN
DECLARE  in_offset INT;
SET in_offset = (in_page_no -1) * in_limit;

select *,COUNT(*) OVER() AS "total_count" FROM(
(SELECT 
	FAV.fav_id AS Fav_id,
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    CS.c_picture_link_1 AS Image,
    CS.car_title AS Name,
    CS.c_price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    CS.c_location as location,
    DATE_FORMAT(CS.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(CS.modified_at,'%d %b %y') AS Modify_Date,
    CS.year AS car_year_of_registration,
    CS.c_km AS car_km,
    CS.c_owner AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.car_sell_inventory_mast CS
        LEFT JOIN  bsapp_db.favourites_mast FAV ON CS.car_sell_inventory_id = FAV.inventory_id   AND CS.car_sell_inventory_code = FAV.inventory_code   AND CS.inventory_type = FAV.inventory_type
        LEFT JOIN  bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
WHERE  FAV.user_id = in_user_id)
UNION 
   (SELECT 
	FAV.fav_id AS Fav_id,
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    AI.picture_link_1 AS Image,
    AI.title AS Name,
    AI.price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    AI.location as location,
    DATE_FORMAT(AI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(AI.modified_at,'%d %b %y') AS Modify_Date,
    0 AS car_year_of_registration,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
  bsapp_db.all_inventory_mast  AI
        LEFT JOIN bsapp_db.favourites_mast FAV ON AI.all_inventory_id = FAV.inventory_id    AND AI.all_inventory_code = FAV.inventory_code   AND AI.inventory_type = FAV.inventory_type
        LEFT JOIN  bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
WHERE  FAV.user_id = in_user_id)
UNION 
    (SELECT 
    FAV.fav_id AS Fav_id,
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y')   AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    CR.c_picture_link_1 AS Image,
    CR.car_title AS Name,
    CR.c_price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    CR.c_location as location,
    DATE_FORMAT(CR.created_at,'%d %b %y')  AS Create_Date,
    DATE_FORMAT(CR.modified_at,'%d %b %y')  AS Modify_Date,
    0 AS car_year_of_registration,
    c_km_limit AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.car_rent_inventory_mast CR
        LEFT JOIN bsapp_db.favourites_mast FAV ON CR.car_rent_inventory_id = FAV.inventory_id   AND CR.car_rent_inventory_code = FAV.inventory_code     AND CR.inventory_type = FAV.inventory_type
        LEFT JOIN  bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
WHERE  FAV.user_id = in_user_id)
    UNION 
	(SELECT 
    FAV.fav_id AS Fav_id,
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    JI.j_picture_link_1 AS Image,
    JI.j_title AS Name,
    0 AS price,
    JI.from_salary AS From_salary,
    JI.to_salary AS To_salary,
    JI.j_location as location,
    DATE_FORMAT(JI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(JI.modified_at,'%d %b %y')  AS Modify_Date,
    0 AS car_year_of_registration,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    JT.j_type_name AS Job_type,
    SP.s_p_name AS Job_salary_period
FROM
     bsapp_db.job_inventory_mast JI
		LEFT JOIN bsapp_db.favourites_mast FAV ON JI.job_inventory_id = FAV.inventory_id   AND JI.job_inventory_code = FAV.inventory_code  AND JI.inventory_type = FAV.inventory_type
		LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
WHERE  FAV.user_id = in_user_id)
    UNION 
        (SELECT 
    FAV.fav_id AS Fav_id,    
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    MI.mo_picture_link_1 AS Image,
    MI.mo_title AS Name,
    MI.mo_price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    MI.location as location,
    DATE_FORMAT(MI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(MI.modified_at,'%d %b %y') AS Modify_Date,
    0 AS car_year_of_registration,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    MI.mo_ram AS Mobile_ram,
    MI.mo_rom AS Mobile_rom,
    BR.brand_name AS Mobile_brand,
    MI.mo_colour AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.mobile_inventory_mast MI
	    LEFT JOIN bsapp_db.favourites_mast FAV ON MI.mo_inventory_id = FAV.inventory_id  AND MI.mo_inventory_code = FAV.inventory_code  AND MI.inventory_type = FAV.inventory_type
		LEFT JOIN bsapp_db.mobile_brand_mast BR  ON  MI.brand_id = BR.brand_id 
        LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
WHERE  FAV.user_id = in_user_id)
UNION
      (SELECT 
    FAV.fav_id AS Fav_id,  
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    OI.o_picture_link_1 AS Image,
    OI.o_title AS Name,
    OI.o_price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    OI.o_location as location,
    DATE_FORMAT(OI.created_at,'%d %b %y')  AS Create_Date,
    DATE_FORMAT(OI.modified_at,'%d %b %y')  AS Modify_Date,
    0 AS car_year_of_registration,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    OI.cabin AS Cabin,
    OI.washroom AS Washroom,
    OI.o_sq_ft AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
     bsapp_db.office_inventory_mast OI
       LEFT JOIN bsapp_db.favourites_mast FAV ON OI.office_inventory_id = FAV.inventory_id  AND OI.office_inventory_code = FAV.inventory_code  AND OI.inventory_type = FAV.inventory_type
		LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
WHERE  FAV.user_id = in_user_id)
UNION 
(SELECT 
	FAV.fav_id AS Fav_id,
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    PI.p_picture_link_1 AS Image,
    PI.p_title AS Name,
    PI.p_price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    PI.p_location as location,
    DATE_FORMAT(PI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(PI.modified_at,'%d %b %y') AS Modify_Date,
    0 AS car_year_of_registration,
    0 AS car_km,
    '' AS owner,
    PI.p_bedroom AS Bedroom,
    PI.p_bathroom AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    PI.p_sq_ft AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    0 AS year_of_registration,
    0 AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
      bsapp_db.property_inventory_mast PI
	   LEFT JOIN bsapp_db.favourites_mast FAV ON PI.property_inventory_id = FAV.inventory_id  AND PI.property_inventory_code = FAV.inventory_code AND PI.inventory_type = FAV.inventory_type
	   LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
       LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
WHERE  FAV.user_id = in_user_id)
 UNION 
    (SELECT 
    FAV.fav_id AS Fav_id,
    FAV.inventory_id AS Inventory_id,
    FAV.user_id AS User_id, 
    FAV.inventory_code AS Inventory_code,
    FAV.inventory_type AS Inventory_type,
    DATE_FORMAT(FAV.created_at,'%d %b %y') AS Ad_created_date,
    DATE_FORMAT(FAV.modified_at,'%d %b %y') AS Ad_modified_date,
    CAT.cat_name AS Category,
    SUB.sub_cat_name AS Sub_category,
    VI.v_picture_link_1 AS Image,
    VI.v_title AS Name,
    VI.v_price AS Price,
    0 AS from_salary,
    0 AS to_salary,
    VI.v_location as location,
    DATE_FORMAT(VI.created_at,'%d %b %y') AS Create_Date,
    DATE_FORMAT(VI.modified_at,'%d %b %y') AS Modify_Date,
    0 AS car_year_of_registration,
    0 AS car_km,
    '' AS owner,
    0 AS Bedroom,
    0 AS Bathroom,
    0 AS Cabin,
    0 AS Washroom,
    0 AS Square_Feet,
    '' AS Mobile_ram,
    '' AS Mobile_rom,
    '' AS Mobile_brand,
    '' AS Mobile_colour,
    VI.year AS year_of_registration,
    VI.kms AS vehicle_km,
    '' AS Job_type,
    '' AS Job_salary_period
FROM
    bsapp_db.vehicle_inventory_mast VI
		LEFT JOIN bsapp_db.favourites_mast FAV  ON VI.vehicle_inventory_id = FAV.inventory_id   AND VI.vehicle_inventory_code  = FAV.inventory_code  AND VI.inventory_type = FAV.inventory_type
        LEFT JOIN  bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id        
WHERE  FAV.user_id = in_user_id))AS SUBQ limit in_limit offset in_offset;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_favourites_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_favourites_mast_save`(
	IN in_fav_id INT,
    IN in_inventory_id INT,
    IN in_user_id VARCHAR(125),
    IN in_inventory_code VARCHAR(126),
    IN in_inventory_type VARCHAR(126)
)
BEGIN

IF NOT EXISTS(SELECT user_id,inventory_id,inventory_code,inventory_type FROM bsapp_db.favourites_mast WHERE  user_id = in_user_id AND inventory_code = in_inventory_code AND inventory_id = in_inventory_id AND inventory_type = in_inventory_type ) THEN
 	INSERT INTO bsapp_db.favourites_mast
		(inventory_id,user_id,inventory_code,inventory_type,created_at)
	VALUES
		(in_inventory_id,in_user_id,in_inventory_code,in_inventory_type,now());
	
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_filter_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_filter_mast_delete`(	
	IN in_f_id INT
)
BEGIN
	DELETE FROM bsapp_db.filter_mast where f_id = in_f_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_filter_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_filter_mast_fill`(
	IN in_cat_id INT,
    IN in_sub_cat_id INT
)
BEGIN
	SELECT FM.f_id,CAT.cat_name,SUB.sub_cat_name,FORMAT(FM.from_price, 0) AS from_price, FORMAT(FM.to_price, 0) AS to_price,FM.price_description,FM.from_distance,FM.to_distance,FM.distance_description,FM.publish_date,MBM.brand_name,PTM.p_type_name,FM.p_bedroom,FM.p_bathroom,PSM.p_status_title,FM.car_brand,FM.car_year,FM.car_kms,VTM.v_type_name,JTM.j_type_name,PO.p_type_name,SPM.s_p_name,FM.from_salary,FM.to_salary,FM.salary_description,FM.budget,FM.created_at,FM.modified_at 
    FROM bsapp_db.filter_mast FM
	LEFT JOIN bsapp_db.mobile_brand_mast MBM   ON  FM.m_brand_id = MBM.brand_id 
    LEFT JOIN bsapp_db.property_type_mast PTM ON FM.p_type_id = PTM.p_type_id
    LEFT JOIN bsapp_db.property_status_mast PSM ON FM.p_status_id = PSM.p_status_id
    LEFT JOIN bsapp_db.vehicle_type_mast VTM ON FM.v_type_id = VTM.v_type_id
    LEFT JOIN bsapp_db.job_type_mast JTM ON FM.j_type_id = JTM.j_type_id
    LEFT JOIN bsapp_db.position_type_mast PO ON FM.j_position_type_id = PO.p_type_id
    LEFT JOIN bsapp_db.salary_period_mast SPM ON FM.j_s_period_id = SPM.s_p_id
	LEFT JOIN bsapp_db.category_mast CAT ON FM.cat_id = CAT.id
	LEFT JOIN bsapp_db.sub_category_mast SUB ON FM.sub_cat_id = SUB.id
    WHERE FM.cat_id = in_cat_id AND FM.sub_cat_id = in_sub_cat_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_filter_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_filter_mast_save`(
	IN in_f_id INT,
	IN in_cat_id INT,
    IN in_sub_cat_id INT,
    IN in_from_price INT,
    IN in_to_price INT,
    IN in_from_distance INT,
    IN in_to_distance INT,
    IN in_publish_date DATETIME,
    IN in_m_brand_id INT,
    IN in_p_type_id INT,
    IN in_p_bedroom INT,
    IN in_p_bathroom INT,
    IN in_p_status_id INT,
    IN in_car_brand VARCHAR(126),
    IN in_car_year INT,
    IN in_car_kms INT,
    IN in_v_type_id INT,
    IN in_j_type_id INT,
    IN in_j_position_type_id INT,
    IN in_j_s_period_id INT,
    IN in_from_salary INT,
    IN in_to_salary INT,
    IN in_budget INT

)
BEGIN
IF NOT EXISTS(select f_id from bsapp_db.filter_mast where f_id = in_f_id) THEN
	INSERT INTO bsapp_db.filter_mast
    		(f_id,cat_id,sub_cat_id,from_price,to_price,price_description,from_distance,to_distance,distance_description,publish_date,m_brand_id,p_type_id,p_bedroom,p_bathroom,p_status_id,car_brand,car_year,car_kms,v_type_id,j_type_id,j_position_type_id,j_s_period_id,from_salary,to_salary,salary_description,budget,created_at)
	VALUES
			(in_f_id,in_cat_id,in_sub_cat_id,in_from_price,in_to_price,concat("Rs.",in_from_price,"  -  Rs.",in_to_price),in_from_distance,in_to_distance,concat(in_from_distance," Km  -  ",in_to_distance," Km"),in_publish_date,in_m_brand_id,in_p_type_id,in_p_bedroom,in_p_bathroom,in_p_status_id,in_car_brand,in_car_year,in_car_kms,in_v_type_id,in_j_type_id,in_j_position_type_id,in_j_s_period_id,in_from_salary,in_to_salary,concat("Rs.",in_from_salary,"  -  Rs.",in_to_salary),in_budget,now());
ELSE
 UPDATE bsapp_db.filter_mast
	SET
	f_id = in_f_id,
    cat_id = in_cat_id,
    sub_cat_id = in_sub_cat_id,
    from_price = in_from_price,
    to_price = in_to_price,
    price_description = concat("Rs.",in_from_price,"  -  Rs.",in_to_price),
    from_distance = in_from_distance,
    to_distance = in_to_distance,
    distance_description = concat(in_from_distance," Km  -  ",in_to_distance," Km"),
    publish_date = in_publish_date,
    m_brand_id = in_m_brand_id,
    p_type_id = in_p_type_id,
    p_bedroom = in_p_bedroom,
    p_bathroom = in_p_bathroom,
    p_status_id = in_p_status_id,
    car_brand = in_car_brand,
    car_year = in_car_year,    
    car_kms = in_car_kms,
    v_type_id = in_v_type_id,
    j_type_id = in_j_type_id,
    j_position_type_id = in_j_position_type_id,
    j_s_period_id = in_j_s_period_id,
    from_salary = in_from_salary,
    to_salary = in_to_salary,
    salary_description = concat("Rs.",in_from_salary,"  -  Rs.",in_to_salary),
    budget = in_budget,
    modified_at = now()
	WHERE f_id = in_f_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_firebase_authentication` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_firebase_authentication`(

in in_mobile_no varchar(16),
in in_mail_id varchar(64),
in in_name varchar(126),
in in_bio_description varchar(512),
in in_profile_picture_link varchar(512),
in in_mobile_cc_code varchar(8),
in in_user_cat varchar(5),
in in_password varchar(126),
in in_user_id varchar(250)
)
BEGIN
DECLARE in_login_seq_id BIGINT;

IF NOT EXISTS(select user_id from bsapp_db.user_mast where  user_id = in_user_id) THEN
 	call sp_login_sequence();
    SET in_login_seq_id = (select  seq_id  from bsapp_db.login_sequence_mast where seq_date = CURDATE());
    INSERT INTO bsapp_db.user_mast
		(login_id,mobile_no,mail_id,name,bio_description,profile_picture_link,mobile_cc_code,user_cat,password,user_id,created_at)
	VALUES
		(in_login_seq_id,in_mobile_no,in_mail_id,in_name,in_bio_description,in_profile_picture_link,in_mobile_cc_code,in_user_cat,in_password,in_user_id,now());
	select * from bsapp_db.user_mast where user_id = in_user_id;
ELSE
   UPDATE bsapp_db.user_mast
	SET
	mail_id = in_mail_id,
    name = in_name,
    bio_description = in_bio_description,
    profile_picture_link = in_profile_picture_link,
    user_cat = in_user_cat,
    modified_at = now()
	WHERE user_id = in_user_id;
select * from bsapp_db.user_mast where user_id = in_user_id;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_forgot_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_forgot_password`(
	IN in_mobile_no  VARCHAR(16),
	IN in_mobile_cc_code VARCHAR(8),
    IN in_mail_id VARCHAR(64),
    IN in_password VARCHAR(126)
)
BEGIN
IF(in_mobile_no = "from_email") THEN
IF NOT EXISTS(
	   SELECT mail_id
	   FROM bsapp_db.user_mast 
	   WHERE mail_id = in_mail_id)
	THEN
	SELECT "EMAIL ID NOT EXIST" as MSG;
ELSE
    UPDATE bsapp_db.user_mast
		SET
		password = in_password,
        modified_at = now()
		WHERE mail_id = in_mail_id ;
      SELECT "UPDATE PASSWORD" as SUCCESS_MSG;
  END IF;
	
  ELSE
  IF NOT EXISTS(
	   SELECT mobile_no,mobile_cc_code
	   FROM bsapp_db.user_mast 
	   WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code )
	THEN
	SELECT "MOBILE NUMBER NOT EXIST" as MSG;
ELSE
    UPDATE bsapp_db.user_mast
		SET
		password = in_password,
        modified_at = now()
		WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code ;
      SELECT "UPDATE PASSWORD" as SUCCESS_MSG;
    END IF;  
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_ad_details` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_get_ad_details`(
	IN in_user_id VARCHAR(125),
    IN in_ad_status_id INT
)
BEGIN
    SELECT * FROM(
	(SELECT 
		AD.ads_id AS Ads_id,
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		CS.c_picture_link_1 AS Image,
		CS.car_title AS Name,
		FORMAT(CS.c_price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		CS.c_location as location,
		SM.state_name AS car_registration_state,
		CS.c_km AS car_km,
		CO.name AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		0 AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		YM.value AS year_of_registration,
		0 AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.car_sell_inventory_mast CS
        LEFT JOIN  bsapp_db.ads_mast AD ON CS.car_sell_inventory_id = AD.inventory_id   AND CS.car_sell_inventory_code = AD.inventory_code   AND CS.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN  bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
		LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
		LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
		LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
	WHERE AD.user_id = in_user_id)
	UNION 
	(SELECT 
		AD.ads_id AS Ads_id,
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		AI.picture_link_1 AS Image,
		AI.title AS Name,
		FORMAT(AI.price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		AI.location as location,
		'' AS car_registration_state,
		0 AS car_km,
		'' AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		0 AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		0 AS year_of_registration,
		0 AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.all_inventory_mast  AI
        LEFT JOIN bsapp_db.ads_mast AD ON AI.all_inventory_id = AD.inventory_id    AND AI.all_inventory_code = AD.inventory_code   AND AI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN  bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
	WHERE  AD.user_id = in_user_id)
	UNION 
    (SELECT 
		AD.ads_id AS Ads_id,
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		CR.c_picture_link_1 AS Image,
		CR.car_title AS Name,
		FORMAT(CR.c_price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		CR.c_location as location,
		'' AS car_registration_state,
		c_km_limit AS car_km,
		'' AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		0 AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		0 AS year_of_registration,
		0 AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.car_rent_inventory_mast CR
        LEFT JOIN bsapp_db.ads_mast AD ON CR.car_rent_inventory_id = AD.inventory_id   AND CR.car_rent_inventory_code = AD.inventory_code     AND CR.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN  bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
	WHERE  AD.user_id = in_user_id)
    UNION 
	(SELECT 
		AD.ads_id AS Ads_id,
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		JI.j_picture_link_1 AS Image,
		JI.j_title AS Name,
		0 AS price,
		JI.from_salary AS From_salary,
		JI.to_salary AS To_salary,
		JI.j_location as location,
		'' AS car_registration_state,
		0 AS car_km,
		'' AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		0 AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		0 AS year_of_registration,
		0 AS vehicle_km,
		JT.j_type_name AS Job_type,
		SP.s_p_name AS Job_salary_period
	FROM
		bsapp_db.job_inventory_mast JI
		LEFT JOIN bsapp_db.ads_mast AD ON JI.job_inventory_id = AD.inventory_id   AND JI.job_inventory_code = AD.inventory_code  AND JI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
	WHERE AD.user_id = in_user_id)
    UNION 
	(SELECT 
		AD.ads_id AS Ads_id,    
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		MI.mo_picture_link_1 AS Image,
		MI.mo_title AS Name,
		FORMAT(MI.mo_price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		MI.location as location,
		'' AS car_registration_state,
		0 AS car_km,
		'' AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		0 AS Square_Feet,
		RAM.value AS Mobile_ram,
		ROM.value AS Mobile_rom,
		BR.brand_name AS Mobile_brand,
		MI.mo_colour AS Mobile_colour,
		0 AS year_of_registration,
		0 AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.mobile_inventory_mast MI
	    LEFT JOIN bsapp_db.ads_mast AD ON MI.mo_inventory_id = AD.inventory_id  AND MI.mo_inventory_code = AD.inventory_code  AND MI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.mobile_brand_mast BR  ON  MI.brand_id = BR.brand_id 
        LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
		LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
	WHERE AD.user_id = in_user_id)
	UNION
	(SELECT 
		AD.ads_id AS Ads_id,  
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		OI.o_picture_link_1 AS Image,
		OI.o_title AS Name,
		FORMAT(OI.o_price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		OI.o_location as location,
		'' AS car_registration_state,
		0 AS car_km,
		'' AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		OC.value as Cabin,
		OW.value as Washroom,
		OI.o_sq_ft AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		0 AS year_of_registration,
		0 AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.office_inventory_mast OI
		LEFT JOIN bsapp_db.ads_mast AD ON OI.office_inventory_id = AD.inventory_id  AND OI.office_inventory_code = AD.inventory_code  AND OI.inventory_type = AD.inventory_type
        LEFT JOIN bsapp_db.office_cabin_mast  OC  ON  OI.cabin =OC.id
        LEFT JOIN bsapp_db.office_washroom_mast  OW  ON  OI.washroom =OW.id
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
	WHERE  AD.user_id = in_user_id)
	UNION 
	(SELECT 
		AD.ads_id AS Ads_id,
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		PI.p_picture_link_1 AS Image,
		PI.p_title AS Name,
		FORMAT(PI.p_price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		PI.p_location as location,
		'' AS car_registration_state,
		0 AS car_km,
		'' AS owner,
		BED.value as Bedroom,
		BAT.value as Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		PI.p_sq_ft AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		0 AS year_of_registration,
		0 AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.property_inventory_mast PI
		LEFT JOIN bsapp_db.ads_mast AD ON PI.property_inventory_id = AD.inventory_id  AND PI.property_inventory_code = AD.inventory_code AND PI.inventory_type = AD.inventory_type
		LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
		LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
		LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
		LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
		LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
	WHERE AD.user_id = in_user_id)
	UNION 
    (SELECT 
		AD.ads_id AS Ads_id,
		AD.inventory_id AS Inventory_id,
		AD.user_id AS User_id, 
		AD.inventory_code AS Inventory_code,
		AD.inventory_type AS Inventory_type,
		AD.ad_status_id AS Ad_status_code,
		ADS.ad_status AS Ad_status,
		ADS.ad_status_message AS Ad_status_message,
		AD.likes AS likes,
		AD.views AS views,
		CAT.cat_name AS Category,
		SUB.sub_cat_name AS Sub_category,
		VI.v_picture_link_1 AS Image,
		VI.v_title AS Name,
		FORMAT(VI.v_price, 0) AS Price,
		0 AS from_salary,
		0 AS to_salary,
		VI.v_location as location,
		'' AS car_registration_state,
		0 AS car_km,
		'' AS owner,
		0 AS Bedroom,
		0 AS Bathroom,
		0 AS Cabin,
		0 AS Washroom,
		0 AS Square_Feet,
		'' AS Mobile_ram,
		'' AS Mobile_rom,
		'' AS Mobile_brand,
		'' AS Mobile_colour,
		YM.value AS year_of_registration,
		VI.kms AS vehicle_km,
		'' AS Job_type,
		'' AS Job_salary_period
	FROM
		bsapp_db.vehicle_inventory_mast VI
		LEFT JOIN bsapp_db.ads_mast AD  ON VI.vehicle_inventory_id = AD.inventory_id AND VI.vehicle_inventory_code  = AD.inventory_code  AND VI.inventory_type = AD.inventory_type
        LEFT JOIN  bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
        LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
        LEFT JOIN  bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
        LEFT JOIN  bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id        
	WHERE AD.user_id = in_user_id)) AS SUBQ
    WHERE ad_status_code = in_ad_status_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_followers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_get_followers`(
	IN in_user_id VARCHAR(125)
)
BEGIN
	SELECT UM.*
    FROM bsapp_db.user_followers_mast UF
    LEFT JOIN bsapp_db.user_mast UM ON UF.follower_id = UM.user_id
    WHERE UF.user_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_followers_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_get_followers_count`(
	IN in_user_id VARCHAR(125)
)
BEGIN
	SELECT COUNT(DISTINCT follower_id) AS "followers" 
    FROM bsapp_db.user_followers_mast
    WHERE user_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_following` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_get_following`(
	IN in_user_id VARCHAR(125)
)
BEGIN
	SELECT UM.*
    FROM bsapp_db.user_followers_mast UF
    LEFT JOIN bsapp_db.user_mast UM ON UF.user_id = UM.user_id
    WHERE UF.follower_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_following_count` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_get_following_count`(
	IN in_user_id VARCHAR(125)
)
BEGIN
	SELECT COUNT(DISTINCT user_id) AS "following" 
    FROM bsapp_db.user_followers_mast
    WHERE follower_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_get_user_by_inventory_code` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_get_user_by_inventory_code`(
	IN in_inventory_code VARCHAR(126)
)
BEGIN
	SELECT login_id,user_id, mail_id, name, mobile_no, created_at
    FROM bsapp_db.user_mast UM
    WHERE user_id IN (
		SELECT user_id FROM bsapp_db.car_sell_inventory_mast WHERE car_sell_inventory_code = in_inventory_code
        UNION
		SELECT user_id FROM bsapp_db.car_rent_inventory_mast WHERE car_rent_inventory_code = in_inventory_code
        UNION
        SELECT user_id FROM bsapp_db.all_inventory_mast WHERE all_inventory_code = in_inventory_code
        UNION
        SELECT user_id FROM bsapp_db.job_inventory_mast WHERE job_inventory_code = in_inventory_code
        UNION
        SELECT user_id FROM bsapp_db.mobile_inventory_mast WHERE mo_inventory_code = in_inventory_code
        UNION
        SELECT user_id FROM bsapp_db.office_inventory_mast WHERE office_inventory_code = in_inventory_code
        UNION
        SELECT user_id FROM bsapp_db.property_inventory_mast WHERE property_inventory_code = in_inventory_code
        UNION
        SELECT user_id FROM bsapp_db.vehicle_inventory_mast WHERE vehicle_inventory_code = in_inventory_code
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_ad_status_mast_save_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_ad_status_mast_save_update`(
)
BEGIN
	UPDATE bsapp_db.ads_mast
	SET ad_status_id = 2
    WHERE ad_status_id IS NULL 
	OR ad_status_id = 0 
    OR ad_status_id = 1 ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_inventory_mast_delete`(
	IN in_job_inventory_id INT,
    IN in_user_id VARCHAR(125)	
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.job_inventory_mast JI  ON  AD.inventory_code= JI.job_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_job_inventory_id );
		DELETE FROM bsapp_db.job_inventory_mast WHERE job_inventory_id = in_job_inventory_id AND user_id = in_user_id;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_inventory_mast_fill`(
	IN in_job_inventory_code VARCHAR(126),
    IN in_cat_id INT	
)
BEGIN
		SELECT JI.job_inventory_id, IFNULL(JI.user_id, "-") as user_id, 
			IFNULL(AD.ads_id, "-") as ads_id, IFNULL(JI.job_inventory_code, "-") as job_inventory_code,
			IFNULL(JI.j_title, "-") as j_title, IFNULL(FORMAT(JI.from_salary, 0), "-") as from_salary,
			IFNULL(FORMAT(JI.to_salary, 0), "-") as to_salary, JI.j_picture_link_1, 
			JI.j_picture_link_2, JI.j_picture_link_3, JI.j_picture_link_4, JI.j_picture_link_5,
			JI.j_picture_link_6, JI.j_picture_link_7, JI.j_picture_link_8, JI.j_picture_link_9,
			JI.j_picture_link_10, IFNULL(JT.j_type_name, "-") as j_type_name,
			IFNULL(SP.s_p_name, "-") as s_p_name, IFNULL(PT.p_type_name, "-") as p_type_name,
			IFNULL(JI.j_designation, "-") as j_designation, IFNULL(JI.j_show_mo_no, "-") as j_show_mo_no,
			IFNULL(JI.j_description, "-") as j_description , IFNULL(JI.j_location, "-") as j_location,
			IFNULL(DATE_FORMAT(JI.created_at,'%d %b %y'), "-") as ad_created,
			IFNULL(JI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture,
			IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
			IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name,
			IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
        FROM bsapp_db.job_inventory_mast JI
        LEFT JOIN bsapp_db.job_type_mast JT ON JI.j_type_id = JT.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON JI.s_p_id = SP.s_p_id
        LEFT JOIN bsapp_db.position_type_mast PT ON JI.p_type_id = PT.p_type_id
		LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = JI.job_inventory_id 
        LEFT JOIN bsapp_db.user_mast UM ON UM.user_id = JI.user_id
        WHERE JI.job_inventory_code = in_job_inventory_code AND JI.cat_id = in_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_inventory_mast_save`(
IN in_job_inventory_id INT,
    IN in_user_id VARCHAR(125),
	IN in_j_title VARCHAR(126),
	IN in_from_salary INT,
    IN in_to_salary INT,
	IN in_j_picture_link_1 VARCHAR(512),
    IN in_j_picture_link_2 VARCHAR(512),
    IN in_j_picture_link_3 VARCHAR(512),
    IN in_j_picture_link_4 VARCHAR(512),
    IN in_j_picture_link_5 VARCHAR(512),
    IN in_j_picture_link_6 VARCHAR(512),
    IN in_j_picture_link_7 VARCHAR(512),
    IN in_j_picture_link_8 VARCHAR(512),
    IN in_j_picture_link_9 VARCHAR(512),
    IN in_j_picture_link_10 VARCHAR(512),
    IN in_j_type_id INT,
    IN in_s_p_id INT,
    IN in_p_type_id INT,
    IN in_j_designation VARCHAR(126),
    IN in_j_show_mo_no  BOOLEAN,
	IN in_j_description VARCHAR(512),
	IN in_j_location VARCHAR(126),
    IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
	IN in_cat_id INT,
	IN in_sub_cat_id INT)
BEGIN
DECLARE get_max_inventory_id INT;

select COALESCE(MAX(job_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.job_inventory_mast;

IF NOT EXISTS(select job_inventory_id from bsapp_db.job_inventory_mast where job_inventory_id = in_job_inventory_id AND user_id = in_user_id) THEN
	INSERT INTO bsapp_db.job_inventory_mast
    		(job_inventory_id,user_id,job_inventory_code,j_title,from_salary,to_salary,j_picture_link_1,j_picture_link_2,j_picture_link_3,j_picture_link_4,j_picture_link_5,j_picture_link_6,j_picture_link_7,j_picture_link_8,j_picture_link_9,j_picture_link_10,j_type_id,s_p_id,p_type_id,j_designation,j_show_mo_no,j_description,j_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
			(get_max_inventory_id,in_user_id,concat("job_",get_max_inventory_id),in_j_title,in_from_salary,in_to_salary,in_j_picture_link_1,in_j_picture_link_2,in_j_picture_link_3,in_j_picture_link_4,in_j_picture_link_5,in_j_picture_link_6,in_j_picture_link_7,in_j_picture_link_8,in_j_picture_link_9,in_j_picture_link_10,in_j_type_id,in_s_p_id,in_p_type_id,in_j_designation,in_j_show_mo_no,in_j_description,in_j_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("job_",get_max_inventory_id),"job",1);	
select * from bsapp_db.job_inventory_mast where job_inventory_id = get_max_inventory_id AND user_id = in_user_id;
ELSE
	UPDATE bsapp_db.job_inventory_mast
	SET
	j_title = in_j_title,
    from_salary = in_from_salary,
    to_salary = in_to_salary,
    j_picture_link_1 = in_j_picture_link_1,
    j_picture_link_2 = in_j_picture_link_2,
    j_picture_link_3 = in_j_picture_link_3,
    j_picture_link_4 = in_j_picture_link_4,
    j_picture_link_5 = in_j_picture_link_5,
    j_picture_link_6 = in_j_picture_link_6,
    j_picture_link_7 = in_j_picture_link_7,
    j_picture_link_8 = in_j_picture_link_8,
    j_picture_link_9 = in_j_picture_link_9,
    j_picture_link_10 = in_j_picture_link_10,
    j_type_id = in_j_type_id,
    s_p_id = in_s_p_id,
    p_type_id = in_p_type_id,
    j_designation = in_j_designation,
	j_show_mo_no = in_j_show_mo_no,
    j_description = in_j_description,
	j_location = in_j_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE job_inventory_id = in_job_inventory_id AND user_id = in_user_id;
select * from bsapp_db.job_inventory_mast where job_inventory_id = in_job_inventory_id AND user_id = in_user_id;
END IF;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_package_inventory_mast_save_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_package_inventory_mast_save_update`(
)
BEGIN
  UPDATE bsapp_db.package_inventory_mast 
  SET bsapp_db.package_inventory_mast.is_active = 0
  WHERE bsapp_db.package_inventory_mast.end_date < now();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_purchase_ads_mast_save_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_purchase_ads_mast_save_update`(
)
BEGIN
  UPDATE bsapp_db.purchase_ads_mast 
  SET bsapp_db.purchase_ads_mast.is_active = 0
  WHERE bsapp_db.purchase_ads_mast.end_date_time < now();

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_type_mast_delete`(
	IN in_j_type_id INT
)
BEGIN
	DELETE FROM bsapp_db.job_type_mast WHERE j_type_id = in_j_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_type_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.job_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_job_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_job_type_mast_save`(
	IN in_j_type_id INT,
    IN in_j_type_name VARCHAR(126)
)
BEGIN
 IF NOT EXISTS(select j_type_id from bsapp_db.job_type_mast where j_type_id = in_j_type_id) THEN
 	INSERT INTO bsapp_db.job_type_mast
		(j_type_name,created_at)
	VALUES
		(in_j_type_name,now());
ELSE
	UPDATE bsapp_db.job_type_mast
	SET
	j_type_name = in_j_type_name,
    modified_at = now()
	WHERE j_type_id = in_j_type_id;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_likes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_likes`(
	IN in_ads_id INT,
    IN in_likes BOOLEAN
)
BEGIN

   UPDATE bsapp_db.ads_mast 
	SET
    likes = CASE WHEN in_likes = true  then  likes + 1 
                 WHEN in_likes = false  then   case when likes <= 0 then 0 else likes -1 END
    END
    WHERE ads_id = in_ads_id;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_login_sequence` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_login_sequence`()
BEGIN

DECLARE max_seq_id BIGINT;
SET max_seq_id =(select  max(seq_id)  + 1  from bsapp_db.login_sequence_mast where seq_date = CURDATE());
IF NOT EXISTS (SELECT seq_date FROM bsapp_db.login_sequence_mast WHERE seq_date = CURDATE()) THEN

	INSERT INTO bsapp_db.login_sequence_mast
		(seq_date,seq_id)
	VALUES
		(CURDATE(),(select concat((date_format(now(),'%y') * 10000 + date_format(now(),'%m') * 100 + date_format(now(),'%d')),'000001')));
	-- SELECT seq_id from bsapp_db.login_sequence_mast where seq_date = CURDATE();
    ELSE
		UPDATE bsapp_db.login_sequence_mast
		SET
        seq_id = max_seq_id
        WHERE seq_date = CURDATE();

	-- SELECT max_seq_id as seq_id;
END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_main_category_menu_web` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_main_category_menu_web`()
BEGIN
	SELECT SCM.id, SCM.cat_id, CM.cat_name, CM.cat_picture_link, CM.created_at, CM.modified_at, SCM.sub_cat_name
    FROM bsapp_db.category_mast CM
    LEFT JOIN 
    bsapp_db.sub_category_mast SCM 
	ON SCM.cat_id = CM.id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_brand_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_brand_mast_delete`(
   in in_brand_id int
)
BEGIN
   DELETE FROM bsapp_db.mobile_brand_mast where brand_id = in_brand_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_brand_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_brand_mast_fill`()
BEGIN
   SELECT * FROM bsapp_db.mobile_brand_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_brand_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_brand_mast_save`(
    in in_brand_id int,
    in in_brand_name varchar(126)
)
BEGIN
IF NOT EXISTS(select brand_id from bsapp_db.mobile_brand_mast where brand_id = in_brand_id) THEN
 	INSERT INTO bsapp_db.mobile_brand_mast
		(brand_name,created_at)
	VALUES
		(in_brand_name,now());
ELSE
   UPDATE bsapp_db.mobile_brand_mast
	SET
	brand_name = in_brand_name,
    modified_at = now()
	WHERE brand_id = in_brand_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_inventory_mast_delete`(
	IN in_mo_inventory_id INT,
	IN in_user_id VARCHAR(125)
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.mobile_inventory_mast MI  ON  AD.inventory_code= MI.mo_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_mo_inventory_id );
  DELETE FROM bsapp_db.mobile_inventory_mast WHERE mo_inventory_id = in_mo_inventory_id AND user_id = in_user_id ;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_inventory_mast_fill`(
   IN in_mo_inventory_code VARCHAR(126),
   IN in_cat_id INT
)
BEGIN
	SELECT 
		MI.mo_inventory_id, IFNULL(MI.mo_inventory_code, "-") as mo_inventory_code,
        IFNULL(MI.inventory_type, "-") as inventory_type, IFNULL(MI.mo_title, "-") as mo_title,
        IFNULL(BR.brand_name, "-") as brand_name, IFNULL(MI.model_name, "-") as model_name,
        IFNULL(RAM.value, "-") as mo_ram, IFNULL(ROM.value, "-") as mo_rom,
        IFNULL(MI.mo_colour, "-") as mo_colour, IFNULL(FORMAT(MI.mo_price, 0), "-") as mo_price,
        MI.mo_picture_link_1, MI.mo_picture_link_2, MI.mo_picture_link_3, MI.mo_picture_link_4, 
        MI.mo_picture_link_5, MI.mo_picture_link_6, MI.mo_picture_link_7, MI.mo_picture_link_8, 
        MI.mo_picture_link_9, MI.mo_picture_link_10, 
        IFNULL(MI.mo_front_camera, "-") as mo_front_camera, IFNULL(MI.mo_rear_camera, "-") as mo_rear_camera,
        IFNULL(MI.mo_battery, "-") as mo_battery, IFNULL(MI.mo_bill, "-") as mo_bill,
        IFNULL(mo_box, "-") as mo_box, IFNULL(MI.mo_charger, "-") as mo_charger,
        IFNULL(MI.mo_headset, "-") as mo_headset, IFNULL(MI.mo_warranty, "-") as mo_warranty,
        IFNULL(MI.insurance, "-") as insurance, IFNULL(MI.show_mo_no, "-") as show_mo_no,
        IFNULL(MI.description, "-") as description, IFNULL(MI.location, "-") as location,
        IFNULL(DATE_FORMAT(MI.created_at,'%d %b %y'), "-") as ad_created, IFNULL(MI.modified_at, "-") as modified_at,
        IFNULL(UM.profile_picture_link, "-") as profile_picture, IFNULL(UM.name, "-") as user_name,
        IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
        IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name, 
        IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
	FROM bsapp_db.mobile_inventory_mast MI  
    LEFT JOIN bsapp_db.mobile_brand_mast BR  ON  MI.brand_id = BR.brand_id 
	LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
	LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
    LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = MI.mo_inventory_code 
	LEFT JOIN bsapp_db.user_mast UM ON UM.user_id = MI.user_id
	LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
    LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
    WHERE MI.mo_inventory_code = in_mo_inventory_code AND MI.cat_id = in_cat_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_inventory_mast_save`(
		IN in_mo_inventory_id INT,
		IN in_user_id VARCHAR(125),
		IN in_mo_title VARCHAR(126),
		IN in_brand_id INT,
		IN in_model_name VARCHAR(126),
		IN in_mo_ram  INT,
		IN in_mo_rom INT,
		IN in_mo_colour VARCHAR(45),
		IN in_mo_price INT,
		IN in_mo_picture_link_1 VARCHAR(512),
		IN in_mo_picture_link_2 VARCHAR(512),
		IN in_mo_picture_link_3 VARCHAR(512),
		IN in_mo_picture_link_4 VARCHAR(512),
		IN in_mo_picture_link_5 VARCHAR(512),
		IN in_mo_picture_link_6 VARCHAR(512),
		IN in_mo_picture_link_7 VARCHAR(512),
		IN in_mo_picture_link_8 VARCHAR(512),
		IN in_mo_picture_link_9 VARCHAR(512),
		IN in_mo_picture_link_10 VARCHAR(512),
		IN in_mo_front_camera VARCHAR(126),
		IN in_mo_rear_camera VARCHAR(126),
		IN in_mo_battery VARCHAR(45),
		IN in_mo_bill BOOLEAN,
		IN in_mo_box BOOLEAN,
		IN in_mo_charger BOOLEAN,
		IN in_mo_headset BOOLEAN,
		IN in_mo_warranty BOOLEAN,
		IN in_insurance BOOLEAN,
		IN in_show_mo_no BOOLEAN,
		IN in_description VARCHAR(512),
		IN in_location VARCHAR(512),
        IN in_latitude DECIMAL(11,8),
		IN in_longitude DECIMAL(11,8),
		IN in_cat_id INT,
		IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;
select COALESCE(MAX(mo_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.mobile_inventory_mast;

IF NOT EXISTS(select mo_inventory_id from bsapp_db.mobile_inventory_mast where mo_inventory_id = in_mo_inventory_id AND user_id = in_user_id) THEN
 	INSERT INTO bsapp_db.mobile_inventory_mast
		(mo_inventory_id,user_id,mo_inventory_code,mo_title,brand_id,model_name,mo_ram,mo_rom,mo_colour,mo_price,mo_picture_link_1,mo_picture_link_2,mo_picture_link_3,mo_picture_link_4,mo_picture_link_5,mo_picture_link_6,mo_picture_link_7,mo_picture_link_8,mo_picture_link_9,mo_picture_link_10,mo_front_camera,mo_rear_camera,mo_battery,mo_bill,mo_box,mo_charger,mo_headset,mo_warranty,insurance,show_mo_no,description,location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
		(get_max_inventory_id,in_user_id,concat("mobile_",get_max_inventory_id),in_mo_title,in_brand_id,in_model_name,in_mo_ram,in_mo_rom,in_mo_colour,in_mo_price,in_mo_picture_link_1,in_mo_picture_link_2,in_mo_picture_link_3,in_mo_picture_link_4,in_mo_picture_link_5,in_mo_picture_link_6,in_mo_picture_link_7,in_mo_picture_link_8,in_mo_picture_link_9,in_mo_picture_link_10,in_mo_front_camera,in_mo_rear_camera,in_mo_battery,in_mo_bill,in_mo_box,in_mo_charger,in_mo_headset,in_mo_warranty,in_insurance,in_show_mo_no,in_description,in_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("mobile_",get_max_inventory_id),"mobile",1);
	select * from bsapp_db.mobile_inventory_mast where mo_inventory_id = get_max_inventory_id AND user_id = in_user_id;
ELSE
   UPDATE bsapp_db.mobile_inventory_mast
	SET
	mo_title = mo_title,
    brand_id = in_brand_id,
    model_name = in_model_name,
    mo_ram = in_mo_ram,
    mo_rom = in_mo_rom,
    mo_colour = in_mo_colour,
    mo_price = in_mo_price,
    mo_picture_link_1 = in_mo_picture_link_1,
    mo_picture_link_2 = in_mo_picture_link_2,
    mo_picture_link_3 = in_mo_picture_link_3,
    mo_picture_link_4 = in_mo_picture_link_4,
    mo_picture_link_5 = in_mo_picture_link_5,
    mo_picture_link_6 = in_mo_picture_link_6,
    mo_picture_link_7 = in_mo_picture_link_7,
    mo_picture_link_8 = in_mo_picture_link_8,
    mo_picture_link_9 = in_mo_picture_link_9,
    mo_picture_link_10 = in_mo_picture_link_10,
    mo_front_camera = in_mo_front_camera,
    mo_rear_camera = in_mo_rear_camera,
    mo_battery = in_mo_battery,    
    mo_bill = in_mo_bill,
    mo_box = in_mo_box,
    mo_charger = in_mo_charger,
    mo_headset = in_mo_headset,
    mo_warranty = in_mo_warranty,
    insurance = in_insurance,
    show_mo_no = in_show_mo_no,
    description = in_description,
    location = in_location,
    latitude = in_latitude,
    longitude = in_longitude,    
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE mo_inventory_id = in_mo_inventory_id AND user_id = in_user_id;
	select * from bsapp_db.mobile_inventory_mast WHERE mo_inventory_id = in_mo_inventory_id AND user_id = in_user_id;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_ram_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_ram_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.mobile_ram_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_ram_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_ram_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.mobile_ram_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_ram_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_ram_mast_save`(
	IN in_id INT,
    IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.mobile_ram_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.mobile_ram_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.mobile_ram_mast 
        SET 
        value = in_value,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_rom_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_rom_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.mobile_rom_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_rom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_rom_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.mobile_rom_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_mobile_rom_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_mobile_rom_mast_save`(
	IN in_id INT,
    IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.mobile_rom_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.mobile_rom_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.mobile_rom_mast
        SET
        value = in_value,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_my_purchase_ads_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_my_purchase_ads_mast_fill`(
	IN in_user_id VARCHAR(125),
    IN in_is_active INT
)
BEGIN
	SELECT pa.id, pa.user_id, c.cat_name, pa.pkt_id,pkg.package_days,pkg.message, pa.price, pa.is_active, pa.total_ad, pa.use_ad, pa.ava_ad, pa.start_date_time, pa.end_date_time, pa.created_at
    FROM bsapp_db.purchase_ads_mast pa
    LEFT JOIN bsapp_db.package_price_mast pkg ON pa.pkt_id = pkg.id
    LEFT JOIN bsapp_db.category_mast c ON pkg.cat_id = c.id 
    WHERE user_id = in_user_id AND pa.is_active = in_is_active;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_near_by_location_category_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_near_by_location_category_data`(
	IN in_cat_id INT,
    IN in_sub_cat_id  varchar(125),
    IN in_limit INT,
    IN in_page_no INT,
    IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
    IN in_price_from INT,
    IN in_price_to INT,
    IN in_brand_id VARCHAR(126),
    IN in_job_salary_from INT,
    IN in_job_salary_to INT,
    IN in_distance_from INT,
    IN in_distance_to INT,
    IN in_distance_sorting VARCHAR(126),
    IN in_date_sorting VARCHAR(126),
    IN in_price_sorting VARCHAR(126),
    IN in_sponser_near_by_location_category BOOLEAN
)
BEGIN
	CASE WHEN in_sponser_near_by_location_category = true 
    THEN
    call bsapp_db.sp_sponcer_near_by_location_category_show(in_cat_id,in_sub_cat_id,in_limit,in_page_no,in_latitude,in_longitude,in_price_from,in_price_to,in_brand_id,in_job_salary_from,in_job_salary_to,in_distance_from,in_distance_to,in_distance_sorting,in_date_sorting,in_price_sorting);
    ELSE
    call bsapp_db.sp_show_category_data(in_cat_id,in_sub_cat_id,in_limit,in_page_no,in_latitude,in_longitude,in_price_from,in_price_to,in_brand_id,in_job_salary_from,in_job_salary_to,in_distance_from,in_distance_to,in_distance_sorting,in_date_sorting,in_price_sorting);
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_near_by_location_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_near_by_location_data`(
	IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
    IN in_from INT,
    IN in_to INT,
    IN in_limit INT,
    IN in_page_no INT,
    IN in_sponser_near_by_location BOOLEAN
)
BEGIN
	CASE WHEN in_sponser_near_by_location = true 
    THEN
    call bsapp_db.sp_sponcer_near_by_location_show(in_latitude,in_longitude,in_from,in_to,in_limit,in_page_no);
    ELSE
    call bsapp_db.sp_near_by_location_show(in_latitude,in_longitude,in_from,in_to,in_limit,in_page_no);
    END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_near_by_location_show` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_near_by_location_show`(
    IN in_latitude DECIMAL(11, 8),
    IN in_longitude DECIMAL(11, 8),
    IN in_from INT,
    IN in_to INT,
    IN in_limit INT,
    IN in_page_no INT
)
BEGIN DECLARE in_offset INT;

SET
    in_offset = (in_page_no - 1) * in_limit;

select *, count(*) over() AS total_record from
    (
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                CS.c_picture_link_1 as Image,
                CS.car_title as Name,
                CS.c_price as Price,
                0 as from_salary,
                0 as to_salary,
                CS.c_location as location,
                DATE_FORMAT(CS.created_at, '%d %b %y') as Create_Date,
                CS.modified_at as Modify_Date,
                CASE
                    WHEN CS.modified_at > CS.created_at THEN CS.modified_at
                    ELSE CS.created_at
                END AS ORDER_DATE,
                SM.state_name AS car_registration_state,
                CS.c_km AS car_km,
                CO.name AS owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                YM.value as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.car_sell_inventory_mast AS CS
                LEFT JOIN bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON CS.car_sell_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
                LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
                LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
                LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
                LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
            WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                AI.picture_link_1 as Image,
                AI.title as Name,
                AI.price as Price,
                0 as from_salary,
                0 as to_salary,
                AI.location as location,
                DATE_FORMAT(AI.created_at, '%d %b %y') as Create_Date,
                AI.modified_at as Modify_Date,
                CASE
                    WHEN AI.modified_at > AI.created_at THEN AI.modified_at
                    ELSE AI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.all_inventory_mast AS AI
                LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON AI.inventory_type = AD.inventory_type
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
            WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                CR.c_picture_link_1 as Image,
                CR.car_title as Name,
                CR.c_price as Price,
                0 as from_salary,
                0 as to_salary,
                CR.c_location as location,
                DATE_FORMAT(CR.created_at, '%d %b %y') as Create_Date,
                CR.modified_at as Modify_Date,
                CASE
                    WHEN CR.modified_at > CR.created_at THEN CR.modified_at
                    ELSE CR.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                c_km_limit as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.car_rent_inventory_mast CR
                LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON CR.car_rent_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
            WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                JI.j_picture_link_1 as Image,
                JI.j_title as Name,
                0 as price,
                JI.from_salary as From_salary,
                JI.to_salary as To_salary,
                JI.j_location as location,
                DATE_FORMAT(JI.created_at, '%d %b %y') as Create_Date,
                JI.modified_at as Modify_Date,
                CASE
                    WHEN JI.modified_at > JI.created_at THEN JI.modified_at
                    ELSE JI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                0 as year_of_registration,
                0 as vehicle_km,
                JT.j_type_name as Job_type,
                SP.s_p_name as Job_salary_period
            FROM
                bsapp_db.job_inventory_mast JI
                LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
                LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
                LEFT JOIN bsapp_db.ads_mast AD ON JI.job_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
            WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                MI.mo_picture_link_1 as Image,
                MI.mo_title as Name,
                MI.mo_price as Price,
                0 as from_salary,
                0 as to_salary,
                MI.location as location,
                DATE_FORMAT(MI.created_at, '%d %b %y') as Create_Date,
                MI.modified_at as Modify_Date,
                CASE
                    WHEN MI.modified_at > MI.created_at THEN MI.modified_at
                    ELSE MI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                RAM.value AS Mobile_ram,
                ROM.value AS Mobile_rom,
                BR.brand_name AS Mobile_brand,
                MI.mo_colour AS Mobile_colour,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.mobile_inventory_mast MI
                LEFT JOIN bsapp_db.mobile_brand_mast BR ON MI.brand_id = BR.brand_id
                LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON MI.mo_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
                LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
            WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                OI.o_picture_link_1 as Image,
                OI.o_title as Name,
                OI.o_price as Price,
                0 as from_salary,
                0 as to_salary,
                OI.o_location as location,
                DATE_FORMAT(OI.created_at, '%d %b %y') as Create_Date,
                OI.modified_at as Modify_Date,
                CASE
                    WHEN OI.modified_at > OI.created_at THEN OI.modified_at
                    ELSE OI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                OC.value as Cabin,
                OW.value as Washroom,
                OI.o_sq_ft as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.office_inventory_mast OI
                LEFT JOIN bsapp_db.office_cabin_mast OC ON OI.cabin = OC.id
                LEFT JOIN bsapp_db.office_washroom_mast OW ON OI.washroom = OW.id
                LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
                LEFT JOIN bsapp_db.property_furnishing_mast PF ON OI.p_furnishing_id = PF.p_furnishing_id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON OI.office_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
                  WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
				AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                PI.p_picture_link_1 as Image,
                PI.p_title as Name,
                PI.p_price as Price,
                0 as from_salary,
                0 as to_salary,
                PI.p_location as location,
                DATE_FORMAT(PI.created_at, '%d %b %y') as Create_Date,
                PI.modified_at as Modify_Date,
                CASE
                    WHEN PI.modified_at > PI.created_at THEN PI.modified_at
                    ELSE PI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                BED.value as Bedroom,
                BAT.value as Bathroom,
                0 as Cabin,
                0 as Washroom,
                PI.p_sq_ft as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.property_inventory_mast PI
                LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
                LEFT JOIN bsapp_db.property_bathroom_mast BAT ON PI.p_bathroom = BAT.id
                LEFT JOIN bsapp_db.property_bedroom_mast BED ON PI.p_bedroom = BED.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON PI.property_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
            WHERE
                AD.ad_status_id = 2
        )
        UNION
        (
            SELECT
                AD.ads_id AS Ads_id,
                AD.inventory_id AS Inventory_id,
                AD.user_id AS User_id,
                AD.inventory_code AS Inventory_code,
                AD.inventory_type AS Inventory_type,
                DATE_FORMAT(AD.from_date, '%d %b %y') AS From_date,
                DATE_FORMAT(AD.to_date, '%d %b %y') AS To_date,
                ADS.ad_status_id AS Ad_status_code,
                ADS.ad_status AS Ad_status,
                ADS.ad_status_message AS Ad_status_message,
                AD.likes AS likes,
                AD.views AS views,
                AD.created_at AS Created_date,
                DATE_FORMAT(AD.created_at, '%d %b %y') AS Ad_created_date,
                DATE_FORMAT(AD.modified_at, '%d %b %y') AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                VI.v_picture_link_1 as Image,
                VI.v_title as Name,
                VI.v_price as Price,
                0 as from_salary,
                0 as to_salary,
                VI.v_location as location,
                DATE_FORMAT(VI.created_at, '%d %b %y') as Create_Date,
                VI.modified_at as Modify_Date,
                CASE
                    WHEN VI.modified_at > VI.created_at THEN VI.modified_at
                    ELSE VI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' as Mobile_ram,
                '' as Mobile_rom,
                '' AS Mobile_brand,
                '' AS Mobile_colour,
                YM.value as year_of_registration,
                VI.kms as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.vehicle_inventory_mast VI
                LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id
                LEFT JOIN bsapp_db.ads_mast AD ON VI.vehicle_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.ad_status_mast ADS ON AD.ad_status_id = ADS.ad_status_id
            WHERE
                AD.ad_status_id = 2
        )
    ) AS SUBQ
ORDER BY
    ORDER_DATE DESC
limit
    in_limit offset in_offset;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_notification_subscribe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_notification_subscribe`(
	IN in_device_token_id INT,
    IN in_subscribe BOOLEAN
)
BEGIN
   UPDATE bsapp_db.device_token_mast
	SET
	subscribe = in_subscribe,
    modified_at = now()
	WHERE id = in_device_token_id;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_cabin_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_cabin_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_cabin_mast WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_cabin_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_cabin_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_cabin_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_cabin_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_cabin_mast_save`(
	IN in_id INT,
	IN in_value INT
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_cabin_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_cabin_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.office_cabin_mast
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_car_parking_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_car_parking_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_car_parking_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_car_parking_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_car_parking_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_car_parking_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_car_parking_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_car_parking_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_car_parking_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_car_parking_mast (value) VALUES (in_value);
	ELSE
		UPDATE bsapp_db.office_car_parking_mast SET value = in_value WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_employee_capacity_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_employee_capacity_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_employee_capacity_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_employee_capacity_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_employee_capacity_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_employee_capacity_mast ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_employee_capacity_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_employee_capacity_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(255)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_employee_capacity_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_employee_capacity_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.office_employee_capacity_mast 
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_furnishing_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_furnishing_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_furnishing_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_furnishing_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_furnishing_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_furnishing_mast ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_furnishing_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_furnishing_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(255)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_furnishing_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_furnishing_mast (value) VALUES (in_value);
	ELSE
		UPDATE bsapp_db.office_furnishing_mast SET value = in_value WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_inventory_mast_delete`(
		IN in_office_inventory_id INT,
        IN in_user_id VARCHAR(125)
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.office_inventory_mast OI  ON  AD.inventory_code= OI.office_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_office_inventory_id );
        DELETE FROM bsapp_db.office_inventory_mast WHERE office_inventory_id = in_office_inventory_id AND user_id = in_user_id;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_inventory_mast_fill`(
		IN in_office_inventory_code VARCHAR(126),
        IN in_cat_id INT
)
BEGIN
        SELECT OI.office_inventory_id, IFNULL(OI.office_inventory_code, "-") as office_inventory_code,
			IFNULL(OI.user_id, "-") as user_id, IFNULL(OI.o_title, "-") as o_title,
			IFNULL(PT.p_type_name, "-") as p_type_name, IFNULL(OI.p_name, "-") as p_name,
            IFNULL(OC.value, "-") as cabin, IFNULL(OW.value, "-") as washroom,
            IFNULL(OI.o_sq_ft, "-") as o_sq_ft, IFNULL(FORMAT(OI.o_price, 0), "-") as o_price,
            OI.o_picture_link_1, OI.o_picture_link_2, OI.o_picture_link_3, OI.o_picture_link_4, 
            OI.o_picture_link_5, OI.o_picture_link_6, OI.o_picture_link_7, OI.o_picture_link_8,
            OI.o_picture_link_9, OI.o_picture_link_10, 
            IFNULL(PF.p_furnishing_name, "-") as p_furnishing_name, IFNULL(PC.p_car_parking_name, "-") as p_car_parking_name,
            IFNULL(OI.o_sup_builtup_area, "-") as o_sup_builtup_area, IFNULL(OI.o_carpet_area, "-") as o_carpet_area,
            IFNULL(PL.p_listed_by_name, "-") as p_listed_by_name, IFNULL(OEC.value, "-") as employee_capacity,
            IFNULL(FORMAT(OI.o_maintenance, 0), "-") as o_maintenance, IFNULL(OI.o_show_mo_no, "-") as o_show_mo_no,
            IFNULL(OI.o_description, "-") as o_description, IFNULL(OI.o_location, "-") as o_location,
            IFNULL(DATE_FORMAT(OI.created_at,'%d %b %y'), "-") as ad_created,
            IFNULL(OI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture,
            IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
			IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name, 
            IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
        FROM bsapp_db.office_inventory_mast OI
        LEFT JOIN bsapp_db.office_cabin_mast  OC  ON  OI.cabin =OC.id
        LEFT JOIN bsapp_db.office_washroom_mast  OW  ON  OI.washroom =OW.id
        LEFT JOIN bsapp_db.property_type_mast  PT  ON  OI.p_type_id =PT.p_type_id
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  OI.p_furnishing_id =PF.p_furnishing_id
        LEFT JOIN bsapp_db.property_car_parking_mast  PC  ON  OI.p_car_parking_id =PC.p_car_parking_id
        LEFT JOIN bsapp_db.property_listed_by_mast  PL  ON  OI.p_listed_by_id =PL.p_listed_by_id
		LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.office_employee_capacity_mast OEC ON OI.employee_capacity = OEC.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = OI.office_inventory_code 
        LEFT JOIN bsapp_db.user_mast UM ON UM.user_id = OI.user_id
        WHERE OI.office_inventory_code = in_office_inventory_code AND OI.cat_id = in_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_inventory_mast_save`(
        IN in_office_inventory_id INT,
        IN in_user_id VARCHAR(125),
		IN in_o_title VARCHAR(126),
		IN in_p_type_id INT,
        IN in_p_name VARCHAR(126),
        IN in_cabin INT,
        IN in_washroom INT,
        IN in_o_sq_ft DECIMAL(12,6),
        IN in_o_price INT,
		IN in_o_picture_link_1 VARCHAR(512),
		IN in_o_picture_link_2 VARCHAR(512),
		IN in_o_picture_link_3 VARCHAR(512),
		IN in_o_picture_link_4 VARCHAR(512),
		IN in_o_picture_link_5 VARCHAR(512),
		IN in_o_picture_link_6 VARCHAR(512),
		IN in_o_picture_link_7 VARCHAR(512),
		IN in_o_picture_link_8 VARCHAR(512),
		IN in_o_picture_link_9 VARCHAR(512),
		IN in_o_picture_link_10 VARCHAR(512),
		IN in_p_furnishing_id INT,
        IN in_p_car_parking_id INT,
        IN in_o_sup_builtup_area DECIMAL(12,6),
        IN in_o_carpet_area DECIMAL(12,6),
        IN in_p_listed_by_id INT,		
		IN in_employee_capacity INT,
		IN in_o_maintenance INT,
		IN in_o_show_mo_no BOOLEAN,
        IN in_o_description VARCHAR(512),
		IN in_o_location VARCHAR(512),
        IN in_latitude DECIMAL(11,8),
		IN in_longitude DECIMAL(11,8),
		IN in_cat_id INT,
		IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;
select COALESCE(MAX(office_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.office_inventory_mast;

IF NOT EXISTS(select office_inventory_id from bsapp_db.office_inventory_mast where office_inventory_id = in_office_inventory_id AND user_id = in_user_id) THEN
 	INSERT INTO bsapp_db.office_inventory_mast
		(office_inventory_id,user_id,office_inventory_code,o_title,p_type_id,p_name,cabin,washroom,o_sq_ft,o_price,o_picture_link_1,o_picture_link_2,o_picture_link_3,o_picture_link_4,o_picture_link_5,o_picture_link_6,o_picture_link_7,o_picture_link_8,o_picture_link_9,o_picture_link_10,p_furnishing_id,p_car_parking_id,o_sup_builtup_area,o_carpet_area,p_listed_by_id,employee_capacity,o_maintenance,o_show_mo_no,o_description,o_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
		(get_max_inventory_id,in_user_id,concat("office_",get_max_inventory_id),in_o_title,in_p_type_id,in_p_name,in_cabin,in_washroom,in_o_sq_ft,in_o_price,in_o_picture_link_1,in_o_picture_link_2,in_o_picture_link_3,in_o_picture_link_4,in_o_picture_link_5,in_o_picture_link_6,in_o_picture_link_7,in_o_picture_link_8,in_o_picture_link_9,in_o_picture_link_10,in_p_furnishing_id,in_p_car_parking_id,in_o_sup_builtup_area,in_o_carpet_area,in_p_listed_by_id,in_employee_capacity,in_o_maintenance,in_o_show_mo_no,in_o_description,in_o_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("office_",get_max_inventory_id),"office",1);
select * from bsapp_db.office_inventory_mast where office_inventory_id = get_max_inventory_id AND user_id = in_user_id;
ELSE
   UPDATE bsapp_db.office_inventory_mast
	SET
	o_title = in_o_title,
    p_type_id = in_p_type_id,
    p_name = in_p_name,
    cabin = in_cabin,
    washroom = in_washroom,
    o_sq_ft = in_o_sq_ft,
    o_price = in_o_price,
    o_picture_link_1 = in_o_picture_link_1,
    o_picture_link_2 = in_o_picture_link_2,
    o_picture_link_3 = in_o_picture_link_3,
    o_picture_link_4 = in_o_picture_link_4,
    o_picture_link_5 = in_o_picture_link_5,
    o_picture_link_6 = in_o_picture_link_6,
    o_picture_link_7 = in_o_picture_link_7,
    o_picture_link_8 = in_o_picture_link_8,
    o_picture_link_9 = in_o_picture_link_9,
    o_picture_link_10 = in_o_picture_link_10,
    p_furnishing_id = in_p_furnishing_id,
    p_car_parking_id = in_p_car_parking_id,
    o_sup_builtup_area = in_o_sup_builtup_area,
    o_carpet_area = in_o_carpet_area,
    p_listed_by_id =in_p_listed_by_id,
    employee_capacity = in_employee_capacity,
    o_maintenance = in_o_maintenance,
    o_show_mo_no = in_o_show_mo_no,
    o_description = in_o_description,
    o_location = in_o_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE office_inventory_id = in_office_inventory_id AND user_id = in_user_id;
select * from bsapp_db.office_inventory_mast where office_inventory_id = in_office_inventory_id AND user_id = in_user_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_listed_by_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_listed_by_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_listed_by_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_listed_by_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_listed_by_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_listed_by_mast ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_listed_by_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_listed_by_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_listed_by_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_listed_by_mast (value) VALUES (in_value);
	ELSE
		UPDATE bsapp_db.office_listed_by_mast SET value = in_value WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_type_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_type_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_type_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_type_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_type_mast_save`(
	IN in_id INT,
	IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_type_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_type_mast (value) VALUES (in_value);
	ELSE
		UPDATE bsapp_db.office_type_mast SET value = in_value WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_washroom_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_washroom_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.office_washroom_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_washroom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_washroom_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.office_washroom_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_office_washroom_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_office_washroom_mast_save`(
	IN in_id INT,
	IN in_value INT
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.office_washroom_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.office_washroom_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.office_washroom_mast 
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_package_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_package_inventory_mast_fill`(
	IN in_user_id VARCHAR(125)
)
BEGIN
	SELECT * FROM bsapp_db.package_inventory_mast WHERE user_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_package_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_package_inventory_mast_save`(
    IN in_user_id VARCHAR(125),
    IN in_inventory_code VARCHAR(126),
    IN in_inventory_type VARCHAR(126),
    IN in_purchase_ads_id INT
)
BEGIN

declare pktid INT;
declare packagday INT;

   
    select pkt_id into pktid from bsapp_db.purchase_ads_mast where id = in_purchase_ads_id;
    select package_days into packagday from bsapp_db.package_price_mast where id = pktid;
    
	UPDATE bsapp_db.purchase_ads_mast 
    SET 
	use_ad = use_ad + 1,
	ava_ad = ava_ad - 1
	WHERE id = in_purchase_ads_id AND user_id = in_user_id AND is_active = 1 AND ava_ad > 0;

    IF(ROW_COUNT() > 0) THEN 
    
		INSERT INTO bsapp_db.package_inventory_mast 
		(user_id, inventory_code, inventory_type, purchase_ads_id, created_at,start_date,end_date )
		VALUES (in_user_id, in_inventory_code, in_inventory_type, in_purchase_ads_id, now(),now(), ADDDATE(now(), INTERVAL packagday DAY));
        SELECT "SUCCESS" as MSG;
	ELSE
		SELECT "DON'T HAVE ENOUGH ADS OR THEY ARE EXPIRED" as MSG;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_package_price_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_package_price_mast_delete`(
   IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.package_price_mast WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_package_price_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_package_price_mast_fill`(
	IN in_cat_id INT
)
BEGIN
	SELECT * FROM bsapp_db.package_price_mast WHERE cat_id = in_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_package_price_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_package_price_mast_save`(
	IN in_id INT,
    IN in_package_days INT,
    IN in_total_ads INT,
    IN in_package_price INT,
    IN in_cat_id INT,
    IN in_message VARCHAR(126),
    IN in_total_month INT
)
BEGIN
IF NOT EXISTS(SELECT id FROM bsapp_db.package_price_mast WHERE id = in_id) THEN
 	INSERT INTO bsapp_db.package_price_mast
		(package_days,total_ads,package_price,created_at,cat_id,message,total_month)
	VALUES
		(in_package_days,in_total_ads,in_package_price,now(),in_cat_id,in_message,in_total_month);
ELSE
   UPDATE bsapp_db.package_price_mast
	SET
	package_days = in_package_days,
    total_ads = in_total_ads,
    package_price = in_package_price,
    modified_at = now(),
    cat_id = in_cat_id,
    message = in_message,
    total_month = in_total_month
	WHERE id = in_id;	
 END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_position_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_position_type_mast_delete`(
	IN in_p_type_id INT
)
BEGIN
	DELETE FROM bsapp_db.position_type_mast WHERE p_type_id = in_p_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_position_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_position_type_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.position_type_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_position_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_position_type_mast_save`(
	IN in_p_type_id INT,
    IN in_p_type_name VARCHAR(126)
)
BEGIN
 IF NOT EXISTS(select p_type_id from bsapp_db.position_type_mast where p_type_id = in_p_type_id) THEN
 	INSERT INTO bsapp_db.position_type_mast
		(p_type_name,created_at)
	VALUES
		(in_p_type_name,now());
ELSE
   UPDATE bsapp_db.position_type_mast
	SET
	p_type_name = in_p_type_name,
    modified_at = now()
	WHERE p_type_id = in_p_type_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_product_detail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_product_detail`(
	 IN in_inventory_code VARCHAR(126),
	 IN in_cat_id INT
)
BEGIN
CASE WHEN in_inventory_code = (select all_inventory_code FROM bsapp_db.all_inventory_mast WHERE all_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_all_inventory_mast_fill(in_inventory_code,in_cat_id);

		WHEN in_inventory_code = (select car_rent_inventory_code FROM bsapp_db.car_rent_inventory_mast WHERE car_rent_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_car_rent_inventory_mast_fill(in_inventory_code,in_cat_id);
            
		WHEN in_inventory_code = (select car_sell_inventory_code FROM bsapp_db.car_sell_inventory_mast WHERE car_sell_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_car_sell_inventory_mast_fill(in_inventory_code,in_cat_id);
            
		WHEN in_inventory_code = (select job_inventory_code FROM bsapp_db.job_inventory_mast WHERE job_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_job_inventory_mast_fill(in_inventory_code,in_cat_id);
            
        WHEN in_inventory_code = (select mo_inventory_code FROM bsapp_db.mobile_inventory_mast WHERE mo_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_mobile_inventory_mast_fill(in_inventory_code,in_cat_id); 
        
        WHEN in_inventory_code = (select office_inventory_code FROM bsapp_db.office_inventory_mast WHERE office_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_office_inventory_mast_fill(in_inventory_code,in_cat_id); 
            
        WHEN in_inventory_code = (select property_inventory_code FROM bsapp_db.property_inventory_mast WHERE property_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_property_inventory_rent_mast_fill(in_inventory_code,in_cat_id); 

         WHEN in_inventory_code = (select vehicle_inventory_code FROM bsapp_db.vehicle_inventory_mast WHERE vehicle_inventory_code = in_inventory_code AND cat_id =in_cat_id) THEN
			call bsapp_db.sp_bike_inventory_mast_fill(in_inventory_code,in_cat_id); 
        
        ELSE BEGIN END;
END CASE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_bathroom_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_bathroom_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.property_bathroom_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_bathroom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_bathroom_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.property_bathroom_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_bathroom_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_bathroom_mast_save`(
	IN in_id INT,
	IN in_value INT
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.property_bathroom_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.property_bathroom_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.property_bathroom_mast
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_bedroom_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_bedroom_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.property_bedroom_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_bedroom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_bedroom_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.property_bedroom_mast; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_bedroom_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_bedroom_mast_save`(
	IN in_id INT,
	IN in_value INT
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.property_bedroom_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.property_bedroom_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.property_bedroom_mast
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_car_parking_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_car_parking_mast_delete`(
  IN in_p_car_parking_id INT
)
BEGIN
    DELETE  FROM bsapp_db.property_car_parking_mast WHERE p_car_parking_id = in_p_car_parking_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_car_parking_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_car_parking_mast_fill`()
BEGIN
    	SELECT * FROM bsapp_db.property_car_parking_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_car_parking_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_car_parking_mast_save`(
  IN in_p_car_parking_id INT,
  IN in_p_car_parking_name VARCHAR(126)
)
BEGIN
IF NOT EXISTS(select p_car_parking_id from bsapp_db.property_car_parking_mast where p_car_parking_id = in_p_car_parking_id) THEN
 	INSERT INTO bsapp_db.property_car_parking_mast
		(p_car_parking_name,created_at)
	VALUES
		(in_p_car_parking_name,now());
ELSE
   UPDATE bsapp_db.property_car_parking_mast
	SET
	p_car_parking_name = in_p_car_parking_name,
    modified_at = now()
	WHERE p_car_parking_id = in_p_car_parking_id;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_furnishing_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_furnishing_mast_delete`(
	IN in_p_furnishing_id INT
)
BEGIN
	DELETE FROM bsapp_db.property_furnishing_mast WHERE p_furnishing_id = in_p_furnishing_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_furnishing_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_furnishing_mast_fill`()
BEGIN
		SELECT * FROM bsapp_db.property_furnishing_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_furnishing_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_furnishing_mast_save`(
	IN in_p_furnishing_id INT,
    IN in_p_furnishing_name VARCHAR(126)
)
BEGIN
IF NOT EXISTS(select p_furnishing_id from bsapp_db.property_furnishing_mast where p_furnishing_id = in_p_furnishing_id) THEN
 	INSERT INTO bsapp_db.property_furnishing_mast
		(p_furnishing_name,created_at)
	VALUES
		(in_p_furnishing_name,now());
ELSE
   UPDATE bsapp_db.property_furnishing_mast
	SET
	p_furnishing_name = in_p_furnishing_name,
    modified_at = now()
	WHERE p_furnishing_id = in_p_furnishing_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_inventory_rent_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_inventory_rent_mast_delete`(
  IN in_property_inventory_id INT,
  IN in_user_id VARCHAR(125)
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.property_inventory_mast PI  ON  AD.inventory_code= PI.property_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_property_inventory_id );
   DELETE FROM  bsapp_db.property_inventory_mast WHERE property_inventory_id = in_property_inventory_id AND user_id = in_user_id;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_inventory_rent_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_inventory_rent_mast_fill`(
        IN in_property_inventory_code  VARCHAR(126),
        IN in_cat_id INT
)
BEGIN
declare code varchar(20);
set code = (SELECT SUBSTRING(in_property_inventory_code, 10, 4) as code);

	IF(code = 'rent') THEN
        SELECT PI.property_inventory_id, IFNULL(PI.user_id, "-") as user_id, 
        IFNULL(PI.property_inventory_code, "-") as property_inventory_code, IFNULL(PI.p_title, "-") as p_title, 
        IFNULL(PT.p_type_name, "-") as p_type_name, IFNULL(PI.p_name, "-") as p_name, 
        IFNULL(BED.value, "-") as p_bedroom, IFNULL(BAT.value, "-") as p_bathroom, 
        IFNULL(PI.p_sq_ft, "-") as p_sq_ft, IFNULL(FORMAT(PI.p_price, 0), "-") as p_price, 
        PI.p_picture_link_1, PI.p_picture_link_2, PI.p_picture_link_3, PI.p_picture_link_4, PI.p_picture_link_5,
        PI.p_picture_link_6, PI.p_picture_link_7, PI.p_picture_link_8, PI.p_picture_link_9, PI.p_picture_link_10, 
        IFNULL(PF.p_furnishing_name, "-") as p_furnishing_name, IFNULL(PC.p_car_parking_name, "-") as p_car_parking_name, 
        IFNULL(PI.p_sup_builtup_area, "-") as p_sup_builtup_area, IFNULL(PI.p_carpet_area, "-") as p_carpet_area, 
        IFNULL(PL.p_listed_by_name, "-") as p_listed_by_name, IFNULL(PR.p_preferred_renters_name, "-") as p_preferred_renters_name, 
        IFNULL(PI.p_maintenance, "-") as p_maintenance, IFNULL(PI.p_show_mo_no, "-") as p_show_mo_no, 
        IFNULL(PI.p_description, "-") as p_description, IFNULL(PI.p_location, "-") as p_location, 
        IFNULL(DATE_FORMAT(PI.created_at,'%d %b %y'), "-") as ad_created, 
        IFNULL(PI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture , 
        IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
        IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name, 
        IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id        
        FROM bsapp_db.property_inventory_mast PI
        LEFT JOIN bsapp_db.property_type_mast  PT  ON  PI.p_type_id =PT.p_type_id
        LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
        LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  PI.p_furnishing_id =PF.p_furnishing_id
        LEFT JOIN bsapp_db.property_car_parking_mast  PC  ON  PI.p_car_parking_id =PC.p_car_parking_id
        LEFT JOIN bsapp_db.property_listed_by_mast  PL  ON  PI.p_listed_by_id =PL.p_listed_by_id
		LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.property_preferred_renters_mast  PR  ON  PI.p_preferred_renters_id =PR.p_preferred_renters_id 
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = PI.property_inventory_code 
        LEFT JOIN bsapp_db.user_mast UM ON UM.user_id = PI.user_id
        WHERE PI.property_inventory_code = in_property_inventory_code AND PI.cat_id = in_cat_id;

ELSE
		SELECT PI.property_inventory_id, IFNULL(PI.user_id, "-") as user_id,
        IFNULL(PI.property_inventory_code, "-") as property_inventory_code, IFNULL(PI.p_title, "-") as p_title, 
        IFNULL(PT.p_type_name, "-") as p_type_name, IFNULL(PI.p_name, "-") as p_name, 
        IFNULL(BED.value, "-") as p_bedroom, IFNULL(BAT.value, "-") as p_bathroom,
        IFNULL(PI.p_sq_ft, "-") as p_sq_ft, IFNULL(FORMAT(PI.p_price, 0), "-") as p_price,
        PI.p_picture_link_1, PI.p_picture_link_2, PI.p_picture_link_3, PI.p_picture_link_4, PI.p_picture_link_5,
        PI.p_picture_link_6, PI.p_picture_link_7, PI.p_picture_link_8, PI.p_picture_link_9, PI.p_picture_link_10,
        IFNULL(PF.p_furnishing_name, "-") as p_furnishing_name, IFNULL(PC.p_car_parking_name, "-") as p_car_parking_name,
        IFNULL(PI.p_sup_builtup_area, "-") as p_sup_builtup_area, IFNULL(PI.p_carpet_area, "-") as p_carpet_area,
        IFNULL(PL.p_listed_by_name, "-") as p_listed_by_name, IFNULL(PS.p_status_title, "-") as p_status_title,
        IFNULL(PI.p_maintenance, "-") as p_maintenance, IFNULL(PI.p_show_mo_no, "-") as p_show_mo_no,
        IFNULL(PI.p_description, "-") as p_description, IFNULL(PI.p_location, "-") as p_location,
        IFNULL(DATE_FORMAT(PI.created_at,'%d %b %y'), "-") as ad_created,
        IFNULL(PI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture,
        IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
        IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name,
        IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
        FROM bsapp_db.property_inventory_mast PI 
        LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
        LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
        LEFT JOIN bsapp_db.property_status_mast  PS  ON  PI.p_status_id =PS.p_status_id
        LEFT JOIN bsapp_db.property_type_mast  PT  ON  PI.p_type_id =PT.p_type_id
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  PI.p_furnishing_id =PF.p_furnishing_id
        LEFT JOIN bsapp_db.property_car_parking_mast  PC  ON  PI.p_car_parking_id =PC.p_car_parking_id
        LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.property_listed_by_mast  PL  ON  PI.p_listed_by_id =PL.p_listed_by_id
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = PI.property_inventory_code 
        LEFT JOIN bsapp_db.user_mast UM ON UM.user_id = PI.user_id
        WHERE PI.property_inventory_code = in_property_inventory_code AND PI.cat_id = in_cat_id ;
	
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_inventory_rent_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_inventory_rent_mast_save`(
IN in_property_inventory_id INT,
        IN in_user_id VARCHAR(125),
		IN in_p_title VARCHAR(126),
		IN in_p_type_id INT,
        IN in_p_name VARCHAR(126),
        IN in_p_bedroom INT,
        IN in_p_bathroom INT,
        IN in_p_sq_ft DECIMAL(12,8),
        IN in_p_price INT,
		IN in_p_picture_link_1 VARCHAR(512),
		IN in_p_picture_link_2 VARCHAR(512),
		IN in_p_picture_link_3 VARCHAR(512),
		IN in_p_picture_link_4 VARCHAR(512),
		IN in_p_picture_link_5 VARCHAR(512),
		IN in_p_picture_link_6 VARCHAR(512),
		IN in_p_picture_link_7 VARCHAR(512),
		IN in_p_picture_link_8 VARCHAR(512),
		IN in_p_picture_link_9 VARCHAR(512),
		IN in_p_picture_link_10 VARCHAR(512),
		IN in_p_furnishing_id INT,
        IN in_p_car_parking_id INT,
        IN in_p_sup_builtup_area DECIMAL(12,8),
        IN in_p_carpet_area DECIMAL(12,8),
        IN in_p_listed_by_id INT,
		IN in_p_preferred_renters_id INT,
		IN in_p_maintenance INT,
		IN in_p_show_mo_no BOOLEAN,
        IN in_p_description VARCHAR(512),
		IN in_p_location VARCHAR(512),
        IN in_latitude DECIMAL(11,8),
		IN in_longitude DECIMAL(11,8),
		IN in_cat_id INT,
		IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;
select COALESCE(MAX(property_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.property_inventory_mast;

IF NOT EXISTS(select property_inventory_id from bsapp_db.property_inventory_mast where property_inventory_id = in_property_inventory_id AND user_id = in_user_id) THEN
 	INSERT INTO bsapp_db.property_inventory_mast
		(property_inventory_id,user_id,property_inventory_code,p_title,p_type_id,p_name,p_bedroom,p_bathroom,p_sq_ft,p_price,p_picture_link_1,p_picture_link_2,p_picture_link_3,p_picture_link_4,p_picture_link_5,p_picture_link_6,p_picture_link_7,p_picture_link_8,p_picture_link_9,p_picture_link_10,p_furnishing_id,p_car_parking_id,p_sup_builtup_area,p_carpet_area,p_listed_by_id,p_preferred_renters_id,p_maintenance,p_show_mo_no,p_description,p_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
		(get_max_inventory_id,in_user_id,concat("property_rent_",get_max_inventory_id),in_p_title,in_p_type_id,in_p_name,in_p_bedroom,in_p_bathroom,in_p_sq_ft,in_p_price,in_p_picture_link_1,in_p_picture_link_2,in_p_picture_link_3,in_p_picture_link_4,in_p_picture_link_5,in_p_picture_link_6,in_p_picture_link_7,in_p_picture_link_8,in_p_picture_link_9,in_p_picture_link_10,in_p_furnishing_id,in_p_car_parking_id,in_p_sup_builtup_area,in_p_carpet_area,in_p_listed_by_id,in_p_preferred_renters_id,in_p_maintenance,in_p_show_mo_no,in_p_description,in_p_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("property_rent_",get_max_inventory_id),"property",1);
select * from bsapp_db.property_inventory_mast where property_inventory_id = get_max_inventory_id AND user_id = in_user_id;
ELSE
   UPDATE bsapp_db.property_inventory_mast
	SET
	p_title = in_p_title,
    p_type_id = in_p_type_id,
    p_name = in_p_name,
    p_bedroom = in_p_bedroom,
    p_bathroom = in_p_bathroom,
    p_sq_ft = in_p_sq_ft,
    p_price = in_p_price,
    p_picture_link_1 = in_p_picture_link_1,
    p_picture_link_2 = in_p_picture_link_2,
    p_picture_link_3 = in_p_picture_link_3,
    p_picture_link_4 = in_p_picture_link_4,
    p_picture_link_5 = in_p_picture_link_5,
    p_picture_link_6 = in_p_picture_link_6,
    p_picture_link_7 = in_p_picture_link_7,
    p_picture_link_8 = in_p_picture_link_8,
    p_picture_link_9 = in_p_picture_link_9,
    p_picture_link_10 = in_p_picture_link_10,
    p_furnishing_id = in_p_furnishing_id,
    p_car_parking_id = in_p_car_parking_id,
    p_sup_builtup_area = in_p_sup_builtup_area,
    p_carpet_area = in_p_carpet_area,
    p_listed_by_id =in_p_listed_by_id,
    p_preferred_renters_id = in_p_preferred_renters_id,
    p_maintenance = in_p_maintenance,
    p_show_mo_no = in_p_show_mo_no,
    p_description = in_p_description,
    p_location = in_p_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE property_inventory_id = in_property_inventory_id AND user_id = in_user_id;
select * from bsapp_db.property_inventory_mast WHERE property_inventory_id = in_property_inventory_id AND user_id = in_user_id;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_inventory_sell_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_inventory_sell_mast_delete`(
        IN in_property_inventory_id INT,
        IN in_user_id VARCHAR(125)
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.property_inventory_mast PI  ON  AD.inventory_code= PI.property_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_property_inventory_id );
   DELETE FROM  bsapp_db.property_inventory_mast WHERE property_inventory_id = in_property_inventory_id AND user_id = in_user_id;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_inventory_sell_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_inventory_sell_mast_fill`(
        IN in_property_inventory_code VARCHAR(126),
        IN in_cat_id INT
)
BEGIN
        SELECT PI.property_inventory_id, IFNULL(PI.user_id, "-") as user_id,
        IFNULL(PI.property_inventory_code, "-") as property_inventory_code, IFNULL(PI.p_title, "-") as p_title, 
        IFNULL(PT.p_type_name, "-") as p_type_name, IFNULL(PI.p_name, "-") as p_name, 
        IFNULL(BED.value, "-") as p_bedroom, IFNULL(BAT.value, "-") as p_bathroom,
        IFNULL(PI.p_sq_ft, "-") as p_sq_ft, IFNULL(FORMAT(PI.p_price, 0), "-") as p_price,
        PI.p_picture_link_1, PI.p_picture_link_2, PI.p_picture_link_3, PI.p_picture_link_4, PI.p_picture_link_5,
        PI.p_picture_link_6, PI.p_picture_link_7, PI.p_picture_link_8, PI.p_picture_link_9, PI.p_picture_link_10,
        IFNULL(PF.p_furnishing_name, "-") as p_furnishing_name, IFNULL(PC.p_car_parking_name, "-") as p_car_parking_name,
        IFNULL(PI.p_sup_builtup_area, "-") as p_sup_builtup_area, IFNULL(PI.p_carpet_area, "-") as p_carpet_area,
        IFNULL(PL.p_listed_by_name, "-") as p_listed_by_name, IFNULL(PS.p_status_title, "-") as p_status_title,
        IFNULL(PI.p_maintenance, "-") as p_maintenance, IFNULL(PI.p_show_mo_no, "-") as p_show_mo_no,
        IFNULL(PI.p_description, "-") as p_description, IFNULL(PI.p_location, "-") as p_location,
        IFNULL(DATE_FORMAT(PI.created_at,'%d %b %y'), "-") as ad_created,
        IFNULL(PI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture,
        IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
        IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name,
        IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
        FROM bsapp_db.property_inventory_mast PI 
        LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
        LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
        LEFT JOIN bsapp_db.property_status_mast  PS  ON  PI.p_status_id =PS.p_status_id
        LEFT JOIN bsapp_db.property_type_mast  PT  ON  PI.p_type_id =PT.p_type_id
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  PI.p_furnishing_id =PF.p_furnishing_id
        LEFT JOIN bsapp_db.property_car_parking_mast  PC  ON  PI.p_car_parking_id =PC.p_car_parking_id
        LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.property_listed_by_mast  PL  ON  PI.p_listed_by_id =PL.p_listed_by_id
        LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = PI.property_inventory_code 
        LEFT JOIN bsapp_db.user_mast UM ON UM.user_id = PI.user_id
        WHERE PI.property_inventory_code = in_property_inventory_code AND PI.cat_id = in_cat_id ;
       
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_inventory_sell_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_inventory_sell_mast_save`(
		IN in_property_inventory_id INT,
        IN in_user_id VARCHAR(125),
		IN in_p_title VARCHAR(126),
		IN in_p_type_id INT,
        IN in_p_name VARCHAR(126),
        IN in_p_bedroom INT,
        IN in_p_bathroom INT,
        IN in_p_sq_ft DECIMAL(20,8),
        IN in_p_price INT,
		IN in_p_picture_link_1 VARCHAR(512),
		IN in_p_picture_link_2 VARCHAR(512),
		IN in_p_picture_link_3 VARCHAR(512),
		IN in_p_picture_link_4 VARCHAR(512),
		IN in_p_picture_link_5 VARCHAR(512),
		IN in_p_picture_link_6 VARCHAR(512),
		IN in_p_picture_link_7 VARCHAR(512),
		IN in_p_picture_link_8 VARCHAR(512),
		IN in_p_picture_link_9 VARCHAR(512),
		IN in_p_picture_link_10 VARCHAR(512),
		IN in_p_furnishing_id INT,
        IN in_p_car_parking_id INT,
        IN in_p_sup_builtup_area DECIMAL(12,8),
        IN in_p_carpet_area DECIMAL(12,8),
        IN in_p_listed_by_id INT,		
		IN in_p_status_id INT,
		IN in_p_maintenance INT,
		IN in_p_show_mo_no BOOLEAN,
        IN in_p_description VARCHAR(512),
		IN in_p_location VARCHAR(512),
        IN in_latitude DECIMAL(11,8),
		IN in_longitude DECIMAL(11,8),
		IN in_cat_id INT,
		IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;
select COALESCE(MAX(property_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.property_inventory_mast;

IF NOT EXISTS(select property_inventory_id from bsapp_db.property_inventory_mast where property_inventory_id = in_property_inventory_id AND user_id = in_user_id) THEN
 	INSERT INTO bsapp_db.property_inventory_mast
		(property_inventory_id,user_id,property_inventory_code,p_title,p_type_id,p_name,p_bedroom,p_bathroom,p_sq_ft,p_price,p_picture_link_1,p_picture_link_2,p_picture_link_3,p_picture_link_4,p_picture_link_5,p_picture_link_6,p_picture_link_7,p_picture_link_8,p_picture_link_9,p_picture_link_10,p_furnishing_id,p_car_parking_id,p_sup_builtup_area,p_carpet_area,p_listed_by_id,p_status_id,p_maintenance,p_show_mo_no,p_description,p_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
		(get_max_inventory_id,in_user_id,concat("property_sell_",get_max_inventory_id),in_p_title,in_p_type_id,in_p_name,in_p_bedroom,in_p_bathroom,in_p_sq_ft,in_p_price,in_p_picture_link_1,in_p_picture_link_2,in_p_picture_link_3,in_p_picture_link_4,in_p_picture_link_5,in_p_picture_link_6,in_p_picture_link_7,in_p_picture_link_8,in_p_picture_link_9,in_p_picture_link_10,in_p_furnishing_id,in_p_car_parking_id,in_p_sup_builtup_area,in_p_carpet_area,in_p_listed_by_id,in_p_status_id,in_p_maintenance,in_p_show_mo_no,in_p_description,in_p_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("property_sell_",get_max_inventory_id),"property",1);
select * from bsapp_db.property_inventory_mast where property_inventory_id = get_max_inventory_id  AND user_id = in_user_id;
ELSE
   UPDATE bsapp_db.property_inventory_mast
	SET
	p_title = in_p_title,
    p_type_id = in_p_type_id,
    p_name = in_p_name,
    p_bedroom = in_p_bedroom,
    p_bathroom = in_p_bathroom,
    p_sq_ft = in_p_sq_ft,
    p_price = in_p_price,
    p_picture_link_1 = in_p_picture_link_1,
    p_picture_link_2 = in_p_picture_link_2,
    p_picture_link_3 = in_p_picture_link_3,
    p_picture_link_4 = in_p_picture_link_4,
    p_picture_link_5 = in_p_picture_link_5,
    p_picture_link_6 = in_p_picture_link_6,
    p_picture_link_7 = in_p_picture_link_7,
    p_picture_link_8 = in_p_picture_link_8,
    p_picture_link_9 = in_p_picture_link_9,
    p_picture_link_10 = in_p_picture_link_10,
    p_furnishing_id = in_p_furnishing_id,
    p_car_parking_id = in_p_car_parking_id,
    p_sup_builtup_area = in_p_sup_builtup_area,
    p_carpet_area = in_p_carpet_area,
    p_listed_by_id =in_p_listed_by_id,
    p_status_id = in_p_status_id,
    p_maintenance = in_p_maintenance,
    p_show_mo_no = in_p_show_mo_no,
    p_description = in_p_description,
    p_location = in_p_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE property_inventory_id = in_property_inventory_id AND user_id = in_user_id;
select * from bsapp_db.property_inventory_mast WHERE property_inventory_id = in_property_inventory_id AND user_id = in_user_id;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_listed_by_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_listed_by_mast_delete`(
   IN in_p_listed_by_id INT
)
BEGIN
	DELETE FROM bsapp_db.property_listed_by_mast WHERE p_listed_by_id = in_p_listed_by_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_listed_by_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_listed_by_mast_fill`()
BEGIN
		SELECT * FROM bsapp_db.property_listed_by_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_listed_by_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_listed_by_mast_save`(
	IN in_p_listed_by_id INT,
    IN in_p_listed_by_name VARCHAR(126)
)
BEGIN
IF NOT EXISTS(select p_listed_by_id from bsapp_db.property_listed_by_mast where p_listed_by_id = in_p_listed_by_id) THEN
 	INSERT INTO bsapp_db.property_listed_by_mast
		(p_listed_by_name,created_at)
	VALUES
		(in_p_listed_by_name,now());
ELSE
   UPDATE bsapp_db.property_listed_by_mast
	SET
	p_listed_by_name = in_p_listed_by_name,
    modified_at = now()
	WHERE p_listed_by_id = in_p_listed_by_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_preferred_renters_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_preferred_renters_mast_delete`(
	IN in_p_preferred_renters_id INT
)
BEGIN
	DELETE FROM bsapp_db.property_preferred_renters_mast WHERE p_preferred_renters_id = in_p_preferred_renters_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_preferred_renters_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_preferred_renters_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.property_preferred_renters_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_preferred_renters_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_preferred_renters_mast_save`(
	IN in_p_preferred_renters_id INT,
    IN in_p_preferred_renters_name VARCHAR(126)
)
BEGIN
IF NOT EXISTS(select p_preferred_renters_id from bsapp_db.property_preferred_renters_mast where p_preferred_renters_id = in_p_preferred_renters_id) THEN
 	INSERT INTO bsapp_db.property_preferred_renters_mast
		(p_preferred_renters_name,created_at)
	VALUES
		(in_p_preferred_renters_name,now());
ELSE
   UPDATE bsapp_db.property_preferred_renters_mast
	SET
	p_preferred_renters_name = in_p_preferred_renters_name,
    modified_at = now()
	WHERE p_preferred_renters_id = in_p_preferred_renters_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_status_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_status_mast_delete`(
	IN in_p_status_id INT
)
BEGIN
	DELETE FROM  bsapp_db.property_status_mast WHERE p_status_id = in_p_status_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_status_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_status_mast_fill`()
BEGIN
	SELECT * FROM  bsapp_db.property_status_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_status_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_status_mast_save`(
	IN in_p_status_id INT,
    IN in_p_status_title VARCHAR(126)
)
BEGIN
IF NOT EXISTS (SELECT p_status_id FROM  bsapp_db.property_status_mast WHERE p_status_id = in_p_status_id) THEN
    INSERT INTO bsapp_db.property_status_mast
		(p_status_title,created_at)
	VALUES
		(in_p_status_title,now());
ELSE
   UPDATE bsapp_db.property_status_mast
	SET
	p_status_title = in_p_status_title,
    modified_at = now()
	WHERE p_status_id = in_p_status_id;
END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_type_mast_delete`(
	IN in_p_type_id INT
)
BEGIN
	DELETE FROM bsapp_db.property_type_mast WHERE p_type_id = in_p_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_type_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.property_type_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_property_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_property_type_mast_save`(
  IN in_p_type_id INT,
  IN in_p_type_name VARCHAR(126)
)
BEGIN
IF NOT EXISTS(select p_type_id from bsapp_db.property_type_mast where p_type_id = in_p_type_id) THEN
 	INSERT INTO bsapp_db.property_type_mast
		(p_type_name,created_at)
	VALUES
		(in_p_type_name,now());
ELSE
   UPDATE bsapp_db.property_type_mast
	SET
	p_type_name = in_p_type_name,
    modified_at = now()
	WHERE p_type_id = in_p_type_id;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_purchase_ads_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_purchase_ads_mast_fill`(
	IN in_user_id VARCHAR(125),
    IN in_cat_id INT
)
BEGIN
	SELECT pa.id, pa.user_id, c.cat_name, pa.pkt_id,pkg.package_days,pkg.message, pa.price, pa.is_active, pa.total_ad, pa.use_ad, pa.ava_ad, pa.start_date_time, pa.end_date_time, pa.created_at
    FROM bsapp_db.purchase_ads_mast pa
    LEFT JOIN bsapp_db.package_price_mast pkg ON pa.pkt_id = pkg.id
    LEFT JOIN bsapp_db.category_mast c ON pkg.cat_id = c.id 
    WHERE user_id = in_user_id AND pkg.cat_id = in_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_purchase_ads_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_purchase_ads_mast_save`(
    IN in_user_id VARCHAR(125),
	IN in_pkt_id INT,
	IN in_price INT,
    IN in_is_active BOOL,
    IN in_total_ad INT,
    IN in_use_ad INT,
	IN in_ava_ad INT
)
BEGIN
	DECLARE months INT;
    SELECT total_month INTO months FROM package_price_mast WHERE id = in_pkt_id;
 	INSERT INTO bsapp_db.purchase_ads_mast
		(user_id, pkt_id, price, is_active, start_date_time, end_date_time, created_at, total_ad, use_ad, ava_ad)
	VALUES
		(in_user_id, in_pkt_id, in_price, in_is_active, now(), ADDDATE(now(), INTERVAL months MONTH), now(), in_total_ad, in_use_ad, in_ava_ad);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_purchase_ads_mast_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_purchase_ads_mast_update`(
	IN in_id INT,
    IN in_is_active BOOL
)
BEGIN
	UPDATE bsapp_db.purchase_ads_mast 
    SET is_active = in_is_active
    WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ram_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ram_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.ram_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ram_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ram_mast_fill`(
	IN in_id INT
)
BEGIN
	SELECT * FROM bsapp_db.ram_mast WHERE id = in_id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ram_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_ram_mast_save`(
	IN in_id INT,
    IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.ram_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.ram_mast (value) VALUES (in_value);
	ELSE
		UPDATE bsapp_db.ram_mast SET value = in_value WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rate_us_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rate_us_mast_save`(
	IN in_rate_id INT,
    IN in_user_id VARCHAR(125),
    IN in_rate DECIMAL(10,2)
)
BEGIN
IF NOT EXISTS(SELECT rate_id FROM bsapp_db.rate_us_mast WHERE  user_id = in_user_id ) THEN
 	INSERT INTO bsapp_db.rate_us_mast
		(user_id,rate,created_at)
	VALUES
		(in_user_id,in_rate,now());
ELSE 
	UPDATE bsapp_db.rate_us_mast
    SET 
    rate = in_rate,
    modified_at = now()
    WHERE user_id = in_user_id AND rate_id = in_rate_id;
END IF;
select avg(rate) as rating from bsapp_db.rate_us_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rejected_reasons_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rejected_reasons_mast_delete`(
	IN in_reject_id INT
)
BEGIN
	DELETE FROM bsapp_db.rejected_reasons_mast 
    WHERE reject_id = in_reject_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rejected_reasons_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rejected_reasons_mast_fill`(
	IN in_is_active INT
)
BEGIN
	SELECT * FROM bsapp_db.rejected_reasons_mast 
    WHERE is_active = in_is_active
    ORDER BY sequence_no;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rejected_reasons_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rejected_reasons_mast_save`(
	IN in_reject_id INT,
    IN in_reasons VARCHAR(512),
    IN in_sequence_no INT,
    IN in_is_active BOOL
)
BEGIN
	IF NOT EXISTS (SELECT reject_id FROM bsapp_db.rejected_reasons_mast WHERE reject_id = in_reject_id ) THEN
		INSERT INTO bsapp_db.rejected_reasons_mast (reasons, sequence_no, created_at, is_active)
        VALUES (in_reasons, in_sequence_no, now(), in_is_active);
	ELSE
		UPDATE bsapp_db.rejected_reasons_mast
        SET
        reasons = in_reasons,
        sequence_no = in_sequence_no,
        modified_at = now(),
        is_active = in_is_active
        WHERE reject_id = in_reject_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_report_mast_fill`(
	IN in_user_id VARCHAR(125)
)
BEGIN
	SELECT * FROM bsapp_db.report_mast WHERE user_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_report_mast_save`(
	IN in_id INT,
    IN in_user_id VARCHAR(125),
    IN in_report_msg_id INT,
    IN in_comment VARCHAR(255)
)
BEGIN
	IF NOT EXISTS (SELECT id FROM bsapp_db.report_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.report_mast (user_id, report_msg_id, comment, created_at)
        VALUES (in_user_id, in_report_msg_id, in_comment, now());
	ELSE
		UPDATE bsapp_db.report_mast 
        SET 
        user_id = in_user_id,
        report_msg_id = in_report_msg_id,
        comment = in_comment,
        modified_at = now()
        WHERE id = in_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_message_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_report_message_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.report_message_mast WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_message_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_report_message_mast_fill`(
	IN in_type VARCHAR(11)
)
BEGIN
	SELECT * FROM bsapp_db.report_message_mast WHERE type = in_type;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_report_message_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_report_message_mast_save`(
	IN in_id INT,
	IN in_report_msg VARCHAR(255),
    IN in_type VARCHAR(11)
)
BEGIN
	IF NOT EXISTS (SELECT id FROM bsapp_db.report_message_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.report_message_mast (report_msg, type, created_at)
		VALUES (in_report_msg, in_type, now());
	ELSE
		UPDATE bsapp_db.report_message_mast
        SET 
        report_msg = in_report_msg,
        type = in_type,
        modified_at = now()
        WHERE id = in_id;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rom_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rom_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.rom_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rom_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rom_mast_fill`(
	IN in_id INT
)
BEGIN
	SELECT * FROM bsapp_db.rom_mast WHERE id = in_id; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_rom_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_rom_mast_save`(
	IN in_id INT,
    IN in_value VARCHAR(45)
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.rom_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.rom_mast (value) VALUES (in_value);
	ELSE
		UPDATE bsapp_db.rom_mast SET value = in_value WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_salary_period_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_salary_period_mast_delete`(
	IN in_s_p_id INT
)
BEGIN
	DELETE FROM bsapp_db.salary_period_mast WHERE s_p_id = in_s_p_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_salary_period_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_salary_period_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.salary_period_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_salary_period_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_salary_period_mast_save`(
	IN in_s_p_id INT,
    IN in_s_p_name VARCHAR(126)
)
BEGIN
 IF NOT EXISTS(select s_p_id from bsapp_db.salary_period_mast where s_p_id = in_s_p_id) THEN
 	INSERT INTO bsapp_db.salary_period_mast
		(s_p_name,created_at)
	VALUES
		(in_s_p_name,now());
ELSE
   UPDATE bsapp_db.salary_period_mast
	SET
	s_p_name = in_s_p_name,
    modified_at = now()
	WHERE s_p_id = in_s_p_id;

END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_send_email_otp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_send_email_otp`(
	IN in_email VARCHAR(64),
    IN in_otp INT
)
BEGIN
DECLARE in_login_seq_id BIGINT;
	IF NOT EXISTS (SELECT login_id FROM bsapp_db.user_mast WHERE mail_id = in_email) THEN
    call sp_login_sequence();
    SET in_login_seq_id = (select  seq_id  from bsapp_db.login_sequence_mast where seq_date = CURDATE());
		INSERT INTO bsapp_db.user_mast (login_id,mail_id, user_cat, otp, is_verify,created_at)
        VALUES (in_login_seq_id,in_email, "U", in_otp, 0,now());
    ELSE
		UPDATE bsapp_db.user_mast
        SET 
        otp = in_otp,
        is_verify = 0
        WHERE mail_id = in_email;
    END IF;
    SELECT * FROM bsapp_db.user_mast WHERE mail_id = in_email;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_send_otp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_send_otp`(
 in in_mobile_no  varchar(16),
 in in_mobile_cc_code varchar(8),
 in in_name varchar(126),
 in in_otp int
)
BEGIN
DECLARE in_login_seq_id BIGINT;
   IF NOT EXISTS(
   SELECT  login_id
   FROM bsapp_db.user_mast 
   WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code AND name = in_name )
   THEN
   call sp_login_sequence();
    SET in_login_seq_id = (select  seq_id  from bsapp_db.login_sequence_mast where seq_date = CURDATE());
	INSERT INTO bsapp_db.user_mast
			(login_id,mobile_no,mobile_cc_code,user_cat,is_verify,otp,created_at,name)
	VALUES
			(in_login_seq_id,in_mobile_no,in_mobile_cc_code,"U",false,in_otp,now(),in_name);
ELSE
	UPDATE bsapp_db.user_mast
	SET
    otp = in_otp,
    is_verify = false
	WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code AND name = in_name;
END IF;
  SELECT login_id,user_id,name,mobile_no,mobile_cc_code,otp,is_verify FROM bsapp_db.user_mast WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code AND name = in_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_show_category_data` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_show_category_data`(
	IN in_cat_id INT,
    IN in_sub_cat_id  varchar(125),
    IN in_limit INT,
    IN in_page_no INT,
    IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
    IN in_price_from INT,
    IN in_price_to INT,
    IN in_brand_id VARCHAR(126),
    IN in_job_salary_from INT,
    IN in_job_salary_to INT,
    IN in_distance_from INT,
    IN in_distance_to INT,
    IN in_distance_sorting VARCHAR(126),
    IN in_date_sorting VARCHAR(126),
    IN in_price_sorting VARCHAR(126)
)
BEGIN
	DECLARE  in_offset INT;
	SET in_offset = (in_page_no -1) * in_limit;

	SELECT *, COUNT(*) OVER() AS "total_count" 
    FROM(
	(SELECT 
		CS.car_sell_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        CS.c_picture_link_1 as Image,
        CS.car_title as Name,
        FORMAT(CS.c_price, 2) as Price,
        0 as from_salary,
		0 as to_salary,
        CS.c_location as location,
        CS.latitude,
		CS.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(CS.latitude)) * COS(RADIANS(CS.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(CS.latitude))) * 6371) AS distance_in_km,
	    DATE_FORMAT(CS.created_at,'%d %b %y') as Create_Date,
        CS.modified_at as Modify_Date,
        "" as  office_furnished,
        SM.state_name AS car_registration_state,
		CS.c_km AS car_km,
		CO.name AS owner,
        0 as Bedroom,
		0 as Bathroom,
        0 as Cabin,
        0 as Washroom,
		0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		YM.value as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.car_sell_inventory_mast AS CS
        LEFT JOIN bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON CS.car_sell_inventory_code = AD.inventory_code 
        LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
		LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
		LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
		LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
		  WHERE CS.cat_id=in_cat_id AND find_in_set(CS.sub_cat_id,in_sub_cat_id)  AND AD.ad_status_id = 1
    ) 
    UNION 
    (SELECT 
		AI.all_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        AI.picture_link_1 as Image,
        AI.title as Name,
		FORMAT(AI.price, 2) as Price,
        0 as from_salary,
		0 as to_salary,
		AI.location as location,
        AI.latitude,
		AI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(AI.latitude)) * COS(RADIANS(AI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(AI.latitude))) * 6371) AS distance_in_km,
		DATE_FORMAT(AI.created_at,'%d %b %y') as Create_Date,
        AI.modified_at as Modify_Date,
        "" as  office_furnished,
		'' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.all_inventory_mast AS AI
        LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id 
        LEFT JOIN bsapp_db.ads_mast  AD ON AI.all_inventory_code = AD.inventory_code 
	  WHERE AI.cat_id=in_cat_id AND find_in_set(AI.sub_cat_id,in_sub_cat_id)  AND AD.ad_status_id = 1 )  
    UNION 
    (SELECT 
		CR.car_rent_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        CR.c_picture_link_1 as Image,
        CR.car_title as Name,
		FORMAT(CR.c_price, 2) as Price,
        0 as from_salary,
		0 as to_salary,	
        CR.c_location as location,
        CR.latitude,
		CR.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(CR.latitude)) * COS(RADIANS(CR.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(CR.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(CR.created_at,'%d %b %y') as Create_Date,
        CR.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
        c_km_limit as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.car_rent_inventory_mast CR
        LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
		LEFT JOIN bsapp_db.ads_mast  AD ON CR.car_rent_inventory_code = AD.inventory_code
      WHERE CR.cat_id=in_cat_id AND find_in_set(CR.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1  )
    UNION (SELECT 
		JI.job_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
	    JI.j_picture_link_1 as Image,
        JI.j_title as Name,
        FORMAT(0, 2) as price,
        JI.from_salary as From_salary,
        JI.to_salary as To_salary,
        JI.j_location as location,
        JI.latitude,
		JI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(JI.latitude)) * COS(RADIANS(JI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(JI.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(JI.created_at,'%d %b %y') as Create_Date,
        JI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
        0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		JT.j_type_name as Job_type,
		SP.s_p_name as Job_salary_period
      
	FROM
		bsapp_db.job_inventory_mast JI
        LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
        LEFT JOIN bsapp_db.ads_mast  AD ON JI.job_inventory_code = AD.inventory_code
	  WHERE JI.cat_id=in_cat_id AND find_in_set(JI.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1 HAVING  CASE WHEN in_job_salary_to <> 0 THEN ((JI.from_salary >= in_job_salary_from OR  JI.to_salary <= in_job_salary_to)) ELSE JI.from_salary >= 0 END  ) 
    UNION 
    (SELECT 
		MI.mo_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		MI.mo_picture_link_1 as Image,
        MI.mo_title as Name,
        FORMAT(MI.mo_price, 2) as Price,
		0 as from_salary,
		0 as to_salary, 
        MI.location as location,
        MI.latitude,
		MI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(MI.latitude)) * COS(RADIANS(MI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(MI.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(MI.created_at,'%d %b %y') as Create_Date,
        MI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		RAM.value AS Mobile_ram,
		ROM.value AS Mobile_rom,
        BR.brand_name as Mobile_brand,
        MI.mo_colour as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.mobile_inventory_mast MI
        LEFT JOIN bsapp_db.mobile_brand_mast BR  ON  MI.brand_id = BR.brand_id 
        LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON MI.mo_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
		LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
	  WHERE  MI.cat_id=in_cat_id  AND find_in_set(MI.sub_cat_id,in_sub_cat_id)AND AD.ad_status_id = 1 AND CASE WHEN in_brand_id <> "" THEN find_in_set(MI.brand_id,in_brand_id) ELSE MI.brand_id > 0 END   )
    UNION (SELECT 
		OI.office_inventory_code AS ID,
		CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		OI.o_picture_link_1 as Image,
        OI.o_title as Name,
        FORMAT(OI.o_price, 2) as Price,
		0 as from_salary,
		0 as to_salary, 
		OI.o_location as location,
        OI.latitude,
		OI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(OI.latitude)) * COS(RADIANS(OI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(OI.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(OI.created_at,'%d %b %y') as Create_Date,
        OI.modified_at as Modify_Date,
        PF.p_furnishing_name as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
        OC.value as Cabin,
        OW.value as Washroom,
		OI.o_sq_ft as Square_Feet, 
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
        
	FROM
		bsapp_db.office_inventory_mast OI
        LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.office_cabin_mast  OC  ON  OI.cabin =OC.id
        LEFT JOIN bsapp_db.office_washroom_mast  OW  ON  OI.washroom =OW.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON OI.office_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  OI.p_furnishing_id =PF.p_furnishing_id
	  WHERE OI.cat_id=in_cat_id AND find_in_set(OI.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1  ) 
    UNION 
    (SELECT 
		PI.property_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        PI.p_picture_link_1 as Image,
        PI.p_title as Name,
        FORMAT(PI.p_price, 2) as Price,
        0 as from_salary,
		0 as to_salary,
        PI.p_location as location,
        PI.latitude,
		PI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(PI.latitude)) * COS(RADIANS(PI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(PI.latitude))) * 6371) AS distance_in_km,
		DATE_FORMAT(PI.created_at,'%d %b %y') as Create_Date,
        PI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        BED.value as Bedroom,
        BAT.value as Bathroom,
		0 as Cabin,
        0 as Washroom,
        PI.p_sq_ft as Square_Feet, 
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.property_inventory_mast PI
        LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
        LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
        LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON PI.property_inventory_code = AD.inventory_code
	  WHERE PI.cat_id=in_cat_id AND find_in_set(PI.sub_cat_id,in_sub_cat_id)   ) 
    UNION 
    (SELECT 
		VI.vehicle_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		VI.v_picture_link_1 as Image,
        VI.v_title as Name,
        FORMAT(VI.v_price, 2) as Price,
		0 as from_salary,
		0 as to_salary,    
        VI.v_location as location,
        VI.latitude,
		VI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(VI.latitude)) * COS(RADIANS(VI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(VI.latitude))) * 6371) AS distance_in_km,
		DATE_FORMAT(VI.created_at,'%d %b %y') as Create_Date,
        VI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		YM.value as year_of_registration,
		VI.kms as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.vehicle_inventory_mast VI
        LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON VI.vehicle_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
	  WHERE VI.cat_id=in_cat_id AND find_in_set(VI.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1  ))AS SUBQ 
      HAVING CASE WHEN in_price_to <> 0 THEN   price BETWEEN in_price_from AND in_price_to  ELSE price >= 0 END AND 
		distance_in_km BETWEEN in_distance_from AND in_distance_to 
      ORDER BY	CASE WHEN in_distance_sorting='ASC' THEN distance_in_km END,
				CASE WHEN in_distance_sorting='DESC' THEN distance_in_km  END DESC,
				CASE WHEN in_date_sorting='ASC' THEN Create_Date END,
				CASE WHEN in_date_sorting='DESC' THEN Create_Date  END DESC,
                CASE WHEN in_price_sorting='ASC' THEN Price END ,
                CASE WHEN in_price_sorting='DESC' THEN Price END DESC
	  limit in_limit offset in_offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sponcer_near_by_location_category_show` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_sponcer_near_by_location_category_show`(
	IN in_cat_id INT,
    IN in_sub_cat_id  varchar(125),
    IN in_limit INT,
    IN in_page_no INT,
    IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
    IN in_price_from INT,
    IN in_price_to INT,
    IN in_brand_id VARCHAR(126),
    IN in_job_salary_from INT,
    IN in_job_salary_to INT,
    IN in_distance_from INT,
    IN in_distance_to INT,
    IN in_distance_sorting VARCHAR(126),
    IN in_date_sorting VARCHAR(126),
    IN in_price_sorting VARCHAR(126)
)
BEGIN
DECLARE  in_offset INT;
	SET in_offset = (in_page_no -1) * in_limit;

	SELECT *, COUNT(*) OVER() AS "total_count" 
    FROM(
	(SELECT 
		CS.car_sell_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        CS.c_picture_link_1 as Image,
        CS.car_title as Name,
        FORMAT(CS.c_price, 2) as Price,
        0 as from_salary,
		0 as to_salary,
        CS.c_location as location,
        CS.latitude,
		CS.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(CS.latitude)) * COS(RADIANS(CS.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(CS.latitude))) * 6371) AS distance_in_km,
	    DATE_FORMAT(CS.created_at,'%d %b %y') as Create_Date,
        CS.modified_at as Modify_Date,
        "" as  office_furnished,
        SM.state_name AS car_registration_state,
		CS.c_km AS car_km,
		CO.name AS owner,
        0 as Bedroom,
		0 as Bathroom,
        0 as Cabin,
        0 as Washroom,
		0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		YM.value as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.car_sell_inventory_mast AS CS
        LEFT JOIN bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON CS.car_sell_inventory_code = AD.inventory_code 
        LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
		LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
		LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
		LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
        LEFT JOIN bsapp_db.package_inventory_mast PI ON CS.car_sell_inventory_code = PI.inventory_code AND CS.inventory_type = PI.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
		  WHERE CS.cat_id=in_cat_id AND find_in_set(CS.sub_cat_id,in_sub_cat_id)  AND AD.ad_status_id = 1 AND PA.is_active = 1) 
    UNION 
    (SELECT 
		AI.all_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        AI.picture_link_1 as Image,
        AI.title as Name,
		FORMAT(AI.price, 2) as Price,
        0 as from_salary,
		0 as to_salary,
		AI.location as location,
        AI.latitude,
		AI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(AI.latitude)) * COS(RADIANS(AI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(AI.latitude))) * 6371) AS distance_in_km,
		DATE_FORMAT(AI.created_at,'%d %b %y') as Create_Date,
        AI.modified_at as Modify_Date,
        "" as  office_furnished,
		'' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.all_inventory_mast AS AI
        LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id 
        LEFT JOIN bsapp_db.ads_mast  AD ON AI.all_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.package_inventory_mast PI ON AI.all_inventory_code = PI.inventory_code and AI.inventory_type = PI.inventory_type
		LEFT JOIN  bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
	  WHERE AI.cat_id=in_cat_id AND find_in_set(AI.sub_cat_id,in_sub_cat_id)  AND AD.ad_status_id = 1  AND PA.is_active = 1)  
    UNION 
    (SELECT 
		CR.car_rent_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        CR.c_picture_link_1 as Image,
        CR.car_title as Name,
		FORMAT(CR.c_price, 2) as Price,
        0 as from_salary,
		0 as to_salary,	
        CR.c_location as location,
        CR.latitude,
		CR.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(CR.latitude)) * COS(RADIANS(CR.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(CR.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(CR.created_at,'%d %b %y') as Create_Date,
        CR.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
        c_km_limit as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.car_rent_inventory_mast CR
        LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
		LEFT JOIN bsapp_db.ads_mast  AD ON CR.car_rent_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.package_inventory_mast PI ON CR.car_rent_inventory_code = PI.inventory_code and CR.inventory_type = PI.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
      WHERE CR.cat_id=in_cat_id AND find_in_set(CR.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1 AND PA.is_active = 1)
    UNION (SELECT 
		JI.job_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
	    JI.j_picture_link_1 as Image,
        JI.j_title as Name,
        FORMAT(0, 2) as price,
        JI.from_salary as From_salary,
        JI.to_salary as To_salary,
        JI.j_location as location,
        JI.latitude,
		JI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(JI.latitude)) * COS(RADIANS(JI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(JI.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(JI.created_at,'%d %b %y') as Create_Date,
        JI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
        0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		JT.j_type_name as Job_type,
		SP.s_p_name as Job_salary_period
      
	FROM
		bsapp_db.job_inventory_mast JI
        LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
        LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
        LEFT JOIN bsapp_db.ads_mast  AD ON JI.job_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.package_inventory_mast PI ON JI.job_inventory_code = PI.inventory_code and JI.inventory_type = PI.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
	  WHERE JI.cat_id=in_cat_id AND find_in_set(JI.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1 AND PA.is_active = 1
      HAVING  CASE WHEN in_job_salary_to <> 0 THEN ((JI.from_salary >= in_job_salary_from OR  JI.to_salary <= in_job_salary_to)) ELSE JI.from_salary >= 0 END   ) 
    UNION 
    (SELECT 
		MI.mo_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		MI.mo_picture_link_1 as Image,
        MI.mo_title as Name,
        FORMAT(MI.mo_price, 2) as Price,
		0 as from_salary,
		0 as to_salary, 
        MI.location as location,
        MI.latitude,
		MI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(MI.latitude)) * COS(RADIANS(MI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(MI.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(MI.created_at,'%d %b %y') as Create_Date,
        MI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		RAM.value AS Mobile_ram,
		ROM.value AS Mobile_rom,
        BR.brand_name as Mobile_brand,
        MI.mo_colour as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.mobile_inventory_mast MI
        LEFT JOIN bsapp_db.mobile_brand_mast BR  ON  MI.brand_id = BR.brand_id 
        LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON MI.mo_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
		LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
        LEFT JOIN bsapp_db.package_inventory_mast PI ON MI.mo_inventory_code = PI.inventory_code and MI.inventory_type = PI.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
	  WHERE  MI.cat_id=in_cat_id  AND find_in_set(MI.sub_cat_id,in_sub_cat_id)AND AD.ad_status_id = 1 AND CASE WHEN in_brand_id <> "" THEN find_in_set(MI.brand_id,in_brand_id) ELSE MI.brand_id > 0 END  AND PA.is_active = 1 )
    UNION (SELECT 
		OI.office_inventory_code AS ID,
		CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		OI.o_picture_link_1 as Image,
        OI.o_title as Name,
        FORMAT(OI.o_price, 2) as Price,
		0 as from_salary,
		0 as to_salary, 
		OI.o_location as location,
        OI.latitude,
		OI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(OI.latitude)) * COS(RADIANS(OI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(OI.latitude))) * 6371) AS distance_in_km,
        DATE_FORMAT(OI.created_at,'%d %b %y') as Create_Date,
        OI.modified_at as Modify_Date,
        PF.p_furnishing_name as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
        OC.value as Cabin,
        OW.value as Washroom,
		OI.o_sq_ft as Square_Feet, 
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
        
	FROM
		bsapp_db.office_inventory_mast OI
        LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
        LEFT JOIN bsapp_db.office_cabin_mast  OC  ON  OI.cabin =OC.id
        LEFT JOIN bsapp_db.office_washroom_mast  OW  ON  OI.washroom =OW.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON OI.office_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  OI.p_furnishing_id =PF.p_furnishing_id
        LEFT JOIN bsapp_db.package_inventory_mast PI ON OI.office_inventory_code = PI.inventory_code and OI.inventory_type = PI.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
	  WHERE OI.cat_id=in_cat_id AND find_in_set(OI.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1  AND  PA.is_active = 1) 
    UNION 
    (SELECT 
		PI.property_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
        PI.p_picture_link_1 as Image,
        PI.p_title as Name,
        FORMAT(PI.p_price, 2) as Price,
        0 as from_salary,
		0 as to_salary,
        PI.p_location as location,
        PI.latitude,
		PI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(PI.latitude)) * COS(RADIANS(PI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(PI.latitude))) * 6371) AS distance_in_km,
		DATE_FORMAT(PI.created_at,'%d %b %y') as Create_Date,
        PI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        BED.value as Bedroom,
        BAT.value as Bathroom,
		0 as Cabin,
        0 as Washroom,
        PI.p_sq_ft as Square_Feet, 
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		0 as year_of_registration,
		0 as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.property_inventory_mast PI
        LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
        LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
        LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON PI.property_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.package_inventory_mast PIM ON PI.property_inventory_code = PIM.inventory_code and PI.inventory_type = PIM.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PIM.purchase_ads_id = PA.id
	  WHERE PI.cat_id=in_cat_id AND find_in_set(PI.sub_cat_id,in_sub_cat_id) AND  PA.is_active = 1 ) 
    UNION 
    (SELECT 
		VI.vehicle_inventory_code AS ID,
        CAT.cat_name as Category,
        SUB.sub_cat_name as Sub_category,
		VI.v_picture_link_1 as Image,
        VI.v_title as Name,
        FORMAT(VI.v_price, 2) as Price,
		0 as from_salary,
		0 as to_salary,    
        VI.v_location as location,
        VI.latitude,
		VI.longitude,
		(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(VI.latitude)) * COS(RADIANS(VI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(VI.latitude))) * 6371) AS distance_in_km,
		DATE_FORMAT(VI.created_at,'%d %b %y') as Create_Date,
        VI.modified_at as Modify_Date,
        "" as  office_furnished,
        '' AS car_registration_state,
		0 as car_km,
		'' as owner,
        0 as Bedroom,
		0 as Bathroom,
		0 as Cabin,
        0 as Washroom,
        0 as Square_Feet,
		'' as Mobile_ram,
		'' as Mobile_rom,
        '' as Mobile_brand,
        '' as Mobile_colour,
		YM.value as year_of_registration,
		VI.kms as vehicle_km,
		'' as Job_type,
		'' as Job_salary_period
	FROM
		bsapp_db.vehicle_inventory_mast VI
        LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
        LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
        LEFT JOIN bsapp_db.ads_mast  AD ON VI.vehicle_inventory_code = AD.inventory_code
        LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
        LEFT JOIN bsapp_db.package_inventory_mast PI ON VI.vehicle_inventory_code = PI.inventory_code and VI.inventory_type = PI.inventory_type
		LEFT JOIN bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
	  WHERE VI.cat_id=in_cat_id AND find_in_set(VI.sub_cat_id,in_sub_cat_id) AND AD.ad_status_id = 1 AND PA.is_active = 1 ))AS SUBQ 
      HAVING CASE WHEN in_price_to <> 0 THEN   price BETWEEN in_price_from AND in_price_to  ELSE price >= 0 END AND 
		distance_in_km BETWEEN in_distance_from AND in_distance_to 
      ORDER BY	CASE WHEN in_distance_sorting='ASC' THEN distance_in_km END,
				CASE WHEN in_distance_sorting='DESC' THEN distance_in_km  END DESC,
				CASE WHEN in_date_sorting='ASC' THEN Create_Date END,
				CASE WHEN in_date_sorting='DESC' THEN Create_Date  END DESC,
                CASE WHEN in_price_sorting='ASC' THEN Price END ,
                CASE WHEN in_price_sorting='DESC' THEN Price END DESC
	  limit in_limit offset in_offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sponcer_near_by_location_show` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_sponcer_near_by_location_show`(
    IN in_latitude DECIMAL(11, 8),
    IN in_longitude DECIMAL(11, 8),
    IN in_from INT,
    IN in_to INT,
    IN in_limit INT,
    IN in_page_no INT
)
BEGIN DECLARE in_offset INT;

SET
    in_offset = (in_page_no - 1) * in_limit;

select
    *,
    count(*) over() AS total_record
from
    (
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                CS.car_sell_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                CS.c_picture_link_1 as Image,
                CS.car_title as Name,
                CS.c_price as Price,
                0 as from_salary,
                0 as to_salary,
                CS.c_location as location,
                DATE_FORMAT(CS.created_at, '%d %b %y') as Create_Date,
                CS.modified_at as Modify_Date,
                CASE
                    WHEN CS.modified_at > CS.created_at THEN CS.modified_at
                    ELSE CS.created_at
                END AS ORDER_DATE,
                SM.state_name AS car_registration_state,
                CS.c_km AS car_km,
                CO.name AS owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                YM.value as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.car_sell_inventory_mast AS CS
                LEFT JOIN bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON CS.car_sell_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
                LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
                LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
                LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
                left join bsapp_db.package_inventory_mast PI ON CS.car_sell_inventory_code = PI.inventory_code
                and CS.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                AI.all_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                AI.picture_link_1 as Image,
                AI.title as Name,
                AI.price as Price,
                0 as from_salary,
                0 as to_salary,
                AI.location as location,
                DATE_FORMAT(AI.created_at, '%d %b %y') as Create_Date,
                AI.modified_at as Modify_Date,
                CASE
                    WHEN AI.modified_at > AI.created_at THEN AI.modified_at
                    ELSE AI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.all_inventory_mast AS AI
                LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON AI.inventory_type = AD.inventory_type
                left join bsapp_db.package_inventory_mast PI ON AI.all_inventory_code = PI.inventory_code
                and AI.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                CR.car_rent_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                CR.c_picture_link_1 as Image,
                CR.car_title as Name,
                CR.c_price as Price,
                0 as from_salary,
                0 as to_salary,
                CR.c_location as location,
                DATE_FORMAT(CR.created_at, '%d %b %y') as Create_Date,
                CR.modified_at as Modify_Date,
                CASE
                    WHEN CR.modified_at > CR.created_at THEN CR.modified_at
                    ELSE CR.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                c_km_limit as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.car_rent_inventory_mast CR
                LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON CR.car_rent_inventory_code = AD.inventory_code
                left join bsapp_db.package_inventory_mast PI ON CR.car_rent_inventory_code = PI.inventory_code
                and CR.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                 JI.job_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                JI.j_picture_link_1 as Image,
                JI.j_title as Name,
                0 as price,
                JI.from_salary as From_salary,
                JI.to_salary as To_salary,
                JI.j_location as location,
                DATE_FORMAT(JI.created_at, '%d %b %y') as Create_Date,
                JI.modified_at as Modify_Date,
                CASE
                    WHEN JI.modified_at > JI.created_at THEN JI.modified_at
                    ELSE JI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                0 as year_of_registration,
                0 as vehicle_km,
                JT.j_type_name as Job_type,
                SP.s_p_name as Job_salary_period
            FROM
                bsapp_db.job_inventory_mast JI
                LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
                LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
                LEFT JOIN bsapp_db.ads_mast AD ON JI.job_inventory_code = AD.inventory_code
                left join bsapp_db.package_inventory_mast PI ON JI.job_inventory_code = PI.inventory_code
                and JI.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                MI.mo_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                MI.mo_picture_link_1 as Image,
                MI.mo_title as Name,
                MI.mo_price as Price,
                0 as from_salary,
                0 as to_salary,
                MI.location as location,
                DATE_FORMAT(MI.created_at, '%d %b %y') as Create_Date,
                MI.modified_at as Modify_Date,
                CASE
                    WHEN MI.modified_at > MI.created_at THEN MI.modified_at
                    ELSE MI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                MI.mo_colour AS Mobile_colour,
                '' AS Mobile_brand,
                RAM.value AS Mobile_ram,
                ROM.value AS Mobile_rom,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.mobile_inventory_mast MI
                LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON MI.mo_inventory_code = AD.inventory_code
                LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
                LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
                left join bsapp_db.package_inventory_mast PI ON MI.mo_inventory_code = PI.inventory_code
                and MI.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                OI.office_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                OI.o_picture_link_1 as Image,
                OI.o_title as Name,
                OI.o_price as Price,
                0 as from_salary,
                0 as to_salary,
                OI.o_location as location,
                DATE_FORMAT(OI.created_at, '%d %b %y') as Create_Date,
                OI.modified_at as Modify_Date,
                CASE
                    WHEN OI.modified_at > OI.created_at THEN OI.modified_at
                    ELSE OI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                OC.value as Cabin,
                OW.value as Washroom,
                OI.o_sq_ft as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.office_inventory_mast OI
                LEFT JOIN bsapp_db.office_cabin_mast OC ON OI.cabin = OC.id
                LEFT JOIN bsapp_db.office_washroom_mast OW ON OI.washroom = OW.id
                LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
                LEFT JOIN bsapp_db.property_furnishing_mast PF ON OI.p_furnishing_id = PF.p_furnishing_id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON OI.office_inventory_code = AD.inventory_code
                left join bsapp_db.package_inventory_mast PI ON OI.office_inventory_code = PI.inventory_code
                and OI.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            where
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                '' AS Inventory_code,
                PI.property_inventory_code AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                PI.p_picture_link_1 as Image,
                PI.p_title as Name,
                PI.p_price as Price,
                0 as from_salary,
                0 as to_salary,
                PI.p_location as location,
                DATE_FORMAT(PI.created_at, '%d %b %y') as Create_Date,
                PI.modified_at as Modify_Date,
                CASE
                    WHEN PI.modified_at > PI.created_at THEN PI.modified_at
                    ELSE PI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                BED.value as Bedroom,
                BAT.value as Bathroom,
                0 as Cabin,
                0 as Washroom,
                PI.p_sq_ft as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                0 as year_of_registration,
                0 as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.property_inventory_mast PI
                LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
                LEFT JOIN bsapp_db.property_bathroom_mast BAT ON PI.p_bathroom = BAT.id
                LEFT JOIN bsapp_db.property_bedroom_mast BED ON PI.p_bedroom = BED.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.ads_mast AD ON PI.property_inventory_code = AD.inventory_code
                left join bsapp_db.package_inventory_mast PIM ON PI.property_inventory_code = PIM.inventory_code
                and PI.inventory_type = PIM.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PIM.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
        UNION
        (
            SELECT
                '' AS Ads_id,
                '' AS Inventory_id,
                '' AS User_id,
                VI.vehicle_inventory_code AS Inventory_code,
                '' AS Inventory_type,
                '' AS From_date,
                '' AS To_date,
                '' AS As_status_code,
                '' AS Ad_status,
                '' AS Ad_status_message,
                '' AS likes,
                '' AS views,
                '' AS Created_date,
                '' AS Ad_created_date,
                '' AS Ad_modified_date,
                CAT.cat_name as Category,
                CAT.id AS Category_id,
                SUB.id AS Sub_category_id,
                SUB.sub_cat_name as Sub_category,
                VI.v_picture_link_1 as Image,
                VI.v_title as Name,
                VI.v_price as Price,
                0 as from_salary,
                0 as to_salary,
                VI.v_location as location,
                DATE_FORMAT(VI.created_at, '%d %b %y') as Create_Date,
                VI.modified_at as Modify_Date,
                CASE
                    WHEN VI.modified_at > VI.created_at THEN VI.modified_at
                    ELSE VI.created_at
                END AS ORDER_DATE,
                '' AS car_registration_state,
                0 as car_km,
                '' as owner,
                0 as Bedroom,
                0 as Bathroom,
                0 as Cabin,
                0 as Washroom,
                0 as Square_Feet,
                '' AS Mobile_colour,
                '' AS Mobile_brand,
                '' as Mobile_ram,
                '' as Mobile_rom,
                YM.value as year_of_registration,
                VI.kms as vehicle_km,
                '' as Job_type,
                '' as Job_salary_period
            FROM
                bsapp_db.vehicle_inventory_mast VI
                LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
                LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
                LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id
                LEFT JOIN bsapp_db.ads_mast AD ON VI.vehicle_inventory_code = AD.inventory_code
                left join bsapp_db.package_inventory_mast PI ON VI.vehicle_inventory_code = PI.inventory_code
                and VI.inventory_type = PI.inventory_type
                left join bsapp_db.purchase_ads_mast PA ON PI.purchase_ads_id = PA.id
            WHERE
                PA.is_active = 1
        )
    ) AS SUBQ
ORDER BY
    ORDER_DATE DESC
limit
    in_limit offset in_offset;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sponsored_recommendations_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_sponsored_recommendations_list`(
	IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
    IN in_limit INT,
    IN in_page_no INT
    
)
BEGIN
	DECLARE  in_offset INT;
	SET in_offset = (in_page_no - 1) * in_limit;
	SELECT  
		ID, is_active, Category,Sub_category, Image, Name, FORMAT(Price, 0) AS Price, FORMAT(from_salary, 0) AS from_salary, 
        FORMAT(to_salary, 0) AS to_salary, location,
        latitude, longitude, distance_in_km, Create_Date, Modify_Date, office_furnished, car_registration_state, 
        car_km, owner, Bedroom, Bathroom, Cabin, Washroom, Square_Feet, Mobile_ram, Mobile_rom, 
        year_of_registration, vehicle_km, Job_type, Job_salary_period,count(*) over() as total_record
    FROM
    (SELECT 
		SUBQ.ID, Category, Sub_category, Image, Name, SUBQ.Price, from_salary, to_salary, location, latitude, 
        longitude, distance_in_km, Create_Date, Modify_Date, office_furnished, car_registration_state, car_km, 
        owner, Bedroom, Bathroom, Cabin, Washroom, Square_Feet, Mobile_ram, Mobile_rom, 
        year_of_registration, vehicle_km, Job_type, Job_salary_period, is_active,
        ROW_NUMBER() OVER (partition by result.SUBQ.ID) AS RowNumber
    FROM
		((SELECT 
			CS.car_sell_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			CS.c_picture_link_1 as Image,
			CS.car_title as Name,
			CS.c_price as Price,
			0 as from_salary,
			0 as to_salary,
			CS.c_location as location,
			CS.latitude,
			CS.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(CS.latitude)) * COS(RADIANS(CS.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(CS.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(CS.created_at,'%d %b %y') as Create_Date,
			CS.modified_at as Modify_Date,
			"" as  office_furnished,
			SM.state_name AS car_registration_state,
			CS.c_km AS car_km,
			CO.name AS owner,
			0 as Bedroom,
			0 as Bathroom,
			0 as Cabin,
			0 as Washroom,
			0 as Square_Feet,
			'' as Mobile_ram,
			'' as Mobile_rom,
			YM.value as year_of_registration,
			0 as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.car_sell_inventory_mast AS CS
			LEFT JOIN bsapp_db.category_mast CAT ON CS.cat_id = CAT.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON CS.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.ads_mast  AD ON CS.car_sell_inventory_code = AD.inventory_code
			LEFT JOIN bsapp_db.car_model_name_mast CM ON CM.id = CS.car_model_name
			LEFT JOIN bsapp_db.car_owner_mast CO ON CO.id = CS.c_owner
			LEFT JOIN bsapp_db.year_mast YM ON YM.id = CS.year
			LEFT JOIN bsapp_db.state_mast SM ON SM.id = CS.c_registration
		WHERE AD.ad_status_id = 1 
		ORDER BY distance_in_km ASC) 
		UNION 
		(SELECT 
			AI.all_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			AI.picture_link_1 as Image,
			AI.title as Name,
			AI.price as Price,
			0 as from_salary,
			0 as to_salary,
			AI.location as location,
			AI.latitude,
			AI.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(AI.latitude)) * COS(RADIANS(AI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(AI.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(AI.created_at,'%d %b %y')as Create_Date,
			AI.modified_at as Modify_Date,
			"" as  office_furnished,
			'' AS car_registration_state,
			0 as car_km,
			'' as owner,
			0 as Bedroom,
			0 as Bathroom,
			0 as Cabin,
			0 as Washroom,
			0 as Square_Feet,
			'' as Mobile_ram,
			'' as Mobile_rom,
			0 as year_of_registration,
			0 as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.all_inventory_mast AS AI
			LEFT JOIN bsapp_db.category_mast CAT ON AI.cat_id = CAT.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON AI.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.ads_mast  AD ON AI.all_inventory_code = AD.inventory_code
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC) 
		UNION 
		(SELECT 
			CR.car_rent_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			CR.c_picture_link_1 as Image,
			CR.car_title as Name,
			CR.c_price as Price,
			0 as from_salary,
			0 as to_salary,
			CR.c_location as location,
			CR.latitude,
			CR.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(CR.latitude)) * COS(RADIANS(CR.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(CR.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(CR.created_at,'%d %b %y') as Create_Date,
			CR.modified_at as Modify_Date,
			"" as  office_furnished,
			'' AS car_registration_state,
			c_km_limit as car_km,
			'' as owner,
			0 as Bedroom,
			0 as Bathroom,
			0 as Cabin,
			0 as Washroom,
			0 as Square_Feet,
			'' as Mobile_ram,
			'' as Mobile_rom,
			0 as year_of_registration,
			0 as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.car_rent_inventory_mast CR
			LEFT JOIN bsapp_db.category_mast CAT ON CR.cat_id = CAT.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON CR.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.ads_mast  AD ON CR.car_rent_inventory_code = AD.inventory_code
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC) 
        UNION 
        (SELECT 
			JI.job_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			JI.j_picture_link_1 as Image,
			JI.j_title as Name,
			0 as price,
			JI.from_salary as From_salary,
			JI.to_salary as To_salary,
			JI.j_location as location,
			JI.latitude,
			JI.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(JI.latitude)) * COS(RADIANS(JI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(JI.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(JI.created_at,'%d %b %y') as Create_Date,
			JI.modified_at as Modify_Date,
			"" as  office_furnished,
			'' AS car_registration_state,
			0 as car_km,
			'' as owner,
			0 as Bedroom,
			0 as Bathroom,
			0 as Cabin,
			0 as Washroom,
			0 as Square_Feet,
			'' as Mobile_ram,
			'' as Mobile_rom,
			0 as year_of_registration,
			0 as vehicle_km,
			JT.j_type_name as Job_type,
			SP.s_p_name as Job_salary_period
		FROM
			bsapp_db.job_inventory_mast JI
			LEFT JOIN bsapp_db.category_mast CAT ON JI.cat_id = CAT.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON JI.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.job_type_mast JT ON JT.j_type_id = JI.j_type_id
			LEFT JOIN bsapp_db.salary_period_mast SP ON SP.s_p_id = JI.s_p_id
			LEFT JOIN bsapp_db.ads_mast  AD ON JI.job_inventory_code = AD.inventory_code
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC) 
		UNION 
		(SELECT 
			MI.mo_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			MI.mo_picture_link_1 as Image,
			MI.mo_title as Name,
			MI.mo_price as Price,
			0 as from_salary,
			0 as to_salary,
			MI.location as location,
			MI.latitude,
			MI.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(MI.latitude)) * COS(RADIANS(MI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(MI.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(MI.created_at,'%d %b %y') as Create_Date,
			MI.modified_at as Modify_Date,
			"" as  office_furnished,
			'' AS car_registration_state,
			0 as car_km,
			'' as owner,
			0 as Bedroom,
			0 as Bathroom,
			0 as Cabin,
			0 as Washroom,
			0 as Square_Feet,
			RAM.value AS Mobile_ram,
			ROM.value AS Mobile_rom,
			0 as year_of_registration,
			0 as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.mobile_inventory_mast MI
			LEFT JOIN bsapp_db.category_mast CAT ON MI.cat_id = CAT.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON MI.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.ads_mast  AD ON MI.mo_inventory_code = AD.inventory_code
			LEFT JOIN bsapp_db.mobile_ram_mast RAM ON RAM.id = MI.mo_ram
			LEFT JOIN bsapp_db.mobile_rom_mast ROM ON ROM.id = MI.mo_rom
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC) 
        UNION 
        (SELECT 
			OI.office_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			OI.o_picture_link_1 as Image,
			OI.o_title as Name,
			OI.o_price as Price,
			0 as from_salary,
			0 as to_salary,
			OI.o_location as location,
			OI.latitude,
			OI.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(OI.latitude)) * COS(RADIANS(OI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(OI.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(OI.created_at,'%d %b %y') as Create_Date,
			OI.modified_at as Modify_Date,
			PF.p_furnishing_name as  office_furnished,
			'' AS car_registration_state,
			0 as car_km,
			'' as owner,
			0 as Bedroom,
			0 as Bathroom,
			OC.value as Cabin,
			OW.value as Washroom,
			OI.o_sq_ft as Square_Feet, 
			'' as Mobile_ram,
			'' as Mobile_rom,
			0 as year_of_registration,
			0 as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.office_inventory_mast OI
			LEFT JOIN bsapp_db.office_cabin_mast  OC  ON  OI.cabin =OC.id
			LEFT JOIN bsapp_db.office_washroom_mast  OW  ON  OI.washroom =OW.id
			LEFT JOIN bsapp_db.category_mast CAT ON OI.cat_id = CAT.id
			LEFT JOIN bsapp_db.property_furnishing_mast  PF  ON  OI.p_furnishing_id =PF.p_furnishing_id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON OI.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.ads_mast  AD ON OI.office_inventory_code = AD.inventory_code
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC) 
		UNION 
		(SELECT 
			PI.property_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			PI.p_picture_link_1 as Image,
			PI.p_title as Name,
			PI.p_price as Price,
			0 as from_salary,
			0 as to_salary,
			PI.p_location as location,
			PI.latitude,
			PI.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(PI.latitude)) * COS(RADIANS(PI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(PI.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(PI.created_at,'%d %b %y') as Create_Date,
			PI.modified_at as Modify_Date,
			"" as  office_furnished,
			'' AS car_registration_state,
			0 as car_km,
			'' as owner,
			BED.value as Bedroom,
			BAT.value as Bathroom,
			0 as Cabin,
			0 as Washroom,
			PI.p_sq_ft as Square_Feet, 
			'' as Mobile_ram,
			'' as Mobile_rom,
			0 as year_of_registration,
			0 as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.property_inventory_mast PI
			LEFT JOIN bsapp_db.category_mast CAT ON PI.cat_id = CAT.id
			LEFT JOIN bsapp_db.property_bathroom_mast  BAT  ON  PI.p_bathroom =BAT.id
			LEFT JOIN bsapp_db.property_bedroom_mast  BED  ON  PI.p_bedroom =BED.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON PI.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.ads_mast  AD ON PI.property_inventory_code = AD.inventory_code
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC) 
		UNION 
		(SELECT 
			VI.vehicle_inventory_code AS ID,
			CAT.cat_name as Category,
			SUB.sub_cat_name as Sub_category,
			VI.v_picture_link_1 as Image,
			VI.v_title as Name,
			VI.v_price as Price,
			0 as from_salary,
			0 as to_salary,
			VI.v_location as location,
			VI.latitude,
			VI.longitude,
			(ACOS(COS(RADIANS(in_latitude)) * COS(RADIANS(VI.latitude)) * COS(RADIANS(VI.longitude) - RADIANS(in_longitude)) + SIN(RADIANS(in_latitude)) * SIN(RADIANS(VI.latitude))) * 6371) AS distance_in_km,
			DATE_FORMAT(VI.created_at,'%d %b %y') as Create_Date,
			VI.modified_at as Modify_Date,
			"" as  office_furnished,
			'' AS car_registration_state,
			0 as car_km,
			'' as owner,
			0 as Bedroom,
			0 as Bathroom,
			0 as Cabin,
			0 as Washroom,
			0 as Square_Feet,
			'' as Mobile_ram,
			'' as Mobile_rom,
			YM.value as year_of_registration,
			VI.kms as vehicle_km,
			'' as Job_type,
			'' as Job_salary_period
		FROM
			bsapp_db.vehicle_inventory_mast VI
			LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
			LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
			LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
			LEFT JOIN bsapp_db.ads_mast  AD ON VI.vehicle_inventory_code = AD.inventory_code
		WHERE AD.ad_status_id = 1
		ORDER BY distance_in_km ASC)) AS SUBQ  
	INNER JOIN bsapp_db.package_inventory_mast PKG ON SUBQ.ID = PKG.inventory_code
    INNER JOIN bsapp_db.purchase_ads_mast PA ON PKG.purchase_ads_id = PA.id AND PA.is_active = 1
    ORDER BY PA.created_at DESC) as result
    WHERE result.RowNumber = 1 limit in_limit 
    offset in_offset ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_state_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_state_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.state_mast
    WHERE id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_state_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_state_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.state_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_state_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_state_mast_save`(
	IN in_id INT,
    IN in_state_name VARCHAR(126)
)
BEGIN
	IF NOT EXISTS(SELECT * FROM bsapp_db.state_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.state_mast (state_name, created_at)
        VALUES (in_state_name, now());
    ELSE
		UPDATE bsapp_db.state_mast
        SET
		state_name = in_state_name,
        modified_at = now()
        WHERE id = in_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sub_category_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_sub_category_mast_delete`(
	in in_id int
)
BEGIN
DELETE FROM bsapp_db.sub_category_mast where id = in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sub_category_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_sub_category_mast_fill`(
 IN in_cat_id int
)
BEGIN
	SELECT 
		SCM.id as sub_cat_id,SCM.cat_id,SCM.sub_cat_name,CM.cat_name
	FROM bsapp_db.sub_category_mast SCM  
    LEFT JOIN bsapp_db.category_mast CM  
    ON  SCM.cat_id = CM.id  where CM.id  = in_cat_id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_sub_category_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_sub_category_mast_save`(
	in in_id int,
    in in_cat_id int,
    in in_sub_cat_name varchar(126)
)
BEGIN

IF NOT EXISTS(select id from bsapp_db.sub_category_mast where id = in_id) THEN
	INSERT INTO bsapp_db.sub_category_mast
			(cat_id,
			sub_cat_name,
            created_at)
	VALUES
			(in_cat_id,
			in_sub_cat_name,
            now());
ELSE
	UPDATE bsapp_db.sub_category_mast
	SET
	cat_id = in_cat_id,
	sub_cat_name = in_sub_cat_name,
    modified_at = now()
	WHERE id = in_id;

END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_category_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_category_mast_delete`(
in in_cat_id varchar(5)
)
BEGIN
DELETE FROM bsapp_db.user_category_mast where cat_id = in_cat_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_category_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_category_mast_fill`()
BEGIN
  SELECT cat_id, cat_name FROM bsapp_db.user_category_mast;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_category_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_category_mast_save`(
in in_cat_id varchar(5),
in in_cat_name varchar(16)
)
BEGIN
IF NOT EXISTS(select cat_id from bsapp_db.user_category_mast where cat_id = in_cat_id) THEN
 	INSERT INTO bsapp_db.user_category_mast
		(cat_id,cat_name,created_at)
	VALUES
		(in_cat_id,in_cat_name,now());
ELSE
   UPDATE bsapp_db.user_category_mast
	SET
	cat_name = in_cat_name,
    modified_at = now()
	WHERE cat_id = in_cat_id;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_followers_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_followers_mast_delete`(
	IN in_user_id VARCHAR(125),
    IN in_following_id VARCHAR(125)
)
BEGIN
	DELETE FROM bsapp_db.user_followers_mast 
    WHERE user_id = in_following_id AND follower_id = in_user_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_followers_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_followers_mast_save`(
	IN in_user_id VARCHAR(125),
    IN in_following_id VARCHAR(125)
)
BEGIN
	INSERT INTO bsapp_db.user_followers_mast (user_id, follower_id, created_at)
    VALUES(in_following_id, in_user_id, now());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_mast_delete`(
 in in_login_id int
)
BEGIN
DELETE FROM bsapp_db.user_mast where user_id = in_login_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_mast_fill`(
in in_login_id int
)
BEGIN
SELECT * FROM bsapp_db.user_mast where user_id=in_login_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_user_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_user_mast_save`(
in in_login_id int,
in in_mobile_no varchar(16),
in in_mail_id varchar(64),
in in_name varchar(126),
in in_bio_description varchar(512),
in in_profile_picture_link varchar(512),
in in_mobile_cc_code varchar(8),
in in_user_cat varchar(5),
in in_password varchar(126),
in in_otp int,
in in_is_verify boolean

)
BEGIN
DECLARE in_login_seq_id BIGINT;

IF NOT EXISTS(select login_id from bsapp_db.user_mast where  mobile_no = in_mobile_no  AND mail_id = in_mail_id) THEN
 	call sp_login_sequence();
    SET in_login_seq_id = (select  seq_id  from bsapp_db.login_sequence_mast where seq_date = CURDATE());
    INSERT INTO bsapp_db.user_mast
		(login_id,mobile_no,mail_id,name,bio_description,profile_picture_link,mobile_cc_code,user_cat,password,otp,is_verify,created_at)
	VALUES
		(in_login_seq_id,in_mobile_no,in_mail_id,in_name,in_bio_description,in_profile_picture_link,in_mobile_cc_code,in_user_cat,in_password,in_otp,in_is_verify,now());
	
ELSE
   UPDATE bsapp_db.user_mast
	SET
	mail_id = in_mail_id,
    name = in_name,
    bio_description = in_bio_description,
    profile_picture_link = in_profile_picture_link,
    user_cat = in_user_cat,
    modified_at = now()
	WHERE user_id = in_login_id;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_inventory_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_vehicle_inventory_mast_delete`(
	IN in_vehicle_inventory_id INT,
	IN in_user_id VARCHAR(125)
)
BEGIN
DECLARE ads_id INT;
SET ads_id = (SELECT AD.ads_id FROM bsapp_db.ads_mast AD INNER JOIN bsapp_db.vehicle_inventory_mast VI  ON  AD.inventory_code= VI.vehicle_inventory_code WHERE AD.user_id = in_user_id AND AD.inventory_id = in_vehicle_inventory_id );
	DELETE FROM bsapp_db.vehicle_inventory_mast WHERE vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id ;
call bsapp_db.sp_ads_mast_delete(ads_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_inventory_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_vehicle_inventory_mast_fill`(
	IN in_vehicle_inventory_code VARCHAR(126),
	IN in_cat_id INT
)
BEGIN
	SELECT  VI.vehicle_inventory_id, IFNULL(VI.user_id, "-") as user_id,
    IFNULL(VI.vehicle_inventory_code, "-") as vehicle_inventory_code, IFNULL(VI.inventory_type, "-") as inventory_type,
    IFNULL(VI.v_title, "-") as v_title, IFNULL(FORMAT(VI.v_price, 0), "-") as v_price,
    VI.v_picture_link_1, VI.v_picture_link_2, VI.v_picture_link_3, VI.v_picture_link_4, VI.v_picture_link_5,
    VI.v_picture_link_6, VI.v_picture_link_7, VI.v_picture_link_8, VI.v_picture_link_9, VI.v_picture_link_10,
    IFNULL(VT.v_type_name, "-") as v_type_name, IFNULL(CBM.name, "-") as brand,
    IFNULL(VI.kms, "-") as kms, IFNULL(VI.month, "-") as month,
    IFNULL(YM.value, "-") as year, IFNULL(VI.insuarance, "-") as insuarance,
    IFNULL(VI.i_description, "-") as i_description, IFNULL(VI.v_show_mo_no, "-") as v_show_mo_no,
    IFNULL(VI.v_description, "-") as v_description, IFNULL(VI.v_location, "-") as v_location,
    IFNULL(DATE_FORMAT(VI.created_at,'%d %b %y'), "-") as ad_created,
    IFNULL(VI.modified_at, "-") as modified_at, IFNULL(UM.profile_picture_link, "-") as profile_picture,
    IFNULL(UM.name, "-") as user_name, IFNULL(DATE_FORMAT(UM.created_at,'%b %y'), "-") as user_created,
    IFNULL(CAT.cat_name, "-") as cat_name, IFNULL(SUB.sub_cat_name, "-") as sub_cat_name,
    IFNULL(CAT.id, "-") as cat_id, IFNULL(SUB.id, "-") as sub_cat_id
    FROM bsapp_db.vehicle_inventory_mast VI
    LEFT JOIN bsapp_db.vehicle_type_mast VT ON VI.v_type_id = VT.v_type_id
    LEFT JOIN bsapp_db.year_mast YM ON VI.year = YM.id 
    LEFT JOIN bsapp_db.commercial_brand_mast CBM ON VI.brand = CBM.id 
    LEFT JOIN bsapp_db.category_mast CAT ON VI.cat_id = CAT.id
	LEFT JOIN bsapp_db.sub_category_mast SUB ON VI.sub_cat_id = SUB.id
    LEFT JOIN bsapp_db.ads_mast AD ON AD.inventory_code = VI.vehicle_inventory_code 
	LEFT JOIN bsapp_db.user_mast UM ON UM.user_id = VI.user_id
    WHERE VI.vehicle_inventory_code = in_vehicle_inventory_code AND VI.cat_id = in_cat_id  ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_inventory_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_vehicle_inventory_mast_save`(
	IN in_vehicle_inventory_id INT,
    IN in_user_id VARCHAR(125),
    IN in_v_title VARCHAR(126),
	IN in_v_price INT,
	IN in_v_picture_link_1 VARCHAR(512),
    IN in_v_picture_link_2 VARCHAR(512),
    IN in_v_picture_link_3 VARCHAR(512),
    IN in_v_picture_link_4 VARCHAR(512),
    IN in_v_picture_link_5 VARCHAR(512),
    IN in_v_picture_link_6 VARCHAR(512),
    IN in_v_picture_link_7 VARCHAR(512),
    IN in_v_picture_link_8 VARCHAR(512),
    IN in_v_picture_link_9 VARCHAR(512),
    IN in_v_picture_link_10 VARCHAR(512),
    IN in_v_type_id INT,
    IN in_brand VARCHAR(126),
    IN in_kms INT,
    IN in_month INT,
    IN in_year INT,
    IN in_insuarance BOOLEAN,
    IN in_i_description VARCHAR(512),
    IN in_v_show_mo_no  BOOLEAN,
	IN in_v_description VARCHAR(512),
	IN in_v_location VARCHAR(512),
	IN in_latitude DECIMAL(11,8),
    IN in_longitude DECIMAL(11,8),
	IN in_cat_id INT,
	IN in_sub_cat_id INT
)
BEGIN
DECLARE get_max_inventory_id INT;

select COALESCE(MAX(vehicle_inventory_id)+1,1) INTO get_max_inventory_id from bsapp_db.vehicle_inventory_mast;

IF NOT EXISTS(select vehicle_inventory_id from bsapp_db.vehicle_inventory_mast where vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id) THEN
	INSERT INTO bsapp_db.vehicle_inventory_mast
    		(vehicle_inventory_id,user_id,vehicle_inventory_code,inventory_type,v_title,v_price,v_picture_link_1,v_picture_link_2,v_picture_link_3,v_picture_link_4,v_picture_link_5,v_picture_link_6,v_picture_link_7,v_picture_link_8,v_picture_link_9,v_picture_link_10,v_type_id,brand,kms,month,year,insuarance,i_description,v_show_mo_no,v_description,v_location,latitude,longitude,created_at,cat_id,sub_cat_id)
	VALUES
			(get_max_inventory_id,in_user_id,concat("comm_vehicle_",get_max_inventory_id),"commercial vehicle",in_v_title,in_v_price,in_v_picture_link_1,in_v_picture_link_2,in_v_picture_link_3,in_v_picture_link_4,in_v_picture_link_5,in_v_picture_link_6,in_v_picture_link_7,in_v_picture_link_8,in_v_picture_link_9,in_v_picture_link_10,in_v_type_id,in_brand,in_kms,in_month,in_year,in_insuarance,CASE WHEN insuarance=TRUE THEN  in_i_description ELSE null END,in_v_show_mo_no,in_v_description,in_v_location,in_latitude,in_longitude,now(),in_cat_id,in_sub_cat_id);
	call bsapp_db.sp_ads_mast_save(0,get_max_inventory_id,in_user_id,concat("comm_vehicle_",get_max_inventory_id),"commercial vehicle",1);
    select * from bsapp_db.vehicle_inventory_mast where vehicle_inventory_id = get_max_inventory_id and user_id = in_user_id;
ELSE
	UPDATE bsapp_db.vehicle_inventory_mast
	SET
	v_title = in_v_title,
    v_price = in_v_price,
    v_picture_link_1 = in_v_picture_link_1,
    v_picture_link_2 = in_v_picture_link_2,
    v_picture_link_3 = in_v_picture_link_3,
    v_picture_link_4 = in_v_picture_link_4,
    v_picture_link_5 = in_v_picture_link_5,
    v_picture_link_6 = in_v_picture_link_6,
    v_picture_link_7 = in_v_picture_link_7,
    v_picture_link_8 = in_v_picture_link_8,
    v_picture_link_9 = in_v_picture_link_9,
    v_picture_link_10 = in_v_picture_link_10,
    v_type_id = in_v_type_id,
    brand = in_brand,
    month = in_month,
    kms = in_kms,
    year = in_year,
    insuarance = in_insuarance,
    i_description = CASE WHEN insuarance=TRUE THEN  in_i_description ELSE null END,
	v_show_mo_no = in_v_show_mo_no,
    v_description = in_v_description,
	v_location = in_v_location,
    latitude = in_latitude,
    longitude = in_longitude,
    modified_at = now(),
	cat_id = in_cat_id,
	sub_cat_id = in_sub_cat_id
	WHERE vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id;
	select * from bsapp_db.vehicle_inventory_mast where  vehicle_inventory_id = in_vehicle_inventory_id AND user_id = in_user_id;
END IF;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_type_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_vehicle_type_mast_delete`(
	IN 	in_v_type_id INT
)
BEGIN
	DELETE FROM bsapp_db.vehicle_type_mast WHERE v_type_id = in_v_type_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_type_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_vehicle_type_mast_fill`(
	IN v_type_id int
)
BEGIN
	SELECT * FROM bsapp_db.vehicle_type_mast ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_vehicle_type_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_vehicle_type_mast_save`(
	IN 	in_v_type_id INT,
    IN  in_v_type_name VARCHAR(126)
)
BEGIN
IF NOT EXISTS(SELECT v_type_id FROM bsapp_db.vehicle_type_mast WHERE v_type_id = in_v_type_id) THEN
 	INSERT INTO bsapp_db.vehicle_type_mast
		(v_type_name,created_at)
	VALUES
		(in_v_type_name,now());
ELSE
   UPDATE bsapp_db.vehicle_type_mast
	SET
	v_type_name = in_v_type_name,
    modified_at = now()
	WHERE v_type_id = in_v_type_id;

END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_verify_email_otp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_verify_email_otp`(
	IN in_email VARCHAR(64),
    IN in_otp INT
)
BEGIN
	IF NOT EXISTS (SELECT mail_id , otp FROM bsapp_db.user_mast WHERE mail_id = in_email AND otp = in_otp) THEN
		SELECT "OTP NOT MATCH" AS MSG;
    ELSE
		UPDATE bsapp_db.user_mast
        SET 
        is_verify = 1
        WHERE mail_id = in_email AND otp = in_otp;
        SELECT login_id,user_id FROM bsapp_db.user_mast WHERE mail_id = in_email AND otp = in_otp;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_verify_otp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_verify_otp`(
 in in_mobile_no  varchar(16),
 in in_mobile_cc_code varchar(8),
 in in_otp int
)
BEGIN
   IF NOT EXISTS(
	   SELECT mobile_no,mobile_cc_code,otp
	   FROM bsapp_db.user_mast 
	   WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code AND otp=in_otp)
   THEN
	SELECT "OTP NOT MATCH" as MSG;
ELSE
	UPDATE bsapp_db.user_mast
	SET
    is_verify = true
	WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code AND otp=in_otp;
    SELECT login_id,user_id,name,mobile_no,mobile_cc_code,otp,is_verify FROM bsapp_db.user_mast WHERE mobile_no = in_mobile_no AND mobile_cc_code=in_mobile_cc_code AND otp=in_otp;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_views_count_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_views_count_mast_save`(
    IN in_ads_id INT,
    IN in_user_id VARCHAR(125)
)
BEGIN
IF NOT EXISTS(select ads_id,user_id from bsapp_db.views_count_mast where ads_id = in_ads_id AND user_id = in_user_id ) THEN
 	INSERT INTO bsapp_db.views_count_mast
		(ads_id,user_id,views_count)
	VALUES
		(in_ads_id,in_user_id,1);
		
END IF;
 UPDATE bsapp_db.ads_mast SET  views = (select COUNT(views_count)  from bsapp_db.views_count_mast WHERE ads_id = in_ads_id  ) WHERE ads_id = in_ads_id;
 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_year_mast_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_year_mast_delete`(
	IN in_id INT
)
BEGIN
	DELETE FROM bsapp_db.year_mast WHERE id= in_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_year_mast_fill` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_year_mast_fill`()
BEGIN
	SELECT * FROM bsapp_db.year_mast ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_year_mast_save` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `sp_year_mast_save`(
	IN in_id INT,
	IN in_value INT
)
BEGIN
	IF NOT EXISTS(SELECT id FROM bsapp_db.year_mast WHERE id = in_id) THEN
		INSERT INTO bsapp_db.year_mast (value,created_at) VALUES (in_value,now());
	ELSE
		UPDATE bsapp_db.year_mast
        SET 
        value = in_value ,
        modified_at = now()
        WHERE id = in_id;	
	END IF;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-09 11:05:23
