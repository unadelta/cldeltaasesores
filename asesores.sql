-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-09-2026 a las 02:38:42
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.0.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `asesores`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_carrera` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_carrera` varchar(250) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES
(1, 'V-24119980', 'RODRIGUEZ CASCON ALONSO ISAAC', '440', 'Educación Integral'),
(2, 'V-28766928', 'RIVERO CUENCE KATERIN DEL VALLE', '236', 'Ingeniería de Sistemas'),
(3, 'V-6823400', 'UBAN LEGNY TERESA', '280', 'Ingeniería Industrial'),
(4, 'V-13401660', 'CALDERON QUIVAS REINALDO RAMON', '610', 'Licenciatura en Administración - Mención Empresas '),
(5, 'V-18387899', 'MARTINEZ ROXDELIS ELENIZA', '610', 'Licenciatura en Administración - Mención Empresas '),
(6, 'V-31105291', 'FERNIN TOLEDO DANIEL JOSUE', '236', 'Ingeniería de Sistemas'),
(8, 'V-06823400', 'UBAN LEGNY TERESA', '280', 'Ingeniería Industrial'),
(9, 'V-08952715', 'MEDRANO BELLORIN JULIAN JOSE', '508', 'Licenciatura en Educación mención Educación Matemática'),
(10, 'V-11206309', 'ABREU MENDOZA ELADIO JESUS', '610', 'Licenciatura en Administración - Mención Empresas Comerciales'),
(11, 'V-15200799', 'TRUJILLO SANDRA PATRICIA', '542', 'Licenciatura en Educación mención Preescolar'),
(12, 'V-16221653', 'PARRA PEREIRA JOSE MIGUEL', '612', 'Licenciatura en Administración - Mención Recursos Humanos'),
(13, 'V-16613709', 'VILLANUEVA RASSE ADRIANA DEL VALLE', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(14, 'V-16699180', 'GIOVETTI YPLANDA MARGARITA', '612', 'Licenciatura en Administración - Mención Recursos Humanos'),
(15, 'V-19140953', 'CEQUEA FRANCO MARYOLI DE LAS', '612', 'Licenciatura en Administración - Mención Recursos Humanos'),
(16, 'V-19403195', 'MENDOZA MARCANO FRANCIS JHOALY', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(17, 'V-23725487', 'VILLAREAL QUINTERO MONICA MARIA', '542', 'Licenciatura en Educación mención Preescolar'),
(18, 'V-21198540', 'BELLORIN TORRES VIVIANA YUBEL', '542', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesor`
--

CREATE TABLE `asesor` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `asesor`
--

INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES
(2, '13403217', 'Yorbeydis Dicuru', 'yor', '123456', 'y.dsarabia@gmail.com', 1),
(4, '13546726', 'Isabela Marin', 'Imarin', '123456', 'Imarin@gmail.com', 2),
(3, '9858268', 'Nidia Sarabia', 'nsarabia', '123456', 'nsarabia@gmail.com', 2),
(1, '9858269', 'Matias Sarabia', 'msarabia', '123456', 'jsarabia222gmail.com', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesor_carrera`
--

CREATE TABLE `asesor_carrera` (
  `asesor_cedula` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `carrera_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

CREATE TABLE `calificaciones` (
  `id` int(11) NOT NULL,
  `cod_materia` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `peso_acumulado` int(11) DEFAULT NULL,
  `calificacion_definitiva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `calificaciones`
--

INSERT INTO `calificaciones` (`id`, `cod_materia`, `peso_acumulado`, `calificacion_definitiva`) VALUES
(6, '116', 6, 1),
(7, '116', 7, 2),
(8, '116', 8, 4),
(9, '116', 10, 8),
(10, '116', 11, 10),
(11, '107', 1, 2),
(12, '107', 2, 3),
(13, '107', 3, 5),
(14, '107', 4, 6),
(15, '107', 5, 8),
(16, '107', 6, 10),
(17, '300', 1, 2),
(18, '300', 2, 3),
(19, '300', 3, 5),
(20, '300', 4, 6),
(21, '300', 5, 8),
(22, '300', 6, 10),
(23, '315', 8, 1),
(24, '315', 9, 2),
(25, '315', 10, 3),
(26, '315', 11, 12),
(27, '315', 12, 5),
(28, '315', 13, 6),
(29, '315', 14, 7),
(30, '315', 15, 8),
(31, '315', 16, 9),
(32, '315', 17, 10),
(43, '323', 19, 2),
(44, '323', 21, 2),
(45, '323', 22, 3),
(46, '323', 24, 4),
(47, '323', 25, 5),
(48, '323', 26, 6),
(49, '323', 28, 7),
(50, '323', 29, 8),
(51, '323', 31, 9),
(52, '323', 32, 10),
(70, '327', 6, 1),
(71, '327', 7, 2),
(72, '327', 8, 3),
(73, '327', 9, 4),
(74, '327', 10, 5),
(75, '327', 11, 6),
(76, '327', 12, 7),
(77, '327', 13, 8),
(78, '327', 15, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_107`
--

CREATE TABLE `calificacion_107` (
  `id` int(11) NOT NULL,
  `nombre_alumno` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_alumno` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_asesor` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `semestre` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_116`
--

CREATE TABLE `calificacion_116` (
  `id` int(11) NOT NULL,
  `nombre_alumno` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_alumno` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_asesor` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `semestre` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_300`
--

CREATE TABLE `calificacion_300` (
  `id` int(11) NOT NULL,
  `nombre_alumno` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_alumno` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_asesor` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `semestre` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_315`
--

CREATE TABLE `calificacion_315` (
  `id` int(11) NOT NULL,
  `nombre_alumno` varchar(150) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_alumno` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `cedula_asesor` varchar(30) COLLATE utf8mb4_spanish_ci NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `obj7` decimal(5,2) DEFAULT '0.00',
  `obj8` decimal(5,2) DEFAULT '0.00',
  `obj9` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) COLLATE utf8mb4_spanish_ci DEFAULT '',
  `semestre` varchar(50) COLLATE utf8mb4_spanish_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_323`
--

CREATE TABLE `calificacion_323` (
  `id` int(11) NOT NULL,
  `nombre_alumno` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_alumno` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_asesor` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) COLLATE utf8_spanish_ci DEFAULT '',
  `semestre` varchar(50) COLLATE utf8_spanish_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `calificacion_323`
--

INSERT INTO `calificacion_323` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES
(5, 'MARTINEZ ROXDELIS ELENIZA', 'V-18387899', '9858269', '1.00', '1.00', '1.00', '1.00', '0.00', '1.00', '6.00', 'Seis', '2026-2'),
(6, 'FERNIN TOLEDO DANIEL JOSUE', 'V-31105291', '9858269', '0.00', '1.00', '1.00', '1.00', '1.00', '1.00', '8.00', 'Ocho', '2026-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_327`
--

CREATE TABLE `calificacion_327` (
  `id` int(11) NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `obj7` decimal(5,2) DEFAULT '0.00',
  `obj8` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion_327`
--

INSERT INTO `calificacion_327` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `obj7`, `obj8`, `nota_final`, `nota_final_letra`, `semestre`) VALUES
(15, 'CEQUEA FRANCO MARYOLI DE LAS', 'V-19140953', '9858269', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_carrera` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES
(1, '106', 'Licenciatura en Educación - Mención Dificultades del Aprendizaje'),
(2, '107', 'Licenciatura en Educación - Mención Preescolar'),
(3, '108', 'Licenciatura en Educación - Mención Matemática'),
(4, '111', 'Licenciatura en Educación - Mención Integral'),
(6, '280', 'Ingeniería Industrial'),
(7, '340', 'T.S.U. en Administración de Empresas Comerciales'),
(8, '610', 'Licenciatura en Administración - Mención Empresas Comerciales'),
(9, '612', 'Licenciatura en Administración - Mención Recursos Humanos'),
(10, '613', 'Licenciatura en Administración - Mención Contaduría'),
(11, '000', 'Ciclo Introductorio'),
(12, '126', 'Licenciatura en Matemática'),
(13, '236', 'Ingeniería de Sistemas'),
(14, '237', 'T.S.U. Mantenimiento de Sistemas Informáticos'),
(15, '280', 'Ingeniería Industrial'),
(16, '281', 'T.S.U. Higiene y Seguridad Industrial'),
(17, '508', 'Licenciatura en Educación mención Educación Matemática'),
(18, '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(19, '542', 'Licenciatura en Educación mención Preescolar'),
(20, '610', 'Licenciatura en Contaduría Pública'),
(21, '612', 'Licenciatura en Administración de Empresas'),
(22, '613', 'Licenciatura en Administración de Empresas mención Riesgos y Seguros'),
(23, '430', 'Técnico Superior Universitario (TSU) en Educación IntegraL'),
(24, '440', 'EDUCACION INTEGRAL'),
(25, '116', 'Introducción a la informática');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_asesoria`
--

CREATE TABLE `control_asesoria` (
  `id` int(11) NOT NULL,
  `cedula_alumno` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_alumno` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_carrera` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_asesoria` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `codigo_materia` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `cedula_asesor` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nombre_asesor` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_hora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `control_asesoria`
--

INSERT INTO `control_asesoria` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `tipo_asesoria`, `codigo_materia`, `cedula_asesor`, `nombre_asesor`, `fecha_hora`) VALUES
(1, 'V-19403195', 'MENDOZA MARCANO FRANCIS JHOALY', '521 - Licenciatura e', 'EN LINEA', '59', '9858269', 'matias sarabia', '2026-08-09 17:57:36'),
(2, 'V-28766928', 'RIVERO CUENCE KATERIN DEL VALLE', '236 - Ingeniería de ', 'EN LINEA', '508', '9858269', 'matias sarabia', '2026-08-09 23:52:25'),
(3, 'V-6823400', 'UBAN LEGNY TERESA', '280 - Ingeniería Ind', 'VIRTUAL', '205', '9858269', 'matias sarabia', '2026-08-13 10:31:57'),
(4, 'V-13401660', 'CALDERON QUIVAS REINALDO RAMON', '610 - Licenciatura e', 'EN LINEA', '238', '9858269', 'matias sarabia', '2026-08-13 11:27:19'),
(5, 'V-18387899', 'MARTINEZ ROXDELIS ELENIZA', '610 - Licenciatura e', 'VIRTUAL', '522', '9858269', 'matias sarabia', '2026-08-13 12:22:08'),
(6, 'V-21198540', 'BELLORIN TORRES VIVIANA YUBEL', '542 - ', 'CLASE MAGISTRAL', '465', '9858269', 'Matias Sarabia', '2026-09-03 10:37:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_correcciones`
--

CREATE TABLE `control_correcciones` (
  `id` int(11) NOT NULL,
  `cedula_alumno` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_alumno` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_carrera` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_materia` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_correccion` enum('TP','TSP','TG') COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula_asesor` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_asesor` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `control_correcciones`
--

INSERT INTO `control_correcciones` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `codigo_materia`, `tipo_correccion`, `cedula_asesor`, `nombre_asesor`, `fecha`) VALUES
(4, 'V-16613709', 'VILLANUEVA RASSE ADRIANA DEL VALLE', '521', '57', 'TP', '9858269', 'Matias Sarabia', '2026-09-02 18:27:09'),
(5, 'V-18387899', 'MARTINEZ ROXDELIS ELENIZA', '610', '333', 'TP', '9858269', 'Matias Sarabia', '2026-09-02 23:27:12'),
(7, 'V-08952715', 'MEDRANO BELLORIN JULIAN JOSE', '508', '56', 'TP', '9858269', 'Matias Sarabia', '2026-09-02 19:18:23'),
(9, 'V-16699180', 'GIOVETTI YPLANDA MARGARITA', '612', '236', 'TSP', '9858269', 'Matias Sarabia', '2026-09-02 20:23:39'),
(10, 'V-23725487', 'VILLAREAL QUINTERO MONICA MARIA', '542', '814', 'TG', '9858269', 'Matias Sarabia', '2026-09-03 14:35:11'),
(11, 'V-19403195', 'MENDOZA MARCANO FRANCIS JHOALY', '521', '120', 'TP', '9858269', 'Matias Sarabia', '2026-09-03 15:07:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `numobj` int(11) NOT NULL,
  `minaprueba` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`) VALUES
(3, '107', 'Lógica', 6, '4.00'),
(1, '116', 'Introducción a la informática', 6, '9.00'),
(4, '300', 'Fisica', 6, '4.00'),
(5, '315', 'Investigación de operaciones', 9, '13.00'),
(6, '323', 'Computación I', 6, '26.00'),
(7, '327', 'INTRODUCCIÓN A LA INGENIERÍA DE SISTEMAS', 5, '11.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia_una`
--

CREATE TABLE `materia_una` (
  `id` int(11) NOT NULL,
  `codigo` varchar(6) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `materia_una`
--

INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`) VALUES
(1, '50', 'EDUCACION INICIAL'),
(2, '51', 'SALUD ALTERACIONES Y PREVENCIÓN EN EDUCACIÓN INI'),
(3, '52', 'DESARROLLO DEL NIÑO DE 0 A 3 AÑOS'),
(4, '53', 'DESARROLLO PSICOMOTOR EN EDUCACION INICIAL'),
(5, '54', 'DESARROLLO COGNOSCITIVO DEL NIÑO DE 4 A 7 AÑOS'),
(6, '55', 'PRÁCTICA I DESARROLLO DEL NIÑO DE 0 A 3 AÑOS'),
(7, '56', 'EVALUACIÓN Y PLANIFICACIÓN EN EDUCACIÓN INICIAL'),
(8, '57', 'DESARROLLO SOCIAL Y EMOCIONAL DEL NIÑO DE 4 A 7 AN'),
(9, '58', 'LA FAMILIA, LA COMUNIDAD Y EL NIÑO EN EDUCACIÓN IN'),
(10, '59', 'PRÁCTICA II DESARROLLO COGNOSCITIVO, SOCIOEMOCI'),
(11, '60', 'CREATIVIDAD EN EDUCACIÓN INICIAL'),
(12, '61', 'PRÁCTICA III EL MAESTRO EN AULA'),
(13, '62', 'EXPRESIÓN Y CULTURA EN EDUCACIÓN INICIAL'),
(14, '63', 'SOLUCIÓN A PROBLEMAS EDUCATIVOS EN EDUCACIÓN IN'),
(15, '64', 'PRACTICA IV PROCESOS ADMINISTRATIVOS EN CENTROS'),
(16, '106', 'PRESENTACION A LA FISICA'),
(17, '107', 'LÓGICA'),
(18, '108', 'INGLES'),
(19, '115', 'LENGUA Y COMUNICACIÓN'),
(20, '116', 'INTRODUCCIÓN A LA INFORMATICA'),
(21, '117', 'AMBIENTE Y DESARROLLO SOSTENIBLE EN VENEZUELA'),
(22, '118', 'METODOLOGIA DE LA INVESTIGACION'),
(23, '119', 'TEMAS DE ETICA'),
(24, '120', 'LENGUA Y COMUNICACION EN EDUCACION'),
(25, '121', 'PROBLEMÁTICA DEL DESARROLLO VENEZOLANO'),
(26, '122', 'INTRODUCCIÓN A LA HERMENEUTICA'),
(27, '126', 'INTRODUCCION A LA INVESTIGACION'),
(28, '175', 'MATEMATICA I'),
(29, '177', 'MATEMATICA I'),
(30, '179', 'MATEMATICA II'),
(31, '200', 'INTRODUCCIÓN A LA INGENIERÍA INDUSTRIAL'),
(32, '201', 'SEGURIDAD E HIGIENE INDUSTRIAL'),
(33, '202', 'PROCESOS DE MANUFACTURAS'),
(34, '203', 'CONTROL DE PRODUCCIÓN'),
(35, '204', 'MANEJO DE MATERIALES'),
(36, '205', 'CONTROL DE CALIDAD'),
(37, '206', 'INGENIERIA DE METODOS'),
(38, '207', 'MANTENIMIENTO INDUSTRIAL'),
(39, '208', 'DIBUJO INDUSTRIAL'),
(40, '209', 'QUIMICA'),
(41, '216', 'INGENIERIA DE PLANTA'),
(42, '222', 'ECONOMÍA PARA INGENIEROS'),
(43, '223', 'GERENCIA INDUSTRIAL'),
(44, '225', 'EVALUACION DE PROYECTOS'),
(45, '228', 'INSTRUMENTACIÓN Y CONTROL'),
(46, '231', 'INGENIERIA DE MATERIALES'),
(47, '232', 'MECANICA RACIONAL'),
(48, '233', 'ELECTROTECNIA'),
(49, '234', 'TERMOFLUIDOS'),
(50, '235', 'GERENCIA ORGANIZACIONAL'),
(51, '236', 'LOGISTICA INDUSTRIAL'),
(52, '237', 'PRACTICA PROFESIONAL I'),
(53, '238', 'PRACTICA PROFESIONAL II'),
(54, '240', 'PROCESOS QUÍMICOS'),
(55, '241', 'GESTIÓN DE CALIDAD'),
(56, '251', 'PSICOLOGÍA DEL TRABAJO'),
(57, '252', 'PREVENCIÓN DE RIESGO I'),
(58, '255', 'PREVENCION DE RIESGO II'),
(59, '257', 'PASANTIA'),
(60, '258', 'ERGONOMIA'),
(61, '259', 'LEGISLACION LABORAL'),
(62, '300', 'FISICA GENERAL'),
(63, '305', 'TEORÍA DE DECISIONES'),
(64, '306', 'TEORIA DE SISTEMAS'),
(65, '310', 'OPTIMIZACIÓN NO LINEAL'),
(66, '311', 'BASE DE DATOS'),
(67, '312', 'PROGRAMACIÓN DE SISTEMAS'),
(68, '315', 'INVESTIGACIÓN DE OPERACIONES I'),
(69, '316', 'MICROPROCESADORES'),
(70, '321', 'INVESTIGACIÓN DE OPERACIONES IV'),
(71, '323', 'COMPUTACION I'),
(72, '324', 'COMPUTACION II'),
(73, '326', 'FISICA GENERAL II'),
(74, '327', 'INTRODUCCIÓN A LA INGENIERÍA DE SISTEMAS'),
(75, '330', 'PROCESAMIENTO DE DATOS'),
(76, '332', 'GRAFOS Y MATRICES'),
(77, '333', 'ARQUITECTURA DEL COMPUTADOR'),
(78, '334', 'COMPUTACIÓN GRÁFICA'),
(79, '335', 'SISTEMAS DE INFORMACION I'),
(80, '336', 'SISTEMAS DE INFORMACIÓN II'),
(81, '337', 'SIMULACION DE SISTEMAS'),
(82, '338', 'SISTEMAS DE INFORMACION III'),
(83, '339', 'PRACTICA PROFESIONAL I'),
(84, '341', 'PRACTICA PROFESIONAL II'),
(85, '342', 'REDES DE COMPUTADORAS'),
(86, '347', 'INTRODUCCIÓN A LA INTELIGENCIA ARTIFICIAL Y A LOS '),
(87, '348', 'INVESTIGACION DE OPERACIONES II'),
(88, '349', 'ORGANIZACIÓN Y MÉTODOS'),
(89, '358', 'SISTEMAS OPERATIVOS'),
(90, '370', 'FUNDAMENTOS DEL COMPUTADOR'),
(91, '371', 'TECNOLOGÍA WEB'),
(92, '372', 'MANTENIMIENTO PREVENTIVO Y CORRECTIVO'),
(93, '373', 'MANTENIMIENTO PERFECTIVO Y ADAPTATIVO'),
(94, '374', 'MARCO LEGAL NFORMÁTICO'),
(95, '375', 'PASANTIA'),
(96, '405', 'DESARROLLO DE HABILIDADES COGNOSCITIVAS'),
(97, '408', 'MATEMATICA I'),
(98, '410', 'GEOGRAFIA GENERAL'),
(99, '411', 'DESARROLLO PSICOSOCIAL DEL LENGUAJE'),
(100, '412', 'EDUCACION BASICA'),
(101, '414', 'MATEMATICA II'),
(102, '416', 'GEOGRAFIA DE VENEZUELA'),
(103, '420', 'GEOMETRIA'),
(104, '421', 'PLANIFICACION DE LA INSTRUCCION'),
(105, '423', 'SEM DESARR PERS DISEN PUBLIC PERIODICAS'),
(106, '427', 'TECNICAS Y RECURSOS PARA EL APRENDIZAJE'),
(107, '428', 'HISTORIA UNIVERSAL'),
(108, '431', 'ARTES PLASTICAS'),
(109, '433', 'EVALUACION'),
(110, '434', 'FORMACION CIUDADANA'),
(111, '437', 'MUSICA Y ARTES ESCENICAS'),
(112, '440', 'INTRODUCCION A LA INFORMATICA'),
(113, '444', 'EDUCACION FISICA Y DEPORTES'),
(114, '451', 'SEMINARIO DE INVESTIGACION EDUCATIVA'),
(115, '454', 'ANALISIS GRAMATICAL'),
(116, '457', 'LITERATURA VENEZOLANA I'),
(117, '465', 'PROCESOS CULTURALES DE LA VENEZUELA CONTEMPOR'),
(118, '468', 'NUEVAS FORMAS DE PARTICIPACION CIUDADANA'),
(119, '469', 'HISTORIA Y GEOGRAFIA REGIONAL'),
(120, '471', 'PRACTICA DOCENTE I'),
(121, '472', 'PRACTICA DOCENTE II'),
(122, '473', 'PRACTICA DOCENTE III'),
(123, '474', 'PRACTICA DOCENTE IV'),
(124, '475', 'PRACTICA DOCENTE V'),
(125, '476', 'MATEMATICA'),
(126, '477', 'FUNDAMENTOS DE LA EDUCACIÓN'),
(127, '478', 'LECTOESCRITURA'),
(128, '479', 'ENSEÑANZA DE LA MATEMATICA'),
(129, '480', 'EDUCACION AMBIENTAL'),
(130, '481', 'LITERATURA INFANTIL Y JUVENIL'),
(131, '483', 'PLANIFICACION DE LA ENSENANZA'),
(132, '484', 'GEOGRAFIA GENERAL Y DE VENEZUELA'),
(133, '485', 'CIENCIAS NATURALES I'),
(134, '486', 'EDUCACION ESTETICA'),
(135, '487', 'DIDACTICA PARA EL DOCENTE INTEGRADOR'),
(136, '488', 'HISTORIA DE VENEZUELA'),
(137, '489', 'CIENCIAS NATURALES II'),
(138, '490', 'SEM DESARR PERS COMUNICACION EFICAZ'),
(139, '491', 'ENSEÑANZA DE LA LENGUA'),
(140, '492', 'SEMINARIO PRACTICO FORMACION PARA EL TRABAJO'),
(141, '493', 'EVALUACION'),
(142, '494', 'EDUCACION FISICA Y RECREACION'),
(143, '495', 'PRACTICA DE ACCION DOCENTE'),
(144, '497', 'PRACTICA DE PROMOCION DE CAMBIO'),
(145, '498', 'SEM DESARR PERS LIDERAZG UNA ESTRAT PARA EL CAM'),
(146, '516', 'FUNDAMENTOS DE LA ACCION DOCENTE'),
(147, '517', 'FILOSOFÍA DE LA EDUCACIÓN'),
(148, '524', 'DESARROLLO DEL SISTEMA EDUCATIVO VENEZOLANO'),
(149, '530', 'PLANIFICACIÓN EDUCATIVA'),
(150, '532', 'MATEMÁTICAS Y CIENCIAS'),
(151, '534', 'EVALUACION EDUCATIVA'),
(152, '536', 'GERENCIA EDUCATIVA'),
(153, '542', 'DIDÁCTICA DE LA ARITMÉTICA'),
(154, '545', 'TEORÍA DE LA EDUCACIÓN MATEMÁTICA'),
(155, '547', 'DIDACTICA DEL ALGEBRA Y LA TRIGONOMETRIA'),
(156, '551', 'EVALUACIÓN DE LOS APRENDIZAJES EN MATEMATICA'),
(157, '552', 'DIDÁCTICA DE LA GEOMETRIA'),
(158, '559', 'APRENDIZAJE DE LA LECTURA Y LA ESCRITURA'),
(159, '560', 'DESARROLLO PERSONAL DEL DOCENTE'),
(160, '562', 'DESARROLLO DEL LENGUAJE'),
(161, '564', 'LITERATURA INFANTIL'),
(162, '570', 'DESARROLLO PSICOLÓGICO'),
(163, '571', 'PSICOLOGIA EDUCATIVA'),
(164, '575', 'TÓPICOS DE MATEMATICA'),
(165, '576', 'SOCIOLOGIA DE LA EDUCACIÓN Y DESARROLLO COMUNIT'),
(166, '577', 'DIDÁCTICA DE LA ESTOCÁSTICA'),
(167, '578', 'INVESTIGACIÓN EDUCATIVA'),
(168, '579', 'PRACTICUM I'),
(169, '580', 'PRACTICUM II'),
(170, '592', 'DESARROLLO Y PATOLOGIA DEL LENGUAJE'),
(171, '601', 'INTRODUCCIÓN A LA ADMINISTRACIÓN'),
(172, '602', 'TEORÍA DE LA ORGANIZACIÓN'),
(173, '641', 'TEORIA ECONÓMICA I'),
(174, '655', 'COSTO INDUSTRIAL'),
(175, '733', 'MATEMATICA III'),
(176, '735', 'MATEMATICA IV'),
(177, '737', 'INTRODUCCIÓN A LA PROBABILIDAD'),
(178, '738', 'INFERENCIA ESTADISTICA'),
(179, '739', 'MATEMÁTICA V'),
(180, '747', 'PROBABILIDAD'),
(181, '748', 'ESTADISTICA'),
(182, '749', 'CALCULO Ι'),
(183, '750', 'CÁLCULO II'),
(184, '751', 'CALCULO III'),
(185, '752', 'ALGEBRA I'),
(186, '753', 'ALGEBRA II'),
(187, '754', 'GEOMETRIA'),
(188, '755', 'ECUACIONES DIFERENCIALES'),
(189, '756', 'CALCULO INTEGRAL'),
(190, '757', 'ALGEBRA I'),
(191, '758', 'CALCULO VECTORIAL'),
(192, '759', 'ALGEBRA II'),
(193, '760', 'HISTORIA DE LAS MATEMATICAS'),
(194, '761', 'DIDACTICA DEL CALCULO'),
(195, '762', 'ANALISIS I'),
(196, '763', 'TOPICOS NUMERICOS EN CALCULO Y ALGEBRA'),
(197, '764', 'PROBABILIDAD Y ESTADISTICA I'),
(198, '765', 'DIDACTICA DEL ALGEBRA LINEAL Y LA PROBABILIDAD'),
(199, '766', 'ANALISIS II'),
(200, '767', 'ECUACIONES DIFERENCIALES'),
(201, '768', 'TOPOLOGIA'),
(202, '769', 'PRACTICA DOCENTE'),
(203, '770', 'TÓPICOS DE ANALISIS MATEMATICO'),
(204, '771', 'OPTIMIZACION NO LINEAL'),
(205, '772', 'PROBABILIDAD Y ESTADISTICA II'),
(206, '773', 'MODELOS MATEMATICOS'),
(207, '775', 'SISTEMAS DINAMICOS DISCRETOS'),
(208, '776', 'TOPICOS EN OPTIMIZACION I'),
(209, '778', 'ANALISIS DE DATOS'),
(210, '779', 'PROGRAMACION LINEAL'),
(211, '780', 'TEORIA DE JUEGOS'),
(212, '781', 'INTRODUCCION A LOS ELEMENTOS FINITOS'),
(213, '782', 'ALGEBRA LINEAL NUMERICA'),
(214, '783', 'INTRODUCCION A LOS ESPACIOS DE HILBERT Y SUS OPER'),
(215, '810', 'REDACCION DE INFORMES TECNICOS'),
(216, '811', 'FUNDAMENTOS BASICOS EN LA ELABORACION DE PROYE'),
(217, '812', 'ELABORACION PERIODICA DE PUBLICACIONES ESCOLARE'),
(218, '813', 'LIDERAZGO'),
(219, '814', 'SEMINARIO DE ACCION SOCIAL'),
(220, '816', 'FORMACION DE MICROEMPRESAS'),
(221, '11', 'SERVICIO COMUNITARIO'),
(222, '106', 'PRESENTACION A LA FISICA'),
(223, '107', 'LOGICA'),
(224, '108', 'INGLES'),
(225, '115', 'LENGUA Y COMUNICACIÓN'),
(226, '116', 'INTRODUCCIÓN A LA INFORMATICA'),
(227, '117', 'AMBIENTE Y DESARROLLO SOSTENIBLE EN VENEZUELA'),
(228, '118', 'METODOLOGÍA DE LA INVESTIGACIÓN'),
(229, '119', 'TEMAS DE ÉTICA'),
(230, '121', 'PROBLEMATICA DEL DESARROLLO'),
(231, '176', 'MATEMATICA I'),
(232, '178', 'MATEMATICA II'),
(233, '209', 'QUIMICA'),
(234, '300', 'FISICA GENERAL'),
(235, '601', 'INTRODUCCION A LA ADMINISTRACION'),
(236, '602', 'TEORÍA DE LA ORGANIZACIÓN'),
(237, '603', 'COMPORTAMIENTO ORGANIZACIONAL'),
(238, '604', 'ADMINISTRACION PUBLICA'),
(239, '605', 'SISTEMAS ADMINISTRATIVOS'),
(240, '606', 'SISTEMAS DE INFORMACION'),
(241, '607', 'ADMINISTRACIÓN POR PROYECTO'),
(242, '608', 'CONTROL DE GESTION'),
(243, '613', 'INVESTIGACIÓN ADMINISTRATIVA'),
(244, '614', 'ADMINISTRACION DE RECURSOS HUMANOS'),
(245, '615', 'RIESGOS Y SEGUROS'),
(246, '616', 'REASEGUROS'),
(247, '617', 'CONTABILIDAD INTERMEDIA APLICADA AL SEGURO'),
(248, '618', 'CONTABILIDAD COMPUTARIZADA'),
(249, '619', 'ADMINISTRACIÓN DEL RIESGO I'),
(250, '620', 'FUNDAMENTOS DE INGENIERIA'),
(251, '621', 'QUIMICA'),
(252, '625', 'INFORMATICA GERENCIAL'),
(253, '631', 'FUNDAMENTOS DE CONTABILIDAD'),
(254, '632', 'CONTABILIDAD INTERMEDIA'),
(255, '633', 'CONTABILIDAD SUPERIOR I'),
(256, '634', 'CONTABILIDAD GUBERNAMENTAL'),
(257, '636', 'MODELOS CONTABLES'),
(258, '637', 'CONTABILIDAD DE COSTOS I'),
(259, '638', 'SISTEMAS TRIBUTARIOS'),
(260, '639', 'CONTABILIDAD SUPERIOR II'),
(261, '641', 'TEORIA ECONOMICA I'),
(262, '642', 'TEORIA ECONÓMICA II'),
(263, '644', 'ECONOMIA Y SEGUROS'),
(264, '646', 'TEORIA DEL RIESGO'),
(265, '648', 'ADMINISTRACIÓN DEL RIESGO II'),
(266, '649', 'CONTABILIDAD SUPERIOR III'),
(267, '650', 'CONTABILIDAD DE COSTOS II'),
(268, '651', 'DERECHO MERCANTIL'),
(269, '653', 'DERECHO LABORAL'),
(270, '654', 'DERECHO APLICADO AL SEGURO'),
(271, '661', 'ADMINISTRACIÓN FINANCIERA'),
(272, '663', 'FINANZAS Y PRESUPUESTO PUBLICO'),
(273, '665', 'ANALISIS DE ESTADOS FINANCIEROS I'),
(274, '666', 'ANALISIS DE ESTADOS FINANCIEROS II'),
(275, '669', 'PRESUPUESTO EMPRESARIAL'),
(276, '671', 'MERCADOTECNIA'),
(277, '672', 'INVESTIGACION DE MERCADO'),
(278, '673', 'CONTABILIDAD FISCAL'),
(279, '681', 'PLANIFICACIÓN Y CONTROL DE LA PRODUCCIÓN'),
(280, '691', 'AUDITORIA I'),
(281, '692', 'AUDITORIA II'),
(282, '696', 'PASANTIA (Riesgos y Seguros)'),
(283, '697', 'PASANTIA (Contaduría)'),
(284, '699', 'PASANTIA (Administración)'),
(285, '734', 'MATEMATICA III'),
(286, '743', 'ELEMENTOS ACTUARIALES'),
(287, '745', 'ESTADÍSTICA GENERAL'),
(288, '746', 'ESTADÍSTICA APLICADA'),
(289, '810', 'REDACCION DE INFORMES TECNICOS'),
(290, '811', 'FUNDAMENTOS BASICOS EN LA ELABORACION DE PROYE'),
(291, '813', 'LIDERAZGO'),
(292, '814', 'SEMINARIO DE ACCION SOCIAL'),
(293, '816', 'FORMACION DE MICROEMPRESAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `objetivo_materia`
--

CREATE TABLE `objetivo_materia` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `materia_codigo` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `nro_objetivo` int(11) NOT NULL,
  `peso` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `objetivo_materia`
--

INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES
(37, '116', 1, '1.00'),
(38, '116', 2, '2.00'),
(39, '116', 3, '2.00'),
(40, '116', 4, '1.00'),
(41, '116', 5, '2.00'),
(42, '116', 6, '3.00'),
(49, '107', 1, '1.00'),
(50, '107', 2, '1.00'),
(51, '107', 3, '1.00'),
(52, '107', 4, '1.00'),
(53, '107', 5, '1.00'),
(54, '107', 6, '1.00'),
(55, '300', 1, '1.00'),
(56, '300', 2, '1.00'),
(57, '300', 3, '1.00'),
(58, '300', 4, '1.00'),
(59, '300', 5, '1.00'),
(60, '300', 6, '1.00'),
(61, '315', 1, '1.00'),
(62, '315', 2, '1.00'),
(63, '315', 3, '3.00'),
(64, '315', 4, '2.00'),
(65, '315', 5, '1.00'),
(66, '315', 6, '1.00'),
(67, '315', 7, '1.00'),
(68, '315', 8, '2.00'),
(69, '315', 9, '5.00'),
(76, '323', 1, '3.00'),
(77, '323', 2, '3.00'),
(78, '323', 3, '5.00'),
(79, '323', 4, '7.00'),
(80, '323', 5, '6.00'),
(81, '323', 6, '8.00'),
(95, '327', 1, '2.00'),
(96, '327', 2, '3.00'),
(97, '327', 3, '2.00'),
(98, '327', 4, '3.00'),
(99, '327', 5, '5.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre_rol` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre_rol`) VALUES
(2, 'administrador'),
(1, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tarea`
--

INSERT INTO `tarea` (`id`, `codigo`, `descripcion`) VALUES
(1, 'TP', 'TRABAJO PRACTICO'),
(2, 'TSP', 'TRABAJO SUSTITUTO DE PRUEBA'),
(3, 'TG', 'TRABAJO DE GRADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoasesoria`
--

CREATE TABLE `tipoasesoria` (
  `id` int(11) NOT NULL,
  `codigo_ase` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion_asesoria` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipoasesoria`
--

INSERT INTO `tipoasesoria` (`id`, `codigo_ase`, `descripcion_asesoria`) VALUES
(1, 'VT', 'VIRTUAL'),
(2, 'ELI', 'EN LINEA'),
(3, 'EGRU', 'ENCUENTRO GRUPAL'),
(4, 'PRE', 'PRESENCIAL'),
(5, 'CM', 'CLASE MAGISTRAL');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD PRIMARY KEY (`cedula`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_asesor_rol` (`rol_id`);

--
-- Indices de la tabla `asesor_carrera`
--
ALTER TABLE `asesor_carrera`
  ADD PRIMARY KEY (`asesor_cedula`,`carrera_id`),
  ADD KEY `fk_ac_carrera` (`carrera_id`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calificaciones_ibfk_1` (`cod_materia`);

--
-- Indices de la tabla `calificacion_107`
--
ALTER TABLE `calificacion_107`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion_116`
--
ALTER TABLE `calificacion_116`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion_300`
--
ALTER TABLE `calificacion_300`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion_315`
--
ALTER TABLE `calificacion_315`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion_323`
--
ALTER TABLE `calificacion_323`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion_327`
--
ALTER TABLE `calificacion_327`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `control_asesoria`
--
ALTER TABLE `control_asesoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `control_correcciones`
--
ALTER TABLE `control_correcciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `materia_una`
--
ALTER TABLE `materia_una`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `objetivo_materia`
--
ALTER TABLE `objetivo_materia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoasesoria`
--
ALTER TABLE `tipoasesoria`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `asesor`
--
ALTER TABLE `asesor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `calificacion_107`
--
ALTER TABLE `calificacion_107`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificacion_116`
--
ALTER TABLE `calificacion_116`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificacion_300`
--
ALTER TABLE `calificacion_300`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificacion_315`
--
ALTER TABLE `calificacion_315`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificacion_323`
--
ALTER TABLE `calificacion_323`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `calificacion_327`
--
ALTER TABLE `calificacion_327`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `control_asesoria`
--
ALTER TABLE `control_asesoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `control_correcciones`
--
ALTER TABLE `control_correcciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `materia_una`
--
ALTER TABLE `materia_una`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=294;

--
-- AUTO_INCREMENT de la tabla `objetivo_materia`
--
ALTER TABLE `objetivo_materia`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipoasesoria`
--
ALTER TABLE `tipoasesoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asesor`
--
ALTER TABLE `asesor`
  ADD CONSTRAINT `fk_asesor_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `asesor_carrera`
--
ALTER TABLE `asesor_carrera`
  ADD CONSTRAINT `fk_ac_asesor` FOREIGN KEY (`asesor_cedula`) REFERENCES `asesor` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
