-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: audiovisuales
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `evaluation`
--

DROP TABLE IF EXISTS `evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluation` (
  `id` varchar(15) NOT NULL,
  `evaluation` text NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluation`
--

LOCK TABLES `evaluation` WRITE;
/*!40000 ALTER TABLE `evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prod_vs_res`
--

DROP TABLE IF EXISTS `prod_vs_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prod_vs_res` (
  `id` varchar(15) NOT NULL,
  `product_id` varchar(15) NOT NULL,
  `reservation_id` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_prod_vs_res_product1_idx` (`product_id`),
  KEY `fk_prod_vs_res_reservation1_idx` (`reservation_id`),
  CONSTRAINT `fk_prod_vs_res_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_prod_vs_res_reservation1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prod_vs_res`
--

LOCK TABLES `prod_vs_res` WRITE;
/*!40000 ALTER TABLE `prod_vs_res` DISABLE KEYS */;
/*!40000 ALTER TABLE `prod_vs_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` varchar(15) NOT NULL,
  `name` varchar(45) NOT NULL,
  `product_type_id` varchar(15) NOT NULL,
  `product_brand_id` varchar(15) NOT NULL,
  `stock` int NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_product_product type_idx` (`product_type_id`),
  KEY `fk_product_product_brand1_idx` (`product_brand_id`),
  CONSTRAINT `fk_product_product type` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_product_brand1` FOREIGN KEY (`product_brand_id`) REFERENCES `product_brand` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('1','LATITUDE 7400','1','1',1,1,'2023-01-27 02:31:30','2023-01-27 02:31:30'),('2','VS260','2','2',1,1,'2023-01-27 02:32:02','2023-01-27 02:32:02');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_brand`
--

DROP TABLE IF EXISTS `product_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_brand` (
  `id` varchar(15) NOT NULL,
  `brand` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_brand`
--

LOCK TABLES `product_brand` WRITE;
/*!40000 ALTER TABLE `product_brand` DISABLE KEYS */;
INSERT INTO `product_brand` VALUES ('1','DELL'),('2','EPSON');
/*!40000 ALTER TABLE `product_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_type`
--

DROP TABLE IF EXISTS `product_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_type` (
  `id` varchar(15) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_type`
--

LOCK TABLES `product_type` WRITE;
/*!40000 ALTER TABLE `product_type` DISABLE KEYS */;
INSERT INTO `product_type` VALUES ('1','LAPTOP'),('2','PROYECTOR');
/*!40000 ALTER TABLE `product_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `id` varchar(50) NOT NULL,
  `from_date` datetime(2) NOT NULL,
  `to_date` datetime(2) NOT NULL,
  `user_type` varchar(10) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(80) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_code` varchar(10) NOT NULL,
  `user_classroom` varchar(4) NOT NULL,
  `user_course` varchar(50) NOT NULL,
  `user_career` varchar(50) NOT NULL,
  `prof_name` varchar(50) DEFAULT NULL,
  `prof_code` varchar(6) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `evaluation_id` varchar(15) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `assistant_id` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `assistant_id` (`assistant_id`),
  KEY `fk_reservation_evaluation1_idx` (`evaluation_id`),
  CONSTRAINT `assistant_id` FOREIGN KEY (`assistant_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reservation_evaluation1` FOREIGN KEY (`evaluation_id`) REFERENCES `evaluation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES ('0ed2756b-bfb3-47d2-9545-d9d1af453b65','2023-02-18 02:30:00.00','2023-02-18 06:00:00.00','Docente','Iván','ivan@utesa.edu.com','+1809-000-0000','INF058','C405','Proyecto Integrador','Ing. en Sistemas Computacionales','null','null',1,NULL,'2023-02-07 23:29:41','2023-02-07 23:29:41',NULL),('53420384-25a0-4ddd-8013-2f3a38b8948e','2023-02-24 05:30:00.00','2023-02-24 07:00:00.00','Docente','Iván','ivan@utesa.edu.com','+1809-000-0000','INF058','C301','Prog. Videojuegos','Ing. en Sistemas Computacionales','null','null',1,NULL,'2023-02-08 00:30:06','2023-02-08 00:30:06',NULL),('d174c990-4820-4d44-99c7-23bd94882c15','2023-02-16 05:30:00.00','2023-02-16 07:45:00.00','Docente','Iván','ivan@utesa.edu.com','+1809-000-0000','INF058','B426','Prog. Videojuegos','Ing. en Sistemas Computacionales','null','null',1,NULL,'2023-02-06 02:50:34','2023-02-06 02:50:34',NULL);

INSERT INTO `reservation` VALUES ('0ed2756b-bfb3-47d2-9545-d9d1af453b62','2023-02-25 02:30:00.00','2023-02-25 06:00:00.00','Docente','Iván','ivan@utesa.edu.com','+1809-000-0000','INF058','C405','Proyecto Integrador','Ing. en Sistemas Computacionales','null','null',1,NULL,'2023-02-10 23:29:41','2023-02-10 23:29:41',NULL);

,('53420384-25a0-4ddd-8013-2f3a38b8948e','2023-02-24 05:30:00.00','2023-02-24 07:00:00.00','Docente','Iván','ivan@utesa.edu.com','+1809-000-0000','INF058','C301','Prog. Videojuegos','Ing. en Sistemas Computacionales','null','null',1,NULL,'2023-02-08 00:30:06','2023-02-08 00:30:06',NULL),('d174c990-4820-4d44-99c7-23bd94882c15','2023-02-16 05:30:00.00','2023-02-16 07:45:00.00','Docente','Iván','ivan@utesa.edu.com','+1809-000-0000','INF058','B426','Prog. Videojuegos','Ing. en Sistemas Computacionales','null','null',1,NULL,'2023-02-06 02:50:34','2023-02-06 02:50:34',NULL);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` varchar(15) NOT NULL,
  `role` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_UNIQUE` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('0','Admin','2022-12-04 01:17:26','2022-12-04 01:17:26'),('1','Auxiliar','2022-12-04 01:17:26','2022-12-04 01:17:26');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` varchar(15) NOT NULL,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(15) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_id` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `birthday` date NOT NULL,
  `email` varchar(80) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `schedule_id` varchar(15) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `schedule_id` (`schedule_id`),
  KEY `fk_user_role1_idx` (`role_id`),
  CONSTRAINT `fk_user_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('0','admin','$2b$10$n1UWsoXitVAyMBfbafPfM.c6C6TTClaEwSRHFYV7rGpFZyQfsIFgu','0','admin_name','admin_surname','2022-12-25','admin@admin.com','+18098098091',NULL,0,'2022-12-07 11:44:36','2023-01-27 00:51:51'),('1','user','$2b$10$YHefBiRLJVlc1whrCZvkEeDjRqfGNycPTmz0E8AxJsMNn/nhzXvvK','1','user_name','user_surname','2022-12-25','user@user.com','+18298298291',NULL,1,'2022-12-07 11:44:36','2022-12-07 11:44:36'),('3d68bfc3-cf90-4','Ivan_Test','$2b$10$D5WTpuhI4Un7mu4iGJgeYOyxd3UFXosNpM0ZA8.DQ9Qgr6DGRrRjW','1','Ivan_Test','Iavn_Test','2022-12-01','ivanmendoza2011@hotmail.com','+18097520141',NULL,1,'2022-12-21 17:45:10','2022-12-21 17:45:10'),('437a326c-8764-4','test','$2b$10$o5qhaIfRiWv5m7Rbsubw2OhnTAUaKHOnXLssFSyd0vyaYLDZ4Q3c6','1','testname','testsurname','2022-12-20','test@test.com','+18098091234',NULL,0,'2022-12-07 12:34:21','2022-12-07 12:42:12'),('5d68bfc3-cf90-4','John_Test','$2b$10$D5WTpuhI4Un7mu4iGJgeYOyxd3UFXosNpM0ZA8.DQ9Qgr6DGRrRjW','1','John_Test','John_Test','2022-12-01','John_Test@gmail.com','+18097520141',NULL,1,'2022-12-21 17:45:10','2022-12-21 17:45:10'),('647de2e8-3337-4','jhon2@doe.com','$2b$10$l/61N0b/HpjiT58p3RnA3OZ4z3dG9qdKCIrvrNG9jMnPk6aIjZEgy','1','Jhon Dos','Doe','2018-07-26','jhon2@doe.com','+18293434343',NULL,1,'2022-12-14 02:10:37','2022-12-14 02:10:37'),('a0f01a2c-abbf-4','test_jorge','$2b$10$4USGixC7.YI7M.T/hEi7YuxeTZkjyp5Fi5Y5nppyYC2rNa5ulBXK6','1','Jorge','Rodríguez Díaz','2022-12-01','jorge@gmail.com','+18097520141',NULL,0,'2022-12-08 07:39:12','2022-12-15 07:34:15'),('a9527557-20d9-4','test1','$2b$10$M7Su6aH3.khZhV5yt1MZfOEBzxRuJnko4RC9IVoSQXegOr8pVZh0i','1','testname','testsurname','2022-12-08','test1@test.com','+18098091234',NULL,1,'2022-12-07 12:50:52','2022-12-07 12:50:52'),('d205e111-a7e1-4','test91','$2b$10$cWN1X7dQum5E8I47twzMDeK3sNgNfZP9uHxw/DAfZCBBNLz1M53au','1','test9name1','test9surname1','2022-12-26','test91@test9.com','+18098091231',NULL,0,'2022-12-14 03:27:28','2022-12-14 03:28:29'),('d446cd40-ac63-4','Jorge','$2b$10$7.K0AQNYdHoE8IkLoBCB9O527nbD5hIoJ3XViqPxazJvwfM9cUWd.','0','Jorge','Rodríguez','2022-12-15','jrodriguezdiazz@outlook.com','+18098091234',NULL,0,'2022-12-07 12:34:30','2022-12-08 05:52:39'),('d902d8f3-82e0-4','Jorge12','$2b$10$g2fGFn/lZlPa0cM9VoeHduqv4nbwwXoyMaF5dIRwxWYboqJkkiCO.','1','Jorge','Jorge','2022-12-02','jorge1@gmail.com','+18097520141',NULL,0,'2022-12-15 07:37:17','2022-12-15 07:37:22'),('efda27eb-589a-4','JuanPDD261','$2b$10$Ievet23AAofjYoxJmyJOEu1hZaTrlRm.tTD3sECmQn29dd6n3tcNa','0','Juan Pablo','Duarte y Díez','2019-01-26','JuanRevolution2601@trinitaria.do','+18098884444',NULL,1,'2022-12-08 23:47:46','2022-12-15 07:34:24'),('f6473e7d-7218-4','test3','$2b$10$JIS5IWWaArCB44WY8KYzK.ARvlKurJMu3pKRGWYHePhSKvQ0gWEia','1','testname','testsurname','2022-12-25','test3@test.coS','+18098091234',NULL,1,'2022-12-07 13:25:19','2022-12-08 22:01:05');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_product_full_data`
--

DROP TABLE IF EXISTS `view_product_full_data`;
/*!50001 DROP VIEW IF EXISTS `view_product_full_data`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_product_full_data` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `typeId`,
 1 AS `type`,
 1 AS `brandId`,
 1 AS `brand`,
 1 AS `stock`,
 1 AS `isActive`,
 1 AS `createdAt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_product_stock_sum`
--

DROP TABLE IF EXISTS `view_product_stock_sum`;
/*!50001 DROP VIEW IF EXISTS `view_product_stock_sum`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_product_stock_sum` AS SELECT 
 1 AS `type`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_reservation_full_data`
--

DROP TABLE IF EXISTS `view_reservation_full_data`;
/*!50001 DROP VIEW IF EXISTS `view_reservation_full_data`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_reservation_full_data` AS SELECT 
 1 AS `id`,
 1 AS `fromDate`,
 1 AS `toDate`,
 1 AS `userType`,
 1 AS `userName`,
 1 AS `userEmail`,
 1 AS `userPhone`,
 1 AS `userCode`,
 1 AS `userClassroom`,
 1 AS `userCourse`,
 1 AS `userCareer`,
 1 AS `profName`,
 1 AS `profCode`,
 1 AS `isActive`,
 1 AS `assistantId`,
 1 AS `CreatedAt`,
 1 AS `UpdatedAt`,
 1 AS `productId`,
 1 AS `productName`,
 1 AS `productType`,
 1 AS `productBrand`,
 1 AS `productStock`,
 1 AS `productIsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_reservation_v2`
--

DROP TABLE IF EXISTS `view_reservation_v2`;
/*!50001 DROP VIEW IF EXISTS `view_reservation_v2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_reservation_v2` AS SELECT 
 1 AS `id`,
 1 AS `fromDate`,
 1 AS `toDate`,
 1 AS `userType`,
 1 AS `userName`,
 1 AS `userEmail`,
 1 AS `userPhone`,
 1 AS `userCode`,
 1 AS `userClassroom`,
 1 AS `userCourse`,
 1 AS `userCareer`,
 1 AS `profName`,
 1 AS `profCode`,
 1 AS `isActive`,
 1 AS `assistantId`,
 1 AS `CreatedAt`,
 1 AS `UpdatedAt`,
 1 AS `productName`,
 1 AS `productType`,
 1 AS `productBrand`,
 1 AS `productStock`,
 1 AS `productIsActive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_users_full_data`
--

DROP TABLE IF EXISTS `view_users_full_data`;
/*!50001 DROP VIEW IF EXISTS `view_users_full_data`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_users_full_data` AS SELECT 
 1 AS `userId`,
 1 AS `username`,
 1 AS `roleId`,
 1 AS `role`,
 1 AS `name`,
 1 AS `surname`,
 1 AS `birthday`,
 1 AS `email`,
 1 AS `phone`,
 1 AS `scheduleId`,
 1 AS `schedule`,
 1 AS `isActive`,
 1 AS `createdAt`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_product_full_data`
--

/*!50001 DROP VIEW IF EXISTS `view_product_full_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_product_full_data` AS select `p`.`id` AS `id`,`p`.`name` AS `name`,`p`.`product_type_id` AS `typeId`,`pt`.`type` AS `type`,`p`.`product_brand_id` AS `brandId`,`pb`.`brand` AS `brand`,`p`.`stock` AS `stock`,`p`.`active` AS `isActive`,`p`.`created_at` AS `createdAt` from ((`product` `p` join `product_brand` `pb` on((`p`.`product_brand_id` = `pb`.`id`))) join `product_type` `pt` on((`p`.`product_type_id` = `pt`.`id`))) order by `p`.`created_at` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_product_stock_sum`
--

/*!50001 DROP VIEW IF EXISTS `view_product_stock_sum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_product_stock_sum` AS select `view_product_full_data`.`type` AS `type`,sum(`view_product_full_data`.`stock`) AS `stock` from `view_product_full_data` where (`view_product_full_data`.`isActive` = 1) group by `view_product_full_data`.`type` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_reservation_full_data`
--

/*!50001 DROP VIEW IF EXISTS `view_reservation_full_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_reservation_full_data` AS select `r`.`id` AS `id`,`r`.`from_date` AS `fromDate`,`r`.`to_date` AS `toDate`,`r`.`user_type` AS `userType`,`r`.`user_name` AS `userName`,`r`.`user_email` AS `userEmail`,`r`.`user_phone` AS `userPhone`,`r`.`user_code` AS `userCode`,`r`.`user_classroom` AS `userClassroom`,`r`.`user_course` AS `userCourse`,`r`.`user_career` AS `userCareer`,`r`.`prof_name` AS `profName`,`r`.`prof_code` AS `profCode`,`r`.`active` AS `isActive`,`r`.`assistant_id` AS `assistantId`,`r`.`created_at` AS `CreatedAt`,`r`.`updated_at` AS `UpdatedAt`,`p`.`id` AS `productId`,`p`.`name` AS `productName`,`t`.`type` AS `productType`,`b`.`brand` AS `productBrand`,`p`.`stock` AS `productStock`,`p`.`active` AS `productIsActive` from ((((`reservation` `r` join `prod_vs_res` `pvsr` on((`pvsr`.`reservation_id` = `r`.`id`))) join `product` `p` on((`p`.`id` = `pvsr`.`product_id`))) join `product_type` `t` on((`t`.`id` = `p`.`product_type_id`))) join `product_brand` `b` on((`b`.`id` = `p`.`product_brand_id`))) order by `r`.`created_at` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_reservation_v2`
--

/*!50001 DROP VIEW IF EXISTS `view_reservation_v2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_reservation_v2` AS select `r`.`id` AS `id`,`r`.`from_date` AS `fromDate`,`r`.`to_date` AS `toDate`,`r`.`user_type` AS `userType`,`r`.`user_name` AS `userName`,`r`.`user_email` AS `userEmail`,`r`.`user_phone` AS `userPhone`,`r`.`user_code` AS `userCode`,`r`.`user_classroom` AS `userClassroom`,`r`.`user_course` AS `userCourse`,`r`.`user_career` AS `userCareer`,`r`.`prof_name` AS `profName`,`r`.`prof_code` AS `profCode`,`r`.`active` AS `isActive`,`r`.`assistant_id` AS `assistantId`,`r`.`created_at` AS `CreatedAt`,`r`.`updated_at` AS `UpdatedAt`,`p`.`name` AS `productName`,`t`.`type` AS `productType`,`b`.`brand` AS `productBrand`,`p`.`stock` AS `productStock`,`p`.`active` AS `productIsActive` from ((((`reservation` `r` join `prod_vs_res` `pvsr` on((`pvsr`.`reservation_id` = `r`.`id`))) join `product` `p` on((`p`.`id` = `pvsr`.`product_id`))) join `product_type` `t` on((`t`.`id` = `p`.`product_type_id`))) join `product_brand` `b` on((`b`.`id` = `p`.`product_brand_id`))) order by `r`.`created_at` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_users_full_data`
--

/*!50001 DROP VIEW IF EXISTS `view_users_full_data`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_users_full_data` AS select `u`.`id` AS `userId`,`u`.`username` AS `username`,`u`.`role_id` AS `roleId`,`r`.`role` AS `role`,`u`.`name` AS `name`,`u`.`surname` AS `surname`,`u`.`birthday` AS `birthday`,`u`.`email` AS `email`,`u`.`phone` AS `phone`,`u`.`schedule_id` AS `scheduleId`,`s`.`name` AS `schedule`,`u`.`active` AS `isActive`,`u`.`created_at` AS `createdAt` from ((`user` `u` join `role` `r` on((`u`.`role_id` = `r`.`id`))) left join `schedule` `s` on((`u`.`schedule_id` = `s`.`id`))) order by `u`.`created_at` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-13 22:55:03
