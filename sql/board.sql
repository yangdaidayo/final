-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: board
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `goods_1`
--

DROP TABLE IF EXISTS `goods_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_1` (
  `GBNO` tinyint NOT NULL AUTO_INCREMENT,
  `Score` tinyint DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_1`
--

LOCK TABLES `goods_1` WRITE;
/*!40000 ALTER TABLE `goods_1` DISABLE KEYS */;
INSERT INTO `goods_1` VALUES (1,5,'飲料好喝','2025-05-28'),(2,4,'茶味比較重，甜度適中','2025-05-28'),(3,2,'水果味不夠','2025-05-28'),(4,5,'水果的甜味和茶的香味完美結合','2025-05-28'),(5,1,'超難喝','2025-05-28'),(6,3,'普通','2025-05-28'),(7,3,'味道有點過於複雜，不知道在喝什麼','2025-05-28');
/*!40000 ALTER TABLE `goods_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_2`
--

DROP TABLE IF EXISTS `goods_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_2` (
  `GBNO` tinyint NOT NULL AUTO_INCREMENT,
  `Score` tinyint DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_2`
--

LOCK TABLES `goods_2` WRITE;
/*!40000 ALTER TABLE `goods_2` DISABLE KEYS */;
INSERT INTO `goods_2` VALUES (1,3,'柳橙太酸了','2025-05-28'),(2,4,'柳橙與奶昔的搭配很棒','2025-05-28'),(3,5,'柳橙是現榨的，很新鮮','2025-05-28'),(4,1,'這個組合好詭異，不是很推薦','2025-05-28');
/*!40000 ALTER TABLE `goods_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_3`
--

DROP TABLE IF EXISTS `goods_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_3` (
  `GBNO` tinyint NOT NULL AUTO_INCREMENT,
  `Score` tinyint DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_3`
--

LOCK TABLES `goods_3` WRITE;
/*!40000 ALTER TABLE `goods_3` DISABLE KEYS */;
INSERT INTO `goods_3` VALUES (1,5,'酸酸甜甜的很好喝','2025-05-28'),(2,4,'好喝','2025-05-28'),(3,3,'覆盆子味有點太重了，蓋過其他的味道','2025-05-28'),(4,2,'甜度太甜了，希望能夠調整','2025-05-28'),(5,4,'很有趣的味道','2025-05-28'),(6,1,'太甜了，喝起來很容易膩','2025-05-28'),(7,4,'我覺得甜度適中，下面的評論是不是舌頭出了問題?','2025-05-28'),(8,3,'味道普通','2025-05-28'),(9,4,'還不錯','2025-05-28'),(10,5,'朋友推薦來喝的，沒想到那麼好喝','2025-05-28'),(11,3,'味道勉強及格，還有改善空間','2025-05-28');
/*!40000 ALTER TABLE `goods_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_4`
--

DROP TABLE IF EXISTS `goods_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_4` (
  `GBNO` tinyint NOT NULL AUTO_INCREMENT,
  `Score` tinyint DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_4`
--

LOCK TABLES `goods_4` WRITE;
/*!40000 ALTER TABLE `goods_4` DISABLE KEYS */;
INSERT INTO `goods_4` VALUES (1,4,'整體喝起來很清香，但口感略澀','2025-05-28'),(2,4,'綠茶好喝，是個很新奇的味道','2025-05-28'),(3,5,'柚子味很讚','2025-05-28'),(4,1,'柚子味跟綠茶不搭','2025-05-28');
/*!40000 ALTER TABLE `goods_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_5`
--

DROP TABLE IF EXISTS `goods_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_5` (
  `GBNO` tinyint NOT NULL AUTO_INCREMENT,
  `Score` tinyint DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_5`
--

LOCK TABLES `goods_5` WRITE;
/*!40000 ALTER TABLE `goods_5` DISABLE KEYS */;
INSERT INTO `goods_5` VALUES (1,4,'很好喝','2025-05-28'),(2,3,'蜜桃的味道有點太多了','2025-05-28'),(3,5,'烏龍茶的茶味很讚，跟蜜桃很搭','2025-05-28'),(4,2,'烏龍茶有點苦澀','2025-05-28');
/*!40000 ALTER TABLE `goods_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_6`
--

DROP TABLE IF EXISTS `goods_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_6` (
  `GBNO` tinyint NOT NULL AUTO_INCREMENT,
  `Score` tinyint DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_6`
--

LOCK TABLES `goods_6` WRITE;
/*!40000 ALTER TABLE `goods_6` DISABLE KEYS */;
INSERT INTO `goods_6` VALUES (1,3,'檸檬茶好喝，但薄荷味太淡了','2025-05-28'),(2,4,'檸檬茶很香，會再來回購','2025-05-28'),(3,2,'有點太甜','2025-05-28'),(4,1,'喝不出薄荷的味道，跟一般檸檬茶一樣的味道','2025-05-28'),(5,3,'一般般','2025-05-28');
/*!40000 ALTER TABLE `goods_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_7`
--

DROP TABLE IF EXISTS `goods_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_7` (
  `GBNO` tinyint NOT NULL AUTO_INCREMENT,
  `Score` tinyint DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_7`
--

LOCK TABLES `goods_7` WRITE;
/*!40000 ALTER TABLE `goods_7` DISABLE KEYS */;
INSERT INTO `goods_7` VALUES (1,5,'這個很好喝，十分推薦!','2025-05-28'),(2,1,'真的是用斯里蘭卡錫蘭紅茶嗎?感覺跟我家對面的早餐店紅茶差不多','2025-05-28'),(3,3,'好像感受不到所謂的煙燻味，但好喝','2025-05-28'),(4,4,'紅茶很順口，還不錯喝','2025-05-28'),(5,3,'挺普通的','2025-05-28'),(6,5,'煙燻味很棒，微微的酸度也提升了這杯紅茶的層次感','2025-05-28');
/*!40000 ALTER TABLE `goods_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_8`
--

DROP TABLE IF EXISTS `goods_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_8` (
  `GBNO` tinyint NOT NULL AUTO_INCREMENT,
  `Score` tinyint DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_8`
--

LOCK TABLES `goods_8` WRITE;
/*!40000 ALTER TABLE `goods_8` DISABLE KEYS */;
INSERT INTO `goods_8` VALUES (1,4,'奶香味很濃厚，紅茶不會很苦澀','2025-05-28'),(2,2,'茶味好重，不喜歡','2025-05-28'),(3,5,'味道醇香，我很喜歡','2025-05-28'),(4,4,'茶味厚重，很有層次','2025-05-28'),(5,1,'感覺牛奶和紅茶的比例沒有調整好，茶味太重了，奶味不明顯','2025-05-28');
/*!40000 ALTER TABLE `goods_8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_9`
--

DROP TABLE IF EXISTS `goods_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods_9` (
  `GBNO` tinyint NOT NULL AUTO_INCREMENT,
  `Score` tinyint DEFAULT NULL,
  `Content` text,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_9`
--

LOCK TABLES `goods_9` WRITE;
/*!40000 ALTER TABLE `goods_9` DISABLE KEYS */;
INSERT INTO `goods_9` VALUES (1,3,'琴酒的味道有點濃烈','2025-05-28'),(2,2,'澀味感覺有點太重了','2025-05-28'),(3,4,'咖啡加琴酒意外的還不錯','2025-05-28'),(4,5,'好喝~取得名字很有趣\r\nWe shall meet in the place where there is no darkness.','2025-05-28'),(5,1,'咖啡裡加琴酒是什麼奇怪的組合啊?','2025-05-28'),(6,3,'咖啡幫助人提神，酒精幫助人放鬆，嗯...神奇的組合','2025-05-28'),(7,4,'喝不太出來咖啡豆的區別，但好喝','2025-05-28');
/*!40000 ALTER TABLE `goods_9` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-28 21:51:57
