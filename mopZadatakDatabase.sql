CREATE DATABASE  IF NOT EXISTS `mop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mop`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: mop
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` int unsigned DEFAULT NULL,
  `questionid` int unsigned DEFAULT NULL,
  `answer` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `questionid` (`questionid`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`),
  CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`questionid`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,128,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),(2,54,150,'Nullam convallis ultrices venenatis'),(3,54,133,'Aenean commodo diam vitae'),(4,34,34,'hicula ac interdum a'),(5,34,130,'Aenean est lectus, dapibus id '),(6,44,131,'tricies quis, feugiat ut urna. Vivamusque erat'),(7,38,144,' blandit odio, et efficitur  nascetur ridiculus mus. Cras s'),(8,55,158,'justo pretium vestibulum. Aenean'),(9,54,157,'in vestibulum mauris, eu vestibulum eros. Don'),(10,42,156,' Donec scelerisque eu lorem ut volut'),(11,44,133,'Fusce in consequat nunc, '),(12,38,143,'a semper mi.'),(13,56,147,'Nullam ullamcorper'),(14,59,137,'leo eu imperdiet elementum,'),(15,45,155,'convallis metus. Mauris in vestibulum metus. Quisq'),(16,40,158,'vel aliquet ante tellus a ante'),(17,45,133,'nte arcu et erat. Fusce tempor justo id lacus accu'),(18,44,146,'n leo ex, placerat non ultrici'),(19,51,132,'feugiat ut urna. Vivamus sed lectus a'),(20,52,130,'s at nisi tincidunt congue ve'),(21,50,128,'Pellentesque lectus eros,'),(22,53,140,'ti va ac interdum ac, pretium at metuturient montes'),(23,42,140,'l lectus vestibulum egestas. Maecena'),(24,48,148,'rci. Aenean nec diam sed risus dapibus congue id eu e'),(25,55,150,'efficitur ante arcu et erat. Fusce tempor justo'),(26,1,139,'pellentesque justo, in euismod ligula sollicitudin id.In leo ex, placerat non'),(27,56,155,'r bibendum. Nunc ligula elit, '),(28,59,131,'ro ac, congue hendrerit enim. Nam sit am'),(29,44,131,'diam, sed dapibus risus. Su'),(30,45,139,' fermentum tellus. Pellentesque lacus erat, maximus sed erat id, sodales consectetur ex. Curabitur ma'),(31,55,149,'Nullam faucibus sollicitudin posuere.');
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `userid` int unsigned NOT NULL,
  `questionid` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`,`questionid`),
  KEY `questionid` (`questionid`),
  CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`),
  CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`questionid`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,128,'2020-10-20 08:23:32'),(34,34,'2020-10-20 08:23:32'),(34,151,'2020-10-20 08:23:32'),(37,128,'2020-10-20 08:23:32'),(38,133,'2020-10-20 08:23:32'),(41,128,'2020-10-20 08:23:32'),(42,158,'2020-10-20 08:23:32'),(43,133,'2020-10-20 08:23:32'),(44,131,'2020-10-20 08:23:32'),(44,132,'2020-10-20 08:23:32'),(44,136,'2020-10-20 08:23:32'),(44,144,'2020-10-20 08:23:32'),(44,149,'2020-10-20 08:23:32'),(44,153,'2020-10-20 08:23:32'),(47,133,'2020-10-20 08:23:32'),(47,144,'2020-10-20 08:23:32'),(48,143,'2020-10-20 08:23:32'),(51,128,'2020-10-20 08:23:32'),(54,139,'2020-10-20 08:23:32'),(55,128,'2020-10-20 08:23:32'),(55,133,'2020-10-20 08:23:32'),(55,141,'2020-10-20 08:23:32'),(59,128,'2020-10-20 12:50:28'),(59,130,'2020-10-20 08:23:32');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userid` int unsigned DEFAULT NULL,
  `question` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (2,1,'lorem ipsum'),(34,34,'hoce li ovo ikad proraditi?'),(128,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),(129,44,'Nullam convallis ultrices venenatis'),(130,54,'Aenean commodo diam vitae'),(131,34,'ccumsan dapibus.'),(132,34,'Aenean est lectus, dapibus id '),(133,34,'acus id, semper pellentesque erat'),(134,34,' Proin vitae ex ante. In at sem u'),(135,59,'justo pretium vestibulum. Aenean'),(136,34,'in vestibulum mauris, eu vestibulum eros. Don'),(137,34,' Donec scelerisque eu lorem ut volut'),(138,34,'Fusce in consequat nunc, '),(139,38,'a semper mi.'),(140,41,'Nullam ullamcorper'),(141,40,'leo eu imperdiet elementum,'),(142,45,'augue nisi aliquam tellus,'),(143,38,'vel aliquet ante tellus a ante'),(144,45,'Sed lectus purus,'),(145,44,'n leo ex, placerat non ultrici'),(146,42,'feugiat ut urna. Vivamus sed lectus a'),(147,52,'s at nisi tincidunt congue ve'),(148,50,'Pellentesque lectus eros,'),(149,49,'tibus et magnis dis parturient montes'),(150,42,'l lectus vestibulum egestas. Maecena'),(151,46,'rci. Aenean nec diam sed risus dapibus congue id eu e'),(152,55,'efficitur ante arcu et erat. Fusce tempor justo'),(153,52,'pretium at metus. Nulla sit a'),(154,56,'r bibendum. Nunc ligula elit, '),(155,59,'ro ac, congue hendrerit enim. Nam sit am'),(156,44,'diam, sed dapibus risus. Su'),(157,45,'volutpat, nisl se'),(158,55,'Nullam faucibus sollicitudin posuere.'),(159,60,'this is my question');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) DEFAULT NULL,
  `secondname` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'asaf','beg','mail@mail.com','cahngedpass'),(34,'asaf','kur','asaf@me.com','$2b$10$dRBH9G.rqcHctsnUqe9zJeKFzIz7MyekeH6UFa4WTr41FzPGuNvbi'),(37,'mejra','ic','mejra@ic.com','$2b$10$Vtu9cM5VZ8QU.is8E6h4AeIhRcdzsOgP1WXWrO8mDypfnMYDLbEHy'),(38,'John','Doe','john@gmail.com','$2b$10$QLQiPu7HkRxo0W1AX3qrROYHgExyjHDlDstkqbMDEOoklfBzjunJK'),(40,'Armin','Delic','delic@armin.com','$2b$10$Q4CALjXxw4pcXXx1o9gDdekaESYNC4vyl6b3AMAkejHfZuvpR5p9i'),(41,'Armina','Delalic','delic22@gmail.com','$2b$10$edHyGFNjxyoVOmFsJ1jppevDfN4xIstswkt4iKpjCAEOBQvkzuNTu'),(42,'Mubina','Begovic','begovic@gmail.com','$2b$10$eOHb1BRLgVx1aldsaEx40ugMGsAHHf04js.E/Ts36odsVcfn94wqq'),(43,'Kemo','Hajdar','moke@gmail.com','$2b$10$j4ztHUXwYKfAYjgWCNf87Os2uDpG8zg4Nko068wdIpZslnVxZC0/K'),(44,'Zijada','Grizic','zike@gmail.com','$2b$10$2CsTs1gSjTkppgk4KEVmCe5ijZqLJELQpdlwdtF9qwXmjkx0Vhb9y'),(45,'Enver','hadzic','enko@gmail.com','$2b$10$tGLIHFcI6mcwRmJSvCDpdO.lBlvB6EZZjUx9m2Tfv3yZ3jVmhKaty'),(46,'Buco','Buco','buco@gmail.com','$2b$10$qW7JNXJYGgvDIQfVJqe2PeX07L4MsNnVO3rd1apHBKm.cAnX.7aiG'),(47,'Arnel','Hodzic','hodzica@gmail.com','$2b$10$TgH/W0SeUboVEomBlYRXJ.SrrVIT10mjqR.pCce1wRVCPnoOu8JXW'),(48,'Amila','Alic','aalic@gmail.com','$2b$10$5DgdBPjOqKseD3m6CtSNjOvhsSloF.T63ufhZ.anm9O.Ps2ZMbBgW'),(49,'Peat','Petrovic','ppetar@gmail.com','$2b$10$ZwnK4ewFK4onkmEmrcl9U.1kLh.Dy1HSTDhqEZ.RdxzW6C2.hmKI2'),(50,'Ana','Nikolic','ana@gmail.com','$2b$10$3X5wj3RpTRqzD0b0CmTuz.fXyljbLAujnH943QihwzzsD2uEhAcya'),(51,'Chris','Prat','chris@gmail.com','$2b$10$Q8YYCoqMkNNkzIpmSNF8X..CJm/MS49WnZmm1SElq2mz6k8FWguqG'),(52,'Jason','Statham','js@gmail.com','$2b$10$OaOwn9CzBfRdQyqCRsIKe.KYbil/aiqQE2Y/ZtgmHxWjCBL.I8eDy'),(53,'React','Redux','javascript@gmail.com','$2b$10$.xIgRIVNv7rcjG2dpoL7HeDwQGlWcbk2GncBzmqQLuRbmy/08xrYq'),(54,'Java','Script','language@gmail.com','$2b$10$X4i5zO43eKGm4QLwRpVXo.UMFBmtBfV6aZw6OE4zVNa1jPb.vAYHS'),(55,'Huso','Hasic','hasic@gmail.com','$2b$10$ks8kkCS.APtlMzCkWjDLTOU5iCz98To1xRWdZ6gl3hxt6cZg3xK5O'),(56,'Harun','Hasic','harunhasic@gmail.com','$2b$10$xjT3vWLsUeXyI1n0v/jqx.qRawUM7qPBjCqLVRQh.p0ONc9jVxioq'),(57,'Harun','Zukic','zukic@gmail.com','$2b$10$d/g.nHGlf1/mXlR9zGfFl.ufVAXJfEfx3R3XNKSq2pPCGCXAibxWm'),(58,'Hasib','Zukic','drzukic@gmail.com','$2b$10$w5VPnqVIzoWwOOqJ4jr17u9/CGB8EdaE1dqPspAygCBl3Z0ShACgu'),(59,'Dzelila','Someone','sdzelila@gmail.com','$2b$10$mxWIIvtvrYH.c44HZm2jw.YAP6tRq4aILsoBgUCEl.Df/rvB3MqZW'),(60,'New','Profile','newprofile@mop.com','$2b$10$Qt32kQ8RBo2/jjhAXLa.2.krJU86J/AB5G4u2I4kWtE2rQkm.J1g2');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-21 11:44:03
