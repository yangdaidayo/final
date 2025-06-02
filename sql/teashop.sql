CREATE DATABASE  IF NOT EXISTS `teashop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `teashop`;
-- MySQL dump 10.13  Distrib 8.0.41, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: teashop
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'夏日水果清涼系列'),(2,'小清新系列'),(3,'經典系列');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` text,
  `image_path` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `product_page` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'楊奇樂無比水果茶',55.00,'楊桃、奇異果與芭樂的完美碰撞，結合茶香與水果的天然甜味，創造出一款既健康又充滿活力的飲品。這種獨特的混合帶來了多層次的口感和豐富的營養，令人一喝便愛不釋口','image/product_image/drink_1.png',1,'product_page_part/goods_1/drink_1.jsp',93),(2,'橙風破浪',50.00,'融合了新鮮柳橙的清爽酸甜與奶昔的絲滑香濃，將兩種截然不同的風味巧妙地結合在一起，充滿活力和動感的氛圍，為你帶來一種前所未有的口感享受','image/product_image/drink_2.png',1,'product_page_part/goods_2/drink_2.jsp',98),(3,'覆果好檸',65.00,'覆盆子的酸甜與檸檬的清新交織在一起，每一口都充滿了大自然狂歡的味道，帶你體驗一場清涼透心的夏日探險吧','image/product_image/drink_3.png',1,'product_page_part/goods_3/drink_3.jsp',100),(4,'柚香綠茶',30.00,'柚香綠茶是一款專為清新自然愛好者設計的飲品。每一杯柚香綠茶都仿佛是自然的禮物，讓你在忙碌的都市生活中，找到一個安靜的角落，享受大自然的美好','image/product_image/drink_4.png',2,'product_page_part/goods_4/drink_4.jsp',100),(5,'蜜桃烏龍茶',35.00,'蜜桃烏龍茶是夏日午後的甜美驚喜。每一口蜜桃烏龍茶都像是走進了一片蜜桃果園，微風中彌漫著果香和茶韻，讓你不禁心生愉悅，感受大自然的甜美','image/product_image/drink_5.png',2,'product_page_part/goods_5/drink_5.jsp',100),(6,'薄荷檸檬冰茶',45.00,'薄荷檸檬冰茶是夏日最清涼的救星。每一杯薄荷檸檬冰茶都像是一段夏日的冒險旅程，帶你從炎熱的都市穿越到清涼的綠洲，享受那片刻的清新和愉悅','image/product_image/drink_6.png',2,'product_page_part/goods_6/drink_6.jsp',100),(7,'琥珀之輝',40.00,'選用斯里蘭卡錫蘭紅茶茶葉，其色澤為清澈明亮的琥珀色，帶有一種清香與淡淡的煙燻味，滑順清爽的口感中略帶一些微微的酸味，其獨特的氣味十分受歡迎','image/product_image/drink_7.png',3,'product_page_part/goods_7/drink_7.jsp',100),(8,'午後時光',45.00,'一個寧靜的午後，何不坐下來，手裡拿著一杯由新鮮牛奶與錫蘭紅茶沖泡而成的鮮奶茶，與三五好友一起，享受這悠閒的午後時光呢?','image/product_image/drink_8.png',3,'product_page_part/goods_8/drink_8.jsp',100),(9,'1984',55.00,'靈感源於英國作家喬治·歐威爾筆下的反烏托邦小說——1984。咖啡豆採用羅布斯塔咖啡豆，其口感較為苦澀，其顏色與口感反映了書中黑暗且充滿苦難的環境，且咖啡裡加入了些許書中主角常喝的琴酒，增添了些許不同的風味\n靈感源於英國作家喬治·歐威爾筆下的反烏托邦小說——1984。咖啡豆採用羅布斯塔咖啡豆，其口感較為苦澀，其顏色與口感反映了書中黑暗且充滿苦難的環境，且咖啡裡加入了些許書中主角常喝的琴酒，增添了些許不同的風味\n“We shall meet in the place where there is no darkness.”','image/product_image/drink_9.png',3,'product_page_part/goods_9/drink_9.jsp',100);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_log`
--

DROP TABLE IF EXISTS `search_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL,
  `search_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_log`
--

LOCK TABLES `search_log` WRITE;
/*!40000 ALTER TABLE `search_log` DISABLE KEYS */;
INSERT INTO `search_log` VALUES (1,'橙','2025-05-30 22:46:25'),(2,'小清新','2025-05-30 22:46:54'),(3,'小清新','2025-05-30 22:51:33'),(4,'小清新','2025-05-30 22:55:22'),(5,'小清新','2025-05-30 22:55:29'),(6,'經典','2025-05-30 22:56:22'),(7,'經典','2025-05-30 22:57:09'),(8,'小','2025-05-30 23:02:11'),(9,'小','2025-05-30 23:03:01'),(10,'小','2025-05-30 23:03:09'),(11,'小','2025-05-30 23:03:57'),(12,'vul3','2025-05-30 23:04:01'),(13,'小','2025-05-30 23:04:04'),(14,'小','2025-05-30 23:04:20'),(15,'小','2025-05-30 23:05:59'),(16,'小','2025-05-30 23:09:03'),(17,'小清新','2025-05-30 23:09:15'),(18,'111','2025-05-30 23:12:22'),(19,'11','2025-05-30 23:16:44'),(20,'11','2025-05-30 23:16:53'),(21,'11','2025-05-30 23:16:55'),(22,'小清新','2025-05-30 23:16:58'),(23,'ww','2025-05-30 23:23:37'),(24,'ww','2025-05-30 23:23:37');
/*!40000 ALTER TABLE `search_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-02 15:37:19
