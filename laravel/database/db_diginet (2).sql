-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-12-2021 a las 17:09:51
-- Versión del servidor: 10.4.20-MariaDB
-- Versión de PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_diginet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) NOT NULL,
  `person_id` bigint(20) NOT NULL,
  `total_account` bigint(20) DEFAULT NULL,
  `rest_account` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `accounts`
--

INSERT INTO `accounts` (`id`, `sale_id`, `person_id`, `total_account`, `rest_account`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 100, 100, '2021-10-11 21:55:48', '2021-10-11 21:55:48'),
(2, 2, 2, 99, 99, '2021-11-29 15:24:07', '2021-11-29 15:24:07'),
(3, 3, 2, 207, 207, '2021-11-29 15:24:54', '2021-11-29 15:24:54'),
(4, 4, 1, 99, 99, '2021-11-29 15:25:36', '2021-11-29 15:25:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audits`
--

CREATE TABLE `audits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_values` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'App\\User', 1, 'updated', 'App\\User', 1, '[]', '[]', 'http://localhost/store/logout', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', NULL, '2021-09-07 16:02:43', '2021-09-07 16:02:43'),
(2, 'App\\User', 1, 'updated', 'App\\User', 1, '[]', '[]', 'http://localhost/store/logout', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', NULL, '2021-09-07 17:31:49', '2021-09-07 17:31:49'),
(3, 'App\\User', 1, 'updated', 'App\\User', 1, '[]', '[]', 'http://localhost/store/logout', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', NULL, '2021-09-07 17:58:46', '2021-09-07 17:58:46'),
(4, 'App\\User', 1, 'updated', 'App\\User', 1, '[]', '[]', 'http://localhost/store/logout', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', NULL, '2021-09-07 18:01:06', '2021-09-07 18:01:06'),
(5, 'App\\User', 1, 'updated', 'App\\User', 1, '[]', '[]', 'http://localhost/store/logout', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', NULL, '2021-09-07 18:01:35', '2021-09-07 18:01:35'),
(6, 'App\\User', 1, 'updated', 'App\\User', 1, '[]', '[]', 'http://localhost/store/logout', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', NULL, '2021-09-07 18:01:40', '2021-09-07 18:01:40'),
(7, 'App\\User', 1, 'updated', 'App\\User', 1, '[]', '[]', 'http://localhost/store/logout', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', NULL, '2021-09-07 19:11:05', '2021-09-07 19:11:05'),
(8, 'App\\User', 1, 'updated', 'App\\User', 1, '[]', '[]', 'http://localhost/store/logout', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', NULL, '2021-09-07 19:11:18', '2021-09-07 19:11:18'),
(9, 'App\\User', 1, 'updated', 'App\\User', 1, '[]', '[]', 'http://localhost/store/logout', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', NULL, '2021-09-07 19:13:47', '2021-09-07 19:13:47'),
(10, 'App\\User', 1, 'created', 'App\\User', 3, '[]', '{\"name\":\"ddd\",\"email\":\"fff@ff\",\"id\":3}', 'http://localhost/store-diginet/usuarios', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', NULL, '2021-10-01 14:33:03', '2021-10-01 14:33:03'),
(11, 'App\\User', 1, 'deleted', 'App\\User', 3, '{\"id\":3,\"name\":\"ddd\",\"email\":\"fff@ff\",\"email_verified_at\":null,\"store_id\":1}', '[]', 'http://localhost/store-diginet/usuarios/3', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', NULL, '2021-10-01 14:33:20', '2021-10-01 14:33:20'),
(12, 'App\\User', 1, 'created', 'App\\Product', 1, '[]', '{\"name\":\"dh-ipc-hfw2431tp-zas-27135-s2\",\"provider_id\":0,\"bar_code\":\"1351321351231351\",\"stock\":\"1\",\"unit_price\":\"100\",\"organization_id\":1,\"store_id\":1,\"id\":1}', 'http://localhost/store-diginet/productos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', NULL, '2021-10-01 14:38:20', '2021-10-01 14:38:20'),
(13, 'App\\User', 1, 'created', 'App\\Product', 2, '[]', '{\"name\":\"dh-ipc-hfw2431tp-zas-27135-s22\",\"provider_id\":0,\"bar_code\":\"1351321351231351\",\"unit_price\":100,\"unit_price2\":0,\"unit_price3\":0,\"organization_id\":1,\"store_id\":1,\"stock\":1,\"id\":2}', 'http://localhost/store-diginet/productos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', NULL, '2021-10-01 14:38:35', '2021-10-01 14:38:35'),
(14, 'App\\User', 1, 'updated', 'App\\Product', 2, '{\"name\":\"dh-ipc-hfw2431tp-zas-27135-s22\"}', '{\"name\":\"d1\"}', 'http://localhost/store-diginet/productos/2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', NULL, '2021-10-04 14:49:57', '2021-10-04 14:49:57'),
(15, 'App\\User', 1, 'updated', 'App\\Product', 1, '{\"name\":\"dh-ipc-hfw2431tp-zas-27135-s2\"}', '{\"name\":\"d2\"}', 'http://localhost/store-diginet/productos/1', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', NULL, '2021-10-04 14:50:03', '2021-10-04 14:50:03'),
(16, 'App\\User', 1, 'updated', 'App\\Product', 2, '{\"bar_code\":\"1351321351231351\"}', '{\"bar_code\":\"135132135123135111\"}', 'http://localhost/store-diginet/productos/2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', NULL, '2021-10-04 14:50:15', '2021-10-04 14:50:15'),
(17, 'App\\User', 1, 'updated', 'App\\Product', 2, '{\"bar_code\":\"135132135123135111\"}', '{\"bar_code\":\"135132135123135111222\"}', 'http://localhost/store-diginet/productos/2', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', NULL, '2021-10-04 14:50:22', '2021-10-04 14:50:22'),
(18, 'App\\User', 1, 'created', 'App\\Product', 3, '[]', '{\"bar_code\":\"135132135123135111222d\",\"provider_id\":0,\"name\":\"d1\",\"unit_price\":100,\"unit_price2\":0,\"unit_price3\":0,\"organization_id\":1,\"store_id\":1,\"stock\":1,\"id\":3}', 'http://localhost/store-diginet/productos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', NULL, '2021-10-04 14:58:16', '2021-10-04 14:58:16'),
(19, 'App\\User', 1, 'created', 'App\\Product', 4, '[]', '{\"bar_code\":\"sdasdasdasd\",\"provider_id\":0,\"name\":\"d1\",\"unit_price\":100,\"unit_price2\":0,\"unit_price3\":0,\"organization_id\":1,\"store_id\":1,\"stock\":1,\"id\":4}', 'http://localhost/store-diginet/productos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', NULL, '2021-10-05 13:58:57', '2021-10-05 13:58:57'),
(20, 'App\\User', 1, 'created', 'App\\Product', 5, '[]', '{\"bar_code\":\"asdasdasd\",\"provider_id\":0,\"name\":\"d1\",\"unit_price\":100,\"unit_price2\":0,\"unit_price3\":0,\"organization_id\":1,\"store_id\":1,\"stock\":1,\"id\":5}', 'http://localhost/store-diginet/productos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', NULL, '2021-10-05 13:59:07', '2021-10-05 13:59:07'),
(21, 'App\\User', 1, 'created', 'App\\Person', 1, '[]', '{\"identification\":34695832,\"name\":\"daniel monte\",\"organization_id\":1,\"identification_type\":1,\"email\":null,\"phone\":null,\"address\":\"sdsd\",\"category\":1,\"id\":1}', 'http://localhost/store-diginet/venta', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', NULL, '2021-10-11 21:55:48', '2021-10-11 21:55:48'),
(22, 'App\\User', 1, 'updated', 'App\\Product', 1, '{\"stock\":1}', '{\"stock\":0}', 'http://localhost/store-diginet/venta', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', NULL, '2021-10-11 21:55:48', '2021-10-11 21:55:48'),
(23, 'App\\User', 1, 'created', 'App\\Product', 6, '[]', '{\"bar_code\":1505,\"provider_id\":100,\"organization_id\":1,\"store_id\":1,\"name\":\"dddd\",\"unit_price\":100,\"stock\":0,\"id\":6}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', NULL, '2021-10-26 20:57:57', '2021-10-26 20:57:57'),
(24, 'App\\User', 1, 'created', 'App\\Product', 7, '[]', '{\"bar_code\":\"86-BOX\",\"provider_id\":1,\"organization_id\":1,\"store_id\":1,\"name\":\"Caja plastica de embutir\",\"unit_price\":\"1\",\"stock\":0,\"id\":7}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', NULL, '2021-11-01 20:44:48', '2021-11-01 20:44:48'),
(25, 'App\\User', 1, 'created', 'App\\Product', 8, '[]', '{\"bar_code\":\"PFT2100\",\"provider_id\":1,\"organization_id\":1,\"store_id\":1,\"name\":\"HDMI to HDCVI converter\",\"unit_price\":\"85\",\"stock\":0,\"id\":8}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', NULL, '2021-11-01 20:44:48', '2021-11-01 20:44:48'),
(26, 'App\\User', 1, 'created', 'App\\Product', 9, '[]', '{\"bar_code\":\"PFT2690\",\"provider_id\":1,\"organization_id\":1,\"store_id\":1,\"name\":\"HDCVI Distribuidor 16in 32out\",\"unit_price\":\"207\",\"stock\":0,\"id\":9}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', NULL, '2021-11-01 20:44:48', '2021-11-01 20:44:48'),
(27, 'App\\User', 1, 'created', 'App\\Product', 10, '[]', '{\"bar_code\":\"TP2600\",\"provider_id\":1,\"organization_id\":1,\"store_id\":1,\"name\":\"Distribuidor\\/Repetidor HDCVI 1x3\",\"unit_price\":\"99\",\"stock\":0,\"id\":10}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', NULL, '2021-11-01 20:44:48', '2021-11-01 20:44:48'),
(28, 'App\\User', 1, 'updated', 'App\\Product', 7, '{\"partner\":0,\"gremio\":0}', '{\"partner\":\"1\",\"gremio\":\"18\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', NULL, '2021-11-01 20:49:41', '2021-11-01 20:49:41'),
(29, 'App\\User', 1, 'updated', 'App\\Product', 8, '{\"partner\":0,\"gremio\":0}', '{\"partner\":\"65\",\"gremio\":\"63\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', NULL, '2021-11-01 20:49:41', '2021-11-01 20:49:41'),
(30, 'App\\User', 1, 'updated', 'App\\Product', 9, '{\"partner\":0,\"gremio\":0}', '{\"partner\":\"159\",\"gremio\":\"38\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', NULL, '2021-11-01 20:49:41', '2021-11-01 20:49:41'),
(31, 'App\\User', 1, 'updated', 'App\\Product', 10, '{\"partner\":0,\"gremio\":0}', '{\"partner\":\"69\",\"gremio\":\"62\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36', NULL, '2021-11-01 20:49:41', '2021-11-01 20:49:41'),
(32, 'App\\User', 1, 'created', 'App\\Person', 2, '[]', '{\"identification\":null,\"name\":\"daniel monte\",\"organization_id\":1,\"identification_type\":1,\"email\":null,\"phone\":null,\"address\":\"sdsd\",\"category\":1,\"id\":2}', 'http://localhost/store.diginet/venta', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-11-29 15:24:07', '2021-11-29 15:24:07'),
(33, 'App\\User', 1, 'updated', 'App\\Product', 10, '{\"stock\":0}', '{\"stock\":-1}', 'http://localhost/store.diginet/venta', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-11-29 15:24:07', '2021-11-29 15:24:07'),
(34, 'App\\User', 1, 'updated', 'App\\Product', 9, '{\"stock\":0}', '{\"stock\":-1}', 'http://localhost/store.diginet/venta', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-11-29 15:24:54', '2021-11-29 15:24:54'),
(35, 'App\\User', 1, 'updated', 'App\\Product', 10, '{\"stock\":-1}', '{\"stock\":-2}', 'http://localhost/store.diginet/venta', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-11-29 15:25:36', '2021-11-29 15:25:36'),
(36, 'App\\User', 1, 'created', 'App\\Product', 11, '[]', '{\"bar_code\":1212,\"provider_id\":1,\"organization_id\":1,\"store_id\":1,\"name\":\"sssss\",\"partner\":100,\"gremio\":150,\"unit_price\":200,\"stock\":0,\"id\":11}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-01 15:21:14', '2021-12-01 15:21:14'),
(37, 'App\\User', 1, 'updated', 'App\\Product', 5, '{\"unit_price\":200}', '{\"unit_price\":\"250\"}', 'http://localhost/store.diginet/productos', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-06 13:25:45', '2021-12-06 13:25:45'),
(38, 'App\\User', 1, 'created', 'App\\Person', 3, '[]', '{\"identification\":34695838,\"name\":\"asdasd\",\"organization_id\":1,\"identification_type\":1,\"email\":null,\"phone\":null,\"address\":\"asdasd\",\"category\":1,\"id\":3}', 'http://localhost/store.diginet/venta', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-06 13:46:11', '2021-12-06 13:46:11'),
(39, 'App\\User', 1, 'updated', 'App\\Product', 9, '{\"stock\":-1}', '{\"stock\":-2}', 'http://localhost/store.diginet/venta', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-06 13:46:12', '2021-12-06 13:46:12'),
(40, 'App\\User', 1, 'updated', 'App\\Product', 8, '{\"stock\":0}', '{\"stock\":-1}', 'http://localhost/store.diginet/venta', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-06 13:46:12', '2021-12-06 13:46:12'),
(41, 'App\\User', 1, 'created', 'App\\Product', 12, '[]', '{\"bar_code\":\"CY-EX304SOP\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Soporte de pared para c\\ufffdmaras Antiexplosivas construido en AISI304\",\"partner\":\"49\",\"gremio\":\"25\",\"unit_price\":\"61\",\"stock\":1,\"id\":12}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 13:44:14', '2021-12-14 13:44:14'),
(42, 'App\\User', 1, 'created', 'App\\Product', 13, '[]', '{\"bar_code\":\"CY-EX3BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Caja de 3 conexiones Antiexplosiva Aluminio Atex\",\"partner\":\"25\",\"gremio\":\"20\",\"unit_price\":\"33\",\"stock\":1,\"id\":13}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 13:44:14', '2021-12-14 13:44:14'),
(43, 'App\\User', 1, 'created', 'App\\Product', 14, '[]', '{\"bar_code\":\"CY-EX4BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Caja de conexiones de 4 tomas ATEX AISI304 \\ufffd3\\/4\\ufffd\",\"partner\":\"75\",\"gremio\":\"60\",\"unit_price\":\"98\",\"stock\":1,\"id\":14}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 13:44:14', '2021-12-14 13:44:14'),
(44, 'App\\User', 1, 'created', 'App\\Product', 15, '[]', '{\"bar_code\":\"CY-EXB22M-IR\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 4mm\",\"partner\":\"546\",\"gremio\":\"00\",\"unit_price\":\"695\",\"stock\":1,\"id\":15}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 13:44:14', '2021-12-14 13:44:14'),
(45, 'App\\User', 1, 'created', 'App\\Product', 16, '[]', '{\"bar_code\":\"CY-EXB22M-IR-12\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 12mm\",\"partner\":\"513\",\"gremio\":\"24\",\"unit_price\":\"695\",\"stock\":1,\"id\":16}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 13:44:14', '2021-12-14 13:44:14'),
(46, 'App\\User', 1, 'created', 'App\\Product', 17, '[]', '{\"bar_code\":\"CY-EXB5218-Z\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"C\\ufffdmara Antiexplosiva bullet AISI304 2Mpx 18x Zoom motorizado 4.7-84mm\",\"partner\":\"728\",\"gremio\":\"00\",\"unit_price\":\"946\",\"stock\":1,\"id\":17}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 13:44:14', '2021-12-14 13:44:14'),
(47, 'App\\User', 1, 'created', 'App\\Product', 18, '[]', '{\"bar_code\":\"CY-EXC18100\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Cable conduit flexible con certificaci\\ufffdn ATEX \\ufffd18mm interno x 1m longitud\",\"partner\":\"19\",\"gremio\":\"50\",\"unit_price\":\"25\",\"stock\":1,\"id\":18}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 13:44:14', '2021-12-14 13:44:14'),
(48, 'App\\User', 1, 'created', 'App\\Product', 19, '[]', '{\"bar_code\":\"CY-EXPTZ230-IR\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Camara ATEX PTZ 2Mpx 30x IR 100m IR Acero inox 304 IP68 proto Dahua\\/Hik\\/ONVIF\",\"partner\":\"3836\",\"gremio\":\"00\",\"unit_price\":\"4987\",\"stock\":1,\"id\":19}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 13:44:14', '2021-12-14 13:44:14'),
(49, 'App\\User', 1, 'created', 'App\\Product', 20, '[]', '{\"bar_code\":\"CY-EX304SOP\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Soporte de pared para c\\ufffdmaras Antiexplosivas construido en AISI304\",\"partner\":\"49\",\"gremio\":\"25\",\"unit_price\":\"61\",\"stock\":1,\"id\":20}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:15:33', '2021-12-14 14:15:33'),
(50, 'App\\User', 1, 'created', 'App\\Product', 21, '[]', '{\"bar_code\":\"CY-EX3BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Caja de 3 conexiones Antiexplosiva Aluminio Atex\",\"partner\":\"25\",\"gremio\":\"20\",\"unit_price\":\"33\",\"stock\":1,\"id\":21}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:15:33', '2021-12-14 14:15:33'),
(51, 'App\\User', 1, 'created', 'App\\Product', 22, '[]', '{\"bar_code\":\"CY-EX4BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Caja de conexiones de 4 tomas ATEX AISI304 \\ufffd3\\/4\\ufffd\",\"partner\":\"75\",\"gremio\":\"60\",\"unit_price\":\"98\",\"stock\":1,\"id\":22}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:15:33', '2021-12-14 14:15:33'),
(52, 'App\\User', 1, 'created', 'App\\Product', 23, '[]', '{\"bar_code\":\"CY-EXB22M-IR\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 4mm\",\"partner\":\"546\",\"gremio\":\"00\",\"unit_price\":\"695\",\"stock\":1,\"id\":23}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:15:33', '2021-12-14 14:15:33'),
(53, 'App\\User', 1, 'created', 'App\\Product', 24, '[]', '{\"bar_code\":\"CY-EXB22M-IR-12\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 12mm\",\"partner\":\"513\",\"gremio\":\"24\",\"unit_price\":\"695\",\"stock\":1,\"id\":24}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:15:33', '2021-12-14 14:15:33'),
(54, 'App\\User', 1, 'created', 'App\\Product', 25, '[]', '{\"bar_code\":\"CY-EXB5218-Z\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"C\\ufffdmara Antiexplosiva bullet AISI304 2Mpx 18x Zoom motorizado 4.7-84mm\",\"partner\":\"728\",\"gremio\":\"00\",\"unit_price\":\"946\",\"stock\":1,\"id\":25}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:15:33', '2021-12-14 14:15:33'),
(55, 'App\\User', 1, 'created', 'App\\Product', 26, '[]', '{\"bar_code\":\"CY-EXC18100\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Cable conduit flexible con certificaci\\ufffdn ATEX \\ufffd18mm interno x 1m longitud\",\"partner\":\"19\",\"gremio\":\"50\",\"unit_price\":\"25\",\"stock\":1,\"id\":26}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:15:33', '2021-12-14 14:15:33'),
(56, 'App\\User', 1, 'updated', 'App\\Product', 19, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:15:33', '2021-12-14 14:15:33'),
(57, 'App\\User', 1, 'updated', 'App\\Product', 23, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:23:31', '2021-12-14 14:23:31'),
(58, 'App\\User', 1, 'updated', 'App\\Product', 25, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:23:31', '2021-12-14 14:23:31'),
(59, 'App\\User', 1, 'updated', 'App\\Product', 19, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:23:31', '2021-12-14 14:23:31'),
(60, 'App\\User', 1, 'created', 'App\\Product', 27, '[]', '{\"bar_code\":\"CY-EX304SOP\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Soporte de pared para c\\ufffdmaras Antiexplosivas construido en AISI304\\\"\",\"partner\":\"49\",\"gremio\":\"25\",\"unit_price\":\"61\",\"stock\":1,\"id\":27}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:39:19', '2021-12-14 14:39:19'),
(61, 'App\\User', 1, 'created', 'App\\Product', 28, '[]', '{\"bar_code\":\"CY-EX3BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Caja de 3 conexiones Antiexplosiva Aluminio Atex\\\"\",\"partner\":\"25\",\"gremio\":\"20\",\"unit_price\":\"33\",\"stock\":1,\"id\":28}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:39:19', '2021-12-14 14:39:19'),
(62, 'App\\User', 1, 'created', 'App\\Product', 29, '[]', '{\"bar_code\":\"CY-EX4BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Caja de conexiones de 4 tomas ATEX AISI304 \\ufffd3\\\\\\/4\\ufffd\\\"\",\"partner\":\"75\",\"gremio\":\"60\",\"unit_price\":\"98\",\"stock\":1,\"id\":29}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:39:19', '2021-12-14 14:39:19'),
(63, 'App\\User', 1, 'created', 'App\\Product', 30, '[]', '{\"bar_code\":\"CY-EXB22M-IR\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 4mm\\\"\",\"partner\":\"546\",\"gremio\":\"00\",\"unit_price\":\"695\",\"stock\":1,\"id\":30}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:39:19', '2021-12-14 14:39:19'),
(64, 'App\\User', 1, 'created', 'App\\Product', 31, '[]', '{\"bar_code\":\"CY-EXB22M-IR-12\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 12mm\\\"\",\"partner\":\"513\",\"gremio\":\"24\",\"unit_price\":\"695\",\"stock\":1,\"id\":31}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:39:19', '2021-12-14 14:39:19'),
(65, 'App\\User', 1, 'created', 'App\\Product', 32, '[]', '{\"bar_code\":\"CY-EXB5218-Z\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"C\\ufffdmara Antiexplosiva bullet AISI304 2Mpx 18x Zoom motorizado 4.7-84mm\\\"\",\"partner\":\"728\",\"gremio\":\"00\",\"unit_price\":\"946\",\"stock\":1,\"id\":32}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:39:19', '2021-12-14 14:39:19'),
(66, 'App\\User', 1, 'created', 'App\\Product', 33, '[]', '{\"bar_code\":\"CY-EXC18100\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Cable conduit flexible con certificaci\\ufffdn ATEX \\ufffd18mm interno x 1m longitud\\\"\",\"partner\":\"19\",\"gremio\":\"50\",\"unit_price\":\"25\",\"stock\":1,\"id\":33}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:39:19', '2021-12-14 14:39:19'),
(67, 'App\\User', 1, 'created', 'App\\Product', 34, '[]', '{\"bar_code\":\"CY-EXPTZ230-IR\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Camara ATEX PTZ 2Mpx 30x IR 100m IR Acero inox 304 IP68 proto Dahua\\\\\\/Hik\\\\\\/ONVIF\\\"\",\"partner\":\"3836\",\"gremio\":\"00\",\"unit_price\":\"4987\",\"stock\":1,\"id\":34}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:39:19', '2021-12-14 14:39:19'),
(68, 'App\\User', 1, 'created', 'App\\Product', 35, '[]', '{\"bar_code\":\"CY-EX304SOP\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Soporte de pared para c\\ufffdmaras Antiexplosivas construido en AISI304\\\"\",\"partner\":\"49\",\"gremio\":\"25\",\"unit_price\":\"61\",\"stock\":1,\"id\":35}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:44:42', '2021-12-14 14:44:42'),
(69, 'App\\User', 1, 'created', 'App\\Product', 36, '[]', '{\"bar_code\":\"CY-EX3BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Caja de 3 conexiones Antiexplosiva Aluminio Atex\\\"\",\"partner\":\"25\",\"gremio\":\"20\",\"unit_price\":\"33\",\"stock\":1,\"id\":36}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:44:42', '2021-12-14 14:44:42'),
(70, 'App\\User', 1, 'created', 'App\\Product', 37, '[]', '{\"bar_code\":\"CY-EX4BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Caja de conexiones de 4 tomas ATEX AISI304 \\ufffd3\\\\\\/4\\ufffd\\\"\",\"partner\":\"75\",\"gremio\":\"60\",\"unit_price\":\"98\",\"stock\":1,\"id\":37}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:44:42', '2021-12-14 14:44:42'),
(71, 'App\\User', 1, 'created', 'App\\Product', 38, '[]', '{\"bar_code\":\"CY-EXB22M-IR\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 4mm\\\"\",\"partner\":\"546\",\"gremio\":\"00\",\"unit_price\":\"695\",\"stock\":1,\"id\":38}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:44:42', '2021-12-14 14:44:42'),
(72, 'App\\User', 1, 'created', 'App\\Product', 39, '[]', '{\"bar_code\":\"CY-EXB22M-IR-12\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 12mm\\\"\",\"partner\":\"513\",\"gremio\":\"24\",\"unit_price\":\"695\",\"stock\":1,\"id\":39}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:44:42', '2021-12-14 14:44:42'),
(73, 'App\\User', 1, 'created', 'App\\Product', 40, '[]', '{\"bar_code\":\"CY-EXB5218-Z\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"C\\ufffdmara Antiexplosiva bullet AISI304 2Mpx 18x Zoom motorizado 4.7-84mm\\\"\",\"partner\":\"728\",\"gremio\":\"00\",\"unit_price\":\"946\",\"stock\":1,\"id\":40}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:44:42', '2021-12-14 14:44:42'),
(74, 'App\\User', 1, 'created', 'App\\Product', 41, '[]', '{\"bar_code\":\"CY-EXC18100\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Cable conduit flexible con certificaci\\ufffdn ATEX \\ufffd18mm interno x 1m longitud\\\"\",\"partner\":\"19\",\"gremio\":\"50\",\"unit_price\":\"25\",\"stock\":1,\"id\":41}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:44:42', '2021-12-14 14:44:42'),
(75, 'App\\User', 1, 'created', 'App\\Product', 42, '[]', '{\"bar_code\":\"CY-EXPTZ230-IR\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Camara ATEX PTZ 2Mpx 30x IR 100m IR Acero inox 304 IP68 proto Dahua\\\\\\/Hik\\\\\\/ONVIF\\\"\",\"partner\":\"3836\",\"gremio\":\"00\",\"unit_price\":\"4987\",\"stock\":1,\"id\":42}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:44:42', '2021-12-14 14:44:42'),
(76, 'App\\User', 1, 'created', 'App\\Product', 43, '[]', '{\"bar_code\":\"CY-EX304SOP\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Soporte de pared para c\\ufffdmaras Antiexplosivas construido en AISI304\\\"\",\"partner\":\"49\",\"gremio\":\"25\",\"unit_price\":\"61\",\"stock\":1,\"id\":43}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:50:26', '2021-12-14 14:50:26'),
(77, 'App\\User', 1, 'created', 'App\\Product', 44, '[]', '{\"bar_code\":\"CY-EX3BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Caja de 3 conexiones Antiexplosiva Aluminio Atex\\\"\",\"partner\":\"25\",\"gremio\":\"20\",\"unit_price\":\"33\",\"stock\":1,\"id\":44}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:50:26', '2021-12-14 14:50:26'),
(78, 'App\\User', 1, 'created', 'App\\Product', 45, '[]', '{\"bar_code\":\"CY-EX4BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Caja de conexiones de 4 tomas ATEX AISI304 \\ufffd3\\\\\\/4\\ufffd\\\"\",\"partner\":\"75\",\"gremio\":\"60\",\"unit_price\":\"98\",\"stock\":1,\"id\":45}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:50:26', '2021-12-14 14:50:26'),
(79, 'App\\User', 1, 'created', 'App\\Product', 46, '[]', '{\"bar_code\":\"CY-EXB22M-IR\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 4mm\\\"\",\"partner\":\"546\",\"gremio\":\"00\",\"unit_price\":\"695\",\"stock\":1,\"id\":46}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:50:26', '2021-12-14 14:50:26'),
(80, 'App\\User', 1, 'created', 'App\\Product', 47, '[]', '{\"bar_code\":\"CY-EXB22M-IR-12\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 12mm\\\"\",\"partner\":\"513\",\"gremio\":\"24\",\"unit_price\":\"695\",\"stock\":1,\"id\":47}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:50:26', '2021-12-14 14:50:26'),
(81, 'App\\User', 1, 'created', 'App\\Product', 48, '[]', '{\"bar_code\":\"CY-EXB5218-Z\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"C\\ufffdmara Antiexplosiva bullet AISI304 2Mpx 18x Zoom motorizado 4.7-84mm\\\"\",\"partner\":\"728\",\"gremio\":\"00\",\"unit_price\":\"946\",\"stock\":1,\"id\":48}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:50:26', '2021-12-14 14:50:26'),
(82, 'App\\User', 1, 'created', 'App\\Product', 49, '[]', '{\"bar_code\":\"CY-EXC18100\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Cable conduit flexible con certificaci\\ufffdn ATEX \\ufffd18mm interno x 1m longitud\\\"\",\"partner\":\"19\",\"gremio\":\"50\",\"unit_price\":\"25\",\"stock\":1,\"id\":49}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:50:26', '2021-12-14 14:50:26'),
(83, 'App\\User', 1, 'created', 'App\\Product', 50, '[]', '{\"bar_code\":\"CY-EXPTZ230-IR\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Camara ATEX PTZ 2Mpx 30x IR 100m IR Acero inox 304 IP68 proto Dahua\\\\\\/Hik\\\\\\/ONVIF\\\"\",\"partner\":\"3836\",\"gremio\":\"00\",\"unit_price\":\"4987\",\"stock\":1,\"id\":50}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:50:26', '2021-12-14 14:50:26'),
(84, 'App\\User', 1, 'created', 'App\\Product', 51, '[]', '{\"bar_code\":\"CY-EX304SOP\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Soporte de pared para c\\ufffdmaras Antiexplosivas construido en AISI304\\\"\",\"partner\":\"49\",\"gremio\":\"25\",\"unit_price\":\"61\",\"stock\":1,\"id\":51}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:52:18', '2021-12-14 14:52:18'),
(85, 'App\\User', 1, 'created', 'App\\Product', 52, '[]', '{\"bar_code\":\"CY-EX3BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Caja de 3 conexiones Antiexplosiva Aluminio Atex\\\"\",\"partner\":\"25\",\"gremio\":\"20\",\"unit_price\":\"33\",\"stock\":1,\"id\":52}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:52:18', '2021-12-14 14:52:18'),
(86, 'App\\User', 1, 'created', 'App\\Product', 53, '[]', '{\"bar_code\":\"CY-EX4BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Caja de conexiones de 4 tomas ATEX AISI304 \\ufffd3\\/4\\ufffd\\\"\",\"partner\":\"75\",\"gremio\":\"60\",\"unit_price\":\"98\",\"stock\":1,\"id\":53}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:52:18', '2021-12-14 14:52:18'),
(87, 'App\\User', 1, 'created', 'App\\Product', 54, '[]', '{\"bar_code\":\"CY-EXB22M-IR\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 4mm\\\"\",\"partner\":\"546\",\"gremio\":\"00\",\"unit_price\":\"695\",\"stock\":1,\"id\":54}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:52:19', '2021-12-14 14:52:19'),
(88, 'App\\User', 1, 'created', 'App\\Product', 55, '[]', '{\"bar_code\":\"CY-EXB22M-IR-12\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 12mm\\\"\",\"partner\":\"513\",\"gremio\":\"24\",\"unit_price\":\"695\",\"stock\":1,\"id\":55}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:52:19', '2021-12-14 14:52:19'),
(89, 'App\\User', 1, 'created', 'App\\Product', 56, '[]', '{\"bar_code\":\"CY-EXB5218-Z\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"C\\ufffdmara Antiexplosiva bullet AISI304 2Mpx 18x Zoom motorizado 4.7-84mm\\\"\",\"partner\":\"728\",\"gremio\":\"00\",\"unit_price\":\"946\",\"stock\":1,\"id\":56}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:52:19', '2021-12-14 14:52:19'),
(90, 'App\\User', 1, 'created', 'App\\Product', 57, '[]', '{\"bar_code\":\"CY-EXC18100\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Cable conduit flexible con certificaci\\ufffdn ATEX \\ufffd18mm interno x 1m longitud\\\"\",\"partner\":\"19\",\"gremio\":\"50\",\"unit_price\":\"25\",\"stock\":1,\"id\":57}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:52:19', '2021-12-14 14:52:19'),
(91, 'App\\User', 1, 'created', 'App\\Product', 58, '[]', '{\"bar_code\":\"CY-EXPTZ230-IR\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"\\\"Camara ATEX PTZ 2Mpx 30x IR 100m IR Acero inox 304 IP68 proto Dahua\\/Hik\\/ONVIF\\\"\",\"partner\":\"3836\",\"gremio\":\"00\",\"unit_price\":\"4987\",\"stock\":1,\"id\":58}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 14:52:19', '2021-12-14 14:52:19'),
(92, 'App\\User', 1, 'created', 'App\\Product', 59, '[]', '{\"bar_code\":\"CY-EX304SOP\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Soporte de pared para c\\ufffdmaras Antiexplosivas construido en AISI304\",\"partner\":\"49\",\"gremio\":\"25\",\"unit_price\":\"61\",\"stock\":1,\"id\":59}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:30:35', '2021-12-14 15:30:35'),
(93, 'App\\User', 1, 'created', 'App\\Product', 60, '[]', '{\"bar_code\":\"CY-EX3BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Caja de 3 conexiones Antiexplosiva Aluminio Atex\",\"partner\":\"25\",\"gremio\":\"20\",\"unit_price\":\"33\",\"stock\":1,\"id\":60}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:30:35', '2021-12-14 15:30:35'),
(94, 'App\\User', 1, 'created', 'App\\Product', 61, '[]', '{\"bar_code\":\"CY-EX4BOX\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Caja de conexiones de 4 tomas ATEX AISI304 \\ufffd3\\/4\\ufffd\",\"partner\":\"75\",\"gremio\":\"60\",\"unit_price\":\"98\",\"stock\":1,\"id\":61}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:30:35', '2021-12-14 15:30:35'),
(95, 'App\\User', 1, 'created', 'App\\Product', 62, '[]', '{\"bar_code\":\"CY-EXB22M-IR\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 4mm\",\"partner\":\"546\",\"gremio\":\"00\",\"unit_price\":\"695\",\"stock\":1,\"id\":62}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:30:35', '2021-12-14 15:30:35'),
(96, 'App\\User', 1, 'created', 'App\\Product', 63, '[]', '{\"bar_code\":\"CY-EXB22M-IR-12\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"C\\ufffdmara Antiexplosiva para m\\ufffdviles IR 40mt 2Mpx 12mm\",\"partner\":\"513\",\"gremio\":\"24\",\"unit_price\":\"695\",\"stock\":1,\"id\":63}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:30:35', '2021-12-14 15:30:35'),
(97, 'App\\User', 1, 'created', 'App\\Product', 64, '[]', '{\"bar_code\":\"CY-EXB5218-Z\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"C\\ufffdmara Antiexplosiva bullet AISI304 2Mpx 18x Zoom motorizado 4.7-84mm\",\"partner\":\"728\",\"gremio\":\"00\",\"unit_price\":\"946\",\"stock\":1,\"id\":64}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:30:35', '2021-12-14 15:30:35'),
(98, 'App\\User', 1, 'created', 'App\\Product', 65, '[]', '{\"bar_code\":\"CY-EXC18100\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Cable conduit flexible con certificaci\\ufffdn ATEX \\ufffd18mm interno x 1m longitud\",\"partner\":\"19\",\"gremio\":\"50\",\"unit_price\":\"25\",\"stock\":1,\"id\":65}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:30:35', '2021-12-14 15:30:35'),
(99, 'App\\User', 1, 'created', 'App\\Product', 66, '[]', '{\"bar_code\":\"CY-EXPTZ230-IR\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"Camara ATEX PTZ 2Mpx 30x IR 100m IR Acero inox 304 IP68 proto Dahua\\/Hik\\/ONVIF\",\"partner\":\"3836\",\"gremio\":\"00\",\"unit_price\":\"4987\",\"stock\":1,\"id\":66}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:30:35', '2021-12-14 15:30:35'),
(100, 'App\\User', 1, 'updated', 'App\\Product', 62, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:33:02', '2021-12-14 15:33:02'),
(101, 'App\\User', 1, 'updated', 'App\\Product', 64, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:33:02', '2021-12-14 15:33:02'),
(102, 'App\\User', 1, 'updated', 'App\\Product', 66, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:33:02', '2021-12-14 15:33:02'),
(103, 'App\\User', 1, 'created', 'App\\Product', 67, '[]', '{\"bar_code\":\"CY-EXPTZ230-IR-316L\",\"provider_id\":0,\"organization_id\":1,\"store_id\":1,\"name\":\"C\\ufffdmara ATEX apta para ambiente mar\\ufffdtimo PTZ 2Mpx 30x IR 100m IR SS 316L IP68 proto Dahua\\/Hik\\/ONVIF\",\"partner\":\"4169\",\"gremio\":\"00\",\"unit_price\":\"5420\",\"stock\":1,\"id\":67}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:33:02', '2021-12-14 15:33:02'),
(104, 'App\\User', 1, 'updated', 'App\\Product', 62, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:34:26', '2021-12-14 15:34:26'),
(105, 'App\\User', 1, 'updated', 'App\\Product', 64, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:34:26', '2021-12-14 15:34:26'),
(106, 'App\\User', 1, 'updated', 'App\\Product', 66, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:34:26', '2021-12-14 15:34:26'),
(107, 'App\\User', 1, 'updated', 'App\\Product', 67, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:34:26', '2021-12-14 15:34:26'),
(108, 'App\\User', 1, 'updated', 'App\\Product', 62, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:37:01', '2021-12-14 15:37:01'),
(109, 'App\\User', 1, 'updated', 'App\\Product', 64, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:37:01', '2021-12-14 15:37:01'),
(110, 'App\\User', 1, 'updated', 'App\\Product', 66, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:37:01', '2021-12-14 15:37:01'),
(111, 'App\\User', 1, 'updated', 'App\\Product', 67, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:37:01', '2021-12-14 15:37:01'),
(112, 'App\\User', 1, 'updated', 'App\\Product', 62, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:37:39', '2021-12-14 15:37:39');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(113, 'App\\User', 1, 'updated', 'App\\Product', 64, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:37:39', '2021-12-14 15:37:39'),
(114, 'App\\User', 1, 'updated', 'App\\Product', 66, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:37:39', '2021-12-14 15:37:39'),
(115, 'App\\User', 1, 'updated', 'App\\Product', 67, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:37:39', '2021-12-14 15:37:39'),
(116, 'App\\User', 1, 'updated', 'App\\Product', 62, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:37:45', '2021-12-14 15:37:45'),
(117, 'App\\User', 1, 'updated', 'App\\Product', 64, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:37:45', '2021-12-14 15:37:45'),
(118, 'App\\User', 1, 'updated', 'App\\Product', 66, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:37:45', '2021-12-14 15:37:45'),
(119, 'App\\User', 1, 'updated', 'App\\Product', 67, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:37:45', '2021-12-14 15:37:45'),
(120, 'App\\User', 1, 'updated', 'App\\Product', 62, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:38:00', '2021-12-14 15:38:00'),
(121, 'App\\User', 1, 'updated', 'App\\Product', 64, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:38:00', '2021-12-14 15:38:00'),
(122, 'App\\User', 1, 'updated', 'App\\Product', 66, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:38:00', '2021-12-14 15:38:00'),
(123, 'App\\User', 1, 'updated', 'App\\Product', 67, '{\"gremio\":0}', '{\"gremio\":\"00\"}', 'http://localhost/store.diginet/import_csv', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', NULL, '2021-12-14 15:38:00', '2021-12-14 15:38:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'B',
  `cae` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comp_n` bigint(20) NOT NULL,
  `cae_fch_vto` date NOT NULL,
  `amount` int(11) NOT NULL,
  `iva` int(11) NOT NULL,
  `tax` int(11) NOT NULL,
  `identification` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cashs`
--

CREATE TABLE `cashs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL,
  `initial_cash` double(8,2) NOT NULL,
  `final_cash` double(8,2) NOT NULL,
  `initial_user_id` int(11) NOT NULL,
  `final_user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cashs`
--

INSERT INTO `cashs` (`id`, `status`, `initial_cash`, `final_cash`, `initial_user_id`, `final_user_id`, `store_id`, `created_at`, `updated_at`) VALUES
(1, 0, 100.00, 500.00, 1, 1, 1, '2021-10-05 14:24:38', '2021-12-06 13:35:28'),
(2, 1, 100.00, 0.00, 1, 0, 1, '2021-12-06 13:35:34', '2021-12-06 13:35:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credit_notes`
--

CREATE TABLE `credit_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'B',
  `cae` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cae_fch_vto` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extras`
--

CREATE TABLE `extras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cash_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `amount` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fees`
--

CREATE TABLE `fees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `n` double(8,2) NOT NULL,
  `p` double(8,2) NOT NULL,
  `financial_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `financials`
--

CREATE TABLE `financials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_04_12_000006_create_permission_tables', 1),
(5, '2020_05_05_014952_create_audits_table', 1),
(6, '2020_07_07_204223_create_persons_table', 1),
(7, '2020_07_10_100534_create_stores_table', 1),
(8, '2020_08_23_164147_create_sales_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 2),
(2, 'App\\User', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cuit` bigint(20) NOT NULL,
  `r_social` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `condition_iva` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `init` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `cuit`, `r_social`, `condition_iva`, `init`, `created_at`, `updated_at`) VALUES
(1, 'Herrera Gerardi Maria Alejandra', 27230428307, 'Herrera Gerardi Maria Alejandra', 'IVA Responsable Inscripto', '01/06/2020', '2021-09-07 16:00:39', '2021-09-07 16:00:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persons`
--

CREATE TABLE `persons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identification` bigint(20) DEFAULT NULL,
  `identification_type` int(11) DEFAULT NULL,
  `organization_id` bigint(20) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `persons`
--

INSERT INTO `persons` (`id`, `name`, `identification`, `identification_type`, `organization_id`, `email`, `phone`, `address`, `description`, `category`, `created_at`, `updated_at`) VALUES
(1, 'daniel monte', 34695832, 1, 1, NULL, NULL, 'sdsd', NULL, 1, '2021-10-11 21:55:48', '2021-10-11 21:55:48'),
(2, 'daniel monte', NULL, 1, 1, NULL, NULL, 'sdsd', NULL, 1, '2021-11-29 15:24:07', '2021-11-29 15:24:07'),
(3, 'asdasd', 34695838, 1, 1, NULL, NULL, 'asdasd', NULL, 1, '2021-12-06 13:46:11', '2021-12-06 13:46:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bar_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_price` double(8,2) NOT NULL DEFAULT 0.00,
  `partner` double(8,2) NOT NULL DEFAULT 0.00,
  `gremio` double(8,2) NOT NULL DEFAULT 0.00,
  `provider_id` bigint(20) DEFAULT NULL,
  `organization_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `url` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `v_added` int(11) NOT NULL DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `bar_code`, `unit_price`, `partner`, `gremio`, `provider_id`, `organization_id`, `store_id`, `stock`, `created_at`, `updated_at`, `url`, `v_added`) VALUES
(59, 'Soporte de pared para c�maras Antiexplosivas construido en AISI304', 'CY-EX304SOP', 61.00, 49.00, 25.00, 0, 1, 1, 1, '2021-12-14 15:30:35', '2021-12-14 15:30:35', NULL, 30),
(60, 'Caja de 3 conexiones Antiexplosiva Aluminio Atex', 'CY-EX3BOX', 33.00, 25.00, 20.00, 0, 1, 1, 1, '2021-12-14 15:30:35', '2021-12-14 15:30:35', NULL, 30),
(61, 'Caja de conexiones de 4 tomas ATEX AISI304 �3/4�', 'CY-EX4BOX', 98.00, 75.00, 60.00, 0, 1, 1, 1, '2021-12-14 15:30:35', '2021-12-14 15:30:35', NULL, 30),
(62, 'C�mara Antiexplosiva para m�viles IR 40mt 2Mpx 4mm', 'CY-EXB22M-IR', 695.00, 546.00, 0.00, 0, 1, 1, 1, '2021-12-14 15:30:35', '2021-12-14 15:38:00', NULL, 30),
(63, 'C�mara Antiexplosiva para m�viles IR 40mt 2Mpx 12mm', 'CY-EXB22M-IR-12', 695.00, 513.00, 24.00, 0, 1, 1, 1, '2021-12-14 15:30:35', '2021-12-14 15:30:35', NULL, 30),
(64, 'C�mara Antiexplosiva bullet AISI304 2Mpx 18x Zoom motorizado 4.7-84mm', 'CY-EXB5218-Z', 946.00, 728.00, 0.00, 0, 1, 1, 1, '2021-12-14 15:30:35', '2021-12-14 15:38:00', NULL, 30),
(65, 'Cable conduit flexible con certificaci�n ATEX �18mm interno x 1m longitud', 'CY-EXC18100', 25.00, 19.00, 50.00, 0, 1, 1, 1, '2021-12-14 15:30:35', '2021-12-14 15:30:35', NULL, 30),
(66, 'Camara ATEX PTZ 2Mpx 30x IR 100m IR Acero inox 304 IP68 proto Dahua/Hik/ONVIF', 'CY-EXPTZ230-IR', 4987.00, 3836.00, 0.00, 0, 1, 1, 1, '2021-12-14 15:30:35', '2021-12-14 15:38:00', NULL, 30),
(67, 'C�mara ATEX apta para ambiente mar�timo PTZ 2Mpx 30x IR 100m IR SS 316L IP68 proto Dahua/Hik/ONVIF', 'CY-EXPTZ230-IR-316L', 5420.00, 4169.00, 0.00, 0, 1, 1, 1, '2021-12-14 15:33:02', '2021-12-14 15:38:00', NULL, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `organization_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'cajero', 'web', '2021-09-07 16:00:39', '2021-09-07 16:00:39'),
(2, 'administrador', 'web', '2021-09-07 16:00:39', '2021-09-07 16:00:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cash_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED DEFAULT NULL,
  `bill_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cash_payment` bigint(20) NOT NULL DEFAULT 0,
  `credit_payment` bigint(20) NOT NULL DEFAULT 0,
  `personal_account_payment` bigint(20) NOT NULL DEFAULT 0,
  `discount` bigint(20) NOT NULL,
  `invoiced` int(11) NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `cash_id`, `client_id`, `bill_id`, `cash_payment`, `credit_payment`, `personal_account_payment`, `discount`, `invoiced`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, NULL, 0, 0, 100, 0, 0, '[{\"productId\":1,\"name\":\"d2\",\"price\":100,\"provider\":\"Inexistente\",\"discount\":0}]', '2021-10-11 21:55:48', '2021-10-11 21:55:48'),
(2, 1, 1, 2, NULL, 0, 0, 99, 0, 0, '[{\"productId\":10,\"name\":\"Distribuidor/Repetidor HDCVI 1x3\",\"price\":99,\"provider\":null,\"discount\":0}]', '2021-11-29 15:24:07', '2021-11-29 15:24:07'),
(3, 1, 1, 2, NULL, 0, 0, 207, 0, 0, '[{\"productId\":9,\"name\":\"HDCVI Distribuidor 16in 32out\",\"price\":207,\"provider\":null,\"discount\":0}]', '2021-11-29 15:24:54', '2021-11-29 15:24:54'),
(4, 1, 1, 1, NULL, 0, 0, 99, 0, 0, '[{\"productId\":10,\"name\":\"Distribuidor/Repetidor HDCVI 1x3\",\"price\":99,\"provider\":null,\"discount\":0}]', '2021-11-29 15:25:36', '2021-11-29 15:25:36'),
(5, 1, 2, 3, NULL, 200, 71, 0, -21, 0, '[{\"productId\":9,\"name\":\"HDCVI Distribuidor 16in 32out\",\"price\":207,\"provider\":\"Inexistente\",\"discount\":-20.7},{\"productId\":8,\"name\":\"HDMI to HDCVI converter\",\"price\":85,\"provider\":\"Inexistente\",\"discount\":0}]', '2021-12-06 13:46:12', '2021-12-06 13:46:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stores`
--

CREATE TABLE `stores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `stores`
--

INSERT INTO `stores` (`id`, `organization_id`, `name`, `address`, `contact`, `created_at`, `updated_at`) VALUES
(1, 1, 'Smartcell', 'España 320, la Banda', 'Tel 1: 3854 89-7793, Tel 2: 3855 74-5285, Tel 3: 699 8995', '2021-09-07 16:00:39', '2021-09-07 16:00:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `store_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@store', '2021-09-07 16:00:39', '$2y$10$fQR6A6uNxyiM1V9kwsfOsOOB54ksMdWjczY7jokf3CHz..cFNpsiK', 1, 'cV3ObLjExDyoYE5v1c9WmcP1Cov259Wu5RT0it5hbjzZF72MuyzqqCbQEz7c', '2021-09-07 16:00:39', '2021-09-07 16:00:39'),
(2, 'Cajero', 'cajero1@store', '2021-09-07 16:00:39', '$2y$10$qKCz6ulqGWKCkzUeySDo0OEWmTB/vy1nAbRpZxM6a8aBUi178P//e', 1, 'JVlT4tWZlt', '2021-09-07 16:00:39', '2021-09-07 16:00:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  ADD KEY `audits_user_id_user_type_index` (`user_id`,`user_type`);

--
-- Indices de la tabla `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cashs`
--
ALTER TABLE `cashs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `credit_notes`
--
ALTER TABLE `credit_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `financials`
--
ALTER TABLE `financials`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indices de la tabla `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `audits`
--
ALTER TABLE `audits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT de la tabla `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cashs`
--
ALTER TABLE `cashs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `credit_notes`
--
ALTER TABLE `credit_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `extras`
--
ALTER TABLE `extras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `financials`
--
ALTER TABLE `financials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persons`
--
ALTER TABLE `persons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `stores`
--
ALTER TABLE `stores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
