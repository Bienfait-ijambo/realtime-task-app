-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2024 at 07:48 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `real_time_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, '485814fc-de39-4c18-8d48-501dde582f09', 'database', 'default', '{\"uuid\":\"485814fc-de39-4c18-8d48-501dde582f09\",\"displayName\":\"App\\\\Listeners\\\\SendEmailVerification\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":20:{s:5:\\\"class\\\";s:35:\\\"App\\\\Listeners\\\\SendEmailVerification\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:25:\\\"App\\\\Events\\\\NewUserCreated\\\":1:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:15:\\\"App\\\\Models\\\\User\\\";s:2:\\\"id\\\";i:16;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}}s:5:\\\"tries\\\";N;s:13:\\\"maxExceptions\\\";N;s:7:\\\"backoff\\\";N;s:10:\\\"retryUntil\\\";N;s:7:\\\"timeout\\\";N;s:13:\\\"failOnTimeout\\\";b:0;s:17:\\\"shouldBeEncrypted\\\";b:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;}\"}}', 'Symfony\\Component\\Mailer\\Exception\\UnexpectedResponseException: Expected response code \"250\" but got code \"421\", with message \"421 Timeout - closing connection\". in C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php:333\nStack trace:\n#0 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(197): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->assertResponseCode(\'421 Timeout - c...\', Array)\n#1 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\symfony\\mailer\\Transport\\Smtp\\EsmtpTransport.php(118): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->executeCommand(\'MAIL FROM:<admi...\', Array)\n#2 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(254): Symfony\\Component\\Mailer\\Transport\\Smtp\\EsmtpTransport->executeCommand(\'MAIL FROM:<admi...\', Array)\n#3 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(214): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doMailFromCommand(\'admin@mail.com\')\n#4 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\symfony\\mailer\\Transport\\AbstractTransport.php(69): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->doSend(Object(Symfony\\Component\\Mailer\\SentMessage))\n#5 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\symfony\\mailer\\Transport\\Smtp\\SmtpTransport.php(137): Symfony\\Component\\Mailer\\Transport\\AbstractTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#6 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(588): Symfony\\Component\\Mailer\\Transport\\Smtp\\SmtpTransport->send(Object(Symfony\\Component\\Mime\\Email), Object(Symfony\\Component\\Mailer\\DelayedEnvelope))\n#7 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(335): Illuminate\\Mail\\Mailer->sendSymfonyMessage(Object(Symfony\\Component\\Mime\\Email))\n#8 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(205): Illuminate\\Mail\\Mailer->send(\'email.email-ver...\', Array, Object(Closure))\n#9 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\Localizable.php(19): Illuminate\\Mail\\Mailable->Illuminate\\Mail\\{closure}()\n#10 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailable.php(198): Illuminate\\Mail\\Mailable->withLocale(NULL, Object(Closure))\n#11 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(357): Illuminate\\Mail\\Mailable->send(Object(Illuminate\\Mail\\Mailer))\n#12 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\Mailer.php(301): Illuminate\\Mail\\Mailer->sendMailable(Object(App\\Mail\\SendMail))\n#13 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Mail\\PendingMail.php(124): Illuminate\\Mail\\Mailer->send(Object(App\\Mail\\SendMail))\n#14 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\app\\Listeners\\SendEmailVerification.php(29): Illuminate\\Mail\\PendingMail->send(Object(App\\Mail\\SendMail))\n#15 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Events\\CallQueuedListener.php(114): App\\Listeners\\SendEmailVerification->handle(Object(App\\Events\\NewUserCreated))\n#16 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Events\\CallQueuedListener->handle(Object(Illuminate\\Foundation\\Application))\n#17 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#18 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#19 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#20 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#21 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#22 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#23 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#24 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#25 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(124): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(Illuminate\\Events\\CallQueuedListener), false)\n#26 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(144): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#27 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(119): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Events\\CallQueuedListener))\n#28 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(123): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(71): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Events\\CallQueuedListener))\n#30 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#31 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(439): Illuminate\\Queue\\Jobs\\Job->fire()\n#32 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(389): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#33 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(176): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#34 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(139): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#35 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(122): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#36 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#37 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(41): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#38 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#39 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#40 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(662): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#41 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(213): Illuminate\\Container\\Container->call(Array)\n#42 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#43 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(182): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#44 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\symfony\\console\\Application.php(1049): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#45 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\symfony\\console\\Application.php(318): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#46 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\symfony\\console\\Application.php(169): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#47 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(196): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#48 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1187): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#49 C:\\Laravel-11\\htdocs\\projects\\real-time-app\\artisan(13): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#50 {main}', '2024-05-25 00:43:14');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Chris---', 'ben12@gmail.com', '2024-05-25 02:35:28', '2024-06-01 02:40:13'),
(2, 'John', 'john@gmail.com', NULL, NULL),
(3, 'ben', 'ben@gmail.com', '2024-05-31 06:15:52', '2024-05-31 06:15:52'),
(4, 'Isaac The King', 'isaac@gmail.com', '2024-05-31 06:19:44', '2024-05-31 06:19:44'),
(5, 'Bob', 'bob@gmail.com', '2024-06-01 02:16:07', '2024-06-01 02:16:07');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_23_122432_create_personal_access_tokens_table', 1),
(5, '2024_05_25_035934_create_projects_table', 2),
(6, '2024_05_25_043927_create_task_progress_table', 3),
(7, '2024_05_25_052731_create_members_table', 4),
(8, '2024_05_25_061847_create_tasks_table', 5),
(9, '2024_05_25_061918_create_task_members_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(9, 'App\\Models\\User', 20, 'qQKPjndxljuYQi/POiXJa8O19nVO/vTf/DpXO541g=qQKPjndxljuYQi/POiXJa8O19nVO/vTf/DpXO541g=', 'df7bfe67871e45ca9c34a135d4523985c6aefd43e2ceff0881cbb588b98e3d05', '[\"*\"]', '2024-06-01 03:33:14', NULL, '2024-06-01 03:22:06', '2024-06-01 03:33:14'),
(10, 'App\\Models\\User', 20, 'qQKPjndxljuYQi/POiXJa8O19nVO/vTf/DpXO541g=qQKPjndxljuYQi/POiXJa8O19nVO/vTf/DpXO541g=', '19caf7748b2873db55d298b2b0b1099d00f7d33ed316dfe41a0e540e3cacc2da', '[\"*\"]', '2024-06-05 02:02:39', NULL, '2024-06-05 01:01:31', '2024-06-05 02:02:39'),
(11, 'App\\Models\\User', 20, 'qQKPjndxljuYQi/POiXJa8O19nVO/vTf/DpXO541g=qQKPjndxljuYQi/POiXJa8O19nVO/vTf/DpXO541g=', 'c01a1fee2f6fffd7bd9ca666c844de4d55d695cc568b29b1fabd0f54d3b27bd2', '[\"*\"]', NULL, NULL, '2024-06-06 00:27:41', '2024-06-06 00:27:41'),
(12, 'App\\Models\\User', 20, 'qQKPjndxljuYQi/POiXJa8O19nVO/vTf/DpXO541g=qQKPjndxljuYQi/POiXJa8O19nVO/vTf/DpXO541g=', '4c840418d27bc246576eb3646c05b6b00ef89495b54a9f1a2fd4d1d4c5e0c34b', '[\"*\"]', NULL, NULL, '2024-06-07 01:08:00', '2024-06-07 01:08:00'),
(13, 'App\\Models\\User', 20, 'qQKPjndxljuYQi/POiXJa8O19nVO/vTf/DpXO541g=qQKPjndxljuYQi/POiXJa8O19nVO/vTf/DpXO541g=', '457f23ed1a996b6b3a4a3b6802286fb70c5e63013bcf656136a36885d7e286d8', '[\"*\"]', NULL, NULL, '2024-06-11 00:59:51', '2024-06-11 00:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `startDate` varchar(255) NOT NULL,
  `endDate` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `name`, `status`, `startDate`, `endDate`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'School system app', 0, '25/05/2024', '30/05/2024', 'school-system-app-2gB3Y9rvSr1717647531', '2024-05-25 01:12:19', '2024-06-06 01:18:51'),
(3, 'X-app', 0, '25/05/2024', '30/05/2024', 'x-app-T0meV0s3XU1716612748', '2024-05-25 01:52:28', '2024-05-25 01:52:28'),
(4, 'cloud computing web service', 0, '2024-06-06', '2024-06-20', 'cloud-computing-web-service-Ne9DhVhZ8p1717646398', '2024-06-06 00:59:58', '2024-06-06 00:59:58'),
(5, 'Project Management Application', 0, '2024-06-06', '2024-06-21', 'project-management-application-sa5Stw7LrX1717648719', '2024-06-06 01:02:40', '2024-06-06 01:38:39'),
(6, 'Task Manager', 0, '2024-06-07', '2024-06-28', 'task-manager-6KI2Cg71rn1717733333', '2024-06-07 01:08:53', '2024-06-07 01:08:53'),
(7, 'Todo list App', 0, '2024-06-12', '2024-06-27', 'todo-list-app-ch9cLxEhmF1717733453', '2024-06-07 01:10:53', '2024-06-07 01:10:53');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('CG9E6mtSMnqMivIv3TOsmdeP2BPB3i5i9BExAKbL', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczI0aWg1UVFVcmE3aWZ5enhGZGU3NE1NM2cxZm1hMmV6MjhNSzRzMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAva2FiYW4/cXVlcnk9cHJvamVjdC1tYW5hZ2VtZW50LWFwcGxpY2F0aW9uLXNhNVN0dzdMclgxNzE3NjQ4NzE5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718084852),
('gGRYxUyejRnXYqYU5HfzMI8x3b5XINRbzM8CmgWj', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzdLODRzYmJaWXhMY0VjTHc3czBzQm92and4ZHRGSDdMR0ptQWVOeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1718077759),
('nFkvhQLS283uuWfKbP6CF24R4K1b46JwDw0DVMLu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/125.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3JGeEU0MDRtcEQ3bEJsVG1nUHZqR3NzUXFWRW1ER2V2dlFGdTB1VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hcHAva2FiYW4/cXVlcnk9cHJvamVjdC1tYW5hZ2VtZW50LWFwcGxpY2F0aW9uLXNhNVN0dzdMclgxNzE3NjQ4NzE5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1718084853);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `projectId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `projectId`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 5, 'Create the UI', 1, '2024-05-25 04:05:24', '2024-06-11 02:43:31'),
(2, 5, 'Fix bug in the API', 2, '2024-05-25 04:07:30', '2024-06-11 02:35:52'),
(6, 5, 'Create the menu', 2, '2024-06-09 01:30:39', '2024-06-11 02:22:42'),
(7, 5, 'Implement cache using Redis', 2, '2024-06-09 01:30:56', '2024-06-11 02:36:23'),
(8, 5, 'Make api Spec', 1, '2024-06-11 02:43:50', '2024-06-11 02:46:40'),
(9, 5, 'Make api Documentation', 0, '2024-06-11 02:46:26', '2024-06-11 02:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `task_members`
--

CREATE TABLE `task_members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `projectId` int(11) NOT NULL,
  `taskId` int(11) NOT NULL,
  `memberId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_members`
--

INSERT INTO `task_members` (`id`, `projectId`, `taskId`, `memberId`, `created_at`, `updated_at`) VALUES
(1, 5, 1, 1, '2024-05-25 04:05:24', '2024-05-25 04:05:24'),
(2, 5, 1, 2, '2024-05-25 04:05:24', '2024-05-25 04:05:24'),
(3, 5, 2, 4, '2024-05-25 04:07:30', '2024-05-25 04:07:30'),
(4, 5, 2, 5, '2024-05-25 04:07:30', '2024-05-25 04:07:30'),
(9, 5, 6, 1, '2024-06-09 01:30:39', '2024-06-09 01:30:39'),
(10, 5, 6, 2, '2024-06-09 01:30:39', '2024-06-09 01:30:39'),
(11, 5, 7, 3, '2024-06-09 01:30:56', '2024-06-09 01:30:56'),
(12, 5, 8, 1, '2024-06-11 02:43:50', '2024-06-11 02:43:50'),
(13, 5, 8, 2, '2024-06-11 02:43:50', '2024-06-11 02:43:50'),
(14, 5, 9, 2, '2024-06-11 02:46:26', '2024-06-11 02:46:26');

-- --------------------------------------------------------

--
-- Table structure for table `task_progress`
--

CREATE TABLE `task_progress` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `projectId` int(11) NOT NULL,
  `pinned_on_dashbaord` int(11) NOT NULL,
  `progress` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task_progress`
--

INSERT INTO `task_progress` (`id`, `projectId`, `pinned_on_dashbaord`, `progress`, `created_at`, `updated_at`) VALUES
(1, 3, 0, '0', '2024-05-25 01:52:28', '2024-06-06 10:55:04'),
(2, 4, 0, '0', '2024-06-06 00:59:58', '2024-06-06 00:59:58'),
(3, 5, 1, '50', '2024-06-06 01:02:40', '2024-06-11 02:46:40'),
(4, 6, 0, '0', '2024-06-07 01:08:53', '2024-06-07 01:08:53'),
(5, 7, 0, '0', '2024-06-07 01:10:53', '2024-06-07 01:10:53');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `isValidEmail` int(11) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `isValidEmail`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, 'ben@gmail.com', 1, NULL, '$2y$12$mjo8I4ZlTbk9tyELyJ3GsO/nXt9CzPDQ7FkYMKtOfyJnjCnRS1HAi', '3zmWjfpM5i1716518934', '2024-05-23 23:48:54', '2024-05-31 01:05:46'),
(2, NULL, 'ijambo@gmail.com', 0, NULL, '$2y$12$2wuajiX3yiLwGbVnB5bsIe52hZiihLgks7EnsAIz7HLST7zsHkgCS', 'M9pMc0cziu1716525458', '2024-05-24 01:37:38', '2024-05-24 01:37:38'),
(4, NULL, 'ijambo12@gmail.com', 0, NULL, '$2y$12$ZgAcQKHRa5zx0sMQ7YxwtuPePKskSFll3sQ6M6yYT41HaOWCQ3UYm', 'TZUIdOnMFO1716525540', '2024-05-24 01:39:00', '2024-05-24 01:39:00'),
(5, NULL, 'ijam1bo12@gmail.com', 0, NULL, '$2y$12$AUt381Hz05mp1hnnNA5r7uet/apTMeh4Mku6IG5JvEojnLp1RGKp.', 'DR9D0Y8Qmi1716525855', '2024-05-24 01:44:15', '2024-05-24 01:44:15'),
(6, NULL, 'ijabo12@gmail.com', 0, NULL, '$2y$12$cQf6TGCdGZeJATiuzNZ4yOYKfUyOaXbzPA44jFgJWRUuaH8vpXQQy', '60vnlIXdMn1716525967', '2024-05-24 01:46:07', '2024-05-24 01:46:07'),
(7, NULL, 'ijambo123@gmail.com', 0, NULL, '$2y$12$8p65AX4ubKcRpowvSHCFoOB6EOkBXgFBfTvbsYT2NoZLmFZDyGHZq', 'UCXWkrc5bv1716527792', '2024-05-24 02:16:32', '2024-05-24 02:16:32'),
(9, NULL, 'isaac123@gmail.com', 1, NULL, '$2y$12$jpJHg/OEqZKVrOy3NlbAc.h6.UDCgT4NM4hs.UgxsHqkrtV2kwYGi', '88snWN8bSG1716528152', '2024-05-24 02:22:32', '2024-05-24 02:23:15'),
(10, NULL, 'john12@gmail.com', 0, NULL, '$2y$12$WFrAnazcLCQRe4ilH59trO7YbtQB/.2mgYcXfewEoZp/9aiDIiekW', 'eOlvzyZxLp1716529187', '2024-05-24 02:39:47', '2024-05-24 02:39:47'),
(11, NULL, 'doe12@gmail.com', 0, NULL, '$2y$12$WgrAs84W1/vi9aGqYSLlQOKNlRHqJ1MKuYlnGKiWRGcxm8WjtQNaC', '79vhZpWVUQ1716529276', '2024-05-24 02:41:16', '2024-05-24 02:41:16'),
(12, NULL, 'user@mail.com', 0, NULL, '$2y$12$dmwQ8S3YWFF.39qiHgdnZu3A.kw9B3WOWe8/6qiNCb1.FnmCnw9iu', 'Dnw3RsaZTm1716529415', '2024-05-24 02:43:35', '2024-05-24 02:43:35'),
(13, NULL, 'user11@mail.com', 0, NULL, '$2y$12$fJXkA3tQDoekDrBUD9ZyM.MhFUzBPbC8JjOjDG4nbG3KfF1GBimnq', 'Xzk3BbQSlb1716530190', '2024-05-24 02:56:30', '2024-05-24 02:56:30'),
(14, NULL, 'user112@mail.com', 1, NULL, '$2y$12$gPDBrYL/BodQnwukH7475uOdrbm5qymIGQltSXPoRn1CGVueW7hs.', 'idCFTt6Hgn1716530232', '2024-05-24 02:57:12', '2024-05-25 00:05:08'),
(15, NULL, 'user200@mail.com', 1, NULL, '$2y$12$ElZc9lF67x1hazlgfKPVVeJgVpPuO/KyR7J2NWOhssjsIe3Y.ZlP.', 'VTZsKCbx901716607277', '2024-05-25 00:21:17', '2024-05-25 00:22:28'),
(16, NULL, 'user201@mail.com', 1, NULL, '$2y$12$KTAE5u52SWKmJu5qF.4T9e0Eyxw5GNrzUUcpHmnjzTx/M9iQ9rNhS', 'phhZ3IhYor1716608525', '2024-05-25 00:42:05', '2024-05-25 00:43:45'),
(17, NULL, 'user202@mail.com', 1, NULL, '$2y$12$9fmUlt0vvrAd18PR305c4.CA9FJB67nQj6hi4.38FhjJC46YeIdnW', '55tLsLSQfM1716608814', '2024-05-25 00:46:54', '2024-05-25 00:47:07'),
(18, NULL, 'user203@mail.com', 1, NULL, '$2y$12$oC55T/3oPJjiQG8TS7wriuIehu7JQin7X.tCMjbMLVFVVdIPTDsre', 'Hfzr53Fsx21716609457', '2024-05-25 00:57:37', '2024-05-25 00:57:48'),
(19, NULL, 'ben34@gmail.com', 0, NULL, '$2y$12$TCoEUeDUXrLabHkIG1iuA.9KWFbjOWJBbluTOxyEdzsT3c/R1Z.DG', 'ngG7cd0cEO1717126811', '2024-05-31 00:40:11', '2024-05-31 00:40:11'),
(20, NULL, 'ben11@gmail.com', 1, NULL, '$2y$12$GHA200SFjNAEq/5zV8FXXObPneO7Kinc3VJjgGU8Za80Bx5Rwr23G', 'e76B4vsMk41717129623', '2024-05-31 01:27:03', '2024-05-31 01:27:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_members`
--
ALTER TABLE `task_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_progress`
--
ALTER TABLE `task_progress`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `task_members`
--
ALTER TABLE `task_members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `task_progress`
--
ALTER TABLE `task_progress`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
