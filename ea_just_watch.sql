-- MySQL dump 10.13  Distrib 5.7.24, for osx11.1 (x86_64)
--
-- Host: localhost    Database: just_watch
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cast_member`
--

DROP TABLE IF EXISTS `cast_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cast_member` (
  `cast_id` int NOT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(40) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `bio` tinytext,
  PRIMARY KEY (`cast_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast_member`
--

LOCK TABLES `cast_member` WRITE;
/*!40000 ALTER TABLE `cast_member` DISABLE KEYS */;
INSERT INTO `cast_member` VALUES (11,'Millie','Bobby Brown','2004-02-19','English actress and producer known for her role as Eleven in Stranger Things'),(21,'Bryan','Cranston','1956-03-07','American actor, director, and producer, best known for his role as Walter White in Breaking Bad'),(31,'Pedro','Pascal','1975-04-02','Chilean-American actor known for his roles in The Mandalorian and Game of Thrones'),(41,'Jennifer','Aniston','1969-02-11','American actress and producer, best known for her role as Rachel Green in Friends'),(51,'Timothée','Chalamet','1995-12-27','French-American actor known for his roles in Call Me by Your Name and Dune'),(61,'Emilia','Clarke','1986-10-23','English actress known for her role as Daenerys Targaryen in Game of Thrones');
/*!40000 ALTER TABLE `cast_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast_stars_in_movie`
--

DROP TABLE IF EXISTS `cast_stars_in_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cast_stars_in_movie` (
  `cast_id` int NOT NULL,
  `movie_id` int NOT NULL,
  PRIMARY KEY (`cast_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `cast_stars_in_movie_ibfk_1` FOREIGN KEY (`cast_id`) REFERENCES `cast_member` (`cast_id`),
  CONSTRAINT `cast_stars_in_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast_stars_in_movie`
--

LOCK TABLES `cast_stars_in_movie` WRITE;
/*!40000 ALTER TABLE `cast_stars_in_movie` DISABLE KEYS */;
INSERT INTO `cast_stars_in_movie` VALUES (11,103),(21,203),(31,303),(41,403),(51,503),(61,603);
/*!40000 ALTER TABLE `cast_stars_in_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast_stars_in_movie_role`
--

DROP TABLE IF EXISTS `cast_stars_in_movie_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cast_stars_in_movie_role` (
  `cast_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`cast_id`,`movie_id`,`role`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `cast_stars_in_movie_role_ibfk_1` FOREIGN KEY (`cast_id`) REFERENCES `cast_member` (`cast_id`),
  CONSTRAINT `cast_stars_in_movie_role_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast_stars_in_movie_role`
--

LOCK TABLES `cast_stars_in_movie_role` WRITE;
/*!40000 ALTER TABLE `cast_stars_in_movie_role` DISABLE KEYS */;
INSERT INTO `cast_stars_in_movie_role` VALUES (11,103,'Producer'),(21,203,'Director'),(31,303,'Producer'),(41,403,'Actress'),(51,503,'Actor'),(61,603,'Actress');
/*!40000 ALTER TABLE `cast_stars_in_movie_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast_stars_in_season`
--

DROP TABLE IF EXISTS `cast_stars_in_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cast_stars_in_season` (
  `cast_id` int NOT NULL,
  `show_id` int NOT NULL,
  PRIMARY KEY (`cast_id`,`show_id`),
  KEY `show_id` (`show_id`),
  CONSTRAINT `cast_stars_in_season_ibfk_1` FOREIGN KEY (`cast_id`) REFERENCES `cast_member` (`cast_id`),
  CONSTRAINT `cast_stars_in_season_ibfk_2` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast_stars_in_season`
--

LOCK TABLES `cast_stars_in_season` WRITE;
/*!40000 ALTER TABLE `cast_stars_in_season` DISABLE KEYS */;
INSERT INTO `cast_stars_in_season` VALUES (11,104),(21,204),(31,304),(41,404),(51,504),(61,604);
/*!40000 ALTER TABLE `cast_stars_in_season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast_stars_in_season_role`
--

DROP TABLE IF EXISTS `cast_stars_in_season_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cast_stars_in_season_role` (
  `cast_id` int NOT NULL,
  `show_id` int NOT NULL,
  `role` varchar(20) NOT NULL,
  PRIMARY KEY (`cast_id`,`show_id`,`role`),
  KEY `show_id` (`show_id`),
  CONSTRAINT `cast_stars_in_season_role_ibfk_1` FOREIGN KEY (`cast_id`) REFERENCES `cast_member` (`cast_id`),
  CONSTRAINT `cast_stars_in_season_role_ibfk_2` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast_stars_in_season_role`
--

LOCK TABLES `cast_stars_in_season_role` WRITE;
/*!40000 ALTER TABLE `cast_stars_in_season_role` DISABLE KEYS */;
INSERT INTO `cast_stars_in_season_role` VALUES (11,104,'Filmmaker'),(21,204,'Supporting Actor'),(31,304,'Extra'),(41,404,'Actor'),(51,504,'Lead Actress'),(61,604,'Lead Actress');
/*!40000 ALTER TABLE `cast_stars_in_season_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode_language_audio`
--

DROP TABLE IF EXISTS `episode_language_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode_language_audio` (
  `episode_id` int NOT NULL,
  `language_audio` varchar(20) NOT NULL,
  PRIMARY KEY (`episode_id`,`language_audio`),
  CONSTRAINT `episode_language_audio_ibfk_1` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`episode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode_language_audio`
--

LOCK TABLES `episode_language_audio` WRITE;
/*!40000 ALTER TABLE `episode_language_audio` DISABLE KEYS */;
INSERT INTO `episode_language_audio` VALUES (106,'Spanish'),(206,'Mandarin'),(306,'Tagalog'),(406,'English'),(506,'Italian'),(606,'Korean');
/*!40000 ALTER TABLE `episode_language_audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episodes`
--

DROP TABLE IF EXISTS `episodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episodes` (
  `episode_id` int NOT NULL,
  `season_id` int DEFAULT NULL,
  `synopsis` tinytext,
  `episode_name` varchar(50) DEFAULT NULL,
  `episode_description` tinytext,
  `release_date` date DEFAULT NULL,
  `episode_no` int DEFAULT NULL,
  PRIMARY KEY (`episode_id`),
  KEY `season_id` (`season_id`),
  CONSTRAINT `episodes_ibfk_1` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`season_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodes`
--

LOCK TABLES `episodes` WRITE;
/*!40000 ALTER TABLE `episodes` DISABLE KEYS */;
INSERT INTO `episodes` VALUES (106,105,'The Vanishing of Will Byers','Chapter One','The disappearance of a young boy and the appearance of a girl with psychokinetic abilities','2016-07-15',1),(206,205,'Ozymandias','Season 5, Episode 14','The climactic downfall of Walter White','2008-01-20',14),(306,305,'The Mandalorian','Chapter 1: The Mandalorian','The Mandalorian takes on a mysterious bounty','2019-11-12',1),(406,405,'The One Where Everybody Finds Out','Season 5, Episode 14','Friends discover the secret romance between Monica and Chandler','1994-09-22',14),(506,505,'Dinner Party','Season 4, Episode 13','The employees attend a disastrous dinner party hosted by Michael Scott','2008-04-10',13),(606,605,'Battle of the Bastards','Season 6, Episode 9','Jon Snow and Ramsay Bolton face off in a battle for Winterfell','2016-06-19',9);
/*!40000 ALTER TABLE `episodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episodes_language_subtitle`
--

DROP TABLE IF EXISTS `episodes_language_subtitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episodes_language_subtitle` (
  `episode_id` int NOT NULL,
  `language_subtitle` varchar(20) NOT NULL,
  PRIMARY KEY (`episode_id`,`language_subtitle`),
  CONSTRAINT `episodes_language_subtitle_ibfk_1` FOREIGN KEY (`episode_id`) REFERENCES `episodes` (`episode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episodes_language_subtitle`
--

LOCK TABLES `episodes_language_subtitle` WRITE;
/*!40000 ALTER TABLE `episodes_language_subtitle` DISABLE KEYS */;
INSERT INTO `episodes_language_subtitle` VALUES (106,'English'),(206,'French'),(306,'Arabic'),(406,'Portuguese'),(506,'German'),(606,'Japanese');
/*!40000 ALTER TABLE `episodes_language_subtitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_movie`
--

DROP TABLE IF EXISTS `genre_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_movie` (
  `movie_id` int NOT NULL,
  `genre` varchar(20) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre`),
  CONSTRAINT `genre_movie_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_movie`
--

LOCK TABLES `genre_movie` WRITE;
/*!40000 ALTER TABLE `genre_movie` DISABLE KEYS */;
INSERT INTO `genre_movie` VALUES (103,'Action'),(203,'Drama'),(303,'Action'),(403,'Crime'),(503,'Drama'),(603,'Crime');
/*!40000 ALTER TABLE `genre_movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre_show`
--

DROP TABLE IF EXISTS `genre_show`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre_show` (
  `show_id` int NOT NULL,
  `genre` varchar(20) NOT NULL,
  PRIMARY KEY (`show_id`,`genre`),
  CONSTRAINT `genre_show_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre_show`
--

LOCK TABLES `genre_show` WRITE;
/*!40000 ALTER TABLE `genre_show` DISABLE KEYS */;
INSERT INTO `genre_show` VALUES (104,'Drama'),(204,'Crime'),(304,'Action'),(404,'Comedy'),(504,'Comedy'),(604,'Drama');
/*!40000 ALTER TABLE `genre_show` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_language_audio`
--

DROP TABLE IF EXISTS `movie_language_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_language_audio` (
  `movie_id` int NOT NULL,
  `language_audio` varchar(20) NOT NULL,
  PRIMARY KEY (`movie_id`,`language_audio`),
  CONSTRAINT `movie_language_audio_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_language_audio`
--

LOCK TABLES `movie_language_audio` WRITE;
/*!40000 ALTER TABLE `movie_language_audio` DISABLE KEYS */;
INSERT INTO `movie_language_audio` VALUES (103,'English'),(203,'French'),(303,'Italian'),(403,'Spanish'),(503,'German'),(603,'Portuguese');
/*!40000 ALTER TABLE `movie_language_audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_language_subtitle`
--

DROP TABLE IF EXISTS `movie_language_subtitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_language_subtitle` (
  `movie_id` int NOT NULL,
  `language_subtitle` varchar(20) NOT NULL,
  PRIMARY KEY (`movie_id`,`language_subtitle`),
  CONSTRAINT `movie_language_subtitle_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_language_subtitle`
--

LOCK TABLES `movie_language_subtitle` WRITE;
/*!40000 ALTER TABLE `movie_language_subtitle` DISABLE KEYS */;
INSERT INTO `movie_language_subtitle` VALUES (103,'Igbo'),(203,'Haitian Creole'),(303,'Hausa'),(403,'Fulani'),(503,'Japanese'),(603,'Mandarin');
/*!40000 ALTER TABLE `movie_language_subtitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
  `movie_id` int NOT NULL,
  `movie_title` varchar(45) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `synopsis` tinytext,
  `age_rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  `runtime` int DEFAULT NULL,
  `movie_rating` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (103,'Inception','2010-07-16','A thief enters the dreams of others to steal their secrets','PG-13',148,'8.8'),(203,'The Shawshank Redemption','1994-09-10','Two imprisoned men find redemption through acts of common decency','R',142,'9.3'),(303,'The Dark Knight','2008-07-18','Batman faces the Joker, a criminal mastermind','PG-13',152,'9.0'),(403,'Pulp Fiction','1994-10-14','Interwoven stories of crime and redemption','R',154,'8.9'),(503,'Forrest Gump','1994-07-06','A man experiences many historical events unknowingly','PG-13',142,'8.8'),(603,'The Godfather','1972-03-24','The aging patriarch of an organized crime dynasty transfers control to his reluctant son','R',175,'9.2');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_country_produced`
--

DROP TABLE IF EXISTS `movies_country_produced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_country_produced` (
  `movie_id` int NOT NULL,
  `country` varchar(30) NOT NULL,
  PRIMARY KEY (`movie_id`,`country`),
  CONSTRAINT `movies_country_produced_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_country_produced`
--

LOCK TABLES `movies_country_produced` WRITE;
/*!40000 ALTER TABLE `movies_country_produced` DISABLE KEYS */;
INSERT INTO `movies_country_produced` VALUES (103,'USA'),(203,'USA'),(303,'USA'),(403,'USA'),(503,'USA'),(603,'USA');
/*!40000 ALTER TABLE `movies_country_produced` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_price_quality`
--

DROP TABLE IF EXISTS `movies_price_quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies_price_quality` (
  `streaming_service_id` int NOT NULL,
  `movie_id` int NOT NULL,
  `quality` enum('free','SD','HD','4K') NOT NULL,
  `rent_price` varchar(7) DEFAULT NULL,
  `buy_price` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`streaming_service_id`,`movie_id`,`quality`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `movies_price_quality_ibfk_1` FOREIGN KEY (`streaming_service_id`) REFERENCES `streaming_service` (`streaming_service_id`),
  CONSTRAINT `movies_price_quality_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_price_quality`
--

LOCK TABLES `movies_price_quality` WRITE;
/*!40000 ALTER TABLE `movies_price_quality` DISABLE KEYS */;
INSERT INTO `movies_price_quality` VALUES (101,103,'SD','2.99','9.99'),(201,203,'HD','4.99','14.99'),(301,303,'4K','7.99','19.99'),(401,403,'SD','3.99','11.99'),(501,503,'HD','5.99','16.99'),(601,603,'4K','8.99','24.99');
/*!40000 ALTER TABLE `movies_price_quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seasons`
--

DROP TABLE IF EXISTS `seasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seasons` (
  `season_id` int NOT NULL,
  `show_id` int DEFAULT NULL,
  `season_no` int DEFAULT NULL,
  `synopsis` tinytext,
  `runtime` int DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  PRIMARY KEY (`season_id`),
  KEY `show_id` (`show_id`),
  CONSTRAINT `seasons_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seasons`
--

LOCK TABLES `seasons` WRITE;
/*!40000 ALTER TABLE `seasons` DISABLE KEYS */;
INSERT INTO `seasons` VALUES (105,104,1,'Strange occurrences in Hawkins continue',50,'2016-07-15'),(205,204,3,'Chemistry teacher Walter White descends into the criminal underworld',47,'2008-01-20'),(305,304,2,'The Mandalorian continues his quest in a galaxy far, far away',40,'2019-11-12'),(405,404,5,'Adventures and misadventures of six friends in New York City',22,'1994-09-22'),(505,504,7,'The employees of Dunder Mifflin deal with various challenges and shenanigans',23,'2005-03-24'),(605,604,8,'Power struggles and battles for the Iron Throne intensify in Westeros',60,'2011-04-17');
/*!40000 ALTER TABLE `seasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows`
--

DROP TABLE IF EXISTS `shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shows` (
  `show_id` int NOT NULL,
  `show_title` varchar(45) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `age_rating` enum('TV-Y','TV-Y7','TV-Y7 FV','TV-G','TV-PG','TV-14','TV-MA') DEFAULT NULL,
  `show_rating` varchar(7) DEFAULT NULL,
  `synopsis` tinytext,
  `runtime` int DEFAULT NULL,
  PRIMARY KEY (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows`
--

LOCK TABLES `shows` WRITE;
/*!40000 ALTER TABLE `shows` DISABLE KEYS */;
INSERT INTO `shows` VALUES (104,'Stranger Things','2016-07-15','TV-14','8.7','A group of kids in a small town encounter supernatural forces',50),(204,'Breaking Bad','2008-01-20','TV-MA','9.5','A high school chemistry teacher turns to cooking and selling methamphetamine',47),(304,'The Mandalorian','2019-11-12','TV-14','8.7','A lone bounty hunter explores the outer reaches of the galaxy',40),(404,'Friends','1994-09-22','TV-14','8.9','A group of friends living in New York City navigate life and love',22),(504,'The Office','2005-03-24','TV-14','8.9','The daily lives of office employees in the Scranton, Pennsylvania branch of the fictional Dunder Mifflin Paper Company',22),(604,'Game of Thrones','2011-04-17','TV-MA','9.3','Noble families vie for control of the Iron Throne in the Seven Kingdoms of Westeros',57);
/*!40000 ALTER TABLE `shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows_country_produced`
--

DROP TABLE IF EXISTS `shows_country_produced`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shows_country_produced` (
  `show_id` int NOT NULL,
  `country` varchar(30) NOT NULL,
  PRIMARY KEY (`show_id`,`country`),
  CONSTRAINT `shows_country_produced_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows_country_produced`
--

LOCK TABLES `shows_country_produced` WRITE;
/*!40000 ALTER TABLE `shows_country_produced` DISABLE KEYS */;
INSERT INTO `shows_country_produced` VALUES (104,'USA'),(204,'USA'),(304,'USA'),(404,'USA'),(504,'USA'),(604,'USA');
/*!40000 ALTER TABLE `shows_country_produced` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows_language_audio`
--

DROP TABLE IF EXISTS `shows_language_audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shows_language_audio` (
  `show_id` int NOT NULL,
  `language_audio` varchar(20) NOT NULL,
  PRIMARY KEY (`show_id`,`language_audio`),
  CONSTRAINT `shows_language_audio_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows_language_audio`
--

LOCK TABLES `shows_language_audio` WRITE;
/*!40000 ALTER TABLE `shows_language_audio` DISABLE KEYS */;
INSERT INTO `shows_language_audio` VALUES (104,'English'),(204,'Spanish'),(304,'French'),(404,'Korean'),(504,'Portuguese'),(604,'Japanese');
/*!40000 ALTER TABLE `shows_language_audio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows_language_subtitle`
--

DROP TABLE IF EXISTS `shows_language_subtitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shows_language_subtitle` (
  `show_id` int NOT NULL,
  `language_subtitle` varchar(20) NOT NULL,
  PRIMARY KEY (`show_id`,`language_subtitle`),
  CONSTRAINT `shows_language_subtitle_ibfk_1` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows_language_subtitle`
--

LOCK TABLES `shows_language_subtitle` WRITE;
/*!40000 ALTER TABLE `shows_language_subtitle` DISABLE KEYS */;
INSERT INTO `shows_language_subtitle` VALUES (104,'Japanese'),(204,'English'),(304,'French'),(404,'Urdu'),(504,'Spanish'),(604,'Chinese');
/*!40000 ALTER TABLE `shows_language_subtitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shows_price_quality`
--

DROP TABLE IF EXISTS `shows_price_quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shows_price_quality` (
  `streaming_service_id` int NOT NULL,
  `show_id` int NOT NULL,
  `quality` enum('free','SD','HD','4K') NOT NULL,
  `rent_price` varchar(7) DEFAULT NULL,
  `buy_price` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`streaming_service_id`,`show_id`,`quality`),
  KEY `show_id` (`show_id`),
  CONSTRAINT `shows_price_quality_ibfk_1` FOREIGN KEY (`streaming_service_id`) REFERENCES `streaming_service` (`streaming_service_id`),
  CONSTRAINT `shows_price_quality_ibfk_2` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shows_price_quality`
--

LOCK TABLES `shows_price_quality` WRITE;
/*!40000 ALTER TABLE `shows_price_quality` DISABLE KEYS */;
INSERT INTO `shows_price_quality` VALUES (101,104,'SD','2.99','9.99'),(201,204,'HD','4.99','14.99'),(301,304,'4K','7.99','19.99'),(401,404,'SD','3.99','11.99'),(501,504,'HD','5.99','16.99'),(601,604,'4K','8.99','24.99');
/*!40000 ALTER TABLE `shows_price_quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sporting_event`
--

DROP TABLE IF EXISTS `sporting_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sporting_event` (
  `event_id` int NOT NULL,
  `event_name` varchar(50) DEFAULT NULL,
  `competition` varchar(30) DEFAULT NULL,
  `airdate` date DEFAULT NULL,
  `venue` varchar(30) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sporting_event`
--

LOCK TABLES `sporting_event` WRITE;
/*!40000 ALTER TABLE `sporting_event` DISABLE KEYS */;
INSERT INTO `sporting_event` VALUES (12,'Super Bowl LVI','American Football','2023-11-19','SoFi Stadium','19:15:00','22:29:00'),(22,'FIFA World Cup Final','Soccer','2022-12-18','Lusail Iconic Stadium','20:00:00','23:00:00'),(32,'NBA Finals','Basketball','2023-06-10','Staples Center','20:00:00','23:00:00'),(42,'Ice Hockey World Championship','Ice Hockey','2023-11-19','Olympic Stadium','19:00:00','22:29:00'),(52,'Wimbledon Men\'s Final','Tennis','2023-07-16','All England Tennis Club','14:00:00','17:00:00'),(62,'World Series','Baseball','2023-10-28','Dodger Stadium','19:30:00','23:00:00');
/*!40000 ALTER TABLE `sporting_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sporting_event_participants`
--

DROP TABLE IF EXISTS `sporting_event_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sporting_event_participants` (
  `event_id` int NOT NULL,
  `participant_name` varchar(30) NOT NULL,
  PRIMARY KEY (`event_id`,`participant_name`),
  CONSTRAINT `sporting_event_participants_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `sporting_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sporting_event_participants`
--

LOCK TABLES `sporting_event_participants` WRITE;
/*!40000 ALTER TABLE `sporting_event_participants` DISABLE KEYS */;
INSERT INTO `sporting_event_participants` VALUES (12,'Chiefs'),(12,'Eagles'),(22,'Argentina'),(22,'France'),(32,'Boston Celtics'),(32,'Bulls'),(42,'Detroit Red Wings'),(42,'Florida Panthers'),(52,'Alcaraz'),(52,'Medvedez'),(62,'Mets'),(62,'Yankees');
/*!40000 ALTER TABLE `sporting_event_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sporting_events_price_quality`
--

DROP TABLE IF EXISTS `sporting_events_price_quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sporting_events_price_quality` (
  `streaming_service_id` int NOT NULL,
  `event_id` int NOT NULL,
  `quality` enum('free','SD','HD','4K') NOT NULL,
  `rent_price` varchar(7) DEFAULT NULL,
  `buy_price` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`streaming_service_id`,`event_id`,`quality`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `sporting_events_price_quality_ibfk_1` FOREIGN KEY (`streaming_service_id`) REFERENCES `streaming_service` (`streaming_service_id`),
  CONSTRAINT `sporting_events_price_quality_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `sporting_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sporting_events_price_quality`
--

LOCK TABLES `sporting_events_price_quality` WRITE;
/*!40000 ALTER TABLE `sporting_events_price_quality` DISABLE KEYS */;
INSERT INTO `sporting_events_price_quality` VALUES (101,12,'SD','1.99','7.99'),(201,22,'HD','3.99','12.99'),(301,32,'4K','6.99','19.99'),(401,42,'SD','2.99','9.99'),(501,52,'HD','4.99','14.99'),(601,62,'4K','7.99','24.99');
/*!40000 ALTER TABLE `sporting_events_price_quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streaming_service`
--

DROP TABLE IF EXISTS `streaming_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streaming_service` (
  `streaming_service_id` int NOT NULL,
  `streaming_service_name` varchar(20) DEFAULT NULL,
  `streaming_service_url` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`streaming_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streaming_service`
--

LOCK TABLES `streaming_service` WRITE;
/*!40000 ALTER TABLE `streaming_service` DISABLE KEYS */;
INSERT INTO `streaming_service` VALUES (101,'Netflix','www.netflix.com'),(201,'Hulu','www.hulu.com'),(301,'Amazon Prime Video','www.amazon.com/Prime-Video'),(401,'Disney+','www.disneyplus.com'),(501,'Apple TV+','www.apple.com/tv-plus'),(601,'HBO Max','www.hbomax.com');
/*!40000 ALTER TABLE `streaming_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streaming_service_streams_movies`
--

DROP TABLE IF EXISTS `streaming_service_streams_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streaming_service_streams_movies` (
  `streaming_service_id` int NOT NULL,
  `movie_id` int NOT NULL,
  PRIMARY KEY (`streaming_service_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `streaming_service_streams_movies_ibfk_1` FOREIGN KEY (`streaming_service_id`) REFERENCES `streaming_service` (`streaming_service_id`),
  CONSTRAINT `streaming_service_streams_movies_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streaming_service_streams_movies`
--

LOCK TABLES `streaming_service_streams_movies` WRITE;
/*!40000 ALTER TABLE `streaming_service_streams_movies` DISABLE KEYS */;
INSERT INTO `streaming_service_streams_movies` VALUES (101,103),(201,203),(301,303),(401,403),(501,503),(601,603);
/*!40000 ALTER TABLE `streaming_service_streams_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streaming_service_streams_shows`
--

DROP TABLE IF EXISTS `streaming_service_streams_shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streaming_service_streams_shows` (
  `streaming_service_id` int NOT NULL,
  `show_id` int NOT NULL,
  PRIMARY KEY (`streaming_service_id`,`show_id`),
  KEY `show_id` (`show_id`),
  CONSTRAINT `streaming_service_streams_shows_ibfk_1` FOREIGN KEY (`streaming_service_id`) REFERENCES `streaming_service` (`streaming_service_id`),
  CONSTRAINT `streaming_service_streams_shows_ibfk_2` FOREIGN KEY (`show_id`) REFERENCES `shows` (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streaming_service_streams_shows`
--

LOCK TABLES `streaming_service_streams_shows` WRITE;
/*!40000 ALTER TABLE `streaming_service_streams_shows` DISABLE KEYS */;
INSERT INTO `streaming_service_streams_shows` VALUES (101,104),(201,204),(301,304),(401,404),(501,504),(601,604);
/*!40000 ALTER TABLE `streaming_service_streams_shows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streaming_service_streams_sporting_events`
--

DROP TABLE IF EXISTS `streaming_service_streams_sporting_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `streaming_service_streams_sporting_events` (
  `streaming_service_id` int NOT NULL,
  `event_id` int NOT NULL,
  PRIMARY KEY (`streaming_service_id`,`event_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `streaming_service_streams_sporting_events_ibfk_1` FOREIGN KEY (`streaming_service_id`) REFERENCES `streaming_service` (`streaming_service_id`),
  CONSTRAINT `streaming_service_streams_sporting_events_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `sporting_event` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streaming_service_streams_sporting_events`
--

LOCK TABLES `streaming_service_streams_sporting_events` WRITE;
/*!40000 ALTER TABLE `streaming_service_streams_sporting_events` DISABLE KEYS */;
INSERT INTO `streaming_service_streams_sporting_events` VALUES (101,12),(201,22),(301,32),(401,42),(501,52),(601,62);
/*!40000 ALTER TABLE `streaming_service_streams_sporting_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_table` (
  `user_id` int NOT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(40) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (102,'john.doe@example.com','securepass123','John','Doe','USA'),(202,'alice.smith@example.com','password!321','Alice','Smith','Canada'),(302,'bob.johnson@example.com','pass1234','Bob','Johnson','UK'),(402,'eva.williams@example.com','mysecretpassword','Eva','Williams','Australia'),(502,'michael.brown@example.com','mystrongpassword','Michael','Brown','USA'),(602,'emily.white@example.com','securepass567','Emily','White','Canada');
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-15  1:24:09
