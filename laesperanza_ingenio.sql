-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: laesperanza_ingenio
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `agroquimico`
--

DROP TABLE IF EXISTS `agroquimico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agroquimico` (
  `id_agroquimico` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `id_tipo_agroquimico` int NOT NULL,
  `id_unidad_medida` int NOT NULL,
  `concentracion` varchar(20) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_agroquimico`),
  KEY `id_tipo_agroquimico` (`id_tipo_agroquimico`),
  KEY `id_unidad_medida` (`id_unidad_medida`),
  CONSTRAINT `agroquimico_ibfk_1` FOREIGN KEY (`id_tipo_agroquimico`) REFERENCES `tipo_agroquimico` (`id_tipo_agroquimico`),
  CONSTRAINT `agroquimico_ibfk_2` FOREIGN KEY (`id_unidad_medida`) REFERENCES `unidad_medida` (`id_unidad_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agroquimico`
--

LOCK TABLES `agroquimico` WRITE;
/*!40000 ALTER TABLE `agroquimico` DISABLE KEYS */;
INSERT INTO `agroquimico` VALUES (1,'Glifosato 48%',1,1,'480 g/L','Herbicida sistémico de amplio espectro'),(2,'Lambda-Cyhalothrin',2,3,'50 g/L','Insecticida piretroide para control de lepidópteros'),(3,'Mancozeb 75%',3,2,'750 g/kg','Fungicida de contacto multi-sitio'),(4,'Urea granulada',4,2,'46%','Fertilizante nitrogenado de liberación rápida'),(5,'Ácido giberélico',5,3,'10 mg/L','Regulador de crecimiento vegetal'),(6,'2,4-D Ester',1,1,'600 g/L','Herbicida hormonal para malezas de hoja ancha'),(7,'Imidacloprid',2,3,'200 g/L','Insecticida sistémico neonicotinoide'),(8,'Carbendazim',3,2,'500 g/kg','Fungicida sistémico para enfermedades foliares'),(9,'Nitrato de amonio',4,2,'33%','Fertilizante con nitrógeno de rápida absorción'),(10,'Ethephon',5,3,'240 g/L','Regulador de maduración en cultivos frutales');
/*!40000 ALTER TABLE `agroquimico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aplicacion_agroquimico`
--

DROP TABLE IF EXISTS `aplicacion_agroquimico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aplicacion_agroquimico` (
  `id_aplicacion_agro` int NOT NULL AUTO_INCREMENT,
  `id_agroquimico` int NOT NULL,
  `id_empleado` int NOT NULL,
  `id_lote` int NOT NULL,
  `id_maquina` int NOT NULL,
  `fecha` date NOT NULL,
  `cantidad_usada` varchar(35) NOT NULL,
  `observacion` text,
  PRIMARY KEY (`id_aplicacion_agro`),
  KEY `id_agroquimico` (`id_agroquimico`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_lote` (`id_lote`),
  KEY `id_maquina` (`id_maquina`),
  CONSTRAINT `aplicacion_agroquimico_ibfk_1` FOREIGN KEY (`id_agroquimico`) REFERENCES `agroquimico` (`id_agroquimico`),
  CONSTRAINT `aplicacion_agroquimico_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `aplicacion_agroquimico_ibfk_3` FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id_lote`),
  CONSTRAINT `aplicacion_agroquimico_ibfk_4` FOREIGN KEY (`id_maquina`) REFERENCES `maquinaria` (`id_maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aplicacion_agroquimico`
--

LOCK TABLES `aplicacion_agroquimico` WRITE;
/*!40000 ALTER TABLE `aplicacion_agroquimico` DISABLE KEYS */;
INSERT INTO `aplicacion_agroquimico` VALUES (1,1,95,1,81,'2025-11-01','2.5 L','Aplicación de glifosato en malezas tempranas'),(2,2,96,2,82,'2025-11-02','500 ml','Control de insectos en borde de lote'),(3,3,97,3,83,'2025-11-03','1.2 kg','Fungicida preventivo en zona húmeda'),(4,4,98,4,84,'2025-11-04','3.0 kg','Fertilización nitrogenada pre-siembra'),(5,5,99,5,85,'2025-11-05','600 ml','Regulador de crecimiento en caña joven'),(6,6,100,6,86,'2025-11-06','2.5 L','Herbicida hormonal en malezas de hoja ancha'),(7,7,101,7,87,'2025-11-07','500 ml','Insecticida sistémico en brotes nuevos'),(8,8,102,8,88,'2025-11-08','1.2 kg','Fungicida sistémico en hojas'),(9,9,103,9,89,'2025-11-09','3.0 kg','Fertilización de cobertura'),(10,10,104,10,90,'2025-11-10','600 ml','Regulador de maduración en caña lista'),(11,1,105,1,91,'2025-11-11','2.5 L','Aplicación de glifosato en malezas tempranas'),(12,2,106,2,92,'2025-11-12','500 ml','Control de insectos en borde de lote'),(13,3,107,3,93,'2025-11-13','1.2 kg','Fungicida preventivo en zona húmeda'),(14,4,108,4,94,'2025-11-14','3.0 kg','Fertilización nitrogenada pre-siembra'),(15,5,109,5,95,'2025-11-15','600 ml','Regulador de crecimiento en caña joven'),(16,6,110,6,96,'2025-11-16','2.5 L','Herbicida hormonal en malezas de hoja ancha'),(17,7,111,7,97,'2025-11-17','500 ml','Insecticida sistémico en brotes nuevos'),(18,8,112,8,98,'2025-11-18','1.2 kg','Fungicida sistémico en hojas'),(19,9,113,9,99,'2025-11-19','3.0 kg','Fertilización de cobertura'),(20,10,114,10,100,'2025-11-20','600 ml','Regulador de maduración en caña lista'),(21,6,115,6,96,'2025-12-01','2.5 L','Herbicida hormonal en malezas de hoja ancha'),(22,7,116,7,97,'2025-12-02','500 ml','Insecticida sistémico en brotes nuevos'),(23,8,117,8,98,'2025-12-03','1.2 kg','Fungicida sistémico en hojas'),(24,9,118,9,99,'2025-12-04','3.0 kg','Fertilización de cobertura'),(25,10,119,10,100,'2025-12-05','600 ml','Regulador de maduración en caña lista'),(26,1,120,1,81,'2025-12-06','2.5 L','Aplicación de glifosato en malezas tempranas'),(27,2,121,2,82,'2025-12-07','500 ml','Control de insectos en borde de lote'),(28,3,122,3,83,'2025-12-08','1.2 kg','Fungicida preventivo en zona húmeda'),(29,4,123,4,84,'2025-12-09','3.0 kg','Fertilización nitrogenada pre-siembra'),(30,5,124,5,85,'2025-12-10','600 ml','Regulador de crecimiento en caña joven'),(31,6,125,6,86,'2025-12-11','2.5 L','Herbicida hormonal en malezas de hoja ancha'),(32,7,126,7,87,'2025-12-12','500 ml','Insecticida sistémico en brotes nuevos'),(33,8,127,8,88,'2025-12-13','1.2 kg','Fungicida sistémico en hojas'),(34,9,128,9,89,'2025-12-14','3.0 kg','Fertilización de cobertura'),(35,10,129,10,90,'2025-12-15','600 ml','Regulador de maduración en caña lista'),(36,1,130,1,91,'2025-12-16','2.5 L','Aplicación de glifosato en malezas tempranas'),(37,2,131,2,92,'2025-12-17','500 ml','Control de insectos en borde de lote'),(38,3,132,3,93,'2025-12-18','1.2 kg','Fungicida preventivo en zona húmeda'),(39,4,133,4,94,'2025-12-19','3.0 kg','Fertilización nitrogenada pre-siembra'),(40,5,134,5,95,'2025-12-20','600 ml','Regulador de crecimiento en caña joven'),(41,6,135,6,96,'2025-12-21','2.5 L','Herbicida hormonal en malezas de hoja ancha'),(42,7,136,7,97,'2025-12-22','500 ml','Insecticida sistémico en brotes nuevos'),(43,8,137,8,98,'2025-12-23','1.2 kg','Fungicida sistémico en hojas'),(44,9,138,9,99,'2025-12-24','3.0 kg','Fertilización de cobertura'),(45,10,139,10,100,'2025-12-25','600 ml','Regulador de maduración en caña lista'),(46,1,140,1,81,'2025-12-26','2.5 L','Aplicación de glifosato en malezas tempranas'),(47,2,141,2,82,'2025-12-27','500 ml','Control de insectos en borde de lote'),(48,3,142,3,83,'2025-12-28','1.2 kg','Fungicida preventivo en zona húmeda'),(49,4,143,4,84,'2025-12-29','3.0 kg','Fertilización nitrogenada pre-siembra'),(50,5,144,5,85,'2025-12-30','600 ml','Regulador de crecimiento en caña joven'),(51,6,145,6,86,'2025-12-31','2.5 L','Herbicida hormonal en malezas de hoja ancha'),(52,7,146,7,87,'2026-01-01','500 ml','Insecticida sistémico en brotes nuevos'),(53,8,147,8,88,'2026-01-02','1.2 kg','Fungicida sistémico en hojas'),(54,9,148,9,89,'2026-01-03','3.0 kg','Fertilización de cobertura'),(55,10,149,10,90,'2026-01-04','600 ml','Regulador de maduración en caña lista'),(56,1,150,1,91,'2026-01-05','2.5 L','Aplicación de glifosato en malezas tempranas'),(57,2,151,2,92,'2026-01-06','500 ml','Control de insectos en borde de lote'),(58,3,152,3,93,'2026-01-07','1.2 kg','Fungicida preventivo en zona húmeda'),(59,4,153,4,94,'2026-01-08','3.0 kg','Fertilización nitrogenada pre-siembra'),(60,5,154,5,95,'2026-01-09','600 ml','Regulador de crecimiento en caña joven'),(61,6,155,6,96,'2026-01-10','2.5 L','Herbicida hormonal en malezas de hoja ancha'),(62,7,156,7,97,'2026-01-11','500 ml','Insecticida sistémico en brotes nuevos'),(63,8,157,8,98,'2026-01-12','1.2 kg','Fungicida sistémico en hojas'),(64,9,158,9,99,'2026-01-13','3.0 kg','Fertilización de cobertura'),(65,10,159,10,100,'2026-01-14','600 ml','Regulador de maduración en caña lista'),(66,1,160,1,81,'2026-01-15','2.5 L','Aplicación de glifosato en malezas tempranas'),(67,2,161,2,82,'2026-01-16','500 ml','Control de insectos en borde de lote'),(68,3,162,3,83,'2026-01-17','1.2 kg','Fungicida preventivo en zona húmeda'),(69,4,163,4,84,'2026-01-18','3.0 kg','Fertilización nitrogenada pre-siembra'),(70,5,164,5,85,'2026-01-19','600 ml','Regulador de crecimiento en caña joven'),(71,6,165,6,86,'2026-01-20','2.5 L','Herbicida hormonal en malezas de hoja ancha'),(72,7,166,7,87,'2026-01-21','500 ml','Insecticida sistémico en brotes nuevos'),(73,8,167,8,88,'2026-01-22','1.2 kg','Fungicida sistémico en hojas'),(74,9,168,9,89,'2026-01-23','3.0 kg','Fertilización de cobertura'),(75,10,169,10,90,'2026-01-24','600 ml','Regulador de maduración en caña lista'),(76,1,170,1,91,'2026-01-25','2.5 L','Aplicación de glifosato en malezas tempranas'),(77,2,171,2,92,'2026-01-26','500 ml','Control de insectos en borde de lote'),(78,3,172,3,93,'2026-01-27','1.2 kg','Fungicida preventivo en zona húmeda'),(79,4,173,4,94,'2026-01-28','3.0 kg','Fertilización nitrogenada pre-siembra'),(80,5,174,5,95,'2026-01-29','600 ml','Regulador de crecimiento en caña joven'),(81,6,175,6,96,'2026-01-30','2.5 L','Herbicida hormonal en malezas de hoja ancha'),(82,7,176,7,97,'2026-01-31','500 ml','Insecticida sistémico en brotes nuevos'),(83,8,177,8,98,'2026-02-01','1.2 kg','Fungicida sistémico en hojas'),(84,9,178,9,99,'2026-02-02','3.0 kg','Fertilización de cobertura'),(85,10,179,10,100,'2026-02-03','600 ml','Regulador de maduración en caña lista'),(86,1,180,1,81,'2026-02-04','2.5 L','Aplicación de glifosato en malezas tempranas'),(87,2,181,2,82,'2026-02-05','500 ml','Control de insectos en borde de lote'),(88,3,182,3,83,'2026-02-06','1.2 kg','Fungicida preventivo en zona húmeda'),(89,4,183,4,84,'2026-02-07','3.0 kg','Fertilización nitrogenada pre-siembra'),(90,5,184,5,85,'2026-02-08','600 ml','Regulador de crecimiento en caña joven'),(91,1,185,1,81,'2026-01-03','2.5 L','Aplicación de glifosato en malezas tempranas'),(92,2,186,2,82,'2026-01-04','500 ml','Control de insectos en borde de lote'),(93,3,187,3,83,'2026-01-05','1.2 kg','Fungicida preventivo en zona húmeda'),(94,4,188,4,84,'2026-01-06','3.0 kg','Fertilización nitrogenada pre-siembra'),(95,5,189,5,85,'2026-01-07','600 ml','Regulador de crecimiento en caña joven');
/*!40000 ALTER TABLE `aplicacion_agroquimico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignacion_tarea`
--

DROP TABLE IF EXISTS `asignacion_tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacion_tarea` (
  `id_asignacion_tarea` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `id_tarea` int NOT NULL,
  `fecha_programada` date NOT NULL,
  `duracion_estimada` varchar(10) DEFAULT NULL,
  `id_maquina` int NOT NULL,
  `id_lote` int NOT NULL,
  `observacion` text,
  PRIMARY KEY (`id_asignacion_tarea`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_tarea` (`id_tarea`),
  KEY `id_lote` (`id_lote`),
  KEY `id_maquina` (`id_maquina`),
  CONSTRAINT `asignacion_tarea_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `asignacion_tarea_ibfk_2` FOREIGN KEY (`id_tarea`) REFERENCES `tarea` (`id_tarea`),
  CONSTRAINT `asignacion_tarea_ibfk_3` FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id_lote`),
  CONSTRAINT `asignacion_tarea_ibfk_4` FOREIGN KEY (`id_maquina`) REFERENCES `maquinaria` (`id_maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion_tarea`
--

LOCK TABLES `asignacion_tarea` WRITE;
/*!40000 ALTER TABLE `asignacion_tarea` DISABLE KEYS */;
INSERT INTO `asignacion_tarea` VALUES (1,95,1,'2025-11-01','8h',81,1,'Siembra directa en lote A1'),(2,96,2,'2025-11-02','6h',82,2,'Preparación de suelo con rastra'),(3,97,3,'2025-11-03','7h',83,3,'Aplicación de fertilizante foliar'),(4,98,4,'2025-11-04','5h',84,4,'Monitoreo de plagas en ensayo'),(5,99,5,'2025-11-05','8h',85,5,'Cosecha parcial en lote C1'),(6,100,6,'2025-11-06','4h',86,6,'Revisión de drenaje y maquinaria'),(7,101,7,'2025-11-07','6h',87,7,'Control de malezas en lote D1'),(8,102,8,'2025-11-08','7h',88,8,'Aplicación de fertilizante programada'),(9,103,9,'2025-11-09','5h',89,9,'Supervisión de producción principal'),(10,104,10,'2025-11-10','8h',90,10,'Descanso rotativo, sin actividad'),(11,105,1,'2025-11-11','6h',91,1,'Siembra en lote A1 con nueva maquinaria'),(12,106,2,'2025-11-12','7h',92,2,'Rastra profunda en lote A2'),(13,107,3,'2025-11-13','5h',93,3,'Fertilización de cobertura'),(14,108,4,'2025-11-14','8h',94,4,'Ensayo de plaguicidas'),(15,109,5,'2025-11-15','6h',95,5,'Cosecha final en lote C1'),(16,110,6,'2025-11-16','4h',96,6,'Chequeo de drenaje'),(17,111,7,'2025-11-17','7h',97,7,'Desmalezado intensivo'),(18,112,8,'2025-11-18','5h',98,8,'Fertilización foliar programada'),(19,113,9,'2025-11-19','6h',99,9,'Producción en lote E1'),(20,114,10,'2025-11-20','8h',100,10,'Rotación de descanso'),(21,115,1,'2025-11-21','6h',81,1,'Siembra directa en lote A1'),(22,116,2,'2025-11-22','7h',82,2,'Preparación de suelo con rastra'),(23,117,3,'2025-11-23','5h',83,3,'Aplicación de fertilizante foliar'),(24,118,4,'2025-11-24','8h',84,4,'Monitoreo de plagas en ensayo'),(25,119,5,'2025-11-25','6h',85,5,'Cosecha parcial en lote C1'),(26,120,6,'2025-11-26','4h',86,6,'Revisión de drenaje y maquinaria'),(27,121,7,'2025-11-27','6h',87,7,'Control de malezas en lote D1'),(28,122,8,'2025-11-28','7h',88,8,'Aplicación de fertilizante programada'),(29,123,9,'2025-11-29','5h',89,9,'Supervisión de producción principal'),(30,124,10,'2025-11-30','8h',90,10,'Descanso rotativo, sin actividad'),(31,123,9,'2025-12-01','5h',89,9,'Supervisión de producción principal'),(32,124,10,'2025-12-02','8h',90,10,'Descanso rotativo, sin actividad'),(33,125,1,'2025-12-03','6h',91,1,'Siembra directa en lote A1'),(34,126,2,'2025-12-04','7h',92,2,'Preparación de suelo con rastra'),(35,127,3,'2025-12-05','5h',93,3,'Aplicación de fertilizante foliar'),(36,128,4,'2025-12-06','8h',94,4,'Monitoreo de plagas en ensayo'),(37,129,5,'2025-12-07','6h',95,5,'Cosecha parcial en lote C1'),(38,130,6,'2025-12-08','4h',96,6,'Revisión de drenaje y maquinaria'),(39,131,7,'2025-12-09','6h',97,7,'Control de malezas en lote D1'),(40,132,8,'2025-12-10','7h',98,8,'Aplicación de fertilizante programada'),(41,133,9,'2025-12-11','5h',99,9,'Supervisión de producción principal'),(42,134,10,'2025-12-12','8h',100,10,'Descanso rotativo, sin actividad'),(43,135,1,'2025-12-13','6h',81,1,'Siembra directa en lote A1'),(44,136,2,'2025-12-14','7h',82,2,'Preparación de suelo con rastra'),(45,137,3,'2025-12-15','5h',83,3,'Aplicación de fertilizante foliar'),(46,138,4,'2025-12-16','8h',84,4,'Monitoreo de plagas en ensayo'),(47,139,5,'2025-12-17','6h',85,5,'Cosecha parcial en lote C1'),(48,140,6,'2025-12-18','4h',86,6,'Revisión de drenaje y maquinaria'),(49,141,7,'2025-12-19','6h',87,7,'Control de malezas en lote D1'),(50,142,8,'2025-12-20','7h',88,8,'Aplicación de fertilizante programada'),(51,143,9,'2025-12-21','5h',89,9,'Supervisión de producción principal'),(52,144,10,'2025-12-22','8h',90,10,'Descanso rotativo, sin actividad'),(53,145,1,'2025-12-23','6h',91,1,'Siembra directa en lote A1'),(54,146,2,'2025-12-24','7h',92,2,'Preparación de suelo con rastra'),(55,147,3,'2025-12-25','5h',93,3,'Aplicación de fertilizante foliar'),(56,148,4,'2025-12-26','8h',94,4,'Monitoreo de plagas en ensayo'),(57,149,5,'2025-12-27','6h',95,5,'Cosecha parcial en lote C1'),(58,150,6,'2025-12-28','4h',96,6,'Revisión de drenaje y maquinaria'),(59,151,7,'2025-12-29','6h',97,7,'Control de malezas en lote D1'),(60,152,8,'2025-12-30','7h',98,8,'Aplicación de fertilizante programada'),(61,153,9,'2025-12-31','5h',99,9,'Supervisión de producción principal'),(62,154,10,'2026-01-01','8h',100,10,'Descanso rotativo, sin actividad'),(63,155,1,'2026-01-02','6h',81,1,'Siembra directa en lote A1'),(64,156,2,'2026-01-03','7h',82,2,'Preparación de suelo con rastra'),(65,157,3,'2026-01-04','5h',83,3,'Aplicación de fertilizante foliar'),(66,158,4,'2026-01-05','8h',84,4,'Monitoreo de plagas en ensayo'),(67,159,5,'2026-01-06','6h',85,5,'Cosecha parcial en lote C1'),(68,160,6,'2026-01-07','4h',86,6,'Revisión de drenaje y maquinaria'),(69,161,7,'2026-01-08','6h',87,7,'Control de malezas en lote D1'),(70,162,8,'2026-01-09','7h',88,8,'Aplicación de fertilizante programada'),(71,163,9,'2026-01-10','5h',89,9,'Supervisión de producción principal'),(72,164,10,'2026-01-11','8h',90,10,'Descanso rotativo, sin actividad'),(73,165,1,'2026-01-12','6h',91,1,'Siembra directa en lote A1'),(74,166,2,'2026-01-13','7h',92,2,'Preparación de suelo con rastra'),(75,167,3,'2026-01-14','5h',93,3,'Aplicación de fertilizante foliar'),(76,168,4,'2026-01-15','8h',94,4,'Monitoreo de plagas en ensayo'),(77,169,5,'2026-01-16','6h',95,5,'Cosecha parcial en lote C1'),(78,170,6,'2026-01-17','4h',96,6,'Revisión de drenaje y maquinaria'),(79,171,7,'2026-01-18','6h',97,7,'Control de malezas en lote D1'),(80,172,8,'2026-01-19','7h',98,8,'Aplicación de fertilizante programada'),(81,173,9,'2026-01-20','5h',99,9,'Supervisión de producción principal'),(82,174,10,'2026-01-21','8h',100,10,'Descanso rotativo, sin actividad'),(83,175,1,'2026-01-22','6h',81,1,'Siembra directa en lote A1'),(84,176,2,'2026-01-23','7h',82,2,'Preparación de suelo con rastra'),(85,177,3,'2026-01-24','5h',83,3,'Aplicación de fertilizante foliar'),(86,178,4,'2026-01-25','8h',84,4,'Monitoreo de plagas en ensayo'),(87,179,5,'2026-01-26','6h',85,5,'Cosecha parcial en lote C1'),(88,180,6,'2026-01-27','4h',86,6,'Revisión de drenaje y maquinaria'),(89,181,7,'2026-01-28','6h',87,7,'Control de malezas en lote D1'),(90,182,8,'2026-01-29','7h',88,8,'Aplicación de fertilizante programada'),(91,183,9,'2026-01-30','5h',89,9,'Supervisión de producción principal'),(92,184,10,'2026-01-31','8h',90,10,'Descanso rotativo, sin actividad'),(93,185,5,'2025-12-31','6h',85,5,'Cosecha parcial en lote C1'),(94,186,6,'2026-01-01','4h',86,6,'Revisión de drenaje y maquinaria'),(95,187,7,'2026-01-02','6h',87,7,'Control de malezas en lote D1'),(96,188,8,'2026-01-03','7h',88,8,'Aplicación de fertilizante programada'),(97,189,9,'2026-01-04','5h',89,9,'Supervisión de producción principal');
/*!40000 ALTER TABLE `asignacion_tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campo`
--

DROP TABLE IF EXISTS `campo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `campo` (
  `id_campo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `tamaño_superficie` varchar(50) DEFAULT NULL,
  `observacion` text,
  PRIMARY KEY (`id_campo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campo`
--

LOCK TABLES `campo` WRITE;
/*!40000 ALTER TABLE `campo` DISABLE KEYS */;
INSERT INTO `campo` VALUES (1,'Campo Norte','120 ha','Zona de riego intensivo'),(2,'Campo Sur','85 ha','Área con rotación de cultivos'),(3,'Campo Este','60 ha','Pendiente leve, buena exposición solar'),(4,'Campo Oeste','150 ha','Sector experimental con caña de azúcar'),(5,'Campo Central','100 ha','Área principal de cosecha');
/*!40000 ALTER TABLE `campo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `decripcion` text,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Peón rural','Realiza tareas generales en el campo como corte, limpieza y carga de caña.'),(2,'Peón especializado','Ejecuta labores específicas como aplicación de agroquímicos o manejo de riego.'),(3,'Maquinista','Opera maquinaria agrícola como tractores, cosechadoras y pulverizadoras.'),(4,'Capataz','Supervisa cuadrillas de trabajo y coordina actividades en el lote.'),(5,'Encargado de campo','Administra lotes, recursos y planificación de tareas rurales.'),(6,'Técnico en riego','Gestiona sistemas de riego y controla el suministro de agua.'),(7,'Técnico en fertilización','Define y aplica planes de fertilización según cultivo y suelo.'),(8,'Técnico en agroquímicos','Controla el uso seguro y eficiente de productos fitosanitarios.'),(9,'Chofer rural','Transporta caña y personal en vehículos del ingenio.'),(10,'Auxiliar de campo','Apoya en tareas menores y asistencia a técnicos y capataces.');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `condicion_laboral`
--

DROP TABLE IF EXISTS `condicion_laboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condicion_laboral` (
  `id_condicion_laboral` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_condicion_laboral`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `condicion_laboral`
--

LOCK TABLES `condicion_laboral` WRITE;
/*!40000 ALTER TABLE `condicion_laboral` DISABLE KEYS */;
INSERT INTO `condicion_laboral` VALUES (1,'Permanente','Empleado con contrato estable, sin fecha de finalización.'),(2,'Temporario','Empleado por tiempo limitado, según temporada o proyecto.'),(3,'Contratado','Empleado bajo contrato específico con duración determinada.'),(4,'Jornalero','Trabajador que cobra por jornada laboral realizada.'),(5,'Pasante','Persona en formación que realiza tareas prácticas supervisadas.'),(6,'Tercerizado','Empleado contratado por empresa externa para prestar servicios.'),(7,'Monotributista','Trabajador independiente que factura por servicios prestados.'),(8,'En capacitación','Empleado en proceso de formación, aún no operativo.'),(9,'Licencia médica','Empleado con suspensión temporal por razones de salud.'),(10,'Baja definitiva','Empleado desvinculado del sistema de forma permanente.');
/*!40000 ALTER TABLE `condicion_laboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_contacto_empleado`
--

DROP TABLE IF EXISTS `datos_contacto_empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datos_contacto_empleado` (
  `id_contacto` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `domicilio` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `id_provincia` int NOT NULL,
  PRIMARY KEY (`id_contacto`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_contacto_empleado`
--

LOCK TABLES `datos_contacto_empleado` WRITE;
/*!40000 ALTER TABLE `datos_contacto_empleado` DISABLE KEYS */;
INSERT INTO `datos_contacto_empleado` VALUES (1,1,'Av. Libertad 123','3884567890',1),(2,2,'Calle Belgrano 456','3884123456',1),(3,3,'Ruta 34 km 5','3884987654',1),(4,4,'Barrio Centro Mz 3','3884765432',1),(5,5,'Calle Salta 789','3884234567',1),(6,6,'Av. San Martín 101','3884112233',1),(7,7,'Pasaje Mitre 88','3884998877',1),(8,8,'Calle Jujuy 321','3884556677',1),(9,9,'Ruta 9 km 12','3884001122',1),(10,10,'Barrio Norte Mz 5','3884778899',1),(11,11,'Av. Italia 654','3884223344',1),(12,12,'Calle Güemes 789','3884334455',1),(13,13,'Barrio San José Mz 2','3884667788',1),(14,14,'Calle Lavalle 123','3884999000',1),(15,15,'Ruta Provincial 1','3884111000',1),(16,16,'Av. Córdoba 456','3884225566',1),(17,17,'Calle Tucumán 789','3884336677',1),(18,18,'Barrio El Milagro Mz 4','3884447788',1),(19,19,'Calle Catamarca 321','3884558899',1),(20,20,'Av. Bolivia 654','3884669900',1),(21,21,'Calle Mendoza 101','3884770011',1),(22,22,'Barrio San Miguel Mz 6','3884881122',1),(23,23,'Calle Entre Ríos 88','3884992233',1),(24,24,'Ruta 66 km 3','3884003344',1),(25,25,'Av. República 789','3884114455',1),(26,26,'Calle Alberdi 123','3884225566',1),(27,27,'Barrio Santa Rosa Mz 7','3884336677',1),(28,28,'Calle Formosa 456','3884447788',1),(29,29,'Ruta 34 km 8','3884558899',1),(30,30,'Av. Belgrano 321','3884669900',1),(31,31,'Calle Rivadavia 654','3884770011',1),(32,32,'Barrio La Merced Mz 8','3884881122',1),(33,33,'Calle San Juan 101','3884992233',1),(34,34,'Ruta 9 km 15','3884003344',1),(35,35,'Av. Sarmiento 789','3884114455',1),(36,36,'Calle Corrientes 123','3884225566',1),(37,37,'Barrio San Pablo Mz 9','3884336677',1),(38,38,'Calle Misiones 456','3884447788',1),(39,39,'Ruta 66 km 5','3884558899',1),(40,40,'Av. Independencia 321','3884669900',1),(41,41,'Calle Chaco 654','3884770011',1),(42,42,'Barrio San Francisco Mz 10','3884881122',1),(43,43,'Calle Santiago 101','3884992233',1),(44,44,'Ruta 34 km 10','3884003344',1),(45,45,'Av. Mitre 789','3884114455',1),(46,46,'Calle Salta 123','3884225566',1),(47,47,'Barrio Santa Ana Mz 11','3884336677',1),(48,48,'Calle Córdoba 456','3884447788',1),(49,49,'Ruta 9 km 18','3884558899',1),(50,50,'Av. Jujuy 321','3884669900',1),(51,51,'Calle San Luis 456','3884771122',2),(52,52,'Barrio San Martín Mz 12','3884882233',1),(53,53,'Calle La Rioja 101','3884993344',1),(54,54,'Ruta 66 km 7','3884004455',1),(55,55,'Av. Santa Fe 789','3884115566',1),(56,56,'Calle Entre Ríos 123','3884226677',1),(57,57,'Barrio San Isidro Mz 13','3884337788',1),(58,58,'Calle Neuquén 456','3884448899',1),(59,59,'Ruta 9 km 20','3884559900',1),(60,60,'Av. Buenos Aires 321','3884660011',1),(61,61,'Calle Tierra del Fuego 654','3884771122',1),(62,62,'Barrio San Antonio Mz 14','3884882233',1),(63,63,'Calle Santa Cruz 101','3884993344',1),(64,64,'Ruta 34 km 12','3884004455',1),(65,65,'Av. La Pampa 789','3884115566',1),(66,66,'Calle Misiones 123','3884226677',1),(67,67,'Barrio San Lorenzo Mz 15','3884337788',1),(68,68,'Calle Chubut 456','3884448899',1),(69,69,'Ruta 66 km 9','3884559900',1),(70,70,'Av. San Juan 321','3884660011',1),(71,71,'Calle Corrientes 654','3884771122',1),(72,72,'Barrio San Rafael Mz 16','3884882233',1),(73,73,'Calle Formosa 101','3884993344',1),(74,74,'Ruta 9 km 22','3884004455',1),(75,75,'Av. Mendoza 789','3884115566',1),(76,76,'Calle Catamarca 123','3884226677',1),(77,77,'Barrio San Nicolás Mz 17','3884337788',1),(78,78,'Calle Salta 456','3884448899',1),(79,79,'Ruta 34 km 14','3884559900',1),(80,80,'Av. Córdoba 321','3884660011',1),(81,81,'Calle Tucumán 654','3884771122',1),(82,82,'Barrio San Pedro Mz 18','3884882233',1),(83,83,'Calle Jujuy 101','3884993344',1),(84,84,'Ruta 66 km 11','3884004455',1),(85,85,'Av. Libertad 789','3884115566',1),(86,86,'Calle Belgrano 123','3884226677',1),(87,87,'Barrio San José Mz 19','3884337788',1),(88,88,'Calle Lavalle 456','3884448899',1),(89,89,'Ruta 9 km 24','3884559900',1),(90,90,'Av. Italia 321','3884660011',1),(91,91,'Calle Güemes 654','3884771122',2),(92,92,'Barrio Santa Rosa Mz 20','3884882233',1),(93,93,'Calle Alberdi 101','3884993344',1),(94,94,'Ruta 34 km 16','3884004455',1),(95,95,'Av. República 789','3884115566',1),(96,96,'Calle Rivadavia 123','3884226677',1),(97,97,'Barrio La Merced Mz 21','3884337788',1),(98,98,'Calle San Juan 456','3884448899',1),(99,99,'Ruta 66 km 13','3884559900',1),(100,100,'Av. Sarmiento 321','3884660011',2);
/*!40000 ALTER TABLE `datos_contacto_empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_liquidacion`
--

DROP TABLE IF EXISTS `detalle_liquidacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_liquidacion` (
  `id_detalle_liquidacion` int NOT NULL AUTO_INCREMENT,
  `id_liquidacion` int NOT NULL,
  `id_valor_parametro` int NOT NULL,
  `monto_aplicado` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_liquidacion`),
  KEY `id_liquidacion` (`id_liquidacion`),
  KEY `id_valor_parametro` (`id_valor_parametro`),
  CONSTRAINT `detalle_liquidacion_ibfk_1` FOREIGN KEY (`id_liquidacion`) REFERENCES `liquidacion` (`id_liquidacion`),
  CONSTRAINT `detalle_liquidacion_ibfk_2` FOREIGN KEY (`id_valor_parametro`) REFERENCES `valor_parametro_liquidacion` (`id_valor`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_liquidacion`
--

LOCK TABLES `detalle_liquidacion` WRITE;
/*!40000 ALTER TABLE `detalle_liquidacion` DISABLE KEYS */;
INSERT INTO `detalle_liquidacion` VALUES (241,1,1,8500.00),(242,2,2,9200.00),(243,3,3,9800.00),(244,4,4,10200.00),(245,5,1,10800.00),(246,6,2,11500.00),(247,7,3,7200.00),(248,8,4,7800.00),(249,9,1,8400.00),(250,10,1,8900.00),(251,11,1,8500.00),(252,12,2,9200.00),(253,13,3,9800.00),(254,14,4,10200.00),(255,15,4,10800.00),(256,16,3,11500.00),(257,17,1,7200.00),(258,18,3,7800.00),(259,19,1,8400.00),(260,20,1,8900.00),(261,21,1,8500.00),(262,22,2,9200.00),(263,23,3,9800.00),(264,24,4,10200.00),(265,25,1,10800.00),(266,26,4,11500.00),(267,27,1,7200.00),(268,28,2,7800.00),(269,29,3,8400.00),(270,30,1,8900.00),(271,31,1,8500.00),(272,32,2,9200.00),(273,33,3,9800.00),(274,34,4,10200.00),(275,35,1,10800.00),(276,36,2,11500.00),(277,37,3,7200.00),(278,38,2,7800.00),(279,39,2,8400.00),(280,40,1,8900.00),(281,41,1,8500.00),(282,42,2,9200.00),(283,43,3,9800.00),(284,44,4,10200.00),(285,45,2,10800.00),(286,46,2,11500.00),(287,47,2,7200.00),(288,48,4,7800.00),(289,49,4,8400.00),(290,50,1,8900.00),(291,51,1,8500.00),(292,52,2,9200.00),(293,53,3,9800.00),(294,54,4,10200.00),(295,55,4,10800.00),(296,56,3,11500.00),(297,57,4,7200.00),(298,58,2,7800.00),(299,59,1,8400.00),(300,60,1,8900.00),(301,61,1,8500.00),(302,62,2,9200.00),(303,63,3,9800.00),(304,64,4,10200.00),(305,65,2,10800.00),(306,66,3,11500.00),(307,67,4,7200.00),(308,68,3,7800.00),(309,69,3,8400.00),(310,70,1,8900.00),(311,71,1,8500.00),(312,72,2,9200.00),(313,73,3,9800.00),(314,74,4,10200.00),(315,75,2,10800.00),(316,76,3,11500.00),(317,77,3,7200.00),(318,78,3,7800.00),(319,79,3,8400.00),(320,80,1,8900.00),(321,81,1,8500.00),(322,82,2,9200.00),(323,83,3,9800.00),(324,84,4,10200.00),(325,85,3,10800.00),(326,86,2,11500.00),(327,87,2,7200.00),(328,88,2,7800.00),(329,89,2,8400.00),(330,90,1,8900.00),(331,91,1,8500.00),(332,92,2,9200.00),(333,93,3,9800.00),(334,94,4,10200.00),(335,95,3,10800.00);
/*!40000 ALTER TABLE `detalle_liquidacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `id_tipo_documento` int NOT NULL,
  `numero_doc` varchar(20) NOT NULL,
  `fecha_nac` date NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_baja` date DEFAULT NULL,
  `id_contacto` int NOT NULL,
  `id_sexo` int NOT NULL,
  `id_estado_civil` int NOT NULL,
  `cant_hijos` int NOT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `id_puesto` int NOT NULL,
  `id_condicion_laboral` int NOT NULL,
  `estado_familiar` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_puesto` (`id_puesto`),
  KEY `id_condicion_laboral` (`id_condicion_laboral`),
  KEY `id_estado_civil` (`id_estado_civil`),
  KEY `id_sexo` (`id_sexo`),
  KEY `id_contacto` (`id_contacto`),
  KEY `id_tipo_documento` (`id_tipo_documento`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`id_puesto`) REFERENCES `puesto` (`id_puesto`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`id_condicion_laboral`) REFERENCES `condicion_laboral` (`id_condicion_laboral`),
  CONSTRAINT `empleado_ibfk_3` FOREIGN KEY (`id_estado_civil`) REFERENCES `estado_civil` (`id_estado_civil`),
  CONSTRAINT `empleado_ibfk_4` FOREIGN KEY (`id_sexo`) REFERENCES `sexo` (`id_sexo`),
  CONSTRAINT `empleado_ibfk_5` FOREIGN KEY (`id_contacto`) REFERENCES `datos_contacto_empleado` (`id_contacto`),
  CONSTRAINT `empleado_ibfk_6` FOREIGN KEY (`id_tipo_documento`) REFERENCES `tipo_documento` (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (95,'Juan','Pérez',1,'30123456','1985-04-12','2020-03-15',NULL,1,1,2,2,1,1,1,'Con cargas familiares'),(96,'María','Gómez',1,'29222333','1990-06-10','2021-06-10',NULL,2,2,1,0,1,2,2,'Sin Hijos'),(97,'Carlos','López',1,'28333444','1982-11-01','2019-11-01',NULL,3,1,3,3,1,3,1,'Con cargas familiares'),(98,'Laura','Méndez',1,'30444555','1995-01-20','2022-01-20',NULL,4,2,2,0,1,4,3,'Sin Hijos'),(99,'Roberto','Sosa',1,'31555666','1988-04-05','2023-04-05',NULL,5,1,1,1,1,5,1,'Con cargas familiares'),(100,'Ana','Ramírez',1,'32666777','1992-08-12','2020-08-12',NULL,6,2,2,0,1,2,2,'Sin Hijos'),(101,'Diego','Fernández',1,'33777888','1987-09-30','2021-09-30',NULL,7,1,1,2,1,3,1,'Con cargas familiares'),(102,'Lucía','Martínez',1,'34888999','1993-02-14','2022-02-14',NULL,8,2,2,1,1,4,4,'Con cargas familiares'),(103,'Jorge','Aguilar',1,'35999000','1986-05-22','2023-05-22',NULL,9,1,3,0,1,5,1,'Sin Hijos'),(104,'Sofía','Vega',1,'37000111','1991-07-07','2020-07-07',NULL,10,2,1,2,1,1,1,'Con cargas familiares'),(105,'Martín','Silva',1,'38111222','1984-10-18','2021-10-18',NULL,11,1,2,0,1,2,2,'Sin Hijos'),(106,'Camila','Moreno',1,'39222333','1996-03-25','2022-03-25',NULL,12,2,1,1,1,3,1,'Con cargas familiares'),(107,'Andrés','Ríos',1,'40333444','1989-06-01','2023-06-01',NULL,13,1,3,0,1,4,3,'Sin Hijos'),(108,'Valeria','Paz',1,'41444555','1994-09-09','2020-09-09',NULL,14,2,2,2,1,5,1,'Con cargas familiares'),(109,'Pablo','Castro',1,'42555666','1983-12-12','2021-12-12',NULL,15,1,1,0,1,2,2,'Sin Hijos'),(110,'Florencia','Luna',1,'43666777','1997-04-30','2022-04-30',NULL,16,2,1,1,1,3,1,'Con cargas familiares'),(111,'Hernán','Sánchez',1,'44777888','1986-07-15','2023-07-15',NULL,17,1,2,0,1,4,4,'Sin Hijos'),(112,'Julieta','Torres',1,'45888999','1992-10-20','2020-10-20',NULL,18,2,3,2,1,5,1,'Con cargas familiares'),(113,'Federico','Molina',1,'46999000','1985-01-05','2021-01-05',NULL,19,1,1,0,1,1,1,'Sin Hijos'),(114,'Natalia','Cruz',1,'47000111','1990-05-18','2022-05-18',NULL,20,2,2,1,1,2,2,'Con cargas familiares'),(115,'Gustavo','Navarro',1,'48111222','1988-08-22','2023-08-22',NULL,21,1,1,0,1,3,1,'Sin Hijos'),(116,'Rocío','Herrera',1,'49222333','1993-11-11','2020-11-11',NULL,22,2,2,2,1,4,3,'Con cargas familiares'),(117,'Emiliano','Peralta',1,'50333444','1987-02-28','2021-02-28',NULL,23,1,3,0,1,5,1,'Sin Hijos'),(118,'Agustina','Correa',1,'51444555','1995-06-06','2022-06-06',NULL,24,2,1,1,1,2,2,'Con cargas familiares'),(119,'Tomás','Vargas',1,'52555666','1989-09-09','2023-09-09',NULL,25,1,2,0,1,3,1,'Sin Hijos'),(120,'Milagros','Ledesma',1,'53666777','1991-12-24','2020-12-24',NULL,26,2,1,2,1,4,4,'Con cargas familiares'),(121,'Nicolás','Acosta',1,'54777888','1984-03-03','2021-03-03',NULL,27,1,3,0,1,5,1,'Sin Hijos'),(122,'Brenda','Ramos',1,'55888999','1996-07-07','2022-07-07',NULL,28,2,2,1,1,1,1,'Con cargas familiares'),(123,'Franco','Gutiérrez',1,'56999000','1985-10-10','2023-10-10',NULL,29,1,1,0,1,2,2,'Sin Hijos'),(124,'Cecilia','Benítez',1,'57000111','1990-01-01','2020-01-01',NULL,30,2,3,2,1,3,1,'Con cargas familiares'),(125,'Ramiro','Quiroga',1,'58111222','1987-04-04','2021-04-04',NULL,31,1,2,1,1,4,3,'Con cargas familiares'),(126,'Melina','Soria',1,'59222333','1994-08-08','2022-08-08',NULL,32,2,1,0,1,5,1,'Sin Hijos'),(127,'Leandro','Ibarra',1,'60333444','1986-11-11','2023-11-11',NULL,33,1,3,2,1,2,2,'Con cargas familiares'),(128,'Daiana','Ortiz',1,'61444555','1991-02-02','2020-02-02',NULL,34,2,2,0,1,3,1,'Sin Hijos'),(129,'Iván','Paredes',1,'62555666','1989-05-05','2021-05-05',NULL,35,1,1,1,1,4,4,'Con cargas familiares'),(130,'Noelia','Bravo',1,'63666777','1993-09-09','2022-09-09',NULL,36,2,2,0,1,5,1,'Sin Hijos'),(131,'Matías','Delgado',1,'64777888','1985-12-12','2023-12-12',NULL,37,1,3,2,1,1,1,'Con cargas familiares'),(132,'Carla','Ferreyra',1,'65888999','1990-03-03','2020-03-03',NULL,38,2,1,0,1,2,2,'Sin Hijos'),(133,'Ezequiel','Ojeda',1,'66999000','1988-06-06','2021-06-06',NULL,39,1,2,1,1,3,1,'Con cargas familiares'),(134,'Ailén','Campos',1,'67000111','1995-10-10','2022-10-10',NULL,40,2,3,0,1,4,3,'Sin Hijos'),(135,'Sebastián','Roldán',1,'68111222','1987-01-01','2023-01-01',NULL,41,1,1,2,1,5,1,'Con cargas familiares'),(136,'Micaela','Villalba',1,'69222333','1992-04-04','2020-04-04',NULL,42,2,2,0,1,2,2,'Sin Hijos'),(137,'Lucas','Barrios',1,'70333444','1986-07-07','2021-07-07',NULL,43,1,3,1,1,3,1,'Con cargas familiares'),(138,'Daniela','Montes',1,'71444555','1994-11-11','2022-11-11',NULL,44,2,1,0,1,4,4,'Sin Hijos'),(139,'Alan','Espinoza',1,'72555666','1989-02-02','2023-02-02',NULL,45,1,2,2,1,5,1,'Con cargas familiares'),(140,'Camila','Salas',1,'73666777','1991-05-05','2020-05-05',NULL,46,2,3,0,1,1,1,'Sin Hijos'),(141,'Marcos','Reyes',1,'74777888','1985-08-08','2021-08-08',NULL,47,1,1,1,1,2,2,'Con cargas familiares'),(142,'Antonella','Maidana',1,'75888999','1996-12-12','2022-12-12',NULL,48,2,2,0,1,3,1,'Sin Hijos'),(143,'Facundo','Arias',1,'76999000','1988-03-03','2023-03-03',NULL,49,1,3,2,1,4,3,'Con cargas familiares'),(144,'Valentín','Morales',1,'77000111','1990-06-06','2020-06-06',NULL,50,1,1,0,1,5,1,'Sin Hijos'),(145,'Lucía','Gómez',1,'78111222','1993-04-15','2023-04-15',NULL,51,2,2,1,1,1,1,'Con cargas familiares'),(146,'Tomás','Benítez',1,'79222333','1987-07-20','2020-07-20',NULL,52,1,1,0,1,2,2,'Sin Hijos'),(147,'Julieta','Rivas',1,'80333444','1995-10-30','2021-10-30',NULL,53,2,3,2,1,3,1,'Con cargas familiares'),(148,'Bruno','Soria',1,'81444555','1989-01-25','2022-01-25',NULL,54,1,2,0,1,4,3,'Sin Hijos'),(149,'Agustina','López',1,'82555666','1991-05-12','2023-05-12',NULL,55,2,1,1,1,5,1,'Con cargas familiares'),(150,'Rodrigo','Vega',1,'83666777','1986-08-18','2020-08-18',NULL,56,1,2,0,1,1,1,'Sin Hijos'),(151,'Martina','Paredes',1,'84777888','1994-11-22','2021-11-22',NULL,57,2,3,2,1,2,2,'Con cargas familiares'),(152,'Santiago','Acosta',1,'85888999','1988-02-28','2022-02-28',NULL,58,1,1,0,1,3,1,'Sin Hijos'),(153,'Camila','Gutiérrez',1,'86999000','1990-06-06','2023-06-06',NULL,59,2,2,1,1,4,3,'Con cargas familiares'),(154,'Franco','Moreno',1,'87000111','1985-09-09','2020-09-09',NULL,60,1,3,0,1,5,1,'Sin Hijos'),(155,'Romina','Silva',1,'88111222','1992-01-15','2021-01-15',NULL,61,2,2,1,1,1,1,'Con cargas familiares'),(156,'Federico','Luna',1,'89222333','1986-04-20','2022-04-20',NULL,62,1,1,0,1,2,2,'Sin Hijos'),(157,'Carolina','Sánchez',1,'90333444','1994-07-30','2023-07-30',NULL,63,2,3,2,1,3,1,'Con cargas familiares'),(158,'Gonzalo','Torres',1,'91444555','1988-10-25','2020-10-25',NULL,64,1,2,0,1,4,3,'Sin Hijos'),(159,'Florencia','Molina',1,'92555666','1991-02-12','2021-02-12',NULL,65,2,1,1,1,5,1,'Con cargas familiares'),(160,'Matías','Cruz',1,'93666777','1987-05-18','2022-05-18',NULL,66,1,2,0,1,1,1,'Sin Hijos'),(161,'Camila','Navarro',1,'94777888','1993-08-22','2023-08-22',NULL,67,2,3,2,1,2,2,'Con cargas familiares'),(162,'Lucas','Herrera',1,'95888999','1985-11-11','2020-11-11',NULL,68,1,1,0,1,3,1,'Sin Hijos'),(163,'Agustina','Peralta',1,'96999000','1990-02-28','2021-02-28',NULL,69,2,2,1,1,4,3,'Con cargas familiares'),(164,'Tomás','Correa',1,'97000111','1986-06-06','2022-06-06',NULL,70,1,3,0,1,5,1,'Sin Hijos'),(165,'Milagros','Vargas',1,'98111222','1994-09-09','2023-09-09',NULL,71,2,1,2,1,1,1,'Con cargas familiares'),(166,'Nicolás','Ledesma',1,'99222333','1988-12-24','2020-12-24',NULL,72,1,2,0,1,2,2,'Sin Hijos'),(167,'Brenda','Acosta',1,'100333444','1992-03-03','2021-03-03',NULL,73,2,3,1,1,3,1,'Con cargas familiares'),(168,'Franco','Ramos',1,'101444555','1986-07-07','2022-07-07',NULL,74,1,1,0,1,4,3,'Sin Hijos'),(169,'Cecilia','Gutiérrez',1,'102555666','1990-10-10','2023-10-10',NULL,75,2,2,2,1,5,1,'Con cargas familiares'),(170,'Ramiro','Benítez',1,'103666777','1985-01-01','2020-01-01',NULL,76,1,3,0,1,1,1,'Sin Hijos'),(171,'Melina','Quiroga',1,'104777888','1993-04-04','2021-04-04',NULL,77,2,1,1,1,2,2,'Con cargas familiares'),(172,'Leandro','Soria',1,'105888999','1987-08-08','2022-08-08',NULL,78,1,2,0,1,3,1,'Sin Hijos'),(173,'Daiana','Ibarra',1,'106999000','1991-11-11','2023-11-11',NULL,79,2,3,2,1,4,3,'Con cargas familiares'),(174,'Iván','Ortiz',1,'107000111','1986-02-02','2020-02-02',NULL,80,1,1,0,1,5,1,'Sin Hijos'),(175,'Noelia','Paredes',1,'108111222','1994-05-05','2021-05-05',NULL,81,2,2,1,1,1,1,'Con cargas familiares'),(176,'Matías','Bravo',1,'109222333','1988-09-09','2022-09-09',NULL,82,1,3,0,1,2,2,'Sin Hijos'),(177,'Carla','Delgado',1,'110333444','1992-12-12','2023-12-12',NULL,83,2,1,2,1,3,1,'Con cargas familiares'),(178,'Ezequiel','Ferreyra',1,'111444555','1986-03-03','2020-03-03',NULL,84,1,2,0,1,4,3,'Sin Hijos'),(179,'Ailén','Ojeda',1,'112555666','1990-06-06','2021-06-06',NULL,85,2,3,1,1,5,1,'Con cargas familiares'),(180,'Sebastián','Campos',1,'113666777','1985-10-10','2022-10-10',NULL,86,1,1,0,1,1,1,'Sin Hijos'),(181,'Micaela','Roldán',1,'114777888','1993-01-01','2023-01-01',NULL,87,2,2,2,1,2,2,'Con cargas familiares'),(182,'Lucas','Villalba',1,'115888999','1987-04-04','2020-04-04',NULL,88,1,3,0,1,3,1,'Sin Hijos'),(183,'Daniela','Barrios',1,'116999000','1991-07-07','2021-07-07',NULL,89,2,1,1,1,4,3,'Con cargas familiares'),(184,'Alan','Montes',1,'117000111','1986-11-11','2022-11-11',NULL,90,1,2,0,1,5,1,'Sin Hijos'),(185,'Camila','Espinoza',1,'118111222','1994-02-02','2023-02-02',NULL,91,2,3,2,1,1,1,'Con cargas familiares'),(186,'Marcos','Salas',1,'119222333','1988-05-05','2020-05-05',NULL,92,1,1,0,1,2,2,'Sin Hijos'),(187,'Antonella','Reyes',1,'120333444','1992-08-08','2021-08-08',NULL,93,2,2,1,1,3,1,'Con cargas familiares'),(188,'Facundo','Maidana',1,'121444555','1986-12-12','2022-12-12',NULL,94,1,3,0,1,4,3,'Sin Hijos'),(189,'Facundo','Maidana',1,'31234567','1986-11-22','2022-08-10',NULL,94,1,3,0,1,4,2,'Sin Hijos');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_empleado_estado_familiar_insert` BEFORE INSERT ON `empleado` FOR EACH ROW BEGIN IF NEW.cant_hijos = 0 THEN SET NEW.estado_familiar = 'Sin Hijos'; ELSE SET NEW.estado_familiar = 'Con cargas familiares'; END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_civil` (
  `id_estado_civil` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_estado_civil`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_civil`
--

LOCK TABLES `estado_civil` WRITE;
/*!40000 ALTER TABLE `estado_civil` DISABLE KEYS */;
INSERT INTO `estado_civil` VALUES (1,'Soltero/a'),(2,'Casado/a'),(3,'Divorciado/a'),(4,'Viudo/a'),(5,'Unión convivencial'),(6,'Separado/a legalmente'),(7,'Pareja de hecho'),(8,'No especificado');
/*!40000 ALTER TABLE `estado_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_lote`
--

DROP TABLE IF EXISTS `estado_lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_lote` (
  `id_estado_lote` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado_lote`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_lote`
--

LOCK TABLES `estado_lote` WRITE;
/*!40000 ALTER TABLE `estado_lote` DISABLE KEYS */;
INSERT INTO `estado_lote` VALUES (1,'Disponible'),(2,'En proceso'),(3,'Reservado'),(4,'Vencido'),(5,'Rechazado'),(6,'Finalizado'),(7,'Pendiente de inspección'),(8,'Liberado');
/*!40000 ALTER TABLE `estado_lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_maquina`
--

DROP TABLE IF EXISTS `estado_maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_maquina` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_maquina`
--

LOCK TABLES `estado_maquina` WRITE;
/*!40000 ALTER TABLE `estado_maquina` DISABLE KEYS */;
INSERT INTO `estado_maquina` VALUES (1,'Operativa'),(2,'En mantenimiento'),(3,'Fuera de servicio'),(4,'Disponible'),(5,'Asignada'),(6,'Pendiente de revisión'),(7,'Requiere repuestos'),(8,'En traslado'),(9,'Reservada'),(10,'Dada de baja');
/*!40000 ALTER TABLE `estado_maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horas_trabajadas`
--

DROP TABLE IF EXISTS `horas_trabajadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horas_trabajadas` (
  `id_horas_trabajadas` int NOT NULL AUTO_INCREMENT,
  `id_asignacion_tarea` int DEFAULT NULL,
  `fecha_actual` date NOT NULL,
  `horas_trabajadas` time NOT NULL,
  PRIMARY KEY (`id_horas_trabajadas`),
  KEY `id_asignacion_tarea` (`id_asignacion_tarea`),
  CONSTRAINT `horas_trabajadas_ibfk_1` FOREIGN KEY (`id_asignacion_tarea`) REFERENCES `asignacion_tarea` (`id_asignacion_tarea`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horas_trabajadas`
--

LOCK TABLES `horas_trabajadas` WRITE;
/*!40000 ALTER TABLE `horas_trabajadas` DISABLE KEYS */;
INSERT INTO `horas_trabajadas` VALUES (97,1,'2025-11-01','08:00:00'),(98,2,'2025-11-02','06:00:00'),(99,3,'2025-11-03','08:00:00'),(100,4,'2025-11-04','06:00:00'),(101,5,'2025-11-05','08:00:00'),(102,6,'2025-11-06','06:00:00'),(103,7,'2025-11-07','08:00:00'),(104,8,'2025-11-08','06:00:00'),(105,9,'2025-11-09','08:00:00'),(106,10,'2025-11-10','06:00:00'),(107,11,'2025-11-11','08:00:00'),(108,12,'2025-11-12','06:00:00'),(109,13,'2025-11-13','08:00:00'),(110,14,'2025-11-14','06:00:00'),(111,15,'2025-11-15','08:00:00'),(112,16,'2025-11-16','06:00:00'),(113,17,'2025-11-17','08:00:00'),(114,18,'2025-11-18','06:00:00'),(115,19,'2025-11-19','08:00:00'),(116,20,'2025-11-20','06:00:00'),(117,21,'2025-11-21','08:00:00'),(118,22,'2025-11-22','06:00:00'),(119,23,'2025-11-23','08:00:00'),(120,24,'2025-11-24','06:00:00'),(121,25,'2025-11-25','08:00:00'),(122,26,'2025-11-26','06:00:00'),(123,27,'2025-11-27','08:00:00'),(124,28,'2025-11-28','06:00:00'),(125,29,'2025-11-29','08:00:00'),(126,30,'2025-11-30','06:00:00'),(127,31,'2025-12-01','08:00:00'),(128,32,'2025-12-02','06:00:00'),(129,33,'2025-12-03','08:00:00'),(130,34,'2025-12-04','06:00:00'),(131,35,'2025-12-05','08:00:00'),(132,36,'2025-12-06','06:00:00'),(133,37,'2025-12-07','08:00:00'),(134,38,'2025-12-08','06:00:00'),(135,39,'2025-12-09','08:00:00'),(136,40,'2025-12-10','06:00:00'),(137,41,'2025-12-11','08:00:00'),(138,42,'2025-12-12','06:00:00'),(139,43,'2025-12-13','08:00:00'),(140,44,'2025-12-14','06:00:00'),(141,45,'2025-12-15','08:00:00'),(142,46,'2025-12-16','06:00:00'),(143,47,'2025-12-17','08:00:00'),(144,48,'2025-12-18','06:00:00'),(145,49,'2025-12-19','08:00:00'),(146,50,'2025-12-20','06:00:00'),(147,51,'2025-12-21','08:00:00'),(148,52,'2025-12-22','06:00:00'),(149,53,'2025-12-23','08:00:00'),(150,54,'2025-12-24','06:00:00'),(151,55,'2025-12-25','08:00:00'),(152,56,'2025-12-26','06:00:00'),(153,57,'2025-12-27','08:00:00'),(154,58,'2025-12-28','06:00:00'),(155,59,'2025-12-29','08:00:00'),(156,60,'2025-12-30','06:00:00'),(157,61,'2025-12-31','08:00:00'),(158,62,'2026-01-01','06:00:00'),(159,63,'2026-01-02','08:00:00'),(160,64,'2026-01-03','06:00:00'),(161,65,'2026-01-04','08:00:00'),(162,66,'2026-01-05','06:00:00'),(163,67,'2026-01-06','08:00:00'),(164,68,'2026-01-07','06:00:00'),(165,69,'2026-01-08','08:00:00'),(166,70,'2026-01-09','06:00:00'),(167,71,'2026-01-10','08:00:00'),(168,72,'2026-01-11','06:00:00'),(169,73,'2026-01-12','08:00:00'),(170,74,'2026-01-13','06:00:00'),(171,75,'2026-01-14','08:00:00'),(172,76,'2026-01-15','06:00:00'),(173,77,'2026-01-16','08:00:00'),(174,78,'2026-01-17','06:00:00'),(175,79,'2026-01-18','08:00:00'),(176,80,'2026-01-19','06:00:00'),(177,81,'2026-01-20','08:00:00'),(178,82,'2026-01-21','06:00:00'),(179,83,'2026-01-22','08:00:00'),(180,84,'2026-01-23','06:00:00'),(181,85,'2026-01-24','08:00:00'),(182,86,'2026-01-25','06:00:00'),(183,87,'2026-01-26','08:00:00'),(184,88,'2026-01-27','06:00:00'),(185,89,'2026-01-28','08:00:00'),(186,90,'2026-01-29','06:00:00'),(187,91,'2026-01-30','08:00:00'),(188,92,'2026-01-31','06:00:00'),(189,93,'2026-02-01','08:00:00'),(190,94,'2026-02-02','06:00:00'),(191,95,'2026-02-03','08:00:00'),(192,96,'2026-02-04','06:00:00'),(193,97,'2026-02-05','08:00:00');
/*!40000 ALTER TABLE `horas_trabajadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legajo`
--

DROP TABLE IF EXISTS `legajo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `legajo` (
  `codigo_legajo` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codigo_legajo`),
  KEY `id_empleado` (`id_empleado`),
  CONSTRAINT `legajo_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=578 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legajo`
--

LOCK TABLES `legajo` WRITE;
/*!40000 ALTER TABLE `legajo` DISABLE KEYS */;
INSERT INTO `legajo` VALUES (483,95,'Ingreso sin observaciones'),(484,96,'Transferido desde otro establecimiento'),(485,97,'Reincorporado tras licencia'),(486,98,'Cambio de puesto en 2023'),(487,99,'Sin observaciones'),(488,100,'Historial limpio'),(489,101,'Licencia médica en 2024'),(490,102,'Ascendido en 2025'),(491,103,'Sin observaciones'),(492,104,'Cambio de turno en 2022'),(493,105,'Ingreso sin observaciones'),(494,106,'Transferido desde otro establecimiento'),(495,107,'Reincorporado tras licencia'),(496,108,'Cambio de puesto en 2023'),(497,109,'Sin observaciones'),(498,110,'Historial limpio'),(499,111,'Licencia médica en 2024'),(500,112,'Ascendido en 2025'),(501,113,'Sin observaciones'),(502,114,'Cambio de turno en 2022'),(503,115,'Ingreso sin observaciones'),(504,116,'Transferido desde otro establecimiento'),(505,117,'Reincorporado tras licencia'),(506,118,'Cambio de puesto en 2023'),(507,119,'Sin observaciones'),(508,120,'Historial limpio'),(509,121,'Licencia médica en 2024'),(510,122,'Ascendido en 2025'),(511,123,'Sin observaciones'),(512,124,'Cambio de turno en 2022'),(513,125,'Ingreso sin observaciones'),(514,126,'Transferido desde otro establecimiento'),(515,127,'Reincorporado tras licencia'),(516,128,'Cambio de puesto en 2023'),(517,129,'Sin observaciones'),(518,130,'Historial limpio'),(519,131,'Licencia médica en 2024'),(520,132,'Ascendido en 2025'),(521,133,'Sin observaciones'),(522,134,'Cambio de turno en 2022'),(523,135,'Ingreso sin observaciones'),(524,136,'Transferido desde otro establecimiento'),(525,137,'Reincorporado tras licencia'),(526,138,'Cambio de puesto en 2023'),(527,139,'Sin observaciones'),(528,140,'Historial limpio'),(529,141,'Licencia médica en 2024'),(530,142,'Ascendido en 2025'),(531,143,'Sin observaciones'),(532,144,'Cambio de turno en 2022'),(533,145,'Ingreso sin observaciones'),(534,146,'Transferido desde otro establecimiento'),(535,147,'Reincorporado tras licencia'),(536,148,'Cambio de puesto en 2023'),(537,149,'Sin observaciones'),(538,150,'Historial limpio'),(539,151,'Licencia médica en 2024'),(540,152,'Ascendido en 2025'),(541,153,'Sin observaciones'),(542,154,'Cambio de turno en 2022'),(543,155,'Ingreso sin observaciones'),(544,156,'Transferido desde otro establecimiento'),(545,157,'Reincorporado tras licencia'),(546,158,'Cambio de puesto en 2023'),(547,159,'Sin observaciones'),(548,160,'Historial limpio'),(549,161,'Licencia médica en 2024'),(550,162,'Ascendido en 2025'),(551,163,'Sin observaciones'),(552,164,'Cambio de turno en 2022'),(553,165,'Ingreso sin observaciones'),(554,166,'Transferido desde otro establecimiento'),(555,167,'Reincorporado tras licencia'),(556,168,'Cambio de puesto en 2023'),(557,169,'Sin observaciones'),(558,170,'Historial limpio'),(559,171,'Licencia médica en 2024'),(560,172,'Ascendido en 2025'),(561,173,'Sin observaciones'),(562,174,'Cambio de turno en 2022'),(563,175,'Ingreso sin observaciones'),(564,176,'Transferido desde otro establecimiento'),(565,177,'Reincorporado tras licencia'),(566,178,'Cambio de puesto en 2023'),(567,179,'Sin observaciones'),(568,180,'Historial limpio'),(569,181,'Licencia médica en 2024'),(570,182,'Ascendido en 2025'),(571,183,'Sin observaciones'),(572,184,'Cambio de turno en 2022'),(573,185,'Ingreso sin observaciones'),(574,186,'Transferido desde otro establecimiento'),(575,187,'Reincorporado tras licencia'),(576,188,'Cambio de puesto en 2023'),(577,189,'Sin observaciones');
/*!40000 ALTER TABLE `legajo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liquidacion`
--

DROP TABLE IF EXISTS `liquidacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liquidacion` (
  `id_liquidacion` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `mes` int DEFAULT NULL,
  `año` int NOT NULL,
  `total_horas` int NOT NULL,
  `total_cobrar` decimal(10,2) DEFAULT NULL,
  `id_monto_jornal` int DEFAULT NULL,
  PRIMARY KEY (`id_liquidacion`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_monto_jornal` (`id_monto_jornal`),
  CONSTRAINT `liquidacion_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `liquidacion_ibfk_2` FOREIGN KEY (`id_monto_jornal`) REFERENCES `monto_jornal` (`id_monto_jornal`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liquidacion`
--

LOCK TABLES `liquidacion` WRITE;
/*!40000 ALTER TABLE `liquidacion` DISABLE KEYS */;
INSERT INTO `liquidacion` VALUES (1,95,1,2025,160,136000.00,6),(2,96,1,2025,140,119000.00,6),(3,97,1,2025,120,102000.00,6),(4,98,1,2025,100,85000.00,6),(5,99,1,2025,80,68000.00,6),(6,100,2,2025,160,136000.00,6),(7,101,2,2025,140,119000.00,6),(8,102,2,2025,120,102000.00,6),(9,103,2,2025,100,85000.00,6),(10,104,2,2025,80,68000.00,6),(11,105,3,2025,160,136000.00,6),(12,106,3,2025,140,119000.00,6),(13,107,3,2025,120,102000.00,6),(14,108,3,2025,100,85000.00,6),(15,109,3,2025,80,68000.00,6),(16,110,4,2025,160,136000.00,6),(17,111,4,2025,140,119000.00,6),(18,112,4,2025,120,102000.00,6),(19,113,4,2025,100,85000.00,6),(20,114,4,2025,80,68000.00,6),(21,115,5,2025,160,136000.00,6),(22,116,5,2025,140,119000.00,6),(23,117,5,2025,120,102000.00,6),(24,118,5,2025,100,85000.00,6),(25,119,5,2025,80,68000.00,6),(26,120,6,2025,160,136000.00,6),(27,121,6,2025,140,119000.00,6),(28,122,6,2025,120,102000.00,6),(29,123,6,2025,100,85000.00,6),(30,124,6,2025,80,68000.00,6),(31,125,7,2025,160,136000.00,6),(32,126,7,2025,140,119000.00,6),(33,127,7,2025,120,102000.00,6),(34,128,7,2025,100,85000.00,6),(35,129,7,2025,80,68000.00,6),(36,130,8,2025,160,136000.00,6),(37,131,8,2025,140,119000.00,6),(38,132,8,2025,120,102000.00,6),(39,133,8,2025,100,85000.00,6),(40,134,8,2025,80,68000.00,6),(41,135,9,2025,160,136000.00,6),(42,136,9,2025,140,119000.00,6),(43,137,9,2025,120,102000.00,6),(44,138,9,2025,100,85000.00,6),(45,139,9,2025,80,68000.00,6),(46,140,10,2025,160,136000.00,6),(47,141,10,2025,140,119000.00,6),(48,142,10,2025,120,102000.00,6),(49,143,10,2025,100,85000.00,6),(50,144,10,2025,80,68000.00,6),(51,145,11,2025,160,136000.00,6),(52,146,11,2025,140,119000.00,6),(53,147,11,2025,120,102000.00,6),(54,148,11,2025,100,85000.00,6),(55,149,11,2025,80,68000.00,6),(56,150,12,2025,160,136000.00,6),(57,151,12,2025,140,119000.00,6),(58,152,12,2025,120,102000.00,6),(59,153,12,2025,100,85000.00,6),(60,154,12,2025,80,68000.00,6),(61,155,1,2024,160,128000.00,5),(62,156,1,2024,140,112000.00,5),(63,157,1,2024,120,96000.00,5),(64,158,1,2024,100,80000.00,5),(65,159,1,2024,80,64000.00,5),(66,160,2,2024,160,128000.00,5),(67,161,2,2024,140,112000.00,5),(68,162,2,2024,120,96000.00,5),(69,163,2,2024,100,80000.00,5),(70,164,2,2024,80,64000.00,5),(71,165,3,2024,160,128000.00,5),(72,166,3,2024,140,112000.00,5),(73,167,3,2024,120,96000.00,5),(74,168,3,2024,100,80000.00,5),(75,169,3,2024,80,64000.00,5),(76,170,4,2024,160,128000.00,5),(77,171,4,2024,140,112000.00,5),(78,172,4,2024,120,96000.00,5),(79,173,4,2024,100,80000.00,5),(80,174,4,2024,80,64000.00,5),(81,175,5,2024,160,128000.00,5),(82,176,5,2024,140,112000.00,5),(83,177,5,2024,120,96000.00,5),(84,178,5,2024,100,80000.00,5),(85,179,5,2024,80,64000.00,5),(86,180,6,2024,160,128000.00,5),(87,181,6,2024,140,112000.00,5),(88,182,6,2024,120,96000.00,5),(89,183,6,2024,100,80000.00,5),(90,184,6,2024,80,64000.00,5),(91,185,7,2024,160,128000.00,5),(92,186,7,2024,140,112000.00,5),(93,187,7,2024,120,96000.00,5),(94,188,7,2024,100,80000.00,5),(95,189,7,2024,80,64000.00,5);
/*!40000 ALTER TABLE `liquidacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lote` (
  `id_lote` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `id_campo` int NOT NULL,
  `superficie` varchar(50) NOT NULL,
  `id_estado_lote` int NOT NULL,
  `observacion` text,
  PRIMARY KEY (`id_lote`),
  KEY `id_estado_lote` (`id_estado_lote`),
  KEY `id_campo` (`id_campo`),
  CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`id_campo`) REFERENCES `campo` (`id_campo`),
  CONSTRAINT `lote_ibfk_2` FOREIGN KEY (`id_estado_lote`) REFERENCES `estado_lote` (`id_estado_lote`),
  CONSTRAINT `lote_ibfk_3` FOREIGN KEY (`id_campo`) REFERENCES `campo` (`id_campo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` VALUES (1,'Lote A1',1,'25 ha',1,'Zona de siembra directa'),(2,'Lote A2',1,'30 ha',2,'Preparación de suelo en curso'),(3,'Lote B1',2,'20 ha',1,'Listo para cosecha'),(4,'Lote B2',2,'18 ha',3,'Reservado para ensayo'),(5,'Lote C1',3,'22 ha',4,'Historial de plagas, monitoreo activo'),(6,'Lote C2',3,'28 ha',1,'Buen drenaje, sin observaciones'),(7,'Lote D1',4,'35 ha',5,'Rechazado por exceso de maleza'),(8,'Lote D2',4,'40 ha',2,'Aplicación de fertilizante programada'),(9,'Lote E1',5,'50 ha',1,'Área principal de producción'),(10,'Lote E2',5,'45 ha',6,'Finalizado, en descanso rotativo');
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquinaria`
--

DROP TABLE IF EXISTS `maquinaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquinaria` (
  `id_maquina` int NOT NULL AUTO_INCREMENT,
  `id_marca` int NOT NULL,
  `id_modelo` int NOT NULL,
  `año_fabricacion` int DEFAULT NULL,
  `id_estado` int NOT NULL,
  `id_lote` int NOT NULL,
  PRIMARY KEY (`id_maquina`),
  KEY `id_estado` (`id_estado`),
  KEY `id_marca` (`id_marca`),
  KEY `id_modelo` (`id_modelo`),
  KEY `id_lote` (`id_lote`),
  CONSTRAINT `maquinaria_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estado_maquina` (`id_estado`),
  CONSTRAINT `maquinaria_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  CONSTRAINT `maquinaria_ibfk_3` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`),
  CONSTRAINT `maquinaria_ibfk_4` FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id_lote`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquinaria`
--

LOCK TABLES `maquinaria` WRITE;
/*!40000 ALTER TABLE `maquinaria` DISABLE KEYS */;
INSERT INTO `maquinaria` VALUES (81,1,1,2018,1,1),(82,2,2,2020,2,2),(83,3,3,2017,1,3),(84,4,4,2019,3,4),(85,5,5,2015,4,5),(86,1,1,2022,1,6),(87,2,2,2016,2,7),(88,3,3,2014,3,8),(89,4,4,2023,1,9),(90,5,5,2025,2,10),(91,14,91,2022,1,6),(92,15,92,2023,1,6),(93,16,93,2020,3,4),(94,17,94,2021,1,4),(95,18,95,2022,1,8),(96,19,96,2023,1,8),(97,3,97,2021,2,9),(98,1,98,2020,1,9),(99,4,99,2022,1,5),(100,2,100,2023,1,5);
/*!40000 ALTER TABLE `maquinaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'John Deere'),(2,'Case IH'),(3,'New Holland'),(4,'Massey Ferguson'),(5,'Claas'),(6,'Valtra'),(7,'Kubota'),(8,'Agco Allis'),(9,'Pauny'),(10,'Metalfor'),(11,'Pla'),(12,'Jacto'),(13,'Tanzi'),(14,'Apache'),(15,'Crucianelli'),(16,'Mainero'),(17,'Ombú'),(18,'Richiger'),(19,'Yomel'),(20,'Agrometal'),(21,'Bertini'),(22,'Gherardi'),(23,'Indecar'),(24,'Fertec'),(25,'Baldan'),(26,'Stara'),(27,'GTS do Brasil'),(28,'Solis'),(29,'Deutz-Fahr'),(30,'Fendt'),(31,'Trimble'),(32,'Topcon'),(33,'DJI'),(34,'Autel Robotics'),(35,'Parrot'),(36,'Ag Leader'),(37,'Raven Industries'),(38,'FarmTRX'),(39,'Climate FieldView'),(40,'Agrosmart'),(41,'Solinftec'),(42,'AgriTask'),(43,'Auravant'),(44,'SIMA'),(45,'AgTech'),(46,'Agrobit'),(47,'Bosch'),(48,'Siemens'),(49,'Honeywell'),(50,'Delaval'),(51,'Gallignani'),(52,'Repuestos Fama'),(53,'Industrias Victor Juri'),(54,'Industrias Montecor'),(55,'Industrias RYCSA'),(56,'Industrias Cestari'),(57,'Industrias Búfalo'),(58,'Industrias Releyco'),(59,'Industrias Maizco'),(60,'Industrias Fontana'),(61,'Industrias Víctor Juri'),(62,'Industrias Montecor'),(63,'Industrias Cestari'),(64,'Industrias Búfalo'),(65,'Industrias Releyco'),(66,'Industrias Maizco'),(67,'Industrias Fontana'),(68,'Industrias Giorgi'),(69,'Industrias Ascanelli'),(70,'Industrias Akron'),(71,'Industrias Bernardin'),(72,'Industrias Praba'),(73,'Industrias Richiger'),(74,'Industrias Ombú'),(75,'Industrias Yomel'),(76,'Industrias Allochis'),(77,'Industrias Dolbi'),(78,'Industrias Erca'),(79,'Industrias Super Walter'),(80,'Industrias TBeH'),(81,'Industrias Búfalo SA'),(82,'Industrias Gherardi'),(83,'Industrias Bertotto Boglione'),(84,'Industrias Metalúrgica VHB'),(85,'Industrias Agromec'),(86,'Industrias Agrometal'),(87,'Industrias Bertini'),(88,'Industrias Tanzi'),(89,'Industrias Crucianelli'),(90,'Industrias Apache'),(91,'Industrias Fertec'),(92,'Industrias Indecar'),(93,'Industrias Pla'),(94,'Industrias Metalfor'),(95,'Industrias Jacto'),(96,'Industrias Stara'),(97,'Industrias Baldan'),(98,'Industrias GTS do Brasil'),(99,'Industrias Solis'),(100,'Industrias AgriAr');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `id_modelo` int NOT NULL AUTO_INCREMENT,
  `id_marca` int NOT NULL,
  `id_tipo_maquina` int NOT NULL,
  `nombre_modelo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_modelo`),
  KEY `id_marca` (`id_marca`),
  KEY `id_tipo_maquina` (`id_tipo_maquina`),
  CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`),
  CONSTRAINT `modelo_ibfk_2` FOREIGN KEY (`id_tipo_maquina`) REFERENCES `tipo_maquina` (`id_tipo_maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,1,1,'6110B'),(2,2,2,'Austoft 4000'),(3,3,1,'T7.270'),(4,4,1,'MF 4292'),(5,5,1,'Axion 870'),(6,6,1,'BH 180'),(7,7,1,'M135GX'),(8,9,1,'TDN 105'),(9,10,3,'M1500'),(10,11,3,'MAP II 3000'),(11,12,3,'Uniport 3030'),(12,13,4,'Air Drill 600'),(13,14,4,'MS 4000'),(14,15,4,'Gringa 3.0'),(15,16,7,'MDD-100'),(16,17,7,'Tandem 12'),(17,18,7,'R950'),(18,19,7,'MX 150'),(19,3,2,'TX Mega'),(20,1,2,'S660'),(21,4,1,'MF 6713'),(22,3,1,'T5.110'),(23,5,1,'Axion 960'),(24,6,1,'BH 194'),(25,7,1,'M7-172'),(26,9,1,'TDN 95'),(27,10,3,'M2000'),(28,11,3,'MAP III 3500'),(29,12,3,'Uniport 4530'),(30,13,4,'Air Drill 800'),(31,14,4,'MS 6000'),(32,15,4,'Gringa 4.0'),(33,16,7,'MDD-200'),(34,17,7,'Tandem 14'),(35,18,7,'R1050'),(36,19,7,'MX 180'),(37,3,2,'TX 68'),(38,1,2,'S770'),(39,4,2,'MF 9895'),(40,2,2,'Axial-Flow 7150'),(41,4,1,'MF 4707'),(42,3,1,'T6.145'),(43,5,1,'Axion 850'),(44,6,1,'BH 210'),(45,7,1,'M5-111'),(46,9,1,'TDN 110'),(47,10,3,'M3000'),(48,11,3,'MAP IV 4000'),(49,12,3,'Uniport 5030'),(50,13,4,'Air Drill 1000'),(51,14,4,'MS 8000'),(52,15,4,'Gringa 5.0'),(53,16,7,'MDD-300'),(54,17,7,'Tandem 16'),(55,18,7,'R1150'),(56,19,7,'MX 200'),(57,3,2,'TX 70'),(58,1,2,'S780'),(59,4,2,'MF 9895X'),(60,2,2,'Axial-Flow 7250'),(61,4,1,'MF 5711'),(62,3,1,'T6.180'),(63,5,1,'Axion 870 TerraTrac'),(64,6,1,'BH 250'),(65,7,1,'M8-211'),(66,9,1,'TDN 120'),(67,10,3,'M4000'),(68,11,3,'MAP V 4500'),(69,12,3,'Uniport 6030'),(70,13,4,'Air Drill 1200'),(71,14,4,'MS 9000'),(72,15,4,'Gringa 6.0'),(73,16,7,'MDD-400'),(74,17,7,'Tandem 18'),(75,18,7,'R1250'),(76,19,7,'MX 220'),(77,3,2,'TX 80'),(78,1,2,'S790'),(79,4,2,'MF 9895 Pro'),(80,2,2,'Axial-Flow 8250'),(81,4,1,'MF 6715'),(82,3,1,'T7.210'),(83,5,1,'Axion 950'),(84,6,1,'BH 265'),(85,7,1,'M9-221'),(86,9,1,'TDN 130'),(87,10,3,'M5000'),(88,11,3,'MAP VI 5000'),(89,12,3,'Uniport 7030'),(90,13,4,'Air Drill 1400'),(91,14,4,'MS 10000'),(92,15,4,'Gringa 7.0'),(93,16,7,'MDD-500'),(94,17,7,'Tandem 20'),(95,18,7,'R1350'),(96,19,7,'MX 240'),(97,3,2,'TX 90'),(98,1,2,'S790 Plus'),(99,4,2,'MF 9895 Elite'),(100,2,2,'Axial-Flow 9250');
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monto_jornal`
--

DROP TABLE IF EXISTS `monto_jornal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monto_jornal` (
  `id_monto_jornal` int NOT NULL AUTO_INCREMENT,
  `horas_jornal` int NOT NULL,
  `monto_jornal` decimal(10,2) DEFAULT NULL,
  `fecha_vigente` date NOT NULL,
  PRIMARY KEY (`id_monto_jornal`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monto_jornal`
--

LOCK TABLES `monto_jornal` WRITE;
/*!40000 ALTER TABLE `monto_jornal` DISABLE KEYS */;
INSERT INTO `monto_jornal` VALUES (1,8,8500.00,'2023-01-01'),(2,8,9200.00,'2023-06-01'),(3,8,9800.00,'2023-12-01'),(4,8,10200.00,'2024-03-01'),(5,8,10800.00,'2024-07-01'),(6,8,11500.00,'2025-01-01'),(7,6,7200.00,'2023-01-01'),(8,6,7800.00,'2023-06-01'),(9,6,8400.00,'2023-12-01'),(10,6,8900.00,'2024-03-01'),(11,6,9500.00,'2024-07-01'),(12,6,10200.00,'2025-01-01');
/*!40000 ALTER TABLE `monto_jornal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametros_liquidacion`
--

DROP TABLE IF EXISTS `parametros_liquidacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parametros_liquidacion` (
  `id_parametro` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_parametro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametros_liquidacion`
--

LOCK TABLES `parametros_liquidacion` WRITE;
/*!40000 ALTER TABLE `parametros_liquidacion` DISABLE KEYS */;
INSERT INTO `parametros_liquidacion` VALUES (1,'asignacion_hijos','monto por hijo'),(2,'aporte_jubilacion','Descuento obligatorio por jubilación'),(3,'sindicato','Descuento por afiliación sindical'),(4,'aporte_obra_social','Descuento por obra social');
/*!40000 ALTER TABLE `parametros_liquidacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `id_provincia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Buenos Aires'),(2,'Catamarca'),(3,'Chaco'),(4,'Chubut'),(5,'Córdoba'),(6,'Corrientes'),(7,'Entre Ríos'),(8,'Formosa'),(9,'Jujuy'),(10,'La Pampa'),(11,'La Rioja'),(12,'Mendoza'),(13,'Misiones'),(14,'Neuquén'),(15,'Río Negro'),(16,'Salta'),(17,'San Juan'),(18,'San Luis'),(19,'Santa Cruz'),(20,'Santa Fe'),(21,'Santiago del Estero'),(22,'Tierra del Fuego'),(23,'Tucumán'),(24,'Ciudad Autónoma de Buenos Aires');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puesto` (
  `id_puesto` int NOT NULL AUTO_INCREMENT,
  `nombre_puesto` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `id_categoria` int DEFAULT NULL,
  PRIMARY KEY (`id_puesto`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
INSERT INTO `puesto` VALUES (1,'Cortador de caña','Realiza el corte manual de caña en los lotes asignados.',1),(2,'Peón de limpieza de surcos','Limpia manualmente los surcos para facilitar el riego y la cosecha.',1),(3,'Peón de riego','Asiste en la apertura y cierre de compuertas y distribución de agua.',1),(4,'Peón de fertilización','Colabora en la aplicación de fertilizantes sólidos o líquidos.',1),(5,'Peón de desmalezado','Elimina malezas de forma manual o con herramientas.',1),(6,'Aplicador de agroquímicos','Aplica productos fitosanitarios siguiendo protocolos de seguridad.',2),(7,'Peón de monitoreo de plagas','Recorre lotes para detectar presencia de insectos o enfermedades.',2),(8,'Peón de monitoreo de humedad','Controla niveles de humedad en suelo y cultivo.',2),(9,'Peón de señalización de lotes','Coloca estacas y carteles para identificar zonas de trabajo.',2),(10,'Peón de control de malezas','Realiza control manual o químico de malezas.',2),(11,'Maquinista de tractor','Opera tractores en tareas de preparación, siembra y traslado.',3),(12,'Maquinista de cosechadora','Conduce cosechadoras de caña durante la zafra.',3),(13,'Maquinista de pulverizadora','Maneja equipos de aplicación de agroquímicos.',3),(14,'Maquinista de sembradora','Opera sembradoras en campañas agrícolas.',3),(15,'Maquinista de fertilizadora','Aplica fertilizantes con maquinaria especializada.',3),(16,'Capataz de campo','Supervisa cuadrillas y reporta avances al encargado de campo.',4),(17,'Capataz de maquinaria','Coordina operadores y uso de maquinaria.',4),(18,'Capataz de riego','Organiza turnos y tareas de riego.',4),(19,'Capataz de fertilización','Supervisa aplicación de fertilizantes.',4),(20,'Capataz de agroquímicos','Controla tareas de aplicación y seguridad.',4),(21,'Encargado de lote','Coordina actividades en un lote específico y supervisa al personal.',5),(22,'Encargado de maquinaria','Gestiona el uso y mantenimiento de maquinaria agrícola.',5),(23,'Encargado de riego','Administra el sistema de riego y turnos de agua.',5),(24,'Encargado de fertilización','Planifica y supervisa la fertilización de los lotes.',5),(25,'Encargado de agroquímicos','Controla stock y aplicación de productos químicos.',5),(26,'Encargado de almacén','Gestiona insumos, herramientas y repuestos.',5),(27,'Encargado de seguridad rural','Vigila cumplimiento de normas de seguridad en campo.',5),(28,'Encargado de logística','Coordina transporte, horarios y distribución de tareas.',5),(29,'Encargado de mantenimiento','Organiza reparaciones y revisiones de equipos.',5),(30,'Encargado de calidad','Verifica estándares de producción y cosecha.',5),(31,'Técnico en riego por surcos','Optimiza el uso de agua en riego tradicional.',6),(32,'Técnico en riego por aspersión','Diseña y controla sistemas de aspersión.',6),(33,'Técnico en riego automatizado','Programa y monitorea riego con sensores.',6),(34,'Técnico en riego de emergencia','Actúa ante fallas o sequías.',6),(35,'Técnico en riego de precisión','Integra datos climáticos y sensores para eficiencia hídrica.',6),(36,'Técnico en riego por gravedad','Calcula pendientes y caudales para riego tradicional.',6),(37,'Técnico en riego por microaspersión','Aplica técnicas de bajo caudal en cultivos sensibles.',6),(38,'Técnico en riego por pivote','Opera sistemas mecanizados de riego circular.',6),(39,'Técnico en riego por cañón','Controla equipos móviles de riego a presión.',6),(40,'Técnico en fertilización de base','Planifica fertilización al momento de la siembra.',7),(41,'Técnico en fertilización nitrogenada','Controla aplicaciones de nitrógeno.',7),(42,'Técnico en fertilización potásica','Evalúa necesidades de potasio en el cultivo.',7),(43,'Técnico en fertilización fosfatada','Aplica fósforo según análisis de suelo.',7),(44,'Técnico en fertilización orgánica','Gestiona compost y abonos naturales.',7),(45,'Técnico en fertilización líquida','Opera equipos de aplicación líquida.',7),(46,'Técnico en fertilización sólida','Controla distribución de fertilizantes granulados.',7),(47,'Técnico en fertilización localizada','Aplica nutrientes en zonas específicas.',7),(48,'Técnico en fertilización variable','Usa mapas de prescripción para dosificación.',7),(49,'Técnico en control de malezas','Diseña estrategias para reducir competencia vegetal.',8),(50,'Técnico en control de plagas','Monitorea insectos y define umbrales de acción.',8),(51,'Técnico en control de enfermedades','Detecta síntomas y propone tratamientos para enfermedades del cultivo.',8),(52,'Técnico en monitoreo de cultivos','Realiza seguimiento del desarrollo fenológico de la caña.',8),(53,'Técnico en muestreo de suelos','Extrae muestras para análisis físico-químico.',8),(54,'Técnico en calidad de cosecha','Evalúa madurez y condiciones de la caña cortada.',8),(55,'Técnico en sensores agrícolas','Instala y calibra sensores de humedad, temperatura y nutrientes.',8),(56,'Técnico en trazabilidad','Registra y controla el origen y destino de la producción.',8),(57,'Chofer de tractor','Transporta caña, insumos o herramientas dentro del campo.',9),(58,'Chofer de camión cañero','Traslada caña desde el lote hasta el ingenio.',9),(59,'Chofer de cisterna','Transporta agua para riego o limpieza.',9),(60,'Chofer de pulverizadora autopropulsada','Conduce equipos de aplicación de agroquímicos.',9),(61,'Chofer de maquinaria pesada','Opera vehículos de gran porte en tareas rurales.',9),(62,'Auxiliar de campo','Apoya en tareas generales y asistencia a técnicos y capataces.',10),(63,'Auxiliar de logística','Colabora en la organización de insumos y movimientos de personal.',10),(64,'Auxiliar de mantenimiento','Asiste en reparaciones y limpieza de equipos.',10),(65,'Auxiliar de riego','Ayuda en la distribución y control del agua en los lotes.',10),(66,'Auxiliar de fertilización','Prepara mezclas y colabora en la aplicación de fertilizantes.',10),(67,'Auxiliar de agroquímicos','Organiza productos y ayuda en tareas de aplicación.',10),(68,'Auxiliar de calidad','Registra datos y colabora en controles de producción.',10),(69,'Auxiliar de almacén','Ordena herramientas, insumos y repuestos.',10),(70,'Auxiliar de señalización','Coloca estacas, cintas y carteles en los lotes.',10),(71,'Auxiliar de monitoreo','Recorre lotes y registra observaciones básicas.',10),(72,'Auxiliar de cosecha','Apoya en tareas de corte, carga y limpieza.',10),(73,'Auxiliar de siembra','Colabora en la preparación y ejecución de la siembra.',10),(74,'Auxiliar de preparación de terreno','Ayuda en tareas previas a la siembra o fertilización.',10),(75,'Auxiliar de seguridad rural','Controla el uso de elementos de protección y normas básicas.',10),(76,'Auxiliar de sensores','Colabora en la instalación y revisión de sensores agrícolas.',10),(77,'Auxiliar de software agrícola','Carga datos y asiste en el uso de sistemas de gestión rural.',10),(78,'Auxiliar de trazabilidad','Registra movimientos de caña y tareas realizadas en cada lote.',10),(79,'Auxiliar de control de calidad','Apoya en la verificación de parámetros de producción.',10),(80,'Auxiliar de seguridad e higiene','Controla el uso de elementos de protección personal.',10),(81,'Auxiliar de medio ambiente','Colabora en tareas de reciclaje y control de residuos.',10),(82,'Auxiliar de energía','Asiste en el mantenimiento de paneles solares y generadores.',10),(83,'Auxiliar de agua','Ayuda en el control de cisternas y distribución de agua.',10),(84,'Auxiliar de residuos','Clasifica y gestiona residuos generados en campo.',10),(85,'Auxiliar de compostaje','Colabora en la producción y manejo de compost.',10),(86,'Auxiliar de biogás','Asiste en el control de biodigestores y sistemas de gas rural.',10),(87,'Auxiliar de mantenimiento eléctrico','Apoya en reparaciones de instalaciones eléctricas rurales.',10),(88,'Auxiliar de mantenimiento hidráulico','Colabora en tareas de reparación de sistemas hidráulicos.',10),(89,'Auxiliar de mantenimiento mecánico','Asiste en ajustes y lubricación de maquinaria.',10),(90,'Auxiliar de mantenimiento electrónico','Ayuda en la revisión de componentes electrónicos.',10),(91,'Auxiliar de mantenimiento neumático','Colabora en el control de presión y válvulas de aire.',10),(92,'Auxiliar de mantenimiento estructural','Apoya en reparaciones de galpones y estructuras rurales.',10),(93,'Auxiliar de mantenimiento de herramientas','Organiza y mantiene herramientas manuales y eléctricas.',10),(94,'Auxiliar de mantenimiento de vehículos','Asiste en la revisión de tractores, camiones y acoplados.',10),(95,'Auxiliar de mantenimiento de riego','Colabora en la limpieza y reparación de sistemas de riego.',10),(96,'Auxiliar de mantenimiento de fertilización','Ayuda en la calibración y limpieza de equipos de fertilización.',10),(97,'Auxiliar de mantenimiento de agroquímicos','Limpia mochilas, pulverizadoras y controla derrames.',10),(98,'Auxiliar de mantenimiento de sensores','Verifica funcionamiento y calibración de sensores agrícolas.',10),(99,'Auxiliar de mantenimiento de software','Actualiza sistemas y colabora en la carga de datos.',10),(100,'Auxiliar de mantenimiento de trazabilidad','Registra tareas y movimientos en sistemas digitales.',10);
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_jornada`
--

DROP TABLE IF EXISTS `registro_jornada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_jornada` (
  `id_jornada` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int NOT NULL,
  `fecha` date NOT NULL,
  `horas_trabajadas` int NOT NULL,
  `id_tarea` int NOT NULL,
  `id_lote` int NOT NULL,
  `id_maquina` int NOT NULL,
  PRIMARY KEY (`id_jornada`),
  KEY `id_empleado` (`id_empleado`),
  KEY `id_tarea` (`id_tarea`),
  KEY `id_lote` (`id_lote`),
  KEY `id_maquina` (`id_maquina`),
  CONSTRAINT `registro_jornada_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `registro_jornada_ibfk_2` FOREIGN KEY (`id_tarea`) REFERENCES `tarea` (`id_tarea`),
  CONSTRAINT `registro_jornada_ibfk_3` FOREIGN KEY (`id_lote`) REFERENCES `lote` (`id_lote`),
  CONSTRAINT `registro_jornada_ibfk_4` FOREIGN KEY (`id_maquina`) REFERENCES `maquinaria` (`id_maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_jornada`
--

LOCK TABLES `registro_jornada` WRITE;
/*!40000 ALTER TABLE `registro_jornada` DISABLE KEYS */;
INSERT INTO `registro_jornada` VALUES (1,95,'2025-11-01',8,1,1,81),(2,96,'2025-11-02',6,2,2,82),(3,97,'2025-11-03',8,3,3,83),(4,98,'2025-11-04',6,4,4,84),(5,99,'2025-11-05',8,5,5,85),(6,100,'2025-11-06',6,6,6,86),(7,101,'2025-11-07',8,7,7,87),(8,102,'2025-11-08',6,8,8,88),(9,103,'2025-11-09',8,9,9,89),(10,104,'2025-11-10',6,10,10,90),(11,105,'2025-11-11',8,1,1,91),(12,106,'2025-11-12',6,2,2,92),(13,107,'2025-11-13',8,3,3,93),(14,108,'2025-11-14',6,4,4,94),(15,109,'2025-11-15',8,5,5,95),(16,110,'2025-11-16',6,6,6,96),(17,111,'2025-11-17',8,7,7,97),(18,112,'2025-11-18',6,8,8,98),(19,113,'2025-11-19',8,9,9,99),(20,114,'2025-11-20',6,10,10,100),(21,144,'2025-12-01',6,4,4,84),(22,145,'2025-12-02',8,5,5,85),(23,146,'2025-12-03',6,6,6,86),(24,147,'2025-12-04',8,7,7,87),(25,148,'2025-12-05',6,8,8,88),(26,149,'2025-12-06',8,9,9,89),(27,150,'2025-12-07',6,10,10,90),(28,151,'2025-12-08',8,1,1,91),(29,152,'2025-12-09',6,2,2,92),(30,153,'2025-12-10',8,3,3,93),(31,154,'2025-12-11',6,4,4,94),(32,155,'2025-12-12',8,5,5,95),(33,156,'2025-12-13',6,6,6,96),(34,157,'2025-12-14',8,7,7,97),(35,158,'2025-12-15',6,8,8,98),(36,159,'2025-12-16',8,9,9,99),(37,160,'2025-12-17',6,10,10,100),(38,161,'2025-12-18',8,1,1,81),(39,162,'2025-12-19',6,2,2,82),(40,163,'2025-12-20',8,3,3,83),(41,164,'2025-12-21',6,4,4,84),(42,165,'2025-12-22',8,5,5,85),(43,166,'2025-12-23',6,6,6,86),(44,167,'2025-12-24',8,7,7,87),(45,168,'2025-12-25',6,8,8,88),(46,169,'2025-12-26',8,9,9,89),(47,170,'2025-12-27',6,10,10,90),(48,171,'2025-12-28',8,1,1,91),(49,172,'2025-12-29',6,2,2,92),(50,173,'2025-12-30',8,3,3,93),(51,174,'2025-12-31',6,4,4,94),(52,175,'2026-01-01',8,5,5,95),(53,176,'2026-01-02',6,6,6,96),(54,177,'2026-01-03',8,7,7,97),(55,178,'2026-01-04',6,8,8,98),(56,179,'2026-01-05',8,9,9,99),(57,180,'2026-01-06',6,10,10,100),(58,181,'2026-01-07',8,1,1,81),(59,182,'2026-01-08',6,2,2,82),(60,183,'2026-01-09',8,3,3,83),(61,184,'2026-01-10',6,4,4,84),(62,185,'2026-01-03',8,5,5,85),(63,186,'2026-01-04',6,6,6,86),(64,187,'2026-01-05',8,7,7,87),(65,188,'2026-01-06',6,8,8,88),(66,189,'2026-01-07',8,9,9,89);
/*!40000 ALTER TABLE `registro_jornada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexo` (
  `id_sexo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino'),(2,'Femenino'),(3,'No binario'),(4,'Prefiere no decirlo');
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea`
--

DROP TABLE IF EXISTS `tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarea` (
  `id_tarea` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_tarea`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea`
--

LOCK TABLES `tarea` WRITE;
/*!40000 ALTER TABLE `tarea` DISABLE KEYS */;
INSERT INTO `tarea` VALUES (1,'Corte de caña','Corte manual o mecanizado de caña madura en el lote.'),(2,'Carga de caña','Traslado de caña cortada al camión o tolva.'),(3,'Aplicación de fertilizante','Distribución de fertilizantes sólidos o líquidos en el lote.'),(4,'Aplicación de herbicida','Pulverización para control de malezas.'),(5,'Aplicación de insecticida','Tratamiento para control de plagas.'),(6,'Aplicación de fungicida','Prevención o control de enfermedades fúngicas.'),(7,'Riego por surcos','Distribución de agua por gravedad en los surcos del lote.'),(8,'Riego por goteo','Riego localizado mediante emisores en línea.'),(9,'Desmalezado manual','Eliminación de malezas con herramientas o a mano.'),(10,'Monitoreo de plagas','Relevamiento visual de insectos y daños en el cultivo.'),(11,'Monitoreo de enfermedades','Detección de síntomas fúngicos o bacterianos.'),(12,'Muestreo de suelo','Extracción de muestras para análisis físico-químico.'),(13,'Muestreo de caña','Toma de muestras para análisis de madurez y calidad.'),(14,'Marcación de surcos','Trazado de líneas para siembra o riego.'),(15,'Preparación de terreno','Labranza, nivelación y acondicionamiento del lote.'),(16,'Siembra de caña','Plantación de caña semilla en surcos preparados.'),(17,'Recolección de residuos','Limpieza de restos vegetales o plásticos del lote.'),(18,'Limpieza de canales','Desobstrucción de canales de riego o drenaje.'),(19,'Mantenimiento de maquinaria','Revisión y reparación de equipos agrícolas.'),(20,'Carga de agroquímicos','Preparación de mochilas o tanques con productos químicos.'),(21,'Siembra de caña semilla','Plantación de caña en surcos preparados para renovación de lotes.'),(22,'Nivelación de terreno','Ajuste de pendientes para facilitar riego y evitar erosión.'),(23,'Recolección de muestras foliares','Extracción de hojas para análisis nutricional.'),(24,'Calibración de maquinaria','Ajuste de equipos para aplicación precisa de insumos.'),(25,'Revisión de elementos de protección','Control del estado de cascos, guantes y ropa de seguridad.'),(26,'Control de malezas mecánico','Uso de maquinaria para eliminar vegetación no deseada.'),(27,'Control de malezas térmico','Aplicación de calor para eliminar malezas sin químicos.'),(28,'Control de plagas biológico','Liberación de enemigos naturales para reducir poblaciones de plagas.'),(29,'Control de enfermedades preventivo','Aplicación de productos antes de la aparición de síntomas.'),(30,'Control de enfermedades curativo','Tratamiento de plantas ya afectadas por patógenos.'),(31,'Revisión de sensores de humedad','Verificación de funcionamiento y calibración de sensores en campo.'),(32,'Revisión de estaciones meteorológicas','Control de datos climáticos y mantenimiento de equipos.'),(33,'Carga de mochilas de aplicación','Preparación de mochilas con productos químicos o fertilizantes.'),(34,'Limpieza de mochilas de aplicación','Lavado y revisión de equipos luego de su uso.'),(35,'Revisión de pulverizadoras','Chequeo de boquillas, presión y tanque antes de aplicar.'),(36,'Revisión de sembradoras','Control de dosificación y profundidad de siembra.'),(37,'Revisión de fertilizadoras','Verificación de distribución y calibración de equipos.'),(38,'Revisión de tractores','Chequeo de aceite, filtros, neumáticos y funcionamiento general.'),(39,'Revisión de cosechadoras','Control de cuchillas, tolvas y sistemas hidráulicos.'),(40,'Revisión de tolvas y acoplados','Chequeo de estructura, ruedas y sistemas de carga.'),(41,'Revisión de cisternas','Control de estanqueidad y válvulas de distribución.'),(42,'Revisión de motoguadañas','Afilado de cuchillas y verificación de motor.'),(43,'Revisión de herramientas manuales','Chequeo de palas, machetes, azadas y otras herramientas.'),(44,'Revisión de elementos eléctricos','Control de cables, enchufes y baterías en campo.'),(45,'Revisión de elementos hidráulicos','Chequeo de mangueras, bombas y válvulas.'),(46,'Revisión de elementos neumáticos','Verificación de presión y funcionamiento de válvulas de aire.'),(47,'Revisión de software agrícola','Actualización y carga de datos en sistemas de gestión rural.'),(48,'Revisión de sistemas de trazabilidad','Control de registros de tareas, lotes y movimientos.'),(49,'Capacitación en seguridad rural','Charlas y entrenamientos sobre normas de seguridad en campo.'),(50,'Capacitación técnica operativa','Entrenamiento en uso de maquinaria y aplicación de insumos.'),(51,'Carga de fertilizantes','Preparación de fertilizantes sólidos o líquidos para su aplicación.'),(52,'Carga de semillas','Colocación de caña semilla o semillas en sembradoras.'),(53,'Carga de combustible','Abastecimiento de tractores, cosechadoras y otros vehículos.'),(54,'Carga de agua','Llenado de tanques para riego o aplicación de agroquímicos.'),(55,'Limpieza de herramientas','Lavado y desinfección de herramientas de campo.'),(56,'Limpieza de maquinaria','Remoción de residuos y barro de tractores y cosechadoras.'),(57,'Limpieza de galpones','Barrido y orden de espacios de almacenamiento rural.'),(58,'Limpieza de vehículos','Lavado de camiones, camionetas y remolques.'),(59,'Revisión de neumáticos','Control de presión y estado de cubiertas.'),(60,'Revisión de frenos','Chequeo de frenos en tractores y camiones.'),(61,'Revisión de luces','Verificación de faros y señales en vehículos rurales.'),(62,'Revisión de niveles de aceite','Chequeo de motor, hidráulico y transmisión.'),(63,'Revisión de filtros','Cambio o limpieza de filtros de aire, combustible y aceite.'),(64,'Revisión de correas','Inspección de tensión y desgaste en correas de transmisión.'),(65,'Revisión de cuchillas','Afilado y reemplazo de cuchillas de corte.'),(66,'Revisión de cadenas','Lubricación y ajuste de cadenas de transmisión.'),(67,'Revisión de ejes y rodamientos','Chequeo de juego y lubricación de partes móviles.'),(68,'Revisión de sistemas hidráulicos','Detección de fugas y control de presión.'),(69,'Revisión de sistemas eléctricos','Chequeo de cableado, fusibles y conexiones.'),(70,'Revisión de sistemas electrónicos','Diagnóstico de sensores y módulos de control.'),(71,'Revisión de sistemas de riego','Chequeo de válvulas, cañerías y emisores.'),(72,'Revisión de bombas de agua','Control de presión, caudal y funcionamiento.'),(73,'Revisión de válvulas de riego','Ajuste y limpieza de válvulas manuales o automáticas.'),(74,'Revisión de aspersores','Chequeo de cobertura y presión de aspersión.'),(75,'Revisión de goteros','Control de caudal y obstrucciones en riego por goteo.'),(76,'Revisión de filtros de riego','Limpieza y reemplazo de filtros de arena o malla.'),(77,'Revisión de estaciones meteorológicas','Verificación de sensores y calibración de datos climáticos.'),(78,'Revisión de GPS agrícola','Chequeo de señal y precisión de geolocalización.'),(79,'Revisión de drones','Inspección de hélices, baterías y cámaras.'),(80,'Revisión de software de monitoreo','Actualización y validación de datos en sistemas digitales.'),(81,'Carga de datos de campo','Ingreso de tareas, rendimientos y observaciones en sistemas.'),(82,'Carga de datos de maquinaria','Registro de horas de uso, mantenimiento y fallas.'),(83,'Carga de datos de riego','Registro de turnos, caudales y duración de riegos.'),(84,'Carga de datos de fertilización','Registro de dosis, fechas y productos aplicados.'),(85,'Carga de datos de agroquímicos','Registro de productos, dosis y lotes tratados.'),(86,'Carga de datos de cosecha','Registro de toneladas, humedad y calidad de caña.'),(87,'Carga de datos de siembra','Registro de fechas, variedades y densidad de plantación.'),(88,'Capacitación en uso de maquinaria','Entrenamiento en operación segura y eficiente de equipos.'),(89,'Capacitación en aplicación de agroquímicos','Formación en dosis, seguridad y técnicas de aplicación.'),(90,'Capacitación en riego eficiente','Buenas prácticas para optimizar el uso del agua.'),(91,'Capacitación en fertilización','Formación en tipos de fertilizantes y momentos de aplicación.'),(92,'Capacitación en seguridad e higiene','Charlas sobre prevención de accidentes y uso de EPP.'),(93,'Capacitación en trazabilidad','Entrenamiento en registro y seguimiento de tareas y lotes.'),(94,'Capacitación en software agrícola','Uso de plataformas digitales para gestión de campo.'),(95,'Capacitación en mantenimiento preventivo','Buenas prácticas para prolongar la vida útil de equipos.'),(96,'Capacitación en monitoreo de cultivos','Identificación de síntomas y toma de decisiones.'),(97,'Capacitación en primeros auxilios rurales','Atención básica ante accidentes en el campo.'),(98,'Capacitación en control biológico','Uso de enemigos naturales para manejo de plagas.'),(99,'Capacitación en compostaje','Producción y uso de abonos orgánicos en el lote.'),(100,'Capacitación en gestión ambiental','Buenas prácticas para reducir impacto ambiental en el campo.');
/*!40000 ALTER TABLE `tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_agroquimico`
--

DROP TABLE IF EXISTS `tipo_agroquimico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_agroquimico` (
  `id_tipo_agroquimico` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_agroquimico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_agroquimico`
--

LOCK TABLES `tipo_agroquimico` WRITE;
/*!40000 ALTER TABLE `tipo_agroquimico` DISABLE KEYS */;
INSERT INTO `tipo_agroquimico` VALUES (1,'Herbicida'),(2,'Insecticida'),(3,'Fungicida'),(4,'Acaricida'),(5,'Nematicida'),(6,'Rodenticida'),(7,'Fertilizante'),(8,'Fitorregulador'),(9,'Coadyuvante'),(10,'Desecante');
/*!40000 ALTER TABLE `tipo_agroquimico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documento`
--

LOCK TABLES `tipo_documento` WRITE;
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
INSERT INTO `tipo_documento` VALUES (1,'DNI'),(2,'Pasaporte'),(3,'Libreta Cívica'),(4,'Libreta de Enrolamiento'),(5,'CUIL'),(6,'CUIT'),(7,'CI Extranjera'),(8,'Residencia Precaria'),(9,'Documento Nacional Extranjero');
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_maquina`
--

DROP TABLE IF EXISTS `tipo_maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_maquina` (
  `id_tipo_maquina` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_tipo_maquina`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_maquina`
--

LOCK TABLES `tipo_maquina` WRITE;
/*!40000 ALTER TABLE `tipo_maquina` DISABLE KEYS */;
INSERT INTO `tipo_maquina` VALUES (1,'Tractor'),(2,'Sembradora'),(3,'Pulverizadora'),(4,'Cosechadora'),(5,'Camión'),(6,'Fertilizadora'),(7,'Rastra'),(8,'Tolva autodescargable'),(9,'Pala cargadora'),(10,'Excavadora'),(11,'Cinta transportadora'),(12,'Niveladora'),(13,'Enfardadora'),(14,'Desmalezadora'),(15,'Carro tanque');
/*!40000 ALTER TABLE `tipo_maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_medida` (
  `id_unidad_medida` int NOT NULL AUTO_INCREMENT,
  `unidad` varchar(20) NOT NULL,
  PRIMARY KEY (`id_unidad_medida`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` VALUES (1,'L'),(2,'mL'),(3,'kg'),(4,'g'),(5,'t'),(6,'u'),(7,'bol'),(8,'m3'),(9,'ha'),(10,'ml');
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valor_parametro_liquidacion`
--

DROP TABLE IF EXISTS `valor_parametro_liquidacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valor_parametro_liquidacion` (
  `id_valor` int NOT NULL AUTO_INCREMENT,
  `id_parametro` int NOT NULL,
  `fecha_vigente` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_valor`),
  KEY `id_parametro` (`id_parametro`),
  CONSTRAINT `valor_parametro_liquidacion_ibfk_1` FOREIGN KEY (`id_parametro`) REFERENCES `parametros_liquidacion` (`id_parametro`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valor_parametro_liquidacion`
--

LOCK TABLES `valor_parametro_liquidacion` WRITE;
/*!40000 ALTER TABLE `valor_parametro_liquidacion` DISABLE KEYS */;
INSERT INTO `valor_parametro_liquidacion` VALUES (1,1,'2025-01-01',15000.00),(2,2,'2025-01-01',0.11),(3,3,'2025-01-01',0.02),(4,4,'2025-01-01',0.03);
/*!40000 ALTER TABLE `valor_parametro_liquidacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-19  3:20:08
