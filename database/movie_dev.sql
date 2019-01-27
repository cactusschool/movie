-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.1.29-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for movie
DROP DATABASE IF EXISTS `movie`;
CREATE DATABASE IF NOT EXISTS `movie` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `movie`;

-- Dumping structure for table movie.master_classes
DROP TABLE IF EXISTS `master_classes`;
CREATE TABLE IF NOT EXISTS `master_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.master_classes: ~0 rows (approximately)
/*!40000 ALTER TABLE `master_classes` DISABLE KEYS */;
/*!40000 ALTER TABLE `master_classes` ENABLE KEYS */;

-- Dumping structure for table movie.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.migrations: ~12 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(8, '2017_12_20_021439_create_master_classes_table', 1),
	(9, '2018_03_10_040637_create_movie_masters_table', 1),
	(10, '2018_03_10_185437_movie_masters', 2),
	(11, '2018_03_10_040638_create_movie_masters_table', 3),
	(12, '2018_03_11_073029_entrust_setup_tables', 4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table movie.movie_details
DROP TABLE IF EXISTS `movie_details`;
CREATE TABLE IF NOT EXISTS `movie_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(10) NOT NULL,
  `key` varchar(200) NOT NULL,
  `value` varchar(200) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `update_by` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_movie_details_movie_masters` (`movie_id`),
  CONSTRAINT `FK_movie_details_movie_masters` FOREIGN KEY (`movie_id`) REFERENCES `movie_masters` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table movie.movie_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `movie_details` DISABLE KEYS */;
REPLACE INTO `movie_details` (`id`, `movie_id`, `key`, `value`, `created_by`, `update_by`, `created_at`, `updated_at`) VALUES
	(4, 1, 'actor1', 'SRK', 'ashismo@gmail.com', NULL, '2018-03-11 19:57:25', '2018-03-11 19:57:25'),
	(5, 1, 'actor2', 'Katrina', 'ashismo@gmail.com', NULL, '2018-03-11 19:57:25', '2018-03-11 19:57:25'),
	(6, 1, 'director1', 'R Balki', 'ashismo@gmail.com', NULL, '2018-03-11 19:57:25', '2018-03-11 19:57:25'),
	(7, 1, 'actor1', 'SRK', 'ashismo@gmail.com', NULL, '2018-03-12 16:42:39', '2018-03-12 16:42:39'),
	(8, 1, 'actor2', 'Katrina', 'ashismo@gmail.com', NULL, '2018-03-12 16:42:39', '2018-03-12 16:42:39'),
	(9, 1, 'director1', 'R Balki', 'ashismo@gmail.com', NULL, '2018-03-12 16:42:39', '2018-03-12 16:42:39'),
	(10, 1, 'actor1', 'SRK', 'ashismo@gmail.com', NULL, '2018-03-12 16:44:33', '2018-03-12 16:44:33'),
	(11, 1, 'actor2', 'Katrina', 'ashismo@gmail.com', NULL, '2018-03-12 16:44:33', '2018-03-12 16:44:33'),
	(12, 1, 'director1', 'R Balki', 'ashismo@gmail.com', NULL, '2018-03-12 16:44:33', '2018-03-12 16:44:33');
/*!40000 ALTER TABLE `movie_details` ENABLE KEYS */;

-- Dumping structure for table movie.movie_masters
DROP TABLE IF EXISTS `movie_masters`;
CREATE TABLE IF NOT EXISTS `movie_masters` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `movie_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `movie_duration` int(11) NOT NULL,
  `release_date` date NOT NULL,
  `created_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_name` (`movie_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.movie_masters: ~3 rows (approximately)
/*!40000 ALTER TABLE `movie_masters` DISABLE KEYS */;
REPLACE INTO `movie_masters` (`id`, `movie_name`, `movie_duration`, `release_date`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
	(1, 'Test', 120, '2018-01-13', 'ashismo@gmail.com', NULL, '2018-03-10 19:11:06', '2018-03-10 19:11:06'),
	(2, 'TEST1', 120, '2018-01-13', 'ashismo@gmail.com', NULL, '2018-03-10 19:53:21', '2018-03-10 19:53:21'),
	(7, 'TEST2', 120, '2018-01-13', 'ashismo@gmail.com', NULL, '2018-03-10 20:09:51', '2018-03-10 20:09:51');
/*!40000 ALTER TABLE `movie_masters` ENABLE KEYS */;

-- Dumping structure for table movie.oauth_access_tokens
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.oauth_access_tokens: ~4 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
REPLACE INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('0afc0e8b01932cb68140280db31950dee92ab73f267974de98a42ef6ec6d1e2e5ed199a15df48265', 1, 1, 'MyApp', '[]', 0, '2018-03-11 08:08:19', '2018-03-11 08:08:19', '2019-03-11 08:08:19'),
	('14988eb580ca1a16b2e2aab9ecebe55498ee1ec3b6a1e48b0e9de79c004d0505cf5d039493ec8127', 1, 1, 'MyApp', '[]', 0, '2018-03-10 17:56:13', '2018-03-10 17:56:13', '2019-03-10 17:56:13'),
	('18d72ee4d0a4b7c7b8a7689feca86fadde1faa0c8956f0abee60ec79b119c5c09896cadddb0b0323', 1, 1, 'MyApp', '[]', 0, '2018-03-11 08:02:16', '2018-03-11 08:02:16', '2019-03-11 08:02:16'),
	('334adb1d6ac9de8163e0485e2effefdedcb8d2ee36075ac7886f71dc8a293ab5cabdba2952d075d0', 1, 1, 'MyApp', '[]', 0, '2018-03-11 08:13:40', '2018-03-11 08:13:40', '2019-03-11 08:13:40'),
	('357d2e4706ed446bda012bc83860120dfc0e7b2fbf0ac83f9a59c31ca348f776b080ce82be981e7a', 1, 1, 'MyApp', '[]', 0, '2018-03-11 08:13:58', '2018-03-11 08:13:58', '2019-03-11 08:13:58'),
	('4852802daa37f75a950cc7e81f1e0e3b8b1f44d2b1a576ee3be04d7de654a023a38071f47da9e5dd', 1, 1, 'MyApp', '[]', 0, '2018-03-11 08:08:53', '2018-03-11 08:08:53', '2019-03-11 08:08:53'),
	('5b097509b2dc53da73df952a77e28254b1a35692667d57c6368067a9e22141237a10e4dcb666f380', 1, 1, 'MyApp', '[]', 0, '2018-03-11 08:03:23', '2018-03-11 08:03:23', '2019-03-11 08:03:23'),
	('5b133edc9f3d037c743fbfaf02e69a1f4183392bd13367333cb92a8520a58db6cb872d6c06786ae6', 1, 1, 'MyApp', '[]', 0, '2018-03-10 18:04:48', '2018-03-10 18:04:48', '2019-03-10 18:04:48'),
	('5c6f1550a14334b62db2265a6e0ed0774249e5f98415cf9c2f9a20b20d05c0b1a799266622a51520', 1, 1, 'MyApp', '[]', 0, '2018-03-11 17:22:22', '2018-03-11 17:22:22', '2019-03-11 17:22:22'),
	('5f5e5df9a1115d4ce67e327b6f458686bb53b17faf92f05c40d813c22c5186fde3dd66d7c78cd2c7', 1, 1, 'MyApp', '[]', 0, '2018-03-11 08:04:55', '2018-03-11 08:04:55', '2019-03-11 08:04:55'),
	('69b5d44e88b508bcc141b857a22f2eff88057a3bc4bcf52ec4837133f855cfa1dbf9342a97e01d7b', 1, 1, 'MyApp', '[]', 0, '2018-03-11 19:50:44', '2018-03-11 19:50:44', '2019-03-11 19:50:44'),
	('79bb358d7cb25b27371cea9540cb8e03c192fd3d1c3a4fa7be17a04b28fe314bd1de0328aafa19c4', 1, 1, 'MyApp', '[]', 0, '2018-03-11 07:36:48', '2018-03-11 07:36:48', '2019-03-11 07:36:48'),
	('bbbd17bb5f05d8af38242b1622602b85914344d73dd0d7f0e14ad1ca7852dd62cf85ce1989cec855', 1, 1, 'MyApp', '[]', 0, '2018-03-11 08:07:39', '2018-03-11 08:07:39', '2019-03-11 08:07:39'),
	('c483e3b0937120f639fe0d5fd6d5c7a144df1ef065305784db647abed1516f6280e5901b936bb76b', 1, 1, 'MyApp', '[]', 0, '2018-03-10 04:25:42', '2018-03-10 04:25:42', '2019-03-10 04:25:42'),
	('f77bf00f5c5e011fea10f7d4b31bbd9348d0a55e02bf5db47eb503535a60ee967be41479a48b82f5', 1, 1, 'MyApp', '[]', 0, '2018-03-11 08:08:10', '2018-03-11 08:08:10', '2019-03-11 08:08:10');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table movie.oauth_auth_codes
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.oauth_auth_codes: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table movie.oauth_clients
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.oauth_clients: ~2 rows (approximately)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
REPLACE INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'School Personal Access Client', 'rrmjFnFPVER1WcaJ2ROyS48KEg0QuU7nnXPUR5eL', 'http://localhost', 1, 0, 0, '2018-03-10 04:25:25', '2018-03-10 04:25:25'),
	(2, NULL, 'School Password Grant Client', 'DaPrrJsmzcnAxbPRoW4NvtZeV2YHrrX82ajuZQRg', 'http://localhost', 0, 1, 0, '2018-03-10 04:25:25', '2018-03-10 04:25:25');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table movie.oauth_personal_access_clients
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.oauth_personal_access_clients: ~1 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
REPLACE INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2018-03-10 04:25:25', '2018-03-10 04:25:25');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table movie.oauth_refresh_tokens
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.oauth_refresh_tokens: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Dumping structure for table movie.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table movie.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table movie.permission_role
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.permission_role: ~0 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table movie.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
REPLACE INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'Administrator', 'Administrator', NULL, NULL),
	(2, 'frontdesk', 'Front Desk', 'Front Desk', NULL, NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table movie.role_user
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.role_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
REPLACE INTO `role_user` (`user_id`, `role_id`) VALUES
	(1, 1),
	(1, 2);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Dumping structure for table movie.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table movie.users: ~1 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Ashish', 'ashismo@gmail.com', '$2y$10$.i/dFSW1P6m31bfaB5DUr.hVmV1dsa5.LeScvRUgC/z0KyxGbgl4m', NULL, '2018-03-10 04:23:15', '2018-03-10 04:23:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
