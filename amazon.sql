-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: amazon
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `AdminID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `userid` int DEFAULT NULL,
  `productid` int DEFAULT NULL,
  PRIMARY KEY (`AdminID`),
  KEY `userid` (`userid`),
  KEY `productid` (`productid`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `user` (`UserID`),
  CONSTRAINT `admin_ibfk_2` FOREIGN KEY (`productid`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin_user','admin_password',1,11),(12,'admin1','admin123',1,11),(13,'tiyamiya','admin456',2,17),(14,'admin3','admin789',3,18),(15,'admin4','adminabc',4,19),(16,'admin5','adminxyz',5,20),(17,'shibbolithic','dbms',8,1),(19,'siya','dbms12',NULL,22),(20,'shibbolithic','dbms',8,17),(21,'shibbolithic','dbms',8,17);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `availablecoupons`
--

DROP TABLE IF EXISTS `availablecoupons`;
/*!50001 DROP VIEW IF EXISTS `availablecoupons`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `availablecoupons` AS SELECT 
 1 AS `CouponID`,
 1 AS `Code`,
 1 AS `DiscountPercentage`,
 1 AS `ExpirationDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `BrandID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`BrandID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Nike'),(2,'Adidas'),(3,'Apple'),(4,'Samsung'),(5,'Sony'),(6,'lays'),(7,'nestle'),(8,'classmate'),(9,'Fitbit'),(10,'Microsoft'),(11,'tifiny');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `CartID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int DEFAULT NULL,
  PRIMARY KEY (`CartID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (2,1),(1,11),(3,11),(6,11),(7,11),(4,17),(8,17),(5,18),(9,18),(12,18),(10,19),(11,20);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Electronics'),(2,'jewellery'),(3,'Category1'),(4,'watch'),(5,'Category3'),(6,'Category4'),(7,'Category5');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `ContactID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Message` text NOT NULL,
  `Date` datetime NOT NULL,
  PRIMARY KEY (`ContactID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'jiya','johndoe@example.com','123-456-7890','This is a sample message.','2024-03-05 12:49:48'),(2,'kiya','contact1@example.com','1234567890','Message1','2024-03-27 21:41:28'),(3,'tiya','contact2@example.com','9876543210','Message2','2024-03-27 21:41:28'),(4,'riya','contact3@example.com','5555555555','Message3','2024-03-27 21:41:28'),(5,'miya','contact4@example.com','1111111111','Message4','2024-03-27 21:41:28'),(6,'diya','contact5@example.com','7777777777','Message5','2024-03-27 21:41:28'),(7,'liya','akshita@gmail.com','9871618879','hello everyone!','2005-02-12 00:00:00'),(8,'kashish','kashish@gmail.com','7787981282','hey, my name is kashish','2023-12-02 00:00:00');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `CouponID` int NOT NULL AUTO_INCREMENT,
  `Code` varchar(50) NOT NULL,
  `DiscountPercentage` decimal(5,2) NOT NULL,
  `ExpirationDate` date NOT NULL,
  PRIMARY KEY (`CouponID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,'SAVE10',10.00,'2024-12-31'),(2,'SUMMER25',25.00,'2024-08-31'),(3,'FREESHIP',100.00,'2024-06-30'),(4,'CODE1',10.00,'2024-12-31'),(5,'CODE2',20.00,'2024-12-31'),(6,'CODE3',15.00,'2024-12-31'),(7,'CODE4',25.00,'2024-12-31'),(8,'CODE5',30.00,'2024-12-31'),(9,'DBMS25',25.00,'2024-04-12'),(10,'alisha50',10.00,'2024-04-06'),(11,'TEEJ50',50.00,'2024-12-31'),(12,'FIFTY50',50.00,'2024-12-31');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `deactivate_expired_coupons` BEFORE INSERT ON `coupon` FOR EACH ROW BEGIN
    IF NEW.ExpirationDate < CURDATE() THEN
        SET NEW.DiscountPercentage = 0;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `OrderID` int DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  KEY `UserID` (`UserID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,1,1),(7,1,11),(8,2,12),(9,3,13),(10,4,14),(11,5,15);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customerdetails`
--

DROP TABLE IF EXISTS `customerdetails`;
/*!50001 DROP VIEW IF EXISTS `customerdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerdetails` AS SELECT 
 1 AS `CustomerID`,
 1 AS `Username`,
 1 AS `Email`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `PhoneNumber`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `customerorders`
--

DROP TABLE IF EXISTS `customerorders`;
/*!50001 DROP VIEW IF EXISTS `customerorders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customerorders` AS SELECT 
 1 AS `CustomerID`,
 1 AS `Username`,
 1 AS `OrderID`,
 1 AS `TotalAmount`,
 1 AS `OrderDate`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `ProductID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`ProductID`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,0),(11,100),(17,10),(18,20),(19,5),(20,40),(21,50);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `inventorystatus`
--

DROP TABLE IF EXISTS `inventorystatus`;
/*!50001 DROP VIEW IF EXISTS `inventorystatus`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inventorystatus` AS SELECT 
 1 AS `ProductID`,
 1 AS `Name`,
 1 AS `Description`,
 1 AS `Price`,
 1 AS `Quantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!50001 DROP VIEW IF EXISTS `orderdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orderdetails` AS SELECT 
 1 AS `OrderID`,
 1 AS `Username`,
 1 AS `TotalAmount`,
 1 AS `OrderDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orderpaymentdetails`
--

DROP TABLE IF EXISTS `orderpaymentdetails`;
/*!50001 DROP VIEW IF EXISTS `orderpaymentdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orderpaymentdetails` AS SELECT 
 1 AS `OrderID`,
 1 AS `UserID`,
 1 AS `TotalAmount`,
 1 AS `OrderDate`,
 1 AS `ShippingAddress`,
 1 AS `Status`,
 1 AS `PaymentMethod`,
 1 AS `PaymentAmount`,
 1 AS `PaymentDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `TotalAmount` decimal(10,2) NOT NULL,
  `OrderDate` date NOT NULL,
  `ShippingAddress` varchar(255) NOT NULL,
  `PaymentID` int DEFAULT NULL,
  `Status` enum('Pending','Shipped','Delivered') NOT NULL,
  `ProductID` int DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `UserID` (`UserID`),
  KEY `PaymentID` (`PaymentID`),
  KEY `fk_product_id` (`ProductID`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,206.93,'2024-02-12','78, baker\'s street, london',1,'Pending',11),(11,1,999.99,'2024-03-25','123 Main Street, New York, 10001',1,'Shipped',17),(12,2,699.99,'2024-03-22','456 First Avenue, Los Angeles, 90001',2,'Delivered',18),(13,3,199.99,'2024-03-22','789 Oak Street, Chicago, 60601',3,'Pending',19),(14,4,299.99,'2024-03-21','101 Elm Street, Houston, 77002',4,'Shipped',20),(15,5,399.99,'2024-03-23','202 Cedar Street, Miami, 33101',5,'Delivered',21),(16,6,399.99,'2024-03-12','m block, ladies hostel, 122050',6,'Pending',21);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_inventory_after_order` AFTER INSERT ON `orders` FOR EACH ROW BEGIN
    DECLARE product_id INT;
    DECLARE ordered_quantity INT;

    
    SELECT ProductID, Quantity INTO product_id, ordered_quantity
    FROM Inventory
    WHERE ProductID = NEW.ProductID;

    
    UPDATE Inventory
    SET Quantity = Quantity - ordered_quantity
    WHERE ProductID = product_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `ordershippingdetails`
--

DROP TABLE IF EXISTS `ordershippingdetails`;
/*!50001 DROP VIEW IF EXISTS `ordershippingdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordershippingdetails` AS SELECT 
 1 AS `OrderID`,
 1 AS `UserID`,
 1 AS `TotalAmount`,
 1 AS `OrderDate`,
 1 AS `ShippingAddress`,
 1 AS `Status`,
 1 AS `ShippingMethod`,
 1 AS `TrackingNumber`,
 1 AS `ShippingDate`,
 1 AS `EstimatedDeliveryDate`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orderuseremail`
--

DROP TABLE IF EXISTS `orderuseremail`;
/*!50001 DROP VIEW IF EXISTS `orderuseremail`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orderuseremail` AS SELECT 
 1 AS `OrderID`,
 1 AS `UserEmail`,
 1 AS `TotalAmount`,
 1 AS `OrderDate`,
 1 AS `ShippingAddress`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PaymentID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `PaymentMethod` varchar(50) NOT NULL,
  `TransactionID` varchar(100) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `PaymentDate` date NOT NULL,
  `couponid` int DEFAULT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `fk_payment_order` (`OrderID`),
  KEY `couponid` (`couponid`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`couponid`) REFERENCES `coupon` (`CouponID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,'UPI','1',654.00,'2024-02-12',1),(10,11,'Credit Card','TRANS001',50.00,'2024-03-27',2),(11,12,'PayPal','TRANS002',100.00,'2024-03-27',3),(12,13,'Credit Card','TRANS003',150.00,'2024-03-27',4),(13,14,'PayPal','TRANS004',200.00,'2024-03-27',2),(14,15,'Credit Card','TRANS005',250.00,'2024-03-27',2);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `verify_payment_details` BEFORE INSERT ON `payment` FOR EACH ROW BEGIN
    IF NEW.PaymentMethod NOT IN ('Credit Card', 'Debit Card', 'PayPal') THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid payment method';
    END IF;
    
    IF EXISTS (
        SELECT 1
        FROM Payment
        WHERE TransactionID = NEW.TransactionID
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Duplicate transaction ID';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` text,
  `Price` decimal(10,2) NOT NULL,
  `CategoryID` int DEFAULT NULL,
  `BrandID` int DEFAULT NULL,
  `ImageURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID` (`CategoryID`),
  KEY `BrandID` (`BrandID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`BrandID`) REFERENCES `brand` (`BrandID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'mousepad','for bluetooth and wired cable',400.00,3,2,'mousepad.jpg'),(11,'ring','hello kitty ring',65.00,2,11,'ring.jpg'),(17,'Laptop','High-performance laptop with SSD storage',9999.99,1,1,'laptop.jpg'),(18,'Smartphone','Latest smartphone with dual-camera setup',699.99,1,4,'smartphone.jpg'),(19,'Headphones','Wireless headphones with noise-canceling feature',199.99,3,3,'headphones.jpg'),(20,'Smartwatch','Fitness tracker with heart rate monitoring',299.99,4,4,'smartwatch.jpg'),(21,'Tablet','10-inch tablet with high-resolution display',39999.99,1,3,'tablet.jpg'),(22,'necklace','diamond pendant necklace',19999.80,2,11,'necklace.jpg'),(23,'samsung galazy s21','mobile phone',129929.00,1,4,'galaxys21.jpg'),(24,'samsung galazy s22','mobile phone',129929.00,1,4,'galaxys22.jpg');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prevent_product_deletion_referenced_by_admin` BEFORE DELETE ON `product` FOR EACH ROW BEGIN
    IF EXISTS (
        SELECT 1
        FROM Admin
        WHERE ProductID = OLD.ProductID
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Product is referenced by admin, deletion not allowed';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `productavgratingreviews`
--

DROP TABLE IF EXISTS `productavgratingreviews`;
/*!50001 DROP VIEW IF EXISTS `productavgratingreviews`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productavgratingreviews` AS SELECT 
 1 AS `ProductID`,
 1 AS `ProductName`,
 1 AS `AvgRating`,
 1 AS `NumReviews`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `productbrand`
--

DROP TABLE IF EXISTS `productbrand`;
/*!50001 DROP VIEW IF EXISTS `productbrand`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productbrand` AS SELECT 
 1 AS `ProductID`,
 1 AS `ProductName`,
 1 AS `Description`,
 1 AS `Price`,
 1 AS `BrandName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `productbrandcategory`
--

DROP TABLE IF EXISTS `productbrandcategory`;
/*!50001 DROP VIEW IF EXISTS `productbrandcategory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productbrandcategory` AS SELECT 
 1 AS `ProductID`,
 1 AS `ProductName`,
 1 AS `Description`,
 1 AS `Price`,
 1 AS `BrandName`,
 1 AS `CategoryName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `productcategory`
--

DROP TABLE IF EXISTS `productcategory`;
/*!50001 DROP VIEW IF EXISTS `productcategory`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productcategory` AS SELECT 
 1 AS `ProductID`,
 1 AS `ProductName`,
 1 AS `Description`,
 1 AS `Price`,
 1 AS `CategoryName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `productinventoryquantity`
--

DROP TABLE IF EXISTS `productinventoryquantity`;
/*!50001 DROP VIEW IF EXISTS `productinventoryquantity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productinventoryquantity` AS SELECT 
 1 AS `ProductName`,
 1 AS `CategoryName`,
 1 AS `TotalQuantity`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `productreviews`
--

DROP TABLE IF EXISTS `productreviews`;
/*!50001 DROP VIEW IF EXISTS `productreviews`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `productreviews` AS SELECT 
 1 AS `ReviewID`,
 1 AS `Rating`,
 1 AS `ReviewText`,
 1 AS `Date`,
 1 AS `Reviewer`,
 1 AS `ProductName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `Rating` int DEFAULT NULL,
  `ReviewText` text,
  `Date` date NOT NULL,
  PRIMARY KEY (`ReviewID`),
  KEY `ProductID` (`ProductID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `CHK_RatingRange` CHECK (((`Rating` >= 1) and (`Rating` <= 5))),
  CONSTRAINT `review_chk_1` CHECK (((`Rating` >= 1) and (`Rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,11,1,3,'very nice product','2023-12-02'),(7,17,1,4,'Good product','2024-03-27'),(8,18,2,5,'Excellent product','2024-03-27'),(9,19,3,3,'Average product','2024-03-27'),(10,20,4,2,'Not satisfied','2024-03-27'),(11,21,5,5,'Highly recommended','2024-03-27');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_average_rating` AFTER INSERT ON `review` FOR EACH ROW BEGIN
    UPDATE Product
    SET AverageRating = (
        SELECT AVG(Rating)
        FROM Review
        WHERE ProductID = NEW.ProductID
    )
    WHERE ProductID = NEW.ProductID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateReviewCount` AFTER INSERT ON `review` FOR EACH ROW BEGIN
    
    UPDATE Product
    SET ReviewCount = ReviewCount + 1
    WHERE ProductID = NEW.ProductID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DecreaseReviewCount` AFTER DELETE ON `review` FOR EACH ROW BEGIN
    
    UPDATE Product
    SET ReviewCount = ReviewCount - 1
    WHERE ProductID = OLD.ProductID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping` (
  `ShippingID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `ShippingMethod` varchar(50) NOT NULL,
  `TrackingNumber` varchar(100) NOT NULL,
  `ShippingDate` date NOT NULL,
  `EstimatedDeliveryDate` date NOT NULL,
  PRIMARY KEY (`ShippingID`),
  KEY `OrderID` (`OrderID`),
  CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (1,1,'fast shipping','0987438293','2024-03-23','2024-03-29'),(2,11,'Standard','TRACK001','2024-03-21','2024-04-01'),(3,12,'Express','TRACK002','2024-03-24','2024-03-25'),(4,13,'Standard','TRACK003','2024-03-20','2024-04-03'),(5,14,'fast shipping','TRACK004','2024-03-27','2024-03-31'),(6,15,'Standard','TRACK005','2024-03-26','2024-03-28');
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `alternative_phone_number` varchar(15) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `houseNo` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `pincode` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `unique_Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'example_user','example_password','example@example.com','John','Doe','1234567890','8800682288','1990-02-12','11','timothy ','chennai','603203'),(2,'tiyamiya','ffhdj','tiyamiya@gmail.com','tiya','miya','345667576','345656786','1982-02-02','228','MBLOCK','chennI',NULL),(3,'user1','password1','user1@example.com','John','Doe','1234567890','9876543210','1990-01-01','123','Main Street','City1','12345'),(4,'user2','password2','user2@example.com','Jane','Smith','9876543210','1234567890','1995-05-05','456','Broadway','City2','54321'),(5,'user3','password3','user3@example.com','Alice','Johnson','5555555555','9999999999','1988-12-15','789','Oak Avenue','City3','67890'),(6,'user4','password4','user4@example.com','Bob','Brown','1111111111','2222222222','1975-07-20','101','Elm Street','City4','98765'),(7,'user5','password5','user5@example.com','Sarah','Williams','7777777777','8888888888','1998-03-10','202','Pine Road','City5','34567'),(8,'shibbolithic','dbms','akshita@gmail.com','akshita','sharma','9871618879','8800672233','2012-12-12','838','m block','chennai','603203'),(9,'DBMS','DBMS','DBMS@GMAIL.COM','DAS','GUPTA','8909129837','8909129839','2002-12-21','756','M BLOCK, SRM NAGAR','CHENNAI','603203'),(10,'pakhi','DBMS','DBMS@GMAIL.COM','DAS','GUPTA','8909129837','8909129839','2002-04-08','656','M BLOCK, SRM NAGAR','CHENNAI','603203');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `userorders`
--

DROP TABLE IF EXISTS `userorders`;
/*!50001 DROP VIEW IF EXISTS `userorders`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `userorders` AS SELECT 
 1 AS `UserID`,
 1 AS `Username`,
 1 AS `Email`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `OrderID`,
 1 AS `TotalAmount`,
 1 AS `OrderDate`,
 1 AS `ShippingAddress`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `userwishlist`
--

DROP TABLE IF EXISTS `userwishlist`;
/*!50001 DROP VIEW IF EXISTS `userwishlist`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `userwishlist` AS SELECT 
 1 AS `WishlistID`,
 1 AS `Username`,
 1 AS `ProductName`,
 1 AS `Description`,
 1 AS `Price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `WishlistID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `cartid` int DEFAULT NULL,
  PRIMARY KEY (`WishlistID`),
  KEY `UserID` (`UserID`),
  KEY `ProductID` (`ProductID`),
  KEY `cartid` (`cartid`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`),
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  CONSTRAINT `wishlist_ibfk_3` FOREIGN KEY (`cartid`) REFERENCES `cart` (`CartID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
INSERT INTO `wishlist` VALUES (1,1,11,1),(17,1,17,7),(18,2,20,8),(19,3,18,9),(20,4,19,10),(21,5,21,11);
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prevent_duplicate_wishlist_entries` BEFORE INSERT ON `wishlist` FOR EACH ROW BEGIN
    IF EXISTS (
        SELECT 1
        FROM Cart
        WHERE UserID = NEW.UserID
          AND ProductID = NEW.ProductID
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Product already exists in the cart';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `availablecoupons`
--

/*!50001 DROP VIEW IF EXISTS `availablecoupons`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `availablecoupons` AS select `coupon`.`CouponID` AS `CouponID`,`coupon`.`Code` AS `Code`,`coupon`.`DiscountPercentage` AS `DiscountPercentage`,`coupon`.`ExpirationDate` AS `ExpirationDate` from `coupon` where (`coupon`.`ExpirationDate` > curdate()) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customerdetails`
--

/*!50001 DROP VIEW IF EXISTS `customerdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerdetails` AS select `c`.`CustomerID` AS `CustomerID`,`u`.`Username` AS `Username`,`u`.`Email` AS `Email`,`u`.`FirstName` AS `FirstName`,`u`.`LastName` AS `LastName`,`u`.`PhoneNumber` AS `PhoneNumber` from (`customer` `c` join `user` `u` on((`c`.`UserID` = `u`.`UserID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customerorders`
--

/*!50001 DROP VIEW IF EXISTS `customerorders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customerorders` AS select `c`.`CustomerID` AS `CustomerID`,`u`.`Username` AS `Username`,`o`.`OrderID` AS `OrderID`,`o`.`TotalAmount` AS `TotalAmount`,`o`.`OrderDate` AS `OrderDate`,`o`.`Status` AS `Status` from ((`customer` `c` join `user` `u` on((`c`.`UserID` = `u`.`UserID`))) join `orders` `o` on((`c`.`OrderID` = `o`.`OrderID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inventorystatus`
--

/*!50001 DROP VIEW IF EXISTS `inventorystatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inventorystatus` AS select `p`.`ProductID` AS `ProductID`,`p`.`Name` AS `Name`,`p`.`Description` AS `Description`,`p`.`Price` AS `Price`,`i`.`Quantity` AS `Quantity` from (`product` `p` join `inventory` `i` on((`p`.`ProductID` = `i`.`ProductID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderdetails`
--

/*!50001 DROP VIEW IF EXISTS `orderdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderdetails` AS select `o`.`OrderID` AS `OrderID`,`u`.`Username` AS `Username`,`o`.`TotalAmount` AS `TotalAmount`,`o`.`OrderDate` AS `OrderDate` from (`orders` `o` join `user` `u` on((`o`.`UserID` = `u`.`UserID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderpaymentdetails`
--

/*!50001 DROP VIEW IF EXISTS `orderpaymentdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderpaymentdetails` AS select `o`.`OrderID` AS `OrderID`,`o`.`UserID` AS `UserID`,`o`.`TotalAmount` AS `TotalAmount`,`o`.`OrderDate` AS `OrderDate`,`o`.`ShippingAddress` AS `ShippingAddress`,`o`.`Status` AS `Status`,`p`.`PaymentMethod` AS `PaymentMethod`,`p`.`Amount` AS `PaymentAmount`,`p`.`PaymentDate` AS `PaymentDate` from (`orders` `o` join `payment` `p` on((`o`.`PaymentID` = `p`.`PaymentID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordershippingdetails`
--

/*!50001 DROP VIEW IF EXISTS `ordershippingdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordershippingdetails` AS select `o`.`OrderID` AS `OrderID`,`o`.`UserID` AS `UserID`,`o`.`TotalAmount` AS `TotalAmount`,`o`.`OrderDate` AS `OrderDate`,`o`.`ShippingAddress` AS `ShippingAddress`,`o`.`Status` AS `Status`,`s`.`ShippingMethod` AS `ShippingMethod`,`s`.`TrackingNumber` AS `TrackingNumber`,`s`.`ShippingDate` AS `ShippingDate`,`s`.`EstimatedDeliveryDate` AS `EstimatedDeliveryDate` from (`orders` `o` join `shipping` `s` on((`o`.`OrderID` = `s`.`OrderID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orderuseremail`
--

/*!50001 DROP VIEW IF EXISTS `orderuseremail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orderuseremail` AS select `o`.`OrderID` AS `OrderID`,`u`.`Email` AS `UserEmail`,`o`.`TotalAmount` AS `TotalAmount`,`o`.`OrderDate` AS `OrderDate`,`o`.`ShippingAddress` AS `ShippingAddress`,`o`.`Status` AS `Status` from (`orders` `o` join `user` `u` on((`o`.`UserID` = `u`.`UserID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productavgratingreviews`
--

/*!50001 DROP VIEW IF EXISTS `productavgratingreviews`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productavgratingreviews` AS select `p`.`ProductID` AS `ProductID`,`p`.`Name` AS `ProductName`,avg(`r`.`Rating`) AS `AvgRating`,count(`r`.`ReviewID`) AS `NumReviews` from (`product` `p` left join `review` `r` on((`p`.`ProductID` = `r`.`ProductID`))) group by `p`.`ProductID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productbrand`
--

/*!50001 DROP VIEW IF EXISTS `productbrand`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productbrand` AS select `p`.`ProductID` AS `ProductID`,`p`.`Name` AS `ProductName`,`p`.`Description` AS `Description`,`p`.`Price` AS `Price`,`b`.`Name` AS `BrandName` from (`product` `p` join `brand` `b` on((`p`.`BrandID` = `b`.`BrandID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productbrandcategory`
--

/*!50001 DROP VIEW IF EXISTS `productbrandcategory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productbrandcategory` AS select `p`.`ProductID` AS `ProductID`,`p`.`Name` AS `ProductName`,`p`.`Description` AS `Description`,`p`.`Price` AS `Price`,`b`.`Name` AS `BrandName`,`c`.`Name` AS `CategoryName` from ((`product` `p` join `brand` `b` on((`p`.`BrandID` = `b`.`BrandID`))) join `category` `c` on((`p`.`CategoryID` = `c`.`CategoryID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productcategory`
--

/*!50001 DROP VIEW IF EXISTS `productcategory`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productcategory` AS select `p`.`ProductID` AS `ProductID`,`p`.`Name` AS `ProductName`,`p`.`Description` AS `Description`,`p`.`Price` AS `Price`,`c`.`Name` AS `CategoryName` from (`product` `p` join `category` `c` on((`p`.`CategoryID` = `c`.`CategoryID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productinventoryquantity`
--

/*!50001 DROP VIEW IF EXISTS `productinventoryquantity`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productinventoryquantity` AS select `p`.`Name` AS `ProductName`,`c`.`Name` AS `CategoryName`,sum(`i`.`Quantity`) AS `TotalQuantity` from ((`product` `p` join `inventory` `i` on((`p`.`ProductID` = `i`.`ProductID`))) join `category` `c` on((`p`.`CategoryID` = `c`.`CategoryID`))) group by `p`.`ProductID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productreviews`
--

/*!50001 DROP VIEW IF EXISTS `productreviews`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `productreviews` AS select `r`.`ReviewID` AS `ReviewID`,`r`.`Rating` AS `Rating`,`r`.`ReviewText` AS `ReviewText`,`r`.`Date` AS `Date`,`u`.`Username` AS `Reviewer`,`p`.`Name` AS `ProductName` from ((`review` `r` join `user` `u` on((`r`.`UserID` = `u`.`UserID`))) join `product` `p` on((`r`.`ProductID` = `p`.`ProductID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userorders`
--

/*!50001 DROP VIEW IF EXISTS `userorders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userorders` AS select `u`.`UserID` AS `UserID`,`u`.`Username` AS `Username`,`u`.`Email` AS `Email`,`u`.`FirstName` AS `FirstName`,`u`.`LastName` AS `LastName`,`o`.`OrderID` AS `OrderID`,`o`.`TotalAmount` AS `TotalAmount`,`o`.`OrderDate` AS `OrderDate`,`o`.`ShippingAddress` AS `ShippingAddress`,`o`.`Status` AS `Status` from (`user` `u` join `orders` `o` on((`u`.`UserID` = `o`.`UserID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userwishlist`
--

/*!50001 DROP VIEW IF EXISTS `userwishlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userwishlist` AS select `w`.`WishlistID` AS `WishlistID`,`u`.`Username` AS `Username`,`p`.`Name` AS `ProductName`,`p`.`Description` AS `Description`,`p`.`Price` AS `Price` from ((`wishlist` `w` join `user` `u` on((`w`.`UserID` = `u`.`UserID`))) join `product` `p` on((`w`.`ProductID` = `p`.`ProductID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-13 15:25:32
