-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: tutorias
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `materias`
--

DROP TABLE IF EXISTS `materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Materia` varchar(45) NOT NULL,
  `Carrera` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (2,'Fisica','ING'),(3,'Calculo para Ingenieros','ING'),(4,'Calculo para Ingenieros II','ING'),(5,'Mecanica Racional','ING'),(6,'Calculo para Ingenieros III','ING'),(7,'Estadistica y Probabilidad','ECO'),(8,'Inferencia Estadistica','ECO'),(9,'Macroeconomia','ECO'),(10,'Macroeconomia II','ECO'),(11,'Contabilidad','ECO'),(12,'Contabilidad II','ECO'),(13,'Algebra Lineal','ECO'),(14,'Derecho Penal','DER'),(15,'Derecho Penal II','DER'),(16,'Derecho Constitucional','DER'),(17,'Derecho Romano','DER'),(18,'Bienestar Total','ECO'),(20,'Excel VBA','ING'),(26,'Estadistica y Probabilidad','ING'),(27,'Inferencia Estadistica','ECO'),(28,'Inferencia Estadistica','ING'),(29,'Economia internacional','ECO'),(30,'Derecho penal I','DER'),(31,'Procesal penal I','DER'),(32,'Quimica General','ING'),(33,'Computacion I','ECO'),(34,'Computacion II','ECO'),(35,'Programacion I','ING');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitudes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idtutor` int NOT NULL,
  `idalumno` int NOT NULL,
  `Materia` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(45) NOT NULL,
  `Precio` double NOT NULL,
  `Estados` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
INSERT INTO `solicitudes` VALUES (1,1,2,4,'2020-08-12','10:30',10,'Aprobado'),(2,4,6,2,'2020-08-11','10:00',10,'Aprobado'),(3,12,23,9,'2020-08-12','14:30',15,'Aprobado'),(4,20,8,17,'2020-08-13','15:00',12,'Aprobado'),(5,5,23,20,'2020-08-12','15:20',15,'Aprobado'),(6,20,23,17,'2020-08-12','10:45',20,'Aprobado'),(7,12,23,10,'2020-08-11','14:53',14,'Rechazado'),(8,12,23,11,'2020-09-02','23:00',12,'Aprobado'),(9,24,26,6,'2020-08-11','13:32',15,'Aprobado'),(10,27,31,2,'2020-08-27','15:00',12,'Aprobado');
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `solicitudes_AFTER_UPDATE` AFTER UPDATE ON `solicitudes` FOR EACH ROW BEGIN
IF new.Estados = 'Aprobado' then
 INSERT INTO tutorias_tutor(id, idtutor, idmateria, Precio, Fecha, Hora_tutoria)
 VALUES('0', new.idtutor, new.Materia, new.Precio, new.Fecha, new.hora);
 INSERT INTO tutorias_alumnos(id, IdAlumno, idtutoriastutor, Valoracion )
 VALUES('0', new.idalumno, (SELECT max(id) from tutorias.tutorias_tutor),null);
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'admin'),(2,'tutor'),(3,'tutorado');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorias_alumnos`
--

DROP TABLE IF EXISTS `tutorias_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutorias_alumnos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `IdAlumno` int NOT NULL,
  `idtutoriastutor` int NOT NULL,
  `Valoracion` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tutorias_alumnos_usuarios1_idx` (`IdAlumno`),
  KEY `fk_tutorias_alumnos_tutorias_tutor1_idx` (`idtutoriastutor`),
  CONSTRAINT `fk_tutorias_alumnos_usuarios1` FOREIGN KEY (`IdAlumno`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorias_alumnos`
--

LOCK TABLES `tutorias_alumnos` WRITE;
/*!40000 ALTER TABLE `tutorias_alumnos` DISABLE KEYS */;
INSERT INTO `tutorias_alumnos` VALUES (1,6,3,10),(2,7,4,9),(3,8,5,10),(4,9,10,8),(5,23,11,NULL),(10,8,12,NULL),(11,23,15,NULL),(12,23,16,NULL),(20,2,17,NULL),(21,23,18,NULL),(23,23,19,NULL),(24,23,20,NULL),(25,23,21,NULL),(26,23,22,NULL),(27,23,23,10),(28,23,24,9),(29,23,25,10),(30,26,26,9),(31,6,27,NULL),(32,31,28,9);
/*!40000 ALTER TABLE `tutorias_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorias_tutor`
--

DROP TABLE IF EXISTS `tutorias_tutor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tutorias_tutor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idtutor` int NOT NULL,
  `idmateria` int NOT NULL,
  `Precio` double NOT NULL,
  `Fecha` date NOT NULL,
  `Hora_tutoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tutorias_tutor_materias1_idx` (`idmateria`),
  KEY `fk_tutorias_tutor_usuarios1_idx` (`idtutor`),
  CONSTRAINT `fk_tutorias_tutor_materias1` FOREIGN KEY (`idmateria`) REFERENCES `materias` (`id`),
  CONSTRAINT `fk_tutorias_tutor_usuarios1` FOREIGN KEY (`idtutor`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorias_tutor`
--

LOCK TABLES `tutorias_tutor` WRITE;
/*!40000 ALTER TABLE `tutorias_tutor` DISABLE KEYS */;
INSERT INTO `tutorias_tutor` VALUES (1,1,4,10,'0000-00-00','1'),(2,12,11,8,'0000-00-00','1'),(3,11,15,20,'0000-00-00','2'),(4,2,13,8,'0000-00-00','1'),(5,20,17,20,'2020-08-12','10:45'),(10,20,17,12,'2020-08-13','15:00'),(11,5,20,15,'2020-08-12','15:20'),(12,12,9,15,'2020-08-12','14:30'),(16,1,4,10,'2020-08-12','10:30'),(17,12,9,15,'2020-08-12','14:30'),(19,5,20,15,'2020-08-12','15:20'),(20,12,10,14,'2020-08-11','14:53'),(21,12,10,14,'2020-08-11','14:53'),(22,12,10,14,'2020-08-11','14:53'),(23,12,11,12,'2020-09-02','23:00'),(24,12,10,14,'2020-08-11','14:53'),(25,12,10,14,'2020-08-11','14:53'),(26,24,6,15,'2020-08-11','13:32'),(27,4,2,10,'2020-08-11','10:00'),(28,27,2,12,'2020-08-27','15:00');
/*!40000 ALTER TABLE `tutorias_tutor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `carnet` int DEFAULT NULL,
  `usuario` varchar(45) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `Correo` varchar(45) NOT NULL,
  `Carrera` varchar(45) DEFAULT NULL,
  `Anio` int DEFAULT NULL,
  `IdtipoUsuario` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuarios_tipo_usuario1_idx` (`IdtipoUsuario`),
  CONSTRAINT `fk_usuarios_tipo_usuario1` FOREIGN KEY (`IdtipoUsuario`) REFERENCES `tipo_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,20183104,'David123','David','Rivas','david123','david@rivas','ING',3,1),(2,20182202,'Julio123','Julio','Blanco','gordo123','julio@blanco','ING',3,1),(3,20181726,'Adrian123','Adrian','Rodriguez','elena123','adrian@r','ING',3,1),(4,NULL,'Sven123','Sven','Guzman','Sg123','sguzma@esen','ING',NULL,2),(5,NULL,'Balbino123','Balbino','Aylagas','balbino123','balbino@aylagas','ING',NULL,2),(6,20180000,'Albert123','Albert','Einstein','fisica123','albert@ein','ING',2,3),(7,20181234,'John123','John','Keynes','joni123','john@keynes','ECO',3,2),(8,20185678,'Jon123','Jon','Snow','jon123','jon@snow','DER',3,3),(9,20201234,'Daenerys123','Daenerys','Targaryen','dany123','dany@targ','DER',3,3),(10,NULL,'Jose123','Jose','Velasquez','rox123','jmvelasquez@esen','ING',NULL,2),(11,20181499,'Delmer123','Delmer','Rodriguez','delmer123','delmer@esen','DER',NULL,2),(12,NULL,'Ever123','Everardo','Rivera','ever123','ever@esen','ECO',NULL,2),(13,2000,'Walter123','Walter','White','Skyler123','Walter@white','ING',2,2),(20,NULL,'Sofia123','Sofia','Siman','sofia123','sofia@siman','DER',NULL,2),(21,20186023,'Ely123','Ely','Tamayo','ely123','Ely@tamayo','DER',3,2),(22,20152389,'Rebe123','Rebeca','Galdamez','rebe123','rebe@galdamez','DER',5,2),(23,20183490,'Nath123','Nathaly','Rivas','naty123','nathy@rivas','ECO',5,3),(24,NULL,'Elias123','Elias','Ventura','elias123','eventura@esen','ING',NULL,2),(25,NULL,'Vincet123','Vicent','Palasi','palasi123','palasi@palasi','ING',NULL,2),(26,20182960,'Rodrigo123','Rodrigo','Martinez','rodri123','rodri@big','ING',3,3),(27,20180673,'Sheldon123','Sheldon','Cooper','sheldon123','sheldon@cooper.com','ING',3,2),(28,NULL,'Mariela123','Mariela','Paz','MARIELA123','mariela@paz','ECO',NULL,2),(29,20182065,'Caro123','Carolina','Sandoval','caro123','caro@sandoval','ECO',3,2),(30,20193489,'Rebe123','Rebeca','Galdamez','rebe123','rebe@galdamez','DER',2,2),(31,2000000,'prueba2','testing','testapellido1','test123','test@test','ING',2,3);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tutorias'
--

--
-- Dumping routines for database 'tutorias'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-27 15:20:57
