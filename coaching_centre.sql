-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: coaching_centre
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(10) NOT NULL,
  `batch_id` varchar(10) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` enum('Present','Absent') NOT NULL,
  PRIMARY KEY (`attendance_id`),
  UNIQUE KEY `student_id` (`student_id`,`batch_id`,`attendance_date`),
  KEY `batch_id` (`batch_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,'S-0001','B-001','2026-07-25','Present'),(2,'S-0002','B-001','2026-07-25','Absent'),(3,'S-0003','B-001','2026-07-25','Present'),(4,'S-0004','B-001','2026-07-25','Present'),(5,'S-0005','B-001','2026-07-25','Present'),(6,'S-0006','B-001','2026-07-25','Absent'),(7,'S-0007','B-001','2026-07-25','Present'),(8,'S-0008','B-001','2026-07-25','Present'),(9,'S-0009','B-001','2026-07-25','Absent'),(10,'S-0010','B-001','2026-07-25','Present'),(21,'S-0011','B-002','2026-07-16','Present'),(22,'S-0012','B-002','2026-07-16','Absent'),(23,'S-0013','B-002','2026-07-16','Present'),(24,'S-0014','B-002','2026-07-16','Present'),(25,'S-0015','B-002','2026-07-16','Absent'),(26,'S-0016','B-002','2026-07-16','Present'),(27,'S-0017','B-002','2026-07-16','Present'),(28,'S-0018','B-002','2026-07-16','Present'),(29,'S-0019','B-002','2026-07-16','Absent'),(30,'S-0020','B-002','2026-07-16','Present'),(31,'S-0021','B-003','2026-07-21','Present'),(32,'S-0022','B-003','2026-07-21','Present'),(33,'S-0023','B-003','2026-07-21','Absent'),(34,'S-0024','B-003','2026-07-21','Present'),(35,'S-0025','B-003','2026-07-21','Absent'),(36,'S-0026','B-003','2026-07-21','Present'),(37,'S-0027','B-003','2026-07-21','Present'),(38,'S-0028','B-003','2026-07-21','Absent'),(39,'S-0029','B-003','2026-07-21','Present'),(40,'S-0030','B-003','2026-07-21','Present'),(41,'S-0001','B-001','2026-07-23','Present'),(42,'S-0002','B-001','2026-07-23','Absent'),(43,'S-0003','B-001','2026-07-23','Present'),(44,'S-0004','B-001','2026-07-23','Present'),(45,'S-0005','B-001','2026-07-23','Absent'),(46,'S-0006','B-001','2026-07-23','Present'),(47,'S-0007','B-001','2026-07-23','Present'),(48,'S-0008','B-001','2026-07-23','Present'),(49,'S-0009','B-001','2026-07-23','Absent'),(50,'S-0010','B-001','2026-07-23','Present'),(51,'S-0031','B-004','2026-07-14','Present'),(52,'S-0032','B-004','2026-07-14','Absent'),(53,'S-0033','B-004','2026-07-14','Present'),(54,'S-0034','B-004','2026-07-14','Present'),(55,'S-0035','B-004','2026-07-14','Absent'),(56,'S-0036','B-004','2026-07-14','Present'),(57,'S-0037','B-004','2026-07-14','Present'),(58,'S-0038','B-004','2026-07-14','Present'),(59,'S-0039','B-004','2026-07-14','Present'),(60,'S-0040','B-004','2026-07-14','Absent'),(61,'S-0041','B-005','2026-07-11','Absent'),(62,'S-0042','B-005','2026-07-11','Absent'),(63,'S-0043','B-005','2026-07-11','Present'),(64,'S-0044','B-005','2026-07-11','Absent'),(65,'S-0045','B-005','2026-07-11','Present'),(66,'S-0046','B-005','2026-07-11','Absent'),(67,'S-0047','B-005','2026-07-11','Present'),(68,'S-0048','B-005','2026-07-11','Absent'),(69,'S-0049','B-005','2026-07-11','Absent'),(70,'S-0050','B-005','2026-07-11','Present');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_teachers`
--

DROP TABLE IF EXISTS `batch_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch_teachers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(10) NOT NULL,
  `teacher_id` varchar(10) NOT NULL,
  `subject` enum('Physics','Chemistry','Maths') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `batch_id` (`batch_id`,`subject`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `batch_teachers_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`batch_id`),
  CONSTRAINT `batch_teachers_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_teachers`
--

LOCK TABLES `batch_teachers` WRITE;
/*!40000 ALTER TABLE `batch_teachers` DISABLE KEYS */;
INSERT INTO `batch_teachers` VALUES (1,'B-001','T-0001','Physics'),(2,'B-001','T-0002','Maths'),(3,'B-001','T-0003','Chemistry'),(4,'B-002','T-0004','Physics'),(5,'B-002','T-0005','Maths'),(6,'B-002','T-0006','Chemistry'),(7,'B-003','T-0007','Physics'),(8,'B-003','T-0008','Maths'),(9,'B-003','T-0009','Chemistry'),(10,'B-004','T-0010','Physics'),(11,'B-004','T-0002','Maths'),(12,'B-004','T-0006','Chemistry'),(13,'B-005','T-0001','Physics'),(14,'B-005','T-0005','Maths'),(15,'B-005','T-0009','Chemistry');
/*!40000 ALTER TABLE `batch_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batches`
--

DROP TABLE IF EXISTS `batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batches` (
  `batch_id` varchar(10) NOT NULL,
  `batch_name` varchar(50) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batches`
--

LOCK TABLES `batches` WRITE;
/*!40000 ALTER TABLE `batches` DISABLE KEYS */;
INSERT INTO `batches` VALUES ('B-001','Class 11 Morning Batch','10:00:00','12:00:00'),('B-002','Class 11 Evening Batch','17:00:00','19:00:00'),('B-003','Class 12 Morning Batch','10:00:00','12:00:00'),('B-004','Class 12 Evening Batch','17:00:00','19:00:00'),('B-005','Class 12 Weekend Batch','10:00:00','13:00:00');
/*!40000 ALTER TABLE `batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creds`
--

DROP TABLE IF EXISTS `creds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creds` (
  `user_id` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('admin','teacher','student') NOT NULL,
  `linked_id` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creds`
--

LOCK TABLES `creds` WRITE;
/*!40000 ALTER TABLE `creds` DISABLE KEYS */;
INSERT INTO `creds` VALUES ('admin','admin@123','admin',NULL,'Administrator'),('S-0001','student@0001','student','S-0001','Rahul Yadav'),('S-0002','student@0002','student','S-0002','Shakshi Jain'),('S-0003','student@0003','student','S-0003','Arnav Choudhary'),('S-0004','student@0004','student','S-0004','Dhruv Singh'),('S-0005','student@0005','student','S-0005','Yashika Gupta'),('S-0006','student@0006','student','S-0006','Aarav Sharma'),('S-0007','student@0007','student','S-0007','Priya Singh'),('S-0008','student@0008','student','S-0008','Rohan Verma'),('S-0009','student@0009','student','S-0009','Sneha Patel'),('S-0010','student@0010','student','S-0010','Karan Mehta'),('S-0011','student@0011','student','S-0011','Ananya Gupta'),('S-0012','student@0012','student','S-0012','Vikram Joshi'),('S-0013','student@0013','student','S-0013','Neha Reddy'),('S-0014','student@0014','student','S-0014','Aditya Kumar'),('S-0015','student@0015','student','S-0015','Pooja Nair'),('S-0016','student@0016','student','S-0016','Manish Yadav'),('S-0017','student@0017','student','S-0017','Ishita Roy'),('S-0018','student@0018','student','S-0018','Arjun Malhotra'),('S-0019','student@0019','student','S-0019','Kavya Iyer'),('S-0020','student@0020','student','S-0020','Devansh Kapoor'),('S-0021','student@0021','student','S-0021','Meera Chawla'),('S-0022','student@0022','student','S-0022','Harsh Jain'),('S-0023','student@0023','student','S-0023','Ritika Das'),('S-0024','student@0024','student','S-0024','Yash Thakur'),('S-0025','student@0025','student','S-0025','Simran Kaur'),('S-0026','student@0026','student','S-0026','Nikhil Arora'),('S-0027','student@0027','student','S-0027','Tanvi Mishra'),('S-0028','student@0028','student','S-0028','Siddharth Rao'),('S-0029','student@0029','student','S-0029','Aisha Khan'),('S-0030','student@0030','student','S-0030','Om Prakash'),('S-0031','student@0031','student','S-0031','Riya Sharma'),('S-0032','student@0032','student','S-0032','Aryan Gupta'),('S-0033','student@0033','student','S-0033','Muskan Verma'),('S-0034','student@0034','student','S-0034','Shivam Tiwari'),('S-0035','student@0035','student','S-0035','Nandini Rao'),('S-0036','student@0036','student','S-0036','Akash Mishra'),('S-0037','student@0037','student','S-0037','Diya Kapoor'),('S-0038','student@0038','student','S-0038','Rahul Sinha'),('S-0039','student@0039','student','S-0039','Palak Jain'),('S-0040','student@0040','student','S-0040','Ayush Srivastava'),('S-0041','student@0041','student','S-0041','Krishna Menon'),('S-0042','student@0042','student','S-0042','Tanya Bhatia'),('S-0043','student@0043','student','S-0043','Ritesh Pandey'),('S-0044','student@0044','student','S-0044','Sakshi Kulkarni'),('S-0045','student@0045','student','S-0045','Varun Desai'),('S-0046','student@0046','student','S-0046','Aman Saxena'),('S-0047','student@0047','student','S-0047','Rohan Agarwal'),('S-0048','student@0048','student','S-0048','Nisha Sharma'),('S-0049','student@0049','student','S-0049','Harshit Gupta'),('S-0050','student@0050','student','S-0050','Aditi Mishra'),('T-0001','teacher@0001','teacher','T-0001','Rohit Saxena'),('T-0002','teacher@0002','teacher','T-0002','Ankita Sharma'),('T-0003','teacher@0003','teacher','T-0003','Vivek Bansal'),('T-0004','teacher@0004','teacher','T-0004','Shubham Arora'),('T-0005','teacher@0005','teacher','T-0005','Nidhi Kapoor'),('T-0006','teacher@0006','teacher','T-0006','Abhishek Tiwari'),('T-0007','teacher@0007','teacher','T-0007','Saurabh Mishra'),('T-0008','teacher@0008','teacher','T-0008','Ruchi Malhotra'),('T-0009','teacher@0009','teacher','T-0009','Deepak Khanna'),('T-0010','teacher@0010','teacher','T-0010','Kritika Sinha');
/*!40000 ALTER TABLE `creds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollments`
--

DROP TABLE IF EXISTS `enrollments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollments` (
  `enrollment_id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(10) NOT NULL,
  `batch_id` varchar(10) NOT NULL,
  `enrollment_date` date DEFAULT NULL,
  PRIMARY KEY (`enrollment_id`),
  UNIQUE KEY `student_id` (`student_id`,`batch_id`),
  KEY `batch_id` (`batch_id`),
  CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollments`
--

LOCK TABLES `enrollments` WRITE;
/*!40000 ALTER TABLE `enrollments` DISABLE KEYS */;
INSERT INTO `enrollments` VALUES (1,'S-0001','B-001','2026-05-01'),(2,'S-0002','B-001','2026-05-01'),(3,'S-0003','B-001','2026-05-01'),(4,'S-0004','B-001','2026-05-01'),(5,'S-0005','B-001','2026-05-01'),(6,'S-0006','B-001','2026-05-01'),(7,'S-0007','B-001','2026-05-01'),(8,'S-0008','B-001','2026-05-01'),(9,'S-0009','B-001','2026-05-01'),(10,'S-0010','B-001','2026-05-01'),(11,'S-0011','B-002','2026-05-01'),(12,'S-0012','B-002','2026-05-01'),(13,'S-0013','B-002','2026-05-01'),(14,'S-0014','B-002','2026-05-01'),(15,'S-0015','B-002','2026-05-01'),(16,'S-0016','B-002','2026-05-01'),(17,'S-0017','B-002','2026-05-01'),(18,'S-0018','B-002','2026-05-01'),(19,'S-0019','B-002','2026-05-01'),(20,'S-0020','B-002','2026-05-01'),(21,'S-0021','B-003','2026-05-01'),(22,'S-0022','B-003','2026-05-01'),(23,'S-0023','B-003','2026-05-01'),(24,'S-0024','B-003','2026-05-01'),(25,'S-0025','B-003','2026-05-01'),(26,'S-0026','B-003','2026-05-01'),(27,'S-0027','B-003','2026-05-01'),(28,'S-0028','B-003','2026-05-01'),(29,'S-0029','B-003','2026-05-01'),(30,'S-0030','B-003','2026-05-01'),(31,'S-0031','B-004','2026-05-01'),(32,'S-0032','B-004','2026-05-01'),(33,'S-0033','B-004','2026-05-01'),(34,'S-0034','B-004','2026-05-01'),(35,'S-0035','B-004','2026-05-01'),(36,'S-0036','B-004','2026-05-01'),(37,'S-0037','B-004','2026-05-01'),(38,'S-0038','B-004','2026-05-01'),(39,'S-0039','B-004','2026-05-01'),(40,'S-0040','B-004','2026-05-01'),(41,'S-0041','B-005','2026-05-01'),(42,'S-0042','B-005','2026-05-01'),(43,'S-0043','B-005','2026-05-01'),(44,'S-0044','B-005','2026-05-01'),(45,'S-0045','B-005','2026-05-01'),(46,'S-0046','B-005','2026-05-01'),(47,'S-0047','B-005','2026-05-01'),(48,'S-0048','B-005','2026-05-01'),(49,'S-0049','B-005','2026-05-01'),(50,'S-0050','B-005','2026-05-01');
/*!40000 ALTER TABLE `enrollments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fees`
--

DROP TABLE IF EXISTS `fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fees` (
  `fee_id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `due_date` date NOT NULL,
  `payment_date` date DEFAULT NULL,
  `status` enum('Paid','Unpaid') DEFAULT 'Unpaid',
  PRIMARY KEY (`fee_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fees`
--

LOCK TABLES `fees` WRITE;
/*!40000 ALTER TABLE `fees` DISABLE KEYS */;
INSERT INTO `fees` VALUES (1,'S-0001',12500.00,'2026-06-01','2026-05-25','Paid'),(2,'S-0002',12500.00,'2026-06-01',NULL,'Unpaid'),(3,'S-0003',12500.00,'2026-06-01','2026-05-27','Paid'),(4,'S-0004',12500.00,'2026-06-01',NULL,'Unpaid'),(5,'S-0005',12500.00,'2026-06-01','2026-05-28','Paid'),(6,'S-0006',12500.00,'2026-06-01','2026-05-28','Paid'),(7,'S-0007',12500.00,'2026-06-01',NULL,'Unpaid'),(8,'S-0008',12500.00,'2026-06-01','2026-05-29','Paid'),(9,'S-0009',12500.00,'2026-06-01','2026-05-29','Paid'),(10,'S-0010',12500.00,'2026-06-01',NULL,'Unpaid'),(11,'S-0011',12500.00,'2026-06-01','2026-05-25','Paid'),(12,'S-0012',12500.00,'2026-06-01','2026-05-25','Paid'),(13,'S-0013',12500.00,'2026-06-01',NULL,'Unpaid'),(14,'S-0014',12500.00,'2026-06-01','2026-05-27','Paid'),(15,'S-0015',12500.00,'2026-06-01','2026-05-27','Paid'),(16,'S-0016',12500.00,'2026-06-01',NULL,'Unpaid'),(17,'S-0017',12500.00,'2026-06-01','2026-05-28','Paid'),(18,'S-0018',12500.00,'2026-06-01','2026-05-28','Paid'),(19,'S-0019',12500.00,'2026-06-01',NULL,'Unpaid'),(20,'S-0020',12500.00,'2026-06-01','2026-05-29','Paid'),(21,'S-0021',15000.00,'2026-06-01','2026-05-25','Paid'),(22,'S-0022',15000.00,'2026-06-01',NULL,'Unpaid'),(23,'S-0023',15000.00,'2026-06-01','2026-05-26','Paid'),(24,'S-0024',15000.00,'2026-06-01','2026-05-26','Paid'),(25,'S-0025',15000.00,'2026-06-01',NULL,'Unpaid'),(26,'S-0026',15000.00,'2026-06-01','2026-05-27','Paid'),(27,'S-0027',15000.00,'2026-06-01','2026-05-27','Paid'),(28,'S-0028',15000.00,'2026-06-01',NULL,'Unpaid'),(29,'S-0029',15000.00,'2026-06-01','2026-05-28','Paid'),(30,'S-0030',15000.00,'2026-06-01','2026-05-28','Paid'),(31,'S-0031',15000.00,'2026-06-01',NULL,'Unpaid'),(32,'S-0032',15000.00,'2026-06-01','2026-05-25','Paid'),(33,'S-0033',15000.00,'2026-06-01','2026-05-25','Paid'),(34,'S-0034',15000.00,'2026-06-01',NULL,'Unpaid'),(35,'S-0035',15000.00,'2026-06-01','2026-05-26','Paid'),(36,'S-0036',15000.00,'2026-06-01','2026-05-26','Paid'),(37,'S-0037',15000.00,'2026-06-01',NULL,'Unpaid'),(38,'S-0038',15000.00,'2026-06-01','2026-05-27','Paid'),(39,'S-0039',15000.00,'2026-06-01','2026-05-27','Paid'),(40,'S-0040',15000.00,'2026-06-01',NULL,'Unpaid'),(41,'S-0041',15000.00,'2026-06-01','2026-05-28','Paid'),(42,'S-0042',15000.00,'2026-06-01','2026-05-28','Paid'),(43,'S-0043',15000.00,'2026-06-01',NULL,'Unpaid'),(44,'S-0044',15000.00,'2026-06-01','2026-05-29','Paid'),(45,'S-0045',15000.00,'2026-06-01','2026-05-29','Paid'),(46,'S-0046',15000.00,'2026-06-01',NULL,'Unpaid'),(47,'S-0047',15000.00,'2026-06-01','2026-05-30','Paid'),(48,'S-0048',15000.00,'2026-06-01','2026-05-30','Paid'),(49,'S-0049',15000.00,'2026-06-01',NULL,'Unpaid'),(50,'S-0050',15000.00,'2026-06-01','2026-05-30','Paid');
/*!40000 ALTER TABLE `fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `results` (
  `result_id` int NOT NULL AUTO_INCREMENT,
  `test_id` int NOT NULL,
  `student_id` varchar(10) NOT NULL,
  `marks_obtained` int NOT NULL,
  PRIMARY KEY (`result_id`),
  UNIQUE KEY `test_id` (`test_id`,`student_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `results_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`),
  CONSTRAINT `results_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,11,'S-0031',48),(2,11,'S-0032',42),(3,11,'S-0033',39),(4,11,'S-0034',47),(5,11,'S-0035',32),(6,11,'S-0036',11),(7,11,'S-0037',36),(8,11,'S-0038',15),(9,11,'S-0039',25),(10,11,'S-0040',50);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `class_level` varchar(20) DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('S-0001','Rahul Yadav','9876500001','Class 11','2026-05-01'),('S-0002','Shakshi Jain','9876500002','Class 11','2026-05-01'),('S-0003','Arnav Choudhary','9876500003','Class 11','2026-05-01'),('S-0004','Dhruv Singh','9876500004','Class 11','2026-05-01'),('S-0005','Yashika Gupta','9876500005','Class 11','2026-05-01'),('S-0006','Aarav Sharma','9876500006','Class 11','2026-05-01'),('S-0007','Priya Singh','9876500007','Class 11','2026-05-01'),('S-0008','Rohan Verma','9876500008','Class 11','2026-05-01'),('S-0009','Sneha Patel','9876500009','Class 11','2026-05-01'),('S-0010','Karan Mehta','9876500010','Class 11','2026-05-01'),('S-0011','Ananya Gupta','9876500011','Class 11','2026-05-01'),('S-0012','Vikram Joshi','9876500012','Class 11','2026-05-01'),('S-0013','Neha Reddy','9876500013','Class 11','2026-05-01'),('S-0014','Aditya Kumar','9876500014','Class 11','2026-05-01'),('S-0015','Pooja Nair','9876500015','Class 11','2026-05-01'),('S-0016','Manish Yadav','9876500016','Class 11','2026-05-01'),('S-0017','Ishita Roy','9876500017','Class 11','2026-05-01'),('S-0018','Arjun Malhotra','9876500018','Class 11','2026-05-01'),('S-0019','Kavya Iyer','9876500019','Class 11','2026-05-01'),('S-0020','Devansh Kapoor','9876500020','Class 11','2026-05-01'),('S-0021','Meera Chawla','9876500021','Class 11','2026-05-01'),('S-0022','Harsh Jain','9876500022','Class 11','2026-05-01'),('S-0023','Ritika Das','9876500023','Class 11','2026-05-01'),('S-0024','Yash Thakur','9876500024','Class 11','2026-05-01'),('S-0025','Simran Kaur','9876500025','Class 11','2026-05-01'),('S-0026','Nikhil Arora','9876500026','Class 12','2026-05-01'),('S-0027','Tanvi Mishra','9876500027','Class 12','2026-05-01'),('S-0028','Siddharth Rao','9876500028','Class 12','2026-05-01'),('S-0029','Aisha Khan','9876500029','Class 12','2026-05-01'),('S-0030','Om Prakash','9876500030','Class 12','2026-05-01'),('S-0031','Riya Sharma','9876500031','Class 12','2026-05-01'),('S-0032','Aryan Gupta','9876500032','Class 12','2026-05-01'),('S-0033','Muskan Verma','9876500033','Class 12','2026-05-01'),('S-0034','Shivam Tiwari','9876500034','Class 12','2026-05-01'),('S-0035','Nandini Rao','9876500035','Class 12','2026-05-01'),('S-0036','Akash Mishra','9876500036','Class 12','2026-05-01'),('S-0037','Diya Kapoor','9876500037','Class 12','2026-05-01'),('S-0038','Rahul Sinha','9876500038','Class 12','2026-05-01'),('S-0039','Palak Jain','9876500039','Class 12','2026-05-01'),('S-0040','Ayush Srivastava','9876500040','Class 12','2026-05-01'),('S-0041','Krishna Menon','9876500041','Class 12','2026-05-01'),('S-0042','Tanya Bhatia','9876500042','Class 12','2026-05-01'),('S-0043','Ritesh Pandey','9876500043','Class 12','2026-05-01'),('S-0044','Sakshi Kulkarni','9876500044','Class 12','2026-05-01'),('S-0045','Varun Desai','9876500045','Class 12','2026-05-01'),('S-0046','Aman Saxena','9876500046','Class 12','2026-05-01'),('S-0047','Rohan Agarwal','9876500047','Class 12','2026-05-01'),('S-0048','Nisha Sharma','9876500048','Class 12','2026-05-01'),('S-0049','Harshit Gupta','9876500049','Class 12','2026-05-01'),('S-0050','Aditi Mishra','9876500050','Class 12','2026-05-01');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teacher_id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `subject` enum('Physics','Chemistry','Maths') NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES ('T-0001','Rohit Saxena','Physics','9123400001'),('T-0002','Ankita Sharma','Maths','9123400002'),('T-0003','Vivek Bansal','Chemistry','9123400003'),('T-0004','Shubham Arora','Physics','9123400004'),('T-0005','Nidhi Kapoor','Maths','9123400005'),('T-0006','Abhishek Tiwari','Chemistry','9123400006'),('T-0007','Saurabh Mishra','Physics','9123400007'),('T-0008','Ruchi Malhotra','Maths','9123400008'),('T-0009','Deepak Khanna','Chemistry','9123400009'),('T-0010','Kritika Sinha','Physics','9123400010');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests` (
  `test_id` int NOT NULL AUTO_INCREMENT,
  `batch_id` varchar(10) NOT NULL,
  `subject` enum('Physics','Chemistry','Maths') NOT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `test_date` date NOT NULL,
  `max_marks` int NOT NULL,
  PRIMARY KEY (`test_id`),
  KEY `batch_id` (`batch_id`),
  CONSTRAINT `tests_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`batch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'B-001','Physics','Motion Test','2026-06-05',50),(2,'B-001','Maths','Sets Test','2026-06-07',50),(3,'B-001','Chemistry','Atomic Structure Test','2026-06-09',50),(4,'B-002','Physics','Units Test','2026-06-05',50),(5,'B-002','Maths','Relations Test','2026-06-07',50),(6,'B-002','Chemistry','Mole Concept Test','2026-06-09',50),(7,'B-003','Physics','Electrostatics Test','2026-06-05',50),(8,'B-003','Maths','Matrices Test','2026-06-07',50),(9,'B-003','Chemistry','Solutions Test','2026-06-09',50),(10,'B-004','Physics','Current Electricity Test','2026-06-05',50),(11,'B-004','Maths','Determinants Test','2026-06-07',50),(12,'B-004','Chemistry','Electrochemistry Test','2026-06-09',50),(13,'B-005','Physics','Magnetism Test','2026-06-05',50),(14,'B-005','Maths','Calculus Test','2026-06-07',50),(15,'B-005','Chemistry','Kinetics Test','2026-06-09',50);
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-28 21:28:02
