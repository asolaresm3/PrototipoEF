CREATE DATABASE  IF NOT EXISTS `sic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sic`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sic
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `bodegas`
--

DROP TABLE IF EXISTS `bodegas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bodegas` (
  `codigo_bodega` varchar(5) NOT NULL,
  `nombre_bodega` varchar(60) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codigo_bodega`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bodegas`
--

LOCK TABLES `bodegas` WRITE;
/*!40000 ALTER TABLE `bodegas` DISABLE KEYS */;
/*!40000 ALTER TABLE `bodegas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `codigo_cliente` varchar(5) NOT NULL,
  `nombre_cliente` varchar(60) DEFAULT NULL,
  `direccion_cliente` varchar(60) DEFAULT NULL,
  `nit_cliente` varchar(20) DEFAULT NULL,
  `telefono_cliente` varchar(50) DEFAULT NULL,
  `codigo_vendedor` varchar(5) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codigo_cliente`),
  KEY `codigo_vendedor` (`codigo_vendedor`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`codigo_vendedor`) REFERENCES `vendedores` (`codigo_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES ('1','Jose Mogollon','Zona 7 Bethania','1212131','555555','1',1),('2','Pedro Suarez','Mixco','33333','252525','1',1),('3','Luis Suarez','Zona 10','11111','252525','1',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_detalle`
--

DROP TABLE IF EXISTS `compras_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_detalle` (
  `documento_compraenca` varchar(10) NOT NULL,
  `codigo_producto` varchar(18) NOT NULL,
  `cantidad_compradet` float(10,2) DEFAULT NULL,
  `costo_compradet` float(10,2) DEFAULT NULL,
  `codigo_bodega` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`documento_compraenca`,`codigo_producto`),
  KEY `codigo_producto` (`codigo_producto`),
  KEY `codigo_bodega` (`codigo_bodega`),
  CONSTRAINT `compras_detalle_ibfk_1` FOREIGN KEY (`documento_compraenca`) REFERENCES `compras_encabezado` (`documento_compraenca`),
  CONSTRAINT `compras_detalle_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo_producto`),
  CONSTRAINT `compras_detalle_ibfk_3` FOREIGN KEY (`codigo_bodega`) REFERENCES `bodegas` (`codigo_bodega`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_detalle`
--

LOCK TABLES `compras_detalle` WRITE;
/*!40000 ALTER TABLE `compras_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras_encabezado`
--

DROP TABLE IF EXISTS `compras_encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_encabezado` (
  `documento_compraenca` varchar(10) NOT NULL,
  `codigo_proveedor` varchar(5) DEFAULT NULL,
  `fecha_compraenca` date DEFAULT NULL,
  `total_compraenca` float(10,2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`documento_compraenca`),
  KEY `codigo_proveedor` (`codigo_proveedor`),
  CONSTRAINT `compras_encabezado_ibfk_1` FOREIGN KEY (`codigo_proveedor`) REFERENCES `proveedores` (`codigo_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras_encabezado`
--

LOCK TABLES `compras_encabezado` WRITE;
/*!40000 ALTER TABLE `compras_encabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `compras_encabezado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `existencias`
--

DROP TABLE IF EXISTS `existencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `existencias` (
  `codigo_bodega` varchar(5) NOT NULL,
  `codigo_producto` varchar(18) NOT NULL,
  `saldo_existencia` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`codigo_bodega`,`codigo_producto`),
  KEY `codigo_producto` (`codigo_producto`),
  CONSTRAINT `existencias_ibfk_1` FOREIGN KEY (`codigo_bodega`) REFERENCES `bodegas` (`codigo_bodega`),
  CONSTRAINT `existencias_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `existencias`
--

LOCK TABLES `existencias` WRITE;
/*!40000 ALTER TABLE `existencias` DISABLE KEYS */;
/*!40000 ALTER TABLE `existencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lineas`
--

DROP TABLE IF EXISTS `lineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lineas` (
  `codigo_linea` varchar(5) NOT NULL,
  `nombre_linea` varchar(60) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codigo_linea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lineas`
--

LOCK TABLES `lineas` WRITE;
/*!40000 ALTER TABLE `lineas` DISABLE KEYS */;
INSERT INTO `lineas` VALUES ('1','Roja',1),('2','Blanca',1),('3','Televisores',1);
/*!40000 ALTER TABLE `lineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `cod_usu` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_login` varchar(45) DEFAULT NULL,
  `pass_login` varchar(45) DEFAULT NULL,
  `tipo_user` int(11) DEFAULT NULL,
  `estado` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`cod_usu`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (3,'angel','81dc9bdb52d04dc20036dbd8313ed055',1,1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `codigo_marca` varchar(5) NOT NULL,
  `nombre_marca` varchar(60) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codigo_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES ('1','Samsung',1),('2','HP',0),('3','Toshiba',0);
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `codigo_producto` varchar(18) NOT NULL,
  `nombre_producto` varchar(60) DEFAULT NULL,
  `codigo_linea` varchar(5) DEFAULT NULL,
  `codigo_marca` varchar(5) DEFAULT NULL,
  `existencia_producto` float(10,2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codigo_producto`),
  KEY `codigo_linea` (`codigo_linea`),
  KEY `codigo_marca` (`codigo_marca`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`codigo_linea`) REFERENCES `lineas` (`codigo_linea`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`codigo_marca`) REFERENCES `marcas` (`codigo_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES ('1','Celular Negro','1','1',10.00,1),('2','Television','2','1',15.00,1),('3','Computadora','1','1',5.00,1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `codigo_proveedor` varchar(5) NOT NULL,
  `nombre_proveedor` varchar(60) DEFAULT NULL,
  `direccion_proveedor` varchar(60) DEFAULT NULL,
  `telefono_proveedor` varchar(50) DEFAULT NULL,
  `nit_proveedor` varchar(50) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codigo_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `codigo_vendedor` varchar(5) NOT NULL,
  `nombre_vendedor` varchar(60) DEFAULT NULL,
  `direccion_vendedor` varchar(60) DEFAULT NULL,
  `telefono_vendedor` varchar(50) DEFAULT NULL,
  `nit_vendedor` varchar(20) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codigo_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES ('1','Ivan Diaz','Zona 10','4444','3535',1),('2','Juan Perez','Zona 12','55555','33333',1);
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_detalle`
--

DROP TABLE IF EXISTS `ventas_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_detalle` (
  `documento_ventaenca` varchar(10) NOT NULL,
  `codigo_producto` varchar(18) NOT NULL,
  `cantidad_ventadet` float(10,2) DEFAULT NULL,
  `costo_ventadet` float(10,2) DEFAULT NULL,
  `precio_ventadet` float(10,2) DEFAULT NULL,
  `codigo_bodega` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`documento_ventaenca`,`codigo_producto`),
  KEY `codigo_producto` (`codigo_producto`),
  KEY `codigo_bodega` (`codigo_bodega`),
  CONSTRAINT `ventas_detalle_ibfk_1` FOREIGN KEY (`documento_ventaenca`) REFERENCES `ventas_encabezado` (`documento_ventaenca`),
  CONSTRAINT `ventas_detalle_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `productos` (`codigo_producto`),
  CONSTRAINT `ventas_detalle_ibfk_3` FOREIGN KEY (`codigo_bodega`) REFERENCES `bodegas` (`codigo_bodega`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_detalle`
--

LOCK TABLES `ventas_detalle` WRITE;
/*!40000 ALTER TABLE `ventas_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_encabezado`
--

DROP TABLE IF EXISTS `ventas_encabezado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas_encabezado` (
  `documento_ventaenca` varchar(10) NOT NULL,
  `codigo_cliente` varchar(5) DEFAULT NULL,
  `fecha_ventaenca` date DEFAULT NULL,
  `total_ventaenca` float(10,2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`documento_ventaenca`),
  KEY `codigo_cliente` (`codigo_cliente`),
  CONSTRAINT `ventas_encabezado_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `clientes` (`codigo_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_encabezado`
--

LOCK TABLES `ventas_encabezado` WRITE;
/*!40000 ALTER TABLE `ventas_encabezado` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas_encabezado` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-03 15:02:28
