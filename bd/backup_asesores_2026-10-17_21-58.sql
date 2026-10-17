-- Respaldo de Base de Datos: asesores
-- Fecha: 2026-10-17 21:58:25

SET FOREIGN_KEY_CHECKS=0;

-- Estructura para tabla `acumuladotaase`
CREATE TABLE `acumuladotaase` (
  `id` int NOT NULL,
  `periodo` varchar(7) NOT NULL COMMENT 'Formato YYYY-MM extraído de la fecha de inicio',
  `cedula` varchar(20) NOT NULL COMMENT 'Cédula de identidad del asesor',
  `TP` int DEFAULT '0',
  `TSP` int DEFAULT '0',
  `TEG` int DEFAULT '0',
  `PROY` int DEFAULT '0',
  `EGRU` int DEFAULT '0',
  `ELI` int DEFAULT '0',
  `PRE` int DEFAULT '0',
  `VT` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `acumuladotaase` (`id`, `periodo`, `cedula`, `TP`, `TSP`, `TEG`, `PROY`, `EGRU`, `ELI`, `PRE`, `VT`) VALUES (1, '2026-10', '9858269', 0, 0, 0, 0, 0, 0, 0, 0) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `periodo` = VALUES(`periodo`), `cedula` = VALUES(`cedula`), `TP` = VALUES(`TP`), `TSP` = VALUES(`TSP`), `TEG` = VALUES(`TEG`), `PROY` = VALUES(`PROY`), `EGRU` = VALUES(`EGRU`), `ELI` = VALUES(`ELI`), `PRE` = VALUES(`PRE`), `VT` = VALUES(`VT`);
INSERT INTO `acumuladotaase` (`id`, `periodo`, `cedula`, `TP`, `TSP`, `TEG`, `PROY`, `EGRU`, `ELI`, `PRE`, `VT`) VALUES (2, '2026-10', '13403217', 0, 3, 0, 0, 0, 2, 1, 0) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `periodo` = VALUES(`periodo`), `cedula` = VALUES(`cedula`), `TP` = VALUES(`TP`), `TSP` = VALUES(`TSP`), `TEG` = VALUES(`TEG`), `PROY` = VALUES(`PROY`), `EGRU` = VALUES(`EGRU`), `ELI` = VALUES(`ELI`), `PRE` = VALUES(`PRE`), `VT` = VALUES(`VT`);

-- Estructura para tabla `alumno`
CREATE TABLE `alumno` (
  `id` int NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `codigo_carrera` varchar(20) NOT NULL,
  `descripcion_carrera` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */,
  UNIQUE KEY `cedula` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (1, 'V-24119980', 'RODRIGUEZ CASCON ALONSO ISAAC', '440', 'Educación Integral') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (2, 'V-28766928', 'RIVERO CUENCE KATERIN DEL VALLE', '236', 'Ingeniería de Sistemas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (3, 'V-06823400', 'UBAN LEGNY TERESA', '280', 'Ingeniería Industrial') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (4, 'V-13401660', 'CALDERON QUIVAS REINALDO RAMON', '610', 'Licenciatura en Administración - Mención Empresas ') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (5, 'V-18387899', 'MARTINEZ ROXDELIS ELENIZA', '610', 'Licenciatura en Administración - Mención Empresas ') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (6, 'V-31105291', 'FERNIN TOLEDO DANIEL JOSUE', '236', 'Ingeniería de Sistemas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (7, 'V-15336186', 'MENDOZA ROJAS DARVIN JAIRO', '613', 'Licenciatura en Administración de Empresas mención Riesgos y Seguros') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (9, 'V-08952715', 'MEDRANO BELLORIN JULIAN JOSE', '508', 'Licenciatura en Educación mención Educación Matemática') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (10, 'V-11206309', 'ABREU MENDOZA ELADIO JESUS', '610', 'Licenciatura en Administración - Mención Empresas Comerciales') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (11, 'V-15200799', 'TRUJILLO SANDRA PATRICIA', '542', 'Licenciatura en Educación mención Preescolar') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (12, 'V-16221653', 'PARRA PEREIRA JOSE MIGUEL', '612', 'Licenciatura en Administración - Mención Recursos Humanos') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (13, 'V-16613709', 'VILLANUEVA RASSE ADRIANA DEL VALLE', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (14, 'V-16699180', 'GIOVETTI YPLANDA MARGARITA', '612', 'Licenciatura en Administración - Mención Recursos Humanos') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (15, 'V-19140953', 'CEQUEA FRANCO MARYOLI DE LAS', '612', 'Licenciatura en Administración - Mención Recursos Humanos') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (16, 'V-19403195', 'MENDOZA MARCANO FRANCIS JHOALY', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (17, 'V-23725487', 'VILLAREAL QUINTERO MONICA MARIA', '542', 'Licenciatura en Educación mención Preescolar') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (18, 'V-21198540', 'BELLORIN TORRES VIVIANA YUBEL', '542', NULL) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (19, 'V-24226134', 'SALCEDO GONZALEZ OSWALDO DAVID', '281', NULL) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (20, 'V-24580333', 'GONZALEZ VELASAUEZ EDGAR SEGUNDO', '281', NULL) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (23, 'V-32417265', 'GUZMAN DIAZ EDWIN ENRIQUE', '236', 'Ingeniería de Sistemas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (24, 'V-25355886', 'LOZADA BRITO JOSE GREGORIO', '280', 'INGENIERIA INDUSTRIAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (25, 'V-27802269', 'montaño guerra andro fernando', '236', 'Ingeniería de Sistemas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (26, 'V-18657909', 'SANCHEZ LIRA CHRISTIAN JESUS', '237', 'T.S.U. Mantenimiento de Sistemas Informáticos') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (27, 'V-11208458', 'MATUTE FERMIN CECILIO ANTONIO', '236', 'Ingeniería de Sistemas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (28, 'V-31164128', 'RIVERO CUENCE KADIZ GABRIEL', '237', 'T.S.U. Mantenimiento de Sistemas Informáticos') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (29, 'V-08953003', 'ESTEVES GURRA OSCAR ALEJANDRO', '236', 'Ingeniería de Sistemas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (30, 'V-18657701', 'ROJAS RODRIGUEZ BEIGLIS JOSEFINA', '440', 'EDUCACION INTEGRAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (31, 'V-19140921', 'MARCANO ORDAZ MILAGROS DEL VALLE', '440', 'EDUCACION INTEGRAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (32, 'V-24119251', 'HERNANDEZ CARRIN GABRIEL MOISES', '440', 'EDUCACION INTEGRAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (33, 'V-30656477', 'PINTO HERNANDEZ OMAILYN ITHIEL', '280', 'INGENIERIA INDUSTRIAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (35, 'V-31559376', 'MARQUEZ HERRERA CECILIA GABRIEL', '280', 'INGENIERIA INDUSTRIAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (36, 'V-32273433', 'SANDOVAL ASTUDILLO YULIANNYS A', '440', 'EDUCACION INTEGRAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (37, 'V-33145659', 'CARABALLO MARTINEZ MARIA ISABEL', '612', 'Licenciatura en Administración - Mención Recursos Humanos') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (38, 'V-33357628', 'PARRA BRICEÑO BRANDOS JONAS', '236', 'T.S.U. Mantenimiento de Sistemas Informáticos') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (39, 'V-33818735', 'RODRIGUEZ ROJAS DANIELLYS VALENTINA', '613', 'Licenciatura en Administración de Empresas mención Riesgos y Seguros') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (40, 'V-34196919', 'MENDOZA LOCHAMANCIN LEIDISMAR', '612', 'Licenciatura en Administración - Mención Recursos Humanos') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (41, 'V-31463200', 'CARREÑO ALEJANDRA LUCIANY', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (42, 'V-28741147', 'IBARRA CASTRO AXXA EIDEMAR', '237', 'T.S.U. Mantenimiento de Sistemas Informáticos') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (43, 'V-18659917', 'BRITO EMMA KARINA', '440', 'EDUCACION INTEGRAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (44, 'V-18914541', 'OLIVEROS DE RODRÍGUEZ YERALDINE', '440', 'EDUCACION INTEGRAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (45, 'V-25124024', 'MATA GONZÁLEZ ROSAIDYS ANDREINA', '440', 'EDUCACION INTEGRAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (46, 'V-28018752', 'MOTA MORENO HÉCTOR ANDRÉS', '440', 'EDUCACION INTEGRAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (47, 'V-28603527', 'PAZ JIMÉNEZ RONALDY NAZARETH', '440', 'EDUCACION INTEGRAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (48, 'V-28657207', 'RIVAS MARCANO YOSLER PASCUAL', '440', 'EDUCACION INTEGRAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (49, 'V-12127118', 'OREA BARRETO CESAR OSWALDO', '440', 'EDUCACION INTEGRAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (50, 'V-14905885', 'MONTEVERDE GIL FREDDY GREGORIO', '430', 'Técnico Superior Universitario (TSU) en Educación IntegraL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (51, 'V-17055271', 'RIVERO MARTINEZ CADIS JOEL', '430', 'Técnico Superior Universitario (TSU) en Educación IntegraL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (52, 'V-25859164', 'SALAZAR BOLIVAR RAFAEL OGUSTO', '430', 'Técnico Superior Universitario (TSU) en Educación IntegraL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (53, 'V-12686634', 'PRIETO GONZÁLEZ XIOMARA', '542', 'Licenciatura en Educación mención Preescolar') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (54, 'V-15336047', 'DÍAZ CORREA ROSELLYN DARGELYS', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (55, 'V-19140930', 'LÓPEZ RODRÍGUEZ LEXIS MARICELA', '542', 'Licenciatura en Educación mención Preescolar') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (56, 'V-26909764', 'BOMPART MARIN SANEYCAR DANIELA', '542', 'Licenciatura en Educación mención Preescolar') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (57, 'V-30838011', 'SALAZAR TOVAR TATIANA COROMOTO', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (58, 'V-28672058', 'CASTRO MARCANO DAILMAR EGARLY', '440', 'EDUCACION INTEGRAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (59, 'V-16216700', 'ALCALÁ SALAZAR ROSA URISBETH', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (60, 'V-28349903', 'LISTA RODRÍGUEZ LEIDY VANESSA', '542', 'Licenciatura en Educación mención Preescolar') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (61, 'V-34389583', 'MÁRQUEZ MARTINEZ JESUANNYS JOSÉ', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (62, 'V-19140227', 'LIRA NUÑEZ ROMÁN JOSÉ', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (63, 'V-24119219', 'FERMÍN MARTINEZ MARIELBELYS', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (64, 'V-25930610', 'ROJAS MORENO FABIO LUIS', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (65, 'V-17745959', 'PACHECO GÓMEZ MILIANNYS LOURDES', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (66, 'V-27928807', 'ARCILA LEAL YOSELIN ANDREINA', '430', 'Técnico Superior Universitario (TSU) en Educación IntegraL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (67, 'V-14904783', 'BARRIOS GRACIAS YOHANA JOSEFINA', '610', 'Licenciatura en Contaduría Pública') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (68, 'V-16008954', 'MARTINEZ CARMEN MARGARITA', '610', 'Licenciatura en Contaduría Pública') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (69, 'V-17382235', 'YELAMO BERGANTINI MAYNES ALEJANDRO', '613', 'Licenciatura en Administración de Empresas mención Riesgos y Seguros') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (70, 'V-25678687', 'RIVAS NUÑES ANNIELIS ANTONIETA', '508', 'Licenciatura en Educación mención Educación Matemática') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (71, 'V-17999287', 'MORALES DIAZ ELYSBETH DEL CARMEN', '280', 'Ingeniería Industrial') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (72, 'V-16698115', 'RENGEL RODRIGUEZ MARISEL DELIS', '610', 'Licenciatura en Contaduría Pública') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (73, 'V-18657250', 'SOLER GONZALEZ JOSE ALBERTO', '610', 'Licenciatura en Contaduría Pública') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (74, 'V-25125820', 'RODRIGUEZ GOMEZ LUISEYDITH JOSE', '612', 'Licenciatura en Administración de Empresas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (75, 'V-25331002', 'RINCONES MATA GREIDIS MARIANA', '610', 'Licenciatura en Contaduría Pública') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (76, 'V-27032931', 'TARAZONA CENTENO CARLA ALEXAIDA', '612', 'Licenciatura en Administración de Empresas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (77, 'V-27802704', 'MORENO LIRA ADRIANNYS DEL VALLE', '542', 'Licenciatura en Educación mención Preescolar') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (78, 'V-28018644', 'ABREU MILANO LIZMAR MARIA', '610', 'Licenciatura en Contaduría Pública') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (79, 'V-28349996', 'GONZLEZ VEGAS STEFANY DE LOS', '612', 'Licenciatura en Administración de Empresas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (80, 'V-28768129', 'FERMIN SANCHEZ CESAR MIGUEL', '610', 'Licenciatura en Contaduría Pública') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (81, 'V-31371547', 'URBAEZ DE LA ROSA VALERIA ESPERANZA', '612', 'Licenciatura en Administración de Empresas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (82, 'V-32284486', 'RIVERO CUENCE KARINA DEL VALLE', '126', 'Licenciatura en Matemática') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (83, 'V-33105363', 'GOMEZ BETANCOURT JOSE ANTONIO P', '236', 'Ingeniería de Sistemas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (84, 'V-33810735', 'RODRIGUEZ ROJAS DANIELLYS VALE', '613', 'Licenciatura en Administración de Empresas mención Riesgos y Seguros') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (85, 'V-14905884', 'MONTEVERDE GIL FREDDY GREGORIO', '430', 'Técnico Superior Universitario (TSU) en Educación IntegraL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (86, 'V-20593274', 'FARIAS UGUETO LORENA KATIUSKA', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (87, 'V-18657908', 'SANCHEZ LIRA NANCY CRISTINA', '612', 'Licenciatura en Administración de Empresas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (88, 'V-18098485', 'GIL CEDEÑOMILEYDIS NOHEMI', '610', 'Licenciatura en Contaduría Pública') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (89, 'V-20852586', 'CABAÑA SUAREZ JESUS ABRAHAM', '281', 'T.S.U. Higiene y Seguridad Industrial') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (90, 'V-20853756', 'GARCIA BRAZON ITMER DAVID', '236', 'Ingeniería de Sistemas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (91, 'V-25661378', 'CUESTA DE ROMERO OLGA PATRICIA', '610', 'Licenciatura en Contaduría Pública') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (92, 'V-26909830', 'ROSAS MILANO ANLISTH ALEJANDRA', '237', 'T.S.U. Mantenimiento de Sistemas Informáticos') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (93, 'V-28374252', 'ZORRILLA CENTENO MARIELIZA EL VALLE', '281', 'T.S.U. Higiene y Seguridad Industrial') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (94, 'V-17525966', 'VALDEZ MORALES MIRAIDA DEL VALLE', '237', 'T.S.U. Mantenimiento de Sistemas Informáticos') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (95, 'V-28633617', 'LOPEZ HERRERA CARLOS VICENTE', '236', 'Ingeniería de Sistemas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (96, 'V-19402735', 'MEDINA SUARES JOSBELYS CAROLINA', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (97, 'V-25926844', 'ROMERO SANCHEZ ADA KATERINE', '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (98, 'V-32461286', 'TORIBE RODRIGUEZ MARIA EUGENIA', '236', 'Ingeniería de Sistemas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);
INSERT INTO `alumno` (`id`, `cedula`, `nombre`, `codigo_carrera`, `descripcion_carrera`) VALUES (99, 'V-32329088', 'LEON RODRIGUEZ YSBETHLIS YUDAL', '610', 'Licenciatura en Contaduría Pública') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `codigo_carrera` = VALUES(`codigo_carrera`), `descripcion_carrera` = VALUES(`descripcion_carrera`);

-- Estructura para tabla `asesor`
CREATE TABLE `asesor` (
  `id` int NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `rol_id` int NOT NULL,
  PRIMARY KEY (`cedula`) /*T![clustered_index] NONCLUSTERED */,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `usuario` (`usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_asesor_rol` (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (1, '9858269', 'Ing. Matías Sarabia C.', 'msarabia', 'a32afbe54e4fbab0c8c44c01f5b90792', 'jsarabia22@gmail.com', 1) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (5, '1423569', 'Yovinza Salazar', 'ysalazar', '8c0e26f44ec49bc6134eaef88172776a', 'ysalazar@gmail.com', 1) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (6, '31541259', 'LEONARDO NOA', 'nnoa', 'e10adc3949ba59abbe56e057f20f883e', 'leonardonoa803@gmail.com', 1) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (7, '5337512', 'Mcs. Tibisay Padrino', 'tpadrino', 'e1e0144bb53e180df085993ea3e333c4', 'tibisayp337@gmail.com', 2) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (8, '11210868', 'MSc María Lo Galbo', 'mlogalbo', '392050e8046315720e56a64af5aab3fa', 'marialogalbouna@gmail.com', 2) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (9, '16214477', 'Lcda. Luz Jaramillo', 'l.jaramillo', '259d1a48eef31940c0cc78fcde156a8c', 'milagrosluz1982@gmail.com', 2) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (10, '8894910', 'Lcda. Rorima Nuñez', 'majomernu', '94ca9a46b47091589df54c2c8c9c2fd3', 'roraiman@gmail.com', 2) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (11, '8950642', 'Lcdo. Edgar Abreu', 'eabreu', '27acd5756d627f79c058e779c04c0590', 'ejam772020@gmail.com', 2) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (12, '20160859', 'Ing. Chrismar Sarabia', 'schrismar', '6f55aff6bcc2b1cbfb9272c08217ae2c', 'chrismarcsh34@gmail.com', 2) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (13, '14487374', 'Lcda. Leydis Zacarias', 'leyditaz18', 'f50ab171e9bfc92d1b6b6f4deebab331', 'zacariasleydis@gmail.com', 2) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (14, '12545786', 'Dra. Leslibeth Sucre G.', 'Leslibeth', 'a1a63fb4572c577f03feb21df3bd150b', 'postgradounadelta@gmail.com', 2) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (15, '5336874', 'MSc. Nancy Lira', 'Jhanisse01', 'd369955ade80ee9e9de2d44e3f4415ab', 'nancyclira58@gmail.com', 2) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (16, '11213945', 'TOMASA RODRÍGUEZ', 'tomi', 'a4501afac769b0cbf81e3a8087e0e9ec', 'tominesrm@gmail.com', 2) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (17, '8952357', 'Eldris Brisceida Salazar Jiménez', 'eldrina', 'e50098c3f1a2a9bd9d5c1ad300527ed8', 'uneldris@gmail.com', 2) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);
INSERT INTO `asesor` (`id`, `cedula`, `nombre`, `usuario`, `clave`, `email`, `rol_id`) VALUES (18, '13403217', 'Yorbeydis Dicurú', 'yor', 'e10adc3949ba59abbe56e057f20f883e', 'y.dsarabia@gmail.com', 2) ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula` = VALUES(`cedula`), `nombre` = VALUES(`nombre`), `usuario` = VALUES(`usuario`), `clave` = VALUES(`clave`), `email` = VALUES(`email`), `rol_id` = VALUES(`rol_id`);

-- Estructura para tabla `asesor_carrera`
CREATE TABLE `asesor_carrera` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asesor_cedula` varchar(20) NOT NULL,
  `carrera` varchar(20) NOT NULL,
  `asignatura` varchar(20) NOT NULL,
  `cantidad_alumno` int NOT NULL,
  `semestre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=30001;

INSERT INTO `asesor_carrera` (`id`, `asesor_cedula`, `carrera`, `asignatura`, `cantidad_alumno`, `semestre`) VALUES (1, '9858269', '236', '106', 72, '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `asesor_cedula` = VALUES(`asesor_cedula`), `carrera` = VALUES(`carrera`), `asignatura` = VALUES(`asignatura`), `cantidad_alumno` = VALUES(`cantidad_alumno`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificacion_050`
CREATE TABLE `calificacion_050` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificacion_050` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (17, 'VILLAREAL QUINTERO MONICA MARIA', 'V-23725487', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificacion_050` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (77, 'MORENO LIRA ADRIANNYS DEL VALLE', 'V-27802704', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificacion_051`
CREATE TABLE `calificacion_051` (
  `id` int NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificacion_051` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (17, 'VILLAREAL QUINTERO MONICA MARIA', 'V-23725487', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificacion_052`
CREATE TABLE `calificacion_052` (
  `id` int NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificacion_052` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (17, 'VILLAREAL QUINTERO MONICA MARIA', 'V-23725487', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificacion_053`
CREATE TABLE `calificacion_053` (
  `id` int NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificacion_053` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (55, 'LÓPEZ RODRÍGUEZ LEXIS MARICELA', 'V-19140930', '11213945', '0.00', '0.00', '0.00', '0.00', '', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificacion_056`
CREATE TABLE `calificacion_056` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificacion_056` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (18, 'BELLORIN TORRES VIVIANA YUBEL', 'V-21198540', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificacion_057`
CREATE TABLE `calificacion_057` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificacion_057` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (53, 'PRIETO GONZÁLEZ XIOMARA', 'V-12686634', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificacion_115`
CREATE TABLE `calificacion_115` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificacion_115` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (11, 'TRUJILLO SANDRA PATRICIA', 'V-15200799', '9858269', '0.00', '0.00', '1.00', '1.00', '1.00', '1.00', '6.00', 'Seis', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificacion_405`
CREATE TABLE `calificacion_405` (
  `id` int NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_410`
CREATE TABLE `calificacion_410` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_412`
CREATE TABLE `calificacion_412` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_427`
CREATE TABLE `calificacion_427` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_433`
CREATE TABLE `calificacion_433` (
  `id` int NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_437`
CREATE TABLE `calificacion_437` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_468`
CREATE TABLE `calificacion_468` (
  `id` int NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_477`
CREATE TABLE `calificacion_477` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_480`
CREATE TABLE `calificacion_480` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_488`
CREATE TABLE `calificacion_488` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_489`
CREATE TABLE `calificacion_489` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_498`
CREATE TABLE `calificacion_498` (
  `id` int NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `cedula_alumno` varchar(30) NOT NULL,
  `cedula_asesor` varchar(30) NOT NULL,
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_516`
CREATE TABLE `calificacion_516` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_517`
CREATE TABLE `calificacion_517` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_524`
CREATE TABLE `calificacion_524` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_530`
CREATE TABLE `calificacion_530` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_534`
CREATE TABLE `calificacion_534` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_536`
CREATE TABLE `calificacion_536` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificacion_536` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (4, 'CALDERON QUIVAS REINALDO RAMON', 'V-13401660', '9858269', '1.00', '1.00', '0.00', '1.00', '1.00', '8.00', 'Ocho', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificacion_559`
CREATE TABLE `calificacion_559` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificacion_559` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (18, 'BELLORIN TORRES VIVIANA YUBEL', 'V-21198540', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificacion_562`
CREATE TABLE `calificacion_562` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificacion_562` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `obj7`, `obj8`, `obj9`, `obj10`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (11, 'TRUJILLO SANDRA PATRICIA', 'V-15200799', '11213945', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `obj7` = VALUES(`obj7`), `obj8` = VALUES(`obj8`), `obj9` = VALUES(`obj9`), `obj10` = VALUES(`obj10`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificacion_570`
CREATE TABLE `calificacion_570` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_571`
CREATE TABLE `calificacion_571` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_576`
CREATE TABLE `calificacion_576` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_612`
CREATE TABLE `calificacion_612` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificacion_632`
CREATE TABLE `calificacion_632` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificacion_632` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `obj7`, `obj8`, `obj9`, `obj10`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (10, 'ABREU MENDOZA ELADIO JESUS', 'V-11206309', '8894910', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `obj7` = VALUES(`obj7`), `obj8` = VALUES(`obj8`), `obj9` = VALUES(`obj9`), `obj10` = VALUES(`obj10`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificacion_632` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `obj7`, `obj8`, `obj9`, `obj10`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (80, 'FERMIN SANCHEZ CESAR MIGUEL', 'V-28768129', '8894910', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `obj7` = VALUES(`obj7`), `obj8` = VALUES(`obj8`), `obj9` = VALUES(`obj9`), `obj10` = VALUES(`obj10`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificacion_814`
CREATE TABLE `calificacion_814` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificaciones`
CREATE TABLE `calificaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cod_materia` varchar(20) NOT NULL,
  `peso_acumulado` decimal(5,2) NOT NULL,
  `calificacion_definitiva` decimal(5,2) NOT NULL,
  `cedula_asesor` varchar(20) DEFAULT NULL,
  `semestre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=30001;

-- Estructura para tabla `calificaciones_107_9858269_2026_2`
CREATE TABLE `calificaciones_107_9858269_2026_2` (
  `id` int NOT NULL,
  `cedula_estudiante` varchar(20) NOT NULL,
  `nombre_alumno` varchar(150) DEFAULT '',
  `obj1` decimal(5,2) DEFAULT '0.00',
  `obj2` decimal(5,2) DEFAULT '0.00',
  `obj3` decimal(5,2) DEFAULT '0.00',
  `obj4` decimal(5,2) DEFAULT '0.00',
  `obj5` decimal(5,2) DEFAULT '0.00',
  `obj6` decimal(5,2) DEFAULT '0.00',
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `cedula_asesor` varchar(20) DEFAULT NULL,
  `semestre` varchar(20) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */,
  UNIQUE KEY `unique_estudiante` (`cedula_estudiante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificaciones_116_9858269_2026_2`
CREATE TABLE `calificaciones_116_9858269_2026_2` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificaciones_116_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (41, 'CARREÑO ALEJANDRA LUCIANY', 'V-31463200', '9858269', '1.00', '1.00', '1.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_116_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (42, 'IBARRA CASTRO AXXA EIDEMAR', 'V-28741147', '9858269', '1.00', '1.00', '1.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_116_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (93, 'ZORRILLA CENTENO MARIELIZA EL VALLE', 'V-28374252', '9858269', '1.00', '1.00', '1.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_116_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (95, 'LOPEZ HERRERA CARLOS VICENTE', 'V-28633617', '9858269', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_116_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (96, 'MEDINA SUARES JOSBELYS CAROLINA', 'V-19402735', '9858269', '1.00', '1.00', '1.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_116_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (97, 'ROMERO SANCHEZ ADA KATERINE', 'V-25926844', '9858269', '1.00', '1.00', '1.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_116_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (98, 'TORIBE RODRIGUEZ MARIA EUGENIA', 'V-32461286', '9858269', '1.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_116_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (99, 'LEON RODRIGUEZ YSBETHLIS YUDAL', 'V-32329088', '9858269', '0.00', '1.00', '1.00', '0.00', '0.00', '0.00', '0.00', 'Cero', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificaciones_300_9858269_2026_2`
CREATE TABLE `calificaciones_300_9858269_2026_2` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificaciones_300_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (2, 'RIVERO CUENCE KATERIN DEL VALLE', 'V-28766928', '9858269', '1.00', '0.00', '1.00', '0.00', '1.00', '1.00', '6.00', 'Seis', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_300_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (3, 'UBAN LEGNY TERESA', 'V-6823400', '9858269', '1.00', '1.00', '1.00', '1.00', '1.00', '0.00', '8.00', 'Ocho', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_300_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (10, 'ABREU MENDOZA ELADIO JESUS', 'V-11206309', '9858269', '1.00', '0.00', '1.00', '0.00', '1.00', '1.00', '6.00', 'Seis', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_300_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (14, 'GIOVETTI YPLANDA MARGARITA', 'V-16699180', '9858269', '0.00', '0.00', '1.00', '1.00', '1.00', '1.00', '6.00', 'Seis', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificaciones_315_9858269_2026_2`
CREATE TABLE `calificaciones_315_9858269_2026_2` (
  `id` int NOT NULL,
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
  `nota_final` decimal(5,2) DEFAULT '0.00',
  `nota_final_letra` varchar(10) DEFAULT '',
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificaciones_323_9858269_2026_2`
CREATE TABLE `calificaciones_323_9858269_2026_2` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Estructura para tabla `calificaciones_327_9858269_2026_2`
CREATE TABLE `calificaciones_327_9858269_2026_2` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificaciones_327_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `obj7`, `obj8`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (15, 'CEQUEA FRANCO MARYOLI DE LAS', 'V-19140953', '9858269', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `obj7` = VALUES(`obj7`), `obj8` = VALUES(`obj8`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `calificaciones_371_9858269_2026_2`
CREATE TABLE `calificaciones_371_9858269_2026_2` (
  `id` int NOT NULL,
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
  `semestre` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `calificaciones_371_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `obj7`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (2, 'RIVERO CUENCE KATERIN DEL VALLE', 'V-28766928', '9858269', '1.00', '1.00', '1.00', '1.00', '0.00', '1.00', '1.00', '6.00', 'Seis', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `obj7` = VALUES(`obj7`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_371_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `obj7`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (11, 'TRUJILLO SANDRA PATRICIA', 'V-15200799', '9858269', '1.00', '1.00', '0.00', '1.00', '1.00', '1.00', '0.00', '7.00', 'Siete', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `obj7` = VALUES(`obj7`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_371_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `obj7`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (12, 'PARRA PEREIRA JOSE MIGUEL', 'V-16221653', '9858269', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `obj7` = VALUES(`obj7`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_371_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `obj7`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (23, 'GUZMAN DIAZ EDWIN ENRIQUE', 'V-32417265', '9858269', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `obj7` = VALUES(`obj7`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);
INSERT INTO `calificaciones_371_9858269_2026_2` (`id`, `nombre_alumno`, `cedula_alumno`, `cedula_asesor`, `obj1`, `obj2`, `obj3`, `obj4`, `obj5`, `obj6`, `obj7`, `nota_final`, `nota_final_letra`, `semestre`) VALUES (29, 'ESTEVES GURRA OSCAR ALEJANDRO', 'V-8953003', '9858269', '1.00', '1.00', '1.00', '0.00', '1.00', '1.00', '1.00', '7.00', 'Siete', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_alumno` = VALUES(`nombre_alumno`), `cedula_alumno` = VALUES(`cedula_alumno`), `cedula_asesor` = VALUES(`cedula_asesor`), `obj1` = VALUES(`obj1`), `obj2` = VALUES(`obj2`), `obj3` = VALUES(`obj3`), `obj4` = VALUES(`obj4`), `obj5` = VALUES(`obj5`), `obj6` = VALUES(`obj6`), `obj7` = VALUES(`obj7`), `nota_final` = VALUES(`nota_final`), `nota_final_letra` = VALUES(`nota_final_letra`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `carrera`
CREATE TABLE `carrera` (
  `id` int NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre_carrera` varchar(150) NOT NULL,
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (1, '106', 'Licenciatura en Educación - Mención Dificultades del Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (3, '108', 'Licenciatura en Educación - Mención Matemática') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (4, '111', 'Licenciatura en Educación - Mención Integral') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (6, '280', 'Ingeniería Industrial') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (11, '000', 'Ciclo Introductorio') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (12, '126', 'Licenciatura en Matemática') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (13, '236', 'Ingeniería de Sistemas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (14, '237', 'T.S.U. Mantenimiento de Sistemas Informáticos') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (16, '281', 'T.S.U. Higiene y Seguridad Industrial') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (17, '508', 'Licenciatura en Educación mención Educación Matemática') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (18, '521', 'Licenciatura en Educación mención Dificultades de Aprendizaje') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (19, '542', 'Licenciatura en Educación Mención Inicial') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (20, '610', 'Licenciatura en Contaduría Pública') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (21, '612', 'Licenciatura en Administración de Empresas') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (23, '430', 'Técnico Superior Universitario (TSU) en Educación IntegraL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);
INSERT INTO `carrera` (`id`, `codigo`, `nombre_carrera`) VALUES (24, '440', 'EDUCACION INTEGRAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `nombre_carrera` = VALUES(`nombre_carrera`);

-- Estructura para tabla `control_asesoria`
CREATE TABLE `control_asesoria` (
  `id` int NOT NULL,
  `cedula_alumno` varchar(20) NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `codigo_carrera` varchar(20) NOT NULL,
  `tipo_asesoria` varchar(100) NOT NULL,
  `codigo_materia` varchar(20) NOT NULL,
  `cedula_asesor` varchar(20) NOT NULL,
  `nombre_asesor` varchar(150) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `semestre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `control_asesoria` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `tipo_asesoria`, `codigo_materia`, `cedula_asesor`, `nombre_asesor`, `fecha_hora`, `semestre`) VALUES (18, 'V-28741147', 'IBARRA CASTRO AXXA EIDEMAR', '237', 'EN LINEA', '116', '9858269', 'Matias Sarabia', '2026-09-21 01:40:56', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula_alumno` = VALUES(`cedula_alumno`), `nombre_alumno` = VALUES(`nombre_alumno`), `codigo_carrera` = VALUES(`codigo_carrera`), `tipo_asesoria` = VALUES(`tipo_asesoria`), `codigo_materia` = VALUES(`codigo_materia`), `cedula_asesor` = VALUES(`cedula_asesor`), `nombre_asesor` = VALUES(`nombre_asesor`), `fecha_hora` = VALUES(`fecha_hora`), `semestre` = VALUES(`semestre`);
INSERT INTO `control_asesoria` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `tipo_asesoria`, `codigo_materia`, `cedula_asesor`, `nombre_asesor`, `fecha_hora`, `semestre`) VALUES (19, 'V-31463200', 'CARREÑO ALEJANDRA LUCIANY', '521', 'EN LINEA', '116', '9858269', 'Matias Sarabia', '2026-09-21 01:41:36', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula_alumno` = VALUES(`cedula_alumno`), `nombre_alumno` = VALUES(`nombre_alumno`), `codigo_carrera` = VALUES(`codigo_carrera`), `tipo_asesoria` = VALUES(`tipo_asesoria`), `codigo_materia` = VALUES(`codigo_materia`), `cedula_asesor` = VALUES(`cedula_asesor`), `nombre_asesor` = VALUES(`nombre_asesor`), `fecha_hora` = VALUES(`fecha_hora`), `semestre` = VALUES(`semestre`);
INSERT INTO `control_asesoria` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `tipo_asesoria`, `codigo_materia`, `cedula_asesor`, `nombre_asesor`, `fecha_hora`, `semestre`) VALUES (20, 'V-14904783', 'BARRIOS GRACIAS YOHANA JOSEFINA', '610', 'VIRTUAL', '116', '9858269', 'Ing. Matías Sarabia C.', '2026-09-23 06:59:12', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula_alumno` = VALUES(`cedula_alumno`), `nombre_alumno` = VALUES(`nombre_alumno`), `codigo_carrera` = VALUES(`codigo_carrera`), `tipo_asesoria` = VALUES(`tipo_asesoria`), `codigo_materia` = VALUES(`codigo_materia`), `cedula_asesor` = VALUES(`cedula_asesor`), `nombre_asesor` = VALUES(`nombre_asesor`), `fecha_hora` = VALUES(`fecha_hora`), `semestre` = VALUES(`semestre`);
INSERT INTO `control_asesoria` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `tipo_asesoria`, `codigo_materia`, `cedula_asesor`, `nombre_asesor`, `fecha_hora`, `semestre`) VALUES (23, 'V-33145659', 'CARABALLO MARTINEZ MARIA ISABEL', '612', 'EN LINEA', '116', '9858269', 'Ing. Matías Sarabia C.', '2026-09-23 07:30:33', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula_alumno` = VALUES(`cedula_alumno`), `nombre_alumno` = VALUES(`nombre_alumno`), `codigo_carrera` = VALUES(`codigo_carrera`), `tipo_asesoria` = VALUES(`tipo_asesoria`), `codigo_materia` = VALUES(`codigo_materia`), `cedula_asesor` = VALUES(`cedula_asesor`), `nombre_asesor` = VALUES(`nombre_asesor`), `fecha_hora` = VALUES(`fecha_hora`), `semestre` = VALUES(`semestre`);
INSERT INTO `control_asesoria` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `tipo_asesoria`, `codigo_materia`, `cedula_asesor`, `nombre_asesor`, `fecha_hora`, `semestre`) VALUES (24, 'V-16216700', 'ALCALÁ SALAZAR ROSA URISBETH', '521', 'EN LINEA', '118', '5336874', 'MSc. Nancy Lira', '2026-09-24 21:03:24', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula_alumno` = VALUES(`cedula_alumno`), `nombre_alumno` = VALUES(`nombre_alumno`), `codigo_carrera` = VALUES(`codigo_carrera`), `tipo_asesoria` = VALUES(`tipo_asesoria`), `codigo_materia` = VALUES(`codigo_materia`), `cedula_asesor` = VALUES(`cedula_asesor`), `nombre_asesor` = VALUES(`nombre_asesor`), `fecha_hora` = VALUES(`fecha_hora`), `semestre` = VALUES(`semestre`);
INSERT INTO `control_asesoria` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `tipo_asesoria`, `codigo_materia`, `cedula_asesor`, `nombre_asesor`, `fecha_hora`, `semestre`) VALUES (31, 'V-17525966', 'VALDEZ MORALES', '237', 'PRESENCIAL', '116', '9858269', 'Ing. Matías Sarabia C.', '2026-09-29 21:33:05', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula_alumno` = VALUES(`cedula_alumno`), `nombre_alumno` = VALUES(`nombre_alumno`), `codigo_carrera` = VALUES(`codigo_carrera`), `tipo_asesoria` = VALUES(`tipo_asesoria`), `codigo_materia` = VALUES(`codigo_materia`), `cedula_asesor` = VALUES(`cedula_asesor`), `nombre_asesor` = VALUES(`nombre_asesor`), `fecha_hora` = VALUES(`fecha_hora`), `semestre` = VALUES(`semestre`);
INSERT INTO `control_asesoria` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `tipo_asesoria`, `codigo_materia`, `cedula_asesor`, `nombre_asesor`, `fecha_hora`, `semestre`) VALUES (32, 'V-23725487', 'VILLAREAL QUINTERO MONICA MARIA', '542', 'EN LINEA', '051', '11213945', 'TOMASA RODRÍGUEZ', '2026-09-30 00:34:56', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula_alumno` = VALUES(`cedula_alumno`), `nombre_alumno` = VALUES(`nombre_alumno`), `codigo_carrera` = VALUES(`codigo_carrera`), `tipo_asesoria` = VALUES(`tipo_asesoria`), `codigo_materia` = VALUES(`codigo_materia`), `cedula_asesor` = VALUES(`cedula_asesor`), `nombre_asesor` = VALUES(`nombre_asesor`), `fecha_hora` = VALUES(`fecha_hora`), `semestre` = VALUES(`semestre`);
INSERT INTO `control_asesoria` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `tipo_asesoria`, `codigo_materia`, `cedula_asesor`, `nombre_asesor`, `fecha_hora`, `semestre`) VALUES (33, 'V-12686634', 'PRIETO GONZÁLEZ XIOMARA', '542', 'EN LINEA', '057', '11213945', 'TOMASA RODRÍGUEZ', '2026-10-01 22:07:41', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula_alumno` = VALUES(`cedula_alumno`), `nombre_alumno` = VALUES(`nombre_alumno`), `codigo_carrera` = VALUES(`codigo_carrera`), `tipo_asesoria` = VALUES(`tipo_asesoria`), `codigo_materia` = VALUES(`codigo_materia`), `cedula_asesor` = VALUES(`cedula_asesor`), `nombre_asesor` = VALUES(`nombre_asesor`), `fecha_hora` = VALUES(`fecha_hora`), `semestre` = VALUES(`semestre`);
INSERT INTO `control_asesoria` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `tipo_asesoria`, `codigo_materia`, `cedula_asesor`, `nombre_asesor`, `fecha_hora`, `semestre`) VALUES (34, 'V-14904783', 'BARRIOS GRACIAS YOHANA JOSEFINA', '610', 'PRE', '986', '13403217', 'Yorbeydis Dicurú', '2026-10-14 00:30:09', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula_alumno` = VALUES(`cedula_alumno`), `nombre_alumno` = VALUES(`nombre_alumno`), `codigo_carrera` = VALUES(`codigo_carrera`), `tipo_asesoria` = VALUES(`tipo_asesoria`), `codigo_materia` = VALUES(`codigo_materia`), `cedula_asesor` = VALUES(`cedula_asesor`), `nombre_asesor` = VALUES(`nombre_asesor`), `fecha_hora` = VALUES(`fecha_hora`), `semestre` = VALUES(`semestre`);
INSERT INTO `control_asesoria` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `tipo_asesoria`, `codigo_materia`, `cedula_asesor`, `nombre_asesor`, `fecha_hora`, `semestre`) VALUES (35, 'V-15336047', 'DÍAZ CORREA ROSELLYN DARGELYS', '521', 'ELI', '999', '13403217', 'Yorbeydis Dicurú', '2026-10-14 00:30:33', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula_alumno` = VALUES(`cedula_alumno`), `nombre_alumno` = VALUES(`nombre_alumno`), `codigo_carrera` = VALUES(`codigo_carrera`), `tipo_asesoria` = VALUES(`tipo_asesoria`), `codigo_materia` = VALUES(`codigo_materia`), `cedula_asesor` = VALUES(`cedula_asesor`), `nombre_asesor` = VALUES(`nombre_asesor`), `fecha_hora` = VALUES(`fecha_hora`), `semestre` = VALUES(`semestre`);
INSERT INTO `control_asesoria` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `tipo_asesoria`, `codigo_materia`, `cedula_asesor`, `nombre_asesor`, `fecha_hora`, `semestre`) VALUES (36, 'V-18098485', 'GIL CEDEÑOMILEYDIS NOHEMI', '610', 'ELI', '986', '13403217', 'Yorbeydis Dicurú', '2026-10-14 00:31:00', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula_alumno` = VALUES(`cedula_alumno`), `nombre_alumno` = VALUES(`nombre_alumno`), `codigo_carrera` = VALUES(`codigo_carrera`), `tipo_asesoria` = VALUES(`tipo_asesoria`), `codigo_materia` = VALUES(`codigo_materia`), `cedula_asesor` = VALUES(`cedula_asesor`), `nombre_asesor` = VALUES(`nombre_asesor`), `fecha_hora` = VALUES(`fecha_hora`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `control_correcciones`
CREATE TABLE `control_correcciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cedula_alumno` varchar(20) NOT NULL,
  `nombre_alumno` varchar(150) NOT NULL,
  `codigo_carrera` varchar(20) NOT NULL,
  `codigo_materia` varchar(20) NOT NULL,
  `tipo_correccion` varchar(20) NOT NULL,
  `cedula_asesor` varchar(20) NOT NULL,
  `nombre_asesor` varchar(150) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `semestre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=30001;

INSERT INTO `control_correcciones` (`id`, `cedula_alumno`, `nombre_alumno`, `codigo_carrera`, `codigo_materia`, `tipo_correccion`, `cedula_asesor`, `nombre_asesor`, `fecha`, `semestre`) VALUES (1, 'V-11208458', 'MATUTE FERMIN CECILIO ANTONIO', '236', '813', 'TP', '8952357', 'Eldris Brisceida Salazar Jiménez', '2026-10-15 14:40:34', '2026-2') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `cedula_alumno` = VALUES(`cedula_alumno`), `nombre_alumno` = VALUES(`nombre_alumno`), `codigo_carrera` = VALUES(`codigo_carrera`), `codigo_materia` = VALUES(`codigo_materia`), `tipo_correccion` = VALUES(`tipo_correccion`), `cedula_asesor` = VALUES(`cedula_asesor`), `nombre_asesor` = VALUES(`nombre_asesor`), `fecha` = VALUES(`fecha`), `semestre` = VALUES(`semestre`);

-- Estructura para tabla `materia`
CREATE TABLE `materia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(20) NOT NULL,
  `descripcion` text NOT NULL,
  `numobj` int NOT NULL,
  `minaprueba` decimal(5,2) NOT NULL,
  `semestre` varchar(20) DEFAULT NULL,
  `cedula_asesor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */,
  UNIQUE KEY `unique_codigo` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin AUTO_INCREMENT=60001;

INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (1, '116', 'Introducción a la informática', 6, '9.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (4, '300', 'Fisica', 6, '4.00', '2026-2', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (5, '315', 'Investigación de operaciones', 9, '13.00', '2026-2', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (6, '323', 'Computación I', 6, '26.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (7, '327', 'INTRODUCCIÓN A LA INGENIERÍA DE SISTEMAS', 5, '11.00', '2026-2', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (9, '371', 'TECNOLOGÍA WEB', 7, '12.00', '2026-2', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (10, '115', 'LENGUA Y COMUNICACIÓN', 6, '11.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (11, '536', 'GERENCIA EDUCATIVA', 5, '5.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (13, '405', 'DESARROLLO DE HABILIDADES COGNOSCITIVAS', 4, '3.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (14, '410', 'GEOGRAFIA GENERAL', 8, '7.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (15, '050', 'Educación Inicial', 5, '3.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (16, '052', 'DESARROLLO DEL NIÑO DE 0 A 3 AÑOS', 4, '30.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (17, '051', 'SALUD ALTERACIONES Y PREVENCIÓN EN EDUCACIÓN INI', 4, '3.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (20, '412', 'EDUCACION BASICA', 5, '8.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (21, '427', 'TECNICAS Y RECURSOS PARA EL APRENDIZAJE', 5, '8.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (22, '053', 'DESARROLLO PSICOMOTOR EN EDUCACION INICIAL', 3, '4.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (23, '056', 'EVALUACIÓN Y PLANIFICACIÓN EN EDUCACIÓN INICIAL', 6, '3.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (24, '057', 'DESARROLLO SOCIAL Y EMOCIONAL DEL NIÑO DE 4 A 7 AN', 5, '8.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (25, '480', 'EDUCACION AMBIENTAL', 7, '8.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (26, '559', 'APRENDIZAJE DE LA LECTURA Y LA ESCRITURA', 5, '7.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (27, '489', 'CIENCIAS NATURALES II', 5, '7.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (28, '498', 'SEM DESARR PERS LIDERAZG UNA ESTRAT PARA EL CAM', 4, '3.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (29, '562', 'DESARROLLO DEL LENGUAJE', 10, '6.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (30, '814', 'SEMINARIO DE ACCION SOCIAL', 5, '3.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (31, '632', 'CONTABILIDAD INTERMEDIA', 10, '9.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (32, '433', 'EVALUACION', 4, '8.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (33, '437', 'MUSICA Y ARTES ESCENICAS', 7, '9.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (34, '468', 'NUEVAS FORMAS DE PARTICIPACION CIUDADANA', 3, '4.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (35, '477', 'FUNDAMENTOS DE LA EDUCACIÓN', 5, '3.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (36, '488', 'HISTORIA DE VENEZUELA', 6, '10.00', '2026-2', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (37, '516', 'FUNDAMENTOS DE LA ACCION DOCENTE', 5, '3.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (38, '517', 'FILOSOFÍA DE LA EDUCACIÓN', 6, '6.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (39, '524', 'DESARROLLO DEL SISTEMA EDUCATIVO VENEZOLANO', 6, '8.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (40, '530', 'PLANIFICACIÓN EDUCATIVA', 6, '8.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (41, '534', 'EVALUACION EDUCATIVA', 7, '10.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (42, '570', 'DESARROLLO PSICOLÓGICO', 6, '4.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (43, '571', 'PSICOLOGIA EDUCATIVA', 5, '3.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (44, '576', 'SOCIOLOGIA DE LA EDUCACIÓN Y DESARROLLO COMUNIT', 6, '6.00', '', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia` (`id`, `codigo`, `descripcion`, `numobj`, `minaprueba`, `semestre`, `cedula_asesor`) VALUES (49, '107', 'LOGICA', 6, '4.00', '2026-2', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `numobj` = VALUES(`numobj`), `minaprueba` = VALUES(`minaprueba`), `semestre` = VALUES(`semestre`), `cedula_asesor` = VALUES(`cedula_asesor`);

-- Estructura para tabla `materia_una`
CREATE TABLE `materia_una` (
  `id` int NOT NULL,
  `codigo` varchar(6) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `cedula_asesor` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (2, '051', 'SALUD ALTERACIONES Y PREVENCIÓN EN EDUCACIÓN INI', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (3, '052', 'DESARROLLO DEL NIÑO DE 0 A 3 AÑOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (4, '053', 'DESARROLLO PSICOMOTOR EN EDUCACION INICIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (5, '054', 'DESARROLLO COGNOSCITIVO DEL NIÑO DE 4 A 7 AÑOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (6, '055', 'PRÁCTICA I DESARROLLO DEL NIÑO DE 0 A 3 AÑOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (7, '056', 'EVALUACIÓN Y PLANIFICACIÓN EN EDUCACIÓN INICIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (8, '057', 'DESARROLLO SOCIAL Y EMOCIONAL DEL NIÑO DE 4 A 7 AN', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (9, '058', 'LA FAMILIA, LA COMUNIDAD Y EL NIÑO EN EDUCACIÓN IN', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (10, '059', 'PRÁCTICA II DESARROLLO COGNOSCITIVO, SOCIOEMOCI', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (11, '060', 'CREATIVIDAD EN EDUCACIÓN INICIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (12, '061', 'PRÁCTICA III EL MAESTRO EN AULA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (13, '062', 'EXPRESIÓN Y CULTURA EN EDUCACIÓN INICIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (14, '063', 'SOLUCIÓN A PROBLEMAS EDUCATIVOS EN EDUCACIÓN IN', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (15, '064', 'PRACTICA IV PROCESOS ADMINISTRATIVOS EN CENTROS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (18, '108', 'INGLES', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (20, '116', 'INTRODUCCIÓN A LA INFORMATICA', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (22, '118', 'METODOLOGIA DE LA INVESTIGACION', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (23, '119', 'TEMAS DE ETICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (24, '120', 'LENGUA Y COMUNICACION EN EDUCACION', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (25, '121', 'PROBLEMÁTICA DEL DESARROLLO VENEZOLANO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (26, '122', 'INTRODUCCIÓN A LA HERMENEUTICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (27, '126', 'INTRODUCCION A LA INVESTIGACION', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (28, '175', 'MATEMATICA I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (29, '177', 'MATEMATICA I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (30, '179', 'MATEMATICA II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (31, '200', 'INTRODUCCIÓN A LA INGENIERÍA INDUSTRIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (32, '201', 'SEGURIDAD E HIGIENE INDUSTRIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (33, '202', 'PROCESOS DE MANUFACTURAS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (34, '203', 'CONTROL DE PRODUCCIÓN', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (35, '204', 'MANEJO DE MATERIALES', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (36, '205', 'CONTROL DE CALIDAD', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (37, '206', 'INGENIERIA DE METODOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (38, '207', 'MANTENIMIENTO INDUSTRIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (39, '208', 'DIBUJO INDUSTRIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (40, '209', 'QUIMICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (41, '216', 'INGENIERIA DE PLANTA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (42, '222', 'ECONOMÍA PARA INGENIEROS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (43, '223', 'GERENCIA INDUSTRIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (44, '225', 'EVALUACION DE PROYECTOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (45, '228', 'INSTRUMENTACIÓN Y CONTROL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (46, '231', 'INGENIERIA DE MATERIALES', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (47, '232', 'MECANICA RACIONAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (48, '233', 'ELECTROTECNIA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (49, '234', 'TERMOFLUIDOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (50, '235', 'GERENCIA ORGANIZACIONAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (51, '236', 'LOGISTICA INDUSTRIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (52, '237', 'PRACTICA PROFESIONAL I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (53, '238', 'PRACTICA PROFESIONAL II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (54, '240', 'PROCESOS QUÍMICOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (55, '241', 'GESTIÓN DE CALIDAD', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (56, '251', 'PSICOLOGÍA DEL TRABAJO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (57, '252', 'PREVENCIÓN DE RIESGO I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (58, '255', 'PREVENCION DE RIESGO II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (59, '257', 'PASANTIA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (60, '258', 'ERGONOMIA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (61, '259', 'LEGISLACION LABORAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (62, '300', 'FISICA GENERAL', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (63, '305', 'TEORÍA DE DECISIONES', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (64, '306', 'TEORIA DE SISTEMAS', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (65, '310', 'OPTIMIZACIÓN NO LINEAL', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (66, '311', 'BASE DE DATOS', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (67, '312', 'PROGRAMACIÓN DE SISTEMAS', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (68, '315', 'INVESTIGACIÓN DE OPERACIONES I', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (69, '316', 'MICROPROCESADORES', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (70, '321', 'INVESTIGACIÓN DE OPERACIONES II', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (71, '323', 'COMPUTACION I', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (72, '324', 'COMPUTACION II', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (73, '326', 'FISICA GENERAL II', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (74, '327', 'INTRODUCCIÓN A LA INGENIERÍA DE SISTEMAS', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (75, '330', 'PROCESAMIENTO DE DATOS', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (76, '332', 'GRAFOS Y MATRICES', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (77, '333', 'ARQUITECTURA DEL COMPUTADOR', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (78, '334', 'COMPUTACIÓN GRÁFICA', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (79, '335', 'SISTEMAS DE INFORMACION I', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (80, '336', 'SISTEMAS DE INFORMACIÓN II', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (81, '337', 'SIMULACION DE SISTEMAS', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (82, '338', 'SISTEMAS DE INFORMACION III', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (83, '339', 'PRACTICA PROFESIONAL I', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (84, '341', 'PRACTICA PROFESIONAL II', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (85, '342', 'REDES DE COMPUTADORAS', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (86, '347', 'INTRODUCCIÓN A LA INTELIGENCIA ARTIFICIAL Y A LOS ', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (87, '348', 'INVESTIGACION DE OPERACIONES II', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (88, '349', 'ORGANIZACIÓN Y MÉTODOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (89, '358', 'SISTEMAS OPERATIVOS', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (90, '370', 'FUNDAMENTOS DEL COMPUTADOR', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (91, '371', 'TECNOLOGÍA WEB', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (92, '372', 'MANTENIMIENTO PREVENTIVO Y CORRECTIVO', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (93, '373', 'MANTENIMIENTO PERFECTIVO Y ADAPTATIVO', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (94, '374', 'MARCO LEGAL NFORMÁTICO', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (95, '375', 'PASANTIA', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (96, '405', 'DESARROLLO DE HABILIDADES COGNOSCITIVAS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (97, '408', 'MATEMATICA I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (98, '410', 'GEOGRAFIA GENERAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (99, '411', 'DESARROLLO PSICOSOCIAL DEL LENGUAJE', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (100, '412', 'EDUCACION BASICA', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (101, '414', 'MATEMATICA II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (102, '416', 'GEOGRAFIA DE VENEZUELA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (103, '420', 'GEOMETRIA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (104, '421', 'PLANIFICACION DE LA INSTRUCCION', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (105, '423', 'SEM DESARR PERS DISEN PUBLIC PERIODICAS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (106, '427', 'TECNICAS Y RECURSOS PARA EL APRENDIZAJE', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (107, '428', 'HISTORIA UNIVERSAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (108, '431', 'ARTES PLASTICAS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (109, '433', 'EVALUACION', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (110, '434', 'FORMACION CIUDADANA', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (111, '437', 'MUSICA Y ARTES ESCENICAS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (112, '440', 'INTRODUCCION A LA INFORMATICA', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (113, '444', 'EDUCACION FISICA Y DEPORTES', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (114, '451', 'SEMINARIO DE INVESTIGACION EDUCATIVA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (115, '454', 'ANALISIS GRAMATICAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (116, '457', 'LITERATURA VENEZOLANA I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (117, '465', 'PROCESOS CULTURALES DE LA VENEZUELA CONTEMPOR', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (118, '468', 'NUEVAS FORMAS DE PARTICIPACION CIUDADANA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (119, '469', 'HISTORIA Y GEOGRAFIA REGIONAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (120, '471', 'PRACTICA DOCENTE I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (121, '472', 'PRACTICA DOCENTE II', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (122, '473', 'PRACTICA DOCENTE III', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (123, '474', 'PRACTICA DOCENTE IV', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (124, '475', 'PRACTICA DOCENTE V', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (125, '476', 'MATEMATICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (126, '477', 'FUNDAMENTOS DE LA EDUCACIÓN', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (127, '478', 'LECTOESCRITURA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (128, '479', 'ENSEÑANZA DE LA MATEMATICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (129, '480', 'EDUCACION AMBIENTAL', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (130, '481', 'LITERATURA INFANTIL Y JUVENIL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (131, '483', 'PLANIFICACION DE LA ENSENANZA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (132, '484', 'GEOGRAFIA GENERAL Y DE VENEZUELA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (133, '485', 'CIENCIAS NATURALES I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (134, '486', 'EDUCACION ESTETICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (135, '487', 'DIDACTICA PARA EL DOCENTE INTEGRADOR', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (136, '488', 'HISTORIA DE VENEZUELA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (137, '489', 'CIENCIAS NATURALES II', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (138, '490', 'SEM DESARR PERS COMUNICACION EFICAZ', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (139, '491', 'ENSEÑANZA DE LA LENGUA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (140, '492', 'SEMINARIO PRACTICO FORMACION PARA EL TRABAJO', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (141, '493', 'EVALUACION', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (142, '494', 'EDUCACION FISICA Y RECREACION', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (143, '495', 'PRACTICA DE ACCION DOCENTE', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (144, '497', 'PRACTICA DE PROMOCION DE CAMBIO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (145, '498', 'SEM DESARR PERS LIDERAZG UNA ESTRAT PARA EL CAM', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (146, '516', 'FUNDAMENTOS DE LA ACCION DOCENTE', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (147, '517', 'FILOSOFÍA DE LA EDUCACIÓN', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (148, '524', 'DESARROLLO DEL SISTEMA EDUCATIVO VENEZOLANO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (149, '530', 'PLANIFICACIÓN EDUCATIVA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (150, '532', 'MATEMÁTICAS Y CIENCIAS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (151, '534', 'EVALUACION EDUCATIVA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (152, '536', 'GERENCIA EDUCATIVA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (153, '542', 'DIDÁCTICA DE LA ARITMÉTICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (154, '545', 'TEORÍA DE LA EDUCACIÓN MATEMÁTICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (155, '547', 'DIDACTICA DEL ALGEBRA Y LA TRIGONOMETRIA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (156, '551', 'EVALUACIÓN DE LOS APRENDIZAJES EN MATEMATICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (157, '552', 'DIDÁCTICA DE LA GEOMETRIA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (158, '559', 'APRENDIZAJE DE LA LECTURA Y LA ESCRITURA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (159, '560', 'DESARROLLO PERSONAL DEL DOCENTE', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (160, '562', 'DESARROLLO DEL LENGUAJE', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (161, '564', 'LITERATURA INFANTIL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (162, '570', 'DESARROLLO PSICOLÓGICO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (163, '571', 'PSICOLOGIA EDUCATIVA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (164, '575', 'TÓPICOS DE MATEMATICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (165, '576', 'SOCIOLOGIA DE LA EDUCACIÓN Y DESARROLLO COMUNIT', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (166, '577', 'DIDÁCTICA DE LA ESTOCÁSTICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (167, '578', 'INVESTIGACIÓN EDUCATIVA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (168, '579', 'PRACTICUM I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (169, '580', 'PRACTICUM II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (170, '592', 'DESARROLLO Y PATOLOGIA DEL LENGUAJE', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (172, '602', 'TEORÍA DE LA ORGANIZACIÓN', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (174, '655', 'COSTO INDUSTRIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (175, '733', 'MATEMATICA III', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (176, '735', 'MATEMATICA IV', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (177, '737', 'INTRODUCCIÓN A LA PROBABILIDAD', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (178, '738', 'INFERENCIA ESTADISTICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (179, '739', 'MATEMÁTICA V', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (180, '747', 'PROBABILIDAD', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (181, '748', 'ESTADISTICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (182, '749', 'CALCULO Ι', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (183, '750', 'CÁLCULO II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (184, '751', 'CALCULO III', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (185, '752', 'ALGEBRA I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (186, '753', 'ALGEBRA II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (187, '754', 'GEOMETRIA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (188, '755', 'ECUACIONES DIFERENCIALES', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (189, '756', 'CALCULO INTEGRAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (190, '757', 'ALGEBRA I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (191, '758', 'CALCULO VECTORIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (192, '759', 'ALGEBRA II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (193, '760', 'HISTORIA DE LAS MATEMATICAS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (194, '761', 'DIDACTICA DEL CALCULO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (195, '762', 'ANALISIS I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (196, '763', 'TOPICOS NUMERICOS EN CALCULO Y ALGEBRA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (197, '764', 'PROBABILIDAD Y ESTADISTICA I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (198, '765', 'DIDACTICA DEL ALGEBRA LINEAL Y LA PROBABILIDAD', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (199, '766', 'ANALISIS II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (200, '767', 'ECUACIONES DIFERENCIALES', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (201, '768', 'TOPOLOGIA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (202, '769', 'PRACTICA DOCENTE', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (203, '770', 'TÓPICOS DE ANALISIS MATEMATICO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (204, '771', 'OPTIMIZACION NO LINEAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (205, '772', 'PROBABILIDAD Y ESTADISTICA II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (206, '773', 'MODELOS MATEMATICOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (207, '775', 'SISTEMAS DINAMICOS DISCRETOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (208, '776', 'TOPICOS EN OPTIMIZACION I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (209, '778', 'ANALISIS DE DATOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (210, '779', 'PROGRAMACION LINEAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (211, '780', 'TEORIA DE JUEGOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (212, '781', 'INTRODUCCION A LOS ELEMENTOS FINITOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (213, '782', 'ALGEBRA LINEAL NUMERICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (214, '783', 'INTRODUCCION A LOS ESPACIOS DE HILBERT Y SUS OPER', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (217, '812', 'ELABORACION PERIODICA DE PUBLICACIONES ESCOLARE', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (219, '814', 'SEMINARIO DE ACCION SOCIAL', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (221, '011', 'SERVICIO COMUNITARIO', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (222, '106', 'PRESENTACION A LA FISICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (225, '115', 'LENGUA Y COMUNICACIÓN', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (227, '117', 'AMBIENTE Y DESARROLLO SOSTENIBLE EN VENEZUELA', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (231, '176', 'MATEMATICA I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (232, '178', 'MATEMATICA II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (234, '300', 'FISICA GENERAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (235, '601', 'INTRODUCCION A LA ADMINISTRACION', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (238, '604', 'ADMINISTRACION PUBLICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (239, '605', 'SISTEMAS ADMINISTRATIVOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (240, '606', 'SISTEMAS DE INFORMACION', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (241, '607', 'ADMINISTRACIÓN POR PROYECTO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (242, '608', 'CONTROL DE GESTION', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (243, '613', 'INVESTIGACIÓN ADMINISTRATIVA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (244, '614', 'ADMINISTRACION DE RECURSOS HUMANOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (245, '615', 'RIESGOS Y SEGUROS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (246, '616', 'REASEGUROS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (247, '617', 'CONTABILIDAD INTERMEDIA APLICADA AL SEGURO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (248, '618', 'CONTABILIDAD COMPUTARIZADA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (249, '619', 'ADMINISTRACIÓN DEL RIESGO I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (250, '620', 'FUNDAMENTOS DE INGENIERIA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (251, '621', 'QUIMICA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (252, '625', 'INFORMATICA GERENCIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (253, '631', 'FUNDAMENTOS DE CONTABILIDAD', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (254, '632', 'CONTABILIDAD INTERMEDIA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (255, '633', 'CONTABILIDAD SUPERIOR I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (256, '634', 'CONTABILIDAD GUBERNAMENTAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (257, '636', 'MODELOS CONTABLES', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (258, '637', 'CONTABILIDAD DE COSTOS I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (259, '638', 'SISTEMAS TRIBUTARIOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (260, '639', 'CONTABILIDAD SUPERIOR II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (261, '641', 'TEORIA ECONOMICA I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (262, '642', 'TEORIA ECONÓMICA II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (263, '644', 'ECONOMIA Y SEGUROS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (264, '646', 'TEORIA DEL RIESGO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (265, '648', 'ADMINISTRACIÓN DEL RIESGO II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (266, '649', 'CONTABILIDAD SUPERIOR III', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (267, '650', 'CONTABILIDAD DE COSTOS II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (268, '651', 'DERECHO MERCANTIL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (269, '653', 'DERECHO LABORAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (270, '654', 'DERECHO APLICADO AL SEGURO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (271, '661', 'ADMINISTRACIÓN FINANCIERA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (272, '663', 'FINANZAS Y PRESUPUESTO PUBLICO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (273, '665', 'ANALISIS DE ESTADOS FINANCIEROS I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (274, '666', 'ANALISIS DE ESTADOS FINANCIEROS II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (275, '669', 'PRESUPUESTO EMPRESARIAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (276, '671', 'MERCADOTECNIA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (277, '672', 'INVESTIGACION DE MERCADO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (278, '673', 'CONTABILIDAD FISCAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (279, '681', 'PLANIFICACIÓN Y CONTROL DE LA PRODUCCIÓN', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (280, '691', 'AUDITORIA I', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (281, '692', 'AUDITORIA II', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (282, '696', 'PASANTIA (Riesgos y Seguros)', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (283, '697', 'PASANTIA (Contaduría)', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (284, '699', 'PASANTIA (Administración)', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (285, '734', 'MATEMATICA III', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (286, '743', 'ELEMENTOS ACTUARIALES', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (287, '745', 'ESTADÍSTICA GENERAL', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (288, '746', 'ESTADÍSTICA APLICADA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (289, '810', 'REDACCION DE INFORMES TECNICOS', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (290, '811', 'FUNDAMENTOS BASICOS EN LA ELABORACION DE PROYE', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (291, '813', 'LIDERAZGO', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (293, '816', 'FORMACION DE MICROEMPRESAS', '8952357') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (294, '570/', 'DESARROLLO PSICOLÓGICO', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (295, '050', 'Educación Inicial', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (296, '612', 'CONTABILIDAD INTERMEDIA', '') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (298, '107', 'LOGICA', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (299, '106', 'PRESENTACION A LA FISICA', '9858269') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (300, '999', 'PRUEBA', '13403217') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (301, '985', 'PRUEBA 2', '13403217') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);
INSERT INTO `materia_una` (`id`, `codigo`, `descripcion`, `cedula_asesor`) VALUES (302, '986', 'PRUEBA', '13403217') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`), `cedula_asesor` = VALUES(`cedula_asesor`);

-- Estructura para tabla `objetivo_materia`
CREATE TABLE `objetivo_materia` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `materia_codigo` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nro_objetivo` int NOT NULL,
  `peso` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`) /*T![clustered_index] CLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=30038;

INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (37, '116', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (38, '116', 2, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (39, '116', 3, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (40, '116', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (41, '116', 5, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (42, '116', 6, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (55, '300', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (56, '300', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (57, '300', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (58, '300', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (59, '300', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (60, '300', 6, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (61, '315', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (62, '315', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (63, '315', 3, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (64, '315', 4, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (65, '315', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (66, '315', 6, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (67, '315', 7, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (68, '315', 8, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (69, '315', 9, '5.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (76, '323', 1, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (77, '323', 2, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (78, '323', 3, '5.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (79, '323', 4, '7.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (80, '323', 5, '6.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (81, '323', 6, '8.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (95, '327', 1, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (96, '327', 2, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (97, '327', 3, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (98, '327', 4, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (99, '327', 5, '5.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (100, '371', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (101, '371', 2, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (102, '371', 3, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (103, '371', 4, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (104, '371', 5, '4.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (105, '371', 6, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (106, '371', 7, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (114, '115', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (115, '115', 2, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (116, '115', 3, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (117, '115', 4, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (118, '115', 5, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (119, '115', 6, '4.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (120, '536', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (121, '536', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (122, '536', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (123, '536', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (124, '536', 5, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (130, '405', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (131, '405', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (132, '405', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (133, '405', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (134, '410', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (135, '410', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (136, '410', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (137, '410', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (138, '410', 5, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (139, '410', 6, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (140, '410', 7, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (141, '410', 8, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (142, '050', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (143, '050', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (144, '050', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (145, '050', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (146, '050', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (147, '052', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (148, '052', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (149, '052', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (150, '052', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (151, '051', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (152, '051', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (153, '051', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (154, '051', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (155, '412', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (156, '412', 2, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (157, '412', 3, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (158, '412', 4, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (159, '412', 5, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (160, '427', 1, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (161, '427', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (162, '427', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (163, '427', 4, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (164, '427', 5, '4.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (165, '053', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (166, '053', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (167, '053', 3, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (168, '056', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (169, '056', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (170, '056', 3, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (171, '056', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (172, '056', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (173, '056', 6, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (174, '057', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (175, '057', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (176, '057', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (177, '057', 4, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (178, '057', 5, '4.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (179, '480', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (180, '480', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (181, '480', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (182, '480', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (183, '480', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (184, '480', 6, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (185, '480', 7, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (186, '559', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (187, '559', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (188, '559', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (189, '559', 4, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (190, '559', 5, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (191, '489', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (192, '489', 2, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (193, '489', 3, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (194, '489', 4, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (195, '489', 5, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (196, '498', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (197, '498', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (198, '498', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (199, '498', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (200, '562', 1, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (201, '562', 2, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (202, '562', 3, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (203, '562', 4, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (204, '562', 5, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (205, '562', 6, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (206, '562', 7, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (207, '562', 8, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (208, '562', 9, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (209, '562', 10, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (210, '814', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (211, '814', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (212, '814', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (213, '814', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (214, '814', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (215, '632', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (216, '632', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (217, '632', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (218, '632', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (219, '632', 5, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (220, '632', 6, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (221, '632', 7, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (222, '632', 8, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (223, '632', 9, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (224, '632', 10, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (225, '433', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (226, '433', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (227, '433', 3, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (228, '433', 4, '4.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (229, '437', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (230, '437', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (231, '437', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (232, '437', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (233, '437', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (234, '437', 6, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (235, '437', 7, '6.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (236, '468', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (237, '468', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (238, '468', 3, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (239, '477', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (240, '477', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (241, '477', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (242, '477', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (243, '477', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (244, '488', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (245, '488', 2, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (246, '488', 3, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (247, '488', 4, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (248, '488', 5, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (249, '488', 6, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (250, '516', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (251, '516', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (252, '516', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (253, '516', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (254, '516', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (255, '517', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (256, '517', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (257, '517', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (258, '517', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (259, '517', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (260, '517', 6, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (261, '524', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (262, '524', 2, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (263, '524', 3, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (264, '524', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (265, '524', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (266, '524', 6, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (267, '530', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (268, '530', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (269, '530', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (270, '530', 4, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (271, '530', 5, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (272, '530', 6, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (273, '534', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (274, '534', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (275, '534', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (276, '534', 4, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (277, '534', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (278, '534', 6, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (279, '534', 7, '3.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (280, '570', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (281, '570', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (282, '570', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (283, '570', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (284, '570', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (285, '570', 6, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (286, '571', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (287, '571', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (288, '571', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (289, '571', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (290, '571', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (291, '576', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (292, '576', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (293, '576', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (294, '576', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (295, '576', 5, '2.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (296, '576', 6, '4.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (321, '107', 1, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (322, '107', 2, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (323, '107', 3, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (324, '107', 4, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (325, '107', 5, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);
INSERT INTO `objetivo_materia` (`id`, `materia_codigo`, `nro_objetivo`, `peso`) VALUES (326, '107', 6, '1.00') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `materia_codigo` = VALUES(`materia_codigo`), `nro_objetivo` = VALUES(`nro_objetivo`), `peso` = VALUES(`peso`);

-- Estructura para tabla `rol`
CREATE TABLE `rol` (
  `id` int NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */,
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `rol` (`id`, `nombre_rol`) VALUES (2, 'administrador') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_rol` = VALUES(`nombre_rol`);
INSERT INTO `rol` (`id`, `nombre_rol`) VALUES (1, 'usuario') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `nombre_rol` = VALUES(`nombre_rol`);

-- Estructura para tabla `tarea`
CREATE TABLE `tarea` (
  `id` int NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `tarea` (`id`, `codigo`, `descripcion`) VALUES (1, 'TP', 'TRABAJO PRACTICO') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`);
INSERT INTO `tarea` (`id`, `codigo`, `descripcion`) VALUES (2, 'TSP', 'TRABAJO SUSTITUTO DE PRUEBA') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`);
INSERT INTO `tarea` (`id`, `codigo`, `descripcion`) VALUES (4, 'TEG', 'TRABAJO ESPECIAL DE GRADO') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`);
INSERT INTO `tarea` (`id`, `codigo`, `descripcion`) VALUES (5, 'PROY', 'PROYECTO') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo` = VALUES(`codigo`), `descripcion` = VALUES(`descripcion`);

-- Estructura para tabla `tipoasesoria`
CREATE TABLE `tipoasesoria` (
  `id` int NOT NULL,
  `codigo_ase` varchar(10) NOT NULL,
  `descripcion_asesoria` text NOT NULL,
  PRIMARY KEY (`id`) /*T![clustered_index] NONCLUSTERED */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `tipoasesoria` (`id`, `codigo_ase`, `descripcion_asesoria`) VALUES (1, 'VT', 'VIRTUAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo_ase` = VALUES(`codigo_ase`), `descripcion_asesoria` = VALUES(`descripcion_asesoria`);
INSERT INTO `tipoasesoria` (`id`, `codigo_ase`, `descripcion_asesoria`) VALUES (2, 'ELI', 'EN LINEA') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo_ase` = VALUES(`codigo_ase`), `descripcion_asesoria` = VALUES(`descripcion_asesoria`);
INSERT INTO `tipoasesoria` (`id`, `codigo_ase`, `descripcion_asesoria`) VALUES (3, 'EGRU', 'ASESORIA GRUPAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo_ase` = VALUES(`codigo_ase`), `descripcion_asesoria` = VALUES(`descripcion_asesoria`);
INSERT INTO `tipoasesoria` (`id`, `codigo_ase`, `descripcion_asesoria`) VALUES (4, 'PRE', 'PRESENCIAL') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo_ase` = VALUES(`codigo_ase`), `descripcion_asesoria` = VALUES(`descripcion_asesoria`);
INSERT INTO `tipoasesoria` (`id`, `codigo_ase`, `descripcion_asesoria`) VALUES (9, 'ENC', 'ENCUENTROS') ON DUPLICATE KEY UPDATE `id` = VALUES(`id`), `codigo_ase` = VALUES(`codigo_ase`), `descripcion_asesoria` = VALUES(`descripcion_asesoria`);

SET FOREIGN_KEY_CHECKS=1;
