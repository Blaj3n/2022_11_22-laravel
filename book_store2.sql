-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: db2
-- Létrehozás ideje: 2022. Nov 22. 11:05
-- Kiszolgáló verziója: 8.0.31
-- PHP verzió: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `book_store2`
--
CREATE DATABASE IF NOT EXISTS `book_store2` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci;
USE `book_store2`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `books`
--

DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `book_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `author` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `books`
--

INSERT INTO `books` (`book_id`, `author`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Bohumil Hrabal', 'Gyengéd barbárok', '2022-11-22 11:02:23', '2022-11-22 11:02:23'),
(2, 'J.R.R.Tolkien', 'Hobbit', '2022-11-22 11:02:23', '2022-11-22 11:02:23'),
(3, 'Kaczur Sándor', 'Programozás Java nyelven', '2022-11-22 11:02:23', '2022-11-22 11:02:23');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `copies`
--

DROP TABLE IF EXISTS `copies`;
CREATE TABLE IF NOT EXISTS `copies` (
  `copy_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `book_id` bigint UNSIGNED NOT NULL,
  `hardcovered` tinyint(1) NOT NULL DEFAULT '0',
  `publication` year NOT NULL DEFAULT '2000',
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`copy_id`),
  KEY `copies_book_id_foreign` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `copies`
--

INSERT INTO `copies` (`copy_id`, `book_id`, `hardcovered`, `publication`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 0, 1996, 1, '2022-11-22 11:02:23', '2022-11-22 11:02:23'),
(2, 3, 0, 2000, 1, '2022-11-22 11:02:23', '2022-11-22 11:02:23'),
(3, 3, 0, 2011, 0, '2022-11-22 11:02:23', '2022-11-22 11:02:23'),
(4, 3, 1, 2000, 0, '2022-11-22 11:02:23', '2022-11-22 11:02:23'),
(5, 3, 0, 2000, 2, '2022-11-22 11:02:23', '2022-11-22 11:02:23'),
(6, 1, 0, 2000, 1, '2022-11-22 11:02:23', '2022-11-22 11:02:23');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
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
-- Tábla szerkezet ehhez a táblához `lendings`
--

DROP TABLE IF EXISTS `lendings`;
CREATE TABLE IF NOT EXISTS `lendings` (
  `user_id` bigint UNSIGNED NOT NULL,
  `copy_id` bigint UNSIGNED NOT NULL,
  `start` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`copy_id`,`start`),
  KEY `lendings_copy_id_foreign` (`copy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `lendings`
--

INSERT INTO `lendings` (`user_id`, `copy_id`, `start`, `created_at`, `updated_at`) VALUES
(2, 1, '2022-10-06', '2022-11-22 11:02:24', '2022-11-22 11:02:24'),
(3, 6, '2022-11-06', '2022-11-22 11:02:24', '2022-11-22 11:02:24');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_13_110613_create_books_table', 1),
(6, '2022_09_13_110712_create_copies_table', 1),
(7, '2022_10_23_121551_create_lendings_table', 1),
(8, '2022_11_22_094215_create_reservations_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
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
-- Tábla szerkezet ehhez a táblához `reservations`
--

DROP TABLE IF EXISTS `reservations`;
CREATE TABLE IF NOT EXISTS `reservations` (
  `book_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `start` date NOT NULL,
  `message` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`,`user_id`,`start`),
  KEY `reservations_user_id_foreign` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `reservations`
--

INSERT INTO `reservations` (`book_id`, `user_id`, `start`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-11-22', 0, '2022-11-22 11:02:24', '2022-11-22 11:02:24'),
(2, 2, '2021-11-22', 1, '2022-11-22 11:02:24', '2022-11-22 11:02:24'),
(3, 3, '2020-11-22', 1, '2022-11-22 11:02:24', '2022-11-22 11:02:24');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission` tinyint(1) NOT NULL DEFAULT '1',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `permission`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'store', 'store@gmail.com', '$2y$10$4hJskzo4z8mS73cbFlqYmOSed9UDBmJwUCHg7JMroYbzV5uySM1Pi', 0, NULL, NULL, '2022-11-22 11:02:23', '2022-11-22 11:02:23'),
(2, 'Marcsi', 'student1@gmail.com', '$2y$10$tu3WZaficowG/UBefxgSLe.g2A8WNm/jjgMn.bkwqvG3mq92MUS5u', 1, NULL, NULL, '2022-11-22 11:02:23', '2022-11-22 11:02:23'),
(3, 'Iván', 'student2@gmail.com', '$2y$10$YCgh9mjw30tF0YGxh4c4a.ddPLmJySkxNLsxpfp8hKHku9mYFoFtm', 1, NULL, NULL, '2022-11-22 11:02:23', '2022-11-22 11:02:23');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `copies`
--
ALTER TABLE `copies`
  ADD CONSTRAINT `copies_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`);

--
-- Megkötések a táblához `lendings`
--
ALTER TABLE `lendings`
  ADD CONSTRAINT `lendings_copy_id_foreign` FOREIGN KEY (`copy_id`) REFERENCES `copies` (`copy_id`),
  ADD CONSTRAINT `lendings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  ADD CONSTRAINT `reservations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
