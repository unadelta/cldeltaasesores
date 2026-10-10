-- MySQL dump 10.16  Distrib 10.1.36-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: asesores
-- ------------------------------------------------------
-- Server version	10.1.36-MariaDB

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
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alumno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci DEFAULT NULL,
  `codigo_carrera` int(11) DEFAULT NULL,
  `descripcion_carrera` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'V-06823400','UBAN LEGNY TERESA',280,'Ingeniería Industrial'),(2,'V-08952715','MEDRANO BELLORIN JULIAN JOSE',508,'Licenciatura en Educación mención Educación Matemática'),(3,'V-11206309','ABREU MENDOZA ELADIO JESUS',610,'Licenciatura en Administración - Mención Empresas Comerciales'),(4,'V-13401660','CALDERON QUIVAS REINALDO RAMON',610,'Licenciatura en Administración - Mención Empresas '),(5,'V-13744140','VALDEZ LUIS ALBERTO',280,'INGENIERIA INDUSTRIAL'),(6,'V-15200799','TRUJILLO SANDRA PATRICIA',542,'Licenciatura en Educación mención Preescolar'),(7,'V-15336186','MENDOZA ROJAS DARVIN JAIRO',613,'Licenciatura en Administración de Empresas mención Riesgos y Seguros'),(8,'V-16221653','PARRA PEREIRA JOSE MIGUEL',612,'Licenciatura en Administración - Mención Recursos Humanos'),(9,'V-16613709','VILLANUEVA RASSE ADRIANA DEL VALLE',521,'Licenciatura en Educación mención Dificultades de Aprendizaje'),(10,'V-16699180','GIOVETTI YPLANDA MARGARITA',612,'Licenciatura en Administración - Mención Recursos Humanos'),(11,'V-17525966','VALDES MORALES MIRAIDA DEL VALLE',237,'T.S.U. Mantenimiento de Sistemas Informáticos'),(12,'V-17999287','MORALES DIAZ ELYSBETH DEL CARMEN',280,'INGENIERIA INDUSTRIAL'),(13,'V-18387899','MARTINEZ ROXDELIS ELENIZA',610,'Licenciatura en Administración - Mención Empresas '),(14,'V-18657250','SOILER GONZALEZ JOSE ALBERTO',610,'LICENCIATURA EN ADMINISTRACION - MENCION-EMPRESAS'),(15,'V-18914541','OLIVERO DE RODRIGUEZ YERAKLDINE',440,'EDUCACION INTEGRAL'),(16,'V-19139534','MEZA SARAGOZA LEONEL ENRIQUE',280,'INGENIERIA INDUSTRIAL'),(17,'V-19140953','CEQUEA FRANCO MARYOLI DE LAS',612,'Licenciatura en Administración - Mención Recursos Humanos'),(18,'V-19403195','MENDOZA MARCANO FRANCIS JHOALY',521,'Licenciatura en Educación mención Dificultades de Aprendizaje'),(19,'V-20853756','GARCIA BRAZON ITNER DAVID',236,'T.S.U. Mantenimiento de Sistemas Informáticos'),(20,'V-21198540','BELLORIN TORRES VIVIANA YUBEL',542,NULL),(21,'V-23725487','VILLAREAL QUINTERO MONICA MARIA',542,'Licenciatura en Educación mención Preescolar'),(22,'V-24119980','RODRIGUEZ CASCON ALONSO ISAAC',440,'Educación Integral'),(23,'V-25124024','MATA GONZALEZ RASAIDYS ANDREIN',440,'EDUCACION INTEGRAL'),(24,'V-25355886','LOZADA BRITO JOSE GREGORIO',280,'INGENIERIA INDUSTRIAL'),(25,'V-27801520','NAVARRO NAVARRO NARVAEZ EDUARDO ALFONZO',280,'INGENIERIA INDUSTRIAL'),(26,'V-28018752','MOTA MORENO HECTOR ANDROS',440,'EDUCACION INTEGRAL'),(27,'V-28349996','GONZALEZ VEGAS STE4FANY DE LOS',612,'Licenciatura en Administración - Mención Recursos Humanos'),(28,'V-28603527','PAZ JIMENEZ RONALDY NAZARETH',440,'EDUCACION INTEGRAL'),(29,'V-28657207','RIVAS MARCANO YOSLER PASCUAL',440,'EDUCACION INTEGRAL'),(30,'V-28724143','VERAS GONZALEZ LUIS CARLOS',236,'T.S.U. Mantenimiento de Sistemas Informáticos'),(31,'V-28761985','REINA PALOMO ISMELIBETH ELBA',610,'LICENCIATURA EN ADMINISTRACION - MENCION-EMPRESAS'),(32,'V-28766928','RIVERO CUENCE KATERIN DEL VALLE',236,'Ingeniería de Sistemas'),(33,'V-30656477','PINTO HERNANDEZ OMAILYN ITHIEL',280,'INGENIERIA INDUSTRIAL'),(34,'V-31105291','FERNIN TOLEDO DANIEL JOSUE',236,'Ingeniería de Sistemas'),(35,'V-31559376','MARQUEZ HERRERA CECILIA GABRIEL',280,'INGENIERIA INDUSTRIAL'),(36,'V-32273433','SANDOVAL ASTUDILLO YULIANNYS A',440,'EDUCACION INTEGRAL'),(37,'V-33145659','CARABALLO MARTINEZ MARIA ISABEL',612,'Licenciatura en Administración - Mención Recursos Humanos'),(38,'V-33357628','PARRA BRICEÑO BRANDOS JONAS',236,'T.S.U. Mantenimiento de Sistemas Informáticos'),(39,'V-33818735','RODRIGUEZ ROJAS DANIELLYS VALENTINA',613,'Licenciatura en Administración de Empresas mención Riesgos y Seguros'),(40,'V-34196919','MENDOZA LOCHAMANCIN LEIDISMAR',612,'Licenciatura en Administración - Mención Recursos Humanos'),(41,'V-6823400','UBAN LEGNY TERESA',280,'Ingeniería Industrial');
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asesor`
--

DROP TABLE IF EXISTS `asesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asesor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `rol_id` int(11) NOT NULL,
  PRIMARY KEY (`cedula`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `usuario` (`usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_asesor_rol` (`rol_id`),
  CONSTRAINT `fk_asesor_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesor`
--

LOCK TABLES `asesor` WRITE;
/*!40000 ALTER TABLE `asesor` DISABLE KEYS */;
INSERT INTO `asesor` VALUES (2,'13403217','Yorbeydis Dicuru','yor','123456','y.dsarabia@gmail.com',2),(5,'1423569','Yovinza Salazar','ysalazar','123456','ysalazar@gmail.com',1),(6,'31541259','LEONARDO NOA','nnoa','123456','leonardonoa803@gmail.com',1),(1,'9858269','Ing. Matías Sarabia C.','msarabia','123456','jsarabia22@gmail.com',1);
/*!40000 ALTER TABLE `asesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asesor_carrera`
--

DROP TABLE IF EXISTS `asesor_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asesor_carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asesor_cedula` varchar(30) NOT NULL,
  `carrera` varchar(100) NOT NULL,
  `asignatura` varchar(50) NOT NULL,
  `cantidad_alumno` int(11) DEFAULT '0',
  `semestre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asesor_carrera`
--

LOCK TABLES `asesor_carrera` WRITE;
/*!40000 ALTER TABLE `asesor_carrera` DISABLE KEYS */;
INSERT INTO `asesor_carrera` VALUES (1,'9858269','236','107',10,'2026-2'),(2,'9858269','236','327',15,'2026-2'),(3,'9858269','236','116',72,'2026-2');
/*!40000 ALTER TABLE `asesor_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion_107`
--

DROP TABLE IF EXISTS `calificacion_107`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calificacion_107` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion_107`
--

LOCK TABLES `calificacion_107` WRITE;
/*!40000 ALTER TABLE `calificacion_107` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion_107` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion_116`
--

DROP TABLE IF EXISTS `calificacion_116`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calificacion_116` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_alumno` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_alumno` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_asesor` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `semestre` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion_116`
--

LOCK TABLES `calificacion_116` WRITE;
/*!40000 ALTER TABLE `calificacion_116` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion_116` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion_300`
--

DROP TABLE IF EXISTS `calificacion_300`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calificacion_300` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_alumno` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_alumno` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_asesor` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `semestre` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion_300`
--

LOCK TABLES `calificacion_300` WRITE;
/*!40000 ALTER TABLE `calificacion_300` DISABLE KEYS */;
INSERT INTO `calificacion_300` VALUES (2,'RIVERO CUENCE KATERIN DEL VALLE','V-28766928','9858269',1.00,0.00,1.00,0.00,1.00,1.00,6.00,'Seis','2026-2'),(3,'UBAN LEGNY TERESA','V-6823400','9858269',1.00,1.00,1.00,1.00,1.00,0.00,8.00,'Ocho','2026-2'),(10,'ABREU MENDOZA ELADIO JESUS','V-11206309','9858269',1.00,0.00,1.00,0.00,1.00,1.00,6.00,'Seis','2026-2'),(14,'GIOVETTI YPLANDA MARGARITA','V-16699180','9858269',0.00,0.00,1.00,1.00,1.00,1.00,6.00,'Seis','2026-2');
/*!40000 ALTER TABLE `calificacion_300` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion_315`
--

DROP TABLE IF EXISTS `calificacion_315`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calificacion_315` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_alumno` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_alumno` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_asesor` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `obj7` decimal(5,2) DEFAULT '0.00',
  `obj8` decimal(5,2) DEFAULT '0.00',
  `obj9` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `semestre` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion_315`
--

LOCK TABLES `calificacion_315` WRITE;
/*!40000 ALTER TABLE `calificacion_315` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion_315` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion_323`
--

DROP TABLE IF EXISTS `calificacion_323`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calificacion_323` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_alumno` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_alumno` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_asesor` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) COLLATE utf8_spanish_ci DEFAULT '',
  `semestre` varchar(50) COLLATE utf8_spanish_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion_323`
--

LOCK TABLES `calificacion_323` WRITE;
/*!40000 ALTER TABLE `calificacion_323` DISABLE KEYS */;
INSERT INTO `calificacion_323` VALUES (2,'RIVERO CUENCE KATERIN DEL VALLE','V-28766928','9858269',1.00,1.00,1.00,1.00,0.00,1.00,6.00,'Seis','2026-2'),(4,'CALDERON QUIVAS REINALDO RAMON','V-13401660','9858269',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','2026-2'),(5,'MARTINEZ ROXDELIS ELENIZA','V-18387899','9858269',1.00,1.00,1.00,1.00,0.00,1.00,6.00,'Seis','2026-2'),(6,'FERNIN TOLEDO DANIEL JOSUE','V-31105291','9858269',0.00,1.00,1.00,1.00,1.00,1.00,8.00,'Ocho','2026-2'),(9,'MEDRANO BELLORIN JULIAN JOSE','V-08952715','9858269',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','2026-2'),(12,'PARRA PEREIRA JOSE MIGUEL','V-16221653','9858269',1.00,1.00,1.00,1.00,0.00,1.00,6.00,'Seis','2026-2'),(13,'VILLANUEVA RASSE ADRIANA DEL VALLE','V-16613709','9858269',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','2026-2'),(14,'GIOVETTI YPLANDA MARGARITA','V-16699180','9858269',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','2026-2'),(15,'CEQUEA FRANCO MARYOLI DE LAS','V-19140953','9858269',0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','2026-2');
/*!40000 ALTER TABLE `calificacion_323` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion_327`
--

DROP TABLE IF EXISTS `calificacion_327`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calificacion_327` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `obj7` decimal(5,2) DEFAULT '0.00',
  `obj8` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion_327`
--

LOCK TABLES `calificacion_327` WRITE;
/*!40000 ALTER TABLE `calificacion_327` DISABLE KEYS */;
INSERT INTO `calificacion_327` VALUES (15,'CEQUEA FRANCO MARYOLI DE LAS','V-19140953','9858269',0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,0.00,'','2026-2');
/*!40000 ALTER TABLE `calificacion_327` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion_371`
--

DROP TABLE IF EXISTS `calificacion_371`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calificacion_371` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `obj7` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion_371`
--

LOCK TABLES `calificacion_371` WRITE;
/*!40000 ALTER TABLE `calificacion_371` DISABLE KEYS */;
INSERT INTO `calificacion_371` VALUES (2,'RIVERO CUENCE KATERIN DEL VALLE','V-28766928','9858269',1.00,1.00,1.00,1.00,0.00,1.00,1.00,6.00,'Seis','2026-2');
/*!40000 ALTER TABLE `calificacion_371` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificacion_612`
--

DROP TABLE IF EXISTS `calificacion_612`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calificacion_612` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `obj7` decimal(5,2) DEFAULT '0.00',
  `obj8` decimal(5,2) DEFAULT '0.00',
  `obj9` decimal(5,2) DEFAULT '0.00',
  `obj10` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion_612`
--

LOCK TABLES `calificacion_612` WRITE;
/*!40000 ALTER TABLE `calificacion_612` DISABLE KEYS */;
/*!40000 ALTER TABLE `calificacion_612` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calificaciones`
--

DROP TABLE IF EXISTS `calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_materia` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `peso_acumulado` int(11) DEFAULT NULL,
  `calificacion_definitiva` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calificaciones_ibfk_1` (`cod_materia`),
  CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificaciones`
--

LOCK TABLES `calificaciones` WRITE;
/*!40000 ALTER TABLE `calificaciones` DISABLE KEYS */;
INSERT INTO `calificaciones` VALUES (6,'116',6,1),(7,'116',7,2),(8,'116',8,4),(9,'116',10,8),(10,'116',11,10),(17,'300',1,2),(18,'300',2,3),(19,'300',3,5),(20,'300',4,6),(21,'300',5,8),(22,'300',6,10),(23,'315',8,1),(24,'315',9,2),(25,'315',10,3),(26,'315',11,12),(27,'315',12,5),(28,'315',13,6),(29,'315',14,7),(30,'315',15,8),(31,'315',16,9),(32,'315',17,10),(43,'323',19,2),(44,'323',21,2),(45,'323',22,3),(46,'323',24,4),(47,'323',25,5),(48,'323',26,6),(49,'323',28,7),(50,'323',29,8),(51,'323',31,9),(52,'323',32,10),(70,'327',6,1),(71,'327',7,2),(72,'327',8,3),(73,'327',9,4),(74,'327',10,5),(75,'327',11,6),(76,'327',12,7),(77,'327',13,8),(78,'327',15,10),(79,'371',7,1),(80,'371',8,2),(81,'371',9,3),(82,'371',10,4),(83,'371',11,5),(84,'371',12,6),(85,'371',13,7),(86,'371',14,8),(87,'371',15,9),(88,'371',16,10),(89,'612',4,1),(90,'612',5,2),(91,'612',6,3),(92,'612',7,4),(93,'612',8,5),(94,'612',9,6),(95,'612',10,7),(96,'612',11,8),(97,'612',12,9),(98,'612',13,10),(99,'107',1,1),(100,'107',2,1),(101,'107',3,6),(102,'107',4,7),(103,'107',5,10);
/*!40000 ALTER TABLE `calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_carrera` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'106','Licenciatura en Educación - Mención Dificultades del Aprendizaje'),(2,'107','Licenciatura en Educación - Mención Preescolar'),(3,'108','Licenciatura en Educación - Mención Matemática'),(4,'111','Licenciatura en Educación - Mención Integral'),(6,'280','Ingeniería Industrial'),(7,'340','T.S.U. en Administración de Empresas Comerciales'),(8,'610','Licenciatura en Administración - Mención Empresas Comerciales'),(9,'612','Licenciatura en Administración - Mención Recursos Humanos'),(10,'613','Licenciatura en Administración - Mención Contaduría'),(11,'000','Ciclo Introductorio'),(12,'126','Licenciatura en Matemática'),(13,'236','Ingeniería de Sistemas'),(14,'237','T.S.U. Mantenimiento de Sistemas Informáticos'),(15,'280','Ingeniería Industrial'),(16,'281','T.S.U. Higiene y Seguridad Industrial'),(17,'508','Licenciatura en Educación mención Educación Matemática'),(18,'521','Licenciatura en Educación mención Dificultades de Aprendizaje'),(19,'542','Licenciatura en Educación mención Preescolar'),(20,'610','Licenciatura en Contaduría Pública'),(21,'612','Licenciatura en Administración de Empresas'),(22,'613','Licenciatura en Administración de Empresas mención Riesgos y Seguros'),(23,'430','Técnico Superior Universitario (TSU) en Educación IntegraL'),(24,'440','EDUCACION INTEGRAL'),(25,'116','Introducción a la informática');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_asesoria`
--

DROP TABLE IF EXISTS `control_asesoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_asesoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_alumno` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_alumno` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_carrera` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_asesoria` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_materia` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_asesor` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_asesor` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_hora` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_asesoria`
--

LOCK TABLES `control_asesoria` WRITE;
/*!40000 ALTER TABLE `control_asesoria` DISABLE KEYS */;
INSERT INTO `control_asesoria` VALUES (4,'V-16613709','VILLANUEVA RASSE ADRIANA DEL VALLE','521','VIRTUAL','107','9858269','Ing. Matías Sarabia C.','2026-09-30 20:13:20'),(7,'V-17525966','VALDES MORALES MIRAIDA DEL VALLE','237','VIRTUAL','327','9858269','Ing. Matías Sarabia C.','2026-09-30 22:30:38');
/*!40000 ALTER TABLE `control_asesoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_correcciones`
--

DROP TABLE IF EXISTS `control_correcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_correcciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_alumno` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_alumno` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_carrera` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_materia` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_correccion` enum('TP','TSP','TG') COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula_asesor` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_asesor` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_correcciones`
--

LOCK TABLES `control_correcciones` WRITE;
/*!40000 ALTER TABLE `control_correcciones` DISABLE KEYS */;
INSERT INTO `control_correcciones` VALUES (19,'V-13401660','CALDERON QUIVAS REINALDO RAMON','610','107','TP','9858269','Ing. Matías Sarabia C.','2026-09-30 20:25:06'),(21,'V-18387899','MARTINEZ ROXDELIS ELENIZA','610','107','TP','9858269','Ing. Matías Sarabia C.','2026-09-30 20:26:04'),(22,'V-33357628','PARRA BRICEÑO BRANDOS JONAS','236','116','TP','9858269','Ing. Matías Sarabia C.','2026-09-30 20:26:41');
/*!40000 ALTER TABLE `control_correcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `numobj` int(11) NOT NULL,
  `minaprueba` decimal(5,2) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (10,'107','LOGICA',5,6.00),(1,'116','Introducción a la informática',6,9.00),(4,'300','Fisica',6,4.00),(5,'315','Investigación de operaciones',9,13.00),(6,'323','Computación I',6,26.00),(7,'327','INTRODUCCIÓN A LA INGENIERÍA DE SISTEMAS',5,11.00),(8,'371','TECNOLOGÍA WEB',7,12.00),(9,'612','CONTABILIDAD INTERMEDIA',10,9.00);
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia_una`
--

DROP TABLE IF EXISTS `materia_una`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materia_una` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia_una`
--

LOCK TABLES `materia_una` WRITE;
/*!40000 ALTER TABLE `materia_una` DISABLE KEYS */;
INSERT INTO `materia_una` VALUES (1,'050','EDUCACION INICIAL'),(2,'051','SALUD ALTERACIONES Y PREVENCIÓN EN EDUCACIÓN INI'),(3,'052','DESARROLLO DEL NIÑO DE 0 A 3 AÑOS'),(4,'053','DESARROLLO PSICOMOTOR EN EDUCACION INICIAL'),(5,'054','DESARROLLO COGNOSCITIVO DEL NIÑO DE 4 A 7 AÑOS'),(6,'055','PRÁCTICA I DESARROLLO DEL NIÑO DE 0 A 3 AÑOS'),(7,'056','EVALUACIÓN Y PLANIFICACIÓN EN EDUCACIÓN INICIAL'),(8,'057','DESARROLLO SOCIAL Y EMOCIONAL DEL NIÑO DE 4 A 7 AN'),(9,'058','LA FAMILIA, LA COMUNIDAD Y EL NIÑO EN EDUCACIÓN IN'),(10,'059','PRÁCTICA II DESARROLLO COGNOSCITIVO, SOCIOEMOCI'),(11,'060','CREATIVIDAD EN EDUCACIÓN INICIAL'),(12,'061','PRÁCTICA III EL MAESTRO EN AULA'),(13,'062','EXPRESIÓN Y CULTURA EN EDUCACIÓN INICIAL'),(14,'063','SOLUCIÓN A PROBLEMAS EDUCATIVOS EN EDUCACIÓN IN'),(15,'064','PRACTICA IV PROCESOS ADMINISTRATIVOS EN CENTROS'),(19,'115','LENGUA Y COMUNICACIÓN'),(20,'116','INTRODUCCIÓN A LA INFORMATICA'),(21,'117','AMBIENTE Y DESARROLLO SOSTENIBLE EN VENEZUELA'),(23,'119','TEMAS DE ETICA'),(24,'120','LENGUA Y COMUNICACION EN EDUCACION'),(25,'121','PROBLEMÁTICA DEL DESARROLLO VENEZOLANO'),(26,'122','INTRODUCCIÓN A LA HERMENEUTICA'),(27,'126','INTRODUCCION A LA INVESTIGACION'),(28,'175','MATEMATICA I'),(29,'177','MATEMATICA I'),(30,'179','MATEMATICA II'),(31,'200','INTRODUCCIÓN A LA INGENIERÍA INDUSTRIAL'),(32,'201','SEGURIDAD E HIGIENE INDUSTRIAL'),(33,'202','PROCESOS DE MANUFACTURAS'),(34,'203','CONTROL DE PRODUCCIÓN'),(35,'204','MANEJO DE MATERIALES'),(36,'205','CONTROL DE CALIDAD'),(37,'206','INGENIERIA DE METODOS'),(38,'207','MANTENIMIENTO INDUSTRIAL'),(39,'208','DIBUJO INDUSTRIAL'),(40,'209','QUIMICA'),(41,'216','INGENIERIA DE PLANTA'),(42,'222','ECONOMÍA PARA INGENIEROS'),(43,'223','GERENCIA INDUSTRIAL'),(44,'225','EVALUACION DE PROYECTOS'),(45,'228','INSTRUMENTACIÓN Y CONTROL'),(46,'231','INGENIERIA DE MATERIALES'),(47,'232','MECANICA RACIONAL'),(48,'233','ELECTROTECNIA'),(49,'234','TERMOFLUIDOS'),(50,'235','GERENCIA ORGANIZACIONAL'),(51,'236','LOGISTICA INDUSTRIAL'),(52,'237','PRACTICA PROFESIONAL I'),(53,'238','PRACTICA PROFESIONAL II'),(54,'240','PROCESOS QUÍMICOS'),(55,'241','GESTIÓN DE CALIDAD'),(56,'251','PSICOLOGÍA DEL TRABAJO'),(57,'252','PREVENCIÓN DE RIESGO I'),(58,'255','PREVENCION DE RIESGO II'),(59,'257','PASANTIA'),(60,'258','ERGONOMIA'),(61,'259','LEGISLACION LABORAL'),(62,'300','FISICA GENERAL'),(63,'305','TEORÍA DE DECISIONES'),(64,'306','TEORIA DE SISTEMAS'),(65,'310','OPTIMIZACIÓN NO LINEAL'),(66,'311','BASE DE DATOS'),(67,'312','PROGRAMACIÓN DE SISTEMAS'),(68,'315','INVESTIGACIÓN DE OPERACIONES I'),(69,'316','MICROPROCESADORES'),(70,'321','INVESTIGACIÓN DE OPERACIONES IV'),(71,'323','COMPUTACION I'),(72,'324','COMPUTACION II'),(73,'326','FISICA GENERAL II'),(74,'327','INTRODUCCIÓN A LA INGENIERÍA DE SISTEMAS'),(75,'330','PROCESAMIENTO DE DATOS'),(76,'332','GRAFOS Y MATRICES'),(77,'333','ARQUITECTURA DEL COMPUTADOR'),(78,'334','COMPUTACIÓN GRÁFICA'),(79,'335','SISTEMAS DE INFORMACION I'),(80,'336','SISTEMAS DE INFORMACIÓN II'),(81,'337','SIMULACION DE SISTEMAS'),(82,'338','SISTEMAS DE INFORMACION III'),(83,'339','PRACTICA PROFESIONAL I'),(84,'341','PRACTICA PROFESIONAL II'),(85,'342','REDES DE COMPUTADORAS'),(86,'347','INTRODUCCIÓN A LA INTELIGENCIA ARTIFICIAL Y A LOS '),(87,'348','INVESTIGACION DE OPERACIONES II'),(88,'349','ORGANIZACIÓN Y MÉTODOS'),(89,'358','SISTEMAS OPERATIVOS'),(90,'370','FUNDAMENTOS DEL COMPUTADOR'),(91,'371','TECNOLOGÍA WEB'),(92,'372','MANTENIMIENTO PREVENTIVO Y CORRECTIVO'),(93,'373','MANTENIMIENTO PERFECTIVO Y ADAPTATIVO'),(94,'374','MARCO LEGAL NFORMÁTICO'),(95,'375','PASANTIA'),(96,'405','DESARROLLO DE HABILIDADES COGNOSCITIVAS'),(97,'408','MATEMATICA I'),(98,'410','GEOGRAFIA GENERAL'),(99,'411','DESARROLLO PSICOSOCIAL DEL LENGUAJE'),(100,'412','EDUCACION BASICA'),(101,'414','MATEMATICA II'),(102,'416','GEOGRAFIA DE VENEZUELA'),(103,'420','GEOMETRIA'),(104,'421','PLANIFICACION DE LA INSTRUCCION'),(105,'423','SEM DESARR PERS DISEN PUBLIC PERIODICAS'),(106,'427','TECNICAS Y RECURSOS PARA EL APRENDIZAJE'),(107,'428','HISTORIA UNIVERSAL'),(108,'431','ARTES PLASTICAS'),(109,'433','EVALUACION'),(110,'434','FORMACION CIUDADANA'),(111,'437','MUSICA Y ARTES ESCENICAS'),(112,'440','INTRODUCCION A LA INFORMATICA'),(113,'444','EDUCACION FISICA Y DEPORTES'),(114,'451','SEMINARIO DE INVESTIGACION EDUCATIVA'),(115,'454','ANALISIS GRAMATICAL'),(116,'457','LITERATURA VENEZOLANA I'),(117,'465','PROCESOS CULTURALES DE LA VENEZUELA CONTEMPOR'),(118,'468','NUEVAS FORMAS DE PARTICIPACION CIUDADANA'),(119,'469','HISTORIA Y GEOGRAFIA REGIONAL'),(120,'471','PRACTICA DOCENTE I'),(121,'472','PRACTICA DOCENTE II'),(122,'473','PRACTICA DOCENTE III'),(123,'474','PRACTICA DOCENTE IV'),(124,'475','PRACTICA DOCENTE V'),(125,'476','MATEMATICA'),(126,'477','FUNDAMENTOS DE LA EDUCACIÓN'),(127,'478','LECTOESCRITURA'),(128,'479','ENSEÑANZA DE LA MATEMATICA'),(129,'480','EDUCACION AMBIENTAL'),(130,'481','LITERATURA INFANTIL Y JUVENIL'),(131,'483','PLANIFICACION DE LA ENSENANZA'),(132,'484','GEOGRAFIA GENERAL Y DE VENEZUELA'),(133,'485','CIENCIAS NATURALES I'),(134,'486','EDUCACION ESTETICA'),(135,'487','DIDACTICA PARA EL DOCENTE INTEGRADOR'),(136,'488','HISTORIA DE VENEZUELA'),(137,'489','CIENCIAS NATURALES II'),(138,'490','SEM DESARR PERS COMUNICACION EFICAZ'),(139,'491','ENSEÑANZA DE LA LENGUA'),(140,'492','SEMINARIO PRACTICO FORMACION PARA EL TRABAJO'),(141,'493','EVALUACION'),(142,'494','EDUCACION FISICA Y RECREACION'),(143,'495','PRACTICA DE ACCION DOCENTE'),(144,'497','PRACTICA DE PROMOCION DE CAMBIO'),(145,'498','SEM DESARR PERS LIDERAZG UNA ESTRAT PARA EL CAM'),(146,'516','FUNDAMENTOS DE LA ACCION DOCENTE'),(147,'517','FILOSOFÍA DE LA EDUCACIÓN'),(148,'524','DESARROLLO DEL SISTEMA EDUCATIVO VENEZOLANO'),(149,'530','PLANIFICACIÓN EDUCATIVA'),(150,'532','MATEMÁTICAS Y CIENCIAS'),(151,'534','EVALUACION EDUCATIVA'),(152,'536','GERENCIA EDUCATIVA'),(153,'542','DIDÁCTICA DE LA ARITMÉTICA'),(154,'545','TEORÍA DE LA EDUCACIÓN MATEMÁTICA'),(155,'547','DIDACTICA DEL ALGEBRA Y LA TRIGONOMETRIA'),(156,'551','EVALUACIÓN DE LOS APRENDIZAJES EN MATEMATICA'),(157,'552','DIDÁCTICA DE LA GEOMETRIA'),(158,'559','APRENDIZAJE DE LA LECTURA Y LA ESCRITURA'),(159,'560','DESARROLLO PERSONAL DEL DOCENTE'),(160,'562','DESARROLLO DEL LENGUAJE'),(161,'564','LITERATURA INFANTIL'),(162,'570','DESARROLLO PSICOLÓGICO'),(163,'571','PSICOLOGIA EDUCATIVA'),(164,'575','TÓPICOS DE MATEMATICA'),(165,'576','SOCIOLOGIA DE LA EDUCACIÓN Y DESARROLLO COMUNIT'),(166,'577','DIDÁCTICA DE LA ESTOCÁSTICA'),(167,'578','INVESTIGACIÓN EDUCATIVA'),(168,'579','PRACTICUM I'),(169,'580','PRACTICUM II'),(170,'592','DESARROLLO Y PATOLOGIA DEL LENGUAJE'),(171,'601','INTRODUCCIÓN A LA ADMINISTRACIÓN'),(172,'602','TEORÍA DE LA ORGANIZACIÓN'),(173,'641','TEORIA ECONÓMICA I'),(174,'655','COSTO INDUSTRIAL'),(175,'733','MATEMATICA III'),(176,'735','MATEMATICA IV'),(177,'737','INTRODUCCIÓN A LA PROBABILIDAD'),(178,'738','INFERENCIA ESTADISTICA'),(179,'739','MATEMÁTICA V'),(180,'747','PROBABILIDAD'),(181,'748','ESTADISTICA'),(182,'749','CALCULO Ι'),(183,'750','CÁLCULO II'),(184,'751','CALCULO III'),(185,'752','ALGEBRA I'),(186,'753','ALGEBRA II'),(187,'754','GEOMETRIA'),(188,'755','ECUACIONES DIFERENCIALES'),(189,'756','CALCULO INTEGRAL'),(190,'757','ALGEBRA I'),(191,'758','CALCULO VECTORIAL'),(192,'759','ALGEBRA II'),(193,'760','HISTORIA DE LAS MATEMATICAS'),(194,'761','DIDACTICA DEL CALCULO'),(195,'762','ANALISIS I'),(196,'763','TOPICOS NUMERICOS EN CALCULO Y ALGEBRA'),(197,'764','PROBABILIDAD Y ESTADISTICA I'),(198,'765','DIDACTICA DEL ALGEBRA LINEAL Y LA PROBABILIDAD'),(199,'766','ANALISIS II'),(200,'767','ECUACIONES DIFERENCIALES'),(201,'768','TOPOLOGIA'),(202,'769','PRACTICA DOCENTE'),(203,'770','TÓPICOS DE ANALISIS MATEMATICO'),(204,'771','OPTIMIZACION NO LINEAL'),(205,'772','PROBABILIDAD Y ESTADISTICA II'),(206,'773','MODELOS MATEMATICOS'),(207,'775','SISTEMAS DINAMICOS DISCRETOS'),(208,'776','TOPICOS EN OPTIMIZACION I'),(209,'778','ANALISIS DE DATOS'),(210,'779','PROGRAMACION LINEAL'),(211,'780','TEORIA DE JUEGOS'),(212,'781','INTRODUCCION A LOS ELEMENTOS FINITOS'),(213,'782','ALGEBRA LINEAL NUMERICA'),(214,'783','INTRODUCCION A LOS ESPACIOS DE HILBERT Y SUS OPER'),(215,'810','REDACCION DE INFORMES TECNICOS'),(216,'811','FUNDAMENTOS BASICOS EN LA ELABORACION DE PROYE'),(217,'812','ELABORACION PERIODICA DE PUBLICACIONES ESCOLARE'),(218,'813','LIDERAZGO'),(219,'814','SEMINARIO DE ACCION SOCIAL'),(220,'816','FORMACION DE MICROEMPRESAS'),(221,'011','SERVICIO COMUNITARIO'),(222,'106','PRESENTACION A LA FISICA'),(224,'108','INGLES'),(228,'118','METODOLOGÍA DE LA INVESTIGACIÓN'),(231,'176','MATEMATICA I'),(232,'178','MATEMATICA II'),(234,'300','FISICA GENERAL'),(235,'601','INTRODUCCION A LA ADMINISTRACION'),(236,'602','TEORÍA DE LA ORGANIZACIÓN'),(237,'603','COMPORTAMIENTO ORGANIZACIONAL'),(238,'604','ADMINISTRACION PUBLICA'),(239,'605','SISTEMAS ADMINISTRATIVOS'),(240,'606','SISTEMAS DE INFORMACION'),(241,'607','ADMINISTRACIÓN POR PROYECTO'),(242,'608','CONTROL DE GESTION'),(243,'613','INVESTIGACIÓN ADMINISTRATIVA'),(244,'614','ADMINISTRACION DE RECURSOS HUMANOS'),(245,'615','RIESGOS Y SEGUROS'),(246,'616','REASEGUROS'),(247,'617','CONTABILIDAD INTERMEDIA APLICADA AL SEGURO'),(248,'618','CONTABILIDAD COMPUTARIZADA'),(249,'619','ADMINISTRACIÓN DEL RIESGO I'),(250,'620','FUNDAMENTOS DE INGENIERIA'),(251,'621','QUIMICA'),(252,'625','INFORMATICA GERENCIAL'),(253,'631','FUNDAMENTOS DE CONTABILIDAD'),(254,'632','CONTABILIDAD INTERMEDIA'),(255,'633','CONTABILIDAD SUPERIOR I'),(256,'634','CONTABILIDAD GUBERNAMENTAL'),(257,'636','MODELOS CONTABLES'),(258,'637','CONTABILIDAD DE COSTOS I'),(259,'638','SISTEMAS TRIBUTARIOS'),(260,'639','CONTABILIDAD SUPERIOR II'),(261,'641','TEORIA ECONOMICA I'),(262,'642','TEORIA ECONÓMICA II'),(263,'644','ECONOMIA Y SEGUROS'),(264,'646','TEORIA DEL RIESGO'),(265,'648','ADMINISTRACIÓN DEL RIESGO II'),(266,'649','CONTABILIDAD SUPERIOR III'),(267,'650','CONTABILIDAD DE COSTOS II'),(268,'651','DERECHO MERCANTIL'),(269,'653','DERECHO LABORAL'),(270,'654','DERECHO APLICADO AL SEGURO'),(271,'661','ADMINISTRACIÓN FINANCIERA'),(272,'663','FINANZAS Y PRESUPUESTO PUBLICO'),(273,'665','ANALISIS DE ESTADOS FINANCIEROS I'),(274,'666','ANALISIS DE ESTADOS FINANCIEROS II'),(275,'669','PRESUPUESTO EMPRESARIAL'),(276,'671','MERCADOTECNIA'),(277,'672','INVESTIGACION DE MERCADO'),(278,'673','CONTABILIDAD FISCAL'),(279,'681','PLANIFICACIÓN Y CONTROL DE LA PRODUCCIÓN'),(280,'691','AUDITORIA I'),(281,'692','AUDITORIA II'),(282,'696','PASANTIA (Riesgos y Seguros)'),(283,'697','PASANTIA (Contaduría)'),(284,'699','PASANTIA (Administración)'),(285,'734','MATEMATICA III'),(286,'743','ELEMENTOS ACTUARIALES'),(287,'745','ESTADÍSTICA GENERAL'),(288,'746','ESTADÍSTICA APLICADA'),(289,'810','REDACCION DE INFORMES TECNICOS'),(290,'811','FUNDAMENTOS BASICOS EN LA ELABORACION DE PROYE'),(291,'813','LIDERAZGO'),(292,'814','SEMINARIO DE ACCION SOCIAL'),(293,'816','FORMACION DE MICROEMPRESAS'),(294,'508','EDUCACION MATEMATICA'),(295,'612','CONTABILIDAD INTERMEDIA'),(296,'107','LOGICA');
/*!40000 ALTER TABLE `materia_una` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetivo_materia`
--

DROP TABLE IF EXISTS `objetivo_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objetivo_materia` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `materia_codigo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nro_objetivo` int(11) NOT NULL,
  `peso` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetivo_materia`
--

LOCK TABLES `objetivo_materia` WRITE;
/*!40000 ALTER TABLE `objetivo_materia` DISABLE KEYS */;
INSERT INTO `objetivo_materia` VALUES (37,'116',1,1.00),(38,'116',2,2.00),(39,'116',3,2.00),(40,'116',4,1.00),(41,'116',5,2.00),(42,'116',6,3.00),(55,'300',1,1.00),(56,'300',2,1.00),(57,'300',3,1.00),(58,'300',4,1.00),(59,'300',5,1.00),(60,'300',6,1.00),(61,'315',1,1.00),(62,'315',2,1.00),(63,'315',3,3.00),(64,'315',4,2.00),(65,'315',5,1.00),(66,'315',6,1.00),(67,'315',7,1.00),(68,'315',8,2.00),(69,'315',9,5.00),(76,'323',1,3.00),(77,'323',2,3.00),(78,'323',3,5.00),(79,'323',4,7.00),(80,'323',5,6.00),(81,'323',6,8.00),(95,'327',1,2.00),(96,'327',2,3.00),(97,'327',3,2.00),(98,'327',4,3.00),(99,'327',5,5.00),(100,'371',1,1.00),(101,'371',2,2.00),(102,'371',3,2.00),(103,'371',4,3.00),(104,'371',5,4.00),(105,'371',6,3.00),(106,'371',7,1.00),(107,'612',1,1.00),(108,'612',2,1.00),(109,'612',3,1.00),(110,'612',4,1.00),(111,'612',5,2.00),(112,'612',6,1.00),(113,'612',7,1.00),(114,'612',8,1.00),(115,'612',9,1.00),(116,'612',10,3.00),(117,'107',1,1.00),(118,'107',2,1.00),(119,'107',3,1.00),(120,'107',4,1.00),(121,'107',5,1.00);
/*!40000 ALTER TABLE `objetivo_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (2,'administrador'),(1,'usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea`
--

DROP TABLE IF EXISTS `tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tarea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea`
--

LOCK TABLES `tarea` WRITE;
/*!40000 ALTER TABLE `tarea` DISABLE KEYS */;
INSERT INTO `tarea` VALUES (1,'TP','TRABAJO PRACTICO'),(2,'TSP','TRABAJO SUSTITUTO DE PRUEBA'),(3,'TEG','TRABAJO DE GRADO'),(4,'PROY','PROYECTO');
/*!40000 ALTER TABLE `tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipoasesoria`
--

DROP TABLE IF EXISTS `tipoasesoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipoasesoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_ase` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_asesoria` text COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipoasesoria`
--

LOCK TABLES `tipoasesoria` WRITE;
/*!40000 ALTER TABLE `tipoasesoria` DISABLE KEYS */;
INSERT INTO `tipoasesoria` VALUES (1,'VT','VIRTUAL'),(2,'ELI','EN LINEA'),(3,'EGRU','ENCUENTRO GRUPAL'),(4,'PRE','PRESENCIAL'),(5,'CM','CLASE MAGISTRAL');
/*!40000 ALTER TABLE `tipoasesoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'asesores'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-01 17:51:59
