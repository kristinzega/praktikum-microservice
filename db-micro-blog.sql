/*
SQLyog Professional v12.5.1 (64 bit)
MySQL - 10.4.25-MariaDB : Database - db_micro_blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_micro_blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_micro_blog`;

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_08_19_000000_create_failed_jobs_table',1),
(4,'2019_12_14_000001_create_personal_access_tokens_table',2),
(5,'2023_04_13_182133_create_tutorials_table',2);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `personal_access_tokens` */

DROP TABLE IF EXISTS `personal_access_tokens`;

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `personal_access_tokens` */

insert  into `personal_access_tokens`(`id`,`tokenable_type`,`tokenable_id`,`name`,`token`,`abilities`,`last_used_at`,`created_at`,`updated_at`) values 
(3,'App\\Models\\User',1,'auth_token','ffe1a14d33231dcdf0dc309712de17c45a4b831bd226ea22cd8e4fd0b19e4ecb','[\"*\"]','2023-06-06 17:18:13','2023-06-06 16:56:38','2023-06-06 17:18:13'),
(4,'App\\Models\\User',1,'auth_token','08152610529cac6982218c00297983049ccd0979bb06b424fb6763e05b5bef6f','[\"*\"]','2023-06-07 14:01:06','2023-06-07 14:00:08','2023-06-07 14:01:06'),
(5,'App\\Models\\User',1,'auth_token','abcea232a6eef7c99a1e90b74734329a90d22cf229cac863fb3abb46095760ce','[\"*\"]','2023-06-16 04:28:48','2023-06-08 17:00:47','2023-06-16 04:28:48'),
(6,'App\\Models\\User',4,'auth_token','74675556c111eba7974b14e0f44576ab73f460265050a8709848f6cdb59c0e87','[\"*\"]',NULL,'2023-06-08 18:15:03','2023-06-08 18:15:03'),
(7,'App\\Models\\User',4,'auth_token','04521b629b4dfe78c20c9587f1648338938ce84c152fdc60a7319cae1d7ea8f9','[\"*\"]',NULL,'2023-06-08 18:22:15','2023-06-08 18:22:15'),
(8,'App\\Models\\User',4,'auth_token','1024ff2f3ec30c60cb1278e5f92ebf13e69c5d7963573798e37770e3fd7d7fd6','[\"*\"]',NULL,'2023-06-16 03:20:30','2023-06-16 03:20:30'),
(9,'App\\Models\\User',1,'auth_token','a7ff3ec4797518e744a87e2849558f04f2c448663f081ddb824dc63853686a9c','[\"*\"]',NULL,'2023-06-16 04:48:16','2023-06-16 04:48:16');

/*Table structure for table `tbl_tutorials` */

DROP TABLE IF EXISTS `tbl_tutorials`;

CREATE TABLE `tbl_tutorials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `published` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tbl_tutorials` */

insert  into `tbl_tutorials`(`id`,`image`,`title`,`description`,`published`,`created_at`,`updated_at`) values 
(1,NULL,'Coba Create','Percobaan',1,'2023-06-16 03:27:56','2023-06-16 03:27:56'),
(2,'0KU6K0SviM82jjLmdMdcsrjNJWlPBwvFiQI3xhnH.jpg','Percobaan Update','Update Data',1,'2023-06-16 04:04:28','2023-06-16 04:26:46');

/*Table structure for table `tutorials` */

DROP TABLE IF EXISTS `tutorials`;

CREATE TABLE `tutorials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `tutorials` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`email_verified_at`,`password`,`remember_token`,`created_at`,`updated_at`) values 
(1,'admin123','admin@gmail.com',NULL,'$2y$10$dg2VRQFGp3Ka9cXeyJPkKuOb9pZQesEZU662tz0njn7hLDDpuJIbG',NULL,'2023-05-25 17:49:42','2023-05-25 17:49:42'),
(2,'admin123','admin123@gmail.com',NULL,'$2y$10$JlK9QbLXYfzdwgNhe0ndc.vzjL7U1Zfe0DJRLCwB7u12kGri70Lua',NULL,'2023-05-25 18:24:30','2023-05-25 18:24:30'),
(3,'admin','admin000@gmail.com',NULL,'$2y$10$afndW7gyhno89/Bq5d5m2eevweu/K8gcLA32OqjogUKxdzGSIKLE2',NULL,'2023-06-06 03:49:28','2023-06-06 03:49:28'),
(4,'user123','user123@gmail.com',NULL,'$2y$10$tlsR43v6qX8fBKQMqxb/ku9NekF1k5rMBOsFsMXOObGvpDH2n6dQe',NULL,'2023-06-08 18:15:02','2023-06-08 18:15:02'),
(5,'admin000','admin001@gmail.com',NULL,'$2y$10$UAxiESBoVx1wgX4ksRNute4UHmSwcffQ.RNGwMcgPd09fqOBhThc6',NULL,'2023-06-16 04:48:52','2023-06-16 04:48:52');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
