-- MySQL dump 10.13  Distrib 5.6.30, for Linux (x86_64)
--
-- Host: mysql    Database: db_folkuniversitet
-- ------------------------------------------------------
-- Server version	5.6.30-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

set autocommit = 0;
set unique_checks = 0;
set foreign_key_checks = 0;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `address1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_box` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=566 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_salt` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `super_admin` tinyint(1) NOT NULL,
  `preference_admin` tinyint(1) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` text COLLATE utf8mb4_unicode_ci,
  `post_login_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_module`
--

DROP TABLE IF EXISTS `admin_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_module` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `admin_module_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_option`
--

DROP TABLE IF EXISTS `admin_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint(20) unsigned NOT NULL,
  `value` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `admin_option_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organisation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_datetime` datetime DEFAULT NULL,
  `contact_status_id` bigint(20) unsigned DEFAULT NULL,
  `contact_referer_id` bigint(20) unsigned DEFAULT NULL,
  `garbage` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `contact_status_id` (`contact_status_id`),
  KEY `contact_referer_id` (`contact_referer_id`),
  CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`contact_status_id`) REFERENCES `contact_status` (`id`),
  CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`contact_referer_id`) REFERENCES `contact_referer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_referer`
--

DROP TABLE IF EXISTS `contact_referer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_referer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_status`
--

DROP TABLE IF EXISTS `contact_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `container`
--

DROP TABLE IF EXISTS `container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `container` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=219 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_import`
--

DROP TABLE IF EXISTS `content_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_import` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `domain_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_importing` tinyint(1) NOT NULL,
  `is_exporting` tinyint(1) NOT NULL,
  `permission_key` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_import_history`
--

DROP TABLE IF EXISTS `content_import_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_import_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `domain_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lesson` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exercise` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `filename` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide` tinyint(1) NOT NULL,
  `secured` tinyint(1) NOT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `document_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `document_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `document_category`
--

DROP TABLE IF EXISTS `document_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_answer`
--

DROP TABLE IF EXISTS `elearning_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_answer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `explanation` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `elearning_question_id` bigint(20) unsigned NOT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `elearning_question_id` (`elearning_question_id`),
  CONSTRAINT `elearning_answer_ibfk_1` FOREIGN KEY (`elearning_question_id`) REFERENCES `elearning_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5586 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_assignment`
--

DROP TABLE IF EXISTS `elearning_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_assignment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `elearning_subscription_id` bigint(20) unsigned NOT NULL,
  `elearning_exercise_id` bigint(20) unsigned NOT NULL,
  `elearning_result_id` bigint(20) unsigned DEFAULT NULL,
  `only_once` tinyint(1) NOT NULL,
  `opening_date` datetime DEFAULT NULL,
  `closing_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `elearning_subscription_id_2` (`elearning_subscription_id`,`elearning_exercise_id`),
  UNIQUE KEY `id` (`id`),
  KEY `elearning_subscription_id` (`elearning_subscription_id`),
  KEY `elearning_exercise_id` (`elearning_exercise_id`),
  KEY `elearning_result_id` (`elearning_result_id`),
  CONSTRAINT `elearning_assignment_ibfk_1` FOREIGN KEY (`elearning_subscription_id`) REFERENCES `elearning_subscription` (`id`),
  CONSTRAINT `elearning_assignment_ibfk_2` FOREIGN KEY (`elearning_exercise_id`) REFERENCES `elearning_exercise` (`id`),
  CONSTRAINT `elearning_assignment_ibfk_3` FOREIGN KEY (`elearning_result_id`) REFERENCES `elearning_result` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_category`
--

DROP TABLE IF EXISTS `elearning_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_class`
--

DROP TABLE IF EXISTS `elearning_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_class` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_course`
--

DROP TABLE IF EXISTS `elearning_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_course` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instant_correction` tinyint(1) NOT NULL,
  `instant_congratulation` tinyint(1) NOT NULL,
  `instant_solution` tinyint(1) NOT NULL,
  `importable` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `secured` tinyint(1) NOT NULL,
  `free_samples` int(10) unsigned DEFAULT NULL,
  `auto_subscription` tinyint(1) NOT NULL,
  `auto_unsubscription` tinyint(1) NOT NULL,
  `interrupt_timed_out_exercise` tinyint(1) NOT NULL,
  `reset_exercise_answers` tinyint(1) NOT NULL,
  `exercise_only_once` tinyint(1) NOT NULL,
  `exercise_any_order` tinyint(1) NOT NULL,
  `save_result_option` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shuffle_questions` tinyint(1) NOT NULL,
  `shuffle_answers` tinyint(1) NOT NULL,
  `matter_id` bigint(20) unsigned NOT NULL,
  `user_account_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `id` (`id`),
  KEY `matter_id` (`matter_id`),
  KEY `user_account_id` (`user_account_id`),
  CONSTRAINT `elearning_course_ibfk_1` FOREIGN KEY (`matter_id`) REFERENCES `elearning_matter` (`id`),
  CONSTRAINT `elearning_course_ibfk_2` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_course_info`
--

DROP TABLE IF EXISTS `elearning_course_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_course_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `headline` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information` text COLLATE utf8mb4_unicode_ci,
  `list_order` int(10) unsigned NOT NULL,
  `elearning_course_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `elearning_course_id` (`elearning_course_id`),
  CONSTRAINT `elearning_course_info_ibfk_1` FOREIGN KEY (`elearning_course_id`) REFERENCES `elearning_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_course_item`
--

DROP TABLE IF EXISTS `elearning_course_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_course_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `elearning_course_id` bigint(20) unsigned NOT NULL,
  `elearning_exercise_id` bigint(20) unsigned DEFAULT NULL,
  `elearning_lesson_id` bigint(20) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `elearning_course_id_2` (`elearning_course_id`,`elearning_exercise_id`),
  UNIQUE KEY `elearning_course_id_3` (`elearning_course_id`,`elearning_lesson_id`),
  KEY `elearning_course_id` (`elearning_course_id`),
  KEY `elearning_exercise_id` (`elearning_exercise_id`),
  KEY `elearning_lesson_id` (`elearning_lesson_id`),
  CONSTRAINT `elearning_course_item_ibfk_1` FOREIGN KEY (`elearning_course_id`) REFERENCES `elearning_course` (`id`),
  CONSTRAINT `elearning_course_item_ibfk_2` FOREIGN KEY (`elearning_exercise_id`) REFERENCES `elearning_exercise` (`id`),
  CONSTRAINT `elearning_course_item_ibfk_3` FOREIGN KEY (`elearning_lesson_id`) REFERENCES `elearning_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_exercise`
--

DROP TABLE IF EXISTS `elearning_exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_exercise` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `introduction` text COLLATE utf8mb4_unicode_ci,
  `hide_introduction` tinyint(1) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autostart` tinyint(1) NOT NULL,
  `public_access` tinyint(1) NOT NULL,
  `max_duration` int(10) unsigned DEFAULT NULL,
  `release_date` datetime NOT NULL,
  `secured` tinyint(1) NOT NULL,
  `skip_exercise_introduction` tinyint(1) NOT NULL,
  `social_connect` tinyint(1) NOT NULL,
  `hide_solutions` tinyint(1) NOT NULL,
  `hide_progression_bar` tinyint(1) NOT NULL,
  `hide_page_tabs` tinyint(1) NOT NULL,
  `disable_next_page_tabs` tinyint(1) NOT NULL,
  `number_page_tabs` int(10) unsigned DEFAULT NULL,
  `hide_keyboard` tinyint(1) NOT NULL,
  `contact_page` tinyint(1) NOT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `webpage_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level_id` bigint(20) unsigned DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `scoring_id` bigint(20) unsigned DEFAULT NULL,
  `garbage` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `id` (`id`),
  KEY `category_id` (`category_id`),
  KEY `level_id` (`level_id`),
  KEY `subject_id` (`subject_id`),
  KEY `scoring_id` (`scoring_id`),
  CONSTRAINT `elearning_exercise_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `elearning_category` (`id`),
  CONSTRAINT `elearning_exercise_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `elearning_level` (`id`),
  CONSTRAINT `elearning_exercise_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `elearning_subject` (`id`),
  CONSTRAINT `elearning_exercise_ibfk_4` FOREIGN KEY (`scoring_id`) REFERENCES `elearning_scoring` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_exercise_page`
--

DROP TABLE IF EXISTS `elearning_exercise_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_exercise_page` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `text` text COLLATE utf8mb4_unicode_ci,
  `hide_text` tinyint(1) NOT NULL,
  `text_max_height` int(10) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hint_placement` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `elearning_exercise_id` bigint(20) unsigned NOT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `elearning_exercise_id` (`elearning_exercise_id`),
  CONSTRAINT `elearning_exercise_page_ibfk_1` FOREIGN KEY (`elearning_exercise_id`) REFERENCES `elearning_exercise` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_lesson`
--

DROP TABLE IF EXISTS `elearning_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_lesson` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `introduction` text COLLATE utf8mb4_unicode_ci,
  `secured` tinyint(1) NOT NULL,
  `public_access` tinyint(1) NOT NULL,
  `release_date` datetime NOT NULL,
  `garbage` tinyint(1) NOT NULL,
  `locked` tinyint(1) NOT NULL,
  `lesson_model_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `level_id` bigint(20) unsigned DEFAULT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `id` (`id`),
  KEY `lesson_model_id` (`lesson_model_id`),
  KEY `category_id` (`category_id`),
  KEY `level_id` (`level_id`),
  KEY `subject_id` (`subject_id`),
  CONSTRAINT `elearning_lesson_ibfk_1` FOREIGN KEY (`lesson_model_id`) REFERENCES `elearning_lesson_model` (`id`),
  CONSTRAINT `elearning_lesson_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `elearning_category` (`id`),
  CONSTRAINT `elearning_lesson_ibfk_3` FOREIGN KEY (`level_id`) REFERENCES `elearning_level` (`id`),
  CONSTRAINT `elearning_lesson_ibfk_4` FOREIGN KEY (`subject_id`) REFERENCES `elearning_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_lesson_heading`
--

DROP TABLE IF EXISTS `elearning_lesson_heading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_lesson_heading` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `list_order` int(10) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `elearning_lesson_model_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `elearning_lesson_model_id` (`elearning_lesson_model_id`),
  CONSTRAINT `elearning_lesson_heading_ibfk_1` FOREIGN KEY (`elearning_lesson_model_id`) REFERENCES `elearning_lesson_model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_lesson_model`
--

DROP TABLE IF EXISTS `elearning_lesson_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_lesson_model` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `locked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_lesson_paragraph`
--

DROP TABLE IF EXISTS `elearning_lesson_paragraph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_lesson_paragraph` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `headline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  `elearning_lesson_id` bigint(20) unsigned NOT NULL,
  `elearning_lesson_heading_id` bigint(20) unsigned DEFAULT NULL,
  `elearning_exercise_id` bigint(20) unsigned DEFAULT NULL,
  `exercise_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `elearning_lesson_id` (`elearning_lesson_id`),
  KEY `elearning_lesson_heading_id` (`elearning_lesson_heading_id`),
  KEY `elearning_exercise_id` (`elearning_exercise_id`),
  CONSTRAINT `elearning_lesson_paragraph_ibfk_1` FOREIGN KEY (`elearning_lesson_id`) REFERENCES `elearning_lesson` (`id`),
  CONSTRAINT `elearning_lesson_paragraph_ibfk_2` FOREIGN KEY (`elearning_lesson_heading_id`) REFERENCES `elearning_lesson_heading` (`id`),
  CONSTRAINT `elearning_lesson_paragraph_ibfk_3` FOREIGN KEY (`elearning_exercise_id`) REFERENCES `elearning_exercise` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_level`
--

DROP TABLE IF EXISTS `elearning_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_level` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_matter`
--

DROP TABLE IF EXISTS `elearning_matter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_matter` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_question`
--

DROP TABLE IF EXISTS `elearning_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_question` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `explanation` text COLLATE utf8mb4_unicode_ci,
  `elearning_exercise_page_id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hint` text COLLATE utf8mb4_unicode_ci,
  `points` int(10) unsigned DEFAULT NULL,
  `answer_nb_words` int(10) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `elearning_exercise_page_id` (`elearning_exercise_page_id`),
  CONSTRAINT `elearning_question_ibfk_1` FOREIGN KEY (`elearning_exercise_page_id`) REFERENCES `elearning_exercise_page` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1897 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_question_result`
--

DROP TABLE IF EXISTS `elearning_question_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_question_result` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `elearning_result_id` bigint(20) unsigned NOT NULL,
  `elearning_question_id` bigint(20) unsigned NOT NULL,
  `elearning_answer_id` bigint(20) unsigned DEFAULT NULL,
  `elearning_answer_text` text COLLATE utf8mb4_unicode_ci,
  `elearning_answer_order` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `elearning_result_id` (`elearning_result_id`),
  KEY `elearning_question_id` (`elearning_question_id`),
  KEY `elearning_answer_id` (`elearning_answer_id`),
  CONSTRAINT `elearning_question_result_ibfk_1` FOREIGN KEY (`elearning_result_id`) REFERENCES `elearning_result` (`id`),
  CONSTRAINT `elearning_question_result_ibfk_2` FOREIGN KEY (`elearning_question_id`) REFERENCES `elearning_question` (`id`),
  CONSTRAINT `elearning_question_result_ibfk_3` FOREIGN KEY (`elearning_answer_id`) REFERENCES `elearning_answer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2381 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_result`
--

DROP TABLE IF EXISTS `elearning_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_result` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `elearning_exercise_id` bigint(20) unsigned DEFAULT NULL,
  `subscription_id` bigint(20) unsigned DEFAULT NULL,
  `exercise_datetime` datetime DEFAULT NULL,
  `exercise_elapsed_time` int(10) unsigned DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `text_comment` text COLLATE utf8mb4_unicode_ci,
  `hide_comment` tinyint(1) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_reading_questions` int(10) unsigned DEFAULT NULL,
  `nb_correct_reading_answers` int(10) unsigned DEFAULT NULL,
  `nb_incorrect_reading_answers` int(10) unsigned DEFAULT NULL,
  `nb_reading_points` int(10) unsigned DEFAULT NULL,
  `nb_writing_questions` int(10) unsigned DEFAULT NULL,
  `nb_correct_writing_answers` int(10) unsigned DEFAULT NULL,
  `nb_incorrect_writing_answers` int(10) unsigned DEFAULT NULL,
  `nb_writing_points` int(10) unsigned DEFAULT NULL,
  `nb_listening_questions` int(10) unsigned DEFAULT NULL,
  `nb_correct_listening_answers` int(10) unsigned DEFAULT NULL,
  `nb_incorrect_listening_answers` int(10) unsigned DEFAULT NULL,
  `nb_listening_points` int(10) unsigned DEFAULT NULL,
  `nb_not_answered` int(10) unsigned DEFAULT NULL,
  `nb_incorrect_answers` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `elearning_exercise_id` (`elearning_exercise_id`),
  KEY `subscription_id` (`subscription_id`),
  CONSTRAINT `elearning_result_ibfk_1` FOREIGN KEY (`elearning_exercise_id`) REFERENCES `elearning_exercise` (`id`),
  CONSTRAINT `elearning_result_ibfk_2` FOREIGN KEY (`subscription_id`) REFERENCES `elearning_subscription` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=405 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_result_range`
--

DROP TABLE IF EXISTS `elearning_result_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_result_range` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `upper_range` int(10) unsigned NOT NULL,
  `grade` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_scoring`
--

DROP TABLE IF EXISTS `elearning_scoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_scoring` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `required_score` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_scoring_range`
--

DROP TABLE IF EXISTS `elearning_scoring_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_scoring_range` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `upper_range` int(10) unsigned NOT NULL,
  `score` text COLLATE utf8mb4_unicode_ci,
  `advice` text COLLATE utf8mb4_unicode_ci,
  `proposal` text COLLATE utf8mb4_unicode_ci,
  `link_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `elearning_scoring_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `elearning_scoring_id` (`elearning_scoring_id`),
  CONSTRAINT `elearning_scoring_range_ibfk_1` FOREIGN KEY (`elearning_scoring_id`) REFERENCES `elearning_scoring` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_session`
--

DROP TABLE IF EXISTS `elearning_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_session` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_date` datetime NOT NULL,
  `closing_date` datetime DEFAULT NULL,
  `closed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_session_course`
--

DROP TABLE IF EXISTS `elearning_session_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_session_course` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `elearning_session_id` bigint(20) unsigned NOT NULL,
  `elearning_course_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `elearning_session_id_2` (`elearning_session_id`,`elearning_course_id`),
  UNIQUE KEY `id` (`id`),
  KEY `elearning_session_id` (`elearning_session_id`),
  KEY `elearning_course_id` (`elearning_course_id`),
  CONSTRAINT `elearning_session_course_ibfk_1` FOREIGN KEY (`elearning_session_id`) REFERENCES `elearning_session` (`id`),
  CONSTRAINT `elearning_session_course_ibfk_2` FOREIGN KEY (`elearning_course_id`) REFERENCES `elearning_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_solution`
--

DROP TABLE IF EXISTS `elearning_solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_solution` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `elearning_question_id` bigint(20) unsigned NOT NULL,
  `elearning_answer_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `elearning_question_id_2` (`elearning_question_id`,`elearning_answer_id`),
  UNIQUE KEY `id` (`id`),
  KEY `elearning_question_id` (`elearning_question_id`),
  KEY `elearning_answer_id` (`elearning_answer_id`),
  CONSTRAINT `elearning_solution_ibfk_1` FOREIGN KEY (`elearning_question_id`) REFERENCES `elearning_question` (`id`),
  CONSTRAINT `elearning_solution_ibfk_2` FOREIGN KEY (`elearning_answer_id`) REFERENCES `elearning_answer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_subject`
--

DROP TABLE IF EXISTS `elearning_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_subject` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_subscription`
--

DROP TABLE IF EXISTS `elearning_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_subscription` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `user_account_id` bigint(20) unsigned DEFAULT NULL,
  `teacher_id` bigint(20) unsigned DEFAULT NULL,
  `session_id` bigint(20) unsigned DEFAULT NULL,
  `course_id` bigint(20) unsigned DEFAULT NULL,
  `class_id` bigint(20) unsigned DEFAULT NULL,
  `subscription_date` datetime DEFAULT NULL,
  `subscription_close` datetime DEFAULT NULL,
  `watch_live` tinyint(1) NOT NULL,
  `last_exercise_id` bigint(20) unsigned DEFAULT NULL,
  `last_exercise_page_id` bigint(20) unsigned DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  `whiteboard` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `session_id` (`session_id`),
  KEY `course_id` (`course_id`),
  KEY `class_id` (`class_id`),
  KEY `user_account_id` (`user_account_id`),
  CONSTRAINT `elearning_subscription_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `elearning_teacher` (`id`),
  CONSTRAINT `elearning_subscription_ibfk_3` FOREIGN KEY (`session_id`) REFERENCES `elearning_session` (`id`),
  CONSTRAINT `elearning_subscription_ibfk_4` FOREIGN KEY (`course_id`) REFERENCES `elearning_course` (`id`),
  CONSTRAINT `elearning_subscription_ibfk_5` FOREIGN KEY (`class_id`) REFERENCES `elearning_class` (`id`),
  CONSTRAINT `elearning_subscription_ibfk_6` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elearning_teacher`
--

DROP TABLE IF EXISTS `elearning_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elearning_teacher` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `user_account_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id_2` (`user_account_id`),
  KEY `user_account_id` (`user_account_id`),
  CONSTRAINT `elearning_teacher_ibfk_1` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flash`
--

DROP TABLE IF EXISTS `flash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flash` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `filename` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `width` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `height` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bgcolor` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wddx` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `form`
--

DROP TABLE IF EXISTS `form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8mb4_unicode_ci,
  `acknowledge` text COLLATE utf8mb4_unicode_ci,
  `webpage_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_message` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `form_item`
--

DROP TABLE IF EXISTS `form_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `help` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_value` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_size` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maxlength` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  `in_mail_address` tinyint(1) NOT NULL,
  `mail_list_id` bigint(20) unsigned DEFAULT NULL,
  `form_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `mail_list_id` (`mail_list_id`),
  KEY `form_id` (`form_id`),
  KEY `form_id_2` (`form_id`,`list_order`),
  CONSTRAINT `form_item_ibfk_1` FOREIGN KEY (`mail_list_id`) REFERENCES `mail_list` (`id`),
  CONSTRAINT `form_item_ibfk_2` FOREIGN KEY (`form_id`) REFERENCES `form` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `form_item_value`
--

DROP TABLE IF EXISTS `form_item_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_item_value` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `value` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci,
  `form_item_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `form_item_id` (`form_item_id`),
  CONSTRAINT `form_item_value_ibfk_1` FOREIGN KEY (`form_item_id`) REFERENCES `form_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `form_valid`
--

DROP TABLE IF EXISTS `form_valid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_valid` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `boundary` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_item_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `form_item_id` (`form_item_id`),
  CONSTRAINT `form_valid_ibfk_1` FOREIGN KEY (`form_item_id`) REFERENCES `form_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `guestbook_entry`
--

DROP TABLE IF EXISTS `guestbook_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guestbook_entry` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_account_id` bigint(20) unsigned DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publication_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_account_id` (`user_account_id`),
  CONSTRAINT `guestbook_entry_ibfk_1` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lexicon_entry`
--

DROP TABLE IF EXISTS `lexicon_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lexicon_entry` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `explanation` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `link`
--

DROP TABLE IF EXISTS `link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `link_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `link_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `link_category`
--

DROP TABLE IF EXISTS `link_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `link_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_format` tinyint(1) NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci,
  `creation_datetime` datetime DEFAULT NULL,
  `send_datetime` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `admin_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `mail_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `mail_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_address`
--

DROP TABLE IF EXISTS `mail_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_comment` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscribe` tinyint(1) NOT NULL,
  `imported` tinyint(1) NOT NULL,
  `creation_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_category`
--

DROP TABLE IF EXISTS `mail_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_history`
--

DROP TABLE IF EXISTS `mail_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci,
  `mail_list_id` bigint(20) unsigned DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint(20) unsigned DEFAULT NULL,
  `send_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `mail_list_id` (`mail_list_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `mail_history_ibfk_1` FOREIGN KEY (`mail_list_id`) REFERENCES `mail_list` (`id`),
  CONSTRAINT `mail_history_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_list`
--

DROP TABLE IF EXISTS `mail_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_subscribe` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_list_address`
--

DROP TABLE IF EXISTS `mail_list_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_list_address` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `mail_list_id` bigint(20) unsigned NOT NULL,
  `mail_address_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `mail_list_id` (`mail_list_id`),
  KEY `mail_address_id` (`mail_address_id`),
  CONSTRAINT `mail_list_address_ibfk_1` FOREIGN KEY (`mail_list_id`) REFERENCES `mail_list` (`id`),
  CONSTRAINT `mail_list_address_ibfk_2` FOREIGN KEY (`mail_address_id`) REFERENCES `mail_address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_list_user`
--

DROP TABLE IF EXISTS `mail_list_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_list_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `mail_list_id` bigint(20) unsigned DEFAULT NULL,
  `user_account_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `mail_list_id` (`mail_list_id`),
  KEY `user_account_id` (`user_account_id`),
  CONSTRAINT `mail_list_user_ibfk_1` FOREIGN KEY (`mail_list_id`) REFERENCES `mail_list` (`id`),
  CONSTRAINT `mail_list_user_ibfk_2` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_outbox`
--

DROP TABLE IF EXISTS `mail_outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_outbox` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent` tinyint(1) NOT NULL,
  `error_message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_names` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navbar`
--

DROP TABLE IF EXISTS `navbar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navbar` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `hide` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navbar_item`
--

DROP TABLE IF EXISTS `navbar_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navbar_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_over` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blank_target` tinyint(1) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide` tinyint(1) NOT NULL,
  `template_model_id` bigint(20) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  `navbar_language_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `template_model_id` (`template_model_id`),
  KEY `navbar_language_id` (`navbar_language_id`),
  KEY `navbar_language_id_2` (`navbar_language_id`,`list_order`),
  KEY `image` (`image`(191)),
  KEY `image_over` (`image_over`(191)),
  CONSTRAINT `navbar_item_ibfk_1` FOREIGN KEY (`template_model_id`) REFERENCES `template_model` (`id`),
  CONSTRAINT `navbar_item_ibfk_2` FOREIGN KEY (`navbar_language_id`) REFERENCES `navbar_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navbar_language`
--

DROP TABLE IF EXISTS `navbar_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navbar_language` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `language_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `navbar_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `navbar_id` (`navbar_id`),
  KEY `navbar_id_2` (`navbar_id`,`language_code`),
  CONSTRAINT `navbar_language_ibfk_1` FOREIGN KEY (`navbar_id`) REFERENCES `navbar` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navlink`
--

DROP TABLE IF EXISTS `navlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navlink` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navlink_item`
--

DROP TABLE IF EXISTS `navlink_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navlink_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_over` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blank_target` tinyint(1) NOT NULL,
  `language_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_model_id` bigint(20) unsigned DEFAULT NULL,
  `navlink_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `template_model_id` (`template_model_id`),
  KEY `navlink_id` (`navlink_id`),
  KEY `navlink_id_2` (`navlink_id`,`language_code`),
  KEY `image` (`image`(191)),
  KEY `image_over` (`image_over`(191)),
  CONSTRAINT `navlink_item_ibfk_1` FOREIGN KEY (`template_model_id`) REFERENCES `template_model` (`id`),
  CONSTRAINT `navlink_item_ibfk_2` FOREIGN KEY (`navlink_id`) REFERENCES `navlink` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navmenu`
--

DROP TABLE IF EXISTS `navmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navmenu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `hide` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navmenu_item`
--

DROP TABLE IF EXISTS `navmenu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navmenu_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_over` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blank_target` tinyint(1) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hide` tinyint(1) NOT NULL,
  `template_model_id` bigint(20) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `template_model_id` (`template_model_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `navmenu_item_ibfk_1` FOREIGN KEY (`template_model_id`) REFERENCES `template_model` (`id`),
  CONSTRAINT `navmenu_item_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `navmenu_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navmenu_language`
--

DROP TABLE IF EXISTS `navmenu_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navmenu_language` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `language_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `navmenu_id` bigint(20) unsigned NOT NULL,
  `navmenu_item_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `navmenu_id` (`navmenu_id`),
  KEY `navmenu_item_id` (`navmenu_item_id`),
  CONSTRAINT `navmenu_language_ibfk_1` FOREIGN KEY (`navmenu_id`) REFERENCES `navmenu` (`id`),
  CONSTRAINT `navmenu_language_ibfk_2` FOREIGN KEY (`navmenu_item_id`) REFERENCES `navmenu_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news_editor`
--

DROP TABLE IF EXISTS `news_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_editor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `admin_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id_2` (`admin_id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `news_editor_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news_feed`
--

DROP TABLE IF EXISTS `news_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_feed` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `news_paper_id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_display_number` int(10) unsigned DEFAULT NULL,
  `image_align` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_width` int(10) unsigned DEFAULT NULL,
  `with_excerpt` tinyint(1) NOT NULL,
  `with_image` tinyint(1) NOT NULL,
  `search_options` tinyint(1) NOT NULL,
  `search_calendar` tinyint(1) NOT NULL,
  `display_upcoming` tinyint(1) NOT NULL,
  `search_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `search_display_as_page` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news_heading`
--

DROP TABLE IF EXISTS `news_heading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_heading` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `list_order` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `news_publication_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `news_publication_id` (`news_publication_id`),
  CONSTRAINT `news_heading_ibfk_1` FOREIGN KEY (`news_publication_id`) REFERENCES `news_publication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news_paper`
--

DROP TABLE IF EXISTS `news_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_paper` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `header` text COLLATE utf8mb4_unicode_ci,
  `footer` text COLLATE utf8mb4_unicode_ci,
  `release_date` datetime DEFAULT NULL,
  `archive_date` datetime DEFAULT NULL,
  `not_published` tinyint(1) NOT NULL,
  `news_publication_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `news_publication_id` (`news_publication_id`),
  CONSTRAINT `news_paper_ibfk_1` FOREIGN KEY (`news_publication_id`) REFERENCES `news_publication` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news_publication`
--

DROP TABLE IF EXISTS `news_publication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_publication` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nb_columns` int(10) unsigned DEFAULT NULL,
  `slide_down` tinyint(1) NOT NULL,
  `align` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `with_archive` tinyint(1) NOT NULL,
  `with_others` tinyint(1) NOT NULL,
  `with_by_heading` tinyint(1) NOT NULL,
  `hide_heading` tinyint(1) NOT NULL,
  `auto_archive` int(3) unsigned DEFAULT NULL,
  `auto_delete` int(3) unsigned DEFAULT NULL,
  `secured` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news_story`
--

DROP TABLE IF EXISTS `news_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_story` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `headline` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci,
  `audio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `audio_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `release_date` datetime DEFAULT NULL,
  `archive_date` datetime DEFAULT NULL,
  `event_start_date` datetime DEFAULT NULL,
  `event_end_date` datetime DEFAULT NULL,
  `news_editor_id` bigint(20) unsigned DEFAULT NULL,
  `news_paper_id` bigint(20) unsigned NOT NULL,
  `news_heading_id` bigint(20) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `news_editor_id` (`news_editor_id`),
  KEY `news_paper_id` (`news_paper_id`),
  KEY `news_heading_id` (`news_heading_id`),
  CONSTRAINT `news_story_ibfk_1` FOREIGN KEY (`news_editor_id`) REFERENCES `news_editor` (`id`),
  CONSTRAINT `news_story_ibfk_2` FOREIGN KEY (`news_paper_id`) REFERENCES `news_paper` (`id`),
  CONSTRAINT `news_story_ibfk_3` FOREIGN KEY (`news_heading_id`) REFERENCES `news_heading` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news_story_image`
--

DROP TABLE IF EXISTS `news_story_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_story_image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  `news_story_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `news_story_id` (`news_story_id`),
  CONSTRAINT `news_story_image_ibfk_1` FOREIGN KEY (`news_story_id`) REFERENCES `news_story` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news_story_paragraph`
--

DROP TABLE IF EXISTS `news_story_paragraph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_story_paragraph` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `header` text COLLATE utf8mb4_unicode_ci,
  `body` text COLLATE utf8mb4_unicode_ci,
  `footer` text COLLATE utf8mb4_unicode_ci,
  `news_story_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `news_story_id` (`news_story_id`),
  CONSTRAINT `news_story_paragraph_ibfk_1` FOREIGN KEY (`news_story_id`) REFERENCES `news_story` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `people_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `people_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `people_category`
--

DROP TABLE IF EXISTS `people_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `reference` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_comment` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(10) unsigned DEFAULT NULL,
  `photo_album_id` bigint(20) unsigned DEFAULT NULL,
  `photo_format_id` bigint(20) unsigned DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `photo_album_id` (`photo_album_id`),
  KEY `photo_format_id` (`photo_format_id`),
  CONSTRAINT `photo_ibfk_1` FOREIGN KEY (`photo_album_id`) REFERENCES `photo_album` (`id`),
  CONSTRAINT `photo_ibfk_2` FOREIGN KEY (`photo_format_id`) REFERENCES `photo_format` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photo_album`
--

DROP TABLE IF EXISTS `photo_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_album` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publication_date` datetime DEFAULT NULL,
  `price` int(10) unsigned DEFAULT NULL,
  `hide` tinyint(1) NOT NULL,
  `no_slide_show` tinyint(1) NOT NULL,
  `no_zoom` tinyint(1) NOT NULL,
  `list_order` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photo_album_format`
--

DROP TABLE IF EXISTS `photo_album_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_album_format` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `photo_album_id` bigint(20) unsigned NOT NULL,
  `photo_format_id` bigint(20) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `photo_album_id` (`photo_album_id`),
  KEY `photo_format_id` (`photo_format_id`),
  CONSTRAINT `photo_album_format_ibfk_1` FOREIGN KEY (`photo_album_id`) REFERENCES `photo_album` (`id`),
  CONSTRAINT `photo_album_format_ibfk_2` FOREIGN KEY (`photo_format_id`) REFERENCES `photo_format` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `photo_format`
--

DROP TABLE IF EXISTS `photo_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo_format` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preference`
--

DROP TABLE IF EXISTS `preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preference` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `id` (`id`),
  KEY `name_2` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=492 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `id` (`id`),
  KEY `name_2` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `id` (`id`),
  KEY `name_2` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rss_feed`
--

DROP TABLE IF EXISTS `rss_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rss_feed` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rss_feed_language`
--

DROP TABLE IF EXISTS `rss_feed_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rss_feed_language` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `language_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rss_feed_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `rss_feed_id` (`rss_feed_id`),
  CONSTRAINT `rss_feed_language_ibfk_1` FOREIGN KEY (`rss_feed_id`) REFERENCES `rss_feed` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_affiliate`
--

DROP TABLE IF EXISTS `shop_affiliate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_affiliate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `user_account_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `user_id_2` (`user_account_id`),
  KEY `user_account_id` (`user_account_id`),
  CONSTRAINT `shop_affiliate_ibfk_1` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_category`
--

DROP TABLE IF EXISTS `shop_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `shop_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_discount`
--

DROP TABLE IF EXISTS `shop_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_discount` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `discount_code` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_rate` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_affiliate_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `shop_affiliate_id` (`shop_affiliate_id`),
  CONSTRAINT `shop_discount_ibfk_1` FOREIGN KEY (`shop_affiliate_id`) REFERENCES `shop_affiliate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_item`
--

DROP TABLE IF EXISTS `shop_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `long_description` text COLLATE utf8mb4_unicode_ci,
  `reference` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_rate` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_fee` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  `hide` tinyint(1) NOT NULL,
  `added` datetime NOT NULL,
  `last_modified` datetime NOT NULL,
  `available` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `shop_item_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `shop_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_item_image`
--

DROP TABLE IF EXISTS `shop_item_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_item_image` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `list_order` int(10) unsigned NOT NULL,
  `shop_item_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `shop_item_id` (`shop_item_id`),
  CONSTRAINT `shop_item_image_ibfk_1` FOREIGN KEY (`shop_item_id`) REFERENCES `shop_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_order`
--

DROP TABLE IF EXISTS `shop_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_order` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organisation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `handling_fee` int(10) unsigned DEFAULT NULL,
  `discount_code` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_note` varchar(1024) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_language_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_address_id` bigint(20) unsigned NOT NULL,
  `shipping_address_id` bigint(20) unsigned DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `due_date` datetime NOT NULL,
  `client_ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_transaction_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_account_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `invoice_address_id` (`invoice_address_id`),
  KEY `shipping_address_id` (`shipping_address_id`),
  KEY `user_account_id` (`user_account_id`),
  CONSTRAINT `shop_order_ibfk_1` FOREIGN KEY (`invoice_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `shop_order_ibfk_2` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `shop_order_ibfk_3` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shop_order_item`
--

DROP TABLE IF EXISTS `shop_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shop_order_item` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vat_rate` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_fee` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(2) unsigned NOT NULL,
  `is_gift` tinyint(1) NOT NULL,
  `options` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shop_order_id` bigint(20) unsigned NOT NULL,
  `shop_item_id` bigint(20) unsigned DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `shop_order_id` (`shop_order_id`),
  KEY `shop_item_id` (`shop_item_id`),
  CONSTRAINT `shop_order_item_ibfk_1` FOREIGN KEY (`shop_order_id`) REFERENCES `shop_order` (`id`),
  CONSTRAINT `shop_order_item_ibfk_2` FOREIGN KEY (`shop_item_id`) REFERENCES `shop_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms`
--

DROP TABLE IF EXISTS `sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint(20) unsigned DEFAULT NULL,
  `category_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `sms_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `sms_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `sms_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_category`
--

DROP TABLE IF EXISTS `sms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_history`
--

DROP TABLE IF EXISTS `sms_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `sms_id` bigint(20) unsigned NOT NULL,
  `sms_list_id` bigint(20) unsigned DEFAULT NULL,
  `mobile_phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` bigint(20) unsigned DEFAULT NULL,
  `send_datetime` datetime DEFAULT NULL,
  `nb_recipients` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sms_id` (`sms_id`),
  KEY `sms_list_id` (`sms_list_id`),
  KEY `admin_id` (`admin_id`),
  CONSTRAINT `sms_history_ibfk_1` FOREIGN KEY (`sms_id`) REFERENCES `sms` (`id`),
  CONSTRAINT `sms_history_ibfk_2` FOREIGN KEY (`sms_list_id`) REFERENCES `sms_list` (`id`),
  CONSTRAINT `sms_history_ibfk_3` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_list`
--

DROP TABLE IF EXISTS `sms_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_subscribe` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_list_number`
--

DROP TABLE IF EXISTS `sms_list_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_list_number` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `sms_list_id` bigint(20) unsigned NOT NULL,
  `sms_number_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sms_list_id` (`sms_list_id`),
  KEY `sms_number_id` (`sms_number_id`),
  CONSTRAINT `sms_list_number_ibfk_1` FOREIGN KEY (`sms_list_id`) REFERENCES `sms_list` (`id`),
  CONSTRAINT `sms_list_number_ibfk_2` FOREIGN KEY (`sms_number_id`) REFERENCES `sms_number` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_list_user`
--

DROP TABLE IF EXISTS `sms_list_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_list_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `sms_list_id` bigint(20) unsigned NOT NULL,
  `user_account_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `sms_list_id` (`sms_list_id`),
  KEY `user_account_id` (`user_account_id`),
  CONSTRAINT `sms_list_user_ibfk_1` FOREIGN KEY (`sms_list_id`) REFERENCES `sms_list` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_number`
--

DROP TABLE IF EXISTS `sms_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_number` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscribe` tinyint(1) NOT NULL,
  `imported` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms_outbox`
--

DROP TABLE IF EXISTS `sms_outbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_outbox` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `social_user`
--

DROP TABLE IF EXISTS `social_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `facebook_user_id` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_user_id` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_user_id` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_user_id` varchar(48) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_account_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `facebook_user_id` (`facebook_user_id`),
  UNIQUE KEY `linkedin_user_id` (`linkedin_user_id`),
  UNIQUE KEY `google_user_id` (`google_user_id`),
  UNIQUE KEY `twitter_user_id` (`twitter_user_id`),
  KEY `user_account_id` (`user_account_id`),
  CONSTRAINT `social_user_ibfk_1` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistics_page`
--

DROP TABLE IF EXISTS `statistics_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics_page` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `page` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL,
  `month` int(10) unsigned NOT NULL,
  `year` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `page` (`page`,`month`,`year`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistics_referer`
--

DROP TABLE IF EXISTS `statistics_referer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics_referer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `statistics_visit`
--

DROP TABLE IF EXISTS `statistics_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statistics_visit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `visit_datetime` datetime NOT NULL,
  `visitor_host_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visitor_browser` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visitor_referer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `visit_datetime` (`visit_datetime`),
  KEY `visitor_host_address` (`visitor_host_address`(191)),
  KEY `visitor_browser` (`visitor_browser`(191)),
  KEY `visitor_referer` (`visitor_referer`(191))
) ENGINE=InnoDB AUTO_INCREMENT=137829 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_container`
--

DROP TABLE IF EXISTS `template_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_container` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `template_model_id` bigint(20) unsigned NOT NULL,
  `row_nb` int(10) unsigned NOT NULL,
  `cell_nb` int(10) unsigned NOT NULL,
  `template_property_set_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `template_model_id` (`template_model_id`),
  KEY `template_property_set_id` (`template_property_set_id`),
  CONSTRAINT `template_container_ibfk_1` FOREIGN KEY (`template_model_id`) REFERENCES `template_model` (`id`),
  CONSTRAINT `template_container_ibfk_2` FOREIGN KEY (`template_property_set_id`) REFERENCES `template_property_set` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_element`
--

DROP TABLE IF EXISTS `template_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_element` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `element_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `object_id` bigint(20) unsigned DEFAULT NULL,
  `template_container_id` bigint(20) unsigned NOT NULL,
  `list_order` int(10) unsigned NOT NULL,
  `hide` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `template_container_id` (`template_container_id`),
  CONSTRAINT `template_element_ibfk_1` FOREIGN KEY (`template_container_id`) REFERENCES `template_container` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_element_language`
--

DROP TABLE IF EXISTS `template_element_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_element_language` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `language_code` varchar(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `object_id` bigint(20) unsigned DEFAULT NULL,
  `template_element_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `template_element_id` (`template_element_id`),
  CONSTRAINT `template_element_language_ibfk_1` FOREIGN KEY (`template_element_id`) REFERENCES `template_element` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_element_tag`
--

DROP TABLE IF EXISTS `template_element_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_element_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `template_element_id` bigint(20) unsigned NOT NULL,
  `template_property_set_id` bigint(20) unsigned DEFAULT NULL,
  `dom_tag_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_element_id_2` (`template_element_id`,`dom_tag_id`),
  UNIQUE KEY `id` (`id`),
  KEY `template_element_id` (`template_element_id`),
  KEY `template_property_set_id` (`template_property_set_id`),
  CONSTRAINT `template_element_tag_ibfk_1` FOREIGN KEY (`template_element_id`) REFERENCES `template_element` (`id`),
  CONSTRAINT `template_element_tag_ibfk_2` FOREIGN KEY (`template_property_set_id`) REFERENCES `template_property_set` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=697 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_model`
--

DROP TABLE IF EXISTS `template_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_model` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `template_property_set_id` bigint(20) unsigned DEFAULT NULL,
  `inner_template_property_set_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `id` (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `template_property_set_id` (`template_property_set_id`),
  KEY `inner_template_property_set_id` (`inner_template_property_set_id`),
  CONSTRAINT `template_model_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `template_model` (`id`),
  CONSTRAINT `template_model_ibfk_2` FOREIGN KEY (`template_property_set_id`) REFERENCES `template_property_set` (`id`),
  CONSTRAINT `template_model_ibfk_3` FOREIGN KEY (`inner_template_property_set_id`) REFERENCES `template_property_set` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_page`
--

DROP TABLE IF EXISTS `template_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_page` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `system_page` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `template_model_id` (`template_model_id`),
  CONSTRAINT `template_page_ibfk_1` FOREIGN KEY (`template_model_id`) REFERENCES `template_model` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_page_tag`
--

DROP TABLE IF EXISTS `template_page_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_page_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `template_page_id` bigint(20) unsigned NOT NULL,
  `template_property_set_id` bigint(20) unsigned DEFAULT NULL,
  `dom_tag_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_page_id_2` (`template_page_id`,`dom_tag_id`),
  UNIQUE KEY `id` (`id`),
  KEY `template_page_id` (`template_page_id`),
  KEY `template_property_set_id` (`template_property_set_id`),
  CONSTRAINT `template_page_tag_ibfk_1` FOREIGN KEY (`template_page_id`) REFERENCES `template_page` (`id`),
  CONSTRAINT `template_page_tag_ibfk_2` FOREIGN KEY (`template_property_set_id`) REFERENCES `template_property_set` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_property`
--

DROP TABLE IF EXISTS `template_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_property` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_property_set_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `template_property_set_id` (`template_property_set_id`),
  CONSTRAINT `template_property_ibfk_1` FOREIGN KEY (`template_property_set_id`) REFERENCES `template_property_set` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35094 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_property_set`
--

DROP TABLE IF EXISTS `template_property_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_property_set` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10799 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unique_token`
--

DROP TABLE IF EXISTS `unique_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unique_token` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_datetime` datetime NOT NULL,
  `expiration_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1326 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organisation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `work_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_salt` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `readable_password` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unconfirmed_email` tinyint(1) NOT NULL,
  `valid_until` datetime DEFAULT NULL,
  `last_login` datetime NOT NULL,
  `profile` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imported` tinyint(1) NOT NULL,
  `mail_subscribe` tinyint(1) NOT NULL,
  `sms_subscribe` tinyint(1) NOT NULL,
  `creation_datetime` datetime NOT NULL,
  `address_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `id` (`id`),
  KEY `address_id` (`address_id`),
  KEY `image` (`image`(191)),
  CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2428 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webpage`
--

DROP TABLE IF EXISTS `webpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webpage` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `hide` tinyint(1) NOT NULL,
  `garbage` tinyint(1) NOT NULL,
  `list_order` int(10) unsigned NOT NULL,
  `secured` tinyint(1) NOT NULL,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `admin_id` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `admin_id` (`admin_id`),
  KEY `parent_id_2` (`parent_id`,`name`),
  KEY `parent_id_3` (`parent_id`,`list_order`),
  CONSTRAINT `webpage_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `webpage` (`id`),
  CONSTRAINT `webpage_ibfk_2` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webpage_navmenu`
--

DROP TABLE IF EXISTS `webpage_navmenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webpage_navmenu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `version` int(10) unsigned NOT NULL,
  `parent_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-17  9:17:57
