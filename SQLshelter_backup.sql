-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: suzis_quaint_lounge_shelter
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adoption`
--

DROP TABLE IF EXISTS `adoption`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adoption` (
  `animal_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `date_of_adoption` date NOT NULL,
  PRIMARY KEY (`animal_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `adoption_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`animal_id`),
  CONSTRAINT `adoption_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adoption`
--

LOCK TABLES `adoption` WRITE;
/*!40000 ALTER TABLE `adoption` DISABLE KEYS */;
INSERT INTO `adoption` VALUES (1,8,'2020-07-06'),(33,6,'2020-02-28'),(45,10,'2020-01-15'),(51,1,'2020-06-01'),(80,9,'2020-04-10'),(114,9,'2020-04-04'),(145,3,'2020-05-19');
/*!40000 ALTER TABLE `adoption` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animals`
--

DROP TABLE IF EXISTS `animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animals` (
  `animal_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `availability` enum('rehomed','reserved','available') DEFAULT 'available',
  PRIMARY KEY (`animal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals`
--

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;
INSERT INTO `animals` VALUES (1,'BELLA','2017-03-29','rehomed'),(2,'BUFFY','2013-09-21','reserved'),(3,'OBI','2012-01-01','reserved'),(4,'BRONSON','2018-11-25','available'),(5,'FINCH','2015-09-21','available'),(6,'ROO','2019-01-01','available'),(7,'BRIAN','2017-04-01','available'),(8,'BEAU','2016-11-14','available'),(9,'CINNAMON','2014-05-15','available'),(10,'EVEREST','2016-06-19','available'),(11,'TOPSY','2007-09-07','available'),(12,'CHARLIE','2017-12-22','available'),(13,'MATTY','2015-04-13','available'),(14,'JACK','2011-05-28','available'),(15,'GRANNY','2012-01-01','reserved'),(16,'COOKIE','2013-08-19','available'),(17,'MAX','2011-06-01','available'),(18,'BELLA','2006-06-01','available'),(19,'MAUDE','2014-11-01','available'),(20,'MOSS','2016-11-15','available'),(21,'RAIN','2017-03-21','reserved'),(22,'HOLLY','2012-06-01','available'),(23,'PICKLE','2010-07-17','available'),(24,'BENJI','2016-05-10','available'),(25,'SPARROW','2016-05-17','available'),(26,'IMP','2017-03-23','available'),(27,'BAILEY','2019-02-24','available'),(28,'AVA','2018-09-06','available'),(29,'COCO','2018-06-15','available'),(30,'ROCKY','2013-09-18','available'),(31,'ANGEL','2014-01-24','available'),(32,'TIG','2018-12-31','available'),(33,'BARNEY','2018-11-01','rehomed'),(34,'LOLA','2011-06-01','available'),(35,'JET','2017-03-02','available'),(36,'MAX','2017-08-28','available'),(37,'BRONSON (AND BENJI)','2015-07-05','available'),(38,'PIXEL','2015-10-03','reserved'),(39,'DALE','2016-02-04','available'),(40,'CABOOSE','2016-06-10','available'),(41,'HUMPHREY','2014-04-13','available'),(42,'ELSA','2012-01-22','available'),(43,'WOODY','2016-10-20','available'),(44,'BENSON','2015-05-30','available'),(45,'RIO','2018-03-25','rehomed'),(46,'LACEY','2018-02-08','available'),(47,'CHARLIE','2018-10-14','available'),(48,'TOBY','2018-12-24','available'),(49,'MOUSE','2017-04-01','available'),(50,'PATSY','2018-04-09','available'),(51,'DAVE','2018-02-21','rehomed'),(52,'TAU','2018-04-07','available'),(53,'MURPHY','2012-01-08','reserved'),(54,'BOBBY','2014-08-04','available'),(55,'JACK','2017-06-21','available'),(56,'ARCHIE','2009-12-16','available'),(57,'MOLLY','2017-03-14','available'),(58,'GIZMO','2016-03-18','available'),(59,'POPPY','2010-03-28','available'),(60,'FRANKIE','2017-03-27','available'),(61,'JETHRO','2008-02-16','available'),(62,'JENNY','2014-05-24','available'),(63,'CONKERS (& ROXY)','2013-01-01','available'),(64,'LARRY','2015-04-24','available'),(65,'LEO','2015-10-05','available'),(66,'BAILEY','2012-01-01','available'),(67,'MINTY','2016-04-04','available'),(68,'DANNY','2012-10-03','available'),(69,'NELLY','2018-08-15','available'),(70,'BRUNO','2013-05-24','available'),(71,'PANTHER','2018-01-27','available'),(72,'LUNA','2018-07-01','available'),(73,'LADY','2009-06-06','available'),(74,'CHARLIE','2013-03-01','available'),(75,'MILONO','2010-08-01','available'),(76,'OZZY','2019-04-20','available'),(77,'DILLON','2007-03-01','available'),(78,'DAISY','2014-02-01','available'),(79,'CARTER','2015-08-08','available'),(80,'PIPPA','2018-06-22','rehomed'),(81,'COCO','2018-06-15','available'),(82,'SNOOP','2019-05-25','available'),(83,'BENJI','2016-10-09','available'),(84,'ZAC','2012-09-01','available'),(85,'NOODLE','2017-04-07','available'),(86,'MAX','2019-01-20','available'),(87,'ANNIE','2016-10-22','available'),(88,'OTTO','2017-09-25','available'),(89,'WISH','2019-02-24','reserved'),(90,'DIESEL','2018-09-16','available'),(91,'MILO','2017-07-09','available'),(92,'PIXIE','2018-06-03','available'),(93,'KYRA','2017-03-27','available'),(94,'ROY','2015-09-01','available'),(95,'ERIC','2017-08-27','available'),(96,'BRUCE','2019-04-19','reserved'),(97,'REGGIE','2014-03-20','available'),(98,'DODGER','2011-03-23','available'),(99,'BELLA','2017-01-28','reserved'),(100,'MARLEY','2009-03-19','available'),(101,'BOW (WAS BEAU)','2016-11-14','available'),(102,'BRUNO','2013-09-11','available'),(103,'BISTO','2015-09-10','available'),(104,'BUD','2017-03-05','available'),(105,'SHADOW','2018-07-01','available'),(106,'EDDIE','2009-09-27','available'),(107,'BUDDY','2016-06-28','available'),(108,'TREACLE','2009-08-01','available'),(109,'BEAU','2015-09-02','available'),(110,'COPPER','2017-12-07','available'),(111,'MOLLY','2017-04-24','available'),(112,'SEBASTIAN','2017-04-04','available'),(113,'TILLY','2013-10-17','available'),(114,'MILO','2015-10-23','rehomed'),(115,'JACKSON','2018-03-22','available'),(116,'PADDY','2012-08-24','available'),(117,'MIA','2015-07-09','available'),(118,'ORVILLE','2017-04-13','available'),(119,'AMBER','2014-01-14','available'),(120,'TIDY','2019-01-15','available'),(121,'CALLY','2017-09-19','available'),(122,'LESLIE','2018-04-08','available'),(123,'TAU','2018-02-07','available'),(124,'BEAR','2018-10-08','available'),(125,'WILFY (AND PICKLES)','2018-10-17','available'),(126,'MILO','2018-11-01','available'),(127,'HENRY','2017-12-03','available'),(128,'BONNIE','2012-09-30','available'),(129,'FRANKIE','2017-03-27','available'),(130,'OLIVER','2015-09-21','available'),(131,'CASPAR','2011-09-14','available'),(132,'PIPPA','2017-09-30','available'),(133,'ROCKY','2012-03-30','available'),(134,'EVEREST','2016-06-19','available'),(135,'BEAU','2015-09-15','available'),(136,'TOM','2017-07-01','reserved'),(137,'PALOMA','2018-04-22','available'),(138,'BAILEY','2015-10-09','available'),(139,'FINCH','2015-10-22','available'),(140,'HAMLET','2008-04-23','available'),(141,'DYLAN','2010-09-21','available'),(142,'LULU','2014-06-28','available'),(143,'DANDY','2014-10-15','available'),(144,'MONICA','2019-01-14','available'),(145,'PASHA','2017-12-08','rehomed'),(146,'DOUG','2015-08-21','available'),(147,'MALCOLM','2019-01-25','available'),(148,'JAKE','2015-05-13','available'),(149,'CILLA','2013-09-14','available'),(150,'BOOTS','2008-09-29','reserved'),(151,'BUSTER','2007-10-08','available'),(152,'ROCKO','2019-01-20','available'),(153,'PHOENIX','2017-01-01','available'),(154,'ROSIE','2015-08-31','available'),(155,'EVEREST','2016-06-19','available'),(156,'SAMSON','2012-06-01','available'),(157,'COPPER','2017-12-07','available');
/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breeds`
--

DROP TABLE IF EXISTS `breeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breeds` (
  `breed_id` int NOT NULL AUTO_INCREMENT,
  `species_type` enum('dog','cat','small_animal','other') NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`breed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breeds`
--

LOCK TABLES `breeds` WRITE;
/*!40000 ALTER TABLE `breeds` DISABLE KEYS */;
INSERT INTO `breeds` VALUES (1,'dog','Dalmatian'),(2,'dog','Siberian Husky'),(3,'dog','Boston Terrier'),(4,'dog','Akita Inu'),(5,'dog','Poodle'),(6,'dog','French Terrier'),(7,'dog','Pomeranian'),(8,'dog','Dachshund'),(9,'dog','Australian Shepherd'),(10,'dog','Keeshond'),(11,'cat','Russian Blue'),(12,'cat','Ragdoll'),(13,'cat','Norwegian Forest'),(14,'cat','Persian'),(15,'cat','Sphynx'),(16,'cat','Maine Coon'),(17,'cat','British shorthair'),(18,'cat','Turkish Angora'),(19,'cat','Egyptian Mau'),(20,'cat','Bengal'),(21,'small_animal','Bunny'),(22,'small_animal','Mouse'),(23,'small_animal','Rat'),(24,'small_animal','Budgie'),(25,'small_animal','Gerbil'),(26,'small_animal','Tarantula'),(27,'small_animal','Python'),(28,'small_animal','Hamster'),(29,'small_animal','Chincilla'),(30,'small_animal','Ferret'),(31,'other','Fish'),(32,'other','Alligator'),(33,'other','Ocelot');
/*!40000 ALTER TABLE `breeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `contact` varchar(50) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Bilbo','Baggins','bilbo.baggins@middleearth.com'),(2,'Frodo','Baggins','frodo.baggins@middleearth.com'),(3,'Legolas','Elvish','legolas@middleearth.com'),(4,'Aragorn','King of Gondor','aragorn@gondor.com'),(5,'Samwise','Gamgee','samwise@middleearth.com'),(6,'Galadriel','Elvish','galadriel@mysterious.com'),(7,'Eowyn','Human','eowyn@rohan.com'),(8,'Arwen','Elvish','arwen@gondor.com'),(9,'Gimli','Son of Gloin','gimli@middleearth.com'),(10,'Boromir','Human','boromir@gondor.com'),(11,'Gandalf','The Grey','gandalf@magic.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `dangerous_animal_summary`
--

DROP TABLE IF EXISTS `dangerous_animal_summary`;
/*!50001 DROP VIEW IF EXISTS `dangerous_animal_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `dangerous_animal_summary` AS SELECT 
 1 AS `animal_id`,
 1 AS `name`,
 1 AS `breed`,
 1 AS `warning`,
 1 AS `customer_name`,
 1 AS `customer_surname`,
 1 AS `contact`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `description`
--

DROP TABLE IF EXISTS `description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `description` (
  `animal_id` int NOT NULL,
  `breed_id` int NOT NULL,
  PRIMARY KEY (`animal_id`),
  KEY `breed_id` (`breed_id`),
  CONSTRAINT `description_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`animal_id`),
  CONSTRAINT `description_ibfk_2` FOREIGN KEY (`breed_id`) REFERENCES `breeds` (`breed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `description`
--

LOCK TABLES `description` WRITE;
/*!40000 ALTER TABLE `description` DISABLE KEYS */;
INSERT INTO `description` VALUES (25,1),(40,1),(81,1),(116,1),(139,1),(8,2),(34,2),(50,2),(64,2),(135,2),(1,3),(12,3),(21,3),(110,3),(155,3),(76,4),(89,4),(51,5),(58,5),(96,5),(123,5),(126,5),(32,6),(47,6),(101,6),(118,6),(133,6),(7,7),(102,7),(145,7),(146,7),(24,8),(140,8),(156,8),(23,9),(69,9),(70,9),(71,9),(104,9),(108,9),(121,9),(148,9),(72,10),(73,10),(99,10),(120,10),(122,10),(124,10),(147,10),(39,11),(74,11),(109,11),(11,12),(29,12),(46,12),(59,12),(92,12),(9,13),(38,13),(84,13),(95,14),(107,14),(117,14),(20,15),(33,15),(60,15),(82,15),(87,15),(132,15),(134,15),(144,15),(2,16),(52,16),(62,16),(79,16),(103,16),(130,16),(3,17),(41,17),(113,17),(143,17),(149,17),(4,18),(28,18),(77,18),(83,18),(150,18),(35,19),(37,19),(56,19),(151,19),(152,19),(15,20),(17,20),(36,20),(85,20),(91,20),(93,20),(127,20),(18,21),(19,21),(61,21),(111,21),(136,21),(142,21),(27,22),(125,22),(63,23),(115,23),(10,24),(16,24),(45,24),(67,24),(128,24),(129,24),(154,24),(157,24),(43,25),(57,25),(65,25),(105,25),(137,25),(5,26),(13,26),(44,26),(54,26),(55,26),(88,26),(97,26),(112,26),(48,27),(86,27),(42,28),(100,28),(6,29),(22,29),(31,29),(106,29),(14,30),(30,30),(75,30),(90,30),(141,30),(153,30),(26,31),(66,31),(94,31),(131,31),(49,32),(53,32),(80,32),(138,32),(68,33),(78,33),(98,33),(114,33),(119,33);
/*!40000 ALTER TABLE `description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `employee_tasks`
--

DROP TABLE IF EXISTS `employee_tasks`;
/*!50001 DROP VIEW IF EXISTS `employee_tasks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employee_tasks` AS SELECT 
 1 AS `name`,
 1 AS `surname`,
 1 AS `shelter_name`,
 1 AS `animal_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Ron','Weasley','07122365956'),(2,'Harry','Potter','07122368756'),(3,'Seamus','Finnigan','07122123956'),(4,'Hermine','Granger','07145665956'),(5,'Ginni','Weasley','07122369646'),(6,'Dudley','Dursley','07122367775'),(7,'Tom','Riddle','I-AM-LORD-VOLDEMORT'),(8,'Minerva','McGonagall','07122367789'),(9,'Rubeus','Hagrid','07122345656'),(10,'Bellatrix','Lestrange','07667365956');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interest`
--

DROP TABLE IF EXISTS `interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interest` (
  `animal_id` int NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`animal_id`,`customer_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `interest_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`animal_id`),
  CONSTRAINT `interest_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interest`
--

LOCK TABLES `interest` WRITE;
/*!40000 ALTER TABLE `interest` DISABLE KEYS */;
INSERT INTO `interest` VALUES (15,2),(21,2),(99,3),(15,4),(38,5),(96,5),(89,6),(136,7),(150,8),(53,9),(2,10),(3,10),(53,11);
/*!40000 ALTER TABLE `interest` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_reserved` BEFORE INSERT ON `interest` FOR EACH ROW BEGIN
	UPDATE animals a
    SET a.availability = 'reserved'
    WHERE a.animal_id = NEW.animal_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management` (
  `shelter_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `animal_id` int NOT NULL,
  PRIMARY KEY (`animal_id`),
  KEY `shelter_id` (`shelter_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `management_ibfk_1` FOREIGN KEY (`shelter_id`) REFERENCES `shelters` (`shelter_id`),
  CONSTRAINT `management_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `management_ibfk_3` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`animal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
INSERT INTO `management` VALUES (1,1,1),(1,1,2),(1,1,3),(1,1,4),(1,1,5),(1,1,6),(1,1,7),(1,1,8),(1,1,9),(1,1,10),(1,1,11),(1,1,12),(1,1,13),(1,1,14),(1,2,15),(1,2,16),(1,2,17),(1,2,18),(1,2,19),(1,2,20),(1,2,21),(1,2,22),(1,2,23),(1,2,24),(1,2,25),(1,2,26),(1,2,27),(1,2,28),(1,2,29),(1,2,30),(1,3,31),(1,3,32),(1,3,33),(1,3,34),(1,3,35),(1,3,36),(1,3,37),(1,3,38),(1,3,39),(1,3,40),(1,3,41),(1,3,42),(1,3,43),(1,3,44),(1,3,45),(1,3,46),(1,4,47),(1,4,48),(1,4,49),(1,4,50),(1,4,51),(1,4,52),(1,4,53),(1,4,54),(1,4,55),(1,4,56),(1,4,57),(1,4,58),(1,4,59),(1,4,60),(1,4,61),(1,4,62),(1,4,63),(2,5,64),(2,5,65),(2,5,66),(2,5,67),(2,5,68),(2,5,69),(2,5,70),(2,5,71),(2,5,72),(2,5,73),(2,5,74),(2,5,75),(2,5,76),(2,5,77),(2,6,78),(2,6,79),(2,6,80),(2,6,81),(2,6,82),(2,6,83),(2,6,84),(2,6,85),(2,6,86),(2,6,87),(2,6,88),(2,6,89),(2,6,90),(2,6,91),(2,6,92),(2,6,93),(2,6,94),(2,6,95),(2,6,96),(2,6,97),(2,6,98),(2,6,99),(2,6,100),(2,6,101),(2,6,102),(2,6,103),(2,6,104),(2,6,105),(2,6,106),(2,6,107),(2,7,108),(2,7,109),(2,7,110),(2,7,111),(2,7,112),(2,7,113),(2,7,114),(2,7,115),(2,7,116),(2,7,117),(2,7,118),(2,7,119),(2,7,120),(3,8,121),(3,8,122),(3,8,123),(3,8,124),(3,8,125),(3,8,126),(3,8,127),(3,8,128),(3,8,129),(3,8,130),(3,8,131),(3,8,132),(3,9,133),(3,9,134),(3,9,135),(3,9,136),(3,9,137),(3,9,138),(3,9,139),(3,9,140),(3,9,141),(3,9,142),(3,9,143),(3,9,144),(3,9,145),(3,9,146),(3,9,147),(3,9,148),(3,9,149),(3,9,150),(3,10,151),(3,10,152),(3,10,153),(3,10,154),(3,10,155),(3,10,156),(3,10,157);
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `shelter_capacity_summary`
--

DROP TABLE IF EXISTS `shelter_capacity_summary`;
/*!50001 DROP VIEW IF EXISTS `shelter_capacity_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `shelter_capacity_summary` AS SELECT 
 1 AS `name`,
 1 AS `location`,
 1 AS `capacity`,
 1 AS `animal_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `shelters`
--

DROP TABLE IF EXISTS `shelters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shelters` (
  `shelter_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `location` varchar(50) DEFAULT NULL,
  `capacity` varchar(50) DEFAULT NULL,
  `budget` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`shelter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shelters`
--

LOCK TABLES `shelters` WRITE;
/*!40000 ALTER TABLE `shelters` DISABLE KEYS */;
INSERT INTO `shelters` VALUES (1,'Battersea','London','100',500000.0000),(2,'Old Windsor','Berkshire','80',400000.0000),(3,'Brands Hatch','Kent','85',400000.0000);
/*!40000 ALTER TABLE `shelters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `dangerous_animal_summary`
--

/*!50001 DROP VIEW IF EXISTS `dangerous_animal_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dangerous_animal_summary` AS select `a`.`animal_id` AS `animal_id`,`a`.`name` AS `name`,`b`.`name` AS `breed`,`animal_danger`(`b`.`name`) AS `warning`,`c`.`name` AS `customer_name`,`c`.`surname` AS `customer_surname`,`c`.`contact` AS `contact` from ((((`animals` `a` join `description` `d` on((`d`.`animal_id` = `a`.`animal_id`))) join `breeds` `b` on((`b`.`breed_id` = `d`.`breed_id`))) left join `adoption` `ad` on((`ad`.`animal_id` = `a`.`animal_id`))) left join `customer` `c` on((`c`.`customer_id` = `ad`.`customer_id`))) group by `a`.`animal_id` having (`warning` = 'Dangerous animal') order by `customer_name` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee_tasks`
--

/*!50001 DROP VIEW IF EXISTS `employee_tasks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee_tasks` AS select `e`.`name` AS `name`,`e`.`surname` AS `surname`,`sh`.`name` AS `shelter_name`,count(`m`.`animal_id`) AS `animal_amount` from ((`employees` `e` join `management` `m` on((`e`.`employee_id` = `m`.`employee_id`))) join `shelters` `sh` on((`sh`.`shelter_id` = `m`.`shelter_id`))) group by `e`.`employee_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `shelter_capacity_summary`
--

/*!50001 DROP VIEW IF EXISTS `shelter_capacity_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `shelter_capacity_summary` AS select `sh`.`name` AS `name`,`sh`.`location` AS `location`,`sh`.`capacity` AS `capacity`,count(`m`.`animal_id`) AS `animal_amount` from (`shelters` `sh` left join `management` `m` on((`sh`.`shelter_id` = `m`.`shelter_id`))) where `m`.`animal_id` in (select `a`.`animal_id` from `animals` `a` where (`a`.`availability` <> 'rehomed')) group by `m`.`shelter_id` */;
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

-- Dump completed on 2020-07-09 13:54:24
