-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 28-02-2023 a las 18:13:05
-- Versión del servidor: 10.5.18-MariaDB-cll-lve
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `opti8065_cllinica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` longtext DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `codigo` varchar(255) DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `material_id` int(11) DEFAULT NULL,
  `unico` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `jornada` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Aros', 'Aros de lentes', '2022-11-09 06:54:35', '2022-11-09 06:54:35'),
(2, 'extras', NULL, '2022-11-11 08:34:30', '2022-11-11 08:34:30'),
(3, 'Servicios', 'Servicios que brinda la clinica', '2023-01-09 03:46:18', '2023-01-09 03:46:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'Category 1', 'category-1', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(2, NULL, 1, 'Category 2', 'category-2', '2022-11-02 02:04:30', '2022-11-02 02:04:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id` int(10) UNSIGNED NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `nota` text DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nombres` varchar(255) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `ocupacion` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `genero` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  `anteojos` varchar(255) DEFAULT NULL,
  `examen_anterior` varchar(255) DEFAULT NULL,
  `embarazo` varchar(255) DEFAULT NULL,
  `nervios` varchar(255) DEFAULT NULL,
  `jornada` int(11) DEFAULT NULL,
  `tutor` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id` int(10) UNSIGNED NOT NULL,
  `diabetes` varchar(255) DEFAULT NULL,
  `presion_arterial` varchar(255) DEFAULT NULL,
  `ardor` int(11) NOT NULL,
  `dolor_cabeza` int(11) NOT NULL,
  `irrtitacion` int(11) NOT NULL,
  `prurito` int(11) NOT NULL,
  `sensibilidad` int(11) NOT NULL,
  `dolor_ocular` int(11) NOT NULL,
  `sombras` int(11) NOT NULL,
  `cataratas` int(11) NOT NULL,
  `glaucoma` int(11) NOT NULL,
  `pterigion` int(11) NOT NULL,
  `vision_borrosa` int(11) NOT NULL,
  `halos` int(11) NOT NULL,
  `deslumbra` int(11) NOT NULL,
  `mareos` int(11) NOT NULL,
  `inflamacion` int(11) NOT NULL,
  `lagrimeo` int(11) NOT NULL,
  `otros` int(11) NOT NULL,
  `obs` mediumtext NOT NULL,
  `motivo_consulta` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `consultas`
--

INSERT INTO `consultas` (`id`, `diabetes`, `presion_arterial`, `ardor`, `dolor_cabeza`, `irrtitacion`, `prurito`, `sensibilidad`, `dolor_ocular`, `sombras`, `cataratas`, `glaucoma`, `pterigion`, `vision_borrosa`, `halos`, `deslumbra`, `mareos`, `inflamacion`, `lagrimeo`, `otros`, `obs`, `motivo_consulta`, `created_at`, `updated_at`, `cliente_id`) VALUES
(2, '34', '3434', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 'obser', 'Motivo Consulta', '2022-12-09 18:19:16', '2022-12-09 18:19:16', NULL),
(3, '0', '0', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'no', 'consulta rutina', '2023-01-08 02:57:15', '2023-01-08 02:57:15', 1),
(4, '23.3', '12', 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 'ninguna', 'Lentes nuevos', '2023-01-09 03:37:12', '2023-01-09 03:37:12', 4),
(5, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 'N/A', 'Paciente presenta molestias al ver a cierta distancia', '2023-01-27 22:02:04', '2023-01-27 22:02:04', 5),
(6, '200', '20/30', 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'no', 'Ardor en los ojos', '2023-02-01 00:45:30', '2023-02-01 00:45:30', 6),
(7, '23', '23', 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'prueba', 'prueba', '2023-02-02 14:21:34', '2023-02-02 14:21:34', 6),
(8, NULL, NULL, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'N/A', 'Molestias en ambos ojos', '2023-02-27 19:28:16', '2023-02-27 19:28:16', 7),
(9, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'no', 'no ve bien', '2023-02-27 19:35:15', '2023-02-27 19:35:15', 8),
(10, NULL, NULL, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 'N/A', 'Molestias en ambos ojos', '2023-02-27 23:01:59', '2023-02-27 23:01:59', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `couponables`
--

CREATE TABLE `couponables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `couponable_type` varchar(255) NOT NULL,
  `couponable_id` bigint(20) UNSIGNED NOT NULL,
  `redeemed_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `redeemed_type` varchar(255) DEFAULT NULL,
  `redeemed_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(64) NOT NULL,
  `type` varchar(128) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `limit` int(10) UNSIGNED DEFAULT NULL,
  `redeemer_type` varchar(255) DEFAULT NULL,
  `redeemer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `data`, `quantity`, `limit`, `redeemer_type`, `redeemer_id`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'CuponDeBienvenida', NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-11 22:03:37', '2023-02-11 22:14:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_rows`
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
-- Volcado de datos para la tabla `data_rows`
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
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'created_at', 'timestamp', 'Created At', 0, 1, 0, 0, 0, 0, '{}', 2),
(58, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 3),
(59, 7, 'nombres', 'text', 'Nombres', 1, 1, 1, 1, 1, 1, '{}', 4),
(62, 7, 'telefono', 'text', 'Telefono', 0, 1, 1, 1, 1, 1, '{}', 7),
(63, 7, 'direccion', 'text', 'Direccion', 0, 0, 1, 1, 1, 1, '{}', 9),
(64, 7, 'genero', 'select_dropdown', 'Genero', 0, 1, 1, 1, 1, 1, '{\"0\":\"Seleccione\",\"options\":{\"Masculino\":\"Masculino\",\"Femenino\":\"Femenino\"}}', 10),
(65, 7, 'email', 'text', 'Email', 0, 1, 1, 1, 1, 1, '{}', 8),
(66, 7, 'nacimiento', 'date', 'Nacimiento', 0, 1, 1, 1, 1, 1, '{\"format\":\"%d-%m-%Y\"}', 11),
(67, 8, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(68, 8, 'od_esf', 'text', 'Od Esf', 0, 1, 1, 1, 1, 1, '{}', 2),
(69, 8, 'od_cil', 'text', 'Od Cil', 0, 1, 1, 1, 1, 1, '{}', 3),
(70, 8, 'od_eje', 'text', 'Od Eje', 0, 1, 1, 1, 1, 1, '{}', 4),
(71, 8, 'od_add', 'text', 'Od Add', 0, 1, 1, 1, 1, 1, '{}', 5),
(72, 8, 'oi_esf', 'text', 'Oi Esf', 0, 1, 1, 1, 1, 1, '{}', 6),
(73, 8, 'oi_cil', 'text', 'Oi Cil', 0, 1, 1, 1, 1, 1, '{}', 7),
(74, 8, 'oi_eje', 'text', 'Oi Eje', 0, 1, 1, 1, 1, 1, '{}', 8),
(75, 8, 'oi_add', 'text', 'Oi Add', 0, 1, 1, 1, 1, 1, '{}', 9),
(76, 8, 'dip', 'text', 'Dip', 0, 1, 1, 1, 1, 1, '{}', 10),
(77, 8, 'notas', 'text_area', 'Notas', 0, 1, 1, 1, 1, 1, '{}', 11),
(78, 8, 'cliente_id', 'text', 'Cliente Id', 0, 1, 1, 1, 1, 1, '{}', 12),
(79, 8, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 13),
(80, 8, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 14),
(81, 8, 'receta_belongsto_cliente_relationship', 'relationship', 'clientes', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Cliente\",\"table\":\"clientes\",\"type\":\"belongsTo\",\"column\":\"cliente_id\",\"key\":\"id\",\"label\":\"nombres\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(82, 7, 'cliente_hasmany_receta_relationship', 'relationship', 'recetas', 0, 0, 0, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Receta\",\"table\":\"recetas\",\"type\":\"hasMany\",\"column\":\"cliente_id\",\"key\":\"id\",\"label\":\"notas\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(83, 10, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(84, 10, 'cliente_id', 'text', 'Cliente Id', 0, 1, 1, 1, 1, 1, '{}', 2),
(85, 10, 'pago_cliente', 'number', 'Pago Cliente', 0, 1, 1, 1, 1, 1, '{}', 3),
(86, 10, 'extra_cliente', 'text', 'Extra Cliente', 0, 1, 1, 1, 1, 1, '{}', 4),
(87, 10, 'fecha_venta', 'date', 'Fecha Venta', 0, 1, 1, 1, 1, 1, '{}', 5),
(88, 10, 'fecha_entrega', 'date', 'Fecha Entrega', 0, 1, 1, 1, 1, 1, '{}', 6),
(89, 10, 'dias_atraso', 'number', 'Dias Atraso', 0, 1, 1, 1, 1, 1, '{}', 7),
(90, 10, 'estado', 'select_dropdown', 'Estado', 0, 1, 1, 1, 1, 1, '{\"options\":{\"1\":\"Entregado\",\"2\":\"Pendiente\"}}', 8),
(91, 10, 'metodo_pago', 'text', 'Metodo Pago', 0, 1, 1, 1, 1, 1, '{}', 9),
(92, 10, 'descuento_venta', 'number', 'Descuento Venta', 0, 1, 1, 1, 1, 1, '{}', 10),
(93, 10, 'total_cuenta', 'number', 'Total Cuenta', 0, 1, 1, 1, 1, 1, '{}', 11),
(94, 10, 'deuda_cliente', 'text', 'Deuda Cliente', 0, 1, 1, 1, 1, 1, '{}', 12),
(95, 10, 'debe_cliente', 'select_dropdown', 'Debe Cliente', 0, 1, 1, 1, 1, 1, '{\"options\":{\"1\":\"Si\",\"2\":\"No\"}}', 13),
(96, 10, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 14),
(97, 10, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 15),
(98, 10, 'trabajo_belongsto_cliente_relationship', 'relationship', 'clientes', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Cliente\",\"table\":\"clientes\",\"type\":\"belongsTo\",\"column\":\"cliente_id\",\"key\":\"id\",\"label\":\"nombres\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 16),
(99, 7, 'cliente_hasmany_trabajo_relationship', 'relationship', 'trabajos', 0, 0, 0, 0, 0, 0, '{\"model\":\"App\\\\Models\\\\Trabajo\",\"table\":\"trabajos\",\"type\":\"hasMany\",\"column\":\"cliente_id\",\"key\":\"id\",\"label\":\"id\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(100, 7, 'apellidos', 'text', 'Apellidos', 0, 1, 1, 1, 1, 1, '{}', 5),
(101, 7, 'ocupacion', 'text', 'Ocupacion', 0, 0, 1, 1, 1, 1, '{}', 6),
(102, 7, 'anteojos', 'checkbox', 'Anteojos', 0, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 13),
(103, 7, 'examen_anterior', 'checkbox', 'Examen Anterior', 0, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 14),
(104, 7, 'embarazo', 'checkbox', 'Embarazo', 0, 0, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 16),
(105, 7, 'nervios', 'checkbox', 'Nervios', 0, 0, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 17),
(106, 11, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(107, 11, 'fecha_hora', 'timestamp', 'Fecha Hora', 0, 1, 1, 1, 1, 1, '{}', 2),
(108, 11, 'nota', 'text', 'Nota', 0, 1, 1, 1, 1, 1, '{}', 3),
(109, 11, 'estado', 'checkbox', 'Estado', 0, 1, 1, 1, 1, 1, '{\"on\":\"Activa\",\"off\":\"Cancelada\",\"checked\":true}', 4),
(110, 11, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 1, '{}', 5),
(111, 11, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 6),
(112, 11, 'cliente_id', 'text', 'Cliente Id', 0, 1, 1, 1, 1, 1, '{}', 7),
(113, 11, 'cita_belongsto_cliente_relationship', 'relationship', 'clientes', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Cliente\",\"table\":\"clientes\",\"type\":\"belongsTo\",\"column\":\"cliente_id\",\"key\":\"id\",\"label\":\"nombres\",\"pivot_table\":\"categories\",\"pivot\":\"0\",\"taggable\":\"0\"}', 8),
(114, 12, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(115, 12, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(116, 12, 'descripcion', 'text', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 3),
(117, 13, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(118, 13, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 3),
(119, 13, 'descripcion', 'markdown_editor', 'Descripcion', 0, 1, 1, 1, 1, 1, '{}', 4),
(120, 13, 'cantidad', 'number', 'Cantidad', 0, 1, 1, 1, 1, 1, '{}', 5),
(121, 13, 'precio', 'number', 'Precio', 0, 1, 1, 1, 1, 1, '{}', 6),
(122, 13, 'imagen', 'image', 'Imagen', 0, 1, 1, 1, 1, 1, '{}', 7),
(123, 13, 'categoria_id', 'text', 'Categoria Id', 0, 1, 1, 1, 1, 1, '{}', 8),
(124, 13, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 9),
(125, 13, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 10),
(126, 13, 'articulo_belongsto_categoria_relationship', 'relationship', 'Categorias', 1, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Categoria\",\"table\":\"categorias\",\"type\":\"belongsTo\",\"column\":\"categoria_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"articulos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(127, 13, 'stok', 'checkbox', 'Stok', 0, 1, 1, 1, 1, 1, '{\"on\":\"Stok\",\"off\":\"Extra\",\"checked\":true}', 16),
(128, 7, 'jornada', 'checkbox', 'Jornada', 0, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 18),
(129, 10, 'receta_id', 'text', 'Receta Id', 0, 1, 1, 1, 1, 1, '{}', 16),
(130, 8, 'color', 'text', 'Color', 0, 1, 1, 1, 1, 1, '{}', 15),
(131, 8, 'material', 'text', 'Material', 0, 1, 1, 1, 1, 1, '{}', 16),
(132, 8, 'cartilla', 'text', 'Cartilla', 0, 1, 1, 1, 1, 1, '{}', 17),
(133, 8, 'tipos_lentes', 'text', 'Tipos Lentes', 0, 1, 1, 1, 1, 1, '{}', 18),
(134, 15, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(135, 15, 'nombre', 'text', 'Nombre', 0, 1, 0, 0, 0, 0, '{}', 2),
(136, 15, 'cantidad', 'text', 'Cantidad', 0, 1, 0, 0, 0, 0, '{}', 3),
(137, 15, 'precio', 'text', 'Precio', 0, 1, 0, 0, 0, 0, '{}', 4),
(138, 15, 'descuento', 'text', 'Descuento', 0, 1, 0, 0, 0, 0, '{}', 5),
(139, 15, 'total', 'text', 'Total', 0, 1, 0, 0, 0, 0, '{}', 6),
(140, 15, 'created_at', 'timestamp', 'Created At', 0, 1, 0, 0, 0, 0, '{}', 7),
(141, 15, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 8),
(142, 15, 'trabajo_id', 'text', 'Trabajo Id', 0, 0, 0, 0, 0, 0, '{}', 9),
(143, 15, 'cliente_id', 'text', 'Cliente Id', 0, 0, 0, 0, 0, 0, '{}', 10),
(144, 13, 'codigo', 'text', 'Codigo', 0, 1, 1, 1, 1, 1, '{}', 2),
(145, 13, 'marca_id', 'text', 'Marca Id', 0, 1, 1, 1, 1, 1, '{}', 12),
(146, 13, 'material_id', 'text', 'Material Id', 0, 1, 1, 1, 1, 1, '{}', 13),
(147, 13, 'articulo_belongsto_marca_relationship', 'relationship', 'Marca', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Marca\",\"table\":\"marcas\",\"type\":\"belongsTo\",\"column\":\"marca_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"articulos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 14),
(148, 13, 'articulo_belongsto_material_relationship', 'relationship', 'Material', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Material\",\"table\":\"materials\",\"type\":\"belongsTo\",\"column\":\"material_id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"articulos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 15),
(149, 15, 'venta_item_belongsto_trabajo_relationship', 'relationship', 'trabajos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Trabajo\",\"table\":\"trabajos\",\"type\":\"belongsTo\",\"column\":\"trabajo_id\",\"key\":\"deuda_cliente\",\"label\":\"id\",\"pivot_table\":\"articulos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 11),
(150, 16, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(151, 16, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(152, 16, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(153, 16, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(154, 17, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(155, 17, 'nombre', 'text', 'Nombre', 0, 1, 1, 1, 1, 1, '{}', 2),
(156, 17, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 3),
(157, 17, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 4),
(158, 13, 'unico', 'checkbox', 'Unico', 0, 1, 1, 1, 1, 1, '{\"on\":\"Unico\",\"off\":\"No\",\"checked\":false}', 17),
(159, 13, 'estado', 'select_dropdown', 'Estado', 0, 1, 1, 1, 1, 1, '{\"1\":\"Stock\",\"options\":{\"1\":\"Stock\",\"2\":\"Apartado\",\"3\":\"Entregado\"}}', 15),
(162, 15, 'articulo_id', 'text', 'Articulo Id', 0, 1, 1, 1, 1, 1, '{}', 11),
(163, 15, 'venta_item_belongsto_articulo_relationship', 'relationship', 'articulos', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Articulo\",\"table\":\"articulos\",\"type\":\"belongsTo\",\"column\":\"id\",\"key\":\"id\",\"label\":\"nombre\",\"pivot_table\":\"articulos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 12),
(164, 18, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(165, 18, 'diabetes', 'text', 'Diabetes', 0, 1, 1, 1, 1, 1, '{}', 2),
(166, 18, 'presion_arterial', 'text', 'Presion Arterial', 0, 1, 1, 1, 1, 1, '{}', 3),
(167, 18, 'ardor', 'checkbox', 'Ardor', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 4),
(168, 18, 'dolor_cabeza', 'checkbox', 'Dolor Cabeza', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 5),
(169, 18, 'irrtitacion', 'checkbox', 'Irrtitacion', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 6),
(170, 18, 'prurito', 'checkbox', 'Prurito', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 7),
(171, 18, 'sensibilidad', 'checkbox', 'Sensibilidad', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 8),
(172, 18, 'dolor_ocular', 'checkbox', 'Dolor Ocular', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 9),
(173, 18, 'sombras', 'checkbox', 'Sombras', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 10),
(174, 18, 'cataratas', 'checkbox', 'Cataratas', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 11),
(175, 18, 'glaucoma', 'checkbox', 'Glaucoma', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 12),
(176, 18, 'pterigion', 'checkbox', 'Pterigion', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 13),
(177, 18, 'vision_borrosa', 'checkbox', 'Vision Borrosa', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 14),
(178, 18, 'halos', 'checkbox', 'Halos', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 15),
(179, 18, 'deslumbra', 'checkbox', 'Deslumbra', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 16),
(180, 18, 'mareos', 'checkbox', 'Mareos', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 17),
(181, 18, 'inflamacion', 'checkbox', 'Inflamacion', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 18),
(182, 18, 'lagrimeo', 'checkbox', 'Lagrimeo', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 19),
(183, 18, 'otros', 'checkbox', 'Otros', 1, 1, 1, 1, 1, 1, '{\"on\":\"SI\",\"off\":\"NO\",\"checked\":false}', 20),
(184, 18, 'obs', 'text', 'Obs', 1, 1, 1, 1, 1, 1, '{}', 21),
(185, 18, 'motivo_consulta', 'text', 'Motivo Consulta', 1, 1, 1, 1, 1, 1, '{}', 22),
(186, 18, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 1, 0, 1, '{}', 23),
(187, 18, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 24),
(188, 18, 'cliente_id', 'text', 'Cliente Id', 0, 1, 1, 1, 1, 1, '{}', 25),
(189, 18, 'consulta_belongsto_cliente_relationship', 'relationship', 'clientes', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Cliente\",\"table\":\"clientes\",\"type\":\"belongsTo\",\"column\":\"cliente_id\",\"key\":\"id\",\"label\":\"nombres\",\"pivot_table\":\"articulos\",\"pivot\":\"0\",\"taggable\":\"0\"}', 26),
(190, 8, 'receta_belongsto_consulta_relationship', 'relationship', 'consultas', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Models\\\\Consulta\",\"table\":\"consultas\",\"type\":\"belongsTo\",\"column\":\"consulta_id\",\"key\":\"id\",\"label\":\"motivo_consulta\",\"pivot_table\":\"articulos\",\"pivot\":\"0\",\"taggable\":null}', 19),
(191, 13, 'jornada', 'checkbox', 'Jornada', 0, 1, 1, 1, 1, 1, '{\"on\":\"Jornada\",\"off\":\"Clinica\",\"checked\":false}', 16),
(192, 7, 'tutor', 'text', 'Tutor o Encargado', 0, 1, 1, 1, 1, 1, '{}', 17),
(193, 11, 'tipo', 'select_dropdown', 'Tipo', 0, 1, 1, 1, 1, 1, '{\"default\":\"Cita\",\"options\":{\"Cita\":\"Cita\",\"Consulta\":\"Consulta\"}}', 8),
(194, 19, 'id', 'text', 'Id', 1, 0, 0, 0, 0, 0, '{}', 1),
(195, 19, 'code', 'text', 'Code', 1, 1, 1, 1, 1, 1, '{}', 2),
(196, 19, 'type', 'text', 'Type', 0, 0, 0, 0, 0, 0, '{}', 3),
(197, 19, 'value', 'number', 'Value', 0, 1, 1, 1, 1, 1, '{}', 4),
(198, 19, 'data', 'text', 'Data', 0, 0, 0, 0, 0, 0, '{}', 5),
(199, 19, 'quantity', 'text', 'Quantity', 0, 1, 0, 0, 0, 0, '{}', 6),
(200, 19, 'limit', 'text', 'Limit', 0, 0, 0, 0, 0, 0, '{}', 7),
(201, 19, 'redeemer_type', 'text', 'Redeemer Type', 0, 0, 0, 0, 0, 0, '{}', 8),
(202, 19, 'redeemer_id', 'text', 'Redeemer Id', 0, 0, 0, 0, 0, 0, '{}', 9),
(203, 19, 'expires_at', 'timestamp', 'Expires At', 0, 0, 0, 0, 0, 0, '{}', 10),
(204, 19, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, '{}', 11),
(205, 19, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, '{}', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `data_types`
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
-- Volcado de datos para la tabla `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2022-11-02 02:04:29', '2022-11-02 02:04:29'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2022-11-02 02:04:29', '2022-11-02 02:04:29'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2022-11-02 02:04:29', '2022-11-02 02:04:29'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(7, 'clientes', 'clientes', 'Cliente', 'Clientes', 'voyager-shop', 'App\\Models\\Cliente', NULL, 'App\\Http\\Controllers\\ClienteController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-11-02 02:19:37', '2023-02-02 02:44:34'),
(8, 'recetas', 'recetas', 'Receta', 'Recetas', 'voyager-file-text', 'App\\Models\\Receta', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-11-03 07:56:46', '2022-11-14 00:36:09'),
(10, 'trabajos', 'trabajos', 'Trabajo', 'Trabajos', 'voyager-basket', 'App\\Models\\Trabajo', NULL, 'App\\Http\\Controllers\\TrabajoController', NULL, 1, 1, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-11-03 09:00:44', '2022-12-02 08:52:02'),
(11, 'citas', 'citas', 'Cita', 'Citas', 'voyager-calendar', 'App\\Models\\Cita', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-11-04 23:30:43', '2023-02-02 15:55:46'),
(12, 'categorias', 'categorias', 'Categoria', 'Categorias', 'voyager-archive', 'App\\Models\\Categoria', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-11-07 05:00:47', '2022-11-07 05:00:47'),
(13, 'articulos', 'articulos', 'Inventario', 'Inventario de Artículos', 'voyager-shop', 'App\\Models\\Articulo', NULL, 'App\\Http\\Controllers\\ArticuloController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-11-07 05:06:17', '2023-01-08 05:23:22'),
(15, 'venta_items', 'venta-items', 'Venta Item', 'Venta Items', 'voyager-list', 'App\\Models\\VentaItems', NULL, 'App\\Http\\Controllers\\VentaItemsController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-11-15 08:20:19', '2022-12-03 00:47:11'),
(16, 'marcas', 'marcas', 'Marca', 'Marcas', NULL, 'App\\Models\\Marca', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-11-17 09:17:42', '2022-11-17 09:17:42'),
(17, 'materials', 'materials', 'Material', 'Materials', NULL, 'App\\Models\\Material', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2022-11-17 09:18:25', '2022-11-17 09:18:25'),
(18, 'consultas', 'consultas', 'Consulta', 'Consultas', 'voyager-window-list', 'App\\Models\\Consulta', NULL, 'App\\Http\\Controllers\\ConsultaController', NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2022-12-09 07:40:04', '2022-12-09 18:13:02'),
(19, 'coupons', 'coupons', 'Coupon', 'Coupons', NULL, 'App\\Models\\Coupon', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2023-02-11 22:06:58', '2023-02-11 16:24:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `fanpages`
--

CREATE TABLE `fanpages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `page_id` longtext DEFAULT NULL,
  `token` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materials`
--

CREATE TABLE `materials` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `materials`
--

INSERT INTO `materials` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Metal', '2022-11-17 09:18:43', '2022-11-17 09:18:43'),
(2, 'Plastico', '2022-11-17 09:18:52', '2022-11-17 09:18:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2022-11-02 02:04:30', '2022-11-02 02:04:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_items`
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
-- Volcado de datos para la tabla `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2022-11-02 02:04:30', '2022-11-02 02:04:30', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, 24, 5, '2022-11-02 02:04:30', '2022-12-03 01:59:41', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, 24, 1, '2022-11-02 02:04:30', '2022-12-03 01:59:41', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, 24, 6, '2022-11-02 02:04:30', '2022-12-03 01:59:41', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, 24, 11, '2022-11-02 02:04:30', '2022-12-08 01:39:12', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 24, 7, '2022-11-02 02:04:30', '2022-12-08 01:39:07', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 24, 8, '2022-11-02 02:04:30', '2022-12-08 01:39:09', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 24, 9, '2022-11-02 02:04:30', '2022-12-08 01:39:11', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 24, 10, '2022-11-02 02:04:30', '2022-12-08 01:39:12', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, 24, 12, '2022-11-02 02:04:30', '2022-12-08 01:39:12', 'voyager.settings.index', NULL),
(11, 1, 'Categories', '', '_self', 'voyager-categories', NULL, 24, 2, '2022-11-02 02:04:30', '2022-12-03 01:59:41', 'voyager.categories.index', NULL),
(12, 1, 'Posts', '', '_self', 'voyager-news', NULL, 24, 4, '2022-11-02 02:04:30', '2022-12-03 01:59:41', 'voyager.posts.index', NULL),
(13, 1, 'Pages', '', '_self', 'voyager-file-text', NULL, 24, 3, '2022-11-02 02:04:31', '2022-12-03 01:59:41', 'voyager.pages.index', NULL),
(14, 1, 'Clientes', '', '_self', 'voyager-people', '#000000', NULL, 2, '2022-11-02 02:19:37', '2022-12-21 19:31:36', 'voyager.clientes.index', 'null'),
(15, 1, 'Recetas', '', '_self', 'voyager-receipt', '#000000', NULL, 5, '2022-11-03 07:56:46', '2022-12-21 19:34:48', 'voyager.recetas.index', 'null'),
(16, 1, 'Trabajos', '', '_self', 'voyager-window-list', '#000000', NULL, 4, '2022-11-03 09:00:44', '2022-12-21 19:34:28', 'voyager.trabajos.index', 'null'),
(17, 1, 'Citas', '', '_self', 'voyager-calendar', '#000000', NULL, 3, '2022-11-04 23:30:43', '2022-12-21 19:32:16', 'voyager.citas.index', 'null'),
(18, 1, 'Categorias', '', '_self', 'voyager-archive', NULL, 19, 2, '2022-11-07 05:00:47', '2022-12-03 02:00:22', 'voyager.categorias.index', NULL),
(19, 1, 'Inventario', '', '_self', 'voyager-shop', '#000000', NULL, 6, '2022-11-07 05:06:17', '2022-12-03 02:00:22', 'voyager.articulos.index', 'null'),
(20, 1, 'Ventas', '', '_self', 'voyager-bar-chart', '#000000', NULL, 7, '2022-11-15 08:20:19', '2022-12-21 19:36:24', 'voyager.venta-items.index', 'null'),
(21, 1, 'Marcas', '', '_self', NULL, NULL, 19, 3, '2022-11-17 09:17:42', '2022-12-03 02:00:22', 'voyager.marcas.index', NULL),
(22, 1, 'Materials', '', '_self', NULL, NULL, 19, 4, '2022-11-17 09:18:25', '2022-12-03 02:00:22', 'voyager.materials.index', NULL),
(23, 1, 'Artículos de Inventario', '', '_self', NULL, '#000000', 19, 1, '2022-12-02 06:13:55', '2022-12-02 06:14:13', 'voyager.articulos.index', NULL),
(24, 1, 'Administración', '', '_self', 'voyager-settings', '#ffc800', NULL, 9, '2022-12-03 01:58:03', '2022-12-21 19:38:05', NULL, ''),
(25, 1, 'Consultas', '', '_self', 'voyager-window-list', NULL, NULL, 8, '2022-12-09 07:40:04', '2022-12-21 19:38:05', 'voyager.consultas.index', NULL),
(26, 1, 'Coupons', '', '_self', NULL, NULL, NULL, 10, '2023-02-11 22:06:58', '2023-02-11 22:06:58', 'voyager.coupons.index', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2),
(29, '2023_02_11_155532_create_coupons_table', 3),
(30, '2023_02_11_155533_create_couponables_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2022-11-02 02:04:31', '2022-11-02 02:04:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(2, 'browse_bread', NULL, '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(3, 'browse_database', NULL, '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(4, 'browse_media', NULL, '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(5, 'browse_compass', NULL, '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(6, 'browse_menus', 'menus', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(7, 'read_menus', 'menus', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(8, 'edit_menus', 'menus', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(9, 'add_menus', 'menus', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(10, 'delete_menus', 'menus', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(11, 'browse_roles', 'roles', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(12, 'read_roles', 'roles', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(13, 'edit_roles', 'roles', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(14, 'add_roles', 'roles', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(15, 'delete_roles', 'roles', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(16, 'browse_users', 'users', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(17, 'read_users', 'users', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(18, 'edit_users', 'users', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(19, 'add_users', 'users', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(20, 'delete_users', 'users', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(21, 'browse_settings', 'settings', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(22, 'read_settings', 'settings', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(23, 'edit_settings', 'settings', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(24, 'add_settings', 'settings', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(25, 'delete_settings', 'settings', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(26, 'browse_categories', 'categories', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(27, 'read_categories', 'categories', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(28, 'edit_categories', 'categories', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(29, 'add_categories', 'categories', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(30, 'delete_categories', 'categories', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(31, 'browse_posts', 'posts', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(32, 'read_posts', 'posts', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(33, 'edit_posts', 'posts', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(34, 'add_posts', 'posts', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(35, 'delete_posts', 'posts', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(36, 'browse_pages', 'pages', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(37, 'read_pages', 'pages', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(38, 'edit_pages', 'pages', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(39, 'add_pages', 'pages', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(40, 'delete_pages', 'pages', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(41, 'browse_clientes', 'clientes', '2022-11-02 02:19:37', '2022-11-02 02:19:37'),
(42, 'read_clientes', 'clientes', '2022-11-02 02:19:37', '2022-11-02 02:19:37'),
(43, 'edit_clientes', 'clientes', '2022-11-02 02:19:37', '2022-11-02 02:19:37'),
(44, 'add_clientes', 'clientes', '2022-11-02 02:19:37', '2022-11-02 02:19:37'),
(45, 'delete_clientes', 'clientes', '2022-11-02 02:19:37', '2022-11-02 02:19:37'),
(46, 'browse_recetas', 'recetas', '2022-11-03 07:56:46', '2022-11-03 07:56:46'),
(47, 'read_recetas', 'recetas', '2022-11-03 07:56:46', '2022-11-03 07:56:46'),
(48, 'edit_recetas', 'recetas', '2022-11-03 07:56:46', '2022-11-03 07:56:46'),
(49, 'add_recetas', 'recetas', '2022-11-03 07:56:46', '2022-11-03 07:56:46'),
(50, 'delete_recetas', 'recetas', '2022-11-03 07:56:46', '2022-11-03 07:56:46'),
(51, 'browse_trabajos', 'trabajos', '2022-11-03 09:00:44', '2022-11-03 09:00:44'),
(52, 'read_trabajos', 'trabajos', '2022-11-03 09:00:44', '2022-11-03 09:00:44'),
(53, 'edit_trabajos', 'trabajos', '2022-11-03 09:00:44', '2022-11-03 09:00:44'),
(54, 'add_trabajos', 'trabajos', '2022-11-03 09:00:44', '2022-11-03 09:00:44'),
(55, 'delete_trabajos', 'trabajos', '2022-11-03 09:00:44', '2022-11-03 09:00:44'),
(56, 'browse_citas', 'citas', '2022-11-04 23:30:43', '2022-11-04 23:30:43'),
(57, 'read_citas', 'citas', '2022-11-04 23:30:43', '2022-11-04 23:30:43'),
(58, 'edit_citas', 'citas', '2022-11-04 23:30:43', '2022-11-04 23:30:43'),
(59, 'add_citas', 'citas', '2022-11-04 23:30:43', '2022-11-04 23:30:43'),
(60, 'delete_citas', 'citas', '2022-11-04 23:30:43', '2022-11-04 23:30:43'),
(61, 'browse_categorias', 'categorias', '2022-11-07 05:00:47', '2022-11-07 05:00:47'),
(62, 'read_categorias', 'categorias', '2022-11-07 05:00:47', '2022-11-07 05:00:47'),
(63, 'edit_categorias', 'categorias', '2022-11-07 05:00:47', '2022-11-07 05:00:47'),
(64, 'add_categorias', 'categorias', '2022-11-07 05:00:47', '2022-11-07 05:00:47'),
(65, 'delete_categorias', 'categorias', '2022-11-07 05:00:47', '2022-11-07 05:00:47'),
(66, 'browse_articulos', 'articulos', '2022-11-07 05:06:17', '2022-11-07 05:06:17'),
(67, 'read_articulos', 'articulos', '2022-11-07 05:06:17', '2022-11-07 05:06:17'),
(68, 'edit_articulos', 'articulos', '2022-11-07 05:06:17', '2022-11-07 05:06:17'),
(69, 'add_articulos', 'articulos', '2022-11-07 05:06:17', '2022-11-07 05:06:17'),
(70, 'delete_articulos', 'articulos', '2022-11-07 05:06:17', '2022-11-07 05:06:17'),
(71, 'browse_venta_items', 'venta_items', '2022-11-15 08:20:19', '2022-11-15 08:20:19'),
(72, 'read_venta_items', 'venta_items', '2022-11-15 08:20:19', '2022-11-15 08:20:19'),
(73, 'edit_venta_items', 'venta_items', '2022-11-15 08:20:19', '2022-11-15 08:20:19'),
(74, 'add_venta_items', 'venta_items', '2022-11-15 08:20:19', '2022-11-15 08:20:19'),
(75, 'delete_venta_items', 'venta_items', '2022-11-15 08:20:19', '2022-11-15 08:20:19'),
(76, 'browse_marcas', 'marcas', '2022-11-17 09:17:42', '2022-11-17 09:17:42'),
(77, 'read_marcas', 'marcas', '2022-11-17 09:17:42', '2022-11-17 09:17:42'),
(78, 'edit_marcas', 'marcas', '2022-11-17 09:17:42', '2022-11-17 09:17:42'),
(79, 'add_marcas', 'marcas', '2022-11-17 09:17:42', '2022-11-17 09:17:42'),
(80, 'delete_marcas', 'marcas', '2022-11-17 09:17:42', '2022-11-17 09:17:42'),
(81, 'browse_materials', 'materials', '2022-11-17 09:18:25', '2022-11-17 09:18:25'),
(82, 'read_materials', 'materials', '2022-11-17 09:18:25', '2022-11-17 09:18:25'),
(83, 'edit_materials', 'materials', '2022-11-17 09:18:25', '2022-11-17 09:18:25'),
(84, 'add_materials', 'materials', '2022-11-17 09:18:25', '2022-11-17 09:18:25'),
(85, 'delete_materials', 'materials', '2022-11-17 09:18:25', '2022-11-17 09:18:25'),
(86, 'browse_consultas', 'consultas', '2022-12-09 07:40:04', '2022-12-09 07:40:04'),
(87, 'read_consultas', 'consultas', '2022-12-09 07:40:04', '2022-12-09 07:40:04'),
(88, 'edit_consultas', 'consultas', '2022-12-09 07:40:04', '2022-12-09 07:40:04'),
(89, 'add_consultas', 'consultas', '2022-12-09 07:40:04', '2022-12-09 07:40:04'),
(90, 'delete_consultas', 'consultas', '2022-12-09 07:40:04', '2022-12-09 07:40:04'),
(91, 'browse_coupons', 'coupons', '2023-02-11 22:06:58', '2023-02-11 22:06:58'),
(92, 'read_coupons', 'coupons', '2023-02-11 22:06:58', '2023-02-11 22:06:58'),
(93, 'edit_coupons', 'coupons', '2023-02-11 22:06:58', '2023-02-11 22:06:58'),
(94, 'add_coupons', 'coupons', '2023-02-11 22:06:58', '2023-02-11 22:06:58'),
(95, 'delete_coupons', 'coupons', '2023-02-11 22:06:58', '2023-02-11 22:06:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
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
(41, 2),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(44, 1),
(44, 2),
(45, 1),
(45, 2),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(56, 1),
(56, 2),
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(59, 2),
(60, 1),
(60, 2),
(61, 1),
(61, 2),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(66, 2),
(67, 1),
(67, 2),
(68, 1),
(68, 2),
(69, 1),
(69, 2),
(70, 1),
(70, 2),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(3, 1, 1, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts\\November2022\\wAEnQvKawpaEmWrUTssi.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-11-02 02:04:30', '2022-11-27 03:23:43'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2022-11-02 02:04:31', '2022-11-02 02:04:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

CREATE TABLE `recetas` (
  `id` int(10) UNSIGNED NOT NULL,
  `od_esf` float DEFAULT NULL,
  `od_cil` float DEFAULT NULL,
  `od_eje` float DEFAULT NULL,
  `od_add` float DEFAULT NULL,
  `oi_esf` float DEFAULT NULL,
  `oi_cil` float DEFAULT NULL,
  `oi_eje` float DEFAULT NULL,
  `oi_add` float DEFAULT NULL,
  `dip` float DEFAULT NULL,
  `notas` varchar(255) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `material` varchar(255) DEFAULT NULL,
  `cartilla` varchar(255) DEFAULT NULL,
  `tipos_lentes` int(11) DEFAULT NULL,
  `consulta_id` bigint(20) DEFAULT NULL,
  `cartilla_oi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2022-11-02 02:04:30', '2022-11-02 02:04:30'),
(2, 'user', 'Normal User', '2022-11-02 02:04:30', '2022-11-02 02:04:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings`
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
-- Volcado de datos para la tabla `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Oprifuturo', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'tus lentes, tu estilo, con Sentido Social', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings/December2022/LUxcavLg9xT3LtTeYjFp.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', 'settings/December2022/VwbLsZGsio1TG62aiaxQ.png', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Optifuturo', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Optica', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings/December2022/wdbjEmT6pHreujyArYD0.gif', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings/December2022/pNcxkoLz2v8balqX6dDn.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin'),
(11, 'site.direccion', 'Direccion', '1era. Avenida 4-35 Zona 3 Fraijanes', NULL, 'text', 6, 'Site'),
(15, 'site.telefono', 'Teléfono', '66378500', NULL, 'text', 7, 'Site'),
(16, 'site.facebook', 'Facebook', 'https://www.facebook.com/OptifuturoFR', NULL, 'text', 10, 'Site'),
(17, 'site.email', 'Email', 'info@optifuturo.com', NULL, 'text', 8, 'Site'),
(18, 'site.whatsapp', 'WhatsApp', '5539 9766', NULL, 'text', 9, 'Site'),
(19, 'site.instagram', 'Instagram', NULL, NULL, 'text', 11, 'Site');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajos`
--

CREATE TABLE `trabajos` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `pago_cliente` float DEFAULT NULL,
  `extra_cliente` int(11) DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `dias_atraso` int(11) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `metodo_pago` varchar(255) DEFAULT NULL,
  `descuento_venta` float DEFAULT NULL,
  `total_cuenta` float DEFAULT NULL,
  `deuda_cliente` float DEFAULT NULL,
  `debe_cliente` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `receta_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `trabajos`
--

INSERT INTO `trabajos` (`id`, `cliente_id`, `pago_cliente`, `extra_cliente`, `fecha_venta`, `fecha_entrega`, `dias_atraso`, `estado`, `metodo_pago`, `descuento_venta`, `total_cuenta`, `deuda_cliente`, `debe_cliente`, `created_at`, `updated_at`, `receta_id`) VALUES
(20, 6, 10, NULL, '2023-02-01', '2023-02-11', NULL, 1, 'Efectivo', 0, 30, 0, NULL, '2023-02-01 01:01:11', '2023-02-01 01:32:20', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `translations`
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

--
-- Volcado de datos para la tabla `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2022-11-02 02:04:31', '2022-11-02 02:04:31'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2022-11-02 02:04:31', '2022-11-02 02:04:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `facebook_app_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`, `token`, `facebook_app_id`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/December2022/TjezupSdv4UQmcQXaJhB.png', NULL, '$2y$10$5qbc9DkbbORlDdpdoTP8qeuXECMTVFKRbQyL/8phHEPd.ipa9lZ1C', '9Us7j3ptsNglBluXYjQKPSHE0Zmt2f0TNAxhCfODVB1s1cK2vhxWaqjOzhFK', '{\"locale\":\"es\"}', '2022-11-02 02:04:30', '2022-12-22 12:45:52', '', ''),
(2, 2, 'user', 'user@user.com', 'users/default.png', NULL, '$2y$10$SyoMCeFNfXkCmZOtIe2xa.pZ0SKauxQpbl074wgwRjskp6WC.Hs1W', NULL, '{\"locale\":\"es\"}', '2022-11-11 08:52:53', '2022-11-11 08:52:53', NULL, NULL),
(3, 1, 'Oscar Lopez', 'infovideogala@gmail.com', 'users/default.png', NULL, '$2y$10$EYqgSH8LjDPmgoKiTvQg6uGs/xSUO3PQaMayzV8Npa3Yu2x0VOFYW', NULL, '{\"locale\":\"es\"}', '2023-01-12 17:44:22', '2023-01-12 17:44:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_items`
--

CREATE TABLE `venta_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `trabajo_id` bigint(20) DEFAULT NULL,
  `cliente_id` bigint(20) DEFAULT NULL,
  `articulo_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `venta_items`
--

INSERT INTO `venta_items` (`id`, `nombre`, `cantidad`, `precio`, `descuento`, `total`, `created_at`, `updated_at`, `trabajo_id`, `cliente_id`, `articulo_id`) VALUES
(19, 'proteccion solar', 1, 125, 0, 125, '2022-11-30 02:30:08', '2022-11-30 02:30:08', 14, 2, 4),
(20, 'Aros rojos', 1, 125, 0, 125, '2022-11-30 02:30:08', '2022-11-30 02:30:08', 14, 2, 2),
(21, 'Abono', 1, 150, NULL, 150, '2022-11-30 02:48:55', '2022-11-30 02:48:55', 14, 2, NULL),
(22, 'Aros plateado', 1, 20.55, 0, 20.55, '2022-11-30 02:57:15', '2022-11-30 02:57:15', 15, 2, 5),
(23, 'Abono', 1, 0.55, NULL, 0.55, '2022-12-09 06:55:11', '2022-12-09 06:55:11', 15, 2, NULL),
(24, 'Abono', 1, 0.55, NULL, 0.55, '2022-12-29 00:43:03', '2022-12-29 00:43:03', 16, 3, NULL),
(25, 'proteccion solar', 1, 125, 0, 125, '2023-01-04 19:01:35', '2023-01-04 19:01:35', NULL, NULL, 4),
(26, 'proteccion solar', 2, 125, 0, 125, '2023-01-04 19:33:37', '2023-01-04 19:33:37', NULL, NULL, 4),
(27, 'proteccion solar', 3, 125, 0, 125, '2023-01-04 19:36:44', '2023-01-04 19:36:44', NULL, NULL, 4),
(28, 'proteccion solar', 1, 125, 0, 125, '2023-01-04 19:45:05', '2023-01-04 19:45:05', NULL, NULL, 4),
(29, 'proteccion solar', 1, 125, 0, 125, '2023-01-08 02:58:58', '2023-01-08 02:58:58', 17, 1, 4),
(30, 'proteccion solar', 1, 125, 0, 125, '2023-01-08 05:19:21', '2023-01-08 05:19:21', 18, 1, 4),
(31, 'Consulta', 1, 30, 5, 25, '2023-01-09 03:53:03', '2023-01-09 03:53:03', 19, 4, 5),
(32, 'Consulta', 1, 30, 0, 30, '2023-01-09 03:56:52', '2023-01-09 03:56:52', NULL, NULL, 5),
(33, 'Consulta', 1, 30, 0, 30, '2023-02-01 01:01:11', '2023-02-01 01:01:11', 20, 6, 5),
(34, 'Abono', 1, 20, NULL, 20, '2023-02-01 01:32:08', '2023-02-01 01:32:08', 20, 6, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `couponables`
--
ALTER TABLE `couponables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `couponables_coupon_id_foreign` (`coupon_id`),
  ADD KEY `couponables_couponable_type_couponable_id_index` (`couponable_type`,`couponable_id`),
  ADD KEY `couponables_redeemed_type_redeemed_id_index` (`redeemed_type`,`redeemed_id`);

--
-- Indices de la tabla `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_redeemer_type_redeemer_id_index` (`redeemer_type`,`redeemer_id`);

--
-- Indices de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indices de la tabla `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `fanpages`
--
ALTER TABLE `fanpages`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indices de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indices de la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indices de la tabla `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indices de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- Indices de la tabla `venta_items`
--
ALTER TABLE `venta_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `couponables`
--
ALTER TABLE `couponables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT de la tabla `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fanpages`
--
ALTER TABLE `fanpages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `materials`
--
ALTER TABLE `materials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta_items`
--
ALTER TABLE `venta_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `couponables`
--
ALTER TABLE `couponables`
  ADD CONSTRAINT `couponables_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
