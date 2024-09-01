-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 01, 2024 at 07:16 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_08_24_000001_create_projects_table', 1),
(5, '2024_09_01_000000_create_tasks_table', 1),
(6, '2024_09_01_184943_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `owner_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_owner_id_foreign` (`owner_id`),
  KEY `projects_category_id_foreign` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `description`, `owner_id`, `category_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 'Asperiores nihil fuga fuga sint.', 'Dolor est iste delectus et ea velit. Placeat consequuntur quod molestias. Enim qui culpa ab ipsam.', 1, 6, '2024-09-01', '2024-09-28', '2024-09-01 15:16:18', '2024-09-01 15:16:18'),
(2, 'Recusandae deserunt aliquid molestias repudiandae non ex et.', 'Illo enim autem minima non quia nisi dignissimos. Provident error soluta molestias veniam in incidunt. Qui doloribus fugit omnis cumque sequi. Adipisci adipisci eveniet reprehenderit culpa exercitationem. Quas tempora qui sapiente corporis.', 1, 4, '2024-08-31', '2024-09-28', '2024-09-01 15:16:18', '2024-09-01 15:16:18'),
(3, 'Soluta rerum dolor aspernatur error debitis iure ratione mollitia nulla.', 'Quae iusto consequatur debitis aut et aut aut. Eius aut nihil est vero. Molestiae eaque non necessitatibus et rerum. Reiciendis nisi sint odio.', 1, 6, '2024-08-29', '2024-09-22', '2024-09-01 15:16:18', '2024-09-01 15:16:18'),
(4, 'Aperiam et dolor quam quibusdam et.', 'Quia facilis aut id rerum ab vitae. Et est omnis architecto distinctio non tempore illum dolorem. Reprehenderit ipsam voluptatibus voluptate dolorem dolor autem non sunt. Repudiandae sed qui omnis voluptatem molestiae.', 1, 9, '2024-09-01', '2024-09-21', '2024-09-01 15:16:18', '2024-09-01 15:16:18'),
(5, 'Et amet maiores eum accusantium consectetur.', 'Ut quas quod rerum labore est. Natus autem provident possimus consequuntur. Sed illum error est omnis. Excepturi nemo placeat ullam eligendi harum perspiciatis rerum deleniti. Suscipit error molestiae cumque soluta.', 1, 5, '2024-09-01', '2024-09-22', '2024-09-01 15:16:18', '2024-09-01 15:16:18'),
(6, 'Accusantium officiis omnis explicabo provident recusandae quam.', 'Aut in eligendi expedita ipsum. Voluptatem labore eos ex mollitia quis doloremque deleniti omnis. In officia sint exercitationem.', 1, 2, '2024-08-26', '2024-09-15', '2024-09-01 15:16:18', '2024-09-01 15:16:18'),
(7, 'Rerum tenetur animi consequuntur est.', 'Error at et repellendus facere. Deleniti repellat pariatur maiores et tempora et. Ipsa qui ab voluptas autem ut et beatae. Aut illum nesciunt molestiae inventore libero omnis voluptatem.', 1, 1, '2024-08-29', '2024-09-11', '2024-09-01 15:16:18', '2024-09-01 15:16:18'),
(8, 'Necessitatibus consectetur molestiae cum quia ullam qui.', 'Velit est vel harum in harum eos velit. Numquam qui quia nihil laborum itaque quibusdam. Voluptatem et natus sunt animi sapiente nostrum eius.', 1, 1, '2024-09-01', '2024-09-11', '2024-09-01 15:16:18', '2024-09-01 15:16:18'),
(9, 'Tempore sed qui ut voluptate mollitia.', 'Inventore qui ipsa nihil. Qui quia in debitis rerum eaque illum libero iure. Dolor est illo non magnam enim.', 1, 8, '2024-08-30', '2024-09-10', '2024-09-01 15:16:18', '2024-09-01 15:16:18'),
(10, 'Itaque officiis est.', 'Quia rem consequatur voluptatum. Ipsam in natus placeat consequatur voluptatibus voluptas. Aliquam eligendi error quis qui.', 1, 9, '2024-08-30', '2024-09-17', '2024-09-01 15:16:18', '2024-09-01 15:16:18'),
(11, 'Non quis delectus tempora dolor.', 'Cumque iusto placeat et nihil. Inventore quis tenetur dolores expedita sunt. Neque possimus accusamus in est. Qui dolor eligendi quo et explicabo dolor.', 1, 8, '2024-08-30', '2024-09-10', '2024-09-01 15:16:18', '2024-09-01 15:16:18'),
(12, 'Ipsam error omnis incidunt eligendi et quidem.', 'Et necessitatibus omnis enim. Voluptas dignissimos et laudantium minus quae.', 1, 5, '2024-08-30', '2024-09-17', '2024-09-01 15:16:18', '2024-09-01 15:16:18'),
(13, 'Consectetur nobis voluptatibus voluptatem perferendis inventore.', 'Quia deserunt quae enim optio quis ab repellat voluptas. Ut qui veritatis sed et.', 1, 2, '2024-08-26', '2024-09-13', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(14, 'Beatae ea ad enim aut.', 'Aspernatur soluta voluptates debitis. Enim corporis id veniam vel. Impedit voluptatem rerum atque facere.', 1, 2, '2024-08-30', '2024-09-23', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(15, 'Dolores totam quia reprehenderit qui aliquid quis doloremque maiores.', 'In cupiditate quis quasi non. Sed est placeat voluptatem est vero. Omnis accusamus perferendis illo non. Ipsa omnis quis est dolorem vitae.', 1, 5, '2024-09-01', '2024-10-01', '2024-09-01 15:16:19', '2024-09-01 15:16:19');

-- --------------------------------------------------------

--
-- Table structure for table `project_categories`
--

DROP TABLE IF EXISTS `project_categories`;
CREATE TABLE IF NOT EXISTS `project_categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_categories`
--

INSERT INTO `project_categories` (`id`, `name`, `icon`, `color`, `created_at`, `updated_at`) VALUES
(1, 'UI/UX Design', 'icofont-designfloat', 'light-info-bg', NULL, NULL),
(2, 'Website Design', 'icofont-web', 'bg-lightgreen', NULL, NULL),
(3, 'App Development', 'icofont-stock-mobile', 'bg-lightyellow', NULL, NULL),
(4, 'Quality Assurance', 'icofont-star', 'light-success-bg', NULL, NULL),
(5, 'Development', 'icofont-code-alt', 'light-orange-bg', NULL, NULL),
(6, 'Backend Development', 'icofont-code', 'bg-careys-pink', NULL, NULL),
(7, 'Software Testing', 'icofont-test-tube-alt', 'bg-lightblue', NULL, NULL),
(8, 'Marketing', 'icofont-brand-hallmark', 'light-danger-bg', NULL, NULL),
(9, 'SEO', 'icofont-search-document', 'bg-santa-fe', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_user`
--

DROP TABLE IF EXISTS `project_user`;
CREATE TABLE IF NOT EXISTS `project_user` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_user_project_id_foreign` (`project_id`),
  KEY `project_user_user_id_foreign` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_user`
--

INSERT INTO `project_user` (`id`, `project_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 22, NULL, NULL),
(2, 1, 24, NULL, NULL),
(3, 1, 31, NULL, NULL),
(4, 1, 29, NULL, NULL),
(5, 1, 23, NULL, NULL),
(6, 1, 1, NULL, NULL),
(7, 2, 11, NULL, NULL),
(8, 2, 10, NULL, NULL),
(9, 2, 5, NULL, NULL),
(10, 2, 30, NULL, NULL),
(11, 2, 19, NULL, NULL),
(12, 2, 1, NULL, NULL),
(13, 3, 12, NULL, NULL),
(14, 3, 10, NULL, NULL),
(15, 3, 27, NULL, NULL),
(16, 3, 5, NULL, NULL),
(17, 3, 14, NULL, NULL),
(18, 3, 17, NULL, NULL),
(19, 3, 1, NULL, NULL),
(20, 4, 5, NULL, NULL),
(21, 4, 3, NULL, NULL),
(22, 4, 22, NULL, NULL),
(23, 4, 13, NULL, NULL),
(24, 4, 7, NULL, NULL),
(25, 4, 8, NULL, NULL),
(26, 4, 1, NULL, NULL),
(27, 5, 13, NULL, NULL),
(28, 5, 25, NULL, NULL),
(29, 5, 12, NULL, NULL),
(30, 5, 27, NULL, NULL),
(31, 5, 1, NULL, NULL),
(32, 6, 23, NULL, NULL),
(33, 6, 4, NULL, NULL),
(34, 6, 24, NULL, NULL),
(35, 6, 2, NULL, NULL),
(36, 6, 1, NULL, NULL),
(37, 7, 6, NULL, NULL),
(38, 7, 10, NULL, NULL),
(39, 7, 9, NULL, NULL),
(40, 7, 7, NULL, NULL),
(41, 7, 3, NULL, NULL),
(42, 7, 1, NULL, NULL),
(43, 8, 14, NULL, NULL),
(44, 8, 20, NULL, NULL),
(45, 8, 19, NULL, NULL),
(46, 8, 28, NULL, NULL),
(47, 8, 1, NULL, NULL),
(48, 9, 17, NULL, NULL),
(49, 9, 16, NULL, NULL),
(50, 9, 1, NULL, NULL),
(51, 10, 13, NULL, NULL),
(52, 10, 22, NULL, NULL),
(53, 10, 24, NULL, NULL),
(54, 10, 1, NULL, NULL),
(55, 11, 9, NULL, NULL),
(56, 11, 15, NULL, NULL),
(57, 11, 25, NULL, NULL),
(58, 11, 1, NULL, NULL),
(59, 12, 16, NULL, NULL),
(60, 12, 12, NULL, NULL),
(61, 12, 9, NULL, NULL),
(62, 12, 10, NULL, NULL),
(63, 12, 23, NULL, NULL),
(64, 12, 2, NULL, NULL),
(65, 12, 28, NULL, NULL),
(66, 12, 1, NULL, NULL),
(67, 13, 15, NULL, NULL),
(68, 13, 21, NULL, NULL),
(69, 13, 1, NULL, NULL),
(70, 14, 12, NULL, NULL),
(71, 14, 23, NULL, NULL),
(72, 14, 14, NULL, NULL),
(73, 14, 28, NULL, NULL),
(74, 14, 1, NULL, NULL),
(75, 15, 3, NULL, NULL),
(76, 15, 7, NULL, NULL),
(77, 15, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` int NOT NULL DEFAULT '0',
  `priority` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'low',
  `project_id` bigint UNSIGNED NOT NULL,
  `assigned_id` bigint UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_project_id_foreign` (`project_id`),
  KEY `tasks_assigned_id_foreign` (`assigned_id`)
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `priority`, `project_id`, `assigned_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(1, 'Facilis magnam dolores enim neque.', 'Tempore asperiores et delectus corporis aut non blanditiis. Tenetur aperiam nobis deleniti necessitatibus vel error voluptatem. Incidunt laborum facere mollitia sint est ut et ipsum. Deserunt reiciendis corrupti suscipit et quisquam voluptatem et. Molestiae rerum et aut.', 0, 'low', 1, 1, '2024-08-30', '2024-09-17', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(2, 'Magnam mollitia ut aut autem.', 'Ipsa iusto corrupti ad voluptatem distinctio. Delectus doloribus quae est dignissimos reprehenderit et enim. Culpa eum quibusdam repellendus voluptas et sed omnis.', 0, 'medium', 1, 24, '2024-08-27', '2024-09-22', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(3, 'Praesentium accusamus quis harum consequatur.', 'Eveniet ea vel nemo. Natus ducimus necessitatibus incidunt dolores eaque. Itaque provident aut eos corporis quos dolore corrupti sit. Ad iste sit ipsum non. Rerum aut omnis aut quas.', 0, 'high', 1, 22, '2024-08-29', '2024-09-29', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(4, 'Nobis dolorem et magnam iste blanditiis totam mollitia.', 'Qui maiores sit laudantium iste aut nesciunt. Aut minima est dolore. Omnis eaque similique hic.', 0, 'medium', 1, 22, '2024-08-30', '2024-09-27', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(5, 'Sed sequi tempora dolorum ut architecto perspiciatis.', 'Impedit pariatur repudiandae mollitia ipsam qui. Ipsam aut molestias consequatur incidunt aut ex nulla molestiae. Et maxime sunt consequatur consequatur exercitationem repudiandae. Debitis itaque vel quia porro omnis magni. Sit quam non sunt vero aspernatur exercitationem. Repudiandae officiis aperiam et molestiae quia sint cum.', 0, 'medium', 1, 1, '2024-08-29', '2024-09-10', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(6, 'Adipisci ea similique hic iure ratione.', 'Ut assumenda rerum molestiae delectus aut. Vitae necessitatibus cum et molestiae dolore similique. Neque maxime est sint dolorem est sunt. Qui laudantium numquam quis quia. Voluptatibus voluptas reprehenderit voluptatem earum. Magni et ducimus blanditiis sit fugit ipsa autem.', 0, 'medium', 1, 22, '2024-08-31', '2024-09-24', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(7, 'Et aliquam ipsum itaque rerum.', 'Perspiciatis velit ea omnis nam assumenda asperiores quasi. Ex est optio ducimus aliquid ea repellendus. Consequuntur quia ut placeat sed quisquam exercitationem sint voluptatem. Rerum eum non ipsum qui ut. Rerum quod exercitationem reiciendis earum recusandae eius quia quia. Nostrum nisi qui unde animi.', 1, 'medium', 1, 1, '2024-08-30', '2024-09-20', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(8, 'Accusantium id sint est est amet sunt repellat.', 'Totam perferendis recusandae dolores dolores est qui a perspiciatis. Aliquam veritatis fuga doloremque qui qui voluptas. Ducimus consequatur odio perferendis deserunt. Eos aut recusandae eos ullam quia quae. Voluptatem omnis perspiciatis adipisci animi aut quas. Quis veritatis non natus eos. Assumenda accusamus asperiores aut blanditiis ut blanditiis.', 1, 'high', 1, 1, '2024-08-30', '2024-09-17', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(9, 'Perspiciatis aut velit totam officiis alias expedita.', 'Est quibusdam numquam aut quibusdam illo inventore voluptatem. Molestiae qui soluta ipsa et labore nostrum et. Non ut ratione culpa labore. Ab officia quia voluptatem. Omnis nemo eligendi aliquid quia. Distinctio optio quia dicta soluta.', 1, 'medium', 1, 31, '2024-08-28', '2024-09-20', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(10, 'Qui ad quibusdam sit dolores impedit nobis est.', 'Quibusdam eligendi ipsum magni eos aliquam. Voluptas aut quo placeat praesentium voluptate suscipit est perspiciatis. Temporibus quibusdam esse voluptatum nemo voluptas quibusdam aut sint. Autem suscipit culpa dolores facilis. Quod nemo nemo ea maiores magni sit. Repellendus deleniti suscipit explicabo veritatis quaerat aut voluptates.', 1, 'medium', 1, 23, '2024-08-28', '2024-10-01', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(11, 'Et quo similique quia est.', 'Unde iste deleniti est eos illum consequatur. Fuga qui ullam et deserunt quo voluptas occaecati. Fugiat quo voluptas ab aperiam quibusdam porro laudantium. Eos ut id ut non veritatis voluptatem.', 1, 'low', 1, 24, '2024-08-27', '2024-09-28', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(12, 'Quia vel tempore perspiciatis quam quia qui sit qui tempora.', 'Quisquam ex accusantium quisquam odit quis. Quibusdam vero inventore architecto molestiae soluta deleniti aut. Expedita et impedit voluptatem sunt explicabo. Similique dolorem sint tempore qui consectetur expedita.', 1, 'high', 1, 1, '2024-09-01', '2024-09-22', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(13, 'Est voluptates necessitatibus omnis porro.', 'Inventore et asperiores accusantium placeat. Itaque voluptatibus repellat porro excepturi voluptas qui inventore. Rerum delectus omnis eius eos. Porro tenetur eligendi sunt molestiae sint.', 2, 'medium', 1, 1, '2024-08-26', '2024-09-23', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(14, 'Aliquam aliquid id maiores ducimus esse neque.', 'Voluptatem nisi ab quia sapiente. Voluptatem soluta laudantium in omnis inventore assumenda harum eos. Quaerat omnis sit officiis dolor maiores.', 2, 'low', 1, 22, '2024-09-01', '2024-09-29', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(15, 'Et aspernatur quia dicta.', 'Mollitia voluptas quaerat perferendis et suscipit suscipit quis. Ut doloremque esse et id porro autem sint. Molestiae voluptatibus qui omnis. Magnam perferendis nihil est illum voluptas. Odio et non totam.', 2, 'medium', 1, 22, '2024-08-30', '2024-09-28', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(16, 'Aspernatur aut et repudiandae exercitationem molestiae.', 'Nam ratione totam omnis officiis pariatur eum magnam. Quo ad repellendus quasi aut earum omnis sed. Vero aliquam consequuntur quas saepe similique officia. Dolor illo dicta id non. Eos vel dolorem at nostrum qui. Praesentium omnis officia rerum est consectetur explicabo aut voluptatem.', 2, 'low', 1, 29, '2024-08-26', '2024-09-10', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(17, 'Consequuntur et exercitationem autem consectetur architecto voluptas sed quam quia.', 'Rerum cupiditate impedit iusto. Eos eius dicta dignissimos pariatur aliquam voluptatum. Exercitationem eius sint quae aut. Deleniti distinctio omnis tempore. Iure officiis quas facere veniam quos illo iure. Sapiente dolor quidem fuga.', 3, 'low', 1, 1, '2024-08-30', '2024-09-24', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(18, 'Voluptatibus saepe ipsum saepe aperiam.', 'Quia ea ut magni quo et minus. Ad quia saepe similique voluptas. Natus asperiores provident dolores voluptas ut harum. Dolores ducimus modi vero laboriosam aliquam voluptatum sit. Praesentium quas pariatur vel quis qui.', 3, 'medium', 1, 1, '2024-08-26', '2024-09-24', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(19, 'Magni quia ex et autem ipsam suscipit aliquid itaque odit blanditiis.', 'Sed quaerat libero enim vero iusto eos sit. Placeat distinctio et sit ratione vitae molestiae accusamus ea. Eum expedita ducimus delectus est impedit sunt nihil.', 3, 'high', 1, 24, '2024-08-31', '2024-09-21', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(20, 'Tempora eveniet sed non a.', 'Vitae nihil aliquid enim nobis rerum. Quo laudantium eum veritatis id. Suscipit aut vitae et voluptatum odio eligendi doloribus mollitia. Recusandae ut iste ad corrupti saepe nemo. Provident unde autem veritatis.', 3, 'high', 1, 23, '2024-08-25', '2024-10-01', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(21, 'Quae consequatur non esse saepe aut repudiandae unde omnis.', 'At qui maxime provident laborum ipsa ea aspernatur. Ipsum placeat repellat id quidem cupiditate non non. Ipsam eligendi molestias a tempora rerum. Dignissimos possimus non vitae hic sit pariatur dolor.', 0, 'medium', 2, 11, '2024-08-26', '2024-10-01', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(22, 'Atque veritatis et quas quidem.', 'Minima cum illo voluptas dolorem ea itaque cum ad. Sunt atque nihil repudiandae vel velit culpa. Quia necessitatibus dignissimos officia id fugit deserunt quia. Labore recusandae velit vel.', 0, 'high', 2, 19, '2024-09-01', '2024-09-30', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(23, 'Blanditiis est praesentium alias qui eaque quia.', 'Animi aut aut natus aut quia magnam. Quos et possimus ut expedita maiores. Eligendi consequatur sit sint numquam nesciunt. Quis aspernatur sint rerum et. Voluptatum sint totam magni dignissimos.', 0, 'high', 2, 11, '2024-08-28', '2024-09-15', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(24, 'Explicabo harum sequi reiciendis ea exercitationem necessitatibus.', 'Et nihil rerum excepturi et molestiae dolorum. Consequatur iusto qui deserunt ad et dolorem aut. Atque et et corrupti tempore voluptate dolor. Non molestiae odit consequuntur expedita soluta eius consequatur. Corrupti autem eius molestiae dolorem sunt rem sit.', 0, 'high', 2, 5, '2024-09-01', '2024-09-09', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(25, 'Doloribus officiis aut labore aut eius aliquid dolorum unde eos.', 'Iusto iusto accusamus dolorem. Ea odit non architecto corporis eos incidunt quos. Temporibus eius facilis assumenda nam ea voluptatum.', 0, 'low', 2, 5, '2024-08-31', '2024-09-21', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(26, 'Nisi deleniti ut aliquam.', 'Officia consequatur quia vitae in magni et ut quaerat. Quod ad illum nihil officia. Iste sit est nemo quis. Quaerat neque esse sunt odio aliquid suscipit. Consequatur et corrupti assumenda neque dolores corrupti.', 1, 'high', 2, 10, '2024-08-28', '2024-09-12', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(27, 'Officiis omnis minus.', 'Nemo odio dolores consequuntur rerum qui veritatis deserunt. Aut omnis ad voluptas qui repudiandae non. Qui consequatur ex distinctio qui.', 1, 'high', 2, 11, '2024-08-26', '2024-09-25', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(28, 'Rem et illo minima rerum.', 'Dolorem corrupti illum natus voluptate qui. Esse placeat aut dolores ab dolor rem. In rerum id labore quidem praesentium. Velit veritatis laudantium repellat enim sit qui ea. Quis optio quasi possimus quaerat ea. Officiis adipisci enim doloribus aut.', 1, 'low', 2, 10, '2024-08-26', '2024-09-22', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(29, 'Ab recusandae qui sunt iure magni voluptatem sit.', 'Voluptas eius nostrum placeat error. Et a tempore nam vel vero itaque. Vel ex ab hic necessitatibus natus. Ipsa et saepe optio nulla voluptatibus maxime ex.', 1, 'medium', 2, 5, '2024-08-27', '2024-09-23', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(30, 'Quisquam voluptatem magni quia possimus fugiat.', 'Et enim quidem eveniet et cumque. Tempore magnam magni perspiciatis non hic. Ad quisquam necessitatibus perspiciatis deleniti id saepe. Quibusdam rem mollitia qui. Occaecati ducimus placeat fugit omnis et.', 2, 'low', 2, 19, '2024-08-28', '2024-09-09', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(31, 'Perspiciatis impedit consequatur quo necessitatibus aperiam vero necessitatibus.', 'Deleniti ratione id magnam aut blanditiis deleniti facere. Quo est praesentium saepe corrupti ipsam esse. Laudantium dolor minima aut distinctio tenetur consequatur. Cumque velit aperiam aut consequatur qui. Rerum assumenda aut eos voluptatibus. Dolores magnam quibusdam illo eligendi rerum quibusdam aut.', 2, 'low', 2, 1, '2024-08-29', '2024-09-09', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(32, 'Recusandae dolores quos doloribus.', 'Saepe eaque ex non quia eos tenetur. Architecto omnis qui eveniet perspiciatis. Autem debitis ut omnis. Nemo officiis repellat officia ducimus harum. Non natus inventore reprehenderit dicta praesentium ut ut. Ipsa laboriosam officiis tenetur illo iure consequuntur. Sint eligendi enim inventore dolorum ipsam qui eius.', 2, 'medium', 2, 1, '2024-08-26', '2024-09-21', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(33, 'Et laboriosam consequatur voluptates omnis officia.', 'Illo doloribus asperiores iusto optio distinctio est. Non eveniet eum mollitia perferendis. Sapiente voluptas fugit qui consequuntur laborum nihil at. Dolor aut autem excepturi harum repellendus fugiat possimus. Saepe nihil temporibus consequuntur. Quas voluptatem quibusdam corrupti quis.', 2, 'medium', 2, 11, '2024-09-01', '2024-09-10', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(34, 'Id natus similique consequatur.', 'Deleniti excepturi aut tenetur voluptas laboriosam ab. Voluptatem eos tempora et nulla quis mollitia. Est quia quis nisi quia impedit fuga. Facere quibusdam accusantium earum at quaerat repellendus. Qui qui eaque voluptas quia atque omnis quidem. Consequuntur accusantium quo inventore neque fugiat. Unde sed error est perspiciatis.', 2, 'low', 2, 10, '2024-08-27', '2024-09-29', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(35, 'Quo maiores omnis sed consequatur dolor.', 'Ut occaecati libero quam aliquam hic tenetur consequatur explicabo. Et dolorem quisquam consequatur eaque eum sit odio. Magni cupiditate magnam sit porro expedita dolorum at debitis. Et sit saepe ut qui optio.', 2, 'low', 2, 30, '2024-08-27', '2024-09-14', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(36, 'Dignissimos molestiae sed dolorem illum hic delectus quisquam rem et quia ea.', 'Quisquam soluta ab alias animi aperiam error veniam. Exercitationem officiis totam sed aut aperiam. Omnis sit placeat ducimus dicta. Dolore qui nihil iste consequuntur ut. Inventore enim quia rem illum velit dolores et dolor.', 3, 'low', 2, 19, '2024-08-30', '2024-09-13', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(37, 'Eos animi eaque quia alias facere.', 'Sit aspernatur ducimus accusantium maiores qui et. Occaecati quam ut velit voluptatem officia sint quos. Harum est et vel consectetur eaque aut. Excepturi ut tenetur enim tempore cumque libero molestiae.', 3, 'high', 2, 1, '2024-08-26', '2024-09-23', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(38, 'Debitis excepturi sequi dolores aut sequi et rerum maxime qui aliquam.', 'Totam nihil et deserunt in praesentium. Accusantium inventore aliquam accusantium minus magnam rerum. Necessitatibus est nisi sit necessitatibus fugit molestiae. Ducimus ut qui qui vitae. Est similique ut porro nostrum ut. Totam quo dolores doloremque qui consequatur occaecati.', 3, 'low', 2, 30, '2024-09-01', '2024-09-11', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(39, 'Facilis qui et molestias officia commodi sed.', 'Nihil quo quo vero ad est eius saepe. Culpa unde porro porro eligendi. Consequuntur et quidem eaque magni. At ea provident et dolorum in. Distinctio incidunt natus veniam et unde unde aut. Quia est ad rerum dolores ipsam tempore.', 3, 'high', 2, 11, '2024-08-26', '2024-09-16', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(40, 'Quasi repudiandae fuga qui officia sunt officiis.', 'Explicabo dolorum quod quam doloribus ut. Facere sed est cupiditate sed. Et sit recusandae id officiis fuga provident qui. Minima commodi distinctio non culpa.', 0, 'low', 3, 1, '2024-08-30', '2024-09-15', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(41, 'Laboriosam enim praesentium odio ipsam qui sint illum.', 'Suscipit recusandae nisi cupiditate praesentium et id neque est. Doloribus eos nulla id. Voluptatem totam ratione ea cumque minima eum et. Rerum iure vitae corrupti corporis nihil quaerat. Error iste molestiae culpa in veritatis.', 0, 'low', 3, 14, '2024-08-27', '2024-09-10', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(42, 'Impedit a non et sit.', 'Et expedita ab exercitationem. Voluptatem consectetur adipisci officiis distinctio. Et non rerum aspernatur nam quia. Minima adipisci eum saepe numquam asperiores laborum voluptates. Dolore omnis repellendus architecto rerum iste magni facilis. Modi nihil in dolor quae amet.', 0, 'medium', 3, 10, '2024-08-29', '2024-09-14', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(43, 'Consequatur nemo voluptate nihil quam non.', 'Ut nemo tempora perspiciatis quia maiores et qui. Voluptatem id dolor autem consequatur natus consequatur quo. Magni nihil sint aut. Nam placeat dolorum omnis.', 0, 'high', 3, 1, '2024-08-25', '2024-09-22', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(44, 'Velit omnis aut labore sapiente qui et ea.', 'Nemo reiciendis corrupti facere nihil voluptatibus. Optio amet architecto cupiditate est quia tenetur aliquam. Odit est necessitatibus sit quisquam. Labore quibusdam deserunt voluptates magnam expedita rerum. Sunt officia natus dolores soluta ipsa aliquid.', 0, 'high', 3, 12, '2024-08-27', '2024-09-27', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(45, 'Perspiciatis velit vero et maxime perferendis.', 'Reiciendis totam consequatur et aliquam et. Qui facilis perferendis cumque. Nihil reiciendis nihil repudiandae. Ab est culpa recusandae accusamus nisi quibusdam quod assumenda. Qui magni laudantium repudiandae aut adipisci veritatis facere.', 0, 'low', 3, 14, '2024-08-30', '2024-09-13', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(46, 'Magnam blanditiis ut vero sed maxime.', 'Optio rerum et inventore eos quod ut eius. Voluptate expedita et ut nobis. Est enim quidem nesciunt. Voluptatem animi iure voluptas omnis quisquam eos. Totam id dolor quam qui deserunt. Sit enim illo soluta aut dolor sit ut.', 1, 'high', 3, 12, '2024-08-26', '2024-09-13', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(47, 'Dolorem suscipit libero culpa.', 'Porro vitae voluptate iusto dolor. Ut veniam velit recusandae iste sit. Numquam et nihil eaque voluptatem alias autem culpa. Fuga ad fugiat quod aut ut quia occaecati. Voluptatem error voluptatibus earum consectetur a sunt. Voluptate saepe consequatur omnis ducimus eos. Quos est recusandae quaerat sint.', 1, 'low', 3, 10, '2024-08-26', '2024-09-28', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(48, 'Facere debitis eum quod ullam.', 'Facere consequuntur laudantium numquam cupiditate ratione ducimus et sed. Soluta autem harum ea deleniti beatae. Nesciunt totam ipsum dolore provident. Assumenda voluptates sequi non quia et nisi sit. Praesentium debitis cupiditate accusamus dolorum corrupti.', 1, 'high', 3, 14, '2024-08-28', '2024-09-10', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(49, 'Accusamus ut vero sunt occaecati magni iure ab qui.', 'Voluptatum quos eius libero eum illum aut quisquam officia. Et modi dolores nam. Dolor sequi doloremque est molestiae aliquid. Facilis libero nihil quaerat aspernatur rerum sequi mollitia. Sunt autem facilis recusandae quidem magni commodi placeat. Quae veniam necessitatibus et delectus dolores assumenda quis. Reiciendis expedita voluptatem perspiciatis recusandae. Nemo blanditiis fugiat similique aut.', 1, 'medium', 3, 1, '2024-08-29', '2024-09-30', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(50, 'Nisi sed mollitia ut at et magni qui et aut.', 'Natus et et inventore mollitia rerum porro id. Ipsum commodi quaerat sunt qui. Vel animi nihil perspiciatis deserunt unde iusto. Temporibus velit autem blanditiis. Harum suscipit ipsa exercitationem magni amet. Sit aut quia ut suscipit.', 2, 'low', 3, 17, '2024-08-28', '2024-09-18', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(51, 'Alias nisi dolore sint voluptas.', 'Distinctio occaecati similique quis. Provident temporibus temporibus voluptate veniam. Ut et facilis qui ex deserunt iusto rem. Consequuntur quasi sunt distinctio rerum ratione adipisci. Exercitationem et impedit autem ut voluptatum esse esse reiciendis.', 2, 'high', 3, 5, '2024-08-31', '2024-09-20', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(52, 'Sapiente vel voluptas labore libero ducimus aut aspernatur dolorem.', 'Ipsum et inventore dolores. Reiciendis omnis quos placeat in. Error eum consequatur voluptas non ea quia dicta. Consequuntur autem aut facere odio. Voluptatem aut minus sit omnis exercitationem. Voluptatem rerum ullam mollitia magnam quia saepe.', 2, 'low', 3, 5, '2024-09-01', '2024-09-30', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(53, 'Soluta quo enim et ut esse ea error rerum in.', 'Et esse laborum voluptas fuga. Aspernatur maxime atque ipsa nesciunt odio facere quibusdam. Et repudiandae inventore veritatis porro. Beatae omnis modi debitis quis quas vel nulla. In praesentium consequatur repellat et. Aliquid tempora odit sequi recusandae. Laudantium ea libero nesciunt sint inventore.', 2, 'low', 3, 5, '2024-08-29', '2024-09-14', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(54, 'Quod voluptas velit vitae commodi reiciendis repellendus aut.', 'Sapiente sunt nulla id at minima laboriosam voluptates. Inventore voluptatem non accusamus nobis dicta numquam. Ipsa aut fugiat aliquid libero recusandae.', 3, 'high', 3, 12, '2024-08-31', '2024-09-14', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(55, 'Rerum rerum non dolor doloremque aut velit.', 'Accusantium adipisci aliquid voluptatibus. Soluta nobis voluptatem corrupti est cumque accusamus. Culpa officia cum ad sed libero sed odio. Dolorem saepe qui sit fugiat.', 3, 'high', 3, 27, '2024-08-29', '2024-09-13', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(56, 'Aliquam provident omnis cupiditate aut omnis non architecto architecto eaque dolor hic.', 'Corporis omnis voluptate a et. Sed rerum ex aut ullam similique nihil. Vel tempore iste aut. Autem accusamus qui suscipit sint est illum nobis. Dolorem perferendis deserunt cupiditate expedita aliquam dicta. Et ut illo dolorem quam quam et animi.', 3, 'medium', 3, 1, '2024-08-26', '2024-09-25', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(57, 'Saepe excepturi vel ratione eum in et sit aut velit.', 'Et labore dolorum dolorum rerum in sint libero temporibus. Beatae perferendis necessitatibus eum dolorem molestiae eaque fugiat.', 3, 'low', 3, 12, '2024-08-26', '2024-10-01', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(58, 'Quis et enim ut.', 'Amet qui ea deserunt alias et molestias. Debitis dolores reiciendis ipsum veritatis atque delectus provident ex. Delectus beatae amet officiis qui quo quas quo. Sed est soluta illo inventore fuga in. Facere rem sint et.', 3, 'low', 3, 10, '2024-08-30', '2024-09-14', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(59, 'Libero dolore dolor quia culpa.', 'Doloribus doloremque ipsum harum. Odit possimus occaecati corrupti sint. Ut deleniti quis nam quia eligendi non non.', 0, 'medium', 4, 22, '2024-08-26', '2024-09-22', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(60, 'Quis ipsam quod recusandae sit eius repellat.', 'Quaerat illum fugiat qui rem consequatur recusandae. Neque fugiat voluptatem et nihil reiciendis voluptatum aut. Nihil dolores voluptas impedit totam perspiciatis et. Molestiae omnis ducimus quasi temporibus qui. Quos hic maxime sed et id ab eius.', 0, 'low', 4, 13, '2024-08-27', '2024-09-10', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(61, 'Quia corrupti nobis in omnis optio nulla voluptatibus occaecati iste.', 'Voluptas et velit quia ut. Reprehenderit iste doloribus qui. Consequatur ratione reprehenderit nam veniam culpa iste exercitationem quaerat. Nostrum sint cum consequatur dolores quasi.', 0, 'high', 4, 5, '2024-08-26', '2024-09-10', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(62, 'Provident et perferendis ut.', 'Asperiores dolorem nisi voluptas magnam veniam rem consectetur. Vero qui et placeat est. Omnis fugit sunt hic officia sunt est. Sunt praesentium ducimus rerum autem quia error cum.', 0, 'medium', 4, 3, '2024-08-29', '2024-09-17', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(63, 'Magnam a dolor est veritatis vel autem et aut adipisci.', 'Sit odio aperiam qui necessitatibus accusamus voluptates sint. Ut laudantium esse laudantium et rerum minus. Rerum ut dolor tenetur perspiciatis vitae natus adipisci. Molestias aspernatur laboriosam voluptatem et. Voluptas illum tenetur voluptas veritatis quis autem aut. Qui explicabo eum non. Consequatur officiis sapiente consequuntur accusantium nam mollitia. Voluptatum veritatis eligendi qui non hic est.', 0, 'high', 4, 1, '2024-08-31', '2024-09-22', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(64, 'Voluptates debitis aut voluptas nostrum illum ut eos.', 'Deserunt sed sed aut. Accusamus pariatur laborum dignissimos facere. Ut quo rerum consequuntur eum dolor iste.', 0, 'low', 4, 22, '2024-08-29', '2024-09-21', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(65, 'Placeat reiciendis ipsa ut quidem voluptas autem animi quae aut.', 'Voluptatem dolor assumenda omnis quis. Voluptates sunt dignissimos et. Et possimus voluptatum laboriosam consequatur corrupti.', 1, 'high', 4, 22, '2024-08-26', '2024-09-21', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(66, 'Aut sequi earum.', 'Qui distinctio facere omnis consequuntur dicta. Et ipsum odio in. Voluptatum harum minus temporibus amet expedita. Accusamus consectetur odio beatae nostrum eos optio.', 1, 'high', 4, 13, '2024-08-31', '2024-09-24', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(67, 'Dignissimos et architecto cupiditate.', 'Officia quia sit explicabo. Dolor placeat similique ab eum. Harum nemo dignissimos reprehenderit qui repellat corporis vel.', 1, 'high', 4, 7, '2024-08-27', '2024-09-22', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(68, 'Consequatur enim ad aut a dolore quaerat commodi.', 'Repudiandae reprehenderit qui et aliquid. Voluptatum dolore ipsam qui minima repellat consequuntur ut asperiores. Est sequi nesciunt autem rerum. Alias omnis in autem porro nisi. Blanditiis libero id aliquid. Fugit rerum consequatur officia est nobis voluptatem. Quas et eos et at unde at.', 1, 'medium', 4, 5, '2024-08-27', '2024-09-25', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(69, 'Molestiae est ut commodi dolore.', 'Ut est fuga quo et optio. Quis et ipsa numquam voluptatem. Facilis ipsam ducimus est natus vel sed. Minus nihil aut nulla nam dolore voluptatem cumque. Aperiam accusantium non nam et.', 1, 'low', 4, 5, '2024-08-27', '2024-09-19', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(70, 'Ea nesciunt debitis consequatur qui possimus debitis qui dignissimos aliquam iusto facilis.', 'Fugit qui repellendus numquam corporis harum. Laborum voluptas nam consectetur aliquam. Laboriosam nihil reiciendis ratione modi eveniet qui numquam architecto. Dignissimos asperiores voluptatem impedit exercitationem deserunt eligendi voluptatem. Sed omnis non et animi qui aut.', 1, 'low', 4, 8, '2024-08-29', '2024-09-23', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(71, 'Recusandae recusandae deleniti eaque nobis nesciunt.', 'Ullam dolores aut animi enim quidem est aut. Ducimus accusantium veritatis consequuntur aut enim est nisi. Totam quis sit modi tenetur. Officia nam corporis ut ut praesentium atque voluptate.', 2, 'high', 4, 7, '2024-08-26', '2024-09-19', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(72, 'Sequi tenetur laboriosam quasi tempora fugiat.', 'Culpa fugit eligendi qui quibusdam veritatis voluptates. Perferendis dolor nemo voluptas similique qui doloremque. Molestiae numquam in inventore eum qui. Dolorum expedita qui numquam temporibus magnam ut dolorem sit.', 2, 'low', 4, 8, '2024-08-28', '2024-09-12', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(73, 'Illo fugiat expedita dolore suscipit doloremque quam.', 'Nostrum est veritatis reprehenderit eaque ea. Quis soluta eaque blanditiis dolores quo autem. Deserunt eligendi molestiae voluptatem et ea fugiat.', 2, 'low', 4, 3, '2024-08-26', '2024-09-13', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(74, 'Tempora voluptas iusto voluptatem nihil mollitia.', 'A possimus ullam et qui. Consequatur minus omnis est qui sint. Et consequatur quia eos aperiam est quia. Magnam enim quia sed a ut vel qui. Quis qui est sint similique. Laborum sed dignissimos doloribus labore quis esse rem.', 2, 'low', 4, 3, '2024-08-28', '2024-10-01', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(75, 'Voluptatibus odio voluptatem impedit eveniet dolorem.', 'Rerum sapiente consequuntur error et. Eligendi voluptatem dicta ut velit quo impedit. Eos dolore iure fuga libero cumque. Quisquam perspiciatis libero a debitis aut quibusdam alias recusandae. Earum et esse dolorem sunt. Recusandae eius laborum nostrum voluptate consequatur voluptas dolores molestiae.', 2, 'high', 4, 3, '2024-09-01', '2024-09-09', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(76, 'Consectetur ea quas suscipit at est.', 'Consectetur est eum sequi reprehenderit. Unde inventore ullam fugiat eligendi iste. Id alias ea est nemo animi maiores doloribus velit. Quas magni aut laboriosam. Dolor voluptates ullam quaerat nulla qui culpa eos ea. Non ad excepturi voluptatem repellat amet sunt vel. Tenetur quia sint dolor explicabo.', 3, 'medium', 4, 22, '2024-08-27', '2024-09-16', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(77, 'Dolores et ducimus laudantium perferendis.', 'Animi nisi quia vel cupiditate repellat ipsam illo. Aut architecto nihil nisi vel corporis sed in commodi. Porro ullam totam nostrum similique aut ducimus dicta minima. Nesciunt praesentium rerum aliquid non.', 3, 'high', 4, 13, '2024-08-30', '2024-09-20', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(78, 'Ipsum sed corrupti sed magni quibusdam ex laborum eaque qui.', 'Animi molestiae veritatis sit et. Odit laborum et expedita non quae perferendis occaecati. Autem quae enim fuga nobis aliquid. Est aut aut est et praesentium voluptas. Et magni eos quae voluptatem ducimus. Molestias aut dignissimos unde voluptas est voluptas officiis. Incidunt sit facere quidem consequatur dolorem voluptatem.', 3, 'high', 4, 22, '2024-08-31', '2024-09-28', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(79, 'Doloribus unde praesentium commodi accusamus doloremque nesciunt.', 'Soluta ratione maiores ut vel et. Facilis consequuntur voluptas dolores omnis officiis. Autem odio quis iste odio optio corrupti porro magni. Omnis et nisi quis voluptatem molestias qui.', 3, 'medium', 4, 22, '2024-08-29', '2024-09-14', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(80, 'A facilis ipsum unde minus repudiandae.', 'At beatae in molestias sit. Et eligendi illo vitae et. Veniam laborum deleniti provident dolorem tenetur earum. Sapiente eum quam ex a velit. Ipsum officiis illo nam autem saepe.', 3, 'high', 4, 1, '2024-08-30', '2024-09-26', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(81, 'Provident facilis et culpa occaecati rem.', 'Velit et quia numquam modi alias eaque autem. Nesciunt voluptates sapiente quia. Quod eos repudiandae eum perspiciatis quaerat ratione.', 3, 'low', 4, 7, '2024-08-27', '2024-09-26', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(82, 'Aut quis provident itaque.', 'Architecto corporis itaque eum tenetur necessitatibus. Deserunt maxime et sunt sunt error et ex. Natus id quod maxime quae magni corporis similique. Ratione in ut impedit esse exercitationem odio. Ipsam quia ut aut tempora voluptatem aut. Error itaque nihil est expedita. Pariatur sapiente quibusdam illum tenetur quos pariatur similique minus.', 0, 'low', 5, 1, '2024-08-25', '2024-09-27', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(83, 'Ex sint sit necessitatibus dolorem praesentium repudiandae est dolor.', 'Occaecati eos porro vel voluptatem. Eos quis labore asperiores et et voluptas. Amet et ea repellendus.', 0, 'low', 5, 27, '2024-08-28', '2024-09-16', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(84, 'Sed autem neque sed porro est temporibus.', 'Voluptatem error numquam molestiae. Neque ratione modi voluptatibus deserunt.', 0, 'high', 5, 1, '2024-08-29', '2024-09-29', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(85, 'Est sint suscipit eius ut accusantium.', 'Dignissimos omnis dolore enim cumque. Porro qui minus ducimus blanditiis laudantium ipsam dignissimos. Iste provident quos perspiciatis sint. Voluptatem quam sit dignissimos explicabo velit accusantium autem sed.', 0, 'high', 5, 25, '2024-08-30', '2024-09-23', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(86, 'Ut voluptas est dolor aut commodi tempore illo.', 'Dolor libero qui ut ut maxime. Enim laudantium ut est et dignissimos. Debitis dolore sit laboriosam vel eos. Ducimus perspiciatis ab omnis et.', 0, 'low', 5, 27, '2024-08-27', '2024-09-15', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(87, 'Quia et vel.', 'Sunt quaerat architecto occaecati assumenda. Nobis asperiores voluptatem consequuntur numquam cumque labore. Dolor quod fugiat in ut qui enim.', 1, 'medium', 5, 12, '2024-08-27', '2024-09-15', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(88, 'Eum eaque error omnis nemo et.', 'In rerum cum asperiores. Debitis nisi tenetur quaerat sed. Ratione perspiciatis omnis laboriosam quos quia.', 1, 'low', 5, 25, '2024-08-29', '2024-09-13', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(89, 'Quia sunt beatae sed.', 'Hic maiores voluptate vero aut. Vero asperiores nisi repellat officia reiciendis earum. Perferendis temporibus sed delectus mollitia libero eum in. Expedita fuga excepturi illum nam. Reprehenderit eum necessitatibus autem sed cumque modi. Velit similique porro dolorem in iste.', 1, 'low', 5, 25, '2024-08-30', '2024-09-10', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(90, 'Illo dolorum occaecati quia odio.', 'Sequi voluptate facilis nisi adipisci at explicabo vitae velit. Esse dolor mollitia vel fugiat. Provident repudiandae quos soluta eos.', 1, 'low', 5, 27, '2024-08-27', '2024-09-09', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(91, 'Dolore et sed aut ratione officiis.', 'Repellat aut porro culpa expedita qui. Corporis quia nihil vel cum at similique. Ab laudantium voluptatem minima debitis.', 1, 'high', 5, 12, '2024-08-29', '2024-09-17', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(92, 'Ex incidunt voluptatibus est quidem qui occaecati rerum.', 'Laudantium ipsum nesciunt delectus saepe et ex soluta. Voluptas soluta expedita rerum autem. Et non quam qui pariatur. Optio sunt et quia dolor quia at qui distinctio. Voluptatibus rerum quidem in fugit dicta ea accusamus. Cupiditate facere iste nihil rerum.', 2, 'high', 5, 1, '2024-08-31', '2024-09-28', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(93, 'Molestiae delectus et.', 'Fuga eum id a assumenda ut quidem error. Nihil quis nostrum sit. Id saepe est blanditiis velit. Atque non ut consequuntur sunt laboriosam recusandae reiciendis itaque. Perferendis earum et ipsa dolorem voluptas. Ratione repudiandae vero sequi ducimus debitis voluptatum animi dolores.', 2, 'low', 5, 27, '2024-08-30', '2024-10-01', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(94, 'Minima tenetur iusto consequatur.', 'Autem blanditiis ut voluptatem iusto nemo. Non aliquam quo architecto quisquam iusto consequatur est. Modi velit ut iusto. Debitis distinctio architecto dolore perferendis et qui ipsum. Laboriosam est aliquam aut quia. Culpa ducimus facere commodi ducimus.', 2, 'medium', 5, 12, '2024-08-28', '2024-09-30', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(95, 'Sit ducimus architecto voluptatum.', 'Laborum illo ratione et sapiente adipisci. Repellendus omnis alias dicta eum. Voluptas quia omnis natus quia. Suscipit possimus ut possimus.', 2, 'medium', 5, 13, '2024-08-28', '2024-09-25', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(96, 'Consequatur qui deserunt dignissimos sit vero.', 'Dicta ut autem ipsa est ut tempore omnis dicta. Assumenda animi possimus asperiores corporis dolore aut consequatur. Fuga praesentium totam asperiores vel doloribus magnam. Quod non culpa maiores aliquam eius. Dolorum quia cupiditate cum vel est reprehenderit.', 2, 'medium', 5, 25, '2024-08-31', '2024-09-21', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(97, 'Eligendi iste ipsum iure fuga illo.', 'Non corporis tempore ad accusamus soluta velit. Et non hic delectus molestiae eius et. Asperiores harum labore et sed reiciendis voluptate consequuntur. Esse aliquam vel laborum est. Voluptatem placeat nihil rerum aut iure eius. Deserunt consequatur dolor at sit quas sed.', 3, 'low', 5, 1, '2024-08-26', '2024-10-01', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(98, 'Molestiae est vel culpa sed nostrum minima nisi consequatur.', 'Omnis est architecto ut perferendis expedita fuga et modi. Eum voluptates exercitationem dignissimos quasi non sint. Earum architecto id impedit minus reiciendis.', 3, 'low', 5, 25, '2024-08-28', '2024-09-14', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(99, 'Ipsam eius et hic quo ut totam rerum.', 'Hic vel voluptate qui provident soluta officiis voluptatibus ut. Est ex consequatur dolorem consequatur. Optio voluptatum eum sunt. Atque ratione non reiciendis molestiae voluptas.', 3, 'medium', 5, 1, '2024-08-29', '2024-09-25', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(100, 'Autem voluptas et quis non.', 'Voluptatem quaerat consectetur facilis sit at. Qui qui quam est ut. Officiis quo laudantium voluptate voluptatem occaecati ut. Quidem non enim beatae in sunt laudantium inventore. Cum iure qui non ut et. Distinctio corrupti blanditiis beatae at non nisi.', 3, 'low', 5, 12, '2024-08-27', '2024-09-19', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(101, 'Odio fuga excepturi non aut aut voluptas eos ad.', 'Non cumque necessitatibus voluptatem sunt. Iste non enim modi. Error est ex fuga rerum. Facilis omnis explicabo doloremque delectus voluptatem.', 3, 'medium', 5, 1, '2024-08-31', '2024-09-14', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(102, 'Ut quae aut doloribus sunt molestiae voluptatem porro fuga magni.', 'Accusamus est similique quia. Ea non rerum sint qui optio quia reiciendis. Unde nesciunt labore beatae.', 0, 'high', 6, 2, '2024-08-28', '2024-09-22', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(103, 'Et voluptatem sit possimus aut enim libero provident aut.', 'Vero unde commodi temporibus distinctio nemo. Numquam consequatur cum libero placeat non ipsa pariatur mollitia. Voluptas in omnis quia nesciunt voluptatem voluptatem. Ut hic sint impedit rerum qui alias.', 0, 'medium', 6, 1, '2024-08-29', '2024-09-17', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(104, 'Culpa dolor ut iure quia non autem aut.', 'Illo eius provident eius. Odio commodi minima debitis. Itaque in ex praesentium. Nisi enim esse exercitationem nesciunt minus libero blanditiis et.', 0, 'high', 6, 24, '2024-08-25', '2024-09-16', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(105, 'Qui et consequatur accusantium omnis optio quis neque deleniti.', 'Doloribus consequatur voluptas ut rerum rerum ut. Dolor esse cumque qui repudiandae. Aut beatae rem reiciendis dolore eum. Debitis et nemo sit eum provident officiis. Et et qui sit quam qui ipsum. Rerum dolores sed vitae porro totam cupiditate. Eius beatae quo numquam.', 0, 'high', 6, 23, '2024-08-25', '2024-09-14', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(106, 'Nihil dolores corrupti veniam libero commodi.', 'Neque est praesentium saepe. Sit aut ut repellat et magni repellendus. Magni error quibusdam dolorum illo distinctio neque voluptas voluptatum. Dolores facilis quis recusandae hic et. Autem adipisci et deleniti ea praesentium quas consequatur. Sed eveniet sunt similique. Omnis aliquam quia magni cumque voluptatem.', 0, 'low', 6, 4, '2024-08-30', '2024-09-20', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(107, 'Dolorem temporibus corporis quia.', 'Neque autem omnis impedit perferendis. In nihil et magni quae quod magnam non. Expedita animi et aut qui dolor. Voluptatem aspernatur distinctio nulla beatae. Laborum rerum accusamus nam unde dolorem sit voluptatem. Laudantium harum laudantium ut.', 1, 'medium', 6, 1, '2024-08-29', '2024-09-22', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(108, 'Quae officia labore rem libero ut aut qui.', 'Corrupti aut qui itaque libero. Vitae sed temporibus quo fugit. Tenetur magni optio quae distinctio. Magnam quae earum accusamus excepturi libero. Dolorem hic qui ut enim non ut tempora.', 1, 'low', 6, 23, '2024-08-31', '2024-09-28', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(109, 'Perferendis ratione autem inventore.', 'Laborum omnis aut temporibus enim et. Aliquid qui ratione et totam culpa in. Est reprehenderit et ex et aut officia. Rerum nihil rerum laborum quis dolores et.', 1, 'high', 6, 1, '2024-08-25', '2024-09-13', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(110, 'Est vel laboriosam id magnam sit.', 'Eaque voluptas facere veritatis suscipit facilis. Provident nemo minus distinctio non voluptatum voluptatem qui. Et est beatae quas. Consequatur totam aut et eos temporibus. Et qui quia ut in. Explicabo quia minima vel libero. Et officiis et iusto.', 1, 'low', 6, 24, '2024-08-28', '2024-09-11', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(111, 'Inventore fugiat possimus molestiae laborum at.', 'Quos atque illum ea ut maiores a. Sunt facilis consequatur quas quia illo. Et molestiae perspiciatis veniam reiciendis enim quae veniam. Placeat optio totam nostrum beatae deleniti dolorem. Provident molestias voluptas consequuntur eum exercitationem praesentium recusandae. Nihil minima ipsam quaerat. Illo hic perferendis minima voluptates aut perferendis.', 2, 'low', 6, 24, '2024-08-30', '2024-09-19', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(112, 'Perferendis molestiae eum quis repudiandae consequatur.', 'Laboriosam libero ullam exercitationem voluptates. Id recusandae in animi quo. Sint consectetur quas enim et et aut. In error exercitationem molestiae eum possimus optio nisi. Saepe sapiente officia delectus assumenda. Ut aut deserunt ipsam tempora. Expedita eos qui illum qui. Ab est qui amet.', 2, 'medium', 6, 2, '2024-08-29', '2024-09-13', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(113, 'Quia eius assumenda est veniam quasi reiciendis delectus.', 'Omnis qui id dolorem magni et. Neque inventore est occaecati. Corporis quaerat voluptates suscipit cum. Vel incidunt aut repudiandae explicabo.', 2, 'high', 6, 2, '2024-09-01', '2024-09-26', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(114, 'Labore ea perferendis voluptatum excepturi cupiditate quia.', 'In explicabo sit ut dolorum. Quis voluptas quam voluptatem dolor nostrum. Quia consequuntur explicabo itaque voluptatibus libero fugit dolor et. Et eum a voluptatem nam consectetur deserunt. Laborum voluptatum dolorem nobis sed. Dicta repudiandae optio reprehenderit id maxime veniam. Nihil et id esse nisi animi nisi provident.', 2, 'medium', 6, 24, '2024-08-29', '2024-10-01', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(115, 'Doloremque et amet ipsum corrupti quidem voluptates.', 'Maiores rerum sit inventore deserunt sint in quaerat. Tempora quos aliquid nemo. Sed eos tempora eos voluptas sunt temporibus incidunt. Labore asperiores sint repellendus eveniet fugit voluptate illo.', 2, 'medium', 6, 1, '2024-08-30', '2024-09-29', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(116, 'Debitis quibusdam sed aliquam fuga accusantium et ea omnis et est.', 'Ut voluptate praesentium molestiae quae ipsum pariatur et. Iste ab veniam et tenetur et incidunt. Rerum voluptas animi suscipit voluptatem velit tenetur. Veniam ea assumenda est et odio ducimus.', 3, 'low', 6, 23, '2024-08-25', '2024-09-28', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(117, 'Quam ipsum dolore odit.', 'Laboriosam tempora accusantium perspiciatis. Sint quis repellendus facere voluptatem. Facere error voluptatibus ad. Iusto et tempore doloribus beatae commodi commodi iusto.', 3, 'high', 6, 4, '2024-08-29', '2024-09-22', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(118, 'Commodi maxime officia temporibus.', 'Ut dolorem consectetur dolores aut illum. Dolor dignissimos iure iure aut iure aut pariatur. Dolorem ipsum sed commodi velit blanditiis accusantium. Est minima ipsam culpa est maiores omnis maxime facere. Totam vel repellat ea. Culpa deserunt sit in iusto.', 3, 'high', 6, 1, '2024-08-31', '2024-09-10', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(119, 'Hic quia magnam ex inventore minus dolores sed soluta.', 'Iste repellendus expedita odit laudantium ipsa soluta. Aut et quos debitis magnam. Est et voluptatem laudantium sunt minima cumque sit. Sed eos dolorem rem eum. Commodi quibusdam adipisci id earum occaecati tenetur.', 3, 'high', 6, 1, '2024-08-28', '2024-09-16', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(120, 'A temporibus ducimus sequi ut ipsam iste.', 'Ut dicta et id. Delectus dolores ut magnam mollitia cupiditate explicabo perspiciatis veniam. Provident non eos hic quo voluptatem aperiam ab eaque. Quam tempora ut quis fugiat neque quia rerum. Nihil expedita quia natus ut quae.', 3, 'high', 6, 4, '2024-08-26', '2024-09-28', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(121, 'Tempora ea nostrum vero aperiam adipisci.', 'Est eveniet quis delectus aut. Sequi ducimus ut beatae est. Quibusdam non ut exercitationem ipsam ipsam. Quo nihil quia ipsum commodi eligendi. Et doloremque corporis qui tempora officiis. Dolores dolor enim quo quas. Vel officiis ea quia repellat.', 0, 'low', 7, 9, '2024-08-31', '2024-09-14', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(122, 'Voluptatum quibusdam fuga quisquam omnis et asperiores natus rerum totam iure.', 'Labore molestias suscipit iure omnis fugiat ab consequuntur. Enim iste optio eos rerum. Illo ea omnis ex blanditiis velit laudantium ducimus.', 0, 'medium', 7, 7, '2024-08-30', '2024-09-26', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(123, 'Ut accusamus sed soluta.', 'Est occaecati voluptate debitis tempora quia et sequi. Consequatur sit consequatur fugit. Iure aut ab facilis adipisci placeat. Assumenda qui corporis quod voluptas sed iusto eaque. Aut tempore labore id corporis consequatur impedit. Sit sit laboriosam quibusdam qui consequatur doloremque dolorum.', 0, 'low', 7, 3, '2024-08-30', '2024-09-12', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(124, 'Cupiditate facere nulla nulla natus nostrum suscipit aut natus omnis amet.', 'Sunt dignissimos aut quia autem ut. Ea a molestiae doloribus amet et accusantium neque mollitia. Doloribus quod laudantium possimus sint. Qui similique itaque id sint. Ut ipsum assumenda ut provident voluptate fugit ab. Quia veritatis quisquam officiis dolore consequuntur non. Totam quia est at ex libero libero. Ea velit libero voluptatem in cupiditate ea saepe. Sint nulla rerum dolores necessitatibus.', 0, 'high', 7, 10, '2024-08-29', '2024-10-01', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(125, 'Consequatur error veniam est.', 'Excepturi dicta beatae qui nesciunt. Praesentium sequi aperiam adipisci harum maxime autem asperiores. Commodi voluptate ut eius quod veniam. Alias exercitationem harum aspernatur pariatur. Ratione et et tempore dicta. Dolor voluptatem beatae illum et rerum.', 0, 'high', 7, 1, '2024-09-01', '2024-09-27', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(126, 'Illo assumenda ut officia.', 'Debitis quis dolor quas voluptatem. Corrupti non vero minima molestias exercitationem doloremque. Vitae enim inventore culpa neque rerum qui eum quisquam. Porro est aut impedit. Recusandae nemo itaque voluptatibus dolorem ipsa impedit sint. Voluptatibus est labore qui sint consequatur maxime veniam. Voluptate sequi eligendi minima vel animi.', 0, 'high', 7, 1, '2024-08-27', '2024-10-01', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(127, 'Ipsam doloremque enim voluptate molestiae.', 'Expedita omnis et ut perspiciatis. Nisi error minus animi eveniet corrupti eum ea. Tenetur sed consectetur quia porro. Ut nesciunt eligendi iusto cum earum. Dolor reiciendis dolor totam vero omnis in. Optio explicabo tempora in omnis aut iste eum. In cupiditate quasi voluptas nihil neque animi. Vitae sed assumenda enim perspiciatis.', 1, 'medium', 7, 10, '2024-09-01', '2024-09-24', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(128, 'Expedita optio quibusdam.', 'Omnis nisi veniam quia non mollitia suscipit ipsum. Sed assumenda non sit. Mollitia architecto est culpa non consequatur expedita reiciendis. Eum quidem vero qui veniam numquam hic maiores. Molestias rem voluptas nemo. Et deleniti ducimus repellat consequatur qui fugit deserunt. Sapiente voluptate voluptatem quis aut. Officia sed porro sit rem consequatur.', 1, 'high', 7, 6, '2024-08-31', '2024-09-15', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(129, 'Ex eaque aliquam dolores mollitia et maxime ea id molestiae.', 'Dolorum officiis sunt iste. Consequatur et omnis officia reiciendis. Quis sed non architecto repellendus eveniet est maiores.', 1, 'low', 7, 9, '2024-08-27', '2024-09-19', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(130, 'Voluptates numquam molestiae voluptas vero accusantium.', 'Nihil voluptas quia perspiciatis provident et. Eum illo repellendus iste delectus quod. Accusamus libero molestiae ut nesciunt. Minus veniam quis harum aperiam.', 1, 'high', 7, 1, '2024-08-31', '2024-09-23', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(131, 'Qui voluptatem eum.', 'Et repellendus illo sit voluptatum est doloribus. Quod hic nisi sequi in et est. Quaerat autem aut maiores exercitationem harum voluptatem. Maiores qui nihil est aut non eos. Et et asperiores non ipsa ea. Dolor quis qui cupiditate ut est in cupiditate. Repellat expedita quibusdam rerum.', 1, 'low', 7, 7, '2024-08-29', '2024-09-19', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(132, 'Vel reiciendis enim cumque.', 'Est eveniet repellat nam aliquid animi facere aperiam. Dignissimos tempora assumenda adipisci. Id debitis molestias rerum. Et mollitia corporis soluta totam molestiae eum. Perferendis et neque quas rerum tempore.', 2, 'low', 7, 7, '2024-08-27', '2024-09-24', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(133, 'Maxime et omnis eligendi quas totam.', 'Omnis delectus commodi ut veniam praesentium voluptatem. Voluptates aliquid autem qui autem quia qui minima. Nihil atque enim quidem dolorem quisquam et amet molestiae. Sit consequatur rerum dolores ut neque. Non nulla tenetur quasi molestiae quaerat. Voluptas earum rerum consequatur cumque rerum nulla eos.', 2, 'low', 7, 7, '2024-08-31', '2024-09-11', '2024-09-01 15:16:19', '2024-09-01 15:16:19');
INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `priority`, `project_id`, `assigned_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(134, 'Praesentium omnis nisi eius vel animi autem.', 'Dolor ut molestiae quidem ut quidem. Neque accusamus fugiat necessitatibus temporibus. Aut aspernatur doloremque ea sint fugiat qui nemo. Aut qui consectetur recusandae et illum est odio. Tenetur eum ullam quis minima molestiae qui. Molestiae maxime tempora non cupiditate ipsam delectus. Praesentium nulla cum ut doloribus omnis ab similique.', 2, 'medium', 7, 10, '2024-08-25', '2024-09-17', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(135, 'Et quo error repellat exercitationem.', 'Et exercitationem iure aut quas magnam. Adipisci voluptas ut molestiae reprehenderit tempora quo. Dolor debitis cum ut incidunt facilis. Inventore provident voluptate iusto sit ut dolores. Minima mollitia aut omnis sapiente. Laudantium officia placeat blanditiis harum ad.', 2, 'medium', 7, 6, '2024-08-27', '2024-09-25', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(136, 'Voluptas quisquam aut tenetur similique et ut vel praesentium.', 'Quis eum fuga culpa laudantium minus. Eius voluptas voluptatem quam eligendi ut. Facere cum et qui ut ipsam aut sed. Nisi quo explicabo fugit debitis enim qui non. Corporis non molestiae temporibus quaerat eos. Eligendi ut qui dolorem dolor et laboriosam molestiae. Cumque dolore ea in blanditiis veritatis.', 3, 'medium', 7, 10, '2024-08-29', '2024-09-29', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(137, 'Provident quis error quod debitis velit tenetur.', 'Asperiores aliquid consequuntur fuga totam quis fuga. Sed veritatis quia voluptatem voluptatem consequuntur veniam non. Qui ipsam aliquid quo tempora a quod nihil. Omnis sunt est debitis. Excepturi vero est minus dolore rem et. Amet temporibus inventore ad blanditiis explicabo corporis corrupti. Laudantium perspiciatis est quia et. Voluptatem illum odit aut.', 3, 'high', 7, 7, '2024-08-27', '2024-09-28', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(138, 'Nostrum non quidem excepturi debitis porro.', 'Voluptas non quis nostrum quis possimus. Eos dolorum autem commodi tempore earum dolores. Fuga nemo similique tempora facilis repellat dolores. Itaque error doloremque cumque quis voluptatem quos. Quia sint neque quae praesentium cupiditate mollitia.', 3, 'high', 7, 10, '2024-08-27', '2024-09-23', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(139, 'Debitis ullam nobis accusamus autem ut neque fugit.', 'Molestiae autem voluptatem occaecati necessitatibus quo dolor quae. Consequatur architecto vel sequi fuga at. Exercitationem ex eius rerum minus iure ut. Eius nisi doloremque aut quod voluptatem totam quo. Ut ut saepe ratione et tenetur est expedita. Autem nam aut omnis cumque dolorem laborum. Maxime labore sunt harum magni accusamus consequatur modi nulla.', 3, 'low', 7, 6, '2024-08-31', '2024-09-25', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(140, 'Odit asperiores eaque et consequatur sint.', 'Odit qui ratione neque soluta fugit est consequatur sint. Est consequuntur consequatur fuga saepe. Fugiat ut aperiam voluptatem eos. Saepe laudantium et neque et quae.', 3, 'high', 7, 1, '2024-08-31', '2024-09-23', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(141, 'Ut enim natus aut inventore ut.', 'Eveniet ullam pariatur sed unde. Eaque occaecati architecto aperiam sed nam. Ab eum quo rerum aut vel. Voluptas velit veniam eum maiores corrupti animi earum. Velit enim ab similique neque pariatur. Quia tempore omnis culpa at.', 0, 'medium', 8, 19, '2024-08-27', '2024-09-15', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(142, 'Delectus illo perferendis quis.', 'Sed in quae impedit voluptates doloremque. Et modi omnis facilis porro cum iste quasi et. Quod et debitis rerum asperiores deleniti ipsum.', 0, 'high', 8, 14, '2024-08-27', '2024-09-12', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(143, 'Aut voluptatem illo voluptatem sit.', 'Officiis dicta sunt et rerum quod. Sit expedita est placeat sequi. Quaerat qui beatae exercitationem vel voluptatibus ad. Ab molestias consequatur quia quae eum. Eveniet omnis libero iste nisi. Autem ut iusto qui nam est laudantium voluptatem. Voluptates dignissimos accusamus corporis et nisi magni corrupti occaecati. Corrupti aut culpa exercitationem maiores.', 0, 'medium', 8, 20, '2024-08-31', '2024-09-18', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(144, 'Eos qui recusandae illo tenetur voluptas sunt dolor et qui.', 'Molestiae perspiciatis illum soluta. Unde reprehenderit qui quibusdam sit dignissimos. Numquam sed ut magni odio non mollitia fugiat repellat. Qui modi nam doloremque quas in.', 0, 'low', 8, 1, '2024-09-01', '2024-09-22', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(145, 'Saepe recusandae sequi temporibus cupiditate ut.', 'Excepturi deleniti et nostrum voluptatem. Sequi quam ducimus perferendis suscipit labore sed error. Nostrum tempore mollitia dicta odio quis.', 1, 'medium', 8, 28, '2024-08-30', '2024-09-13', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(146, 'Nesciunt aut fuga velit sint quaerat nam.', 'Corrupti aliquam amet rem. Eum aliquam animi et harum. Quia et dolor officia ea quia quisquam suscipit. Aut sed quis non ab exercitationem. Atque temporibus voluptatem quo modi in nam. Eos incidunt consequatur repellendus eaque. Quia molestias repellat et dolorum quia doloremque.', 1, 'low', 8, 20, '2024-08-26', '2024-09-27', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(147, 'Ut quaerat est aut accusantium.', 'Eveniet ipsam tenetur veritatis in eum magnam ut fuga. Quia nisi cumque deleniti et quod dolorum eos. Sed corrupti qui eligendi porro est omnis expedita. Est deleniti incidunt expedita officiis saepe. Qui omnis delectus reiciendis minima repudiandae. Aut et deserunt sint officiis et unde.', 1, 'low', 8, 1, '2024-08-30', '2024-10-01', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(148, 'Esse quasi aut dolores impedit a.', 'Eos suscipit quis et est praesentium. Et cum quam ut. Laudantium ratione qui dolores sit maxime consequatur. Amet sequi eligendi sit. Voluptatem sit sapiente doloremque nihil dolor cumque necessitatibus.', 1, 'high', 8, 20, '2024-08-30', '2024-09-11', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(149, 'Consequatur iusto sed ut similique minima debitis.', 'Aspernatur animi aut temporibus quaerat voluptatem perferendis dolore. Rerum voluptatum ullam quae ut ad necessitatibus consequuntur. Aut aut qui ea molestiae vel ipsa. Vel deleniti illo veritatis quia. Asperiores aut commodi aut et laborum. Sunt voluptatibus vitae omnis maxime neque omnis incidunt. Vel corrupti quasi commodi id.', 1, 'high', 8, 20, '2024-08-29', '2024-09-23', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(150, 'Natus quasi ad tenetur quos voluptas.', 'Deleniti nihil deleniti ex qui asperiores adipisci qui ab. Dolore aut repellendus atque et et. Quidem exercitationem hic earum consequatur ea. Molestiae et ad sapiente.', 1, 'medium', 8, 20, '2024-08-26', '2024-09-18', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(151, 'Dolorem et quo cum debitis rem dolor quia deleniti sint.', 'Modi omnis est et quam. Dolorem et aperiam molestias accusantium nulla molestias. Deleniti deserunt placeat nam. Libero similique autem at incidunt soluta est. Nobis sit accusamus impedit repellendus voluptates. Suscipit et dolor enim consectetur officiis natus. Delectus omnis ullam quo quae voluptas. Fugit reprehenderit suscipit quasi aliquid est soluta rem.', 2, 'high', 8, 28, '2024-08-27', '2024-09-30', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(152, 'Ea quis delectus aut ut autem expedita.', 'Odit ducimus facere molestias libero odit et. Et sed ad exercitationem voluptas ex in. Laborum porro sed suscipit et sit cumque aut. Ex illo explicabo tempora reiciendis voluptatem est. Pariatur illo quae voluptas vitae est officia odit. Odit fuga ex quos quidem veniam nulla eligendi.', 2, 'medium', 8, 19, '2024-08-26', '2024-09-13', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(153, 'Suscipit in sit quod.', 'Ea rem et quo. In aut aut rerum possimus ducimus nam. Veritatis cum non illo omnis qui. Delectus quam velit adipisci ut. Laudantium a ipsam culpa sed voluptates quia.', 2, 'high', 8, 20, '2024-08-26', '2024-09-09', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(154, 'Autem non eius quos voluptas aspernatur.', 'Rerum molestias deserunt dolorum earum. Nemo numquam suscipit ut omnis a officia. Enim esse quia quod officiis non inventore non. Maxime sapiente dolores est rerum. Illo aut aut est inventore recusandae quod. Atque enim et doloremque libero est aut architecto.', 2, 'medium', 8, 1, '2024-08-31', '2024-09-08', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(155, 'Unde dolores voluptatem quaerat dolores iure laborum ut.', 'Velit dicta est dolorum ex voluptatem est. Rem et molestias molestiae minus rerum. Laborum vel dolorem rerum velit.', 2, 'high', 8, 28, '2024-08-31', '2024-09-12', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(156, 'Aut qui laudantium dolorum quisquam.', 'Quo et optio nulla sint. Omnis labore occaecati et quod sed vitae error. Alias quia et aspernatur quia veritatis enim odit. Rem iure fuga enim itaque facere est. Quaerat inventore nisi dolores nihil inventore. Fugit non quo hic asperiores dolorem. Ex dicta adipisci inventore vero blanditiis occaecati veritatis.', 2, 'low', 8, 14, '2024-08-30', '2024-09-14', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(157, 'Rerum aliquid vero distinctio rerum.', 'Voluptatum quibusdam nihil veniam magni. Eos officiis voluptas dolor voluptatibus et a. Cumque sit ut ex in. Expedita facilis voluptatem aspernatur et autem aut. Quis voluptatibus odit perferendis velit ea. Necessitatibus temporibus sed totam enim. Excepturi dolorum et eum earum. Velit excepturi blanditiis odit eum reprehenderit impedit saepe.', 3, 'low', 8, 19, '2024-09-01', '2024-09-14', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(158, 'Amet vero nobis et asperiores facilis reprehenderit veniam.', 'Iusto quo accusantium sed. Officia vitae quia quam. Dolorum odio quia mollitia earum. Distinctio aut et libero sit id suscipit. Qui consequatur nemo nostrum eos est dolorem nulla repellat. Ullam ut earum exercitationem labore est. Alias dolorem cumque doloremque enim nemo. Fugit quae vel sequi ut deleniti voluptatibus. Et velit commodi id et culpa.', 3, 'medium', 8, 19, '2024-08-27', '2024-09-27', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(159, 'Neque amet odio voluptatem magni.', 'Qui rerum occaecati nesciunt fugiat. Est suscipit et aspernatur est dolore. Laudantium reprehenderit ad quo aut velit ut. Ipsum nihil debitis cum recusandae. Aut dolor qui qui libero. Perspiciatis ex nam nostrum quae. Rerum reprehenderit dolores odit et quia. Ipsa dolore possimus porro dicta provident odit.', 3, 'low', 8, 20, '2024-08-28', '2024-09-28', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(160, 'Eaque ipsa et est voluptas.', 'Dolor dolorem et corporis consequatur voluptatem vero in. Quia expedita unde eaque mollitia doloribus debitis sapiente. Quidem corporis quia et illo sit est. Hic et error repellendus neque ratione consequatur odio. Sed ut perferendis maiores aspernatur odio.', 3, 'low', 8, 19, '2024-08-29', '2024-09-30', '2024-09-01 15:16:19', '2024-09-01 15:16:19'),
(161, 'Ex ipsa beatae itaque praesentium dignissimos.', 'Id assumenda qui qui laboriosam dolore cupiditate qui omnis. Et dolorem consectetur doloremque sit quis quibusdam. Provident dolores ad eveniet architecto ipsum mollitia. Quidem omnis nihil qui et rerum et. Itaque est vitae perferendis. Facere velit consectetur rerum voluptate unde quia molestias.', 0, 'low', 9, 1, '2024-08-28', '2024-09-20', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(162, 'Cum ratione officiis pariatur.', 'Nihil eius commodi dignissimos alias. Est nisi temporibus illo in ullam. Tenetur qui unde voluptate consequatur enim voluptatem. Aspernatur commodi eos quo explicabo non iusto.', 0, 'medium', 9, 1, '2024-08-28', '2024-09-15', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(163, 'Molestias adipisci iusto voluptas consequatur.', 'Rem soluta nulla blanditiis dolorem consectetur quia veniam sunt. Distinctio quae corrupti necessitatibus rerum ut. Esse et qui sapiente non delectus ut error. Error odio aliquid velit non. Delectus voluptas ipsum iure quasi.', 0, 'low', 9, 1, '2024-08-27', '2024-10-01', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(164, 'Nam sint qui labore eveniet inventore.', 'Sint accusamus repellat quo iusto perspiciatis. In rerum fugit nulla similique. Iure aut et rerum. Minus eos dignissimos rerum. Natus et illum natus quia.', 0, 'medium', 9, 16, '2024-08-29', '2024-09-29', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(165, 'Vero perspiciatis delectus nostrum illum earum vel rerum.', 'Amet omnis doloribus placeat fuga praesentium. Similique rerum sed reprehenderit sit voluptates commodi. Voluptates illo velit et praesentium. Iure at atque facere adipisci modi ipsa. Aut architecto aut necessitatibus.', 0, 'medium', 9, 16, '2024-08-27', '2024-09-10', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(166, 'Distinctio explicabo optio saepe ullam repellat aut deserunt.', 'Doloribus sit blanditiis repellat similique tenetur ut. Esse ut exercitationem exercitationem quia officiis officiis. Sit aspernatur dolor ut quas earum ut commodi.', 1, 'low', 9, 17, '2024-08-31', '2024-09-25', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(167, 'Velit sed quasi doloremque illum aut.', 'Maiores illo fugit deleniti aut laborum. Ratione accusamus excepturi consequatur enim qui nulla. Saepe quod nam et aut. Ut fugit est quod enim temporibus magni. Ad aut illo facilis consequatur aut harum.', 1, 'high', 9, 1, '2024-08-28', '2024-09-18', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(168, 'Laboriosam ipsum consequuntur sapiente magni eveniet sit deleniti molestias in.', 'Quo voluptatem accusamus praesentium ipsa qui. Est quas reprehenderit illo inventore. Nihil minus assumenda quae minus debitis. A aspernatur sit cumque.', 1, 'high', 9, 17, '2024-08-29', '2024-09-13', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(169, 'A excepturi quia nemo fugit.', 'Quam atque odit deleniti est et corporis quos. Enim impedit aspernatur voluptate id error.', 1, 'high', 9, 1, '2024-08-27', '2024-09-28', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(170, 'Eaque et occaecati quasi.', 'Consequuntur facilis neque non. Assumenda vel commodi libero et et inventore. Ut molestiae ab veritatis cum dolorem ab praesentium. Blanditiis corporis temporibus dolorum non ullam dolore. Odio voluptas quas recusandae facilis nostrum. Officia officiis minus aliquid voluptates laboriosam nemo.', 2, 'medium', 9, 16, '2024-08-31', '2024-09-17', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(171, 'Ea dolor quam fugit voluptatem.', 'Ex tempora dolor temporibus fuga sunt corporis et possimus. Qui quaerat voluptas deserunt provident cupiditate qui corporis. Ratione laborum et rerum repellat amet est.', 2, 'high', 9, 1, '2024-08-27', '2024-09-26', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(172, 'Dolor et voluptatem soluta qui accusantium.', 'Harum a ut quis perferendis. Unde consequatur earum ea sed qui repellendus quia. Similique cum omnis similique omnis explicabo. Et nam aut qui nihil facilis. Labore velit accusantium excepturi aliquam consectetur officia nesciunt. Voluptatem sunt voluptatibus vitae similique.', 2, 'high', 9, 1, '2024-08-27', '2024-09-18', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(173, 'Voluptas eos saepe necessitatibus est qui.', 'Eligendi ea est itaque similique. Voluptates ut corrupti esse mollitia. Corporis libero tenetur sunt excepturi sequi. Reprehenderit voluptas dolor vel cum delectus. Numquam facilis esse et qui sint.', 2, 'high', 9, 1, '2024-08-30', '2024-09-29', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(174, 'Consectetur sed dolorem dolore.', 'Et dicta rerum sint sit necessitatibus sapiente doloribus. Molestiae exercitationem tenetur dicta quos. Dolorem enim sed aliquam harum molestiae dolorem dolorem. Fugiat qui veritatis molestiae sint. Sequi esse incidunt fuga adipisci.', 3, 'medium', 9, 17, '2024-09-01', '2024-09-26', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(175, 'Doloremque aut dolor cupiditate veniam libero ipsum suscipit in.', 'Provident rem maiores animi. A voluptatem reprehenderit quo hic. Aliquid voluptatum consectetur dolor ullam placeat. Temporibus sed et sapiente asperiores aut et sed. Modi neque voluptas reprehenderit. Eveniet assumenda qui magnam soluta et molestiae consequatur. Fugiat nesciunt omnis cupiditate eos esse et dolorum. Non dignissimos molestias laudantium voluptate ea est. Asperiores magnam quaerat dignissimos aut aspernatur.', 3, 'medium', 9, 16, '2024-09-01', '2024-09-17', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(176, 'Aut molestias magni exercitationem ea molestias maiores excepturi perferendis doloremque ut.', 'Ipsam mollitia aut et fuga nostrum. Laborum accusamus labore doloremque assumenda sunt rem et sunt. Consectetur consequatur accusantium delectus ea odit ducimus ducimus eius.', 3, 'medium', 9, 16, '2024-08-31', '2024-09-25', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(177, 'Magni omnis magnam qui unde.', 'Molestiae omnis quos recusandae vel cupiditate vero ea. Repellat et dignissimos labore et nulla et. Fugiat ut facere suscipit iure consectetur debitis. Quidem voluptatem sit occaecati quia illo expedita voluptates.', 3, 'low', 9, 1, '2024-08-27', '2024-09-28', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(178, 'Quod aut animi iusto enim possimus consequatur asperiores.', 'Qui labore facilis cumque molestiae et repellendus. Enim distinctio dolor consequuntur in magni accusamus. At odit id reprehenderit ut amet laboriosam repellendus. Iste cumque totam et iusto nihil.', 0, 'low', 10, 22, '2024-08-31', '2024-09-18', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(179, 'Sunt hic autem id et.', 'Et doloremque placeat quia nobis. Qui illo dicta illo minus. Ipsam et consectetur iusto omnis. Cum qui modi sunt et dolores error ratione.', 0, 'high', 10, 24, '2024-08-29', '2024-09-25', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(180, 'Ut modi molestiae commodi molestiae.', 'Et ut maxime autem minima quos aut. Quia voluptatem omnis sint doloremque voluptatem et totam rerum. Dolorem est impedit aut aliquam dolorem expedita. Consequatur qui id vitae. Maxime et molestias ut alias est. Laborum pariatur dolor nulla deleniti est impedit.', 0, 'high', 10, 24, '2024-08-28', '2024-09-16', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(181, 'Est consequuntur consequatur aliquam.', 'Aut quis quo non molestiae tempore illo sapiente. Deleniti accusamus voluptates quo iure cumque voluptas. Maiores perferendis occaecati cum earum. Voluptas voluptatum ut magnam quia.', 0, 'medium', 10, 13, '2024-08-31', '2024-09-09', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(182, 'Dolorum libero illo est error.', 'Labore velit consectetur harum nobis. Dolores eum nam voluptatem non facere. Assumenda repellendus eum laborum. Porro nihil provident ea optio molestiae. Possimus architecto minima praesentium ut enim similique sed porro. Qui et qui tempora ullam incidunt. Aut aut nam repudiandae quasi atque.', 1, 'medium', 10, 24, '2024-08-31', '2024-09-21', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(183, 'Ab ratione magnam quisquam ut laborum deserunt omnis accusantium.', 'Omnis non ut quo voluptatem ut molestiae. Quia assumenda et et itaque. Voluptas nisi nam eos.', 1, 'high', 10, 22, '2024-08-28', '2024-09-26', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(184, 'Perspiciatis rem at quidem enim.', 'Eos illum reiciendis nemo atque. Maxime natus quidem quibusdam velit veniam. Ea nemo aut iure maxime temporibus rerum. Similique vero maiores aperiam eum.', 1, 'low', 10, 22, '2024-08-27', '2024-10-01', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(185, 'Voluptatem id a quae voluptatum.', 'Est sed omnis repudiandae quo eaque. Velit quasi aliquam aut quaerat. Modi similique maxime ratione et nemo consequuntur. Eligendi dolorum ducimus sed sit eius dignissimos. Dolorem ullam excepturi iure.', 1, 'high', 10, 22, '2024-08-27', '2024-09-26', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(186, 'Eos tempore asperiores vitae aut repudiandae cum dolorum veniam.', 'Repellendus expedita ea ullam voluptatem et. Qui aut sed ea. Cumque commodi eius officia voluptatem. Minima inventore assumenda mollitia qui impedit cumque rem. Et corporis molestiae necessitatibus provident. Enim amet eligendi sint quia qui.', 1, 'high', 10, 24, '2024-08-29', '2024-09-17', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(187, 'Perspiciatis quia quia sed natus eum atque.', 'Dolore cumque modi quo. Sapiente porro aut architecto et est. Unde ducimus adipisci delectus. Fuga ipsam accusantium quo ullam soluta quis iure. Quaerat in libero voluptatem voluptates voluptas tenetur quasi ut.', 2, 'medium', 10, 1, '2024-08-31', '2024-09-09', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(188, 'Ab vero et sed sapiente perspiciatis placeat sapiente ut.', 'Perspiciatis id facere dolores molestias exercitationem eius iure. Deleniti corporis odio rem nisi distinctio commodi autem. Quisquam quis a veritatis dolore. Nesciunt sed pariatur suscipit asperiores ipsum consequuntur. Illum voluptas consectetur voluptatibus error.', 2, 'medium', 10, 22, '2024-08-26', '2024-09-14', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(189, 'In dolorem doloribus provident blanditiis voluptas facilis voluptas quia quisquam sequi.', 'Voluptatem aut repellat qui. Quia pariatur eos perspiciatis magni repellat molestias ut. Ipsum necessitatibus eos nisi quo quia. Perferendis voluptas ex fugit ut facere et. Delectus quam corporis quas vel asperiores.', 2, 'high', 10, 13, '2024-09-01', '2024-09-18', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(190, 'Aut ex labore officiis a labore nihil excepturi sint quis sunt.', 'Aliquid provident aperiam dolorem. Dolores ipsam quia voluptatibus aut. Totam quia necessitatibus ut autem repudiandae consequatur similique adipisci. Dolore dolorem quia aut quia. Ut neque laboriosam in sequi maiores aut sit sed.', 2, 'medium', 10, 1, '2024-09-01', '2024-09-22', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(191, 'Sapiente et earum explicabo ut culpa natus.', 'Eligendi maiores reprehenderit ratione aut sed blanditiis. Ipsam magnam ab ut dolore et. Ipsam perspiciatis ut voluptates. Voluptatem doloremque optio quia quisquam porro.', 3, 'low', 10, 22, '2024-08-27', '2024-09-25', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(192, 'Dolor labore eos omnis autem.', 'Qui quam impedit pariatur ducimus est magni nemo. Adipisci ipsum deserunt voluptates sit est omnis accusantium repellendus. Voluptas excepturi eaque et sed suscipit quisquam magnam non. Eveniet alias autem dignissimos dolores dicta. Architecto voluptatem libero architecto et asperiores.', 3, 'high', 10, 22, '2024-08-28', '2024-09-29', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(193, 'Ea saepe impedit distinctio.', 'Dolor quis aliquam quis est dolorem omnis. Illum ut maxime mollitia velit aut atque aspernatur. Magnam voluptatem debitis quidem laboriosam culpa. Soluta sed consequatur incidunt odio molestiae nam eos. Aliquam deleniti non veniam et rem repudiandae molestias. Ducimus ab omnis placeat. Asperiores cumque pariatur saepe dicta minima omnis.', 3, 'high', 10, 1, '2024-08-31', '2024-09-12', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(194, 'Eos sed cumque at dolore officiis doloremque autem.', 'Animi debitis corporis tenetur natus enim. Pariatur reiciendis qui molestiae excepturi totam. Consectetur ea natus officiis illum. Voluptatem dolores eos velit sed enim autem. Ratione impedit fugiat facere est consequatur voluptatibus. Et voluptate voluptatum adipisci quidem.', 3, 'low', 10, 13, '2024-08-28', '2024-09-30', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(195, 'Numquam libero at facere pariatur ut sit aut eveniet.', 'Ea sit ab voluptatem quis assumenda qui et id. Architecto eos et autem itaque non culpa repudiandae pariatur. Eveniet soluta atque nesciunt est expedita quia quia. Laborum officiis vero distinctio qui. Quia illum reiciendis qui rem.', 3, 'medium', 10, 22, '2024-08-29', '2024-09-30', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(196, 'Accusamus eligendi minus ab inventore.', 'Animi eos at ex et ad est sequi. Saepe quas id a vero accusantium.', 0, 'low', 11, 25, '2024-08-27', '2024-09-09', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(197, 'In ad in quos repudiandae nihil minus consequatur.', 'Voluptatibus temporibus sed dolorum. Possimus autem molestiae provident. Numquam dolore saepe quod ducimus aut animi. Qui tempora nulla provident nihil ratione officia eum. In soluta fuga enim sunt ut ullam. Sequi harum minus ut velit alias optio possimus.', 0, 'high', 11, 15, '2024-08-26', '2024-09-13', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(198, 'Ipsam rem occaecati hic asperiores.', 'Non illum non omnis enim in. Molestias a cum et optio quia. At ut a autem eos quo quas. Esse sunt sunt exercitationem tempora. Sunt voluptatem et quos sint quam eius.', 0, 'high', 11, 1, '2024-08-31', '2024-09-10', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(199, 'Voluptatem ut quam qui temporibus.', 'Aspernatur expedita et quibusdam at quia. Omnis est excepturi sint veritatis amet optio. Sint quaerat velit aut.', 0, 'medium', 11, 9, '2024-08-25', '2024-09-26', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(200, 'Itaque mollitia molestias fuga molestias.', 'Cum porro molestiae cumque quibusdam. Autem aliquid magni assumenda. Ea ut delectus maxime fuga quis qui enim ea.', 0, 'high', 11, 1, '2024-08-30', '2024-09-29', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(201, 'Quod ad modi eum aut vel autem quos.', 'Quae saepe doloremque eveniet ab velit. Debitis possimus id dolorem fugit veniam nam maiores officiis. Culpa ad sunt optio fugiat ipsam voluptate. Dolore repudiandae molestias omnis dolor temporibus qui assumenda. Adipisci ea neque ut est atque. Voluptates soluta architecto fugit cum.', 1, 'medium', 11, 25, '2024-08-31', '2024-09-09', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(202, 'Quod voluptas id iusto quo et deserunt.', 'Odio adipisci recusandae quam sed saepe. Cupiditate rerum rerum maiores sit quos quam. Omnis possimus rerum ex fugiat. Et temporibus recusandae aut facere sit. Nostrum soluta qui dolorem deserunt.', 1, 'medium', 11, 15, '2024-08-28', '2024-09-10', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(203, 'Et qui quae assumenda omnis pariatur qui ut sit id.', 'Sunt nam ab fuga quia sunt. Recusandae ea tempora reiciendis alias. Sed debitis omnis nostrum sit placeat dolorem. Sunt sit accusamus expedita officia a voluptatem. Voluptate et necessitatibus est voluptatum exercitationem.', 1, 'high', 11, 25, '2024-08-26', '2024-09-17', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(204, 'Quasi modi mollitia explicabo quibusdam asperiores quo consequatur.', 'Qui voluptate animi placeat voluptas. Tempora saepe consequuntur recusandae voluptates veritatis. Laborum omnis veritatis earum qui neque autem. Dolores vel facere ea doloremque quos ut. Quaerat necessitatibus provident delectus quaerat consequuntur minima. Nostrum dolores autem qui voluptatem ipsa et.', 1, 'medium', 11, 15, '2024-08-28', '2024-09-08', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(205, 'Est quia consectetur adipisci beatae quaerat repellat aut.', 'Ut quod maxime vel dolores et id. Consectetur cupiditate cum dicta aspernatur.', 2, 'low', 11, 25, '2024-08-28', '2024-09-27', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(206, 'Omnis perferendis maiores vitae soluta cupiditate.', 'Et recusandae dolorem repellendus et facere. Debitis eaque accusamus enim recusandae voluptatem ipsum consequatur. Quis facere qui assumenda cumque autem. Similique maiores omnis pariatur laboriosam repellat.', 2, 'high', 11, 25, '2024-09-01', '2024-09-11', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(207, 'Tempora soluta similique cumque sunt incidunt atque.', 'Consequatur alias tempora placeat explicabo. Rerum illo aut repellat consequatur. Libero adipisci laborum eius veritatis a. Odit assumenda placeat quod consequatur ut. Perferendis fuga qui nihil fugiat velit quas veritatis. Adipisci eius sequi debitis. Eos sit quis debitis natus id mollitia. Corporis unde eius est doloremque odio corporis.', 2, 'medium', 11, 15, '2024-08-29', '2024-09-24', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(208, 'Ratione inventore ut delectus assumenda nisi nemo id voluptatem.', 'Explicabo nam est et. Vel adipisci qui aut voluptatum molestiae ex necessitatibus beatae. Eligendi omnis quisquam dolor dolores temporibus dicta. Ut beatae est est ipsum aut non. Molestias similique est ipsam et et. Natus assumenda ratione quo sequi vel in aut commodi.', 2, 'medium', 11, 25, '2024-08-27', '2024-10-01', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(209, 'Quo exercitationem sit est minus.', 'Blanditiis ut placeat tenetur in qui vel molestiae. Voluptas qui ullam voluptatibus dolores optio numquam alias. Alias et sed aut unde culpa amet. Maiores et rerum consequuntur ratione.', 3, 'high', 11, 25, '2024-08-31', '2024-09-27', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(210, 'Adipisci ut dolorum placeat illo consequatur eligendi nostrum.', 'Ut nesciunt minima et aspernatur at facere rem animi. Itaque quis et repellendus. Sit facilis dolorem consectetur a explicabo commodi et. Impedit sunt voluptatem rerum officia. Omnis aut est mollitia quia ipsam rerum.', 3, 'low', 11, 9, '2024-09-01', '2024-09-22', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(211, 'Non ut voluptatem quia nihil.', 'Dolor asperiores est quia ut error quas repudiandae. Atque commodi beatae ut dolor dolorum distinctio. In mollitia blanditiis explicabo ut et. Rerum quasi facilis aut expedita.', 3, 'high', 11, 15, '2024-08-31', '2024-09-24', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(212, 'Consequatur aliquam vero laborum quaerat inventore.', 'Suscipit error laudantium unde perspiciatis aut. Et omnis laborum ad dolorem. Aut porro error sapiente nulla ut quia laborum. Et alias repudiandae nulla eligendi voluptatum maiores aut. Perferendis aperiam esse deleniti ipsum earum qui.', 3, 'medium', 11, 1, '2024-09-01', '2024-09-09', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(213, 'Magnam autem nihil aut.', 'Maiores reprehenderit repudiandae dolorem laborum officiis dolorem quae. Corrupti necessitatibus sequi dolor recusandae mollitia. Voluptatem molestiae deserunt quibusdam omnis id quia. Et in aut quos rem omnis doloribus. Et delectus tempore quaerat quam numquam doloremque. Provident assumenda repellendus fugit id sunt alias. Beatae odit dolorem minima similique numquam. Eveniet eius repudiandae quasi praesentium explicabo consequatur. Quibusdam quod labore dolor.', 3, 'low', 11, 25, '2024-09-01', '2024-09-24', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(214, 'Maiores temporibus molestias repellat omnis.', 'Magni nisi rerum veritatis eum a labore non. Maxime itaque quidem neque animi blanditiis. In qui rerum inventore delectus.', 3, 'low', 11, 15, '2024-08-26', '2024-09-30', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(215, 'Qui amet vel repellat repellendus quisquam amet.', 'Iusto non temporibus sequi doloribus et accusantium. Suscipit nesciunt omnis quia natus omnis voluptate quo. Corrupti aut quia eum autem molestiae dolorem dolores. Ut sapiente doloribus et.', 0, 'medium', 12, 23, '2024-08-29', '2024-09-09', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(216, 'Molestiae qui qui illo et et ducimus soluta necessitatibus.', 'Maiores repellendus aspernatur ad. Quisquam debitis ut voluptatum fuga aperiam fuga. Quia itaque quia nihil ut facilis. Ipsum eos vitae alias provident pariatur excepturi reiciendis. Omnis nihil mollitia similique. Eos non repellendus labore et. Quo officia ut labore nostrum. Magnam quia recusandae ut laboriosam ducimus.', 0, 'high', 12, 16, '2024-08-27', '2024-09-15', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(217, 'Voluptatem quam blanditiis eveniet omnis voluptatem rerum culpa hic atque vel.', 'Quia totam error sapiente enim. Fuga vel sint aut vero iusto aut. Voluptas facilis sit nostrum ab vel. Temporibus quibusdam voluptas sit sunt at. Ea qui exercitationem esse commodi iure rerum eos.', 0, 'high', 12, 23, '2024-08-26', '2024-10-01', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(218, 'Accusantium consequatur et doloribus qui quidem.', 'Beatae ipsam vel eum consequatur aspernatur sequi. Quam placeat eum dolores numquam possimus. Aut voluptas alias dicta repellat et. Aut voluptas quam omnis mollitia aut et dolor. Quos quia aspernatur eligendi sit ex. Sequi corrupti sit dolorum sed cum.', 0, 'medium', 12, 2, '2024-08-27', '2024-09-26', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(219, 'Ipsam consequatur maxime vel.', 'Ipsum quo laudantium laboriosam sapiente veritatis dignissimos et. Laborum vel delectus nisi cupiditate itaque quaerat. Quia fuga voluptas cupiditate amet sunt totam illo incidunt.', 0, 'low', 12, 16, '2024-08-27', '2024-09-15', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(220, 'Facilis necessitatibus quia et repellat eum est.', 'Omnis amet et deserunt reiciendis maiores. Voluptatem sed non dolore ea et molestiae labore. Fuga voluptatum ex placeat fugiat omnis eum. Quia tenetur ipsum iusto id.', 1, 'medium', 12, 28, '2024-08-27', '2024-09-30', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(221, 'Voluptatem mollitia quia occaecati.', 'Nulla voluptas omnis et. Non accusamus quas qui. Earum sit eveniet impedit. Illo officiis cum quia magnam dolorum aspernatur sint. Officiis pariatur aut consequatur tenetur et ad. Vitae aut dolorem quia qui hic. Et beatae impedit dicta unde eligendi quidem reprehenderit. Animi a perferendis vel voluptatem autem.', 1, 'medium', 12, 28, '2024-08-28', '2024-09-10', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(222, 'Beatae est consequatur possimus animi sit est non corporis.', 'Facilis ea nobis voluptas cumque voluptatem autem. Sapiente qui itaque illum voluptatem id fugiat repellat. Iure vel deserunt voluptatem mollitia et. Nostrum enim numquam nam nobis.', 1, 'high', 12, 28, '2024-08-31', '2024-09-13', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(223, 'Dolores porro ducimus nulla eius necessitatibus dolor animi.', 'Dolores dolorem esse ex in et quas. Inventore dicta aperiam reiciendis quam eligendi libero. Quibusdam perspiciatis aliquam deserunt atque officia assumenda. Est aut molestiae amet voluptas ut animi autem. Ipsam perferendis sit dolorum rerum. Neque iusto doloribus expedita quasi est. Omnis dicta minus repudiandae itaque voluptatum facere illum. Consequatur officia omnis iusto ullam magnam.', 1, 'low', 12, 10, '2024-08-28', '2024-10-01', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(224, 'Vero alias sunt mollitia est.', 'Enim fugiat animi qui ut facere est. Nulla magnam corrupti quo corrupti atque dolor quisquam. Unde amet veritatis odit sequi. Fugiat aut sit quae voluptatem aspernatur qui. Maxime repellendus et mollitia quibusdam. Sunt fugiat suscipit dolores. Similique saepe libero praesentium. Quam excepturi maxime officiis ut.', 2, 'high', 12, 1, '2024-08-27', '2024-09-16', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(225, 'Voluptas molestias explicabo modi qui adipisci eveniet.', 'Laborum doloremque delectus quas rerum officia. In ut at quis est quos qui vitae iste. Corrupti consequatur consequatur aut est assumenda.', 2, 'medium', 12, 1, '2024-08-27', '2024-09-26', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(226, 'Omnis suscipit expedita esse quasi pariatur.', 'Facere perspiciatis aut adipisci deleniti rerum sunt. Amet id ex nemo. Laboriosam nemo dolores enim ea facere eos. Est pariatur eaque reprehenderit dolorum. Ducimus accusantium odit enim aperiam quisquam voluptates incidunt exercitationem.', 2, 'high', 12, 2, '2024-08-31', '2024-09-08', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(227, 'Suscipit fugiat blanditiis rem.', 'Suscipit iste et neque tempore exercitationem aut aut. Tempore pariatur ipsum ipsam possimus optio nulla quos. Dolores eum saepe consequatur illum laboriosam modi. Vitae sit quidem nam alias non. Qui quo qui expedita ab natus.', 2, 'low', 12, 23, '2024-09-01', '2024-09-30', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(228, 'Nostrum reiciendis et iste occaecati dolores assumenda fuga soluta aut ea.', 'Quaerat harum ut enim id. Eveniet repudiandae dolor magnam illum. Porro vel nostrum fuga doloremque. Odit molestiae ut est at. Eligendi ipsa harum enim voluptatem ipsam aut aliquam numquam.', 3, 'high', 12, 9, '2024-08-26', '2024-09-09', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(229, 'Dolore vel quis explicabo illo animi quis consequatur et consequuntur.', 'Sequi quasi facere et ut assumenda. Minus quos facere quis dolor nemo iure. Suscipit qui iusto iusto aliquam. Vero dignissimos maxime hic sunt. Odit pariatur autem velit repellendus.', 3, 'high', 12, 1, '2024-08-31', '2024-09-24', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(230, 'Similique earum quasi vitae ab ab enim.', 'Corporis modi qui magnam. Et vel voluptatem deserunt assumenda laborum error. Eos excepturi assumenda sed recusandae recusandae. Saepe quisquam repellendus deserunt. Sit qui deleniti provident nisi est et assumenda quod.', 3, 'high', 12, 9, '2024-09-01', '2024-09-14', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(231, 'Eos eaque reprehenderit.', 'Nemo voluptatem deserunt commodi eos ipsa vitae. Et saepe laudantium dolorem. Rerum nostrum dolore labore voluptates. Quia exercitationem ut amet et consequatur sit.', 3, 'high', 12, 2, '2024-08-27', '2024-09-18', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(232, 'Et laboriosam eos inventore cupiditate assumenda.', 'Dignissimos corporis eos molestias quis eligendi. In beatae est consequuntur molestiae quibusdam earum. Sit facilis debitis cumque. In quibusdam reiciendis ad laborum repudiandae expedita. Esse voluptates omnis itaque. Fugit ut iure dolores accusamus veniam. Doloribus saepe repudiandae et et quam laudantium officia velit.', 0, 'high', 13, 1, '2024-08-30', '2024-09-22', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(233, 'Velit eveniet fuga quia atque neque et deleniti quaerat enim soluta.', 'Magnam molestiae quasi modi est aut sint laudantium. Harum similique quisquam voluptatum dolorem sit ducimus et. Cum dignissimos sapiente accusamus fugiat autem voluptatem. Ut voluptas alias veritatis rerum optio ut quia dolor. Blanditiis harum eum et officiis alias aspernatur.', 0, 'high', 13, 1, '2024-08-31', '2024-09-19', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(234, 'Quae repellendus non.', 'Saepe possimus nulla mollitia et impedit architecto. Rerum aperiam cupiditate quam sint enim. Quis soluta non mollitia eveniet similique.', 0, 'medium', 13, 1, '2024-08-26', '2024-09-15', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(235, 'Quasi et nobis perferendis aperiam itaque.', 'Eum ratione id cupiditate reprehenderit illum rem. Expedita magni aut dolorem aut. Dolorem sapiente molestiae quasi. Quaerat dolor accusamus eius laborum.', 0, 'high', 13, 21, '2024-08-31', '2024-09-12', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(236, 'Voluptas enim cumque qui facere.', 'Minus nemo et eum vitae corrupti suscipit labore aut. Minima deserunt sint qui reiciendis sit ut. Dignissimos qui sit quam iure hic vel. Autem est molestias magni nulla quia aut. Id qui at consequatur facere neque eum iusto. Et rerum nisi omnis excepturi deserunt aperiam libero. Doloremque corporis sed vitae quam omnis.', 0, 'high', 13, 1, '2024-08-30', '2024-09-14', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(237, 'Nesciunt ad quia in vero debitis sunt.', 'Occaecati expedita ad ut eos. Impedit molestiae modi ut. Recusandae porro assumenda quia consequatur delectus libero. Ea ut dolorem modi ut laborum quaerat. Ut dolor dolores est. Tenetur tempore cum et vitae. Officia porro nobis quidem soluta. Quisquam occaecati dolorum et error sunt repudiandae.', 1, 'high', 13, 21, '2024-08-26', '2024-09-11', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(238, 'Molestias aperiam iusto veniam facere.', 'Omnis et placeat non et earum ipsa. Nam earum dolorem perferendis. Cum cum omnis nihil ea odit totam quidem. Nihil numquam magnam quo officiis et nulla voluptate.', 1, 'high', 13, 1, '2024-08-29', '2024-09-29', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(239, 'Omnis temporibus sit eum molestiae sit.', 'Voluptatem id rerum fuga distinctio doloremque. Eligendi perspiciatis placeat earum quam earum aspernatur. Ad at odit voluptas in.', 1, 'low', 13, 15, '2024-08-31', '2024-09-20', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(240, 'Iste aut alias aut dolorum deleniti sed.', 'Deleniti dicta laudantium maxime ad. Est quidem voluptas quia ut magnam. Tempore dolorum delectus non. Et sit officia quod natus. Autem veniam a aut sunt. Maxime unde et doloremque doloribus rem natus.', 1, 'low', 13, 21, '2024-08-27', '2024-09-14', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(241, 'Occaecati totam porro et libero est officiis.', 'Earum eveniet omnis labore laudantium exercitationem. Optio repudiandae nemo at modi illum nulla. Vitae quia eum quos nesciunt aut. Architecto amet rerum dignissimos iste eum corrupti. Nemo perspiciatis eaque repellendus nihil provident velit et.', 1, 'high', 13, 15, '2024-08-26', '2024-09-10', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(242, 'Et repudiandae sint quis ut ducimus consequatur quia nulla veritatis qui.', 'Voluptatem delectus praesentium adipisci beatae ut optio consectetur. Sed eligendi a dolorem nihil amet molestias in. Saepe corporis omnis ipsum quia perferendis. Quaerat quam recusandae nisi adipisci incidunt distinctio. Cupiditate voluptatum recusandae asperiores. Qui minus facere quis. Nobis dolor provident id aspernatur vel iusto.', 1, 'low', 13, 1, '2024-08-26', '2024-09-20', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(243, 'Dolores alias animi aut aut facere ut.', 'Sed aperiam amet perspiciatis eos eveniet error. Est eos vel maxime a autem est alias. Placeat tempora ex est rem ex corporis. Id temporibus ullam similique molestiae.', 2, 'medium', 13, 21, '2024-08-31', '2024-09-11', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(244, 'Dolore temporibus voluptatibus et.', 'Quis suscipit voluptatem occaecati et. Harum ea voluptas temporibus id molestiae voluptas eos esse. Quis est et et voluptate impedit. Itaque quis dolor velit sunt sed quam delectus.', 2, 'low', 13, 1, '2024-08-26', '2024-09-26', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(245, 'Facilis omnis sed pariatur voluptas exercitationem.', 'Et explicabo ut vel quia. Enim quisquam error inventore dolor nihil ut necessitatibus. Sint qui natus accusamus ut recusandae repellat quis. Aut enim eveniet illum aut atque quisquam quod.', 2, 'high', 13, 21, '2024-08-31', '2024-09-24', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(246, 'Voluptas ut dolor consequatur rerum.', 'Et enim cum rerum animi expedita accusamus. Natus facilis qui et qui fuga accusantium. Vero sit sed error. Dolores incidunt cumque maxime omnis et et earum.', 2, 'high', 13, 15, '2024-08-29', '2024-09-16', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(247, 'Omnis asperiores quae cumque sed voluptatem illo.', 'Nisi quis commodi sequi harum. Id dolor perferendis modi enim sint. Corporis temporibus voluptatum nobis quia itaque perspiciatis ut.', 2, 'low', 13, 21, '2024-08-29', '2024-09-11', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(248, 'Hic molestiae similique quibusdam ex unde.', 'Accusantium officia velit velit quis quae perspiciatis qui. Aut aut dolores consequatur perspiciatis aut rem. Cumque accusamus ea non. Adipisci deserunt aperiam ut. Aperiam quod est consequatur aut dolorem.', 3, 'low', 13, 15, '2024-08-30', '2024-09-19', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(249, 'Ducimus nihil et repellat maxime quia.', 'Deleniti sunt rerum excepturi et. Nostrum et in aliquam voluptatum quis nostrum repudiandae. Ea aperiam quo expedita deleniti. Et voluptatum debitis et magnam. Impedit nihil occaecati est aut eos.', 3, 'low', 13, 15, '2024-08-26', '2024-09-21', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(250, 'Earum sunt possimus et quis.', 'Debitis et et esse eos. Qui molestiae quia ut sit temporibus tempora. Voluptatibus blanditiis voluptates pariatur quia distinctio. Incidunt error voluptas voluptatem natus.', 3, 'high', 13, 1, '2024-08-30', '2024-09-09', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(251, 'Odit officiis delectus recusandae cumque odio corrupti aut.', 'Animi officiis vel sed. Eos sunt adipisci totam dolores quis quasi. Sed cumque similique soluta nulla minima. Doloremque et at quo.', 3, 'medium', 13, 15, '2024-08-27', '2024-09-22', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(252, 'Enim commodi quos rerum exercitationem deserunt quia.', 'Odio est harum voluptatem ullam. Et odio praesentium animi ipsa. Et suscipit et illo rerum nesciunt.', 3, 'high', 13, 15, '2024-08-27', '2024-09-13', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(253, 'Temporibus voluptatem facere laborum cumque in quis.', 'Quibusdam quo ipsa illo veritatis ut quae quia. Magni quia quam aliquid eos quos voluptas vel. Rerum et hic aut et ut labore omnis. Explicabo hic sint consectetur facere. Ullam in asperiores accusantium ipsam.', 0, 'low', 14, 28, '2024-08-27', '2024-09-19', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(254, 'Illum esse a quo quam.', 'Molestiae placeat consequatur dicta voluptatem aliquam facere nemo. Consequatur quae quisquam dicta nemo voluptatibus. Officiis in dolorem minima debitis reprehenderit accusantium recusandae. Sed amet et in odit nisi placeat. Voluptates eos ut deserunt excepturi voluptatem atque. Eum sunt consequatur ad fugiat ut perferendis nihil. Qui doloribus aut eius debitis.', 0, 'medium', 14, 14, '2024-08-26', '2024-09-27', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(255, 'Et pariatur veniam sunt velit asperiores nostrum quia aut magni.', 'Sit dolore sequi eum odio. Et ad tenetur porro deleniti officia dignissimos. Qui adipisci molestias aut cupiditate quia dolores aut quod. Eos et aliquam vitae laudantium earum rerum. Eligendi dignissimos est ut iste voluptatem.', 0, 'medium', 14, 23, '2024-08-27', '2024-09-17', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(256, 'Aut mollitia impedit deleniti.', 'Sequi fuga adipisci neque iusto perspiciatis dolor. Nobis dolores aut repellat minima officia provident molestiae. Consequatur maxime cum incidunt aut optio sit. Commodi fuga sequi facere enim consectetur deleniti ullam quae. Alias aut corporis laudantium quaerat eaque nemo.', 0, 'medium', 14, 14, '2024-08-27', '2024-09-13', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(257, 'Enim et aut explicabo natus rerum molestias quia vitae.', 'Sed et commodi iusto qui autem. Perferendis est quisquam voluptatum reprehenderit perspiciatis. Fuga dolor excepturi possimus exercitationem omnis fugiat quos. Aut sed qui cupiditate enim et et. Error et quo aperiam aperiam nesciunt.', 0, 'medium', 14, 23, '2024-08-31', '2024-09-24', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(258, 'Ad quos natus aliquam voluptatem saepe.', 'Quae magnam velit commodi sit explicabo facilis. Perspiciatis asperiores voluptate nisi sunt omnis fuga ut dolore. Facere saepe modi ex explicabo harum dolor nam. Qui vero exercitationem neque natus omnis optio dolore. Nisi qui cum eligendi animi voluptatum quidem. Aut quia qui sequi cumque magnam impedit tempora et. Non labore nulla quas vel labore cum commodi. Ut sequi libero nam maxime asperiores magnam rem est. Esse magnam dolor sit dolores accusamus repellat totam non.', 1, 'low', 14, 23, '2024-08-26', '2024-09-10', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(259, 'Quia natus vel qui.', 'Necessitatibus adipisci veniam sit dolore qui inventore beatae. Beatae tempore sed ut veniam nihil. Deserunt quas et voluptatem architecto. Est accusamus voluptatem maxime quis illo tenetur ea necessitatibus. Sapiente similique nobis quis exercitationem dignissimos.', 1, 'medium', 14, 12, '2024-08-31', '2024-09-20', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(260, 'Culpa quas voluptatem quasi sunt est.', 'Illum soluta natus ad. Ut velit quos culpa omnis voluptas sunt in delectus. Facere a repellendus officia ipsa optio. Eveniet quibusdam asperiores fuga ea nostrum. Tempora ut quos minus laborum quia labore. Et eius officiis minima consequatur.', 1, 'low', 14, 28, '2024-08-27', '2024-09-10', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(261, 'Qui est ducimus temporibus molestiae qui.', 'Rerum voluptas repellat voluptates architecto iste et consequatur. Sit sit optio distinctio ratione enim. Neque nihil modi officia magnam reprehenderit reiciendis totam ad. Tenetur suscipit numquam consequatur optio fugit omnis nisi similique. Ipsam ea aut excepturi repellendus esse sit. Quibusdam facere delectus laborum temporibus. Adipisci suscipit molestiae porro ipsa quos expedita est. Perferendis deserunt eos nisi quod voluptatem.', 1, 'high', 14, 28, '2024-08-26', '2024-09-13', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(262, 'Odio eveniet vitae voluptas.', 'Optio minus dolore nulla aspernatur aut harum. Soluta ipsum quia corrupti magni omnis voluptas. Maiores non laborum doloribus sit omnis possimus hic. Aliquid et et ut.', 1, 'medium', 14, 1, '2024-08-26', '2024-09-15', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(263, 'Assumenda qui impedit qui reiciendis voluptas totam possimus quos.', 'Fuga incidunt non odit animi. Rerum eaque exercitationem veniam sint rem officia. Incidunt et molestias vel quasi harum tenetur. Molestias repellat eum aliquam recusandae vitae aut. Eum ad nulla incidunt quia ex. Neque neque et est expedita in.', 2, 'high', 14, 1, '2024-08-29', '2024-09-21', '2024-09-01 15:16:20', '2024-09-01 15:16:20');
INSERT INTO `tasks` (`id`, `title`, `description`, `status`, `priority`, `project_id`, `assigned_id`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
(264, 'Voluptatibus dolores doloribus quaerat accusamus exercitationem voluptas eum voluptatem.', 'Et qui adipisci est id aut animi deleniti omnis. Aspernatur voluptas illo et repudiandae. Nobis delectus provident ea dolores nisi sed autem. Sed ut voluptate in vitae odit molestias. Architecto cumque atque eos aspernatur. Vero asperiores necessitatibus autem enim. Voluptatem dolores sit quaerat ipsa tempore vitae.', 2, 'high', 14, 28, '2024-08-30', '2024-09-29', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(265, 'Soluta dolor numquam perferendis dignissimos.', 'Ratione libero ab ea totam omnis facere impedit. Magnam et at assumenda ut quaerat et. Est modi sit veritatis vitae. Expedita est sapiente aut suscipit ex tenetur. Recusandae voluptatem et ut tempora quo.', 2, 'high', 14, 12, '2024-08-31', '2024-09-20', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(266, 'Magni eos repellendus ex ad iusto eum numquam assumenda sunt.', 'Maxime in accusantium culpa. Quisquam ea tempora harum debitis. Esse ducimus voluptas consequatur est quia nam sit accusantium. Et neque voluptatem et fugit cumque architecto temporibus. Pariatur totam eveniet consectetur molestiae ea nesciunt. Et amet commodi minus doloribus. Aut pariatur quis et. Facere inventore voluptas cumque.', 2, 'high', 14, 23, '2024-08-28', '2024-09-17', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(267, 'Eaque dolores consequatur ullam qui explicabo.', 'Et temporibus quas sed modi reiciendis atque repellat. Ea earum quibusdam quidem tempora. Dicta quia distinctio itaque reprehenderit tenetur. Qui delectus ipsum ut explicabo iste. Aut ea animi rerum pariatur sint. Aspernatur labore ratione voluptas aut ab vel vero.', 2, 'high', 14, 1, '2024-08-30', '2024-09-09', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(268, 'Accusamus enim illo autem perspiciatis cupiditate quisquam id debitis.', 'Optio repellat est tenetur eum et molestias quia reprehenderit. Harum recusandae a voluptates. Nihil tempore minima rerum minus. Vero est maxime totam temporibus excepturi dignissimos itaque aut. Quo distinctio praesentium inventore maxime unde.', 2, 'medium', 14, 12, '2024-08-27', '2024-09-26', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(269, 'Provident eligendi quo.', 'Quos commodi cumque enim facilis atque fugit. Sit praesentium dolor nobis laboriosam deleniti. Asperiores cupiditate itaque doloremque quaerat. Hic porro nobis doloribus eum nihil qui explicabo. Dolores placeat tenetur vitae ut officia eos eaque.', 3, 'low', 14, 14, '2024-09-01', '2024-09-24', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(270, 'Ut nulla eius sunt ipsa commodi sit omnis amet.', 'Ea rerum quos enim voluptatibus qui ipsam fugit animi. Qui quis tempore minus. Ea ratione animi et distinctio. Voluptates rerum quas quae et qui. Dolores quia at repellendus tempora. Labore est molestiae velit blanditiis sed quia. Amet ipsum consectetur assumenda error. Delectus natus illum libero dolorem rerum.', 3, 'low', 14, 23, '2024-08-27', '2024-09-09', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(271, 'Rerum accusamus nihil enim expedita rerum vitae rem non rerum.', 'Autem autem ea laboriosam non soluta beatae. Aut totam reprehenderit dignissimos maiores quae omnis sit. Ratione ut et cum eos pariatur ut consectetur. Laboriosam facilis fuga voluptate qui aut autem. Nemo et dolores accusamus aperiam. Dolores libero aliquid minima.', 3, 'medium', 14, 14, '2024-09-01', '2024-09-20', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(272, 'Nostrum dolorum hic quo ut.', 'Dolor quidem ipsum non porro quos. Beatae ut perferendis quo molestiae recusandae libero. Quo quia consequatur tempora aut id autem. Occaecati aut in quia et repellendus delectus est. Minus aut voluptatibus consectetur tempora. Excepturi voluptatem est rerum dolor unde nihil. Impedit eos aut a. Voluptate aut impedit maiores asperiores.', 3, 'high', 14, 1, '2024-08-31', '2024-09-15', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(273, 'Autem et repellat laborum.', 'Autem id labore illo. Et sit facilis autem molestias autem dicta voluptatem. Et aperiam eaque possimus consectetur at eum. Suscipit officiis omnis reiciendis. Aut corporis aut voluptas voluptate voluptas harum. Rerum nostrum magnam sunt nobis itaque.', 3, 'low', 14, 12, '2024-08-31', '2024-09-24', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(274, 'Est ut sed repellendus suscipit in voluptatibus.', 'Excepturi nihil libero ratione ea maiores. Explicabo mollitia velit nihil at. Rerum animi nam omnis at qui. Eaque inventore aut nesciunt asperiores. Perspiciatis ipsum debitis aut ea. Tempore minus placeat in sit. Et quis quia illo enim quia voluptatum itaque molestiae. Asperiores delectus architecto officia aperiam culpa mollitia cumque in. Dolorem dolor praesentium minima itaque quis.', 0, 'high', 15, 3, '2024-08-27', '2024-09-11', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(275, 'Vitae quidem laudantium et.', 'Debitis perspiciatis possimus voluptatem qui quis enim occaecati. Voluptatem est rerum aut nobis vel. Laudantium eveniet incidunt ut eum id itaque.', 0, 'low', 15, 1, '2024-08-29', '2024-10-01', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(276, 'Dolores dicta aspernatur doloribus sit veniam.', 'Saepe nam maiores deleniti aut et. Est suscipit labore repellat quaerat quia officiis. Quo nobis id quo excepturi. Eligendi voluptatem mollitia dolores quasi. Et et doloribus sint sequi veniam iusto.', 0, 'low', 15, 1, '2024-08-29', '2024-09-11', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(277, 'Ut esse quas eos illum repellendus debitis.', 'Quod maiores aliquam nam occaecati ut asperiores ex. Beatae sed aut non rerum quasi et sed. Sit omnis nesciunt voluptas nostrum itaque. Itaque sit eius suscipit pariatur velit. Placeat dicta ipsa exercitationem.', 0, 'medium', 15, 7, '2024-08-29', '2024-09-25', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(278, 'Facilis autem ea dolore velit.', 'Nesciunt harum maiores quae fugit. Corporis omnis quas laudantium qui doloribus doloremque doloremque. Incidunt est porro rerum fuga culpa omnis nihil.', 0, 'medium', 15, 7, '2024-08-26', '2024-09-25', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(279, 'Dolorem vel quae aut sit sunt consequatur vitae aspernatur et quidem.', 'Et rerum hic harum aut. Sunt in eos vel qui dicta minima. Ad beatae delectus saepe doloremque placeat quis deserunt. Accusamus vero excepturi voluptate sunt neque. Iure consequatur rem quos. Voluptatem praesentium impedit earum. Quis velit possimus aut. Quod dolores quia possimus voluptatem ex mollitia quia.', 1, 'medium', 15, 1, '2024-08-31', '2024-09-30', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(280, 'Maxime amet blanditiis.', 'Dolore reiciendis atque et ut ut modi autem. Dolorum illum voluptatem suscipit ut tempore.', 1, 'medium', 15, 7, '2024-08-30', '2024-09-28', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(281, 'Perferendis eveniet ea provident odit omnis quaerat dolor dolores.', 'Eligendi error tempora impedit ipsa dolores. Accusamus et ex eaque aperiam maiores expedita. Veritatis et eos ut et aut natus.', 1, 'high', 15, 1, '2024-08-27', '2024-09-26', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(282, 'Qui dolores molestias quos minima sunt odit quis.', 'Dolores eveniet inventore optio eos reiciendis qui provident. Occaecati vel numquam aliquid dolores pariatur quia. Repellendus non voluptas quas dolorem tempora ut a. Quas praesentium omnis sed dignissimos.', 1, 'high', 15, 3, '2024-08-28', '2024-10-01', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(283, 'Iste officiis quo cumque est cumque et omnis ullam perferendis eum.', 'Et fugit omnis suscipit suscipit provident inventore. Sint sit et ut ipsa perferendis facere facilis. Maxime totam est ut illo sapiente quam rerum. Id magni aliquid alias in. Laboriosam occaecati ad beatae quasi veritatis.', 2, 'high', 15, 3, '2024-08-28', '2024-09-19', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(284, 'Aut laboriosam libero doloribus.', 'Et nemo nesciunt eligendi sunt dolores ducimus. Aut ullam rerum qui nostrum pariatur. Omnis aut atque ea delectus quibusdam asperiores eos. Deleniti provident cum corrupti enim sequi optio.', 2, 'high', 15, 3, '2024-08-28', '2024-09-12', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(285, 'Laudantium voluptates eum nihil id sunt aut expedita.', 'Vitae voluptas aut ipsum velit veritatis et aut. Qui dolor quo in iure. Aliquam deleniti fugit et molestiae dolor. Soluta soluta odit qui.', 2, 'low', 15, 1, '2024-08-26', '2024-09-24', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(286, 'Fugit molestiae laboriosam laborum omnis veritatis voluptas.', 'Voluptas quod error perspiciatis. Perferendis corrupti dolores est vitae rem iusto unde. Occaecati ex amet tempora doloribus voluptatem excepturi. Excepturi voluptatibus assumenda deserunt non facilis sed sequi. Consequatur est officia accusamus magni rerum impedit. Iste non est voluptatum similique numquam.', 2, 'medium', 15, 7, '2024-08-29', '2024-09-12', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(287, 'Ab eum nostrum dolorum veritatis inventore doloribus.', 'Corrupti ea dolor eos distinctio. Id eos quis non aut dolor sapiente. Occaecati velit perspiciatis temporibus eum laborum. Harum ut eum excepturi quia. Voluptatibus eaque eum aut corrupti.', 2, 'medium', 15, 3, '2024-08-30', '2024-09-24', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(288, 'Eum qui dolor rerum.', 'Possimus saepe et asperiores eveniet distinctio quia. Alias esse itaque inventore dignissimos. Aut est aut fugit aspernatur et non ducimus. Qui doloribus enim nam sed assumenda est velit. Ad doloremque recusandae assumenda expedita ipsa nihil. Vel veniam quia incidunt officiis recusandae sunt at ut. Nam cupiditate placeat atque rerum. Ut nostrum tempore deserunt eveniet.', 3, 'low', 15, 7, '2024-08-29', '2024-09-23', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(289, 'Vel sequi voluptas libero repellat fugiat cumque fuga.', 'Excepturi officia facilis ea officiis. Consequuntur nesciunt ratione aut non sapiente. Error et quas corrupti quidem. Nostrum consequatur quia impedit aut odio. Ut eos fuga praesentium rem commodi.', 3, 'medium', 15, 3, '2024-08-30', '2024-09-15', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(290, 'Fugiat esse beatae blanditiis odit tempora perspiciatis culpa repellat.', 'Rerum dolores rem sunt omnis. Voluptate cum iusto ut eligendi exercitationem. Est rem adipisci at velit quae rerum. Fugit perspiciatis possimus sed fuga cupiditate alias ipsa. Omnis at facere aut cumque quo aut ea. Optio dicta a voluptatem quis omnis qui. Sunt iure et qui totam.', 3, 'low', 15, 1, '2024-08-28', '2024-09-16', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(291, 'Necessitatibus molestiae non aliquid qui enim.', 'Voluptatum ut ut optio quis ratione. Temporibus necessitatibus adipisci sunt et deserunt voluptas commodi. Eum praesentium molestiae et. Et dolor molestias accusamus.', 3, 'low', 15, 3, '2024-08-28', '2024-09-09', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(292, 'Molestias perferendis id minima provident inventore aliquid unde.', 'Ut adipisci officiis accusamus consectetur et necessitatibus. Quo error illum error. Ea nobis perferendis sed et vitae qui.', 3, 'high', 15, 1, '2024-08-31', '2024-09-15', '2024-09-01 15:16:20', '2024-09-01 15:16:20'),
(293, 'Nulla vel voluptatum nemo provident.', 'Doloremque architecto labore illo sed. Maiores nihil voluptas voluptatum veniam qui. Aut excepturi ut quibusdam tenetur repellendus accusamus. Ipsum fugit enim deleniti doloremque sit cum.', 3, 'high', 15, 1, '2024-09-01', '2024-09-12', '2024-09-01 15:16:20', '2024-09-01 15:16:20');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'assets/img/avatars/avatar.png',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `profile_photo`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Demo User', 'demo@example.com', '2024-09-01 15:16:06', '$2y$12$XFE4lFbVxD9eNp5gsVBlQuAUbLJ9kstFCOKaIOrp1Ag1a9j47yf.G', 'assets/img/avatars/default.png', '0RPMefq7ox', '2024-09-01 15:16:07', '2024-09-01 15:16:07'),
(2, 'Dr. Orin Johnson DDS', 'mayert.noemi@example.org', '2024-09-01 15:16:07', '$2y$12$W5DcMwyvWi8wdqvT.C8ekuF2AjRg2eQsl0OqPO71k1GXUHO5sV3iq', 'assets/img/avatars/1.png', 'kggg3QnCxd', '2024-09-01 15:16:08', '2024-09-01 15:16:08'),
(3, 'Dr. Riley Feest PhD', 'fmccullough@example.org', '2024-09-01 15:16:08', '$2y$12$cXocCw62Cxn6eXt8ZntjSOjWsqGatTZugQzt93TK8Hd/oAHL2RLMS', 'assets/img/avatars/2.png', 'IYsaWmJphz', '2024-09-01 15:16:08', '2024-09-01 15:16:08'),
(4, 'Prof. Jarred Kiehn', 'cynthia.casper@example.org', '2024-09-01 15:16:08', '$2y$12$ufwML.Iiixnl3MhPMMduRufvJV01VKTIOZcJDgB21fgv5e1olfau.', 'assets/img/avatars/3.png', 'vco4x53EGC', '2024-09-01 15:16:08', '2024-09-01 15:16:08'),
(5, 'Tiara Mitchell', 'xbins@example.net', '2024-09-01 15:16:08', '$2y$12$enVJH6Z/mxPapbE8X4vEkexJCUEh.Oj8QCsFNhW2lW/EkHfxoEK4C', 'assets/img/avatars/4.png', 'iE4ewpIFtK', '2024-09-01 15:16:09', '2024-09-01 15:16:09'),
(6, 'Dulce Parisian PhD', 'konopelski.dino@example.net', '2024-09-01 15:16:09', '$2y$12$3U0rga.mBI3r.llTroSZTuGw7fUcwYwuj0mb6NFg3Cm9PFnICg4gC', 'assets/img/avatars/5.png', 'nf1Z9oxjJI', '2024-09-01 15:16:09', '2024-09-01 15:16:09'),
(7, 'Shanie Yost', 'pokeefe@example.com', '2024-09-01 15:16:09', '$2y$12$6wTNPIXPfN9lS3tSXA6w9eK60BP7GVNZdCE99qk5lEIpq2G5fw3mW', 'assets/img/avatars/6.png', 'uLi46e432I', '2024-09-01 15:16:10', '2024-09-01 15:16:10'),
(8, 'Davin Herman', 'kuvalis.taya@example.net', '2024-09-01 15:16:10', '$2y$12$tHBDQ9ZTkBa6yxb4kG3HT.gtSyjce1KIBDFo8LizJpWDMLAFhuwCi', 'assets/img/avatars/7.png', 'pAfj9QkNlb', '2024-09-01 15:16:10', '2024-09-01 15:16:10'),
(9, 'Prof. Caitlyn Waelchi I', 'ppaucek@example.com', '2024-09-01 15:16:10', '$2y$12$oZtxCTqFZYNj/VqVcHObSewWT5TyHWtBxmUPOCpREhvmLy1ihdPb2', 'assets/img/avatars/8.png', 'pZYjnXtYfD', '2024-09-01 15:16:11', '2024-09-01 15:16:11'),
(10, 'Gladys Fahey', 'bernhard.earl@example.com', '2024-09-01 15:16:11', '$2y$12$2driQrW6pBagCqUeA9QMd.iVNxJDuwLROhyMLvAwSX2p9th8.g7Bu', 'assets/img/avatars/9.png', 'wS9yrb6LL0', '2024-09-01 15:16:11', '2024-09-01 15:16:11'),
(11, 'Lea Schaden', 'macejkovic.valentine@example.net', '2024-09-01 15:16:11', '$2y$12$Qq5JlcpOYDvFmfuRv7f3v.SME6gx3r3O2MTYQGTuF.FWNN6SNn8aO', 'assets/img/avatars/10.png', 'jfV2ZpbEWt', '2024-09-01 15:16:12', '2024-09-01 15:16:12'),
(12, 'Macy Schroeder', 'ferdman@example.com', '2024-09-01 15:16:12', '$2y$12$MT2cCP6p2CXpU5Fourr99.v.eIMHAbpXOHCOY0nwVoUcQjESMk3lG', 'assets/img/avatars/11.png', 'CeCJr2WY6h', '2024-09-01 15:16:12', '2024-09-01 15:16:12'),
(13, 'Dr. Wilfrid Kuvalis', 'kraig.leannon@example.com', '2024-09-01 15:16:12', '$2y$12$15KiSB2khWPxMeS7dA9GFOUlj5qX9yzfAcGYDlIiAMI45a3Jn3ble', 'assets/img/avatars/12.png', 'eqIrFS0wqJ', '2024-09-01 15:16:12', '2024-09-01 15:16:12'),
(14, 'Rene Boehm', 'shanahan.roman@example.com', '2024-09-01 15:16:12', '$2y$12$jjjYT6iH.BvG8wZSwuxsGeYvg.AEDwIru8eAHUFZ5GbnEy./zhjzW', 'assets/img/avatars/13.png', 'F7lgMuHu2P', '2024-09-01 15:16:13', '2024-09-01 15:16:13'),
(15, 'Alvena Kuhlman', 'felton35@example.net', '2024-09-01 15:16:13', '$2y$12$OLRTBfronXw0Cs1oqdraIONXa0xR..8GzA.Na0.Vydj2N/AnmywkS', 'assets/img/avatars/14.png', 'OTGGw2ungs', '2024-09-01 15:16:13', '2024-09-01 15:16:13'),
(16, 'Jolie Langosh', 'dora.kuhn@example.com', '2024-09-01 15:16:13', '$2y$12$3eaqu0IcENlhfH3eKa2Dx.wSEi0YnjDU/sry7YmP2eHQAj2OuYbji', 'assets/img/avatars/15.png', 'lkxJBNw72F', '2024-09-01 15:16:13', '2024-09-01 15:16:13'),
(17, 'Humberto Hettinger', 'alexandrine.altenwerth@example.com', '2024-09-01 15:16:13', '$2y$12$6YQ8kjFkVLW6SVUngSsXq.tFpCfYZveH3NrHOcbfYRGyDLIMaFj0W', 'assets/img/avatars/16.png', '1San2fzvI0', '2024-09-01 15:16:13', '2024-09-01 15:16:13'),
(18, 'Prof. Tyree Cormier', 'ybahringer@example.net', '2024-09-01 15:16:13', '$2y$12$zrrVctNeKxYnfqhbXpPMwu7CaW7kLDYKtNE8XphFpiJwfwgdvjWTe', 'assets/img/avatars/17.png', 'lIaqDT9BNh', '2024-09-01 15:16:14', '2024-09-01 15:16:14'),
(19, 'Jazmyne Lueilwitz PhD', 'jarod05@example.org', '2024-09-01 15:16:14', '$2y$12$tB00P6CoUs9YuKIcvY4diectINC6ItQXXJj6PeC/UK7pAVKKCzONG', 'assets/img/avatars/18.png', 'ac3UIkMvdy', '2024-09-01 15:16:14', '2024-09-01 15:16:14'),
(20, 'Xzavier Price', 'ohara.nadia@example.org', '2024-09-01 15:16:14', '$2y$12$9iAyDx9PRQ52JGJ7cBy4FujHbO1FIHayANpdvygnOcMabj0I019r2', 'assets/img/avatars/19.png', 'q5fnrkEDFF', '2024-09-01 15:16:14', '2024-09-01 15:16:14'),
(21, 'Prof. Mathias Steuber', 'robyn.graham@example.org', '2024-09-01 15:16:14', '$2y$12$5.C0orak1x2u2W8HaqDjQ.PPIeEh9fBDaNu8Pi2y1A9Nux.ZXm1jO', 'assets/img/avatars/20.png', 'CxlgLn4Mk6', '2024-09-01 15:16:15', '2024-09-01 15:16:15'),
(22, 'Dixie Fadel', 'piper.torphy@example.org', '2024-09-01 15:16:15', '$2y$12$wrtPl1KEEbDxjHOj.IG0aOoXyVemy9MuewREav4hstkkTwDezNfYq', 'assets/img/avatars/21.png', 'h480wSWxHz', '2024-09-01 15:16:15', '2024-09-01 15:16:15'),
(23, 'Earline McCullough', 'efrain.dare@example.org', '2024-09-01 15:16:15', '$2y$12$L.PdEe3HIrC6kLlkr4kQK.fA1JcqfCkJinfdkVW1Sl/ZM08OkQ4PS', 'assets/img/avatars/22.png', 'PHooNyCiaz', '2024-09-01 15:16:15', '2024-09-01 15:16:15'),
(24, 'Agustin Frami V', 'goldner.alberta@example.net', '2024-09-01 15:16:15', '$2y$12$rCibDCbJC/i6Ra7WOYa1G.Xy15T4vEeyeqx8TcEuq8KJ2IZQT2eJ6', 'assets/img/avatars/23.png', 'mriqoC9G3f', '2024-09-01 15:16:16', '2024-09-01 15:16:16'),
(25, 'Daphne Gorczany', 'mkutch@example.net', '2024-09-01 15:16:16', '$2y$12$ho2NtjyuehZ4CbIvTpFl1.UkH/yDDOUQR9yeo9KDZ6JvBMhOd3FjC', 'assets/img/avatars/24.png', 'KKfd3zPboo', '2024-09-01 15:16:16', '2024-09-01 15:16:16'),
(26, 'Kade Gutmann', 'wstamm@example.org', '2024-09-01 15:16:16', '$2y$12$qh4anslPHICSBqcY3KB7LerpzrpFyBrLn00AUGAHo3QLs1dbZyddC', 'assets/img/avatars/25.png', 'gJ1CGCcdqZ', '2024-09-01 15:16:16', '2024-09-01 15:16:16'),
(27, 'Prof. Pierce Maggio MD', 'johnston.terry@example.net', '2024-09-01 15:16:16', '$2y$12$oufqDNJ4rj06JOWYhsX7cerqplmHV/kR6YQKNO7c7.6S5w3j84oY6', 'assets/img/avatars/26.png', 'Z9ogNFhjw3', '2024-09-01 15:16:17', '2024-09-01 15:16:17'),
(28, 'Elsie Bernhard', 'macejkovic.alphonso@example.org', '2024-09-01 15:16:17', '$2y$12$inAOZIMZphrPL6pndUWSQu4UKJRFhDF8gEaTSdf1N2nMbrm69Dm1i', 'assets/img/avatars/27.png', 'RMdEHYwFRP', '2024-09-01 15:16:17', '2024-09-01 15:16:17'),
(29, 'Jazmyn Gislason', 'sbecker@example.com', '2024-09-01 15:16:17', '$2y$12$OXRJAHcSNUqfxJ.YEZN2eeqNELkO.uxfizvQQSbWOEWdFmCjsLUpa', 'assets/img/avatars/28.png', 'N5gvl0yA3N', '2024-09-01 15:16:17', '2024-09-01 15:16:17'),
(30, 'Elza Heathcote', 'hstark@example.net', '2024-09-01 15:16:17', '$2y$12$fw7YpoJQ8oZxuMoxj6/jl.UoGp5Deio9tA2PE4ZFFFvYE2z00Jv2i', 'assets/img/avatars/29.png', 'Ze8bmxC1AR', '2024-09-01 15:16:18', '2024-09-01 15:16:18'),
(31, 'Dr. Dora Maggio', 'hessel.jacinthe@example.com', '2024-09-01 15:16:18', '$2y$12$aYPNElTVO63.2cnLuq2nQec2nxKPG2HyH2fXFGm9eau0Is0nQ17mm', 'assets/img/avatars/30.png', 'PPzdStzBqV', '2024-09-01 15:16:18', '2024-09-01 15:16:18');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `project_categories` (`id`),
  ADD CONSTRAINT `projects_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `project_user`
--
ALTER TABLE `project_user`
  ADD CONSTRAINT `project_user_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_assigned_id_foreign` FOREIGN KEY (`assigned_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `tasks_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
