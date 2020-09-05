-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 05 2020 г., 16:30
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `lumen`
--

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'database', 'default', '{\"uuid\":\"77fad66f-ee33-4f65-a684-ff5fe9fa7beb\",\"displayName\":\"App\\\\Jobs\\\\InstagramGetAccountFollowersJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\InstagramGetAccountFollowersJob\",\"command\":\"O:40:\\\"App\\\\Jobs\\\\InstagramGetAccountFollowersJob\\\":12:{s:15:\\\"\\u0000*\\u0000psr16Adapter\\\";O:32:\\\"Phpfastcache\\\\Helper\\\\Psr16Adapter\\\":1:{s:24:\\\"\\u0000*\\u0000internalCacheInstance\\\";O:33:\\\"Phpfastcache\\\\Drivers\\\\Files\\\\Driver\\\":10:{s:3:\\\"tmp\\\";a:1:{s:32:\\\"7ef89acb79b7646751056d188e14674c\\\";s:58:\\\"c:\\\\openserver\\\\userdata\\\\php_upload\\\\phpfastcache\\\\lumen\\\\Files\\\";}s:9:\\\"\\u0000*\\u0000config\\\";O:33:\\\"Phpfastcache\\\\Drivers\\\\Files\\\\Config\\\":20:{s:19:\\\"\\u0000*\\u0000itemDetailedDate\\\";b:0;s:18:\\\"\\u0000*\\u0000autoTmpFallback\\\";b:0;s:22:\\\"\\u0000*\\u0000ignoreSymfonyNotice\\\";b:0;s:13:\\\"\\u0000*\\u0000defaultTtl\\\";i:900;s:25:\\\"\\u0000*\\u0000defaultKeyHashFunction\\\";s:3:\\\"md5\\\";s:30:\\\"\\u0000*\\u0000defaultFileNameHashFunction\\\";s:3:\\\"md5\\\";s:15:\\\"\\u0000*\\u0000defaultChmod\\\";i:511;s:7:\\\"\\u0000*\\u0000path\\\";s:0:\\\"\\\";s:11:\\\"\\u0000*\\u0000fallback\\\";s:0:\\\"\\\";s:17:\\\"\\u0000*\\u0000fallbackConfig\\\";N;s:24:\\\"\\u0000*\\u0000limitedMemoryByObject\\\";i:4096;s:15:\\\"\\u0000*\\u0000compressData\\\";b:0;s:20:\\\"\\u0000*\\u0000preventCacheSlams\\\";b:0;s:20:\\\"\\u0000*\\u0000cacheSlamsTimeout\\\";i:15;s:36:\\\"\\u0000Phpfastcache\\\\Util\\\\ArrayObject\\u0000array\\\";a:18:{s:16:\\\"itemDetailedDate\\\";R:7;s:15:\\\"autoTmpFallback\\\";R:8;s:19:\\\"ignoreSymfonyNotice\\\";R:9;s:10:\\\"defaultTtl\\\";R:10;s:22:\\\"defaultKeyHashFunction\\\";R:11;s:27:\\\"defaultFileNameHashFunction\\\";R:12;s:12:\\\"defaultChmod\\\";R:13;s:4:\\\"path\\\";R:14;s:8:\\\"fallback\\\";R:15;s:14:\\\"fallbackConfig\\\";R:16;s:21:\\\"limitedMemoryByObject\\\";R:17;s:12:\\\"compressData\\\";R:18;s:17:\\\"preventCacheSlams\\\";R:19;s:17:\\\"cacheSlamsTimeout\\\";R:20;s:22:\\\"secureFileManipulation\\\";b:0;s:8:\\\"htaccess\\\";b:1;s:11:\\\"securityKey\\\";s:0:\\\"\\\";s:18:\\\"cacheFileExtension\\\";s:3:\\\"txt\\\";}s:39:\\\"\\u0000Phpfastcache\\\\Util\\\\ArrayObject\\u0000position\\\";i:0;s:25:\\\"\\u0000*\\u0000secureFileManipulation\\\";R:22;s:11:\\\"\\u0000*\\u0000htaccess\\\";R:23;s:14:\\\"\\u0000*\\u0000securityKey\\\";R:24;s:21:\\\"\\u0000*\\u0000cacheFileExtension\\\";R:25;}s:11:\\\"\\u0000*\\u0000fallback\\\";b:0;s:11:\\\"\\u0000*\\u0000instance\\\";N;s:13:\\\"\\u0000*\\u0000driverName\\\";s:5:\\\"Files\\\";s:13:\\\"\\u0000*\\u0000instanceId\\\";s:32:\\\"37ab812c34ea1223a7fefd6ab3a8e0ba\\\";s:15:\\\"\\u0000*\\u0000deferredList\\\";a:0:{}s:16:\\\"\\u0000*\\u0000itemInstances\\\";a:0:{}s:15:\\\"\\u0000*\\u0000eventManager\\\";O:25:\\\"Phpfastcache\\\\EventManager\\\":1:{s:9:\\\"\\u0000*\\u0000events\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000namespace\\\";N;}}s:9:\\\"\\u0000*\\u0000worker\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:10:\\\"App\\\\Worker\\\";s:2:\\\"id\\\";i:4;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000userAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\UserAccount\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:18:\\\"\\u0000*\\u0000accountUsername\\\";s:18:\\\"alena.smolnitskaya\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'InstagramScraper\\Exception\\InstagramException: Failed to get followers of account id 1437049717. The account is private. in C:\\OpenServer\\domains\\lumen\\instagram\\src\\InstagramScraper\\Instagram.php:1315\nStack trace:\n#0 C:\\OpenServer\\domains\\lumen\\instagram\\src\\InstagramScraper\\Instagram.php(1267): InstagramScraper\\Instagram->getPaginateFollowers()\n#1 C:\\OpenServer\\domains\\lumen\\app\\Jobs\\InstagramGetAccountFollowersJob.php(62): InstagramScraper\\Instagram->getFollowers()\n#2 [internal function]: App\\Jobs\\InstagramGetAccountFollowersJob->handle()\n#3 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\BoundMethod.php(37): call_user_func_array()\n#4 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#5 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#6 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#7 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#8 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\bus\\Dispatcher.php(94): Illuminate\\Container\\Container->call()\n#9 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#10 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#11 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\bus\\Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then()\n#12 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#13 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#14 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#15 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then()\n#16 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#17 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#18 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#19 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\Worker.php(306): Illuminate\\Queue\\Worker->process()\n#20 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\Worker.php(132): Illuminate\\Queue\\Worker->runJob()\n#21 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\Console\\WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon()\n#22 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\Console\\WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#23 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#24 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\BoundMethod.php(37): call_user_func_array()\n#25 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#26 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#27 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#28 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#29 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\console\\Command.php(134): Illuminate\\Container\\Container->call()\n#30 C:\\OpenServer\\domains\\lumen\\vendor\\symfony\\console\\Command\\Command.php(258): Illuminate\\Console\\Command->execute()\n#31 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#32 C:\\OpenServer\\domains\\lumen\\vendor\\symfony\\console\\Application.php(911): Illuminate\\Console\\Command->run()\n#33 C:\\OpenServer\\domains\\lumen\\vendor\\symfony\\console\\Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand()\n#34 C:\\OpenServer\\domains\\lumen\\vendor\\symfony\\console\\Application.php(140): Symfony\\Component\\Console\\Application->doRun()\n#35 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\console\\Application.php(93): Symfony\\Component\\Console\\Application->run()\n#36 C:\\OpenServer\\domains\\lumen\\vendor\\laravel\\lumen-framework\\src\\Console\\Kernel.php(116): Illuminate\\Console\\Application->run()\n#37 C:\\OpenServer\\domains\\lumen\\artisan(35): Laravel\\Lumen\\Console\\Kernel->handle()\n#38 {main}', '2020-09-05 13:26:08'),
(2, 'database', 'default', '{\"uuid\":\"6da86383-28ea-48a8-9991-01c8e31bb2c2\",\"displayName\":\"App\\\\Jobs\\\\InstagramGetAccountFollowingsJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\InstagramGetAccountFollowingsJob\",\"command\":\"O:41:\\\"App\\\\Jobs\\\\InstagramGetAccountFollowingsJob\\\":12:{s:15:\\\"\\u0000*\\u0000psr16Adapter\\\";O:32:\\\"Phpfastcache\\\\Helper\\\\Psr16Adapter\\\":1:{s:24:\\\"\\u0000*\\u0000internalCacheInstance\\\";O:33:\\\"Phpfastcache\\\\Drivers\\\\Files\\\\Driver\\\":10:{s:3:\\\"tmp\\\";a:1:{s:32:\\\"7ef89acb79b7646751056d188e14674c\\\";s:58:\\\"c:\\\\openserver\\\\userdata\\\\php_upload\\\\phpfastcache\\\\lumen\\\\Files\\\";}s:9:\\\"\\u0000*\\u0000config\\\";O:33:\\\"Phpfastcache\\\\Drivers\\\\Files\\\\Config\\\":20:{s:19:\\\"\\u0000*\\u0000itemDetailedDate\\\";b:0;s:18:\\\"\\u0000*\\u0000autoTmpFallback\\\";b:0;s:22:\\\"\\u0000*\\u0000ignoreSymfonyNotice\\\";b:0;s:13:\\\"\\u0000*\\u0000defaultTtl\\\";i:900;s:25:\\\"\\u0000*\\u0000defaultKeyHashFunction\\\";s:3:\\\"md5\\\";s:30:\\\"\\u0000*\\u0000defaultFileNameHashFunction\\\";s:3:\\\"md5\\\";s:15:\\\"\\u0000*\\u0000defaultChmod\\\";i:511;s:7:\\\"\\u0000*\\u0000path\\\";s:0:\\\"\\\";s:11:\\\"\\u0000*\\u0000fallback\\\";s:0:\\\"\\\";s:17:\\\"\\u0000*\\u0000fallbackConfig\\\";N;s:24:\\\"\\u0000*\\u0000limitedMemoryByObject\\\";i:4096;s:15:\\\"\\u0000*\\u0000compressData\\\";b:0;s:20:\\\"\\u0000*\\u0000preventCacheSlams\\\";b:0;s:20:\\\"\\u0000*\\u0000cacheSlamsTimeout\\\";i:15;s:36:\\\"\\u0000Phpfastcache\\\\Util\\\\ArrayObject\\u0000array\\\";a:18:{s:16:\\\"itemDetailedDate\\\";R:7;s:15:\\\"autoTmpFallback\\\";R:8;s:19:\\\"ignoreSymfonyNotice\\\";R:9;s:10:\\\"defaultTtl\\\";R:10;s:22:\\\"defaultKeyHashFunction\\\";R:11;s:27:\\\"defaultFileNameHashFunction\\\";R:12;s:12:\\\"defaultChmod\\\";R:13;s:4:\\\"path\\\";R:14;s:8:\\\"fallback\\\";R:15;s:14:\\\"fallbackConfig\\\";R:16;s:21:\\\"limitedMemoryByObject\\\";R:17;s:12:\\\"compressData\\\";R:18;s:17:\\\"preventCacheSlams\\\";R:19;s:17:\\\"cacheSlamsTimeout\\\";R:20;s:22:\\\"secureFileManipulation\\\";b:0;s:8:\\\"htaccess\\\";b:1;s:11:\\\"securityKey\\\";s:0:\\\"\\\";s:18:\\\"cacheFileExtension\\\";s:3:\\\"txt\\\";}s:39:\\\"\\u0000Phpfastcache\\\\Util\\\\ArrayObject\\u0000position\\\";i:0;s:25:\\\"\\u0000*\\u0000secureFileManipulation\\\";R:22;s:11:\\\"\\u0000*\\u0000htaccess\\\";R:23;s:14:\\\"\\u0000*\\u0000securityKey\\\";R:24;s:21:\\\"\\u0000*\\u0000cacheFileExtension\\\";R:25;}s:11:\\\"\\u0000*\\u0000fallback\\\";b:0;s:11:\\\"\\u0000*\\u0000instance\\\";N;s:13:\\\"\\u0000*\\u0000driverName\\\";s:5:\\\"Files\\\";s:13:\\\"\\u0000*\\u0000instanceId\\\";s:32:\\\"37ab812c34ea1223a7fefd6ab3a8e0ba\\\";s:15:\\\"\\u0000*\\u0000deferredList\\\";a:0:{}s:16:\\\"\\u0000*\\u0000itemInstances\\\";a:0:{}s:15:\\\"\\u0000*\\u0000eventManager\\\";O:25:\\\"Phpfastcache\\\\EventManager\\\":1:{s:9:\\\"\\u0000*\\u0000events\\\";a:0:{}}s:12:\\\"\\u0000*\\u0000namespace\\\";N;}}s:9:\\\"\\u0000*\\u0000worker\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:10:\\\"App\\\\Worker\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:14:\\\"\\u0000*\\u0000userAccount\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:15:\\\"App\\\\UserAccount\\\";s:2:\\\"id\\\";i:5;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:18:\\\"\\u0000*\\u0000accountUsername\\\";s:18:\\\"alena.smolnitskaya\\\";s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'InstagramScraper\\Exception\\InstagramException: Failed to get followers of account id 1437049717. The account is private. in C:\\OpenServer\\domains\\lumen\\instagram\\src\\InstagramScraper\\Instagram.php:1407\nStack trace:\n#0 C:\\OpenServer\\domains\\lumen\\instagram\\src\\InstagramScraper\\Instagram.php(1359): InstagramScraper\\Instagram->getPaginateFollowing()\n#1 C:\\OpenServer\\domains\\lumen\\app\\Jobs\\InstagramGetAccountFollowingsJob.php(62): InstagramScraper\\Instagram->getFollowing()\n#2 [internal function]: App\\Jobs\\InstagramGetAccountFollowingsJob->handle()\n#3 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\BoundMethod.php(37): call_user_func_array()\n#4 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#5 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#6 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#7 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#8 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\bus\\Dispatcher.php(94): Illuminate\\Container\\Container->call()\n#9 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}()\n#10 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#11 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\bus\\Dispatcher.php(98): Illuminate\\Pipeline\\Pipeline->then()\n#12 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\CallQueuedHandler.php(83): Illuminate\\Bus\\Dispatcher->dispatchNow()\n#13 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}()\n#14 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}()\n#15 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\CallQueuedHandler.php(85): Illuminate\\Pipeline\\Pipeline->then()\n#16 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\CallQueuedHandler.php(59): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware()\n#17 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call()\n#18 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\Worker.php(356): Illuminate\\Queue\\Jobs\\Job->fire()\n#19 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\Worker.php(306): Illuminate\\Queue\\Worker->process()\n#20 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\Worker.php(132): Illuminate\\Queue\\Worker->runJob()\n#21 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\Console\\WorkCommand.php(112): Illuminate\\Queue\\Worker->daemon()\n#22 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\queue\\Console\\WorkCommand.php(96): Illuminate\\Queue\\Console\\WorkCommand->runWorker()\n#23 [internal function]: Illuminate\\Queue\\Console\\WorkCommand->handle()\n#24 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\BoundMethod.php(37): call_user_func_array()\n#25 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\Util.php(37): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#26 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\BoundMethod.php(95): Illuminate\\Container\\Util::unwrapIfClosure()\n#27 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\BoundMethod.php(39): Illuminate\\Container\\BoundMethod::callBoundMethod()\n#28 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\container\\Container.php(596): Illuminate\\Container\\BoundMethod::call()\n#29 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\console\\Command.php(134): Illuminate\\Container\\Container->call()\n#30 C:\\OpenServer\\domains\\lumen\\vendor\\symfony\\console\\Command\\Command.php(258): Illuminate\\Console\\Command->execute()\n#31 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run()\n#32 C:\\OpenServer\\domains\\lumen\\vendor\\symfony\\console\\Application.php(911): Illuminate\\Console\\Command->run()\n#33 C:\\OpenServer\\domains\\lumen\\vendor\\symfony\\console\\Application.php(264): Symfony\\Component\\Console\\Application->doRunCommand()\n#34 C:\\OpenServer\\domains\\lumen\\vendor\\symfony\\console\\Application.php(140): Symfony\\Component\\Console\\Application->doRun()\n#35 C:\\OpenServer\\domains\\lumen\\vendor\\illuminate\\console\\Application.php(93): Symfony\\Component\\Console\\Application->run()\n#36 C:\\OpenServer\\domains\\lumen\\vendor\\laravel\\lumen-framework\\src\\Console\\Kernel.php(116): Illuminate\\Console\\Application->run()\n#37 C:\\OpenServer\\domains\\lumen\\artisan(35): Laravel\\Lumen\\Console\\Kernel->handle()\n#38 {main}', '2020-09-05 13:27:57');

-- --------------------------------------------------------

--
-- Структура таблицы `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2020_08_04_182928_create_users_table', 1),
(2, '2020_08_05_174541_create_jobs_table', 1),
(3, '2020_08_05_174718_create_failed_jobs_table', 1),
(4, '2020_08_05_221820_create_user_accounts_table', 1),
(5, '2020_08_06_192726_create_workers_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'User', 'email@email.com', '$2y$10$ikEgjoliHZeqEYFMeqIvK.ofSQmcq.Hk8nm9ju4Hi1XkY4AR5Ejyy', '2020-08-28 09:02:41', '2020-08-28 09:02:41'),
(2, 'Test1', 'test1@test1.test1', '$2y$10$duQVvpzqEXDR9yR1eoST3uVky68Hw2MYP2exNAKbs9I.MBpjDX9j2', '2020-08-28 14:40:15', '2020-08-28 14:40:15');

-- --------------------------------------------------------

--
-- Структура таблицы `user_accounts`
--

CREATE TABLE `user_accounts` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `user_id`, `type`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 1, 'instagram', 'pawruol', 'qazasdfghy', '2020-08-28 09:03:20', '2020-08-28 09:03:20'),
(4, 1, 'facebook', 'test', '123456', '2020-09-05 13:22:51', '2020-09-05 13:22:51'),
(5, 1, 'instagram', 'developer_ua', 'qazasdfghy', '2020-09-05 13:25:43', '2020-09-05 13:25:43');

-- --------------------------------------------------------

--
-- Структура таблицы `workers`
--

CREATE TABLE `workers` (
  `id` bigint UNSIGNED NOT NULL,
  `user_account_id` bigint UNSIGNED NOT NULL,
  `job` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `progress` int DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `workers`
--

INSERT INTO `workers` (`id`, `user_account_id`, `job`, `progress`, `status`, `result`, `created_at`, `updated_at`) VALUES
(1, 1, 'getAccountFollowers', 100, 'finished', 'uploads/worker_results/worker_result_5f48c89f9f987.json', '2020-08-28 09:03:48', '2020-08-28 09:04:31'),
(2, 1, 'getAccountFollowers', 100, 'finished', 'uploads/worker_results/worker_result_5f5383b38a483.json', '2020-09-05 12:24:07', '2020-09-05 12:25:23'),
(3, 1, 'getAccountFollowers', 100, 'finished', 'uploads/worker_results/worker_result_5f5383e3b5398.json', '2020-09-05 12:25:58', '2020-09-05 12:26:11'),
(6, 5, 'getAccountFollowings', 100, 'finished', 'uploads/worker_results/worker_result_5f5392afcdad0.json', '2020-09-05 13:29:09', '2020-09-05 13:29:19');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Индексы таблицы `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_accounts_username_unique` (`username`),
  ADD KEY `user_accounts_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `workers`
--
ALTER TABLE `workers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workers_user_account_id_foreign` (`user_account_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `user_accounts`
--
ALTER TABLE `user_accounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `workers`
--
ALTER TABLE `workers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `user_accounts`
--
ALTER TABLE `user_accounts`
  ADD CONSTRAINT `user_accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `workers`
--
ALTER TABLE `workers`
  ADD CONSTRAINT `workers_user_account_id_foreign` FOREIGN KEY (`user_account_id`) REFERENCES `user_accounts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
