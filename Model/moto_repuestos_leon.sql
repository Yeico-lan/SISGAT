CREATE DATABASE  IF NOT EXISTS `moto_repuestos_leon` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `moto_repuestos_leon`;
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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `cat_id` int NOT NULL AUTO_INCREMENT,
  `cat_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cat_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Repuestos Frenos','Pastillas, bandas y discos de freno'),(2,'Lubricantes','Aceites de motor, cadena y grasas'),(3,'Motor','Pistones, anillos, empaques y válvulas'),(4,'Llantas','Llantas pisteras y doble propósito'),(5,'Eléctrico','Bujías, baterías, bombillos y ramales'),(6,'Suspensión','Retenes, barras y amortiguadores'),(7,'Kit de Arrastre','Piñones, catalinas y cadenas de tracción'),(8,'Filtros','Filtros de aire, aceite y gasolina'),(9,'Accesorios','Espejos, lujos, defensas y maleteros');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cli_id` int NOT NULL AUTO_INCREMENT,
  `cli_nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cli_apellido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cli_telefono` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cli_correo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cli_direccion` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`cli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Juan','Pérez','3001234567','juan.perez@mail.com','Calle 45 # 12-34, Barrio Centro'),(2,'María','López','3007654321','maria.lopez@mail.com','Carrera 10 # 5-67, Conjunto Los Álamos'),(3,'Pedro','Giraldo','3109876543','p.giraldo@mail.com','Avenida 80 # 23-11, Edificio El Roble'),(4,'Ana','Beltrán','3152233445','ana.beltrán@mail.com','Calle 12 Sur # 45-09, Barrio San José'),(5,'Luis','Suarez','3205566778','l.suarez@mail.com','Diagonal 34 # 18-22, Sector Industrial'),(6,'Rosa','Meza','3114433221','rosa.meza@mail.com','Carrera 50 # 10-50, Barrio La Floresta'),(7,'Jorge','Bernal','3186677889','j.bernal@mail.com','Calle 100 # 15-90, Oficina 204'),(8,'Elena','Ortiz','3123344556','elena.ortiz@mail.com','Transversal 25 # 8-14, Barrio El Sol'),(9,'Fabio','Rojas','3179988776','f.rojas@mail.com','Carrera 7 # 32-10, Apartamento 501');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_facturas`
--

DROP TABLE IF EXISTS `detalle_facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_facturas` (
  `det_fact_id` int NOT NULL AUTO_INCREMENT,
  `fac_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `det_fact_cant` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `det_fact_servicio` decimal(10,2) NOT NULL,
  `usu_id` int NOT NULL,
  PRIMARY KEY (`det_fact_id`),
  KEY `detalle_factura_ibfk_1` (`fac_id`),
  KEY `detalle_factura_ibfk_2` (`prod_id`),
  KEY `fk_usuarios` (`usu_id`),
  CONSTRAINT `detalle_facturas_ibfk_1` FOREIGN KEY (`fac_id`) REFERENCES `facturas` (`fac_id`),
  CONSTRAINT `detalle_facturas_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `productos` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_facturas`
--

LOCK TABLES `detalle_facturas` WRITE;
/*!40000 ALTER TABLE `detalle_facturas` DISABLE KEYS */;
INSERT INTO `detalle_facturas` VALUES (1,8,5,1,45000.00,45000.00,25000.00,1),(2,5,1,1,38000.00,38000.00,30000.00,2),(3,1,8,1,15000.00,15000.00,20000.00,3),(4,9,3,1,22000.00,22000.00,15000.00,4),(5,2,9,1,185000.00,185000.00,50000.00,5),(6,7,3,1,210000.00,210000.00,40000.00,6),(7,3,7,1,12000.00,12000.00,10000.00,7),(8,6,4,1,135000.00,135000.00,35000.00,8),(9,4,6,1,25000.00,25000.00,20000.00,9);
/*!40000 ALTER TABLE `detalle_facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_movimientos`
--

DROP TABLE IF EXISTS `detalle_movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_movimientos` (
  `det_mov_id` int NOT NULL AUTO_INCREMENT,
  `mov_id` int NOT NULL,
  `prod_id` int NOT NULL,
  `det_mov_cantidad` int NOT NULL,
  `stock_anterior` int DEFAULT NULL,
  `stock_nuevo` int NOT NULL,
  `det_mov_precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`det_mov_id`),
  KEY `detalle_movimiento_ibfk_2` (`prod_id`),
  KEY `detalle_movimientos_ibfk_1` (`mov_id`),
  CONSTRAINT `detalle_movimientos_ibfk_1` FOREIGN KEY (`mov_id`) REFERENCES `movimientos` (`mov_id`),
  CONSTRAINT `detalle_movimientos_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `productos` (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_movimientos`
--

LOCK TABLES `detalle_movimientos` WRITE;
/*!40000 ALTER TABLE `detalle_movimientos` DISABLE KEYS */;
INSERT INTO `detalle_movimientos` VALUES (1,3,2,25,0,25,1625000.00),(2,4,4,15,0,15,330000.00),(3,5,6,40,0,40,8400000.00),(4,6,8,10,0,10,250000.00),(5,7,1,8,0,8,360000.00),(6,8,3,12,0,12,180000.00),(7,9,5,20,0,20,3700000.00),(8,1,7,5,0,5,675000.00),(9,2,9,30,0,30,1200000.00);
/*!40000 ALTER TABLE `detalle_movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `fac_id` int NOT NULL AUTO_INCREMENT,
  `fac_fecha_emision` date NOT NULL,
  `fac_total` decimal(10,2) NOT NULL,
  `ord_id` int NOT NULL,
  `cli_id` int NOT NULL,
  PRIMARY KEY (`fac_id`),
  KEY `factura_ibfk_1` (`ord_id`),
  KEY `fk_cliente` (`cli_id`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`ord_id`) REFERENCES `orden_servicios` (`ord_id`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,'2026-03-25',83000.00,2,2),(2,'2026-03-25',63000.00,4,4),(3,'2026-03-25',55000.00,6,7),(4,'2026-03-25',52000.00,8,1),(5,'2026-03-25',240000.00,1,8),(6,'2026-03-25',290000.00,3,3),(7,'2026-03-25',27000.00,5,6),(8,'2026-03-25',180000.00,7,9),(9,'2026-03-25',45000.00,9,5);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motos`
--

DROP TABLE IF EXISTS `motos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motos` (
  `mot_id` int NOT NULL AUTO_INCREMENT,
  `mot_placa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mot_marca` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mot_modelo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mot_cilindraje` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `mot_color` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cli_id` int NOT NULL,
  PRIMARY KEY (`mot_id`),
  UNIQUE KEY `mot_placa_UNIQUE` (`mot_placa`),
  KEY `motos_ibfk_1` (`cli_id`),
  CONSTRAINT `motos_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motos`
--

LOCK TABLES `motos` WRITE;
/*!40000 ALTER TABLE `motos` DISABLE KEYS */;
INSERT INTO `motos` VALUES (1,'ABC12D','Yamaha','MT-03','321','Negro Mate',2),(2,'XYZ98E','Honda','CB 190R','184','Rojo Tricolor',4),(3,'QWE45F','Suzuki','Gixxer','250','Azul GP',6),(4,'RTY78G','Pulsar','NS 200','199','Gris Piedra',1),(5,'UIO12H','KTM','Duke','200','Naranja',7),(6,'DFH56J','Kawasaki','Z400','399','Verde Lime',3),(7,'JKL89K','Hero','Thriller','150','Rojo Sport',5),(8,'ZXC01L','BMW','G310 R','313','Blanco Polar',8),(9,'VBN34M','TVS','Apache','160','Negro/Rojo',9);
/*!40000 ALTER TABLE `motos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos` (
  `mov_id` int NOT NULL AUTO_INCREMENT,
  `mov_tipo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mov_motivo` text COLLATE utf8mb4_general_ci,
  `usu_id` int NOT NULL,
  `mov_fecha` date NOT NULL,
  `prod_id` int NOT NULL,
  PRIMARY KEY (`mov_id`),
  KEY `fk_productos` (`prod_id`),
  KEY `movimientos_ibfk_1` (`usu_id`),
  CONSTRAINT `fk_productos` FOREIGN KEY (`prod_id`) REFERENCES `productos` (`prod_id`),
  CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`usu_id`) REFERENCES `usuarios` (`usu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos`
--

LOCK TABLES `movimientos` WRITE;
/*!40000 ALTER TABLE `movimientos` DISABLE KEYS */;
INSERT INTO `movimientos` VALUES (1,'salida','Venta directa en mostrador',3,'2029-04-01',1),(2,'Entrada','Compra a proveedor para reabastecimiento',4,'2026-04-01',3),(3,'Entrada','Compra a proveedor para reabastecimiento',5,'2026-04-02',4),(4,'Entrada','Compra a proveedor para reabastecimiento',6,'2026-04-02',5),(5,'salida','Salida para servicio técnico en taller',7,'2026-04-03',6),(6,'Entrada','Devolución de cliente por garantía',8,'2026-04-03',7),(7,'Entrada','Ajuste de inventario (sobrante)',1,'2026-04-04',8),(8,'salida','Venta directa en mostrador',9,'2026-04-04',9),(9,'Entrada','Compra a proveedor para reabastecimiento',2,'2026-04-05',1);
/*!40000 ALTER TABLE `movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_servicios`
--

DROP TABLE IF EXISTS `orden_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_servicios` (
  `ord_id` int NOT NULL AUTO_INCREMENT,
  `ord_fecha_ingreso` date NOT NULL,
  `ord_fecha_entrega` date DEFAULT NULL,
  `ord_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ord_estado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cli_id` int NOT NULL,
  `mot_id` int NOT NULL,
  `usu_id` int NOT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `orden_servicio_ibfk_1` (`cli_id`),
  KEY `orden_servicio_ibfk_2` (`mot_id`),
  KEY `fk_usuarios1` (`usu_id`),
  CONSTRAINT `fk_usuarios1` FOREIGN KEY (`usu_id`) REFERENCES `usuarios` (`usu_id`),
  CONSTRAINT `orden_servicios_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `clientes` (`cli_id`),
  CONSTRAINT `orden_servicios_ibfk_2` FOREIGN KEY (`mot_id`) REFERENCES `motos` (`mot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_servicios`
--

LOCK TABLES `orden_servicios` WRITE;
/*!40000 ALTER TABLE `orden_servicios` DISABLE KEYS */;
INSERT INTO `orden_servicios` VALUES (1,'2026-03-25','2026-03-26','Cambio pastillas de freno','Terminada',1,1,2),(2,'2026-03-25','2026-03-25','Cambio de aceite y filtro','Terminada',2,2,3),(3,'2026-03-26','2026-03-26','Fallo en arranque (Bujía)','Terminada',3,3,4),(4,'2026-03-26','2026-03-27','Mantenimiento filtro aire','Terminada',4,4,5),(5,'2026-03-27','2026-03-28','Kit de arrastre tensionado','Terminada',5,5,6),(6,'2026-03-27','2026-03-27','Cambio llanta trasera','Terminada',6,6,7),(7,'2026-03-28','2026-03-29','Batería no sostiene carga','Terminada',7,8,9),(8,'2026-03-29','2026-03-29','Instalación bombillo LED','Terminada',8,9,1),(9,'2026-03-29','2026-03-30','Cambio de espejos lujo','Terminada',9,1,2);
/*!40000 ALTER TABLE `orden_servicios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `prod_id` int NOT NULL AUTO_INCREMENT,
  `prod_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prod_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `prod_precio_venta` decimal(10,2) DEFAULT NULL,
  `prod_estado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prod_stock` int NOT NULL,
  `cat_id` int NOT NULL,
  `prov_id` int NOT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `productos_ibfk_1` (`cat_id`),
  KEY `productos_ibfk_2` (`prov_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categorias` (`cat_id`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`prov_id`) REFERENCES `proveedores` (`prov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Pastillas Freno XT','Pastillas de alta duración para sistemas de freno de disco delantero.',45000.00,'Activo',25,1,1),(2,'Aceite Motul 7100 4T','Aceite sintético 10W-40 de alto rendimiento para motores de 4 tiempos.',65000.00,'Activo',20,2,2),(3,'Bujía NGK','Bujía de encendido estándar para motores de baja y media cilindrada.',15000.00,'Activo',40,5,3),(4,'Filtro Aire Pulsar','Filtro de aire de alto flujo compatible con modelos Pulsar 180/200.',22000.00,'Activo',10,8,4),(5,'Kit Arrastre DID','Cadena y piñones reforzados para mayor resistencia al desgaste.',185000.00,'Poco Stock',8,7,5),(6,'Llanta Michelin 17\"','Llanta sellomática con excelente agarre en pavimento mojado.',210000.00,'Activo',12,4,6),(7,'Batería Bosch 12V','Batería de gel libre de mantenimiento, 12V y 7Ah.',135000.00,'Agotado',5,5,7),(8,'Bombillo LED H4','Bombillo tipo LED de alta intensidad con ventilador integrado.',25000.00,'Activo',30,5,8),(9,'Espejos Universales','Espejos retrovisores ajustables con diseño aerodinámico.',40000.00,'Activo',15,9,9);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `prov_id` int NOT NULL AUTO_INCREMENT,
  `prov_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prov_telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prov_correo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `prov_direccion` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`prov_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Repuestos Bogotá','6012223344','ventas@repbogota.co','Calle 13 #45-10'),(2,'Auteco Mayorista','3125556677','pedidos@auteco.com','Carrera 50 #10-80'),(3,'Yamaha Parts','3004443322','repuestos@yamaha.co','Av. Caracas #22-15'),(4,'DistriMotos SAS','3108887766','gerencia@distrimotos.net','Calle 6 Sur #14-20'),(5,'MultiRepuestos','3152221100','info@multirep.com','Transversal 30 #5-12'),(6,'MotoFrenos','6017778899','ventas@motofrenos.co','Calle 80 #68-30'),(7,'Cauchos S.A.','3189990011','cauchos@sa.com','Carrera 68 #20-45'),(8,'TecnoMotos','3141112255','soporte@tecnomotos.co','Calle 100 #15-60'),(9,'Importadora Sur','3113334422','import@sur.com','Calle 1 Sur #24-10');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `rol_descripcion` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador','Acceso total al sistema, gestión de usuarios y reportes.'),(2,'Mecánico','Gestión de servicios técnicos y reparaciones');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usu_id` int NOT NULL AUTO_INCREMENT,
  `usu_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usu_apellido` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `usu_correo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `usu_telefono` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_rol` int NOT NULL,
  PRIMARY KEY (`usu_id`),
  KEY `usuarios_ibfk_1` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Felix','Manrique','felix@taller.com','3204409605',2),(2,'Carlos','Mendoza','carlos.m@taller.com','3124185674',1),(3,'Andres','Ruíz','andres.r@taller.com','3102223344',2),(4,'Sergio','Plazas','sergio.p@taller.com','3115556677',1),(5,'Laura','Ospina','laura.o@taller.com','3008889900',1),(6,'David','Castro','david.c@taller.com','3141112233',2),(7,'Miller','Ossa','miller.o@taller.com','3183334455',2),(8,'Diana','Gomez','diana.g@taller.com','3176667788',1),(9,'Kevin','Leon','kevin.l@taller.com','3159990011',1);
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

-- Dump completed on 2026-04-09 18:23:22
