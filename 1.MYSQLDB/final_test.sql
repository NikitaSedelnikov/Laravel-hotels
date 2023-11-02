-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Окт 24 2023 г., 10:57
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `final_test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `started_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `finished_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `days` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(23, 4, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 4),
(24, 4, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 5),
(25, 4, 'poster_url', 'text', 'Poster Url', 0, 1, 1, 1, 1, 1, '{}', 6),
(26, 4, 'floor_area', 'text', 'Floor Area', 1, 1, 1, 1, 1, 1, '{}', 7),
(27, 4, 'type', 'text', 'Type', 1, 1, 1, 1, 1, 1, '{}', 8),
(28, 4, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 9),
(29, 4, 'hotel_id', 'text', 'Hotel Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(30, 4, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 10),
(31, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(32, 5, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(33, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(34, 5, 'description', 'text', 'Description', 0, 1, 1, 1, 1, 1, '{}', 3),
(35, 5, 'poster_url', 'text', 'Poster Url', 0, 1, 1, 1, 1, 1, '{}', 4),
(36, 5, 'address', 'text', 'Address', 1, 1, 1, 1, 1, 1, '{}', 5),
(37, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(38, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(39, 6, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(40, 6, 'room_id', 'text', 'Room Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(41, 6, 'user_id', 'text', 'User Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(42, 6, 'started_at', 'timestamp', 'Started At', 1, 1, 1, 1, 1, 1, '{}', 6),
(43, 6, 'finished_at', 'timestamp', 'Finished At', 1, 1, 1, 1, 1, 1, '{}', 7),
(44, 6, 'days', 'text', 'Days', 1, 1, 1, 1, 1, 1, '{}', 8),
(45, 6, 'price', 'text', 'Price', 1, 1, 1, 1, 1, 1, '{}', 9),
(46, 6, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 10),
(47, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 11),
(48, 7, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(49, 7, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, '{}', 2),
(50, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 3),
(51, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(52, 8, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(53, 8, 'facility_id', 'text', 'Facility Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(54, 8, 'hotel_id', 'text', 'Hotel Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(55, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(56, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(57, 9, 'id', 'text', 'Id', 1, 1, 1, 0, 0, 0, '{}', 1),
(58, 9, 'facility_id', 'text', 'Facility Id', 1, 1, 1, 1, 1, 1, '{}', 2),
(59, 9, 'room_id', 'text', 'Room Id', 1, 1, 1, 1, 1, 1, '{}', 4),
(60, 9, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 6),
(61, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 7),
(62, 6, 'booking_belongsto_room_relationship', 'relationship', 'rooms', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Room\",\"table\":\"rooms\",\"type\":\"belongsTo\",\"column\":\"room_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(63, 6, 'booking_belongsto_user_relationship', 'relationship', 'users', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(64, 8, 'facility_hotel_belongsto_facility_relationship', 'relationship', 'facilities', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Facility\",\"table\":\"facilities\",\"type\":\"belongsTo\",\"column\":\"facility_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(65, 8, 'facility_hotel_belongsto_hotel_relationship', 'relationship', 'hotels', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Hotel\",\"table\":\"hotels\",\"type\":\"belongsTo\",\"column\":\"hotel_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(67, 9, 'facility_room_belongsto_facility_relationship', 'relationship', 'facilities', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Facility\",\"table\":\"facilities\",\"type\":\"belongsTo\",\"column\":\"facility_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3),
(68, 9, 'facility_room_belongsto_room_relationship', 'relationship', 'rooms', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Room\",\"table\":\"rooms\",\"type\":\"belongsTo\",\"column\":\"room_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 5),
(69, 4, 'room_belongsto_hotel_relationship', 'relationship', 'hotels', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Hotel\",\"table\":\"hotels\",\"type\":\"belongsTo\",\"column\":\"hotel_id\",\"key\":\"id\",\"label\":\"title\",\"pivot_table\":\"bookings\",\"pivot\":\"0\",\"taggable\":\"0\"}', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(4, 'rooms', 'rooms', 'Room', 'Rooms', 'voyager-images', 'App\\Models\\Room', NULL, NULL, NULL, 1, 0, '{\"order_column\":\"id\",\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-10-22 18:45:43', '2023-10-24 04:43:02'),
(5, 'hotels', 'hotels', 'Hotel', 'Hotels', 'voyager-company', 'App\\Models\\Hotel', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-10-22 19:02:15', '2023-10-24 04:20:23'),
(6, 'bookings', 'bookings', 'Booking', 'Bookings', 'voyager-calendar', 'App\\Models\\Booking', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-10-23 06:06:38', '2023-10-24 04:40:18'),
(7, 'facilities', 'facilities', 'Facility', 'Facilities', 'voyager-pizza', 'App\\Models\\Facility', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-10-23 06:07:03', '2023-10-24 04:19:50'),
(8, 'facility_hotels', 'facility-hotels', 'Facility Hotel', 'Facility Hotels', NULL, 'App\\Models\\FacilityHotel', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-10-23 06:08:01', '2023-10-24 04:39:56'),
(9, 'facility_rooms', 'facility-rooms', 'Facility Room', 'Facility Rooms', NULL, 'App\\Models\\FacilityRoom', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-10-23 06:08:29', '2023-10-24 04:39:34');

-- --------------------------------------------------------

--
-- Структура таблицы `facilities`
--

CREATE TABLE `facilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `facilities`
--

INSERT INTO `facilities` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Уникальная сложность', NULL, NULL),
(2, 'Минимум душ', NULL, NULL),
(3, 'Максимум страданий', NULL, NULL),
(4, 'Можно повеселиться', NULL, NULL),
(5, 'Бесплатный завтрак, мини бар', NULL, NULL),
(6, 'Сауна, парная', NULL, NULL),
(7, 'Телевидение, бесплатный доступ в интернет', NULL, NULL),
(8, 'Стиральная машина, сушилка', NULL, NULL),
(9, 'Кухонные принадлежности', NULL, NULL),
(10, 'Бесплатные \"алмазы\"', NULL, NULL),
(11, 'Компьютерный клуб', NULL, NULL),
(12, 'Парковка', NULL, NULL),
(13, 'Личный помощник', NULL, NULL),
(14, 'Бесплатные личные вещи', NULL, NULL),
(15, 'Отсутствие удобств', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `facility_hotels`
--

CREATE TABLE `facility_hotels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `facility_id` bigint(20) UNSIGNED NOT NULL,
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `facility_hotels`
--

INSERT INTO `facility_hotels` (`id`, `facility_id`, `hotel_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-10-24 10:18:54', NULL),
(2, 3, 1, '2023-10-24 10:18:54', NULL),
(3, 2, 1, '2023-10-24 10:18:54', NULL),
(4, 9, 2, '2023-10-24 10:18:54', NULL),
(5, 5, 2, '2023-10-24 10:18:54', NULL),
(6, 6, 2, '2023-10-24 10:18:54', NULL),
(7, 14, 2, '2023-10-24 10:18:54', NULL),
(8, 10, 3, '2023-10-24 10:18:54', NULL),
(9, 7, 3, '2023-10-24 10:18:54', NULL),
(10, 11, 3, '2023-10-24 10:18:54', NULL),
(11, 9, 3, '2023-10-24 10:18:54', NULL),
(12, 15, 1, '2023-10-24 10:18:54', NULL),
(13, 11, 1, '2023-10-24 10:18:54', NULL),
(14, 4, 1, '2023-10-24 10:18:54', NULL),
(15, 4, 3, '2023-10-24 10:18:54', NULL),
(16, 12, 3, '2023-10-24 10:18:54', NULL),
(17, 15, 5, '2023-10-24 10:18:54', NULL),
(18, 3, 5, '2023-10-24 10:18:54', NULL),
(19, 4, 5, '2023-10-24 10:18:54', NULL),
(20, 6, 4, '2023-10-24 10:18:54', NULL),
(21, 13, 4, '2023-10-24 10:18:54', NULL),
(22, 5, 4, '2023-10-24 10:18:54', NULL),
(23, 7, 4, '2023-10-24 10:18:54', NULL),
(24, 8, 4, '2023-10-17 10:18:54', NULL),
(25, 9, 4, '2023-10-24 10:18:54', NULL),
(26, 11, 4, '2023-10-24 10:18:54', NULL),
(27, 12, 4, '2023-10-24 10:18:54', NULL),
(28, 14, 4, '2023-10-24 10:18:54', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `facility_rooms`
--

CREATE TABLE `facility_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `facility_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `facility_rooms`
--

INSERT INTO `facility_rooms` (`id`, `facility_id`, `room_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-10-24 10:28:52', NULL),
(2, 7, 1, '2023-10-24 10:28:52', NULL),
(3, 11, 1, '2023-10-24 10:28:52', NULL),
(4, 3, 2, '2023-10-24 10:28:52', NULL),
(5, 11, 2, '2023-10-24 10:28:52', NULL),
(6, 14, 2, '2023-10-24 10:28:52', NULL),
(7, 15, 3, '2023-10-24 10:28:52', NULL),
(8, 2, 3, '2023-10-24 10:28:52', NULL),
(9, 4, 3, '2023-10-24 10:28:52', NULL),
(10, 4, 4, '2023-10-24 10:28:52', NULL),
(11, 14, 4, '2023-10-24 10:28:52', NULL),
(12, 7, 4, '2023-10-24 10:28:52', NULL),
(13, 5, 5, '2023-10-24 10:28:52', NULL),
(14, 7, 5, '2023-10-24 10:28:52', NULL),
(15, 8, 5, '2023-10-24 10:28:52', NULL),
(16, 7, 6, '2023-10-24 10:28:52', NULL),
(17, 11, 6, '2023-10-24 10:28:52', NULL),
(18, 12, 6, '2023-10-24 10:28:52', NULL),
(19, 14, 7, '2023-10-24 10:28:52', NULL),
(20, 9, 7, '2023-10-24 10:28:52', NULL),
(21, 11, 7, '2023-10-24 10:28:52', NULL),
(22, 4, 8, '2023-10-24 10:28:52', NULL),
(23, 5, 8, '2023-10-24 10:28:52', NULL),
(24, 7, 8, '2023-10-24 10:28:52', NULL),
(25, 7, 9, '2023-10-24 10:28:52', NULL),
(26, 10, 9, '2023-10-24 10:28:52', NULL),
(27, 9, 9, '2023-10-24 10:28:52', NULL),
(28, 10, 10, '2023-10-24 10:28:52', NULL),
(29, 14, 10, '2023-10-24 10:28:52', NULL),
(30, 11, 10, '2023-10-24 10:28:52', NULL),
(31, 11, 11, '2023-10-24 10:28:52', NULL),
(32, 10, 11, '2023-10-24 10:28:52', NULL),
(33, 5, 11, '2023-10-24 10:28:52', NULL),
(34, 8, 12, NULL, NULL),
(35, 13, 12, NULL, NULL),
(36, 6, 12, NULL, NULL),
(37, 5, 13, NULL, NULL),
(38, 13, 13, NULL, NULL),
(39, 7, 13, NULL, NULL),
(40, 12, 14, NULL, NULL),
(41, 13, 14, NULL, NULL),
(42, 11, 14, NULL, NULL),
(43, 15, 15, NULL, NULL),
(44, 3, 15, NULL, NULL),
(45, 15, 16, NULL, NULL),
(46, 1, 16, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `failed_jobs`
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

-- --------------------------------------------------------

--
-- Структура таблицы `hotels`
--

CREATE TABLE `hotels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `poster_url` varchar(100) DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `hotels`
--

INSERT INTO `hotels` (`id`, `title`, `description`, `poster_url`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Темные души', 'Отель для самых смелых', '1.jpg', 'г. Лотрик, Анор-Лондо', '2023-10-24 05:20:21', '2023-10-24 05:20:21'),
(2, 'Luxury', 'Отель для тех, кто богат с начала списка Forbes', '2.jpg', 'г. Москва, ул. Победы, д.15', '2023-10-24 05:22:07', '2023-10-24 05:22:07'),
(3, 'MyCraft', 'Для ценителей кубизма', '3.jpg', 'г. Майнск, ул. МайнкрафтЭто-мояЖизнь, д.14', '2023-10-24 05:24:34', '2023-10-24 05:24:34'),
(4, 'Godest', 'Отель для тех, кто ставит себя выше списка Forbes', '4.jpg', 'г. Москва, Москва-Сити', '2023-10-24 05:25:59', '2023-10-24 05:25:59'),
(5, 'HoboHouse', 'Отель для тех, кто считает себя богатым с конца', '5.jpg', 'г. Киров, ул. р.Люксембург, д.10', '2023-10-24 05:27:32', '2023-10-24 05:27:32');

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2023-10-19 06:15:08', '2023-10-19 06:15:08');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2023-10-19 06:15:08', '2023-10-23 06:10:13', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 3, '2023-10-19 06:15:08', '2023-10-24 04:44:56', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 4, '2023-10-19 06:15:08', '2023-10-24 04:44:56', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 5, 2, '2023-10-19 06:15:08', '2023-10-23 06:10:17', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 2, '2023-10-19 06:15:08', '2023-10-24 04:44:52', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 3, '2023-10-19 06:15:08', '2023-10-23 06:10:17', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 4, '2023-10-19 06:15:08', '2023-10-23 06:10:17', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 5, '2023-10-19 06:15:08', '2023-10-23 06:10:17', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 6, '2023-10-19 06:15:08', '2023-10-23 06:10:17', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 5, 1, '2023-10-19 06:15:08', '2023-10-23 06:10:17', 'voyager.settings.index', NULL),
(13, 1, 'Rooms', '', '_self', NULL, NULL, NULL, 6, '2023-10-22 18:45:43', '2023-10-24 04:44:33', 'voyager.rooms.index', NULL),
(14, 1, 'Hotels', '', '_self', NULL, NULL, NULL, 5, '2023-10-22 19:02:15', '2023-10-24 04:44:33', 'voyager.hotels.index', NULL),
(15, 1, 'Bookings', '', '_self', NULL, NULL, NULL, 7, '2023-10-23 06:06:38', '2023-10-23 06:10:17', 'voyager.bookings.index', NULL),
(16, 1, 'Facilities', '', '_self', NULL, NULL, NULL, 8, '2023-10-23 06:07:03', '2023-10-23 06:10:17', 'voyager.facilities.index', NULL),
(17, 1, 'Facility Hotels', '', '_self', NULL, NULL, NULL, 9, '2023-10-23 06:08:01', '2023-10-23 06:10:17', 'voyager.facility-hotels.index', NULL),
(18, 1, 'Facility Rooms', '', '_self', NULL, NULL, NULL, 10, '2023-10-23 06:08:29', '2023-10-23 06:10:17', 'voyager.facility-rooms.index', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_10_04_211057_create_hotels_table', 1),
(6, '2023_10_04_211118_create_rooms_table', 2),
(7, '2023_10_04_211207_create_users_table', 2),
(8, '2023_10_04_211236_create_bookings_table', 3),
(9, '2023_10_04_211309_create_facilities_table', 3),
(10, '2023_10_04_211329_create_fasility_hotels_table', 3),
(11, '2023_10_04_211343_create_facility_rooms_table', 3),
(12, '2016_01_01_000000_add_voyager_user_fields', 4),
(13, '2016_01_01_000000_create_data_types_table', 4),
(14, '2016_05_19_173453_create_menu_table', 4),
(15, '2016_10_21_190000_create_roles_table', 4),
(16, '2016_10_21_190000_create_settings_table', 4),
(17, '2016_11_30_135954_create_permission_table', 4),
(18, '2016_11_30_141208_create_permission_role_table', 4),
(19, '2016_12_26_201236_data_types__add__server_side', 4),
(20, '2017_01_13_000000_add_route_to_menu_items_table', 4),
(21, '2017_01_14_005015_create_translations_table', 4),
(22, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 4),
(23, '2017_03_06_000000_add_controller_to_data_types_table', 4),
(24, '2017_04_21_000000_add_order_to_data_rows_table', 4),
(25, '2017_07_05_210000_add_policyname_to_data_types_table', 4),
(26, '2017_08_05_000000_add_group_to_settings_table', 4),
(27, '2017_11_26_013050_add_user_role_relationship', 4),
(28, '2017_11_26_015000_create_user_roles_table', 4),
(29, '2018_03_11_000000_add_user_settings', 4),
(30, '2018_03_14_000000_add_details_to_data_types_table', 4),
(31, '2018_03_16_000000_make_settings_value_nullable', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(2, 'browse_bread', NULL, '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(3, 'browse_database', NULL, '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(4, 'browse_media', NULL, '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(5, 'browse_compass', NULL, '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(6, 'browse_menus', 'menus', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(7, 'read_menus', 'menus', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(8, 'edit_menus', 'menus', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(9, 'add_menus', 'menus', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(10, 'delete_menus', 'menus', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(11, 'browse_roles', 'roles', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(12, 'read_roles', 'roles', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(13, 'edit_roles', 'roles', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(14, 'add_roles', 'roles', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(15, 'delete_roles', 'roles', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(16, 'browse_users', 'users', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(17, 'read_users', 'users', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(18, 'edit_users', 'users', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(19, 'add_users', 'users', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(20, 'delete_users', 'users', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(21, 'browse_settings', 'settings', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(22, 'read_settings', 'settings', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(23, 'edit_settings', 'settings', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(24, 'add_settings', 'settings', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(25, 'delete_settings', 'settings', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(26, 'browse_rooms', 'rooms', '2023-10-22 18:45:43', '2023-10-22 18:45:43'),
(27, 'read_rooms', 'rooms', '2023-10-22 18:45:43', '2023-10-22 18:45:43'),
(28, 'edit_rooms', 'rooms', '2023-10-22 18:45:43', '2023-10-22 18:45:43'),
(29, 'add_rooms', 'rooms', '2023-10-22 18:45:43', '2023-10-22 18:45:43'),
(30, 'delete_rooms', 'rooms', '2023-10-22 18:45:43', '2023-10-22 18:45:43'),
(31, 'browse_hotels', 'hotels', '2023-10-22 19:02:15', '2023-10-22 19:02:15'),
(32, 'read_hotels', 'hotels', '2023-10-22 19:02:15', '2023-10-22 19:02:15'),
(33, 'edit_hotels', 'hotels', '2023-10-22 19:02:15', '2023-10-22 19:02:15'),
(34, 'add_hotels', 'hotels', '2023-10-22 19:02:15', '2023-10-22 19:02:15'),
(35, 'delete_hotels', 'hotels', '2023-10-22 19:02:15', '2023-10-22 19:02:15'),
(36, 'browse_bookings', 'bookings', '2023-10-23 06:06:38', '2023-10-23 06:06:38'),
(37, 'read_bookings', 'bookings', '2023-10-23 06:06:38', '2023-10-23 06:06:38'),
(38, 'edit_bookings', 'bookings', '2023-10-23 06:06:38', '2023-10-23 06:06:38'),
(39, 'add_bookings', 'bookings', '2023-10-23 06:06:38', '2023-10-23 06:06:38'),
(40, 'delete_bookings', 'bookings', '2023-10-23 06:06:38', '2023-10-23 06:06:38'),
(41, 'browse_facilities', 'facilities', '2023-10-23 06:07:03', '2023-10-23 06:07:03'),
(42, 'read_facilities', 'facilities', '2023-10-23 06:07:03', '2023-10-23 06:07:03'),
(43, 'edit_facilities', 'facilities', '2023-10-23 06:07:03', '2023-10-23 06:07:03'),
(44, 'add_facilities', 'facilities', '2023-10-23 06:07:03', '2023-10-23 06:07:03'),
(45, 'delete_facilities', 'facilities', '2023-10-23 06:07:03', '2023-10-23 06:07:03'),
(46, 'browse_facility_hotels', 'facility_hotels', '2023-10-23 06:08:01', '2023-10-23 06:08:01'),
(47, 'read_facility_hotels', 'facility_hotels', '2023-10-23 06:08:01', '2023-10-23 06:08:01'),
(48, 'edit_facility_hotels', 'facility_hotels', '2023-10-23 06:08:01', '2023-10-23 06:08:01'),
(49, 'add_facility_hotels', 'facility_hotels', '2023-10-23 06:08:01', '2023-10-23 06:08:01'),
(50, 'delete_facility_hotels', 'facility_hotels', '2023-10-23 06:08:01', '2023-10-23 06:08:01'),
(51, 'browse_facility_rooms', 'facility_rooms', '2023-10-23 06:08:29', '2023-10-23 06:08:29'),
(52, 'read_facility_rooms', 'facility_rooms', '2023-10-23 06:08:29', '2023-10-23 06:08:29'),
(53, 'edit_facility_rooms', 'facility_rooms', '2023-10-23 06:08:29', '2023-10-23 06:08:29'),
(54, 'add_facility_rooms', 'facility_rooms', '2023-10-23 06:08:29', '2023-10-23 06:08:29'),
(55, 'delete_facility_rooms', 'facility_rooms', '2023-10-23 06:08:29', '2023-10-23 06:08:29');

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `personal_access_tokens`
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

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(2, 'user', 'Normal User', '2023-10-19 06:15:08', '2023-10-19 06:15:08'),
(3, 'manager', 'manager', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `poster_url` varchar(100) DEFAULT NULL,
  `floor_area` decimal(8,2) NOT NULL,
  `type` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `hotel_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `rooms`
--

INSERT INTO `rooms` (`id`, `title`, `description`, `poster_url`, `floor_area`, `type`, `price`, `hotel_id`, `created_at`, `updated_at`) VALUES
(1, 'Покои Понтифика', 'Комната повышенного уровня сложности. Без магии, призывов и только со сломанным мечом', '1-1.jpg', '114.00', 'Strong', 2000, 1, '2023-10-24 05:29:21', '2023-10-24 05:29:21'),
(2, 'Арена Безымянного короля', 'Этот номер подойдет для тех, кто живет лишь в бою. Берегите нервы', '1-2.jpg', '135.00', 'Strongest', 2500, 1, '2023-10-24 05:31:14', '2023-10-24 05:31:14'),
(3, 'Помойка', 'Название номера оправдывает лишь внешний вид, но за мусор будут считать лишь Вас', '1-3.jpg', '250.00', 'Strongest', 3500, 1, '2023-10-24 05:32:47', '2023-10-24 05:32:47'),
(4, 'Воспоминания Последнего гиганта', 'Тьма сгущается, гиганты атакуют', '1-4.jpg', '75.00', 'Strong', 1000, 1, '2023-10-24 05:34:18', '2023-10-24 05:34:18'),
(5, 'Среднее богатство', 'Название оправдывает размер вашего кошелька. Расслабьтесь', '2-1.jpg', '50.00', 'luxury', 5000, 2, '2023-10-24 05:35:59', '2023-10-24 05:35:59'),
(6, 'Большое богатство', 'Вы можете себе позволить не самый дешевый вариант квартиры в центре Москвы? Этот вариант для Вас!', '2-2.jpg', '90.00', 'luxury', 7000, 2, '2023-10-24 05:37:34', '2023-10-24 05:37:34'),
(7, 'Огромные богатства', 'Номер подойдет для тех, кто знаком с каждым брокером на WallStreet', '2-3.jpg', '125.00', 'luxury', 10000, 2, '2023-10-24 05:39:01', '2023-10-24 05:39:01'),
(8, 'Сказочные богатства', 'Вы сказочно богаты. Вы не можете жить и дня без траты очередного миллиона фунтов', '2-4.jpg', '200.00', 'luxury', 25000, 2, '2023-10-24 05:40:37', '2023-10-24 05:40:37'),
(9, 'MICraft 1.5.2', 'Номер подходит для тех, кто выбирает, в первую очередь, ностальгические решения', '3-1.jpg', '60.00', 'Cube', 1500, 3, '2023-10-24 05:42:56', '2023-10-24 05:42:56'),
(10, 'MyModRoom', 'Любители сторонних модификаций будут чувствовать себя как дома', '3-2.jpg', '120.00', 'Cube', 2500, 3, '2023-10-24 05:46:11', '2023-10-24 05:46:11'),
(11, 'ShaderCube', 'Если вы любитель кубизма, но еще и обладатель высоких графических требований - данный вариант создан для Вас', '3-3.jpg', '160.00', 'Cube', 3000, 3, '2023-10-24 05:47:54', '2023-10-24 05:47:54'),
(12, 'Маленький Бог', 'Вы более чем сказочно богаты, этот номер вам подойдет', '4-1.jpg', '200.00', 'Godest', 30000, 4, '2023-10-24 05:54:12', '2023-10-24 05:54:12'),
(13, 'Средний Бог', 'Ваши богатства позволяют Вам чувствовать себя божеством', '4-2.jpg', '300.00', 'Godest', 40000, 4, '2023-10-24 07:05:42', '2023-10-24 07:05:42'),
(14, 'Большой Бог', 'Вы либо самый богатый человек на Земле, либо самый глупый, чтобы тратить деньги на этот номер', '4-3.jpg', '350.00', 'Godest', 55000, 4, '2023-10-24 07:08:36', '2023-10-24 07:08:36'),
(15, 'Hobo Room 1', 'Вы бедны, но не настолько, чтобы жить на улице', '5-1.jpg', '30.00', 'Hobo', 250, 5, '2023-10-24 07:10:24', '2023-10-24 07:10:24'),
(16, 'Hobo Room 2', 'А здесь уже можно даже жить', '5-2.jpg', '35.00', 'Hobo', 450, 5, '2023-10-24 07:11:14', '2023-10-24 07:11:14');

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Структура таблицы `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@mail.com', 'users/default.png', NULL, '$2y$10$pZYbenrSL8EqlgPGcE.nyOEBbKq4WrObf5HjYQQSSz3mgr0rxsTbi', 'J8YWbOAQfxbwM6VBDck1JyQCBkNiByeGP8ZggDlDlpPvtCZ7fxBMjBqReWoV', NULL, '2023-10-24 04:53:59', '2023-10-24 04:53:59'),
(2, 2, 'Test', 'skillbox.task@gmail.com', 'users/default.png', NULL, '$2y$10$kwPFwQczMb8QGC6OXhTo1uDv0ViFul0eAZ4zmGOhKyfCFTk5EoPri', NULL, NULL, '2023-10-24 07:52:38', '2023-10-24 07:52:38');

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_room_id_foreign` (`room_id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Индексы таблицы `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Индексы таблицы `facilities`
--
ALTER TABLE `facilities`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `facility_hotels`
--
ALTER TABLE `facility_hotels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facility_hotels_facility_id_foreign` (`facility_id`),
  ADD KEY `facility_hotels_hotel_id_foreign` (`hotel_id`);

--
-- Индексы таблицы `facility_rooms`
--
ALTER TABLE `facility_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facility_rooms_facility_id_foreign` (`facility_id`),
  ADD KEY `facility_rooms_room_id_foreign` (`room_id`);

--
-- Индексы таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Индексы таблицы `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Индексы таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Индексы таблицы `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_hotel_id_foreign` (`hotel_id`);

--
-- Индексы таблицы `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Индексы таблицы `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT для таблицы `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `facilities`
--
ALTER TABLE `facilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `facility_hotels`
--
ALTER TABLE `facility_hotels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `facility_rooms`
--
ALTER TABLE `facility_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT для таблицы `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT для таблицы `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `facility_hotels`
--
ALTER TABLE `facility_hotels`
  ADD CONSTRAINT `facility_hotels_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facility_hotels_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `facility_rooms`
--
ALTER TABLE `facility_rooms`
  ADD CONSTRAINT `facility_rooms_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `facility_rooms_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_hotel_id_foreign` FOREIGN KEY (`hotel_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
