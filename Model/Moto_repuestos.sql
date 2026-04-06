-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: moto_repuestos_leon
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_nombre` varchar(100) NOT NULL,
  `cat_descripcion` text NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Aceites','Lubricantes'),(2,'Filtros','Filtros moto'),(3,'Frenos','Sistema frenos'),(4,'Motor','Partes motor'),(5,'Electricos','Sistema electrico');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cli_id` int NOT NULL AUTO_INCREMENT,
  `cli_nombre` varchar(50) NOT NULL,
  `cli_apellido` varchar(100) NOT NULL,
  `cli_telefono` varchar(10) DEFAULT NULL,
  `cli_correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Nombre1','Apellido1','30000001','cliente1@mail.com'),(2,'Nombre2','Apellido2','30000002','cliente2@mail.com'),(3,'Nombre3','Apellido3','30000003','cliente3@mail.com'),(4,'Nombre4','Apellido4','30000004','cliente4@mail.com'),(5,'Nombre5','Apellido5','30000005','cliente5@mail.com'),(6,'Nombre6','Apellido6','30000006','cliente6@mail.com'),(7,'Nombre7','Apellido7','30000007','cliente7@mail.com'),(8,'Nombre8','Apellido8','30000008','cliente8@mail.com'),(9,'Nombre9','Apellido9','30000009','cliente9@mail.com'),(10,'Nombre10','Apellido10','300000010','cliente10@mail.com'),(11,'Nombre11','Apellido11','300000011','cliente11@mail.com'),(12,'Nombre12','Apellido12','300000012','cliente12@mail.com'),(13,'Nombre13','Apellido13','300000013','cliente13@mail.com'),(14,'Nombre14','Apellido14','300000014','cliente14@mail.com'),(15,'Nombre15','Apellido15','300000015','cliente15@mail.com'),(16,'Nombre16','Apellido16','300000016','cliente16@mail.com'),(17,'Nombre17','Apellido17','300000017','cliente17@mail.com'),(18,'Nombre18','Apellido18','300000018','cliente18@mail.com'),(19,'Nombre19','Apellido19','300000019','cliente19@mail.com'),(20,'Nombre20','Apellido20','300000020','cliente20@mail.com'),(21,'Nombre21','Apellido21','300000021','cliente21@mail.com'),(22,'Nombre22','Apellido22','300000022','cliente22@mail.com'),(23,'Nombre23','Apellido23','300000023','cliente23@mail.com'),(24,'Nombre24','Apellido24','300000024','cliente24@mail.com'),(25,'Nombre25','Apellido25','300000025','cliente25@mail.com'),(26,'Nombre26','Apellido26','300000026','cliente26@mail.com'),(27,'Nombre27','Apellido27','300000027','cliente27@mail.com'),(28,'Nombre28','Apellido28','300000028','cliente28@mail.com'),(29,'Nombre29','Apellido29','300000029','cliente29@mail.com'),(30,'Nombre30','Apellido30','300000030','cliente30@mail.com'),(31,'Nombre31','Apellido31','300000031','cliente31@mail.com'),(32,'Nombre32','Apellido32','300000032','cliente32@mail.com'),(33,'Nombre33','Apellido33','300000033','cliente33@mail.com'),(34,'Nombre34','Apellido34','300000034','cliente34@mail.com'),(35,'Nombre35','Apellido35','300000035','cliente35@mail.com'),(36,'Nombre36','Apellido36','300000036','cliente36@mail.com'),(37,'Nombre37','Apellido37','300000037','cliente37@mail.com'),(38,'Nombre38','Apellido38','300000038','cliente38@mail.com'),(39,'Nombre39','Apellido39','300000039','cliente39@mail.com'),(40,'Nombre40','Apellido40','300000040','cliente40@mail.com'),(41,'Nombre41','Apellido41','300000041','cliente41@mail.com'),(42,'Nombre42','Apellido42','300000042','cliente42@mail.com'),(43,'Nombre43','Apellido43','300000043','cliente43@mail.com'),(44,'Nombre44','Apellido44','300000044','cliente44@mail.com'),(45,'Nombre45','Apellido45','300000045','cliente45@mail.com'),(46,'Nombre46','Apellido46','300000046','cliente46@mail.com'),(47,'Nombre47','Apellido47','300000047','cliente47@mail.com'),(48,'Nombre48','Apellido48','300000048','cliente48@mail.com'),(49,'Nombre49','Apellido49','300000049','cliente49@mail.com'),(50,'Nombre50','Apellido50','300000050','cliente50@mail.com'),(51,'Nombre51','Apellido51','300000051','cliente51@mail.com'),(52,'Nombre52','Apellido52','300000052','cliente52@mail.com'),(53,'Nombre53','Apellido53','300000053','cliente53@mail.com'),(54,'Nombre54','Apellido54','300000054','cliente54@mail.com'),(55,'Nombre55','Apellido55','300000055','cliente55@mail.com'),(56,'Nombre56','Apellido56','300000056','cliente56@mail.com'),(57,'Nombre57','Apellido57','300000057','cliente57@mail.com'),(58,'Nombre58','Apellido58','300000058','cliente58@mail.com'),(59,'Nombre59','Apellido59','300000059','cliente59@mail.com'),(60,'Nombre60','Apellido60','300000060','cliente60@mail.com'),(61,'Nombre61','Apellido61','300000061','cliente61@mail.com'),(62,'Nombre62','Apellido62','300000062','cliente62@mail.com'),(63,'Nombre63','Apellido63','300000063','cliente63@mail.com'),(64,'Nombre64','Apellido64','300000064','cliente64@mail.com'),(65,'Nombre65','Apellido65','300000065','cliente65@mail.com'),(66,'Nombre66','Apellido66','300000066','cliente66@mail.com'),(67,'Nombre67','Apellido67','300000067','cliente67@mail.com'),(68,'Nombre68','Apellido68','300000068','cliente68@mail.com'),(69,'Nombre69','Apellido69','300000069','cliente69@mail.com'),(70,'Nombre70','Apellido70','300000070','cliente70@mail.com'),(71,'Nombre71','Apellido71','300000071','cliente71@mail.com'),(72,'Nombre72','Apellido72','300000072','cliente72@mail.com'),(73,'Nombre73','Apellido73','300000073','cliente73@mail.com'),(74,'Nombre74','Apellido74','300000074','cliente74@mail.com'),(75,'Nombre75','Apellido75','300000075','cliente75@mail.com'),(76,'Nombre76','Apellido76','300000076','cliente76@mail.com'),(77,'Nombre77','Apellido77','300000077','cliente77@mail.com'),(78,'Nombre78','Apellido78','300000078','cliente78@mail.com'),(79,'Nombre79','Apellido79','300000079','cliente79@mail.com'),(80,'Nombre80','Apellido80','300000080','cliente80@mail.com'),(81,'Nombre81','Apellido81','300000081','cliente81@mail.com'),(82,'Nombre82','Apellido82','300000082','cliente82@mail.com'),(83,'Nombre83','Apellido83','300000083','cliente83@mail.com'),(84,'Nombre84','Apellido84','300000084','cliente84@mail.com'),(85,'Nombre85','Apellido85','300000085','cliente85@mail.com'),(86,'Nombre86','Apellido86','300000086','cliente86@mail.com'),(87,'Nombre87','Apellido87','300000087','cliente87@mail.com'),(88,'Nombre88','Apellido88','300000088','cliente88@mail.com'),(89,'Nombre89','Apellido89','300000089','cliente89@mail.com'),(90,'Nombre90','Apellido90','300000090','cliente90@mail.com'),(91,'Nombre91','Apellido91','300000091','cliente91@mail.com'),(92,'Nombre92','Apellido92','300000092','cliente92@mail.com'),(93,'Nombre93','Apellido93','300000093','cliente93@mail.com'),(94,'Nombre94','Apellido94','300000094','cliente94@mail.com'),(95,'Nombre95','Apellido95','300000095','cliente95@mail.com'),(96,'Nombre96','Apellido96','300000096','cliente96@mail.com'),(97,'Nombre97','Apellido97','300000097','cliente97@mail.com'),(98,'Nombre98','Apellido98','300000098','cliente98@mail.com'),(99,'Nombre99','Apellido99','300000099','cliente99@mail.com'),(100,'Nombre100','Apellido100','3000000100','cliente100@mail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_factura` (
  `id_detalle_factura` int NOT NULL AUTO_INCREMENT,
  `fac_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_factura`),
  KEY `detalle_factura_ibfk_1` (`fac_id`),
  KEY `detalle_factura_ibfk_2` (`prod_id`),
  CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`fac_id`) REFERENCES `factura` (`fac_id`),
  CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `productos` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` VALUES (1,1,9,1,33072.00,108264.00),(2,2,3,3,29776.00,68832.00),(3,3,26,5,24316.00,20071.00),(4,4,15,4,18550.00,89207.00),(5,5,95,4,33075.00,52528.00),(6,6,25,2,32169.00,71544.00),(7,7,25,4,45173.00,65054.00),(8,8,15,2,28644.00,98450.00),(9,9,81,4,55883.00,79078.00),(10,10,21,2,37892.00,29293.00),(11,11,80,4,10520.00,22178.00),(12,12,8,2,29137.00,114425.00),(13,13,58,1,32112.00,31445.00),(14,14,25,5,44283.00,97494.00),(15,15,82,4,28263.00,73531.00),(16,16,59,2,47365.00,104273.00),(17,17,98,2,46884.00,89669.00),(18,18,28,2,34900.00,90456.00),(19,19,3,1,13239.00,43325.00),(20,20,98,1,54174.00,113790.00),(21,21,4,2,49516.00,100720.00),(22,22,67,5,36128.00,110224.00),(23,23,95,1,21204.00,28767.00),(24,24,77,3,36907.00,118893.00),(25,25,34,4,31571.00,30383.00),(26,26,23,5,29501.00,71137.00),(27,27,39,2,51882.00,118954.00),(28,28,44,2,46087.00,119309.00),(29,29,81,1,45456.00,67975.00),(30,30,28,5,48662.00,31387.00),(31,31,25,5,49188.00,39923.00),(32,32,65,4,19955.00,31524.00),(33,33,98,3,50354.00,58918.00),(34,34,53,3,45242.00,35691.00),(35,35,68,5,29367.00,49825.00),(36,36,33,4,48451.00,79111.00),(37,37,65,3,30004.00,79307.00),(38,38,77,1,56825.00,74340.00),(39,39,91,5,50722.00,55002.00),(40,40,31,3,34939.00,24247.00),(41,41,72,3,15737.00,41610.00),(42,42,74,1,57813.00,88234.00),(43,43,55,4,45416.00,73944.00),(44,44,58,2,34872.00,95875.00),(45,45,31,2,22495.00,75708.00),(46,46,4,3,31426.00,82133.00),(47,47,83,2,47173.00,119337.00),(48,48,74,4,25065.00,60014.00),(49,49,10,2,16368.00,98622.00),(50,50,55,2,24239.00,46485.00),(51,51,47,3,28236.00,35901.00),(52,52,71,1,11700.00,28805.00),(53,53,34,3,16057.00,52416.00),(54,54,26,2,49974.00,25448.00),(55,55,88,2,30501.00,63096.00),(56,56,93,2,53986.00,60628.00),(57,57,40,4,36755.00,64845.00),(58,58,64,5,24293.00,111134.00),(59,59,70,4,45528.00,46808.00),(60,60,21,2,38505.00,33284.00),(61,61,96,2,59655.00,105263.00),(62,62,29,5,32779.00,89364.00),(63,63,11,3,51346.00,105591.00),(64,64,80,3,46728.00,59425.00),(65,65,77,4,58666.00,110097.00),(66,66,59,2,27622.00,29802.00),(67,67,44,5,12515.00,84239.00),(68,68,7,2,45356.00,60152.00),(69,69,89,2,33667.00,88759.00),(70,70,2,1,14023.00,52182.00),(71,71,37,5,23089.00,89005.00),(72,72,67,2,23851.00,82212.00),(73,73,28,3,50866.00,69313.00),(74,74,2,3,55196.00,95262.00),(75,75,6,5,52049.00,40784.00),(76,76,52,5,22031.00,52948.00),(77,77,93,4,30949.00,37764.00),(78,78,64,4,21152.00,44516.00),(79,79,56,1,38462.00,90267.00),(80,80,81,5,19209.00,36024.00),(81,81,25,4,13334.00,24588.00),(82,82,3,1,57873.00,96006.00),(83,83,93,2,10644.00,118648.00),(84,84,90,3,53274.00,99940.00),(85,85,41,4,51049.00,49138.00),(86,86,100,1,34787.00,39218.00),(87,87,48,4,36919.00,51631.00),(88,88,97,5,35784.00,112951.00),(89,89,11,4,23437.00,40157.00),(90,90,21,3,30590.00,104903.00),(91,91,1,3,33960.00,109092.00),(92,92,2,3,10524.00,101553.00),(93,93,5,4,49173.00,76412.00),(94,94,48,4,54120.00,63627.00),(95,95,54,2,20356.00,114985.00),(96,96,13,4,38335.00,66324.00),(97,97,62,4,40246.00,115280.00),(98,98,95,5,39543.00,49120.00),(99,99,69,3,43374.00,90674.00),(100,100,54,3,14352.00,102673.00);
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_movimiento`
--

DROP TABLE IF EXISTS `detalle_movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_movimiento` (
  `id_detalle_movimiento` int NOT NULL AUTO_INCREMENT,
  `id_movimiento` int NOT NULL,
  `prod_id` int NOT NULL,
  `cantidad` int NOT NULL,
  `stock_anterior` int DEFAULT NULL,
  `stock_nuevo` int NOT NULL,
  PRIMARY KEY (`id_detalle_movimiento`),
  KEY `detalle_movimiento_ibfk_1` (`id_movimiento`),
  KEY `detalle_movimiento_ibfk_2` (`prod_id`),
  CONSTRAINT `detalle_movimiento_ibfk_1` FOREIGN KEY (`id_movimiento`) REFERENCES `movimiento` (`id_movimiento`),
  CONSTRAINT `detalle_movimiento_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `productos` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_movimiento`
--

LOCK TABLES `detalle_movimiento` WRITE;
/*!40000 ALTER TABLE `detalle_movimiento` DISABLE KEYS */;
INSERT INTO `detalle_movimiento` VALUES (1,1,40,8,30,47),(2,2,40,2,46,5),(3,3,30,2,11,29),(4,4,79,3,45,47),(5,5,54,9,49,15),(6,6,14,8,31,42),(7,7,92,1,36,25),(8,8,86,8,31,38),(9,9,44,10,29,9),(10,10,66,8,57,19),(11,11,3,1,57,36),(12,12,76,7,48,1),(13,13,72,6,46,45),(14,14,29,8,56,21),(15,15,21,9,30,31),(16,16,89,6,17,3),(17,17,82,10,16,48),(18,18,33,8,54,6),(19,19,92,3,31,22),(20,20,90,2,16,8),(21,21,41,6,33,37),(22,22,24,1,25,28),(23,23,77,3,51,25),(24,24,91,1,45,15),(25,25,34,8,56,17),(26,26,81,1,51,49),(27,27,43,2,45,48),(28,28,59,2,47,25),(29,29,14,3,45,44),(30,30,26,7,33,22),(31,31,70,2,54,43),(32,32,58,4,57,38),(33,33,91,3,37,1),(34,34,36,8,52,46),(35,35,1,3,26,43),(36,36,26,8,53,8),(37,37,17,4,31,50),(38,38,68,4,56,23),(39,39,47,10,33,23),(40,40,82,8,18,37),(41,41,12,4,34,19),(42,42,37,8,39,36),(43,43,81,9,57,8),(44,44,93,2,56,11),(45,45,25,7,24,31),(46,46,21,3,30,21),(47,47,83,10,14,37),(48,48,35,6,46,50),(49,49,80,10,33,21),(50,50,68,2,45,4),(51,51,21,9,43,40),(52,52,92,3,27,6),(53,53,53,3,50,13),(54,54,82,3,12,17),(55,55,54,7,52,8),(56,56,25,8,15,13),(57,57,90,8,14,7),(58,58,46,9,52,36),(59,59,2,10,38,7),(60,60,90,1,48,31),(62,1,8,2,36,10),(63,2,35,2,49,24),(64,3,94,3,43,24),(65,4,38,5,10,41),(66,5,96,4,11,1),(67,6,95,8,43,14),(68,7,30,7,35,28),(69,8,21,4,22,8),(70,9,97,4,11,2),(71,10,4,2,30,38),(72,11,55,5,43,50),(73,12,92,7,28,47),(74,13,60,2,10,28),(75,14,71,10,32,27),(76,15,28,8,15,11),(77,16,70,9,15,1),(78,17,77,8,37,21),(79,18,45,10,35,34),(80,19,79,10,20,15),(81,20,85,4,20,49),(82,21,24,3,39,8),(83,22,99,5,33,47),(84,23,25,4,22,4),(85,24,58,7,41,7),(86,25,79,6,24,46),(87,26,62,4,58,37),(88,27,77,7,51,14),(89,28,91,7,47,32),(90,29,97,10,44,34),(91,30,29,5,27,21),(92,31,100,8,46,20),(93,32,82,9,59,15),(94,33,52,7,48,44),(95,34,5,7,58,2),(96,35,18,9,39,24),(97,36,59,6,50,28),(98,37,28,8,57,25),(99,38,62,6,12,25),(100,39,31,1,31,49),(101,40,57,10,54,34),(102,41,67,4,41,10),(103,42,8,9,48,23),(104,43,98,5,35,7),(105,44,8,10,44,26),(106,45,48,9,50,25),(107,46,7,9,10,27),(108,47,59,4,13,12),(109,48,93,10,10,10),(110,49,96,2,58,16),(111,50,68,5,21,42),(112,51,45,8,24,15),(113,52,53,9,31,37),(114,53,35,6,42,34),(115,54,40,10,42,18),(116,55,80,10,20,14),(117,56,77,10,43,20),(118,57,93,5,32,46),(119,58,24,5,28,32),(120,59,4,3,25,37),(121,60,71,4,40,1),(122,61,20,10,25,30),(123,62,5,5,16,16),(124,63,18,10,10,19),(125,64,83,10,33,20),(126,65,54,5,52,38),(127,66,27,1,31,50),(128,67,65,3,29,8),(129,68,59,5,39,26),(130,69,82,6,26,47),(131,70,74,9,14,42),(132,71,92,1,46,17),(133,72,52,6,20,22),(134,73,48,1,11,45),(135,74,37,2,42,39),(136,75,92,3,43,25),(137,76,46,8,40,34),(138,77,48,5,40,40),(139,78,17,5,45,10),(140,79,87,8,17,25),(141,80,2,7,10,10),(142,81,94,1,43,4),(143,82,32,4,55,22),(144,83,46,10,34,25),(145,84,5,8,32,4),(146,85,4,10,47,41),(147,86,82,7,46,37),(148,87,52,4,19,46),(149,88,99,2,11,30),(150,89,83,4,23,17),(151,90,80,1,42,13),(152,91,29,7,34,23),(153,92,82,7,58,40),(154,93,9,1,56,27),(155,94,90,9,43,38),(156,95,77,6,30,21),(157,96,84,10,22,21),(158,97,30,3,25,43),(159,98,29,10,43,30),(160,99,99,2,50,29),(161,100,43,5,52,50);
/*!40000 ALTER TABLE `detalle_movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `fac_id` int NOT NULL AUTO_INCREMENT,
  `fac_fecha_emision` date NOT NULL,
  `fac_total` decimal(10,2) NOT NULL,
  `ord_id` int NOT NULL,
  PRIMARY KEY (`fac_id`),
  KEY `factura_ibfk_1` (`ord_id`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`ord_id`) REFERENCES `orden_servicio` (`ord_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'2026-03-21',124871.00,1),(2,'2026-03-21',232200.00,2),(3,'2026-03-21',136388.00,3),(4,'2026-03-21',135340.00,4),(5,'2026-03-21',217538.00,5),(6,'2026-03-21',231669.00,6),(7,'2026-03-21',55732.00,7),(8,'2026-03-21',133654.00,8),(9,'2026-03-21',51073.00,9),(10,'2026-03-21',204406.00,10),(11,'2026-03-21',218809.00,11),(12,'2026-03-21',230828.00,12),(13,'2026-03-21',247712.00,13),(14,'2026-03-21',96077.00,14),(15,'2026-03-21',87250.00,15),(16,'2026-03-21',98018.00,16),(17,'2026-03-21',178341.00,17),(18,'2026-03-21',147650.00,18),(19,'2026-03-21',153229.00,19),(20,'2026-03-21',73196.00,20),(21,'2026-03-21',56294.00,21),(22,'2026-03-21',211880.00,22),(23,'2026-03-21',240520.00,23),(24,'2026-03-21',116962.00,24),(25,'2026-03-21',213249.00,25),(26,'2026-03-21',65359.00,26),(27,'2026-03-21',237049.00,27),(28,'2026-03-21',139167.00,28),(29,'2026-03-21',134688.00,29),(30,'2026-03-21',205940.00,30),(31,'2026-03-21',175638.00,31),(32,'2026-03-21',210371.00,32),(33,'2026-03-21',74940.00,33),(34,'2026-03-21',93586.00,34),(35,'2026-03-21',193113.00,35),(36,'2026-03-21',234807.00,36),(37,'2026-03-21',144694.00,37),(38,'2026-03-21',169053.00,38),(39,'2026-03-21',161181.00,39),(40,'2026-03-21',248746.00,40),(41,'2026-03-21',110187.00,41),(42,'2026-03-21',154697.00,42),(43,'2026-03-21',192926.00,43),(44,'2026-03-21',50540.00,44),(45,'2026-03-21',223924.00,45),(46,'2026-03-21',117998.00,46),(47,'2026-03-21',68218.00,47),(48,'2026-03-21',137097.00,48),(49,'2026-03-21',230834.00,49),(50,'2026-03-21',92876.00,50),(51,'2026-03-21',121881.00,51),(52,'2026-03-21',80775.00,52),(53,'2026-03-21',188235.00,53),(54,'2026-03-21',248850.00,54),(55,'2026-03-21',229545.00,55),(56,'2026-03-21',151175.00,56),(57,'2026-03-21',217243.00,57),(58,'2026-03-21',182690.00,58),(59,'2026-03-21',211719.00,59),(60,'2026-03-21',60527.00,60),(61,'2026-03-21',217478.00,61),(62,'2026-03-21',55810.00,62),(63,'2026-03-21',176616.00,63),(64,'2026-03-21',65653.00,64),(65,'2026-03-21',148414.00,65),(66,'2026-03-21',95113.00,66),(67,'2026-03-21',180322.00,67),(68,'2026-03-21',166273.00,68),(69,'2026-03-21',240400.00,69),(70,'2026-03-21',53179.00,70),(71,'2026-03-21',94696.00,71),(72,'2026-03-21',63944.00,72),(73,'2026-03-21',185632.00,73),(74,'2026-03-21',86331.00,74),(75,'2026-03-21',224757.00,75),(76,'2026-03-21',214795.00,76),(77,'2026-03-21',149702.00,77),(78,'2026-03-21',54125.00,78),(79,'2026-03-21',171521.00,79),(80,'2026-03-21',245232.00,80),(81,'2026-03-21',61597.00,81),(82,'2026-03-21',122288.00,82),(83,'2026-03-21',176651.00,83),(84,'2026-03-21',66393.00,84),(85,'2026-03-21',152010.00,85),(86,'2026-03-21',110873.00,86),(87,'2026-03-21',248335.00,87),(88,'2026-03-21',59055.00,88),(89,'2026-03-21',100270.00,89),(90,'2026-03-21',74186.00,90),(91,'2026-03-21',220119.00,91),(92,'2026-03-21',228041.00,92),(93,'2026-03-21',229845.00,93),(94,'2026-03-21',215104.00,94),(95,'2026-03-21',135985.00,95),(96,'2026-03-21',184613.00,96),(97,'2026-03-21',65113.00,97),(98,'2026-03-21',121725.00,98),(99,'2026-03-21',163286.00,99),(100,'2026-03-21',201254.00,100);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motos`
--

DROP TABLE IF EXISTS `motos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motos` (
  `mot_id` int NOT NULL AUTO_INCREMENT,
  `mot_placa` varchar(20) NOT NULL,
  `mot_marca` varchar(50) NOT NULL,
  `mot_modelo` varchar(50) NOT NULL,
  `mot_cilindraje` varchar(20) DEFAULT NULL,
  `mot_color` varchar(30) DEFAULT NULL,
  `cli_id` int NOT NULL,
  PRIMARY KEY (`mot_id`),
  UNIQUE KEY `mot_placa_UNIQUE` (`mot_placa`),
  KEY `motos_ibfk_1` (`cli_id`),
  CONSTRAINT `motos_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motos`
--

LOCK TABLES `motos` WRITE;
/*!40000 ALTER TABLE `motos` DISABLE KEYS */;
INSERT INTO `motos` VALUES (1,'ABC1','Yamaha','Modelo1','150cc','Blanco',1),(2,'ABC2','Yamaha','Modelo2','150cc','Blanco',2),(3,'ABC3','Yamaha','Modelo3','150cc','Naranja',3),(4,'ABC4','Yamaha','Modelo4','150cc','Amarillo',4),(5,'ABC5','Yamaha','Modelo5','150cc','Naranja',5),(6,'ABC6','Yamaha','Modelo6','150cc','Negro',6),(7,'ABC7','Yamaha','Modelo7','150cc','Negro',7),(8,'ABC8','Yamaha','Modelo8','150cc','Negro',8),(9,'ABC9','Yamaha','Modelo9','150cc','Azul',9),(10,'ABC10','Yamaha','Modelo10','150cc','Plateado',10),(11,'ABC11','Yamaha','Modelo11','150cc','Naranja',11),(12,'ABC12','Yamaha','Modelo12','150cc','Azul',12),(13,'ABC13','Yamaha','Modelo13','150cc','Morado',13),(14,'ABC14','Yamaha','Modelo14','150cc','Negro',14),(15,'ABC15','Yamaha','Modelo15','150cc','Verde',15),(16,'ABC16','Yamaha','Modelo16','150cc','Azul',16),(17,'ABC17','Yamaha','Modelo17','150cc','Morado',17),(18,'ABC18','Yamaha','Modelo18','150cc','Amarillo',18),(19,'ABC19','Yamaha','Modelo19','150cc','Amarillo',19),(20,'ABC20','Yamaha','Modelo20','150cc','Negro',20),(21,'ABC21','Yamaha','Modelo21','150cc','Verde',21),(22,'ABC22','Yamaha','Modelo22','150cc','Gris',22),(23,'ABC23','Yamaha','Modelo23','150cc','Verde',23),(24,'ABC24','Yamaha','Modelo24','150cc','Blanco',24),(25,'ABC25','Yamaha','Modelo25','150cc','Blanco',25),(26,'ABC26','Yamaha','Modelo26','150cc','Amarillo',26),(27,'ABC27','Yamaha','Modelo27','150cc','Blanco',27),(28,'ABC28','Yamaha','Modelo28','150cc','Amarillo',28),(29,'ABC29','Yamaha','Modelo29','150cc','Negro',29),(30,'ABC30','Yamaha','Modelo30','150cc','Amarillo',30),(31,'ABC31','Yamaha','Modelo31','150cc','Naranja',31),(32,'ABC32','Yamaha','Modelo32','150cc','Rojo',32),(33,'ABC33','Yamaha','Modelo33','150cc','Azul',33),(34,'ABC34','Yamaha','Modelo34','150cc','Plateado',34),(35,'ABC35','Yamaha','Modelo35','150cc','Gris',35),(36,'ABC36','Yamaha','Modelo36','150cc','Naranja',36),(37,'ABC37','Yamaha','Modelo37','150cc','Azul',37),(38,'ABC38','Yamaha','Modelo38','150cc','Negro',38),(39,'ABC39','Yamaha','Modelo39','150cc','Gris',39),(40,'ABC40','Yamaha','Modelo40','150cc','Rojo',40),(41,'ABC41','Yamaha','Modelo41','150cc','Verde',41),(42,'ABC42','Yamaha','Modelo42','150cc','Azul',42),(43,'ABC43','Yamaha','Modelo43','150cc','Verde',43),(44,'ABC44','Yamaha','Modelo44','150cc','Rojo',44),(45,'ABC45','Yamaha','Modelo45','150cc','Morado',45),(46,'ABC46','Yamaha','Modelo46','150cc','Azul',46),(47,'ABC47','Yamaha','Modelo47','150cc','Gris',47),(48,'ABC48','Yamaha','Modelo48','150cc','Gris',48),(49,'ABC49','Yamaha','Modelo49','150cc','Plateado',49),(50,'ABC50','Yamaha','Modelo50','150cc','Plateado',50),(51,'ABC51','Yamaha','Modelo51','150cc','Amarillo',51),(52,'ABC52','Yamaha','Modelo52','150cc','Morado',52),(53,'ABC53','Yamaha','Modelo53','150cc','Verde',53),(54,'ABC54','Yamaha','Modelo54','150cc','Plateado',54),(55,'ABC55','Yamaha','Modelo55','150cc','Naranja',55),(56,'ABC56','Yamaha','Modelo56','150cc','Blanco',56),(57,'ABC57','Yamaha','Modelo57','150cc','Azul',57),(58,'ABC58','Yamaha','Modelo58','150cc','Azul',58),(59,'ABC59','Yamaha','Modelo59','150cc','Amarillo',59),(60,'ABC60','Yamaha','Modelo60','150cc','Verde',60),(61,'ABC61','Yamaha','Modelo61','150cc','Naranja',61),(62,'ABC62','Yamaha','Modelo62','150cc','Azul',62),(63,'ABC63','Yamaha','Modelo63','150cc','Morado',63),(64,'ABC64','Yamaha','Modelo64','150cc','Negro',64),(65,'ABC65','Yamaha','Modelo65','150cc','Blanco',65),(66,'ABC66','Yamaha','Modelo66','150cc','Gris',66),(67,'ABC67','Yamaha','Modelo67','150cc','Negro',67),(68,'ABC68','Yamaha','Modelo68','150cc','Azul',68),(69,'ABC69','Yamaha','Modelo69','150cc','Negro',69),(70,'ABC70','Yamaha','Modelo70','150cc','Verde',70),(71,'ABC71','Yamaha','Modelo71','150cc','Verde',71),(72,'ABC72','Yamaha','Modelo72','150cc','Azul',72),(73,'ABC73','Yamaha','Modelo73','150cc','Gris',73),(74,'ABC74','Yamaha','Modelo74','150cc','Amarillo',74),(75,'ABC75','Yamaha','Modelo75','150cc','Plateado',75),(76,'ABC76','Yamaha','Modelo76','150cc','Rojo',76),(77,'ABC77','Yamaha','Modelo77','150cc','Blanco',77),(78,'ABC78','Yamaha','Modelo78','150cc','Negro',78),(79,'ABC79','Yamaha','Modelo79','150cc','Gris',79),(80,'ABC80','Yamaha','Modelo80','150cc','Plateado',80),(81,'ABC81','Yamaha','Modelo81','150cc','Rojo',81),(82,'ABC82','Yamaha','Modelo82','150cc','Morado',82),(83,'ABC83','Yamaha','Modelo83','150cc','Azul',83),(84,'ABC84','Yamaha','Modelo84','150cc','Naranja',84),(85,'ABC85','Yamaha','Modelo85','150cc','Naranja',85),(86,'ABC86','Yamaha','Modelo86','150cc','Blanco',86),(87,'ABC87','Yamaha','Modelo87','150cc','Amarillo',87),(88,'ABC88','Yamaha','Modelo88','150cc','Negro',88),(89,'ABC89','Yamaha','Modelo89','150cc','Verde',89),(90,'ABC90','Yamaha','Modelo90','150cc','Blanco',90),(91,'ABC91','Yamaha','Modelo91','150cc','Azul',91),(92,'ABC92','Yamaha','Modelo92','150cc','Blanco',92),(93,'ABC93','Yamaha','Modelo93','150cc','Naranja',93),(94,'ABC94','Yamaha','Modelo94','150cc','Naranja',94),(95,'ABC95','Yamaha','Modelo95','150cc','Verde',95),(96,'ABC96','Yamaha','Modelo96','150cc','Amarillo',96),(97,'ABC97','Yamaha','Modelo97','150cc','Verde',97),(98,'ABC98','Yamaha','Modelo98','150cc','Amarillo',98),(99,'ABC99','Yamaha','Modelo99','150cc','Amarillo',99),(100,'ABC100','Yamaha','Modelo100','150cc','Rojo',100);
/*!40000 ALTER TABLE `motos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento` (
  `id_movimiento` int NOT NULL AUTO_INCREMENT,
  `tipo_movimiento` varchar(20) NOT NULL,
  `motivo` varchar(100) NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha_movimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`),
  KEY `movimiento_ibfk_1` (`id_usuario`),
  CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` VALUES (1,'Entrada','Prueba sistema',21,'2026-03-21'),(2,'Entrada','Prueba sistema',7,'2026-03-21'),(3,'Entrada','Prueba sistema',42,'2026-03-21'),(4,'Entrada','Prueba sistema',31,'2026-03-21'),(5,'Entrada','Prueba sistema',12,'2026-03-21'),(6,'Salida','Prueba sistema',40,'2026-03-21'),(7,'Entrada','Prueba sistema',57,'2026-03-21'),(8,'Salida','Prueba sistema',18,'2026-03-21'),(9,'Salida','Prueba sistema',25,'2026-03-21'),(10,'Salida','Prueba sistema',13,'2026-03-21'),(11,'Salida','Prueba sistema',20,'2026-03-21'),(12,'Entrada','Prueba sistema',47,'2026-03-21'),(13,'Salida','Prueba sistema',9,'2026-03-21'),(14,'Entrada','Prueba sistema',44,'2026-03-21'),(15,'Salida','Prueba sistema',45,'2026-03-21'),(16,'Salida','Prueba sistema',61,'2026-03-21'),(17,'Salida','Prueba sistema',47,'2026-03-21'),(18,'Entrada','Prueba sistema',33,'2026-03-21'),(19,'Entrada','Prueba sistema',7,'2026-03-21'),(20,'Entrada','Prueba sistema',30,'2026-03-21'),(21,'Entrada','Prueba sistema',8,'2026-03-21'),(22,'Entrada','Prueba sistema',77,'2026-03-21'),(23,'Entrada','Prueba sistema',92,'2026-03-21'),(24,'Salida','Prueba sistema',43,'2026-03-21'),(25,'Salida','Prueba sistema',89,'2026-03-21'),(26,'Salida','Prueba sistema',94,'2026-03-21'),(27,'Entrada','Prueba sistema',85,'2026-03-21'),(28,'Salida','Prueba sistema',59,'2026-03-21'),(29,'Entrada','Prueba sistema',54,'2026-03-21'),(30,'Salida','Prueba sistema',92,'2026-03-21'),(31,'Salida','Prueba sistema',65,'2026-03-21'),(32,'Salida','Prueba sistema',90,'2026-03-21'),(33,'Salida','Prueba sistema',26,'2026-03-21'),(34,'Salida','Prueba sistema',72,'2026-03-21'),(35,'Salida','Prueba sistema',32,'2026-03-21'),(36,'Entrada','Prueba sistema',62,'2026-03-21'),(37,'Entrada','Prueba sistema',92,'2026-03-21'),(38,'Entrada','Prueba sistema',77,'2026-03-21'),(39,'Entrada','Prueba sistema',25,'2026-03-21'),(40,'Salida','Prueba sistema',76,'2026-03-21'),(41,'Salida','Prueba sistema',14,'2026-03-21'),(42,'Salida','Prueba sistema',85,'2026-03-21'),(43,'Salida','Prueba sistema',88,'2026-03-21'),(44,'Entrada','Prueba sistema',90,'2026-03-21'),(45,'Entrada','Prueba sistema',21,'2026-03-21'),(46,'Entrada','Prueba sistema',80,'2026-03-21'),(47,'Entrada','Prueba sistema',37,'2026-03-21'),(48,'Entrada','Prueba sistema',75,'2026-03-21'),(49,'Entrada','Prueba sistema',95,'2026-03-21'),(50,'Salida','Prueba sistema',24,'2026-03-21'),(51,'Entrada','Prueba sistema',2,'2026-03-21'),(52,'Salida','Prueba sistema',19,'2026-03-21'),(53,'Entrada','Prueba sistema',33,'2026-03-21'),(54,'Entrada','Prueba sistema',47,'2026-03-21'),(55,'Entrada','Prueba sistema',95,'2026-03-21'),(56,'Entrada','Prueba sistema',83,'2026-03-21'),(57,'Entrada','Prueba sistema',11,'2026-03-21'),(58,'Entrada','Prueba sistema',67,'2026-03-21'),(59,'Entrada','Prueba sistema',62,'2026-03-21'),(60,'Salida','Prueba sistema',72,'2026-03-21'),(61,'Entrada','Prueba sistema',8,'2026-03-21'),(62,'Salida','Prueba sistema',97,'2026-03-21'),(63,'Entrada','Prueba sistema',71,'2026-03-21'),(64,'Entrada','Prueba sistema',67,'2026-03-21'),(65,'Salida','Prueba sistema',28,'2026-03-21'),(66,'Salida','Prueba sistema',25,'2026-03-21'),(67,'Salida','Prueba sistema',23,'2026-03-21'),(68,'Entrada','Prueba sistema',4,'2026-03-21'),(69,'Entrada','Prueba sistema',71,'2026-03-21'),(70,'Entrada','Prueba sistema',97,'2026-03-21'),(71,'Salida','Prueba sistema',13,'2026-03-21'),(72,'Salida','Prueba sistema',60,'2026-03-21'),(73,'Entrada','Prueba sistema',28,'2026-03-21'),(74,'Entrada','Prueba sistema',91,'2026-03-21'),(75,'Entrada','Prueba sistema',66,'2026-03-21'),(76,'Salida','Prueba sistema',27,'2026-03-21'),(77,'Entrada','Prueba sistema',25,'2026-03-21'),(78,'Salida','Prueba sistema',24,'2026-03-21'),(79,'Entrada','Prueba sistema',17,'2026-03-21'),(80,'Entrada','Prueba sistema',14,'2026-03-21'),(81,'Entrada','Prueba sistema',3,'2026-03-21'),(82,'Salida','Prueba sistema',34,'2026-03-21'),(83,'Salida','Prueba sistema',10,'2026-03-21'),(84,'Entrada','Prueba sistema',73,'2026-03-21'),(85,'Salida','Prueba sistema',91,'2026-03-21'),(86,'Entrada','Prueba sistema',61,'2026-03-21'),(87,'Salida','Prueba sistema',44,'2026-03-21'),(88,'Entrada','Prueba sistema',78,'2026-03-21'),(89,'Salida','Prueba sistema',79,'2026-03-21'),(90,'Entrada','Prueba sistema',96,'2026-03-21'),(91,'Entrada','Prueba sistema',100,'2026-03-21'),(92,'Entrada','Prueba sistema',34,'2026-03-21'),(93,'Entrada','Prueba sistema',43,'2026-03-21'),(94,'Salida','Prueba sistema',8,'2026-03-21'),(95,'Salida','Prueba sistema',59,'2026-03-21'),(96,'Salida','Prueba sistema',43,'2026-03-21'),(97,'Entrada','Prueba sistema',83,'2026-03-21'),(98,'Entrada','Prueba sistema',92,'2026-03-21'),(99,'Entrada','Prueba sistema',2,'2026-03-21'),(100,'Salida','Prueba sistema',7,'2026-03-21');
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_servicio`
--

DROP TABLE IF EXISTS `orden_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_servicio` (
  `ord_id` int NOT NULL AUTO_INCREMENT,
  `ord_fecha_ingreso` date NOT NULL,
  `ord_fecha_entrega` date DEFAULT NULL,
  `ord_descripcion` text NOT NULL,
  `ord_estado` varchar(20) NOT NULL,
  `ord_total_repuestos` decimal(10,2) NOT NULL,
  `ord_total_general` decimal(10,2) NOT NULL,
  `cli_id` int NOT NULL,
  `mot_id` int DEFAULT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `orden_servicio_ibfk_1` (`cli_id`),
  KEY `orden_servicio_ibfk_2` (`mot_id`),
  CONSTRAINT `orden_servicio_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`),
  CONSTRAINT `orden_servicio_ibfk_2` FOREIGN KEY (`mot_id`) REFERENCES `motos` (`mot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_servicio`
--

LOCK TABLES `orden_servicio` WRITE;
/*!40000 ALTER TABLE `orden_servicio` DISABLE KEYS */;
INSERT INTO `orden_servicio` VALUES (1,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',44344.00,202164.00,1,1),(2,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',27375.00,67267.00,2,2),(3,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',41040.00,208606.00,3,3),(4,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',53394.00,108120.00,4,4),(5,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',65118.00,126827.00,5,5),(6,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',76712.00,186641.00,6,6),(7,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',91466.00,154741.00,7,7),(8,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',67454.00,210315.00,8,8),(9,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',78426.00,153318.00,9,9),(10,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',103016.00,170212.00,10,10),(11,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',71481.00,204180.00,11,11),(12,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',51005.00,97512.00,12,12),(13,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',45765.00,165117.00,13,13),(14,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',30496.00,209614.00,14,14),(15,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',87545.00,246611.00,15,15),(16,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',108891.00,149083.00,16,16),(17,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',101033.00,163088.00,17,17),(18,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',59619.00,106925.00,18,18),(19,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',43456.00,113787.00,19,19),(20,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',109100.00,149639.00,20,20),(21,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',101797.00,169053.00,21,21),(22,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',72242.00,215261.00,22,22),(23,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',76427.00,118493.00,23,23),(24,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',21949.00,64011.00,24,24),(25,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',49182.00,99786.00,25,25),(26,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',56919.00,69831.00,26,26),(27,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',58822.00,178726.00,27,27),(28,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',25350.00,117324.00,28,28),(29,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',72259.00,170618.00,29,29),(30,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',64768.00,135827.00,30,30),(31,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',100263.00,195153.00,31,31),(32,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',42092.00,235463.00,32,32),(33,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',117382.00,67432.00,33,33),(34,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',71435.00,112053.00,34,34),(35,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',20827.00,72113.00,35,35),(36,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',72801.00,111671.00,36,36),(37,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',115775.00,222737.00,37,37),(38,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',64517.00,176961.00,38,38),(39,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',103852.00,107637.00,39,39),(40,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',112537.00,202465.00,40,40),(41,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',23549.00,228095.00,41,41),(42,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',54590.00,61621.00,42,42),(43,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',45281.00,67955.00,43,43),(44,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',89041.00,86552.00,44,44),(45,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',104255.00,182896.00,45,45),(46,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',99474.00,246056.00,46,46),(47,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',71718.00,179014.00,47,47),(48,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',87380.00,136759.00,48,48),(49,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',34758.00,137305.00,49,49),(50,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',93988.00,127965.00,50,50),(51,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',92949.00,145598.00,51,51),(52,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',40148.00,164684.00,52,52),(53,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',46266.00,168608.00,53,53),(54,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',37722.00,71402.00,54,54),(55,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',20338.00,189176.00,55,55),(56,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',66926.00,101731.00,56,56),(57,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',108550.00,180314.00,57,57),(58,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',80132.00,60384.00,58,58),(59,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',65563.00,74476.00,59,59),(60,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',44502.00,221596.00,60,60),(61,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',75482.00,90039.00,61,61),(62,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',53651.00,66391.00,62,62),(63,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',60025.00,201080.00,63,63),(64,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',77623.00,172998.00,64,64),(65,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',54624.00,227246.00,65,65),(66,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',59244.00,110703.00,66,66),(67,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',54026.00,208151.00,67,67),(68,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',113300.00,108551.00,68,68),(69,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',86476.00,139112.00,69,69),(70,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',43350.00,216172.00,70,70),(71,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',65378.00,205265.00,71,71),(72,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',72027.00,104484.00,72,72),(73,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',100126.00,87812.00,73,73),(74,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',74151.00,78075.00,74,74),(75,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',27735.00,243131.00,75,75),(76,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',79621.00,66817.00,76,76),(77,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',83179.00,231341.00,77,77),(78,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',83816.00,144142.00,78,78),(79,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',63904.00,206623.00,79,79),(80,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',79842.00,178559.00,80,80),(81,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',61869.00,83021.00,81,81),(82,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',76943.00,120368.00,82,82),(83,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',25090.00,89802.00,83,83),(84,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',104234.00,172934.00,84,84),(85,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',74634.00,227537.00,85,85),(86,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',99942.00,116807.00,86,86),(87,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',47191.00,121492.00,87,87),(88,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',117156.00,207091.00,88,88),(89,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',21259.00,191314.00,89,89),(90,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',69509.00,121147.00,90,90),(91,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',49341.00,129970.00,91,91),(92,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',31902.00,129112.00,92,92),(93,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',82073.00,233397.00,93,93),(94,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',92273.00,222541.00,94,94),(95,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',34534.00,77717.00,95,95),(96,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',45689.00,223748.00,96,96),(97,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',77301.00,101771.00,97,97),(98,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',77523.00,69920.00,98,98),(99,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',97231.00,162548.00,99,99),(100,'2026-03-21','2026-03-21','Mantenimiento general','Finalizado',69679.00,209144.00,100,100);
/*!40000 ALTER TABLE `orden_servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `prod_id` int NOT NULL AUTO_INCREMENT,
  `prod_nombre` varchar(100) NOT NULL,
  `prod_descripcion` text,
  `prod_precio_venta` decimal(10,2) DEFAULT NULL,
  `prod_estado` varchar(20) NOT NULL,
  `stock_actual` int NOT NULL,
  `cat_id` int NOT NULL,
  `id_proveedor` int NOT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `productos_ibfk_1` (`cat_id`),
  KEY `productos_ibfk_2` (`id_proveedor`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categoria` (`cat_id`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Producto1','Repuesto moto',28578.00,'Activo',41,2,12),(2,'Producto2','Repuesto moto',69561.00,'Activo',30,1,6),(3,'Producto3','Repuesto moto',34660.00,'Activo',30,1,15),(4,'Producto4','Repuesto moto',44068.00,'Activo',35,2,11),(5,'Producto5','Repuesto moto',67965.00,'Activo',34,2,18),(6,'Producto6','Repuesto moto',32756.00,'Activo',33,3,8),(7,'Producto7','Repuesto moto',60202.00,'Activo',31,3,5),(8,'Producto8','Repuesto moto',86268.00,'Activo',30,2,3),(9,'Producto9','Repuesto moto',53646.00,'Activo',4,5,1),(10,'Producto10','Repuesto moto',73152.00,'Activo',19,4,11),(11,'Producto11','Repuesto moto',45949.00,'Activo',23,1,2),(12,'Producto12','Repuesto moto',25194.00,'Activo',29,2,3),(13,'Producto13','Repuesto moto',59722.00,'Activo',19,1,14),(14,'Producto14','Repuesto moto',84231.00,'Activo',9,2,5),(15,'Producto15','Repuesto moto',23714.00,'Activo',3,4,16),(16,'Producto16','Repuesto moto',51215.00,'Activo',1,4,8),(17,'Producto17','Repuesto moto',76011.00,'Activo',31,5,9),(18,'Producto18','Repuesto moto',53591.00,'Activo',11,3,6),(19,'Producto19','Repuesto moto',74953.00,'Activo',37,3,3),(20,'Producto20','Repuesto moto',38057.00,'Activo',7,4,7),(21,'Producto21','Repuesto moto',52610.00,'Activo',17,2,4),(22,'Producto22','Repuesto moto',22737.00,'Activo',11,4,9),(23,'Producto23','Repuesto moto',27541.00,'Activo',39,2,1),(24,'Producto24','Repuesto moto',45063.00,'Activo',42,5,7),(25,'Producto25','Repuesto moto',85756.00,'Activo',9,2,1),(26,'Producto26','Repuesto moto',24424.00,'Activo',39,2,8),(27,'Producto27','Repuesto moto',81318.00,'Activo',45,1,17),(28,'Producto28','Repuesto moto',83796.00,'Activo',32,4,9),(29,'Producto29','Repuesto moto',15246.00,'Activo',4,2,17),(30,'Producto30','Repuesto moto',62029.00,'Activo',18,1,3),(31,'Producto31','Repuesto moto',61004.00,'Activo',22,3,16),(32,'Producto32','Repuesto moto',60182.00,'Activo',27,5,5),(33,'Producto33','Repuesto moto',41324.00,'Activo',50,5,12),(34,'Producto34','Repuesto moto',29614.00,'Activo',16,5,14),(35,'Producto35','Repuesto moto',60565.00,'Activo',41,2,9),(36,'Producto36','Repuesto moto',15261.00,'Activo',50,4,16),(37,'Producto37','Repuesto moto',58877.00,'Activo',23,4,19),(38,'Producto38','Repuesto moto',58820.00,'Activo',1,3,2),(39,'Producto39','Repuesto moto',16376.00,'Activo',8,3,9),(40,'Producto40','Repuesto moto',42670.00,'Activo',28,4,16),(41,'Producto41','Repuesto moto',79325.00,'Activo',28,3,13),(42,'Producto42','Repuesto moto',82538.00,'Activo',6,1,11),(43,'Producto43','Repuesto moto',15368.00,'Activo',38,3,12),(44,'Producto44','Repuesto moto',25679.00,'Activo',8,2,15),(45,'Producto45','Repuesto moto',93075.00,'Activo',22,3,15),(46,'Producto46','Repuesto moto',54838.00,'Activo',13,4,2),(47,'Producto47','Repuesto moto',20600.00,'Activo',17,2,13),(48,'Producto48','Repuesto moto',14019.00,'Activo',21,5,11),(49,'Producto49','Repuesto moto',80033.00,'Activo',16,1,20),(50,'Producto50','Repuesto moto',35874.00,'Activo',28,5,18),(51,'Producto51','Repuesto moto',62207.00,'Activo',17,5,10),(52,'Producto52','Repuesto moto',71294.00,'Activo',50,5,14),(53,'Producto53','Repuesto moto',65330.00,'Activo',2,2,7),(54,'Producto54','Repuesto moto',73427.00,'Activo',31,5,15),(55,'Producto55','Repuesto moto',93833.00,'Activo',24,3,4),(56,'Producto56','Repuesto moto',47417.00,'Activo',26,2,16),(57,'Producto57','Repuesto moto',23620.00,'Activo',21,3,12),(58,'Producto58','Repuesto moto',30975.00,'Activo',22,3,16),(59,'Producto59','Repuesto moto',71470.00,'Activo',4,2,6),(60,'Producto60','Repuesto moto',45489.00,'Activo',11,5,15),(61,'Producto61','Repuesto moto',93725.00,'Activo',27,5,16),(62,'Producto62','Repuesto moto',23179.00,'Activo',24,5,7),(63,'Producto63','Repuesto moto',88810.00,'Activo',17,1,3),(64,'Producto64','Repuesto moto',54429.00,'Activo',7,2,13),(65,'Producto65','Repuesto moto',45630.00,'Activo',9,4,20),(66,'Producto66','Repuesto moto',82536.00,'Activo',4,5,14),(67,'Producto67','Repuesto moto',44086.00,'Activo',46,2,3),(68,'Producto68','Repuesto moto',66093.00,'Activo',34,3,11),(69,'Producto69','Repuesto moto',19022.00,'Activo',47,2,16),(70,'Producto70','Repuesto moto',91096.00,'Activo',11,2,5),(71,'Producto71','Repuesto moto',95451.00,'Activo',6,4,4),(72,'Producto72','Repuesto moto',70859.00,'Activo',47,3,4),(73,'Producto73','Repuesto moto',13104.00,'Activo',35,2,17),(74,'Producto74','Repuesto moto',15295.00,'Activo',39,4,18),(75,'Producto75','Repuesto moto',44928.00,'Activo',19,4,11),(76,'Producto76','Repuesto moto',41602.00,'Activo',12,1,18),(77,'Producto77','Repuesto moto',10454.00,'Activo',21,1,3),(78,'Producto78','Repuesto moto',36157.00,'Activo',8,5,20),(79,'Producto79','Repuesto moto',35055.00,'Activo',22,2,4),(80,'Producto80','Repuesto moto',95217.00,'Activo',13,3,6),(81,'Producto81','Repuesto moto',30010.00,'Activo',13,3,1),(82,'Producto82','Repuesto moto',61096.00,'Activo',35,4,17),(83,'Producto83','Repuesto moto',75100.00,'Activo',9,4,2),(84,'Producto84','Repuesto moto',20532.00,'Activo',22,4,12),(85,'Producto85','Repuesto moto',59394.00,'Activo',2,3,10),(86,'Producto86','Repuesto moto',79124.00,'Activo',23,5,12),(87,'Producto87','Repuesto moto',98942.00,'Activo',8,5,13),(88,'Producto88','Repuesto moto',78165.00,'Activo',43,5,7),(89,'Producto89','Repuesto moto',76579.00,'Activo',35,2,5),(90,'Producto90','Repuesto moto',45298.00,'Activo',13,1,12),(91,'Producto91','Repuesto moto',64324.00,'Activo',18,5,13),(92,'Producto92','Repuesto moto',34165.00,'Activo',26,4,2),(93,'Producto93','Repuesto moto',28515.00,'Activo',41,3,17),(94,'Producto94','Repuesto moto',83350.00,'Activo',29,2,5),(95,'Producto95','Repuesto moto',89489.00,'Activo',41,2,9),(96,'Producto96','Repuesto moto',93454.00,'Activo',22,2,11),(97,'Producto97','Repuesto moto',56336.00,'Activo',1,3,13),(98,'Producto98','Repuesto moto',53628.00,'Activo',29,3,8),(99,'Producto99','Repuesto moto',61392.00,'Activo',39,1,4),(100,'Producto100','Repuesto moto',63657.00,'Activo',23,3,4);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(150) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Proveedor1','30099991','prov1@mail.com','Calle 67 #28-33'),(2,'Proveedor2','30099992','prov2@mail.com','Calle 20 #15-15'),(3,'Proveedor3','30099993','prov3@mail.com','Calle 62 #20-30'),(4,'Proveedor4','30099994','prov4@mail.com','Carrera 20 #30-35'),(5,'Proveedor5','30099995','prov5@mail.com','Calle 14 #8-25'),(6,'Proveedor6','30099996','prov6@mail.com','Calle 55 #60-19'),(7,'Proveedor7','30099997','prov7@mail.com','Carrera 26 #30-77'),(8,'Proveedor8','30099998','prov8@mail.com','Carrera 20 #30-35'),(9,'Proveedor9','30099999','prov9@mail.com','Calle 13 #45-22'),(10,'Proveedor10','300999910','prov10@mail.com','Carrera 8 #19-30'),(11,'Proveedor11','300999911','prov11@mail.com','Avenida 15 #30-45'),(12,'Proveedor12','300999912','prov12@mail.com','Carrera 14 #28-18'),(13,'Proveedor13','300999913','prov13@mail.com','Carrera 29 #35-55'),(14,'Proveedor14','300999914','prov14@mail.com','Carrera 18 #60-13'),(15,'Proveedor15','300999915','prov15@mail.com','Calle 70 #55-11'),(16,'Proveedor16','300999916','prov16@mail.com','Calle 44 #22-19'),(17,'Proveedor17','300999917','prov17@mail.com','Calle 103 #32-21'),(18,'Proveedor18','300999918','prov18@mail.com','Calle 99 #21-90'),(19,'Proveedor19','300999919','prov19@mail.com','Carrera 10 #50-60'),(20,'Proveedor20','300999920','prov20@mail.com','Calle 55 #60-19');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','Acceso total al sistema'),(2,'Inventarista','Encargado del control de inventario'),(3,'Mecanico','Realiza mantenimiento y reparaciones');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usu_nombre` varchar(100) NOT NULL,
  `usu_apellido` varchar(100) NOT NULL,
  `usu_correo` varchar(100) DEFAULT NULL,
  `usu_telefono` varchar(20) DEFAULT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `usuarios_ibfk_1` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'User1','Apellido1','user1@mail.com','31100001',1),(2,'User2','Apellido2','user2@mail.com','31100002',3),(3,'User3','Apellido3','user3@mail.com','31100003',2),(4,'User4','Apellido4','user4@mail.com','31100004',2),(5,'User5','Apellido5','user5@mail.com','31100005',3),(6,'User6','Apellido6','user6@mail.com','31100006',1),(7,'User7','Apellido7','user7@mail.com','31100007',2),(8,'User8','Apellido8','user8@mail.com','31100008',1),(9,'User9','Apellido9','user9@mail.com','31100009',2),(10,'User10','Apellido10','user10@mail.com','311000010',3),(11,'User11','Apellido11','user11@mail.com','311000011',3),(12,'User12','Apellido12','user12@mail.com','311000012',1),(13,'User13','Apellido13','user13@mail.com','311000013',2),(14,'User14','Apellido14','user14@mail.com','311000014',2),(15,'User15','Apellido15','user15@mail.com','311000015',2),(16,'User16','Apellido16','user16@mail.com','311000016',2),(17,'User17','Apellido17','user17@mail.com','311000017',3),(18,'User18','Apellido18','user18@mail.com','311000018',2),(19,'User19','Apellido19','user19@mail.com','311000019',3),(20,'User20','Apellido20','user20@mail.com','311000020',2),(21,'User21','Apellido21','user21@mail.com','311000021',1),(22,'User22','Apellido22','user22@mail.com','311000022',2),(23,'User23','Apellido23','user23@mail.com','311000023',2),(24,'User24','Apellido24','user24@mail.com','311000024',2),(25,'User25','Apellido25','user25@mail.com','311000025',3),(26,'User26','Apellido26','user26@mail.com','311000026',2),(27,'User27','Apellido27','user27@mail.com','311000027',3),(28,'User28','Apellido28','user28@mail.com','311000028',2),(29,'User29','Apellido29','user29@mail.com','311000029',2),(30,'User30','Apellido30','user30@mail.com','311000030',1),(31,'User31','Apellido31','user31@mail.com','311000031',1),(32,'User32','Apellido32','user32@mail.com','311000032',2),(33,'User33','Apellido33','user33@mail.com','311000033',2),(34,'User34','Apellido34','user34@mail.com','311000034',3),(35,'User35','Apellido35','user35@mail.com','311000035',1),(36,'User36','Apellido36','user36@mail.com','311000036',2),(37,'User37','Apellido37','user37@mail.com','311000037',1),(38,'User38','Apellido38','user38@mail.com','311000038',1),(39,'User39','Apellido39','user39@mail.com','311000039',3),(40,'User40','Apellido40','user40@mail.com','311000040',1),(41,'User41','Apellido41','user41@mail.com','311000041',2),(42,'User42','Apellido42','user42@mail.com','311000042',1),(43,'User43','Apellido43','user43@mail.com','311000043',2),(44,'User44','Apellido44','user44@mail.com','311000044',1),(45,'User45','Apellido45','user45@mail.com','311000045',1),(46,'User46','Apellido46','user46@mail.com','311000046',1),(47,'User47','Apellido47','user47@mail.com','311000047',1),(48,'User48','Apellido48','user48@mail.com','311000048',1),(49,'User49','Apellido49','user49@mail.com','311000049',2),(50,'User50','Apellido50','user50@mail.com','311000050',3),(51,'User51','Apellido51','user51@mail.com','311000051',2),(52,'User52','Apellido52','user52@mail.com','311000052',1),(53,'User53','Apellido53','user53@mail.com','311000053',1),(54,'User54','Apellido54','user54@mail.com','311000054',1),(55,'User55','Apellido55','user55@mail.com','311000055',3),(56,'User56','Apellido56','user56@mail.com','311000056',3),(57,'User57','Apellido57','user57@mail.com','311000057',3),(58,'User58','Apellido58','user58@mail.com','311000058',2),(59,'User59','Apellido59','user59@mail.com','311000059',2),(60,'User60','Apellido60','user60@mail.com','311000060',2),(61,'User61','Apellido61','user61@mail.com','311000061',2),(62,'User62','Apellido62','user62@mail.com','311000062',3),(63,'User63','Apellido63','user63@mail.com','311000063',1),(64,'User64','Apellido64','user64@mail.com','311000064',3),(65,'User65','Apellido65','user65@mail.com','311000065',2),(66,'User66','Apellido66','user66@mail.com','311000066',1),(67,'User67','Apellido67','user67@mail.com','311000067',2),(68,'User68','Apellido68','user68@mail.com','311000068',2),(69,'User69','Apellido69','user69@mail.com','311000069',2),(70,'User70','Apellido70','user70@mail.com','311000070',3),(71,'User71','Apellido71','user71@mail.com','311000071',3),(72,'User72','Apellido72','user72@mail.com','311000072',2),(73,'User73','Apellido73','user73@mail.com','311000073',3),(74,'User74','Apellido74','user74@mail.com','311000074',1),(75,'User75','Apellido75','user75@mail.com','311000075',3),(76,'User76','Apellido76','user76@mail.com','311000076',1),(77,'User77','Apellido77','user77@mail.com','311000077',2),(78,'User78','Apellido78','user78@mail.com','311000078',1),(79,'User79','Apellido79','user79@mail.com','311000079',2),(80,'User80','Apellido80','user80@mail.com','311000080',1),(81,'User81','Apellido81','user81@mail.com','311000081',3),(82,'User82','Apellido82','user82@mail.com','311000082',2),(83,'User83','Apellido83','user83@mail.com','311000083',2),(84,'User84','Apellido84','user84@mail.com','311000084',1),(85,'User85','Apellido85','user85@mail.com','311000085',3),(86,'User86','Apellido86','user86@mail.com','311000086',1),(87,'User87','Apellido87','user87@mail.com','311000087',1),(88,'User88','Apellido88','user88@mail.com','311000088',3),(89,'User89','Apellido89','user89@mail.com','311000089',3),(90,'User90','Apellido90','user90@mail.com','311000090',1),(91,'User91','Apellido91','user91@mail.com','311000091',1),(92,'User92','Apellido92','user92@mail.com','311000092',3),(93,'User93','Apellido93','user93@mail.com','311000093',3),(94,'User94','Apellido94','user94@mail.com','311000094',2),(95,'User95','Apellido95','user95@mail.com','311000095',3),(96,'User96','Apellido96','user96@mail.com','311000096',3),(97,'User97','Apellido97','user97@mail.com','311000097',3),(98,'User98','Apellido98','user98@mail.com','311000098',1),(99,'User99','Apellido99','user99@mail.com','311000099',2),(100,'User100','Apellido100','user100@mail.com','3110000100',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-05 19:06:16
