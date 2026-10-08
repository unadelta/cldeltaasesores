-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-10-2026 a las 17:26:55
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

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
(3, 'V-06823400', 'UBAN LEGNY TERESA', '280', 'Ingeniería Industrial'),
(4, 'V-13401660', 'CALDERON QUIVAS REINALDO RAMON', '610', 'Licenciatura en Administración - Mención Empresas '),
(5, 'V-18387899', 'MARTINEZ ROXDELIS ELENIZA', '610', 'Licenciatura en Administración - Mención Empresas '),
(6, 'V-31105291', 'FERNIN TOLEDO DANIEL JOSUE', '236', 'Ingeniería de Sistemas'),
(7, 'V-15336186', 'MENDOZA ROJAS DARVIN JAIRO', '613', 'Licenciatura en Administración de Empresas mención Riesgos y Seguros'),
(9, 'V-08952715', 'MEDRANO BELLORIN JULIAN JOSE', '508', 'Licenciatura en Educación mención Educación Matemática'),
(10, 'V-11206309', 'ABREU MENDOZA ELADIO JESUS', '610', 'Licenciatura en Administración - Mención Empresas Comerciales'),
(11, 'V-15200799', 'TRUJILLO SANDRA PATRICIA', '542', 'Licenciatura en Educación mención Preescolar'),
(12, 'V-16221653', 'PARRA PEREIRA JOSE MIGUEL', '612', 'Licenciatura en Administración - Mención Recursos Humanos'),
(13, 'V-16613709', 'VILLANUEVA RASSE ADRIANA DEL VALLE', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(14, 'V-16699180', 'GIOVETTI YPLANDA MARGARITA', '612', 'Licenciatura en Administración - Mención Recursos Humanos'),
(15, 'V-19140953', 'CEQUEA FRANCO MARYOLI DE LAS', '612', 'Licenciatura en Administración - Mención Recursos Humanos'),
(16, 'V-19403195', 'MENDOZA MARCANO FRANCIS JHOALY', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(17, 'V-23725487', 'VILLAREAL QUINTERO MONICA MARIA', '542', 'Licenciatura en Educación mención Preescolar'),
(18, 'V-21198540', 'BELLORIN TORRES VIVIANA YUBEL', '542', NULL),
(19, 'V-24226134', 'SALCEDO GONZALEZ OSWALDO DAVID', '281', NULL),
(20, 'V-24580333', 'GONZALEZ VELASAUEZ EDGAR SEGUNDO', '281', NULL),
(23, 'V-32417265', 'GUZMAN DIAZ EDWIN ENRIQUE', '236', 'Ingeniería de Sistemas'),
(24, 'V-25355886', 'LOZADA BRITO JOSE GREGORIO', '280', 'INGENIERIA INDUSTRIAL'),
(25, 'V-27802269', 'montaño guerra andro fernando', '236', 'Ingeniería de Sistemas'),
(26, 'V-18657909', 'SANCHEZ LIRA CHRISTIAN JESUS', '237', 'T.S.U. Mantenimiento de Sistemas Informáticos'),
(27, 'V-11208458', 'MATUTE FERMIN CECILIO ANTONIO', '236', 'Ingeniería de Sistemas'),
(28, 'V-31164128', 'RIVERO CUENCE KADIZ GABRIEL', '237', 'T.S.U. Mantenimiento de Sistemas Informáticos'),
(29, 'V-08953003', 'ESTEVES GURRA OSCAR ALEJANDRO', '236', 'Ingeniería de Sistemas'),
(30, 'V-18657701', 'ROJAS RODRIGUEZ BEIGLIS JOSEFINA', '440', 'EDUCACION INTEGRAL'),
(31, 'V-19140921', 'MARCANO ORDAZ MILAGROS DEL VALLE', '440', 'EDUCACION INTEGRAL'),
(32, 'V-24119251', 'HERNANDEZ CARRIN GABRIEL MOISES', '440', 'EDUCACION INTEGRAL'),
(33, 'V-30656477', 'PINTO HERNANDEZ OMAILYN ITHIEL', '280', 'INGENIERIA INDUSTRIAL'),
(35, 'V-31559376', 'MARQUEZ HERRERA CECILIA GABRIEL', '280', 'INGENIERIA INDUSTRIAL'),
(36, 'V-32273433', 'SANDOVAL ASTUDILLO YULIANNYS A', '440', 'EDUCACION INTEGRAL'),
(37, 'V-33145659', 'CARABALLO MARTINEZ MARIA ISABEL', '612', 'Licenciatura en Administración - Mención Recursos Humanos'),
(38, 'V-33357628', 'PARRA BRICEÑO BRANDOS JONAS', '236', 'T.S.U. Mantenimiento de Sistemas Informáticos'),
(39, 'V-33818735', 'RODRIGUEZ ROJAS DANIELLYS VALENTINA', '613', 'Licenciatura en Administración de Empresas mención Riesgos y Seguros'),
(40, 'V-34196919', 'MENDOZA LOCHAMANCIN LEIDISMAR', '612', 'Licenciatura en Administración - Mención Recursos Humanos'),
(41, 'V-31463200', 'CARREÑO ALEJANDRA LUCIANY', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(42, 'V-28741147', 'IBARRA CASTRO AXXA EIDEMAR', '237', 'T.S.U. Mantenimiento de Sistemas Informáticos'),
(43, 'V-18659917', 'BRITO EMMA KARINA', '440', 'EDUCACION INTEGRAL'),
(44, 'V-18914541', 'OLIVEROS DE RODRÍGUEZ YERALDINE', '440', 'EDUCACION INTEGRAL'),
(45, 'V-25124024', 'MATA GONZÁLEZ ROSAIDYS ANDREINA', '440', 'EDUCACION INTEGRAL'),
(46, 'V-28018752', 'MOTA MORENO HÉCTOR ANDRÉS', '440', 'EDUCACION INTEGRAL'),
(47, 'V-28603527', 'PAZ JIMÉNEZ RONALDY NAZARETH', '440', 'EDUCACION INTEGRAL'),
(48, 'V-28657207', 'RIVAS MARCANO YOSLER PASCUAL', '440', 'EDUCACION INTEGRAL'),
(49, 'V-12127118', 'OREA BARRETO CESAR OSWALDO', '440', 'EDUCACION INTEGRAL'),
(50, 'V-14905885', 'MONTEVERDE GIL FREDDY GREGORIO', '430', 'Técnico Superior Universitario (TSU) en Educación IntegraL'),
(51, 'V-17055271', 'RIVERO MARTINEZ CADIS JOEL', '430', 'Técnico Superior Universitario (TSU) en Educación IntegraL'),
(52, 'V-25859164', 'SALAZAR BOLIVAR RAFAEL OGUSTO', '430', 'Técnico Superior Universitario (TSU) en Educación IntegraL'),
(53, 'V-12686634', 'PRIETO GONZÁLEZ XIOMARA', '542', 'Licenciatura en Educación mención Preescolar'),
(54, 'V-15336047', 'DÍAZ CORREA ROSELLYN DARGELYS', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(55, 'V-19140930', 'LÓPEZ RODRÍGUEZ LEXIS MARICELA', '542', 'Licenciatura en Educación mención Preescolar'),
(56, 'V-26909764', 'BOMPART MARIN SANEYCAR DANIELA', '542', 'Licenciatura en Educación mención Preescolar'),
(57, 'V-30838011', 'SALAZAR TOVAR TATIANA COROMOTO', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(58, 'V-28672058', 'CASTRO MARCANO DAILMAR EGARLY', '440', 'EDUCACION INTEGRAL'),
(59, 'V-16216700', 'ALCALÁ SALAZAR ROSA URISBETH', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(60, 'V-28349903', 'LISTA RODRÍGUEZ LEIDY VANESSA', '542', 'Licenciatura en Educación mención Preescolar'),
(61, 'V-34389583', 'MÁRQUEZ MARTINEZ JESUANNYS JOSÉ', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(62, 'V-19140227', 'LIRA NUÑEZ ROMÁN JOSÉ', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(63, 'V-24119219', 'FERMÍN MARTINEZ MARIELBELYS', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(64, 'V-25930610', 'ROJAS MORENO FABIO LUIS', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(65, 'V-17745959', 'PACHECO GÓMEZ MILIANNYS LOURDES', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(66, 'V-27928807', 'ARCILA LEAL YOSELIN ANDREINA', '430', 'Técnico Superior Universitario (TSU) en Educación IntegraL'),
(67, 'V-14904783', 'BARRIOS GRACIAS YOHANA JOSEFINA', '610', 'Licenciatura en Contaduría Pública'),
(68, 'V-16008954', 'MARTINEZ CARMEN MARGARITA', '610', 'Licenciatura en Contaduría Pública'),
(69, 'V-17382235', 'YELAMO BERGANTINI MAYNES ALEJANDRO', '613', 'Licenciatura en Administración de Empresas mención Riesgos y Seguros'),
(70, 'V-25678687', 'RIVAS NUÑES ANNIELIS ANTONIETA', '508', 'Licenciatura en Educación mención Educación Matemática'),
(71, 'V-17999287', 'MORALES DIAZ ELYSBETH DEL CARMEN', '280', 'Ingeniería Industrial'),
(72, 'V-16698115', 'RENGEL RODRIGUEZ MARISEL DELIS', '610', 'Licenciatura en Contaduría Pública'),
(73, 'V-18657250', 'SOLER GONZALEZ JOSE ALBERTO', '610', 'Licenciatura en Contaduría Pública'),
(74, 'V-25125820', 'RODRIGUEZ GOMEZ LUISEYDITH JOSE', '612', 'Licenciatura en Administración de Empresas'),
(75, 'V-25331002', 'RINCONES MATA GREIDIS MARIANA', '610', 'Licenciatura en Contaduría Pública'),
(76, 'V-27032931', 'TARAZONA CENTENO CARLA ALEXAIDA', '612', 'Licenciatura en Administración de Empresas'),
(77, 'V-27802704', 'MORENO LIRA ADRIANNYS DEL VALLE', '542', 'Licenciatura en Educación mención Preescolar'),
(78, 'V-28018644', 'ABREU MILANO LIZMAR MARIA', '610', 'Licenciatura en Contaduría Pública'),
(79, 'V-28349996', 'GONZLEZ VEGAS STEFANY DE LOS', '612', 'Licenciatura en Administración de Empresas'),
(80, 'V-28768129', 'FERMIN SANCHEZ CESAR MIGUEL', '610', 'Licenciatura en Contaduría Pública'),
(81, 'V-31371547', 'URBAEZ DE LA ROSA VALERIA ESPERANZA', '612', 'Licenciatura en Administración de Empresas'),
(82, 'V-32284486', 'RIVERO CUENCE KARINA DEL VALLE', '126', 'Licenciatura en Matemática'),
(83, 'V-33105363', 'GOMEZ BETANCOURT JOSE ANTONIO P', '236', 'Ingeniería de Sistemas'),
(84, 'V-33810735', 'RODRIGUEZ ROJAS DANIELLYS VALE', '613', 'Licenciatura en Administración de Empresas mención Riesgos y Seguros'),
(85, 'V-14905884', 'MONTEVERDE GIL FREDDY GREGORIO', '430', 'Técnico Superior Universitario (TSU) en Educación IntegraL'),
(86, 'V-20593274', 'FARIAS UGUETO LORENA KATIUSKA', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(87, 'V-18657908', 'SANCHEZ LIRA NANCY CRISTINA', '612', 'Licenciatura en Administración de Empresas'),
(88, 'V-18098485', 'GIL CEDEÑOMILEYDIS NOHEMI', '610', 'Licenciatura en Contaduría Pública'),
(89, 'V-20852586', 'CABAÑA SUAREZ JESUS ABRAHAM', '281', 'T.S.U. Higiene y Seguridad Industrial'),
(90, 'V-20853756', 'GARCIA BRAZON ITMER DAVID', '236', 'Ingeniería de Sistemas'),
(91, 'V-25661378', 'CUESTA DE ROMERO OLGA PATRICIA', '610', 'Licenciatura en Contaduría Pública'),
(92, 'V-26909830', 'ROSAS MILANO ANLISTH ALEJANDRA', '237', 'T.S.U. Mantenimiento de Sistemas Informáticos'),
(93, 'V-28374252', 'ZORRILLA CENTENO MARIELIZA EL VALLE', '281', 'T.S.U. Higiene y Seguridad Industrial'),
(94, 'V-17525966', 'VALDEZ MORALES MIRAIDA DEL VALLE', '237', 'T.S.U. Mantenimiento de Sistemas Informáticos'),
(95, 'V-28633617', 'LOPEZ HERRERA CARLOS VICENTE', '236', 'Ingeniería de Sistemas'),
(96, 'V-19402735', 'MEDINA SUARES JOSBELYS CAROLINA', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(97, 'V-25926844', 'ROMERO SANCHEZ ADA KATERINE', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje'),
(98, 'V-32461286', 'TORIBE RODRIGUEZ MARIA EUGENIA', '236', 'Ingeniería de Sistemas'),
(99, 'V-32329088', 'LEON RODRIGUEZ YSBETHLIS YUDAL', '610', 'Licenciatura en Contaduría Pública');

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
(8, '11210868', 'MSc María Lo Galbo', 'mlogalbo', 'a031216*', 'marialogalbouna@gmail.com', 2),
(16, '11213945', 'TOMASA RODRÍGUEZ', 'tomi', 'Tomifa*0112', 'tominesrm@gmail.com', 2),
(14, '12545786', 'Dra. Leslibeth Sucre G.', 'Leslibeth', 'unadelta', 'postgradounadelta@gmail.com', 2),
(2, '13403217', 'Yorbeydis Dicuru', 'yor', '123456', 'y.dsarabia@gmail.com', 2),
(5, '1423569', 'Yovinza Salazar', 'ysalazar', '8545967', 'ysalazar@gmail.com', 1),
(13, '14487374', 'Lcda. Leydis Zacarias', 'leyditaz18', 'Emaveja.123', 'zacariasleydis@gmail.com', 2),
(9, '16214477', 'Lcda. Luz Jaramillo', 'l.jaramillo', '31#luz', 'milagrosluz1982@gmail.com', 2),
(12, '20160859', 'Ing. Chrismar Sarabia', 'schrismar', '2813.csh', 'chrismarcsh34@gmail.com', 2),
(6, '31541259', 'LEONARDO NOA', 'nnoa', '123456', 'leonardonoa803@gmail.com', 1),
(15, '5336874', 'MSc. Nancy Lira', 'Jhanisse01', 'Nan011', 'nancyclira58@gmail.com', 2),
(7, '5337512', 'Mcs. Tibisay Padrino', 'tpadrino', 'tilas66**', 'tibisayp337@gmail.com', 2),
(10, '8894910', 'Lcda. Rorima Nuñez', 'majomernu', '1502$', 'roraiman@gmail.com', 2),
(11, '8950642', 'Lcdo. Edgar Abreu', 'eabreu', 'tati64.', 'ejam772020@gmail.com', 2),
(17, '8952357', 'Eldris Brisceida Salazar Jiménez', 'eldrina', 'platero10.', 'uneldris@gmail.com', 2),
(1, '9858269', 'Ing. Matías Sarabia C.', 'msarabia', 'martina', 'jsarabia22@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesor_carrera`
--

CREATE TABLE `asesor_carrera` (
  `id` int(11) NOT NULL,
  `asesor_cedula` varchar(30) NOT NULL,
  `carrera` varchar(100) NOT NULL,
  `asignatura` varchar(50) NOT NULL,
  `cantidad_alumno` int(11) DEFAULT '0',
  `semestre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asesor_carrera`
--

INSERT INTO `asesor_carrera` (`id`, `asesor_cedula`, `carrera`, `asignatura`, `cantidad_alumno`, `semestre`) VALUES
(1, '9858269', '236', '107', 10, '2026-2'),
(2, '9858269', '236', '327', 15, '2026-2'),
(3, '9858269', '236', '116', 72, '2026-2');

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
(78, '327', 15, 10),
(79, '371', 7, 1),
(80, '371', 8, 2),
(81, '371', 9, 3),
(82, '371', 10, 4),
(83, '371', 11, 5),
(84, '371', 12, 6),
(85, '371', 13, 7),
(86, '371', 14, 8),
(87, '371', 15, 9),
(88, '371', 16, 10),
(89, '612', 4, 1),
(90, '612', 5, 2),
(91, '612', 6, 3),
(92, '612', 7, 4),
(93, '612', 8, 5),
(94, '612', 9, 6),
(95, '612', 10, 7),
(96, '612', 11, 8),
(97, '612', 12, 9),
(98, '612', 13, 10),
(110, '107', 1, 2),
(111, '107', 2, 3),
(112, '107', 3, 5),
(113, '107', 4, 6),
(114, '107', 5, 8),
(115, '107', 6, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_050`
--

CREATE TABLE `calificacion_050` (
  `id` int(11) NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion_050`
--

INSERT INTO `calificacion_050` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `nota_final`, `nota_final_letra`, `semestre`) VALUES
(17, 'VILLAREAL QUINTERO MONICA MARIA', 'V-23725487', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2'),
(77, 'MORENO LIRA ADRIANNYS DEL VALLE', 'V-27802704', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_051`
--

CREATE TABLE `calificacion_051` (
  `id` int(11) NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion_051`
--

INSERT INTO `calificacion_051` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `nota_final`, `nota_final_letra`, `semestre`) VALUES
(17, 'VILLAREAL QUINTERO MONICA MARIA', 'V-23725487', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_052`
--

CREATE TABLE `calificacion_052` (
  `id` int(11) NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion_052`
--

INSERT INTO `calificacion_052` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `nota_final`, `nota_final_letra`, `semestre`) VALUES
(17, 'VILLAREAL QUINTERO MONICA MARIA', 'V-23725487', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_053`
--

CREATE TABLE `calificacion_053` (
  `id` int(11) NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion_053`
--

INSERT INTO `calificacion_053` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `nota_final`, `nota_final_letra`, `semestre`) VALUES
(55, 'LÓPEZ RODRÍGUEZ LEXIS MARICELA', 'V-19140930', '11213945', '0.00', '0.00', '0.00', '0.00', '', '2026-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_056`
--

CREATE TABLE `calificacion_056` (
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
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion_056`
--

INSERT INTO `calificacion_056` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES
(18, 'BELLORIN TORRES VIVIANA YUBEL', 'V-21198540', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_057`
--

CREATE TABLE `calificacion_057` (
  `id` int(11) NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion_057`
--

INSERT INTO `calificacion_057` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `nota_final`, `nota_final_letra`, `semestre`) VALUES
(53, 'PRIETO GONZÁLEZ XIOMARA', 'V-12686634', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_107`
--

CREATE TABLE `calificacion_107` (
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
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_115`
--

CREATE TABLE `calificacion_115` (
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
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion_115`
--

INSERT INTO `calificacion_115` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES
(11, 'TRUJILLO SANDRA PATRICIA', 'V-15200799', '9858269', '0.00', '0.00', '1.00', '1.00', '1.00', '1.00', '6.00', 'Seis', '2026-2');

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

--
-- Volcado de datos para la tabla `calificacion_116`
--

INSERT INTO `calificacion_116` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES
(41, 'CARREÑO ALEJANDRA LUCIANY', 'V-31463200', '9858269', '1.00', '1.00', '1.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2'),
(42, 'IBARRA CASTRO AXXA EIDEMAR', 'V-28741147', '9858269', '1.00', '1.00', '1.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2'),
(93, 'ZORRILLA CENTENO MARIELIZA EL VALLE', 'V-28374252', '9858269', '1.00', '1.00', '1.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2'),
(95, 'LOPEZ HERRERA CARLOS VICENTE', 'V-28633617', '9858269', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2'),
(96, 'MEDINA SUARES JOSBELYS CAROLINA', 'V-19402735', '9858269', '1.00', '1.00', '1.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2'),
(97, 'ROMERO SANCHEZ ADA KATERINE', 'V-25926844', '9858269', '1.00', '1.00', '1.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2'),
(98, 'TORIBE RODRIGUEZ MARIA EUGENIA', 'V-32461286', '9858269', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2'),
(99, 'LEON RODRIGUEZ YSBETHLIS YUDAL', 'V-32329088', '9858269', '0.00', '1.00', '1.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2');

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

--
-- Volcado de datos para la tabla `calificacion_300`
--

INSERT INTO `calificacion_300` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES
(2, 'RIVERO CUENCE KATERIN DEL VALLE', 'V-28766928', '9858269', '1.00', '0.00', '1.00', '0.00', '1.00', '1.00', '6.00', 'Seis', '2026-2'),
(3, 'UBAN LEGNY TERESA', 'V-6823400', '9858269', '1.00', '1.00', '1.00', '1.00', '1.00', '0.00', '8.00', 'Ocho', '2026-2'),
(10, 'ABREU MENDOZA ELADIO JESUS', 'V-11206309', '9858269', '1.00', '0.00', '1.00', '0.00', '1.00', '1.00', '6.00', 'Seis', '2026-2'),
(14, 'GIOVETTI YPLANDA MARGARITA', 'V-16699180', '9858269', '0.00', '0.00', '1.00', '1.00', '1.00', '1.00', '6.00', 'Seis', '2026-2');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_371`
--

CREATE TABLE `calificacion_371` (
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
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion_371`
--

INSERT INTO `calificacion_371` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `obj7`, `nota_final`, `nota_final_letra`, `semestre`) VALUES
(2, 'RIVERO CUENCE KATERIN DEL VALLE', 'V-28766928', '9858269', '1.00', '1.00', '1.00', '1.00', '0.00', '1.00', '1.00', '6.00', 'Seis', '2026-2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion_612`
--

CREATE TABLE `calificacion_612` (
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
  `obj9` decimal(5,2) DEFAULT '0.00',
  `obj10` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(4, 'V-16613709', 'VILLANUEVA RASSE ADRIANA DEL VALLE', '521', 'VIRTUAL', '107', '9858269', 'Ing. Matías Sarabia C.', '2026-09-30 20:13:20'),
(7, 'V-15200799', 'TRUJILLO SANDRA PATRICIA', '542', 'VIRTUAL', '327', '9858269', 'Ing. Matías Sarabia C.', '2026-09-30 22:30:38'),
(8, 'V-15336186', 'MENDOZA ROJAS DARVIN JAIRO', '613', 'VIRTUAL', '107', '9858269', 'Ing. Matías Sarabia C.', '2026-10-04 11:00:43'),
(9, 'V-15336186', 'MENDOZA ROJAS DARVIN JAIRO', '613', 'PRESENCIAL', '107', '9858269', 'Ing. Matías Sarabia C.', '2026-10-04 11:01:39'),
(10, 'V-18914541', 'OLIVEROS DE RODRÍGUEZ YERALDINE', '440', 'EN LINEA', '116', '9858269', 'Ing. Matías Sarabia C.', '2026-10-04 11:02:25'),
(11, 'V-19403195', 'MENDOZA MARCANO FRANCIS JHOALY', '521', 'VIRTUAL', '323', '9858269', 'Ing. Matías Sarabia C.', '2026-10-04 11:03:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `control_correcciones`
--

CREATE TABLE `control_correcciones` (
  `id` int(11) NOT NULL,
  `cedula_alumno` varchar(20) NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `codigo_carrera` varchar(20) NOT NULL,
  `codigo_materia` varchar(20) NOT NULL,
  `tipo_correccion` varchar(20) NOT NULL,
  `cedula_asesor` varchar(20) NOT NULL,
  `nombre_asesor` varchar(150) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `control_correcciones`
--

INSERT INTO `control_correcciones` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `codigo_materia`, `tipo_correccion`, `cedula_asesor`, `nombre_asesor`, `fecha`) VALUES
(19, 'V-13401660', 'CALDERON QUIVAS REINALDO RAMON', '610', '107', 'TP', '9858269', 'Ing. Matías Sarabia C.', '2026-09-30 20:25:06'),
(21, 'V-18387899', 'MARTINEZ ROXDELIS ELENIZA', '610', '107', 'TP', '9858269', 'Ing. Matías Sarabia C.', '2026-09-30 20:26:04'),
(22, 'V-33357628', 'PARRA BRICEÑO BRANDOS JONAS', '236', '116', 'TP', '9858269', 'Ing. Matías Sarabia C.', '2026-09-30 20:26:41'),
(23, 'V-15200799', 'TRUJILLO SANDRA PATRICIA', '542', '327', 'TP', '9858269', 'Ing. Matías Sarabia C.', '2026-10-04 15:04:29');

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
(15, '107', 'LOGICA', 6, '4.00'),
(1, '116', 'Introducción a la informática', 6, '9.00'),
(4, '300', 'Fisica', 6, '4.00'),
(5, '315', 'Investigación de operaciones', 9, '13.00'),
(6, '323', 'Computación I', 6, '26.00'),
(7, '327', 'INTRODUCCIÓN A LA INGENIERÍA DE SISTEMAS', 5, '11.00'),
(8, '371', 'TECNOLOGÍA WEB', 7, '12.00'),
(9, '612', 'CONTABILIDAD INTERMEDIA', 10, '9.00');

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
(1, '050', 'EDUCACION INICIAL'),
(2, '051', 'SALUD ALTERACIONES Y PREVENCIÓN EN EDUCACIÓN INI'),
(3, '052', 'DESARROLLO DEL NIÑO DE 0 A 3 AÑOS'),
(4, '053', 'DESARROLLO PSICOMOTOR EN EDUCACION INICIAL'),
(5, '054', 'DESARROLLO COGNOSCITIVO DEL NIÑO DE 4 A 7 AÑOS'),
(6, '055', 'PRÁCTICA I DESARROLLO DEL NIÑO DE 0 A 3 AÑOS'),
(7, '056', 'EVALUACIÓN Y PLANIFICACIÓN EN EDUCACIÓN INICIAL'),
(8, '057', 'DESARROLLO SOCIAL Y EMOCIONAL DEL NIÑO DE 4 A 7 AN'),
(9, '058', 'LA FAMILIA, LA COMUNIDAD Y EL NIÑO EN EDUCACIÓN IN'),
(10, '059', 'PRÁCTICA II DESARROLLO COGNOSCITIVO, SOCIOEMOCI'),
(11, '060', 'CREATIVIDAD EN EDUCACIÓN INICIAL'),
(12, '061', 'PRÁCTICA III EL MAESTRO EN AULA'),
(13, '062', 'EXPRESIÓN Y CULTURA EN EDUCACIÓN INICIAL'),
(14, '063', 'SOLUCIÓN A PROBLEMAS EDUCATIVOS EN EDUCACIÓN IN'),
(15, '064', 'PRACTICA IV PROCESOS ADMINISTRATIVOS EN CENTROS'),
(19, '115', 'LENGUA Y COMUNICACIÓN'),
(20, '116', 'INTRODUCCIÓN A LA INFORMATICA'),
(21, '117', 'AMBIENTE Y DESARROLLO SOSTENIBLE EN VENEZUELA'),
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
(221, '011', 'SERVICIO COMUNITARIO'),
(222, '106', 'PRESENTACION A LA FISICA'),
(224, '108', 'INGLES'),
(228, '118', 'METODOLOGÍA DE LA INVESTIGACIÓN'),
(231, '176', 'MATEMATICA I'),
(232, '178', 'MATEMATICA II'),
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
(293, '816', 'FORMACION DE MICROEMPRESAS'),
(294, '508', 'EDUCACION MATEMATICA'),
(295, '612', 'CONTABILIDAD INTERMEDIA'),
(296, '107', 'LOGICA');

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
(99, '327', 5, '5.00'),
(100, '371', 1, '1.00'),
(101, '371', 2, '2.00'),
(102, '371', 3, '2.00'),
(103, '371', 4, '3.00'),
(104, '371', 5, '4.00'),
(105, '371', 6, '3.00'),
(106, '371', 7, '1.00'),
(107, '612', 1, '1.00'),
(108, '612', 2, '1.00'),
(109, '612', 3, '1.00'),
(110, '612', 4, '1.00'),
(111, '612', 5, '2.00'),
(112, '612', 6, '1.00'),
(113, '612', 7, '1.00'),
(114, '612', 8, '1.00'),
(115, '612', 9, '1.00'),
(116, '612', 10, '3.00'),
(128, '107', 1, '1.00'),
(129, '107', 2, '1.00'),
(130, '107', 3, '1.00'),
(131, '107', 4, '1.00'),
(132, '107', 5, '1.00'),
(133, '107', 6, '1.00');

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
(3, 'TEG', 'TRABAJO DE GRADO'),
(4, 'PROY', 'PROYECTO');

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
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calificaciones_ibfk_1` (`cod_materia`);

--
-- Indices de la tabla `calificacion_050`
--
ALTER TABLE `calificacion_050`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion_051`
--
ALTER TABLE `calificacion_051`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion_052`
--
ALTER TABLE `calificacion_052`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion_053`
--
ALTER TABLE `calificacion_053`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion_056`
--
ALTER TABLE `calificacion_056`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion_057`
--
ALTER TABLE `calificacion_057`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion_107`
--
ALTER TABLE `calificacion_107`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion_115`
--
ALTER TABLE `calificacion_115`
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
-- Indices de la tabla `calificacion_371`
--
ALTER TABLE `calificacion_371`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calificacion_612`
--
ALTER TABLE `calificacion_612`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `asesor`
--
ALTER TABLE `asesor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `asesor_carrera`
--
ALTER TABLE `asesor_carrera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `calificacion_050`
--
ALTER TABLE `calificacion_050`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `calificacion_051`
--
ALTER TABLE `calificacion_051`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `calificacion_052`
--
ALTER TABLE `calificacion_052`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `calificacion_053`
--
ALTER TABLE `calificacion_053`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `calificacion_056`
--
ALTER TABLE `calificacion_056`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `calificacion_057`
--
ALTER TABLE `calificacion_057`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `calificacion_107`
--
ALTER TABLE `calificacion_107`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificacion_115`
--
ALTER TABLE `calificacion_115`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `calificacion_116`
--
ALTER TABLE `calificacion_116`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `calificacion_300`
--
ALTER TABLE `calificacion_300`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `calificacion_315`
--
ALTER TABLE `calificacion_315`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificacion_323`
--
ALTER TABLE `calificacion_323`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calificacion_371`
--
ALTER TABLE `calificacion_371`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `calificacion_612`
--
ALTER TABLE `calificacion_612`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `control_asesoria`
--
ALTER TABLE `control_asesoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `control_correcciones`
--
ALTER TABLE `control_correcciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `materia_una`
--
ALTER TABLE `materia_una`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT de la tabla `objetivo_materia`
--
ALTER TABLE `objetivo_materia`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Filtros para la tabla `calificaciones`
--
ALTER TABLE `calificaciones`
  ADD CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
