INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        1,
        '116',
        'Introducción a la informática',
        6,
        '9.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        4,
        '300',
        'Fisica',
        6,
        '4.00',
        '2026-2',
        '9858269'
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        5,
        '315',
        'Investigación de operaciones',
        9,
        '13.00',
        '2026-2',
        '9858269'
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        6,
        '323',
        'Computación I',
        6,
        '26.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        7,
        '327',
        'INTRODUCCIÓN A LA INGENIERÍA DE SISTEMAS',
        5,
        '11.00',
        '2026-2',
        '9858269'
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        9,
        '371',
        'TECNOLOGÍA WEB',
        7,
        '12.00',
        '2026-2',
        '9858269'
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        10,
        '115',
        'LENGUA Y COMUNICACIÓN',
        6,
        '11.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        11,
        '536',
        'GERENCIA EDUCATIVA',
        5,
        '5.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        13,
        '405',
        'DESARROLLO DE HABILIDADES COGNOSCITIVAS',
        4,
        '3.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        14,
        '410',
        'GEOGRAFIA GENERAL',
        8,
        '7.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        15,
        '050',
        'Educación Inicial',
        5,
        '3.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        16,
        '052',
        'DESARROLLO DEL NIÑO DE 0 A 3 AÑOS',
        4,
        '30.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        17,
        '051',
        'SALUD ALTERACIONES Y PREVENCIÓN EN EDUCACIÓN INI',
        4,
        '3.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        20,
        '412',
        'EDUCACION BASICA',
        5,
        '8.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        21,
        '427',
        'TECNICAS Y RECURSOS PARA EL APRENDIZAJE',
        5,
        '8.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        22,
        '053',
        'DESARROLLO PSICOMOTOR EN EDUCACION INICIAL',
        3,
        '4.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        23,
        '056',
        'EVALUACIÓN Y PLANIFICACIÓN EN EDUCACIÓN INICIAL',
        6,
        '3.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        24,
        '057',
        'DESARROLLO SOCIAL Y EMOCIONAL DEL NIÑO DE 4 A 7 AN',
        5,
        '8.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        25,
        '480',
        'EDUCACION AMBIENTAL',
        7,
        '8.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        26,
        '559',
        'APRENDIZAJE DE LA LECTURA Y LA ESCRITURA',
        5,
        '7.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        27,
        '489',
        'CIENCIAS NATURALES II',
        5,
        '7.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        28,
        '498',
        'SEM DESARR PERS LIDERAZG UNA ESTRAT PARA EL CAM',
        4,
        '3.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        29,
        '562',
        'DESARROLLO DEL LENGUAJE',
        10,
        '6.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        30,
        '814',
        'SEMINARIO DE ACCION SOCIAL',
        5,
        '3.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        31,
        '632',
        'CONTABILIDAD INTERMEDIA',
        10,
        '9.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        32,
        '433',
        'EVALUACION',
        4,
        '8.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        33,
        '437',
        'MUSICA Y ARTES ESCENICAS',
        7,
        '9.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        34,
        '468',
        'NUEVAS FORMAS DE PARTICIPACION CIUDADANA',
        3,
        '4.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        35,
        '477',
        'FUNDAMENTOS DE LA EDUCACIÓN',
        5,
        '3.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        36,
        '488',
        'HISTORIA DE VENEZUELA',
        6,
        '10.00',
        '2026-2',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        37,
        '516',
        'FUNDAMENTOS DE LA ACCION DOCENTE',
        5,
        '3.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        38,
        '517',
        'FILOSOFÍA DE LA EDUCACIÓN',
        6,
        '6.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        39,
        '524',
        'DESARROLLO DEL SISTEMA EDUCATIVO VENEZOLANO',
        6,
        '8.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        40,
        '530',
        'PLANIFICACIÓN EDUCATIVA',
        6,
        '8.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        41,
        '534',
        'EVALUACION EDUCATIVA',
        7,
        '10.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        42,
        '570',
        'DESARROLLO PSICOLÓGICO',
        6,
        '4.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        43,
        '571',
        'PSICOLOGIA EDUCATIVA',
        5,
        '3.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        44,
        '576',
        'SOCIOLOGIA DE LA EDUCACIÓN Y DESARROLLO COMUNIT',
        6,
        '6.00',
        '',
        ''
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);

INSERT INTO
    `materia` (
        `id`,
        `codigo`,
        `descripcion`,
        `numobj`,
        `minaprueba`,
        `semestre`,
        `cedula_asesor`
    )
VALUES (
        49,
        '107',
        'LOGICA',
        6,
        '4.00',
        '2026-2',
        '9858269'
    )
ON DUPLICATE KEY UPDATE
    `id` = VALUES(`id`),
    `codigo` = VALUES(`codigo`),
    `descripcion` = VALUES(`descripcion`),
    `numobj` = VALUES(`numobj`),
    `minaprueba` = VALUES(`minaprueba`),
    `semestre` = VALUES(`semestre`),
    `cedula_asesor` = VALUES(`cedula_asesor`);