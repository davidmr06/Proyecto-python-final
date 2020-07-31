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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materias`
--

LOCK TABLES `materias` WRITE;
/*!40000 ALTER TABLE `materias` DISABLE KEYS */;
INSERT INTO `materias` VALUES (2,'Fisica'),(3,'Calculo para Ingenieros'),(4,'Calculo para Ingenieros II'),(5,'Mecanica Racional'),(6,'Calculo para Ingenieros III'),(7,'Estadistica y Probabilidad'),(8,'Inferencia Estadistica'),(9,'Macroeconomia'),(10,'Macroeconomia II'),(11,'Contabilidad'),(12,'Contabilidad II'),(13,'Algebra Lineal'),(14,'Derecho Penal'),(15,'Derecho Penal II'),(16,'Derecho Constitucional'),(17,'Derecho Romano'),(18,'Bienestar Total'),(20,'Excel VBA');
/*!40000 ALTER TABLE `materias` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `Valoracion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tutorias_alumnos_usuarios1_idx` (`IdAlumno`),
  KEY `fk_tutorias_alumnos_tutorias_tutor1_idx` (`idtutoriastutor`),
  CONSTRAINT `fk_tutorias_alumnos_tutorias_tutor1` FOREIGN KEY (`idtutoriastutor`) REFERENCES `tutorias_tutor` (`id`),
  CONSTRAINT `fk_tutorias_alumnos_usuarios1` FOREIGN KEY (`IdAlumno`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorias_alumnos`
--

LOCK TABLES `tutorias_alumnos` WRITE;
/*!40000 ALTER TABLE `tutorias_alumnos` DISABLE KEYS */;
INSERT INTO `tutorias_alumnos` VALUES (1,6,1,10),(2,7,2,9),(3,8,3,10),(4,9,3,8);
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
  `Precio` double DEFAULT NULL,
  `Horas_tutoria` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tutorias_tutor_materias1_idx` (`idmateria`),
  KEY `fk_tutorias_tutor_usuarios1_idx` (`idtutor`),
  CONSTRAINT `fk_tutorias_tutor_materias1` FOREIGN KEY (`idmateria`) REFERENCES `materias` (`id`),
  CONSTRAINT `fk_tutorias_tutor_usuarios1` FOREIGN KEY (`idtutor`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorias_tutor`
--

LOCK TABLES `tutorias_tutor` WRITE;
/*!40000 ALTER TABLE `tutorias_tutor` DISABLE KEYS */;
INSERT INTO `tutorias_tutor` VALUES (1,1,4,10,1),(2,12,11,8,1),(3,11,15,20,2),(4,2,13,8,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,20183104,'David123','David','Rivas','david123','david@rivas','ING',3,1),(2,20182202,'Julio123','Julio','Blanco','gordo123','julio@blanco','ING',3,1),(3,20181726,'Adrian123','Adrian','Rodriguez','elena123','adrian@r','ING',3,1),(4,NULL,'Sven123','Sven','Guzman','Sg123','sguzma@esen','ING',NULL,2),(5,NULL,'Balbino123','Balbino','Aylagas','balbino123','balbino@aylagas','ING',NULL,2),(6,20180000,'Albert123','Albert','Einstein','fisica123','albert@ein','ING',2,3),(7,20181234,'John123','John','Keynes','joni123','john@keynes','ECON',3,3),(8,20185678,'Jon123','Jon','Snow','daenerys123','jon@snow','DER',3,3),(9,20201234,'Daenerys123','Daenerys','Targaryen','jon123','dany@targ','DER',3,3),(10,NULL,'Jose123','Jose','Velasquez','rox123','jmvelasquez@esen','ING',NULL,2),(11,20181499,'Delmer123','Delmer','Rodriguez','delmer123','delmer@esen','DER',NULL,2),(12,NULL,'Ever123','Everardo','River','ever123','ever@esen','ECON',NULL,2),(13,2000,'Walter123','Walter','White','Skyler123','Walter@white','ING',2,2),(15,200000,'asd','dad','asdfas','bvc','tiiut','sad',3,2),(16,20186574,'prueba','probando','tutorado','1234','tutot123','ING',2,2);
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

-- Dump completed on 2020-07-28 11:22:14
