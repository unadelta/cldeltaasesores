-- Respaldo de Base de Datos: railway
-- Fecha: 2026-10-05 11:47:59

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `acumuladotaase`;

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
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `acumuladotaase` (
        `id`,
        `periodo`,
        `cedula`,
        `TP`,
        `TSP`,
        `TEG`,
        `PROY`,
        `EGRU`,
        `ELI`,
        `PRE`,
        `VT`
    )
VALUES (
        9,
        '2026-10',
        '9858269',
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0
    );

DROP TABLE IF EXISTS `alumno`;

CREATE TABLE `alumno` (
    `id` int NOT NULL AUTO_INCREMENT,
    `cedula` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `nombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `codigo_carrera` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `descripcion_carrera` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `cedula` (`cedula`)
) ENGINE = InnoDB AUTO_INCREMENT = 100 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        1,
        'V-24119980',
        'RODRIGUEZ CASCON ALONSO ISAAC',
        '440',
        'Educación Integral'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        2,
        'V-28766928',
        'RIVERO CUENCE KATERIN DEL VALLE',
        '236',
        'Ingeniería de Sistemas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        3,
        'V-06823400',
        'UBAN LEGNY TERESA',
        '280',
        'Ingeniería Industrial'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        4,
        'V-13401660',
        'CALDERON QUIVAS REINALDO RAMON',
        '610',
        'Licenciatura en Administración - Mención Empresas '
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        5,
        'V-18387899',
        'MARTINEZ ROXDELIS ELENIZA',
        '610',
        'Licenciatura en Administración - Mención Empresas '
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        6,
        'V-31105291',
        'FERNIN TOLEDO DANIEL JOSUE',
        '236',
        'Ingeniería de Sistemas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        7,
        'V-15336186',
        'MENDOZA ROJAS DARVIN JAIRO',
        '613',
        'Licenciatura en Administración de Empresas mención Riesgos y Seguros'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        9,
        'V-08952715',
        'MEDRANO BELLORIN JULIAN JOSE',
        '508',
        'Licenciatura en Educación mención Educación Matemática'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        10,
        'V-11206309',
        'ABREU MENDOZA ELADIO JESUS',
        '610',
        'Licenciatura en Administración - Mención Empresas Comerciales'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        11,
        'V-15200799',
        'TRUJILLO SANDRA PATRICIA',
        '542',
        'Licenciatura en Educación mención Preescolar'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        12,
        'V-16221653',
        'PARRA PEREIRA JOSE MIGUEL',
        '612',
        'Licenciatura en Administración - Mención Recursos Humanos'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        13,
        'V-16613709',
        'VILLANUEVA RASSE ADRIANA DEL VALLE',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        14,
        'V-16699180',
        'GIOVETTI YPLANDA MARGARITA',
        '612',
        'Licenciatura en Administración - Mención Recursos Humanos'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        15,
        'V-19140953',
        'CEQUEA FRANCO MARYOLI DE LAS',
        '612',
        'Licenciatura en Administración - Mención Recursos Humanos'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        16,
        'V-19403195',
        'MENDOZA MARCANO FRANCIS JHOALY',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        17,
        'V-23725487',
        'VILLAREAL QUINTERO MONICA MARIA',
        '542',
        'Licenciatura en Educación mención Preescolar'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        18,
        'V-21198540',
        'BELLORIN TORRES VIVIANA YUBEL',
        '542',
        NULL
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        19,
        'V-24226134',
        'SALCEDO GONZALEZ OSWALDO DAVID',
        '281',
        NULL
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        20,
        'V-24580333',
        'GONZALEZ VELASAUEZ EDGAR SEGUNDO',
        '281',
        NULL
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        23,
        'V-32417265',
        'GUZMAN DIAZ EDWIN ENRIQUE',
        '236',
        'Ingeniería de Sistemas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        24,
        'V-25355886',
        'LOZADA BRITO JOSE GREGORIO',
        '280',
        'INGENIERIA INDUSTRIAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        25,
        'V-27802269',
        'montaño guerra andro fernando',
        '236',
        'Ingeniería de Sistemas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        26,
        'V-18657909',
        'SANCHEZ LIRA CHRISTIAN JESUS',
        '237',
        'T.S.U. Mantenimiento de Sistemas Informáticos'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        27,
        'V-11208458',
        'MATUTE FERMIN CECILIO ANTONIO',
        '236',
        'Ingeniería de Sistemas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        28,
        'V-31164128',
        'RIVERO CUENCE KADIZ GABRIEL',
        '237',
        'T.S.U. Mantenimiento de Sistemas Informáticos'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        29,
        'V-08953003',
        'ESTEVES GURRA OSCAR ALEJANDRO',
        '236',
        'Ingeniería de Sistemas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        30,
        'V-18657701',
        'ROJAS RODRIGUEZ BEIGLIS JOSEFINA',
        '440',
        'EDUCACION INTEGRAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        31,
        'V-19140921',
        'MARCANO ORDAZ MILAGROS DEL VALLE',
        '440',
        'EDUCACION INTEGRAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        32,
        'V-24119251',
        'HERNANDEZ CARRIN GABRIEL MOISES',
        '440',
        'EDUCACION INTEGRAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        33,
        'V-30656477',
        'PINTO HERNANDEZ OMAILYN ITHIEL',
        '280',
        'INGENIERIA INDUSTRIAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        35,
        'V-31559376',
        'MARQUEZ HERRERA CECILIA GABRIEL',
        '280',
        'INGENIERIA INDUSTRIAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        36,
        'V-32273433',
        'SANDOVAL ASTUDILLO YULIANNYS A',
        '440',
        'EDUCACION INTEGRAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        37,
        'V-33145659',
        'CARABALLO MARTINEZ MARIA ISABEL',
        '612',
        'Licenciatura en Administración - Mención Recursos Humanos'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        38,
        'V-33357628',
        'PARRA BRICEÑO BRANDOS JONAS',
        '236',
        'T.S.U. Mantenimiento de Sistemas Informáticos'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        39,
        'V-33818735',
        'RODRIGUEZ ROJAS DANIELLYS VALENTINA',
        '613',
        'Licenciatura en Administración de Empresas mención Riesgos y Seguros'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        40,
        'V-34196919',
        'MENDOZA LOCHAMANCIN LEIDISMAR',
        '612',
        'Licenciatura en Administración - Mención Recursos Humanos'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        41,
        'V-31463200',
        'CARREÑO ALEJANDRA LUCIANY',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        42,
        'V-28741147',
        'IBARRA CASTRO AXXA EIDEMAR',
        '237',
        'T.S.U. Mantenimiento de Sistemas Informáticos'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        43,
        'V-18659917',
        'BRITO EMMA KARINA',
        '440',
        'EDUCACION INTEGRAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        44,
        'V-18914541',
        'OLIVEROS DE RODRÍGUEZ YERALDINE',
        '440',
        'EDUCACION INTEGRAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        45,
        'V-25124024',
        'MATA GONZÁLEZ ROSAIDYS ANDREINA',
        '440',
        'EDUCACION INTEGRAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        46,
        'V-28018752',
        'MOTA MORENO HÉCTOR ANDRÉS',
        '440',
        'EDUCACION INTEGRAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        47,
        'V-28603527',
        'PAZ JIMÉNEZ RONALDY NAZARETH',
        '440',
        'EDUCACION INTEGRAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        48,
        'V-28657207',
        'RIVAS MARCANO YOSLER PASCUAL',
        '440',
        'EDUCACION INTEGRAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        49,
        'V-12127118',
        'OREA BARRETO CESAR OSWALDO',
        '440',
        'EDUCACION INTEGRAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        50,
        'V-14905885',
        'MONTEVERDE GIL FREDDY GREGORIO',
        '430',
        'Técnico Superior Universitario (TSU) en Educación IntegraL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        51,
        'V-17055271',
        'RIVERO MARTINEZ CADIS JOEL',
        '430',
        'Técnico Superior Universitario (TSU) en Educación IntegraL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        52,
        'V-25859164',
        'SALAZAR BOLIVAR RAFAEL OGUSTO',
        '430',
        'Técnico Superior Universitario (TSU) en Educación IntegraL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        53,
        'V-12686634',
        'PRIETO GONZÁLEZ XIOMARA',
        '542',
        'Licenciatura en Educación mención Preescolar'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        54,
        'V-15336047',
        'DÍAZ CORREA ROSELLYN DARGELYS',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        55,
        'V-19140930',
        'LÓPEZ RODRÍGUEZ LEXIS MARICELA',
        '542',
        'Licenciatura en Educación mención Preescolar'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        56,
        'V-26909764',
        'BOMPART MARIN SANEYCAR DANIELA',
        '542',
        'Licenciatura en Educación mención Preescolar'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        57,
        'V-30838011',
        'SALAZAR TOVAR TATIANA COROMOTO',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        58,
        'V-28672058',
        'CASTRO MARCANO DAILMAR EGARLY',
        '440',
        'EDUCACION INTEGRAL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        59,
        'V-16216700',
        'ALCALÁ SALAZAR ROSA URISBETH',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        60,
        'V-28349903',
        'LISTA RODRÍGUEZ LEIDY VANESSA',
        '542',
        'Licenciatura en Educación mención Preescolar'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        61,
        'V-34389583',
        'MÁRQUEZ MARTINEZ JESUANNYS JOSÉ',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        62,
        'V-19140227',
        'LIRA NUÑEZ ROMÁN JOSÉ',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        63,
        'V-24119219',
        'FERMÍN MARTINEZ MARIELBELYS',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        64,
        'V-25930610',
        'ROJAS MORENO FABIO LUIS',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        65,
        'V-17745959',
        'PACHECO GÓMEZ MILIANNYS LOURDES',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        66,
        'V-27928807',
        'ARCILA LEAL YOSELIN ANDREINA',
        '430',
        'Técnico Superior Universitario (TSU) en Educación IntegraL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        67,
        'V-14904783',
        'BARRIOS GRACIAS YOHANA JOSEFINA',
        '610',
        'Licenciatura en Contaduría Pública'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        68,
        'V-16008954',
        'MARTINEZ CARMEN MARGARITA',
        '610',
        'Licenciatura en Contaduría Pública'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        69,
        'V-17382235',
        'YELAMO BERGANTINI MAYNES ALEJANDRO',
        '613',
        'Licenciatura en Administración de Empresas mención Riesgos y Seguros'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        70,
        'V-25678687',
        'RIVAS NUÑES ANNIELIS ANTONIETA',
        '508',
        'Licenciatura en Educación mención Educación Matemática'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        71,
        'V-17999287',
        'MORALES DIAZ ELYSBETH DEL CARMEN',
        '280',
        'Ingeniería Industrial'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        72,
        'V-16698115',
        'RENGEL RODRIGUEZ MARISEL DELIS',
        '610',
        'Licenciatura en Contaduría Pública'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        73,
        'V-18657250',
        'SOLER GONZALEZ JOSE ALBERTO',
        '610',
        'Licenciatura en Contaduría Pública'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        74,
        'V-25125820',
        'RODRIGUEZ GOMEZ LUISEYDITH JOSE',
        '612',
        'Licenciatura en Administración de Empresas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        75,
        'V-25331002',
        'RINCONES MATA GREIDIS MARIANA',
        '610',
        'Licenciatura en Contaduría Pública'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        76,
        'V-27032931',
        'TARAZONA CENTENO CARLA ALEXAIDA',
        '612',
        'Licenciatura en Administración de Empresas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        77,
        'V-27802704',
        'MORENO LIRA ADRIANNYS DEL VALLE',
        '542',
        'Licenciatura en Educación mención Preescolar'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        78,
        'V-28018644',
        'ABREU MILANO LIZMAR MARIA',
        '610',
        'Licenciatura en Contaduría Pública'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        79,
        'V-28349996',
        'GONZLEZ VEGAS STEFANY DE LOS',
        '612',
        'Licenciatura en Administración de Empresas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        80,
        'V-28768129',
        'FERMIN SANCHEZ CESAR MIGUEL',
        '610',
        'Licenciatura en Contaduría Pública'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        81,
        'V-31371547',
        'URBAEZ DE LA ROSA VALERIA ESPERANZA',
        '612',
        'Licenciatura en Administración de Empresas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        82,
        'V-32284486',
        'RIVERO CUENCE KARINA DEL VALLE',
        '126',
        'Licenciatura en Matemática'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        83,
        'V-33105363',
        'GOMEZ BETANCOURT JOSE ANTONIO P',
        '236',
        'Ingeniería de Sistemas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        84,
        'V-33810735',
        'RODRIGUEZ ROJAS DANIELLYS VALE',
        '613',
        'Licenciatura en Administración de Empresas mención Riesgos y Seguros'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        85,
        'V-14905884',
        'MONTEVERDE GIL FREDDY GREGORIO',
        '430',
        'Técnico Superior Universitario (TSU) en Educación IntegraL'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        86,
        'V-20593274',
        'FARIAS UGUETO LORENA KATIUSKA',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        87,
        'V-18657908',
        'SANCHEZ LIRA NANCY CRISTINA',
        '612',
        'Licenciatura en Administración de Empresas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        88,
        'V-18098485',
        'GIL CEDEÑOMILEYDIS NOHEMI',
        '610',
        'Licenciatura en Contaduría Pública'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        89,
        'V-20852586',
        'CABAÑA SUAREZ JESUS ABRAHAM',
        '281',
        'T.S.U. Higiene y Seguridad Industrial'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        90,
        'V-20853756',
        'GARCIA BRAZON ITMER DAVID',
        '236',
        'Ingeniería de Sistemas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        91,
        'V-25661378',
        'CUESTA DE ROMERO OLGA PATRICIA',
        '610',
        'Licenciatura en Contaduría Pública'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        92,
        'V-26909830',
        'ROSAS MILANO ANLISTH ALEJANDRA',
        '237',
        'T.S.U. Mantenimiento de Sistemas Informáticos'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        93,
        'V-28374252',
        'ZORRILLA CENTENO MARIELIZA EL VALLE',
        '281',
        'T.S.U. Higiene y Seguridad Industrial'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        94,
        'V-17525966',
        'VALDEZ MORALES MIRAIDA DEL VALLE',
        '237',
        'T.S.U. Mantenimiento de Sistemas Informáticos'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        95,
        'V-28633617',
        'LOPEZ HERRERA CARLOS VICENTE',
        '236',
        'Ingeniería de Sistemas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        96,
        'V-19402735',
        'MEDINA SUARES JOSBELYS CAROLINA',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        97,
        'V-25926844',
        'ROMERO SANCHEZ ADA KATERINE',
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        98,
        'V-32461286',
        'TORIBE RODRIGUEZ MARIA EUGENIA',
        '236',
        'Ingeniería de Sistemas'
    );

INSERT INTO
    `alumno` (
        `id`,
        `cedula`,
        `nombre`,
        `codigo_carrera`,
        `descripcion_carrera`
    )
VALUES (
        99,
        'V-32329088',
        'LEON RODRIGUEZ YSBETHLIS YUDAL',
        '610',
        'Licenciatura en Contaduría Pública'
    );

DROP TABLE IF EXISTS `asesor`;

CREATE TABLE `asesor` (
    `id` int NOT NULL AUTO_INCREMENT,
    `cedula` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `clave` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `rol_id` int NOT NULL,
    PRIMARY KEY (`cedula`),
    UNIQUE KEY `id` (`id`),
    UNIQUE KEY `usuario` (`usuario`),
    UNIQUE KEY `email` (`email`),
    KEY `fk_asesor_rol` (`rol_id`),
    CONSTRAINT `fk_asesor_rol` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 18 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        8,
        '11210868',
        'MSc María Lo Galbo',
        'mlogalbo',
        'a031216*',
        'marialogalbouna@gmail.com',
        2
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        16,
        '11213945',
        'TOMASA RODRÍGUEZ',
        'tomi',
        'Tomifa*0112',
        'tominesrm@gmail.com',
        2
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        14,
        '12545786',
        'Dra. Leslibeth Sucre G.',
        'Leslibeth',
        'unadelta',
        'postgradounadelta@gmail.com',
        2
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        2,
        '13403217',
        'Yorbeydis Dicuru',
        'yor',
        '123456',
        'y.dsarabia@gmail.com',
        2
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        5,
        '1423569',
        'Yovinza Salazar',
        'ysalazar',
        '8545967',
        'ysalazar@gmail.com',
        1
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        13,
        '14487374',
        'Lcda. Leydis Zacarias',
        'leyditaz18',
        'Emaveja.123',
        'zacariasleydis@gmail.com',
        2
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        9,
        '16214477',
        'Lcda. Luz Jaramillo',
        'l.jaramillo',
        '31#luz',
        'milagrosluz1982@gmail.com',
        2
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        12,
        '20160859',
        'Ing. Chrismar Sarabia',
        'schrismar',
        '2813.csh',
        'chrismarcsh34@gmail.com',
        2
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        6,
        '31541259',
        'LEONARDO NOA',
        'nnoa',
        '123456',
        'leonardonoa803@gmail.com',
        1
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        15,
        '5336874',
        'MSc. Nancy Lira',
        'Jhanisse01',
        'Nan011',
        'nancyclira58@gmail.com',
        2
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        7,
        '5337512',
        'Mcs. Tibisay Padrino',
        'tpadrino',
        'tilas66**',
        'tibisayp337@gmail.com',
        2
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        10,
        '8894910',
        'Lcda. Rorima Nuñez',
        'majomernu',
        '1502$',
        'roraiman@gmail.com',
        2
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        11,
        '8950642',
        'Lcdo. Edgar Abreu',
        'eabreu',
        'tati64.',
        'ejam772020@gmail.com',
        2
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        17,
        '8952357',
        'Eldris Brisceida Salazar Jiménez',
        'eldrina',
        'platero10.',
        'uneldris@gmail.com',
        2
    );

INSERT INTO
    `asesor` (
        `id`,
        `cedula`,
        `nombre`,
        `usuario`,
        `clave`,
        `email`,
        `rol_id`
    )
VALUES (
        1,
        '9858269',
        'Ing. Matías Sarabia C.',
        'msarabia',
        'martina',
        'jsarabia22@gmail.com',
        1
    );

DROP TABLE IF EXISTS `asesor_carrera`;
/*
CREATE TABLE `asesor_carrera` (
`asesor_cedula` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
`carrera_id` int NOT NULL,
PRIMARY KEY (`asesor_cedula`, `carrera_id`),
KEY `fk_ac_carrera` (`carrera_id`),
CONSTRAINT `fk_ac_asesor` FOREIGN KEY (`asesor_cedula`) REFERENCES `asesor` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;
*/

CREATE TABLE `asesor_carrera` (
    `id` int(11) NOT NULL,
    `asesor_cedula` varchar(30) NOT NULL,
    `carrera` varchar(100) NOT NULL,
    `asignatura` varchar(50) NOT NULL,
    `cantidad_alumno` int(11) DEFAULT '0',
    `semestre` varchar(50) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asesor_carrera`
--

INSERT INTO
    `asesor_carrera` (
        `id`,
        `asesor_cedula`,
        `carrera`,
        `asignatura`,
        `cantidad_alumno`,
        `semestre`
    )
VALUES (
        1,
        '9858269',
        '236',
        '107',
        10,
        '2026-2'
    ),
    (
        2,
        '9858269',
        '236',
        '327',
        15,
        '2026-2'
    ),
    (
        3,
        '9858269',
        '236',
        '116',
        72,
        '2026-2'
    ),
    (
        4,
        '9858269',
        '236',
        '300',
        2,
        '2026-2'
    ),
    (
        5,
        '9858269',
        '236',
        '305',
        3,
        '2026-2'
    );

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificaciones`
--

DROP TABLE IF EXISTS `calificacion_050`;

CREATE TABLE `calificacion_050` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 78 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_050` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        17,
        'VILLAREAL QUINTERO MONICA MARIA',
        'V-23725487',
        '11213945',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        'Cero',
        '2026-2'
    );

INSERT INTO
    `calificacion_050` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        77,
        'MORENO LIRA ADRIANNYS DEL VALLE',
        'V-27802704',
        '11213945',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_051`;

CREATE TABLE `calificacion_051` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 18 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_051` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        17,
        'VILLAREAL QUINTERO MONICA MARIA',
        'V-23725487',
        '11213945',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_052`;

CREATE TABLE `calificacion_052` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 18 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_052` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        17,
        'VILLAREAL QUINTERO MONICA MARIA',
        'V-23725487',
        '11213945',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_053`;

CREATE TABLE `calificacion_053` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 56 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_053` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        55,
        'LÓPEZ RODRÍGUEZ LEXIS MARICELA',
        'V-19140930',
        '11213945',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_056`;

CREATE TABLE `calificacion_056` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 19 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_056` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        18,
        'BELLORIN TORRES VIVIANA YUBEL',
        'V-21198540',
        '11213945',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_057`;

CREATE TABLE `calificacion_057` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 54 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_057` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        53,
        'PRIETO GONZÁLEZ XIOMARA',
        'V-12686634',
        '11213945',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_107`;

CREATE TABLE `calificacion_107` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `cedula_alumno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `cedula_asesor` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
    `semestre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_115`;

CREATE TABLE `calificacion_115` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_115` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        11,
        'TRUJILLO SANDRA PATRICIA',
        'V-15200799',
        '9858269',
        '0.00',
        '0.00',
        '1.00',
        '1.00',
        '1.00',
        '1.00',
        '6.00',
        'Seis',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_116`;

CREATE TABLE `calificacion_116` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `cedula_alumno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `cedula_asesor` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
    `semestre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 100 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_116` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        41,
        'CARREÑO ALEJANDRA LUCIANY',
        'V-31463200',
        '9858269',
        '1.00',
        '1.00',
        '1.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        'Cero',
        '2026-2'
    );

INSERT INTO
    `calificacion_116` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        42,
        'IBARRA CASTRO AXXA EIDEMAR',
        'V-28741147',
        '9858269',
        '1.00',
        '1.00',
        '1.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        'Cero',
        '2026-2'
    );

INSERT INTO
    `calificacion_116` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        93,
        'ZORRILLA CENTENO MARIELIZA EL VALLE',
        'V-28374252',
        '9858269',
        '1.00',
        '1.00',
        '1.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        'Cero',
        '2026-2'
    );

INSERT INTO
    `calificacion_116` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        95,
        'LOPEZ HERRERA CARLOS VICENTE',
        'V-28633617',
        '9858269',
        '1.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        'Cero',
        '2026-2'
    );

INSERT INTO
    `calificacion_116` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        96,
        'MEDINA SUARES JOSBELYS CAROLINA',
        'V-19402735',
        '9858269',
        '1.00',
        '1.00',
        '1.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        'Cero',
        '2026-2'
    );

INSERT INTO
    `calificacion_116` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        97,
        'ROMERO SANCHEZ ADA KATERINE',
        'V-25926844',
        '9858269',
        '1.00',
        '1.00',
        '1.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        'Cero',
        '2026-2'
    );

INSERT INTO
    `calificacion_116` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        98,
        'TORIBE RODRIGUEZ MARIA EUGENIA',
        'V-32461286',
        '9858269',
        '1.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        'Cero',
        '2026-2'
    );

INSERT INTO
    `calificacion_116` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        99,
        'LEON RODRIGUEZ YSBETHLIS YUDAL',
        'V-32329088',
        '9858269',
        '0.00',
        '1.00',
        '1.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        'Cero',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_300`;

CREATE TABLE `calificacion_300` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `cedula_alumno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `cedula_asesor` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
    `semestre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 15 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_300` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        2,
        'RIVERO CUENCE KATERIN DEL VALLE',
        'V-28766928',
        '9858269',
        '1.00',
        '0.00',
        '1.00',
        '0.00',
        '1.00',
        '1.00',
        '6.00',
        'Seis',
        '2026-2'
    );

INSERT INTO
    `calificacion_300` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        3,
        'UBAN LEGNY TERESA',
        'V-6823400',
        '9858269',
        '1.00',
        '1.00',
        '1.00',
        '1.00',
        '1.00',
        '0.00',
        '8.00',
        'Ocho',
        '2026-2'
    );

INSERT INTO
    `calificacion_300` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        10,
        'ABREU MENDOZA ELADIO JESUS',
        'V-11206309',
        '9858269',
        '1.00',
        '0.00',
        '1.00',
        '0.00',
        '1.00',
        '1.00',
        '6.00',
        'Seis',
        '2026-2'
    );

INSERT INTO
    `calificacion_300` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        14,
        'GIOVETTI YPLANDA MARGARITA',
        'V-16699180',
        '9858269',
        '0.00',
        '0.00',
        '1.00',
        '1.00',
        '1.00',
        '1.00',
        '6.00',
        'Seis',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_315`;

CREATE TABLE `calificacion_315` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `cedula_alumno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `cedula_asesor` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `obj7` decimal(5, 2) DEFAULT '0.00',
    `obj8` decimal(5, 2) DEFAULT '0.00',
    `obj9` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
    `semestre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_323`;

CREATE TABLE `calificacion_323` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `cedula_alumno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `cedula_asesor` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
    `semestre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 41 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_327`;

CREATE TABLE `calificacion_327` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `obj7` decimal(5, 2) DEFAULT '0.00',
    `obj8` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 16 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_327` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `obj7`,
        `obj8`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        15,
        'CEQUEA FRANCO MARYOLI DE LAS',
        'V-19140953',
        '9858269',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_371`;

CREATE TABLE `calificacion_371` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `obj7` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 30 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_371` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `obj7`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        2,
        'RIVERO CUENCE KATERIN DEL VALLE',
        'V-28766928',
        '9858269',
        '1.00',
        '1.00',
        '1.00',
        '1.00',
        '0.00',
        '1.00',
        '1.00',
        '6.00',
        'Seis',
        '2026-2'
    );

INSERT INTO
    `calificacion_371` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `obj7`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        11,
        'TRUJILLO SANDRA PATRICIA',
        'V-15200799',
        '9858269',
        '1.00',
        '1.00',
        '0.00',
        '1.00',
        '1.00',
        '1.00',
        '0.00',
        '7.00',
        'Siete',
        '2026-2'
    );

INSERT INTO
    `calificacion_371` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `obj7`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        12,
        'PARRA PEREIRA JOSE MIGUEL',
        'V-16221653',
        '9858269',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '',
        '2026-2'
    );

INSERT INTO
    `calificacion_371` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `obj7`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        23,
        'GUZMAN DIAZ EDWIN ENRIQUE',
        'V-32417265',
        '9858269',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '',
        '2026-2'
    );

INSERT INTO
    `calificacion_371` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `obj7`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        29,
        'ESTEVES GURRA OSCAR ALEJANDRO',
        'V-8953003',
        '9858269',
        '1.00',
        '1.00',
        '1.00',
        '0.00',
        '1.00',
        '1.00',
        '1.00',
        '7.00',
        'Siete',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_405`;

CREATE TABLE `calificacion_405` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_410`;

CREATE TABLE `calificacion_410` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `obj7` decimal(5, 2) DEFAULT '0.00',
    `obj8` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_412`;

CREATE TABLE `calificacion_412` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_427`;

CREATE TABLE `calificacion_427` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_433`;

CREATE TABLE `calificacion_433` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_437`;

CREATE TABLE `calificacion_437` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `obj7` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_468`;

CREATE TABLE `calificacion_468` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_477`;

CREATE TABLE `calificacion_477` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_480`;

CREATE TABLE `calificacion_480` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `obj7` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_488`;

CREATE TABLE `calificacion_488` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_489`;

CREATE TABLE `calificacion_489` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_498`;

CREATE TABLE `calificacion_498` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_516`;

CREATE TABLE `calificacion_516` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_517`;

CREATE TABLE `calificacion_517` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_524`;

CREATE TABLE `calificacion_524` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_530`;

CREATE TABLE `calificacion_530` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_534`;

CREATE TABLE `calificacion_534` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `obj7` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_536`;

CREATE TABLE `calificacion_536` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_536` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        4,
        'CALDERON QUIVAS REINALDO RAMON',
        'V-13401660',
        '9858269',
        '1.00',
        '1.00',
        '0.00',
        '1.00',
        '1.00',
        '8.00',
        'Ocho',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_559`;

CREATE TABLE `calificacion_559` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 19 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_559` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        18,
        'BELLORIN TORRES VIVIANA YUBEL',
        'V-21198540',
        '11213945',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_562`;

CREATE TABLE `calificacion_562` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `obj7` decimal(5, 2) DEFAULT '0.00',
    `obj8` decimal(5, 2) DEFAULT '0.00',
    `obj9` decimal(5, 2) DEFAULT '0.00',
    `obj10` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_562` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `obj7`,
        `obj8`,
        `obj9`,
        `obj10`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        11,
        'TRUJILLO SANDRA PATRICIA',
        'V-15200799',
        '11213945',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_570`;

CREATE TABLE `calificacion_570` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_571`;

CREATE TABLE `calificacion_571` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_576`;

CREATE TABLE `calificacion_576` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificacion_632`;

CREATE TABLE `calificacion_632` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `obj6` decimal(5, 2) DEFAULT '0.00',
    `obj7` decimal(5, 2) DEFAULT '0.00',
    `obj8` decimal(5, 2) DEFAULT '0.00',
    `obj9` decimal(5, 2) DEFAULT '0.00',
    `obj10` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 81 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificacion_632` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `obj7`,
        `obj8`,
        `obj9`,
        `obj10`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        10,
        'ABREU MENDOZA ELADIO JESUS',
        'V-11206309',
        '8894910',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '',
        '2026-2'
    );

INSERT INTO
    `calificacion_632` (
        `id`,
        `nombre_alumno`,
        `cedula_alumno`,
        `cedula_asesor`,
        `obj1`,
        `obj2`,
        `obj3`,
        `obj4`,
        `obj5`,
        `obj6`,
        `obj7`,
        `obj8`,
        `obj9`,
        `obj10`,
        `nota_final`,
        `nota_final_letra`,
        `semestre`
    )
VALUES (
        80,
        'FERMIN SANCHEZ CESAR MIGUEL',
        'V-28768129',
        '8894910',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '0.00',
        '',
        '2026-2'
    );

DROP TABLE IF EXISTS `calificacion_814`;

CREATE TABLE `calificacion_814` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_alumno` varchar(150) NOT NULL,
    `cedula_alumno` varchar(30) NOT NULL,
    `cedula_asesor` varchar(30) NOT NULL,
    `obj1` decimal(5, 2) DEFAULT '0.00',
    `obj2` decimal(5, 2) DEFAULT '0.00',
    `obj3` decimal(5, 2) DEFAULT '0.00',
    `obj4` decimal(5, 2) DEFAULT '0.00',
    `obj5` decimal(5, 2) DEFAULT '0.00',
    `nota_final` decimal(5, 2) DEFAULT '0.00',
    `nota_final_letra` varchar(10) DEFAULT '',
    `semestre` varchar(50) DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

DROP TABLE IF EXISTS `calificaciones`;

CREATE TABLE `calificaciones` (
    `id` int NOT NULL AUTO_INCREMENT,
    `cod_materia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `peso_acumulado` int DEFAULT NULL,
    `calificacion_definitiva` int NOT NULL,
    PRIMARY KEY (`id`),
    KEY `calificaciones_ibfk_1` (`cod_materia`),
    CONSTRAINT `calificaciones_ibfk_1` FOREIGN KEY (`cod_materia`) REFERENCES `materia` (`codigo`)
) ENGINE = InnoDB AUTO_INCREMENT = 305 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (6, '116', 6, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (7, '116', 7, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (8, '116', 8, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (9, '116', 10, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (10, '116', 11, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (11, '107', 1, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (12, '107', 2, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (13, '107', 3, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (14, '107', 4, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (15, '107', 5, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (16, '107', 6, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (17, '300', 1, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (18, '300', 2, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (19, '300', 3, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (20, '300', 4, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (21, '300', 5, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (22, '300', 6, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (23, '315', 8, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (24, '315', 9, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (25, '315', 10, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (26, '315', 11, 12);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (27, '315', 12, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (28, '315', 13, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (29, '315', 14, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (30, '315', 15, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (31, '315', 16, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (32, '315', 17, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (43, '323', 19, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (44, '323', 21, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (45, '323', 22, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (46, '323', 24, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (47, '323', 25, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (48, '323', 26, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (49, '323', 28, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (50, '323', 29, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (51, '323', 31, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (52, '323', 32, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (70, '327', 6, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (71, '327', 7, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (72, '327', 8, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (73, '327', 9, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (74, '327', 10, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (75, '327', 11, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (76, '327', 12, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (77, '327', 13, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (78, '327', 15, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (79, '371', 7, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (80, '371', 8, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (81, '371', 9, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (82, '371', 10, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (83, '371', 11, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (84, '371', 12, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (85, '371', 13, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (86, '371', 14, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (87, '371', 15, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (88, '371', 16, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (89, '371', 7, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (90, '371', 8, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (91, '371', 9, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (92, '371', 10, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (93, '371', 11, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (94, '371', 12, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (95, '371', 13, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (96, '371', 14, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (97, '371', 15, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (98, '371', 16, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (99, '115', 7, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (100, '115', 8, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (101, '115', 9, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (102, '115', 10, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (103, '115', 11, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (104, '115', 12, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (105, '115', 13, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (106, '115', 14, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (107, '536', 2, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (108, '536', 3, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (109, '536', 4, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (110, '536', 5, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (111, '536', 6, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (112, '536', 7, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (118, '405', 1, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (119, '405', 2, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (120, '405', 3, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (121, '405', 4, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (122, '410', 3, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (123, '410', 4, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (124, '410', 5, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (125, '410', 6, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (126, '410', 7, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (127, '410', 8, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (128, '410', 9, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (129, '410', 10, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (130, '050', 1, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (131, '050', 2, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (132, '050', 3, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (133, '050', 4, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (134, '050', 5, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (135, '052', 1, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (136, '052', 2, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (137, '052', 3, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (138, '052', 4, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (139, '051', 1, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (140, '051', 2, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (141, '051', 3, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (142, '051', 4, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (143, '412', 4, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (144, '412', 5, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (145, '412', 6, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (146, '412', 7, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (147, '412', 8, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (148, '412', 9, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (149, '412', 10, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (150, '412', 11, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (151, '427', 5, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (152, '427', 6, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (153, '427', 7, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (154, '427', 8, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (155, '427', 9, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (156, '427', 10, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (157, '053', 1, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (158, '053', 3, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (159, '053', 4, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (160, '053', 5, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (161, '056', 2, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (162, '056', 6, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (163, '056', 7, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (164, '056', 8, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (165, '056', 9, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (166, '056', 10, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (167, '057', 2, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (168, '057', 6, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (169, '057', 7, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (170, '057', 8, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (171, '057', 9, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (172, '057', 10, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (173, '480', 4, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (174, '480', 5, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (175, '480', 6, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (176, '480', 7, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (177, '480', 8, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (178, '480', 9, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (179, '480', 10, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (180, '480', 11, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (181, '559', 1, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (182, '559', 5, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (183, '559', 6, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (184, '559', 7, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (185, '559', 8, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (186, '559', 9, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (187, '489', 3, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (188, '489', 4, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (189, '489', 5, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (190, '489', 6, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (191, '489', 7, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (192, '489', 8, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (193, '489', 9, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (194, '489', 10, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (195, '498', 1, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (196, '498', 2, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (197, '498', 3, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (198, '498', 4, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (199, '562', 1, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (200, '562', 5, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (201, '562', 8, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (202, '562', 10, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (203, '562', 13, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (204, '562', 16, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (205, '562', 18, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (206, '562', 20, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (207, '562', 22, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (208, '562', 24, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (209, '814', 1, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (210, '814', 2, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (211, '814', 3, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (212, '814', 4, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (213, '814', 5, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (214, '632', 1, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (215, '632', 5, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (216, '632', 6, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (217, '632', 7, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (218, '632', 8, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (219, '632', 9, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (220, '632', 10, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (221, '632', 11, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (222, '632', 12, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (223, '632', 13, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (224, '433', 6, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (225, '433', 7, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (226, '433', 8, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (227, '433', 9, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (228, '437', 5, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (229, '437', 6, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (230, '437', 7, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (231, '437', 8, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (232, '437', 9, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (233, '437', 10, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (234, '437', 11, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (235, '437', 12, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (236, '468', 2, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (237, '468', 3, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (238, '468', 4, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (239, '468', 5, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (240, '477', 1, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (241, '477', 2, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (242, '477', 3, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (243, '477', 4, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (244, '477', 5, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (245, '488', 6, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (246, '488', 7, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (247, '488', 8, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (248, '488', 9, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (249, '488', 10, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (250, '488', 11, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (251, '488', 12, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (252, '488', 13, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (253, '516', 1, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (254, '516', 2, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (255, '516', 3, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (256, '516', 4, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (257, '516', 5, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (258, '517', 3, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (259, '517', 4, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (260, '517', 5, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (261, '517', 6, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (262, '517', 7, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (263, '517', 8, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (264, '524', 5, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (265, '524', 6, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (266, '524', 7, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (267, '524', 8, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (268, '524', 9, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (269, '524', 10, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (270, '530', 5, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (271, '530', 6, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (272, '530', 7, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (273, '530', 8, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (274, '530', 9, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (275, '530', 10, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (276, '534', 6, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (277, '534', 7, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (278, '534', 8, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (279, '534', 9, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (280, '534', 10, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (281, '534', 11, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (282, '534', 12, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (283, '534', 13, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (284, '570', 1, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (285, '570', 2, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (286, '570', 3, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (287, '570', 4, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (288, '570', 5, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (289, '570', 6, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (290, '571', 1, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (291, '571', 2, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (292, '571', 3, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (293, '571', 4, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (294, '571', 5, 10);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (295, '576', 1, 1);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (296, '576', 2, 2);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (297, '576', 3, 3);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (298, '576', 4, 4);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (299, '576', 5, 5);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (300, '576', 6, 6);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (301, '576', 7, 7);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (302, '576', 8, 8);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (303, '576', 9, 9);

INSERT INTO
    `calificaciones` (
        `id`,
        `cod_materia`,
        `peso_acumulado`,
        `calificacion_definitiva`
    )
VALUES (304, '576', 10, 10);

DROP TABLE IF EXISTS `carrera`;

CREATE TABLE `carrera` (
    `id` int NOT NULL AUTO_INCREMENT,
    `codigo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `nombre_carrera` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 26 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        1,
        '106',
        'Licenciatura en Educación - Mención Dificultades del Aprendizaje'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        3,
        '108',
        'Licenciatura en Educación - Mención Matemática'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        4,
        '111',
        'Licenciatura en Educación - Mención Integral'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        6,
        '280',
        'Ingeniería Industrial'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        11,
        '000',
        'Ciclo Introductorio'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        12,
        '126',
        'Licenciatura en Matemática'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        13,
        '236',
        'Ingeniería de Sistemas'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        14,
        '237',
        'T.S.U. Mantenimiento de Sistemas Informáticos'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        16,
        '281',
        'T.S.U. Higiene y Seguridad Industrial'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        17,
        '508',
        'Licenciatura en Educación mención Educación Matemática'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        18,
        '521',
        'Licenciatura en Educación mención Dificultades de Aprendizaje'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        19,
        '542',
        'Licenciatura en Educación Mención Inicial'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        20,
        '610',
        'Licenciatura en Contaduría Pública'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        21,
        '612',
        'Licenciatura en Administración de Empresas'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        23,
        '430',
        'Técnico Superior Universitario (TSU) en Educación IntegraL'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        24,
        '440',
        'EDUCACION INTEGRAL'
    );

INSERT INTO
    `carrera` (
        `id`,
        `codigo`,
        `nombre_carrera`
    )
VALUES (
        25,
        '116',
        'Introducción a la informática'
    );

DROP TABLE IF EXISTS `control_asesoria`;

CREATE TABLE `control_asesoria` (
    `id` int NOT NULL AUTO_INCREMENT,
    `cedula_alumno` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `nombre_alumno` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `codigo_carrera` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `tipo_asesoria` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `codigo_materia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `cedula_asesor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `nombre_asesor` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `fecha_hora` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 35 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `control_asesoria` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `tipo_asesoria`,
        `codigo_materia`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha_hora`
    )
VALUES (
        18,
        'V-28741147',
        'IBARRA CASTRO AXXA EIDEMAR',
        '237',
        'EN LINEA',
        '116',
        '9858269',
        'Matias Sarabia',
        '2026-09-20 17:40:56'
    );

INSERT INTO
    `control_asesoria` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `tipo_asesoria`,
        `codigo_materia`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha_hora`
    )
VALUES (
        19,
        'V-31463200',
        'CARREÑO ALEJANDRA LUCIANY',
        '521',
        'EN LINEA',
        '116',
        '9858269',
        'Matias Sarabia',
        '2026-09-20 17:41:36'
    );

INSERT INTO
    `control_asesoria` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `tipo_asesoria`,
        `codigo_materia`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha_hora`
    )
VALUES (
        20,
        'V-14904783',
        'BARRIOS GRACIAS YOHANA JOSEFINA',
        '610',
        'VIRTUAL',
        '116',
        '9858269',
        'Ing. Matías Sarabia C.',
        '2026-09-22 22:59:12'
    );

INSERT INTO
    `control_asesoria` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `tipo_asesoria`,
        `codigo_materia`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha_hora`
    )
VALUES (
        23,
        'V-33145659',
        'CARABALLO MARTINEZ MARIA ISABEL',
        '612',
        'EN LINEA',
        '116',
        '9858269',
        'Ing. Matías Sarabia C.',
        '2026-09-22 23:30:33'
    );

INSERT INTO
    `control_asesoria` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `tipo_asesoria`,
        `codigo_materia`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha_hora`
    )
VALUES (
        24,
        'V-16216700',
        'ALCALÁ SALAZAR ROSA URISBETH',
        '521',
        'EN LINEA',
        '118',
        '5336874',
        'MSc. Nancy Lira',
        '2026-09-24 13:03:24'
    );

INSERT INTO
    `control_asesoria` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `tipo_asesoria`,
        `codigo_materia`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha_hora`
    )
VALUES (
        31,
        'V-17525966',
        'VALDEZ MORALES',
        '237',
        'PRESENCIAL',
        '116',
        '9858269',
        'Ing. Matías Sarabia C.',
        '2026-09-29 13:33:05'
    );

INSERT INTO
    `control_asesoria` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `tipo_asesoria`,
        `codigo_materia`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha_hora`
    )
VALUES (
        32,
        'V-23725487',
        'VILLAREAL QUINTERO MONICA MARIA',
        '542',
        'EN LINEA',
        '051',
        '11213945',
        'TOMASA RODRÍGUEZ',
        '2026-09-29 16:34:56'
    );

INSERT INTO
    `control_asesoria` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `tipo_asesoria`,
        `codigo_materia`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha_hora`
    )
VALUES (
        33,
        'V-12686634',
        'PRIETO GONZÁLEZ XIOMARA',
        '542',
        'EN LINEA',
        '057',
        '11213945',
        'TOMASA RODRÍGUEZ',
        '2026-10-01 14:07:41'
    );

DROP TABLE IF EXISTS `control_correcciones`;

CREATE TABLE `control_correcciones` (
    `id` int NOT NULL AUTO_INCREMENT,
    `cedula_alumno` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `nombre_alumno` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `codigo_carrera` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `codigo_materia` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `tipo_correccion` enum('TP', 'TSP', 'TG') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `cedula_asesor` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `nombre_asesor` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 32 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `control_correcciones` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `codigo_materia`,
        `tipo_correccion`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha`
    )
VALUES (
        23,
        'V-31463200',
        'CARREÑO ALEJANDRA LUCIANY',
        '521',
        '116',
        'TP',
        '9858269',
        'Matias Sarabia',
        '2026-09-20 17:05:03'
    );

INSERT INTO
    `control_correcciones` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `codigo_materia`,
        `tipo_correccion`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha`
    )
VALUES (
        24,
        'V-28741147',
        'IBARRA CASTRO AXXA EIDEMAR',
        '237',
        '116',
        'TP',
        '9858269',
        'Matias Sarabia',
        '2026-09-20 17:38:24'
    );

INSERT INTO
    `control_correcciones` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `codigo_materia`,
        `tipo_correccion`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha`
    )
VALUES (
        26,
        'V-28633617',
        'LOPEZ HERRERA CARLOS VICENTE',
        '236',
        '116',
        'TP',
        '9858269',
        'Ing. Matías Sarabia C.',
        '2026-09-30 00:13:25'
    );

INSERT INTO
    `control_correcciones` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `codigo_materia`,
        `tipo_correccion`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha`
    )
VALUES (
        27,
        'V-19402735',
        'MEDINA SUARES JOSBELYS CAROLINA',
        '521',
        '116',
        'TP',
        '9858269',
        'Ing. Matías Sarabia C.',
        '2026-09-30 00:26:47'
    );

INSERT INTO
    `control_correcciones` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `codigo_materia`,
        `tipo_correccion`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha`
    )
VALUES (
        28,
        'V-32461286',
        'TORIBE RODRIGUEZ MARIA EUGENIA',
        '236',
        '116',
        'TP',
        '9858269',
        'Ing. Matías Sarabia C.',
        '2026-09-30 01:03:27'
    );

INSERT INTO
    `control_correcciones` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `codigo_materia`,
        `tipo_correccion`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha`
    )
VALUES (
        29,
        'V-28374252',
        'ZORRILLA CENTENO MARIELIZA EL VALLE',
        '281',
        '116',
        'TP',
        '9858269',
        'Ing. Matías Sarabia C.',
        '2026-09-30 01:18:55'
    );

INSERT INTO
    `control_correcciones` (
        `id`,
        `cedula_alumno`,
        `nombre_alumno`,
        `codigo_carrera`,
        `codigo_materia`,
        `tipo_correccion`,
        `cedula_asesor`,
        `nombre_asesor`,
        `fecha`
    )
VALUES (
        31,
        'V-32329088',
        'LEON RODRIGUEZ YSBETHLIS YUDAL',
        '610',
        '116',
        'TP',
        '9858269',
        'Ing. Matías Sarabia C.',
        '2026-09-30 02:17:27'
    );

DROP TABLE IF EXISTS `materia`;

CREATE TABLE `materia` (
    `id` int NOT NULL AUTO_INCREMENT,
    `codigo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `numobj` int NOT NULL,
    `minaprueba` decimal(5, 2) NOT NULL,
    PRIMARY KEY (`codigo`),
    UNIQUE KEY `id` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 45 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        15,
        '050',
        'Educación Inicial',
        5,
        '3.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        17,
        '051',
        'SALUD ALTERACIONES Y PREVENCIÓN EN EDUCACIÓN INI',
        4,
        '3.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        16,
        '052',
        'DESARROLLO DEL NIÑO DE 0 A 3 AÑOS',
        4,
        '30.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        22,
        '053',
        'DESARROLLO PSICOMOTOR EN EDUCACION INICIAL',
        3,
        '4.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        23,
        '056',
        'EVALUACIÓN Y PLANIFICACIÓN EN EDUCACIÓN INICIAL',
        6,
        '3.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        24,
        '057',
        'DESARROLLO SOCIAL Y EMOCIONAL DEL NIÑO DE 4 A 7 AN',
        5,
        '8.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (3, '107', 'Lógica', 6, '4.00');

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        10,
        '115',
        'LENGUA Y COMUNICACIÓN',
        6,
        '11.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        1,
        '116',
        'Introducción a la informática',
        6,
        '9.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (4, '300', 'Fisica', 6, '4.00');

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        5,
        '315',
        'Investigación de operaciones',
        9,
        '13.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        6,
        '323',
        'Computación I',
        6,
        '26.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        7,
        '327',
        'INTRODUCCIÓN A LA INGENIERÍA DE SISTEMAS',
        5,
        '11.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        9,
        '371',
        'TECNOLOGÍA WEB',
        7,
        '12.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        13,
        '405',
        'DESARROLLO DE HABILIDADES COGNOSCITIVAS',
        4,
        '3.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        14,
        '410',
        'GEOGRAFIA GENERAL',
        8,
        '7.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        20,
        '412',
        'EDUCACION BASICA',
        5,
        '8.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        21,
        '427',
        'TECNICAS Y RECURSOS PARA EL APRENDIZAJE',
        5,
        '8.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        32,
        '433',
        'EVALUACION',
        4,
        '8.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        33,
        '437',
        'MUSICA Y ARTES ESCENICAS',
        7,
        '9.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        34,
        '468',
        'NUEVAS FORMAS DE PARTICIPACION CIUDADANA',
        3,
        '4.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        35,
        '477',
        'FUNDAMENTOS DE LA EDUCACIÓN',
        5,
        '3.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        25,
        '480',
        'EDUCACION AMBIENTAL',
        7,
        '8.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        36,
        '488',
        'HISTORIA DE VENEZUELA',
        6,
        '10.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        27,
        '489',
        'CIENCIAS NATURALES II',
        5,
        '7.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        28,
        '498',
        'SEM DESARR PERS LIDERAZG UNA ESTRAT PARA EL CAM',
        4,
        '3.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        37,
        '516',
        'FUNDAMENTOS DE LA ACCION DOCENTE',
        5,
        '3.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        38,
        '517',
        'FILOSOFÍA DE LA EDUCACIÓN',
        6,
        '6.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        39,
        '524',
        'DESARROLLO DEL SISTEMA EDUCATIVO VENEZOLANO',
        6,
        '8.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        40,
        '530',
        'PLANIFICACIÓN EDUCATIVA',
        6,
        '8.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        41,
        '534',
        'EVALUACION EDUCATIVA',
        7,
        '10.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        11,
        '536',
        'GERENCIA EDUCATIVA',
        5,
        '5.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        26,
        '559',
        'APRENDIZAJE DE LA LECTURA Y LA ESCRITURA',
        5,
        '7.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        29,
        '562',
        'DESARROLLO DEL LENGUAJE',
        10,
        '6.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        42,
        '570',
        'DESARROLLO PSICOLÓGICO',
        6,
        '4.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        43,
        '571',
        'PSICOLOGIA EDUCATIVA',
        5,
        '3.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        44,
        '576',
        'SOCIOLOGIA DE LA EDUCACIÓN Y DESARROLLO COMUNIT',
        6,
        '6.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        31,
        '632',
        'CONTABILIDAD INTERMEDIA',
        10,
        '9.00'
    );

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`
    )
VALUES (
        30,
        '814',
        'SEMINARIO DE ACCION SOCIAL',
        5,
        '3.00'
    );

DROP TABLE IF EXISTS `materia_una`;

CREATE TABLE `materia_una` (
    `id` int NOT NULL AUTO_INCREMENT,
    `codigo` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `descripcion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 298 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        2,
        '051',
        'SALUD ALTERACIONES Y PREVENCIÓN EN EDUCACIÓN INI'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        3,
        '052',
        'DESARROLLO DEL NIÑO DE 0 A 3 AÑOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        4,
        '053',
        'DESARROLLO PSICOMOTOR EN EDUCACION INICIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        5,
        '054',
        'DESARROLLO COGNOSCITIVO DEL NIÑO DE 4 A 7 AÑOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        6,
        '055',
        'PRÁCTICA I DESARROLLO DEL NIÑO DE 0 A 3 AÑOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        7,
        '056',
        'EVALUACIÓN Y PLANIFICACIÓN EN EDUCACIÓN INICIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        8,
        '057',
        'DESARROLLO SOCIAL Y EMOCIONAL DEL NIÑO DE 4 A 7 AN'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        9,
        '058',
        'LA FAMILIA, LA COMUNIDAD Y EL NIÑO EN EDUCACIÓN IN'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        10,
        '059',
        'PRÁCTICA II DESARROLLO COGNOSCITIVO, SOCIOEMOCI'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        11,
        '060',
        'CREATIVIDAD EN EDUCACIÓN INICIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        12,
        '061',
        'PRÁCTICA III EL MAESTRO EN AULA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        13,
        '062',
        'EXPRESIÓN Y CULTURA EN EDUCACIÓN INICIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        14,
        '063',
        'SOLUCIÓN A PROBLEMAS EDUCATIVOS EN EDUCACIÓN IN'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        15,
        '064',
        'PRACTICA IV PROCESOS ADMINISTRATIVOS EN CENTROS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (18, '108', 'INGLES');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        20,
        '116',
        'INTRODUCCIÓN A LA INFORMATICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        22,
        '118',
        'METODOLOGIA DE LA INVESTIGACION'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (23, '119', 'TEMAS DE ETICA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        24,
        '120',
        'LENGUA Y COMUNICACION EN EDUCACION'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        25,
        '121',
        'PROBLEMÁTICA DEL DESARROLLO VENEZOLANO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        26,
        '122',
        'INTRODUCCIÓN A LA HERMENEUTICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        27,
        '126',
        'INTRODUCCION A LA INVESTIGACION'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (28, '175', 'MATEMATICA I');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (29, '177', 'MATEMATICA I');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (30, '179', 'MATEMATICA II');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        31,
        '200',
        'INTRODUCCIÓN A LA INGENIERÍA INDUSTRIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        32,
        '201',
        'SEGURIDAD E HIGIENE INDUSTRIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        33,
        '202',
        'PROCESOS DE MANUFACTURAS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        34,
        '203',
        'CONTROL DE PRODUCCIÓN'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        35,
        '204',
        'MANEJO DE MATERIALES'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        36,
        '205',
        'CONTROL DE CALIDAD'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        37,
        '206',
        'INGENIERIA DE METODOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        38,
        '207',
        'MANTENIMIENTO INDUSTRIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        39,
        '208',
        'DIBUJO INDUSTRIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (40, '209', 'QUIMICA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        41,
        '216',
        'INGENIERIA DE PLANTA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        42,
        '222',
        'ECONOMÍA PARA INGENIEROS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        43,
        '223',
        'GERENCIA INDUSTRIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        44,
        '225',
        'EVALUACION DE PROYECTOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        45,
        '228',
        'INSTRUMENTACIÓN Y CONTROL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        46,
        '231',
        'INGENIERIA DE MATERIALES'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        47,
        '232',
        'MECANICA RACIONAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (48, '233', 'ELECTROTECNIA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (49, '234', 'TERMOFLUIDOS');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        50,
        '235',
        'GERENCIA ORGANIZACIONAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        51,
        '236',
        'LOGISTICA INDUSTRIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        52,
        '237',
        'PRACTICA PROFESIONAL I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        53,
        '238',
        'PRACTICA PROFESIONAL II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        54,
        '240',
        'PROCESOS QUÍMICOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        55,
        '241',
        'GESTIÓN DE CALIDAD'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        56,
        '251',
        'PSICOLOGÍA DEL TRABAJO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        57,
        '252',
        'PREVENCIÓN DE RIESGO I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        58,
        '255',
        'PREVENCION DE RIESGO II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (59, '257', 'PASANTIA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (60, '258', 'ERGONOMIA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        61,
        '259',
        'LEGISLACION LABORAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (62, '300', 'FISICA GENERAL');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        63,
        '305',
        'TEORÍA DE DECISIONES'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        64,
        '306',
        'TEORIA DE SISTEMAS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        65,
        '310',
        'OPTIMIZACIÓN NO LINEAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (66, '311', 'BASE DE DATOS');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        67,
        '312',
        'PROGRAMACIÓN DE SISTEMAS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        68,
        '315',
        'INVESTIGACIÓN DE OPERACIONES I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        69,
        '316',
        'MICROPROCESADORES'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        70,
        '321',
        'INVESTIGACIÓN DE OPERACIONES IV'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (71, '323', 'COMPUTACION I');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (72, '324', 'COMPUTACION II');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        73,
        '326',
        'FISICA GENERAL II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        74,
        '327',
        'INTRODUCCIÓN A LA INGENIERÍA DE SISTEMAS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        75,
        '330',
        'PROCESAMIENTO DE DATOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        76,
        '332',
        'GRAFOS Y MATRICES'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        77,
        '333',
        'ARQUITECTURA DEL COMPUTADOR'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        78,
        '334',
        'COMPUTACIÓN GRÁFICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        79,
        '335',
        'SISTEMAS DE INFORMACION I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        80,
        '336',
        'SISTEMAS DE INFORMACIÓN II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        81,
        '337',
        'SIMULACION DE SISTEMAS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        82,
        '338',
        'SISTEMAS DE INFORMACION III'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        83,
        '339',
        'PRACTICA PROFESIONAL I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        84,
        '341',
        'PRACTICA PROFESIONAL II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        85,
        '342',
        'REDES DE COMPUTADORAS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        86,
        '347',
        'INTRODUCCIÓN A LA INTELIGENCIA ARTIFICIAL Y A LOS '
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        87,
        '348',
        'INVESTIGACION DE OPERACIONES II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        88,
        '349',
        'ORGANIZACIÓN Y MÉTODOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        89,
        '358',
        'SISTEMAS OPERATIVOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        90,
        '370',
        'FUNDAMENTOS DEL COMPUTADOR'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (91, '371', 'TECNOLOGÍA WEB');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        92,
        '372',
        'MANTENIMIENTO PREVENTIVO Y CORRECTIVO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        93,
        '373',
        'MANTENIMIENTO PERFECTIVO Y ADAPTATIVO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        94,
        '374',
        'MARCO LEGAL NFORMÁTICO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (95, '375', 'PASANTIA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        96,
        '405',
        'DESARROLLO DE HABILIDADES COGNOSCITIVAS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (97, '408', 'MATEMATICA I');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        98,
        '410',
        'GEOGRAFIA GENERAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        99,
        '411',
        'DESARROLLO PSICOSOCIAL DEL LENGUAJE'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        100,
        '412',
        'EDUCACION BASICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (101, '414', 'MATEMATICA II');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        102,
        '416',
        'GEOGRAFIA DE VENEZUELA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (103, '420', 'GEOMETRIA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        104,
        '421',
        'PLANIFICACION DE LA INSTRUCCION'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        105,
        '423',
        'SEM DESARR PERS DISEN PUBLIC PERIODICAS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        106,
        '427',
        'TECNICAS Y RECURSOS PARA EL APRENDIZAJE'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        107,
        '428',
        'HISTORIA UNIVERSAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (108, '431', 'ARTES PLASTICAS');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (109, '433', 'EVALUACION');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        110,
        '434',
        'FORMACION CIUDADANA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        111,
        '437',
        'MUSICA Y ARTES ESCENICAS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        112,
        '440',
        'INTRODUCCION A LA INFORMATICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        113,
        '444',
        'EDUCACION FISICA Y DEPORTES'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        114,
        '451',
        'SEMINARIO DE INVESTIGACION EDUCATIVA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        115,
        '454',
        'ANALISIS GRAMATICAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        116,
        '457',
        'LITERATURA VENEZOLANA I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        117,
        '465',
        'PROCESOS CULTURALES DE LA VENEZUELA CONTEMPOR'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        118,
        '468',
        'NUEVAS FORMAS DE PARTICIPACION CIUDADANA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        119,
        '469',
        'HISTORIA Y GEOGRAFIA REGIONAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        120,
        '471',
        'PRACTICA DOCENTE I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        121,
        '472',
        'PRACTICA DOCENTE II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        122,
        '473',
        'PRACTICA DOCENTE III'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        123,
        '474',
        'PRACTICA DOCENTE IV'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        124,
        '475',
        'PRACTICA DOCENTE V'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (125, '476', 'MATEMATICA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        126,
        '477',
        'FUNDAMENTOS DE LA EDUCACIÓN'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (127, '478', 'LECTOESCRITURA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        128,
        '479',
        'ENSEÑANZA DE LA MATEMATICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        129,
        '480',
        'EDUCACION AMBIENTAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        130,
        '481',
        'LITERATURA INFANTIL Y JUVENIL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        131,
        '483',
        'PLANIFICACION DE LA ENSENANZA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        132,
        '484',
        'GEOGRAFIA GENERAL Y DE VENEZUELA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        133,
        '485',
        'CIENCIAS NATURALES I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        134,
        '486',
        'EDUCACION ESTETICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        135,
        '487',
        'DIDACTICA PARA EL DOCENTE INTEGRADOR'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        136,
        '488',
        'HISTORIA DE VENEZUELA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        137,
        '489',
        'CIENCIAS NATURALES II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        138,
        '490',
        'SEM DESARR PERS COMUNICACION EFICAZ'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        139,
        '491',
        'ENSEÑANZA DE LA LENGUA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        140,
        '492',
        'SEMINARIO PRACTICO FORMACION PARA EL TRABAJO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (141, '493', 'EVALUACION');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        142,
        '494',
        'EDUCACION FISICA Y RECREACION'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        143,
        '495',
        'PRACTICA DE ACCION DOCENTE'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        144,
        '497',
        'PRACTICA DE PROMOCION DE CAMBIO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        145,
        '498',
        'SEM DESARR PERS LIDERAZG UNA ESTRAT PARA EL CAM'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        146,
        '516',
        'FUNDAMENTOS DE LA ACCION DOCENTE'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        147,
        '517',
        'FILOSOFÍA DE LA EDUCACIÓN'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        148,
        '524',
        'DESARROLLO DEL SISTEMA EDUCATIVO VENEZOLANO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        149,
        '530',
        'PLANIFICACIÓN EDUCATIVA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        150,
        '532',
        'MATEMÁTICAS Y CIENCIAS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        151,
        '534',
        'EVALUACION EDUCATIVA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        152,
        '536',
        'GERENCIA EDUCATIVA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        153,
        '542',
        'DIDÁCTICA DE LA ARITMÉTICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        154,
        '545',
        'TEORÍA DE LA EDUCACIÓN MATEMÁTICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        155,
        '547',
        'DIDACTICA DEL ALGEBRA Y LA TRIGONOMETRIA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        156,
        '551',
        'EVALUACIÓN DE LOS APRENDIZAJES EN MATEMATICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        157,
        '552',
        'DIDÁCTICA DE LA GEOMETRIA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        158,
        '559',
        'APRENDIZAJE DE LA LECTURA Y LA ESCRITURA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        159,
        '560',
        'DESARROLLO PERSONAL DEL DOCENTE'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        160,
        '562',
        'DESARROLLO DEL LENGUAJE'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        161,
        '564',
        'LITERATURA INFANTIL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        162,
        '570',
        'DESARROLLO PSICOLÓGICO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        163,
        '571',
        'PSICOLOGIA EDUCATIVA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        164,
        '575',
        'TÓPICOS DE MATEMATICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        165,
        '576',
        'SOCIOLOGIA DE LA EDUCACIÓN Y DESARROLLO COMUNIT'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        166,
        '577',
        'DIDÁCTICA DE LA ESTOCÁSTICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        167,
        '578',
        'INVESTIGACIÓN EDUCATIVA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (168, '579', 'PRACTICUM I');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (169, '580', 'PRACTICUM II');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        170,
        '592',
        'DESARROLLO Y PATOLOGIA DEL LENGUAJE'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        172,
        '602',
        'TEORÍA DE LA ORGANIZACIÓN'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        174,
        '655',
        'COSTO INDUSTRIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (175, '733', 'MATEMATICA III');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (176, '735', 'MATEMATICA IV');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        177,
        '737',
        'INTRODUCCIÓN A LA PROBABILIDAD'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        178,
        '738',
        'INFERENCIA ESTADISTICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (179, '739', 'MATEMÁTICA V');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (180, '747', 'PROBABILIDAD');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (181, '748', 'ESTADISTICA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (182, '749', 'CALCULO Ι');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (183, '750', 'CÁLCULO II');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (184, '751', 'CALCULO III');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (185, '752', 'ALGEBRA I');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (186, '753', 'ALGEBRA II');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (187, '754', 'GEOMETRIA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        188,
        '755',
        'ECUACIONES DIFERENCIALES'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        189,
        '756',
        'CALCULO INTEGRAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (190, '757', 'ALGEBRA I');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        191,
        '758',
        'CALCULO VECTORIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (192, '759', 'ALGEBRA II');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        193,
        '760',
        'HISTORIA DE LAS MATEMATICAS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        194,
        '761',
        'DIDACTICA DEL CALCULO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (195, '762', 'ANALISIS I');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        196,
        '763',
        'TOPICOS NUMERICOS EN CALCULO Y ALGEBRA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        197,
        '764',
        'PROBABILIDAD Y ESTADISTICA I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        198,
        '765',
        'DIDACTICA DEL ALGEBRA LINEAL Y LA PROBABILIDAD'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (199, '766', 'ANALISIS II');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        200,
        '767',
        'ECUACIONES DIFERENCIALES'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (201, '768', 'TOPOLOGIA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        202,
        '769',
        'PRACTICA DOCENTE'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        203,
        '770',
        'TÓPICOS DE ANALISIS MATEMATICO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        204,
        '771',
        'OPTIMIZACION NO LINEAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        205,
        '772',
        'PROBABILIDAD Y ESTADISTICA II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        206,
        '773',
        'MODELOS MATEMATICOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        207,
        '775',
        'SISTEMAS DINAMICOS DISCRETOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        208,
        '776',
        'TOPICOS EN OPTIMIZACION I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        209,
        '778',
        'ANALISIS DE DATOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        210,
        '779',
        'PROGRAMACION LINEAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        211,
        '780',
        'TEORIA DE JUEGOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        212,
        '781',
        'INTRODUCCION A LOS ELEMENTOS FINITOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        213,
        '782',
        'ALGEBRA LINEAL NUMERICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        214,
        '783',
        'INTRODUCCION A LOS ESPACIOS DE HILBERT Y SUS OPER'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        217,
        '812',
        'ELABORACION PERIODICA DE PUBLICACIONES ESCOLARE'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        219,
        '814',
        'SEMINARIO DE ACCION SOCIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        221,
        '011',
        'SERVICIO COMUNITARIO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        222,
        '106',
        'PRESENTACION A LA FISICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        225,
        '115',
        'LENGUA Y COMUNICACIÓN'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        227,
        '117',
        'AMBIENTE Y DESARROLLO SOSTENIBLE EN VENEZUELA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (231, '176', 'MATEMATICA I');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (232, '178', 'MATEMATICA II');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (234, '300', 'FISICA GENERAL');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        235,
        '601',
        'INTRODUCCION A LA ADMINISTRACION'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        238,
        '604',
        'ADMINISTRACION PUBLICA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        239,
        '605',
        'SISTEMAS ADMINISTRATIVOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        240,
        '606',
        'SISTEMAS DE INFORMACION'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        241,
        '607',
        'ADMINISTRACIÓN POR PROYECTO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        242,
        '608',
        'CONTROL DE GESTION'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        243,
        '613',
        'INVESTIGACIÓN ADMINISTRATIVA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        244,
        '614',
        'ADMINISTRACION DE RECURSOS HUMANOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        245,
        '615',
        'RIESGOS Y SEGUROS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (246, '616', 'REASEGUROS');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        247,
        '617',
        'CONTABILIDAD INTERMEDIA APLICADA AL SEGURO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        248,
        '618',
        'CONTABILIDAD COMPUTARIZADA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        249,
        '619',
        'ADMINISTRACIÓN DEL RIESGO I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        250,
        '620',
        'FUNDAMENTOS DE INGENIERIA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (251, '621', 'QUIMICA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        252,
        '625',
        'INFORMATICA GERENCIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        253,
        '631',
        'FUNDAMENTOS DE CONTABILIDAD'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        254,
        '632',
        'CONTABILIDAD INTERMEDIA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        255,
        '633',
        'CONTABILIDAD SUPERIOR I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        256,
        '634',
        'CONTABILIDAD GUBERNAMENTAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        257,
        '636',
        'MODELOS CONTABLES'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        258,
        '637',
        'CONTABILIDAD DE COSTOS I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        259,
        '638',
        'SISTEMAS TRIBUTARIOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        260,
        '639',
        'CONTABILIDAD SUPERIOR II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        261,
        '641',
        'TEORIA ECONOMICA I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        262,
        '642',
        'TEORIA ECONÓMICA II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        263,
        '644',
        'ECONOMIA Y SEGUROS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        264,
        '646',
        'TEORIA DEL RIESGO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        265,
        '648',
        'ADMINISTRACIÓN DEL RIESGO II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        266,
        '649',
        'CONTABILIDAD SUPERIOR III'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        267,
        '650',
        'CONTABILIDAD DE COSTOS II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        268,
        '651',
        'DERECHO MERCANTIL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (269, '653', 'DERECHO LABORAL');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        270,
        '654',
        'DERECHO APLICADO AL SEGURO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        271,
        '661',
        'ADMINISTRACIÓN FINANCIERA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        272,
        '663',
        'FINANZAS Y PRESUPUESTO PUBLICO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        273,
        '665',
        'ANALISIS DE ESTADOS FINANCIEROS I'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        274,
        '666',
        'ANALISIS DE ESTADOS FINANCIEROS II'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        275,
        '669',
        'PRESUPUESTO EMPRESARIAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (276, '671', 'MERCADOTECNIA');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        277,
        '672',
        'INVESTIGACION DE MERCADO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        278,
        '673',
        'CONTABILIDAD FISCAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        279,
        '681',
        'PLANIFICACIÓN Y CONTROL DE LA PRODUCCIÓN'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (280, '691', 'AUDITORIA I');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (281, '692', 'AUDITORIA II');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        282,
        '696',
        'PASANTIA (Riesgos y Seguros)'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        283,
        '697',
        'PASANTIA (Contaduría)'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        284,
        '699',
        'PASANTIA (Administración)'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (285, '734', 'MATEMATICA III');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        286,
        '743',
        'ELEMENTOS ACTUARIALES'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        287,
        '745',
        'ESTADÍSTICA GENERAL'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        288,
        '746',
        'ESTADÍSTICA APLICADA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        289,
        '810',
        'REDACCION DE INFORMES TECNICOS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        290,
        '811',
        'FUNDAMENTOS BASICOS EN LA ELABORACION DE PROYE'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (291, '813', 'LIDERAZGO');

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        293,
        '816',
        'FORMACION DE MICROEMPRESAS'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        294,
        '570/',
        'DESARROLLO PSICOLÓGICO'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        295,
        '050',
        'Educación Inicial'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (
        296,
        '612',
        'CONTABILIDAD INTERMEDIA'
    );

INSERT INTO
    `materia_una` (`id`, `codigo`, `descripcion`)
VALUES (297, '107', 'LOGICA');

DROP TABLE IF EXISTS `objetivo_materia`;

CREATE TABLE `objetivo_materia` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `materia_codigo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `nro_objetivo` int NOT NULL,
    `peso` decimal(5, 2) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 297 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (37, '116', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (38, '116', 2, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (39, '116', 3, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (40, '116', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (41, '116', 5, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (42, '116', 6, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (49, '107', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (50, '107', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (51, '107', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (52, '107', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (53, '107', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (54, '107', 6, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (55, '300', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (56, '300', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (57, '300', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (58, '300', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (59, '300', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (60, '300', 6, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (61, '315', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (62, '315', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (63, '315', 3, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (64, '315', 4, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (65, '315', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (66, '315', 6, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (67, '315', 7, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (68, '315', 8, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (69, '315', 9, '5.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (76, '323', 1, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (77, '323', 2, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (78, '323', 3, '5.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (79, '323', 4, '7.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (80, '323', 5, '6.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (81, '323', 6, '8.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (95, '327', 1, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (96, '327', 2, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (97, '327', 3, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (98, '327', 4, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (99, '327', 5, '5.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (100, '371', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (101, '371', 2, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (102, '371', 3, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (103, '371', 4, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (104, '371', 5, '4.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (105, '371', 6, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (106, '371', 7, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (107, '371', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (108, '371', 2, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (109, '371', 3, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (110, '371', 4, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (111, '371', 5, '4.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (112, '371', 6, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (113, '371', 7, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (114, '115', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (115, '115', 2, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (116, '115', 3, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (117, '115', 4, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (118, '115', 5, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (119, '115', 6, '4.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (120, '536', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (121, '536', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (122, '536', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (123, '536', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (124, '536', 5, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (130, '405', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (131, '405', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (132, '405', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (133, '405', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (134, '410', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (135, '410', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (136, '410', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (137, '410', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (138, '410', 5, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (139, '410', 6, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (140, '410', 7, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (141, '410', 8, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (142, '050', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (143, '050', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (144, '050', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (145, '050', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (146, '050', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (147, '052', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (148, '052', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (149, '052', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (150, '052', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (151, '051', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (152, '051', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (153, '051', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (154, '051', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (155, '412', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (156, '412', 2, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (157, '412', 3, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (158, '412', 4, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (159, '412', 5, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (160, '427', 1, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (161, '427', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (162, '427', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (163, '427', 4, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (164, '427', 5, '4.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (165, '053', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (166, '053', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (167, '053', 3, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (168, '056', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (169, '056', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (170, '056', 3, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (171, '056', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (172, '056', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (173, '056', 6, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (174, '057', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (175, '057', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (176, '057', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (177, '057', 4, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (178, '057', 5, '4.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (179, '480', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (180, '480', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (181, '480', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (182, '480', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (183, '480', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (184, '480', 6, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (185, '480', 7, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (186, '559', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (187, '559', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (188, '559', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (189, '559', 4, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (190, '559', 5, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (191, '489', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (192, '489', 2, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (193, '489', 3, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (194, '489', 4, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (195, '489', 5, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (196, '498', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (197, '498', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (198, '498', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (199, '498', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (200, '562', 1, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (201, '562', 2, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (202, '562', 3, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (203, '562', 4, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (204, '562', 5, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (205, '562', 6, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (206, '562', 7, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (207, '562', 8, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (208, '562', 9, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (209, '562', 10, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (210, '814', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (211, '814', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (212, '814', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (213, '814', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (214, '814', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (215, '632', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (216, '632', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (217, '632', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (218, '632', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (219, '632', 5, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (220, '632', 6, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (221, '632', 7, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (222, '632', 8, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (223, '632', 9, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (224, '632', 10, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (225, '433', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (226, '433', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (227, '433', 3, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (228, '433', 4, '4.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (229, '437', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (230, '437', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (231, '437', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (232, '437', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (233, '437', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (234, '437', 6, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (235, '437', 7, '6.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (236, '468', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (237, '468', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (238, '468', 3, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (239, '477', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (240, '477', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (241, '477', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (242, '477', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (243, '477', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (244, '488', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (245, '488', 2, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (246, '488', 3, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (247, '488', 4, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (248, '488', 5, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (249, '488', 6, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (250, '516', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (251, '516', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (252, '516', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (253, '516', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (254, '516', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (255, '517', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (256, '517', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (257, '517', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (258, '517', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (259, '517', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (260, '517', 6, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (261, '524', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (262, '524', 2, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (263, '524', 3, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (264, '524', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (265, '524', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (266, '524', 6, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (267, '530', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (268, '530', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (269, '530', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (270, '530', 4, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (271, '530', 5, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (272, '530', 6, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (273, '534', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (274, '534', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (275, '534', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (276, '534', 4, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (277, '534', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (278, '534', 6, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (279, '534', 7, '3.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (280, '570', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (281, '570', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (282, '570', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (283, '570', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (284, '570', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (285, '570', 6, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (286, '571', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (287, '571', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (288, '571', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (289, '571', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (290, '571', 5, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (291, '576', 1, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (292, '576', 2, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (293, '576', 3, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (294, '576', 4, '1.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (295, '576', 5, '2.00');

INSERT INTO
    `objetivo_materia` (
        `id`,
        `materia_codigo`,
        `nro_objetivo`,
        `peso`
    )
VALUES (296, '576', 6, '4.00');

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nombre_rol` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO `rol` (`id`, `nombre_rol`) VALUES (2, 'administrador');

INSERT INTO `rol` (`id`, `nombre_rol`) VALUES (1, 'usuario');

DROP TABLE IF EXISTS `tarea`;

CREATE TABLE `tarea` (
    `id` int NOT NULL AUTO_INCREMENT,
    `codigo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `tarea` (`id`, `codigo`, `descripcion`)
VALUES (1, 'TP', 'TRABAJO PRACTICO');

INSERT INTO
    `tarea` (`id`, `codigo`, `descripcion`)
VALUES (
        2,
        'TSP',
        'TRABAJO SUSTITUTO DE PRUEBA'
    );

INSERT INTO
    `tarea` (`id`, `codigo`, `descripcion`)
VALUES (3, 'TG', 'TRABAJO DE GRADO');

DROP TABLE IF EXISTS `tipoasesoria`;

CREATE TABLE `tipoasesoria` (
    `id` int NOT NULL AUTO_INCREMENT,
    `codigo_ase` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    `descripcion_asesoria` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_general_ci;

INSERT INTO
    `tipoasesoria` (
        `id`,
        `codigo_ase`,
        `descripcion_asesoria`
    )
VALUES (1, 'VT', 'VIRTUAL');

INSERT INTO
    `tipoasesoria` (
        `id`,
        `codigo_ase`,
        `descripcion_asesoria`
    )
VALUES (2, 'ELI', 'EN LINEA');

INSERT INTO
    `tipoasesoria` (
        `id`,
        `codigo_ase`,
        `descripcion_asesoria`
    )
VALUES (3, 'EGRU', 'ASESORIA GRUPAL');

INSERT INTO
    `tipoasesoria` (
        `id`,
        `codigo_ase`,
        `descripcion_asesoria`
    )
VALUES (4, 'PRE', 'PRESENCIAL');

INSERT INTO
    `tipoasesoria` (
        `id`,
        `codigo_ase`,
        `descripcion_asesoria`
    )
VALUES (6, 'TALLER', 'TALLERES');

INSERT INTO
    `tipoasesoria` (
        `id`,
        `codigo_ase`,
        `descripcion_asesoria`
    )
VALUES (
        7,
        'CIR',
        'CIRCULOS DE ESTUDIOS'
    );

INSERT INTO
    `tipoasesoria` (
        `id`,
        `codigo_ase`,
        `descripcion_asesoria`
    )
VALUES (8, 'JOR', 'JORNADAS');

INSERT INTO
    `tipoasesoria` (
        `id`,
        `codigo_ase`,
        `descripcion_asesoria`
    )
VALUES (9, 'ENC', 'ENCUENTROS');

SET FOREIGN_KEY_CHECKS = 1;