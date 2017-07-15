-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: db_finance
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `adminis`
--

DROP TABLE IF EXISTS `adminis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminis` (
  `nik_adminis` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jabatan` varchar(30) DEFAULT NULL,
  `sandi` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`nik_adminis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminis`
--

LOCK TABLES `adminis` WRITE;
/*!40000 ALTER TABLE `adminis` DISABLE KEYS */;
INSERT INTO `adminis` VALUES (15312376,'a','a','a','a');
/*!40000 ALTER TABLE `adminis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bayar_sewa_kendaraan`
--

DROP TABLE IF EXISTS `bayar_sewa_kendaraan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bayar_sewa_kendaraan` (
  `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT,
  `uraian` varchar(100) DEFAULT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `jumlah_bayar` int(11) DEFAULT NULL,
  `id_karyawan` int(11) DEFAULT NULL,
  `kendaraan` varchar(20) DEFAULT NULL,
  `nik_adminis` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`),
  KEY `fk_bayarkendaraan_karyawan` (`id_karyawan`),
  KEY `fk_bayar_adminis` (`nik_adminis`),
  CONSTRAINT `fk_bayar_adminis` FOREIGN KEY (`nik_adminis`) REFERENCES `adminis` (`nik_adminis`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_bayarkendaraan_karyawan` FOREIGN KEY (`id_karyawan`) REFERENCES `karyawan` (`NIK`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bayar_sewa_kendaraan`
--

LOCK TABLES `bayar_sewa_kendaraan` WRITE;
/*!40000 ALTER TABLE `bayar_sewa_kendaraan` DISABLE KEYS */;
/*!40000 ALTER TABLE `bayar_sewa_kendaraan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karyawan`
--

DROP TABLE IF EXISTS `karyawan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `karyawan` (
  `NIK` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `no_kendaraan` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`NIK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karyawan`
--

LOCK TABLES `karyawan` WRITE;
/*!40000 ALTER TABLE `karyawan` DISABLE KEYS */;
/*!40000 ALTER TABLE `karyawan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kendaraan`
--

DROP TABLE IF EXISTS `kendaraan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kendaraan` (
  `no_polis` varchar(20) NOT NULL,
  `merk` varchar(20) DEFAULT NULL,
  `id_pemilik` int(11) DEFAULT NULL,
  PRIMARY KEY (`no_polis`),
  KEY `fk_kendaraan_karyawan_idx` (`id_pemilik`),
  CONSTRAINT `fk_kendaraan_karyawan` FOREIGN KEY (`id_pemilik`) REFERENCES `karyawan` (`NIK`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kendaraan`
--

LOCK TABLES `kendaraan` WRITE;
/*!40000 ALTER TABLE `kendaraan` DISABLE KEYS */;
/*!40000 ALTER TABLE `kendaraan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendanaan`
--

DROP TABLE IF EXISTS `pendanaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pendanaan` (
  `id_pendanaan` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `uraian` varchar(100) DEFAULT NULL,
  `jumlah` decimal(10,2) DEFAULT NULL,
  `stats` varchar(20) DEFAULT NULL,
  `nik_adminis` int(11) DEFAULT NULL,
  `id_project` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_pendanaan`),
  KEY `fk_pendanaan_adminis` (`nik_adminis`),
  KEY `fk_pendanaan_project` (`id_project`),
  CONSTRAINT `fk_pendanaan_adminis` FOREIGN KEY (`nik_adminis`) REFERENCES `adminis` (`nik_adminis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pendanaan_project` FOREIGN KEY (`id_project`) REFERENCES `project` (`id_project`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendanaan`
--

LOCK TABLES `pendanaan` WRITE;
/*!40000 ALTER TABLE `pendanaan` DISABLE KEYS */;
INSERT INTO `pendanaan` VALUES (26,'2017-06-09','ini cinta kamu',1000.00,'blm',15312376,'ID-002'),(27,'2017-06-08','belanja',1234.00,'lunas',15312376,'ID-002'),(28,'2017-06-08','Semua berawal dari mimpi',10000.00,'Blm',15312376,'ID-002'),(29,'2017-06-09','Belanja bmm',100000.00,'blm',15312376,'ID_003'),(30,'2017-06-09','Konsumsi dan alat tulis	',1000000.00,'blm',15312376,'ID_001');
/*!40000 ALTER TABLE `pendanaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pendanaan_bbm`
--

DROP TABLE IF EXISTS `pendanaan_bbm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pendanaan_bbm` (
  `id_pendanaanbbm` int(11) NOT NULL AUTO_INCREMENT,
  `id_pendanaan` int(11) DEFAULT NULL,
  `no_polis` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pendanaanbbm`),
  KEY `fk_pendanaanbbm_pendanaan` (`id_pendanaan`),
  KEY `fk_pendanaanbbm_kendaraan` (`no_polis`),
  CONSTRAINT `fk_pendanaanbbm_kendaraan` FOREIGN KEY (`no_polis`) REFERENCES `kendaraan` (`no_polis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pendanaanbbm_pendanaan` FOREIGN KEY (`id_pendanaan`) REFERENCES `pendanaan` (`id_pendanaan`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pendanaan_bbm`
--

LOCK TABLES `pendanaan_bbm` WRITE;
/*!40000 ALTER TABLE `pendanaan_bbm` DISABLE KEYS */;
/*!40000 ALTER TABLE `pendanaan_bbm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id_project` varchar(10) NOT NULL,
  `nama_project` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ID-002','pt.abc'),('ID_001','pt.aqua'),('ID_003','pt.bm');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-15 12:45:03
