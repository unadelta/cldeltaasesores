const express = require('express');
const mysql = require('mysql2');
require('dotenv').config();
const path = require('path');
const fs = require('fs');
const app = express();
const session = require('express-session');

//Respaldo BD
const cors = require('cors');
require('dotenv').config(); // Muy importante para las credenciales
//Respaldobd


// --- IMPORTANTE: Middlewares globales ---
app.use(cors());
app.use(express.json()); // Necesario para recibir JSON del frontend

// --- Importar las rutas de administración de DB ---
// Asumiendo que creaste el archivo en ./routes/db_admin.routes.js
const dbAdminRoutes = require('./routes/db_admin.routes');


//Repaldo BD

if (process.env.NODE_ENV !== 'production') {
    require('dotenv').config();
}
const pool = mysql.createPool({
    host: process.env.MYSQLHOST || process.env.DB_HOST || 'localhost',
    user: process.env.MYSQLUSER || process.env.DB_USER || 'root',
    password: process.env.MYSQLPASSWORD !== undefined ? process.env.MYSQLPASSWORD : (process.env.DB_PASSWORD || ''),
    database: process.env.MYSQLDATABASE || process.env.DB_NAME || 'asesores', // 👈 Aquí se define 'asesores' por defecto a nivel local
    port: process.env.MYSQLPORT || process.env.DB_PORT || 3306,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
    connectTimeout: 10000 // 10 segundos de límite para evitar que se quede congelado
});

// Definir la variable db para que funcione en todo el servidor con el pool
const db = pool;


// Prueba explícita de conexión al arrancar el servidor
pool.getConnection((err, connection) => {
    if (err) {
        console.error('❌ ERROR: No se pudo conectar a la base de datos de Railway:', err.message);
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            console.error('La conexión con la base de datos fue cerrada.');
        }
        if (err.code === 'ER_CON_COUNT_ERROR') {
            console.error('La base de datos tiene demasiadas conexiones.');
        }
        if (err.code === 'ECONNREFUSED') {
            console.error('La conexión fue rechazada. Revisa el host y el puerto.');
        }
    } else {
        console.log('✅ ¡ÉXITO! Conexión exitosa a la base de datos MySQL .');
        // Es muy importante liberar la conexión de vuelta al pool
        connection.release();
    }
});

// Configuración de Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));
app.use('/views', express.static(path.join(__dirname, 'views')));

// Configuración de la Sesión
app.use(session({
    secret: 'clave_secreta_asesorias_una',
    resave: true,
    saveUninitialized: true,
    cookie: {
        secure: false,
        httpOnly: true,
        maxAge: 24 * 60 * 60 * 1000 // 1 día
    }
}));


// ==========================================
// RUTA RAÍZ (LOGIN)
// ==========================================

app.get('/', (req, res) => {
    // Si ya hay una sesión activa, lo mandamos directo al dashboard
    if (req.session && req.session.usuario) {
        return res.redirect('/dashboard');
    }
    // Si no ha iniciado sesión, muestra tu archivo de login (ajusta el nombre si es login.html o index.html)
    res.sendFile(path.join(__dirname, 'views', 'login.html'));
});

// ==========================================
// RUTA DE AUTENTICACIÓN (LOGIN)
// ==========================================

app.post('/api/login', (req, res) => {
    const { usuario, clave } = req.body;

    if (!usuario || !clave) {
        return res.status(400).json({ success: false, message: 'Por favor, ingrese usuario y contraseña.' });
    }

    const sql = 'SELECT * FROM asesor WHERE usuario = ? AND clave = ?';
    db.query(sql, [usuario, clave], (err, results) => {
        if (err) {
            console.error('Error en el servidor al intentar iniciar sesión:', err);
            return res.status(500).json({ success: false, message: 'Error interno en el servidor.' });
        }

        if (results.length > 0) {
            const asesor = results[0];
            // Guardar datos en la sesión
            req.session.usuario = {
                id: asesor.id,
                cedula: asesor.cedula,
                usuario: asesor.usuario,
                nombre: asesor.nombre,
                email: asesor.email,
                rol_id: asesor.rol_id
            };

            res.json({ success: true, message: 'Autenticación exitosa' });
        } else {
            res.status(401).json({ success: false, message: 'Usuario o contraseña incorrectos.' });
        }
    });
});

// Endpoint para verificar sesión activa (compatible con /api/user-session y /api/sesion-usuario)
app.get('/api/user-session', (req, res) => {
    if (req.session && req.session.usuario) {
        res.json({
            authenticated: true,
            user: req.session.usuario // Mantiene la compatibilidad con el frontend actual
        });
    } else {
        res.json({
            authenticated: false
        });
    }
});


app.get('/api/sesion-usuario', (req, res) => {
    if (req.session && req.session.usuario) {
        res.json({ success: true, nombre: req.session.usuario.nombre || req.session.usuario });
    } else {
        res.json({ success: false, nombre: 'Invitado' });
    }
});




// ==========================================
// RUTA DEL DASHBOARD
// ==========================================

app.get('/dashboard', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'dashboard.html'));
});

// ==========================================
// RUTA Y CRUD COMPLETO PARA EL MÓDULO ASESORES
// ==========================================

app.get('/asesor', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'asesor.html'));
});

app.get('/api/asesores', (req, res) => {
    const sql = 'SELECT * FROM asesor ORDER BY nombre ASC ';
    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error al obtener asesores:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor al consultar asesores' });
        }
        res.json({ success: true, data: results });
    });
});

app.post('/api/asesores', (req, res) => {
    const { cedula, usuario, clave, nombre, email, rol_id } = req.body;
    const sqlVerificar = 'SELECT * FROM asesor WHERE cedula = ? OR usuario = ?';

    db.query(sqlVerificar, [cedula, usuario], (err, results) => {
        if (err) {
            console.error('Error al verificar duplicados:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor' });
        }

        if (results.length > 0) {
            const existeCedula = results.some(row => row.cedula === cedula);
            const mensaje = existeCedula ?
                'Ya existe un asesor registrado con esta cédula.' :
                'El nombre de usuario ya está en uso. Elija otro.';

            return res.status(400).json({ success: false, message: mensaje });
        }

        const sqlInsert = 'INSERT INTO asesor (cedula, usuario, clave, nombre, email, rol_id) VALUES (?, ?, ?, ?, ?, ?)';
        db.query(sqlInsert, [cedula, usuario, clave, nombre, email, rol_id], (err, result) => {
            if (err) {
                console.error('Error al crear asesor:', err);
                return res.status(500).json({ success: false, message: 'Error al registrar el asesor en la base de datos' });
            }
            res.json({ success: true, message: 'Asesor registrado exitosamente', id: result.insertId });
        });
    });
});

app.put('/api/asesores/:id', (req, res) => {
    const { id } = req.params;
    const { cedula, usuario, clave, nombre, email, rol_id } = req.body;

    const sql = 'UPDATE asesor SET cedula = ?, usuario = ?, clave = ?, nombre = ?, email = ?, rol_id = ? WHERE id = ?';
    db.query(sql, [cedula, usuario, clave, nombre, email, rol_id, id], (err, result) => {
        if (err) {
            console.error('Error al actualizar asesor:', err);
            return res.status(500).json({ success: false, message: 'Error al actualizar los datos' });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Asesor no encontrado' });
        }
        res.json({ success: true, message: 'Asesor actualizado correctamente' });
    });
});

app.delete('/api/asesores/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM asesor WHERE id = ?';
    db.query(sql, [id], (err, result) => {
        if (err) {
            console.error('Error al eliminar asesor:', err);
            return res.status(500).json({ success: false, message: 'Error al eliminar el registro' });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Asesor no encontrado' });
        }
        res.json({ success: true, message: 'Asesor eliminado correctamente' });
    });
});

// ==========================================
// RUTA Y CRUD COMPLETO PARA EL MÓDULO CARRERAS
// ==========================================

app.get('/carrera', (req, res) => {
    if (!req.session || (!req.session.usuario && !req.session.user)) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'carrera.html'));
});

app.get('/api/carreras', (req, res) => {
    const sql = 'SELECT * FROM carrera ORDER BY codigo ASC';
    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error al obtener carreras:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor al consultar carreras' });
        }
        res.json({ success: true, data: results });
    });
});

app.post('/api/carreras', (req, res) => {
    const { codigo, nombre_carrera } = req.body;
    const sql = 'INSERT INTO carrera (codigo, nombre_carrera) VALUES (?, ?)';
    db.query(sql, [codigo, nombre_carrera], (err, result) => {
        if (err) {
            console.error('Error al crear carrera:', err);
            return res.status(500).json({ success: false, message: 'Error al registrar la carrera en la base de datos' });
        }
        res.json({ success: true, message: 'Carrera registrada exitosamente', id: result.insertId });
    });
});

app.put('/api/carreras/:id', (req, res) => {
    const { id } = req.params;
    const { codigo, nombre_carrera } = req.body;
    const sql = 'UPDATE carrera SET codigo = ?, nombre_carrera = ? WHERE id = ?';
    db.query(sql, [codigo, nombre_carrera, id], (err, result) => {
        if (err) {
            console.error('Error al actualizar carrera:', err);
            return res.status(500).json({ success: false, message: 'Error al actualizar los datos' });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Carrera no encontrada' });
        }
        res.json({ success: true, message: 'Carrera actualizada correctamente' });
    });
});

app.delete('/api/carreras/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM carrera WHERE id = ?';
    db.query(sql, [id], (err, result) => {
        if (err) {
            console.error('Error al eliminar carrera:', err);
            return res.status(500).json({ success: false, message: 'Error al eliminar el registro' });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Carrera no encontrada' });
        }
        res.json({ success: true, message: 'Carrera eliminada correctamente' });
    });
});

// ==============================================================================
// RUTAS Y LÓGICA PARA EL MÓDULO DE MATERIAS (CRUD COMPLETO + OBJETIVOS Y CALIFICACIONES)
// ==============================================================================

app.get('/materia', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'materia.html'));
});













/*
app.get('/api/materias', async(req, res) => {
    try {
        const connection = db.promise();

        // Obtenemos la cédula del asesor desde la sesión activa
        const cedulaAsesor = req.session && req.session.usuario ? (req.session.usuario.cedula || req.session.usuario.id) : null;
        const semestreSeleccionado = req.query.semestre;

        // Si no hay sesión o no pasan semestre, podemos devolver la lista general o vacía según prefieras,
        // pero para el módulo de calificaciones, filtramos si ambos parámetros están presentes.
        const [materias] = await connection.query('SELECT codigo, descripcion, numobj, minaprueba FROM materia ORDER BY codigo ASC');
        const [objetivos] = await connection.query('SELECT materia_codigo, nro_objetivo, peso FROM objetivo_materia ORDER BY materia_codigo ASC, nro_objetivo ASC');
        const [calificaciones] = await connection.query('SELECT cod_materia, peso_acumulado, calificacion_definitiva FROM calificaciones ORDER BY cod_materia ASC, peso_acumulado ASC');

        let materiasFiltradas = materias;

        // Si tenemos la cédula y el semestre, filtramos estrictamente por las tablas dinámicas existentes
        if (cedulaAsesor && semestreSeleccionado) {
            const cedulaClean = String(cedulaAsesor).replace(/[^a-zA-Z0-9_]/g, '_');
            const semestreClean = String(semestreSeleccionado).replace(/[^a-zA-Z0-9_]/g, '_');
            let materiasDelAsesor = [];

            for (let mat of materias) {
                const codigoClean = mat.codigo.replace(/[^a-zA-Z0-9_]/g, '_');
                const nombreTabla = `calificaciones_${codigoClean}_${cedulaClean}_${semestreClean}`;

                try {
                    // Verificamos si la tabla dinámica existe en la base de datos para este asesor y semestre
                    await connection.query(`SELECT 1 FROM \`${nombreTabla}\` LIMIT 1`);
                    materiasDelAsesor.push(mat);
                } catch (e) {
                    // La tabla no existe, por lo tanto el asesor no imparte esta materia en este semestre
                }
            }
            materiasFiltradas = materiasDelAsesor;
        }

        const materiasFinal = materiasFiltradas.map(mat => {
            return {
                ...mat,
                objetivos: objetivos.filter(obj => obj.materia_codigo === mat.codigo).map(o => ({ nro_objetivo: o.nro_objetivo, peso: o.peso })),
                calificaciones: calificaciones.filter(cal => cal.cod_materia === mat.codigo).map(c => ({ peso_acumulado: c.peso_acumulado, calificacion: c.calificacion_definitiva }))
            };
        });

        res.json({ success: true, data: materiasFinal });
    } catch (err) {
        console.error('Error al obtener materias:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al consultar materias' });
    }
});


app.get('/api/materias/verificar', (req, res) => {
    const { codigo } = req.query;
    db.query('SELECT codigo FROM materia WHERE codigo = ?', [codigo], (err, results) => {
        if (err) {
            console.error('Error al verificar duplicado de materia:', err);
            return res.status(500).json({ success: false, message: 'Error interno al verificar' });
        }
        res.json({ existe: results.length > 0 });
    });
});
app.post('/api/materias', async(req, res) => {
    try {
        const { codigo, descripcion, minaprueba, numobj, semestre, cedula, objetivos, calificaciones } = req.body;

        // Doble validación: Busca la cédula en el body (cliente) o en la sesión activa (servidor)
        const cedulaAsesor = cedula || (req.session && req.session.usuario ? req.session.usuario.cedula : null);

        if (!cedulaAsesor) {
            return res.status(401).json({ success: false, message: 'No se pudo identificar la cédula del asesor en la sesión.' });
        }

        if (!semestre) {
            return res.status(400).json({ success: false, message: 'El semestre es requerido.' });
        }

        if (!codigo || !descripcion || !numobj || !minaprueba) {
            return res.status(400).json({ success: false, message: 'Faltan campos obligatorios básicos.' });
        }

        const connection = db.promise();

        const [materiasExistentes] = await connection.query(
            'SELECT codigo FROM materia WHERE codigo = ?', [codigo]
        );

        if (materiasExistentes.length > 0) {
            return res.status(400).json({
                success: false,
                message: `El código de asignatura '${codigo}' ya se encuentra registrado en el sistema.`
            });
        }

        await connection.query(
            'INSERT INTO materia (codigo, descripcion, numobj, minaprueba) VALUES (?, ?, ?, ?)', [codigo, descripcion, numobj, minaprueba]
        );

        if (Array.isArray(objetivos) && objetivos.length > 0) {
            for (let obj of objetivos) {
                await connection.query(
                    'INSERT INTO objetivo_materia (materia_codigo, nro_objetivo, peso) VALUES (?, ?, ?)', [codigo, obj.nro_objetivo, obj.peso]
                );
            }
        }

        if (Array.isArray(calificaciones) && calificaciones.length > 0) {
            for (let cal of calificaciones) {
                await connection.query(
                    'INSERT INTO calificaciones (cod_materia, peso_acumulado, calificacion_definitiva) VALUES (?, ?, ?)', [codigo, cal.peso_acumulado, cal.calificacion]
                );
            }
        }

        // Sanitización para cumplir estrictamente con: calificaciones_codigo_cedula_semestre
        const codigoClean = codigo.replace(/[^a-zA-Z0-9_]/g, '_');
        const cedulaClean = String(cedulaAsesor).replace(/[^a-zA-Z0-9_]/g, '_');
        const semestreClean = semestre.replace(/[^a-zA-Z0-9_]/g, '_');

        const nombreTablaCalificaciones = `calificaciones_${codigoClean}_${cedulaClean}_${semestreClean}`;

        const queryCrearTabla = `
            CREATE TABLE IF NOT EXISTS \`${nombreTablaCalificaciones}\` (
                id INT AUTO_INCREMENT PRIMARY KEY,
                cedula_estudiante VARCHAR(20) NOT NULL,
                calificacion_definitiva DECIMAL(5,2) DEFAULT 0.00,
                fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
        `;

        await connection.query(queryCrearTabla);

        res.json({
            success: true,
            message: 'Asignatura registrada y tabla de calificaciones creada exitosamente.'
        });

    } catch (err) {
        console.error("Error al registrar asignatura y crear tabla:", err);
        res.status(500).json({ success: false, message: 'Error interno del servidor.' });
    }
});

app.get('/api/materias', async(req, res) => {
    try {
        const connection = db.promise();

        // Obtenemos la cédula del asesor desde la sesión activa
        const cedulaAsesor = req.session && req.session.usuario ? (req.session.usuario.cedula || req.session.usuario.id) : null;
        const semestreSeleccionado = req.query.semestre;

        const [materias] = await connection.query('SELECT codigo, descripcion, numobj, minaprueba FROM materia ORDER BY codigo ASC');
        const [objetivos] = await connection.query('SELECT materia_codigo, nro_objetivo, peso FROM objetivo_materia ORDER BY materia_codigo ASC, nro_objetivo ASC');
        const [calificaciones] = await connection.query('SELECT cod_materia, peso_acumulado, calificacion_definitiva FROM calificaciones ORDER BY cod_materia ASC, peso_acumulado ASC');

        let materiasFiltradas = materias;

        // Si tenemos la cédula y el semestre, filtramos mediante la tabla 'asesor_carrera' 
        // en lugar de depender de que la tabla física de calificaciones de alumnos ya exista.
        if (cedulaAsesor && semestreSeleccionado) {
            const [asignaturasAsesor] = await connection.query(
                `SELECT DISTINCT asignatura FROM asesor_carrera WHERE TRIM(asesor_cedula) = TRIM(?) AND TRIM(semestre) = TRIM(?)`, [cedulaAsesor, semestreSeleccionado]
            );

            const codigosAsignaturas = asignaturasAsesor.map(row => row.asignatura);

            // Filtramos las materias generales que coinciden con las asignadas al asesor en este semestre
            materiasFiltradas = materias.filter(mat => codigosAsignaturas.includes(mat.codigo));
        }

        const materiasFinal = materiasFiltradas.map(mat => {
            return {
                ...mat,
                objetivos: objetivos.filter(obj => obj.materia_codigo === mat.codigo).map(o => ({ nro_objetivo: o.nro_objetivo, peso: o.peso })),
                calificaciones: calificaciones.filter(cal => cal.cod_materia === mat.codigo).map(c => ({ peso_acumulado: c.peso_acumulado, calificacion: c.calificacion_definitiva }))
            };
        });

        res.json({ success: true, data: materiasFinal });
    } catch (err) {
        console.error('Error al obtener materias:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al consultar materias' });
    }
});

app.get('/api/materias/verificar', (req, res) => {
    const { codigo } = req.query;
    db.query('SELECT codigo FROM materia WHERE codigo = ?', [codigo], (err, results) => {
        if (err) {
            console.error('Error al verificar duplicado de materia:', err);
            return res.status(500).json({ success: false, message: 'Error interno al verificar' });
        }
        res.json({ existe: results.length > 0 });
    });
});

*/




// ==========================================
// CRUD Y CONSULTA PARA EL MÓDULO DE MATERIAS
// ==========================================
/*
// 1. OBTENER MATERIAS (Filtradas por la cédula del asesor logueado)
app.get('/api/materias', async(req, res) => {
    try {
        const connection = db.promise();

        // Obtenemos la cédula del asesor desde la sesión activa
        const cedulaAsesor = req.session && req.session.usuario ? (req.session.usuario.cedula || req.session.usuario.id) : null;

        let queryMaterias = 'SELECT id, codigo, descripcion, numobj, minaprueba, cedula_asesor FROM materia';
        let queryParams = [];

        if (cedulaAsesor) {
            queryMaterias += ' WHERE TRIM(cedula_asesor) = TRIM(?)';
            queryParams.push(cedulaAsesor);
        } else {
            queryMaterias += ' WHERE cedula_asesor IS NULL OR cedula_asesor = ""';
        }

        queryMaterias += ' ORDER BY codigo ASC';

        const [materias] = await connection.query(queryMaterias, queryParams);
        const [objetivos] = await connection.query('SELECT materia_codigo, nro_objetivo, peso FROM objetivo_materia ORDER BY materia_codigo ASC, nro_objetivo ASC');
        const [calificaciones] = await connection.query('SELECT cod_materia, peso_acumulado, calificacion_definitiva FROM calificaciones ORDER BY cod_materia ASC, peso_acumulado ASC');

        const materiasFinal = materias.map(mat => {
            return {
                ...mat,
                objetivos: objetivos.filter(obj => obj.materia_codigo === mat.codigo).map(o => ({ nro_objetivo: o.nro_objetivo, peso: o.peso })),
                calificaciones: calificaciones.filter(cal => cal.cod_materia === mat.codigo).map(c => ({ peso_acumulado: c.peso_acumulado, calificacion: c.calificacion_definitiva }))
            };
        });

        res.json({ success: true, data: materiasFinal });
    } catch (err) {
        console.error('Error al obtener materias:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al consultar materias' });
    }
});

// 2. VERIFICAR DUPLICADO DE MATERIA
app.get('/api/materias/verificar', (req, res) => {
    const { codigo } = req.query;
    db.query('SELECT codigo FROM materia WHERE codigo = ?', [codigo], (err, results) => {
        if (err) {
            console.error('Error al verificar duplicado de materia:', err);
            return res.status(500).json({ success: false, message: 'Error interno al verificar' });
        }
        res.json({ existe: results.length > 0 });
    });
});

// 3. REGISTRAR NUEVA MATERIA (POST)
app.post('/api/materias', async(req, res) => {
    try {
        const { codigo, descripcion, minaprueba, numobj } = req.body;
        const cedulaAsesor = req.session && req.session.usuario ? req.session.usuario.cedula : null;

        if (!codigo || !descripcion) {
            return res.status(400).json({ success: false, message: 'El código y la descripción son obligatorios.' });
        }

        const connection = db.promise();
        const [existente] = await connection.query('SELECT id FROM materia WHERE codigo = ?', [codigo]);

        if (existente.length > 0) {
            return res.status(400).json({ success: false, message: `La materia con código ${codigo} ya existe.` });
        }

        const queryInsert = `
            INSERT INTO materia (codigo, descripcion, minaprueba, numobj, cedula_asesor) 
            VALUES (?, ?, ?, ?, ?)
        `;
        const [result] = await connection.query(queryInsert, [
            codigo,
            descripcion,
            minaprueba || 0,
            numobj || 0,
            cedulaAsesor
        ]);

        res.json({ success: true, message: 'Materia registrada exitosamente.', id: result.insertId });
    } catch (err) {
        console.error('Error al registrar materia:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al registrar la materia.' });
    }
});
*/
// 4. ACTUALIZAR MATERIA EXISTENTE (PUT) - Desde materia.html
/*
app.put('/api/materias/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const { codigo, descripcion, minaprueba, numobj } = req.body;
        const cedulaAsesor = req.session && req.session.usuario ? req.session.usuario.cedula : null;

        if (!codigo || !descripcion) {
            return res.status(400).json({ success: false, message: 'El código y la descripción son obligatorios.' });
        }

        const connection = db.promise();

        // Verificar que la materia pertenezca al asesor o exista
        const queryUpdate = `
            UPDATE materia 
            SET codigo = ?, descripcion = ?, minaprueba = ?, numobj = ? 
            WHERE id = ?
        `;
        const [result] = await connection.query(queryUpdate, [
            codigo,
            descripcion,
            minaprueba || 0,
            numobj || 0,
            id
        ]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Materia no encontrada.' });
        }

        res.json({ success: true, message: 'Materia actualizada correctamente.' });
    } catch (err) {
        console.error('Error al actualizar materia:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al actualizar la materia.' });
    }
});
*/
/*
app.put('/api/materias/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const { codigo, descripcion, minaprueba, numobj, cedula, objetivos, calificaciones } = req.body;

        // Obtenemos la cédula del asesor desde el body o la sesión activa
        const cedulaAsesor = cedula || (req.session && req.session.usuario ? req.session.usuario.cedula : null);

        if (!codigo || !descripcion) {
            return res.status(400).json({ success: false, message: 'El código y la descripción son obligatorios.' });
        }

        const connection = db.promise();

        // Actualización incluyendo la cédula del asesor
        const queryUpdate = `
            UPDATE materia 
            SET codigo = ?, descripcion = ?, minaprueba = ?, numobj = ?, cedula_asesor = ? 
            WHERE id = ? OR codigo = ?
        `;
        const [result] = await connection.query(queryUpdate, [
            codigo,
            descripcion,
            minaprueba || 0,
            numobj || 0,
            cedulaAsesor || null,
            id,
            id
        ]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Materia no encontrada.' });
        }

        // Sincronizar objetivos si vienen en la petición
        if (Array.isArray(objetivos)) {
            await connection.query('DELETE FROM objetivo_materia WHERE materia_codigo = ?', [codigo]);
            for (let obj of objetivos) {
                await connection.query(
                    'INSERT INTO objetivo_materia (materia_codigo, nro_objetivo, peso) VALUES (?, ?, ?)', [codigo, obj.nro_objetivo, obj.peso]
                );
            }
        }

        // Sincronizar calificaciones si vienen en la petición
        if (Array.isArray(calificaciones)) {
            await connection.query('DELETE FROM calificaciones WHERE cod_materia = ?', [codigo]);
            for (let cal of calificaciones) {
                await connection.query(
                    'INSERT INTO calificaciones (cod_materia, peso_acumulado, calificacion_definitiva) VALUES (?, ?, ?)', [codigo, cal.peso_acumulado, cal.calificacion]
                );
            }
        }

        res.json({ success: true, message: 'Materia actualizada correctamente.' });
    } catch (err) {
        console.error('Error al actualizar materia:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al actualizar la materia.' });
    }
});
*/

/*********************************************************** */

// EN EL POST /api/materias (Registro)
/*
app.post('/api/materias', async(req, res) => {
    try {
        const { codigo, descripcion, minaprueba, numobj, semestre, cedula, objetivos, calificaciones } = req.body;
        const cedulaAsesor = cedula || (req.session && req.session.usuario ? req.session.usuario.cedula : null);

        // ... validaciones previas ...

        const connection = db.promise();

        // Guardar la materia incluyendo el campo semestre
        await connection.query(
            'INSERT INTO materia (codigo, descripcion, numobj, minaprueba, semestre, cedula_asesor) VALUES (?, ?, ?, ?, ?, ?)', [codigo, descripcion, numobj, minaprueba, semestre || null, cedulaAsesor]
        );

        // ... inserción de objetivos, calificaciones y creación de tabla dinámica ...
        res.json({ success: true, message: 'Asignatura registrada exitosamente.' });
    } catch (err) {
        console.error("Error al registrar asignatura:", err);
        res.status(500).json({ success: false, message: 'Error interno del servidor.' });
    }
});
*/

app.post('/api/materias', async(req, res) => {
    try {
        const { codigo, descripcion, minaprueba, numobj, semestre, cedula, objetivos, calificaciones } = req.body;

        const cedulaAsesor = cedula || (req.session && req.session.usuario ? req.session.usuario.cedula : null);

        if (!cedulaAsesor) {
            return res.status(401).json({ success: false, message: 'No se pudo identificar la cédula del asesor en la sesión.' });
        }

        if (!semestre) {
            return res.status(400).json({ success: false, message: 'El semestre es requerido.' });
        }

        if (!codigo || !descripcion || !numobj || !minaprueba) {
            return res.status(400).json({ success: false, message: 'Faltan campos obligatorios básicos.' });
        }

        const connection = db.promise();

        // 1. Verificar si la materia ya existe
        const [materiasExistentes] = await connection.query(
            'SELECT codigo FROM materia WHERE codigo = ?', [codigo]
        );

        if (materiasExistentes.length > 0) {
            return res.status(400).json({
                success: false,
                message: `El código de asignatura '${codigo}' ya se encuentra registrado en el sistema.`
            });
        }

        // 2. Insertar en la tabla principal materia (incluyendo semestre y cedula_asesor)
        await connection.query(
            'INSERT INTO materia (codigo, descripcion, numobj, minaprueba, semestre, cedula_asesor) VALUES (?, ?, ?, ?, ?, ?)', [codigo, descripcion, numobj, minaprueba, semestre, cedulaAsesor]
        );

        // 3. Insertar los pesos de cada objetivo en la tabla objetivo_materia
        if (Array.isArray(objetivos) && objetivos.length > 0) {
            for (let obj of objetivos) {
                await connection.query(
                    'INSERT INTO objetivo_materia (materia_codigo, nro_objetivo, peso) VALUES (?, ?, ?)', [codigo, obj.nro_objetivo, obj.peso]
                );
            }
        }

        // 4. Insertar la escala de calificaciones en la tabla calificaciones estática
        if (Array.isArray(calificaciones) && calificaciones.length > 0) {
            for (let cal of calificaciones) {
                await connection.query(
                    'INSERT INTO calificaciones (cod_materia, peso_acumulado, calificacion_definitiva, cedula_asesor, semestre) VALUES (?, ?, ?, ?, ?)', [codigo, cal.peso_acumulado, cal.calificacion, cedulaAsesor, semestre]
                );
            }
        }

        // 5. Crear dinámicamente la tabla física: calificaciones_codigo_cedula_semestre
        const codigoClean = codigo.replace(/[^a-zA-Z0-9_]/g, '_');
        const cedulaClean = String(cedulaAsesor).replace(/[^a-zA-Z0-9_]/g, '_');
        const semestreClean = semestre.replace(/[^a-zA-Z0-9_]/g, '_');

        const nombreTablaCalificaciones = `calificaciones_${codigoClean}_${cedulaClean}_${semestreClean}`;

        // Generar dinámicamente las columnas de los objetivos (ej. obj1, obj2, obj3...)
        let columnasObjetivosDinamicas = '';
        for (let i = 1; i <= parseInt(numobj); i++) {
            columnasObjetivosDinamicas += `\`obj${i}\` DECIMAL(5,2) DEFAULT 0.00,\n`;
        }

        const queryCrearTabla = `
            CREATE TABLE IF NOT EXISTS \`${nombreTablaCalificaciones}\` (
                id INT AUTO_INCREMENT PRIMARY KEY,
                cedula_estudiante VARCHAR(20) NOT NULL,
                nombre_alumno VARCHAR(150) DEFAULT '',
                ${columnasObjetivosDinamicas}
                nota_final DECIMAL(5,2) DEFAULT 0.00,
                nota_final_letra VARCHAR(10) DEFAULT '',
                cedula_asesor VARCHAR(20) DEFAULT NULL,
                semestre VARCHAR(20) DEFAULT NULL,
                fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                UNIQUE KEY unique_estudiante (cedula_estudiante)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
        `;

        await connection.query(queryCrearTabla);

        res.json({
            success: true,
            message: 'Asignatura registrada, objetivos guardados y tabla de calificaciones creada exitosamente.'
        });

    } catch (err) {
        console.error("Error al registrar asignatura y crear tabla:", err);
        res.status(500).json({ success: false, message: 'Error interno del servidor.' });
    }
});





// EN EL PUT /api/materias/:id (Edición)
app.put('/api/materias/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const { codigo, descripcion, minaprueba, numobj, semestre, cedula, objetivos, calificaciones } = req.body;
        const cedulaAsesor = cedula || (req.session && req.session.usuario ? req.session.usuario.cedula : null);

        const connection = db.promise();

        // Actualizar datos incluyendo el semestre
        const queryUpdate = `
            UPDATE materia 
            SET codigo = ?, descripcion = ?, minaprueba = ?, numobj = ?, semestre = ?, cedula_asesor = ? 
            WHERE id = ? OR codigo = ?
        `;
        const [result] = await connection.query(queryUpdate, [
            codigo,
            descripcion,
            minaprueba || 0,
            numobj || 0,
            semestre || null,
            cedulaAsesor || null,
            id,
            id
        ]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Materia no encontrada.' });
        }

        // Sincronizar objetivos y calificaciones si aplican...
        res.json({ success: true, message: 'Materia actualizada correctamente.' });
    } catch (err) {
        console.error('Error al actualizar materia:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al actualizar la materia.' });
    }
});

// EN EL GET /api/materias (Consulta)
app.get('/api/materias', async(req, res) => {
    try {
        const connection = db.promise();
        // Asegúrate de seleccionar el campo semestre desde la tabla materia
        const [materias] = await connection.query('SELECT codigo, descripcion, numobj, minaprueba, semestre, cedula_asesor FROM materia ORDER BY codigo ASC');
        const [objetivos] = await connection.query('SELECT materia_codigo, nro_objetivo, peso FROM objetivo_materia ORDER BY materia_codigo ASC, nro_objetivo ASC');
        const [calificaciones] = await connection.query('SELECT cod_materia, peso_acumulado, calificacion_definitiva FROM calificaciones ORDER BY cod_materia ASC, peso_acumulado ASC');

        const materiasFinal = materias.map(mat => {
            return {
                ...mat,
                objetivos: objetivos.filter(obj => obj.materia_codigo === mat.codigo).map(o => ({ nro_objetivo: o.nro_objetivo, peso: o.peso })),
                calificaciones: calificaciones.filter(cal => cal.cod_materia === mat.codigo).map(c => ({ peso_acumulado: c.peso_acumulado, calificacion: c.calificacion_definitiva }))
            };
        });

        res.json({ success: true, data: materiasFinal });
    } catch (err) {
        console.error('Error al obtener materias:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al consultar materias' });
    }
});

/*
// Endpoint para obtener las materias del asesor basadas en las tablas físicas de calificaciones y el semestre
app.get('/api/materias-asesor', async(req, res) => {
    try {
        // Soporte amplio para capturar la cédula según cómo esté estructurada tu sesión
        const cedulaAsesor = req.session && req.session.usuario ? (req.session.usuario.cedula || req.session.usuario.id) :
            (req.session && req.session.cedula ? req.session.cedula : null);

        const semestreFiltro = req.query.semestre;

        if (!cedulaAsesor) {
            return res.status(401).json({ success: false, message: 'No autenticado o cédula no encontrada en sesión.' });
        }

        if (!semestreFiltro) {
            return res.status(400).json({ success: false, message: 'El semestre es requerido.' });
        }

        const connection = db.promise();
        const patron = `calificaciones_%_${cedulaAsesor}_${semestreFiltro}`;
        const [tables] = await connection.query(`SHOW TABLES LIKE ?`, [patron]);

        const materiasEncontradas = [];

        for (let row of tables) {
            const nombreTabla = Object.values(row)[0];
            const partes = nombreTabla.split('_');
            if (partes.length >= 4) {
                const codigoMateria = partes[1];

                const [materiaInfo] = await connection.query(
                    'SELECT descripcion, numobj, minaprueba FROM materia WHERE codigo = ?', [codigoMateria]
                );

                let descripcion = `Asignatura ${codigoMateria}`;
                let numobj = 0;
                let minaprueba = 0;

                if (materiaInfo.length > 0) {
                    descripcion = materiaInfo[0].descripcion;
                    numobj = materiaInfo[0].numobj;
                    minaprueba = materiaInfo[0].minaprueba;
                }

                materiasEncontradas.push({
                    codigo: codigoMateria,
                    descripcion: descripcion,
                    numobj: numobj,
                    minaprueba: minaprueba,
                    cedula_asesor: cedulaAsesor,
                    semestre: semestreFiltro
                });
            }
        }

        res.json({ success: true, data: materiasEncontradas });

    } catch (err) {
        console.error("Error al listar materias por tablas físicas:", err);
        res.status(500).json({ success: false, message: 'Error interno del servidor.' });
    }
});
*/
/*
// 5. ELIMINAR MATERIA (DELETE)
app.delete('/api/materias/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const connection = db.promise();
        const [result] = await connection.query('DELETE FROM materia WHERE id = ?', [id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Materia no encontrada.' });
        }

        res.json({ success: true, message: 'Materia eliminada correctamente.' });
    } catch (err) {
        console.error('Error al eliminar materia:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al eliminar la materia.' });
    }
});

app.delete('/api/materias/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const connection = db.promise();

        // 1. Primero obtenemos el código de la materia (por si pasan el ID numérico o el código directamente)
        let codigoMateria = id;
        const [materiaRows] = await connection.query('SELECT codigo FROM materia WHERE id = ? OR codigo = ?', [id, id]);

        if (materiaRows.length > 0) {
            codigoMateria = materiaRows[0].codigo;
        }

        // 2. Eliminamos los registros dependientes para mantener la integridad de la base de datos
        await connection.query('DELETE FROM objetivo_materia WHERE materia_codigo = ?', [codigoMateria]);
        await connection.query('DELETE FROM calificaciones WHERE cod_materia = ?', [codigoMateria]);

        // 3. Eliminamos la materia principal (buscando por id o por código)
        const [result] = await connection.query('DELETE FROM materia WHERE id = ? OR codigo = ?', [id, id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Materia no encontrada.' });
        }

        res.json({ success: true, message: 'Materia y sus registros asociados eliminados correctamente.' });
    } catch (err) {
        console.error('Error al eliminar materia:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al eliminar la materia.' });
    }
});

*/

app.delete('/api/materias/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const connection = db.promise();

        // 1. Obtener los datos de la materia para identificar su código, semestre y cédula del asesor
        const [materiaRows] = await connection.query(
            'SELECT codigo, semestre, cedula_asesor FROM materia WHERE id = ? OR codigo = ?', [id, id]
        );

        if (materiaRows.length === 0) {
            return res.status(404).json({ success: false, message: 'Materia no encontrada.' });
        }

        const materia = materiaRows[0];
        const codigoMateria = materia.codigo;
        const semestreMateria = materia.semestre;
        const cedulaAsesor = materia.cedula_asesor;

        // 2. Eliminar registros de las tablas relacionadas estáticas
        await connection.query('DELETE FROM objetivo_materia WHERE materia_codigo = ?', [codigoMateria]);
        await connection.query('DELETE FROM calificaciones WHERE cod_materia = ?', [codigoMateria]);

        // 3. Eliminar (dropear) la tabla dinámica específica: calificaciones_codigo_cedula_semestre
        if (cedulaAsesor && semestreMateria) {
            const codigoClean = codigoMateria.replace(/[^a-zA-Z0-9_]/g, '_');
            const cedulaClean = String(cedulaAsesor).replace(/[^a-zA-Z0-9_]/g, '_');
            const semestreClean = semestreMateria.replace(/[^a-zA-Z0-9_]/g, '_');
            const nombreTablaDinamica = `calificaciones_${codigoClean}_${cedulaClean}_${semestreClean}`;

            try {
                await connection.query(`DROP TABLE IF EXISTS \`${nombreTablaDinamica}\``);
            } catch (dropErr) {
                console.error('Aviso: No se pudo eliminar la tabla dinámica o no existía:', dropErr);
            }
        }

        // 4. Eliminar el registro principal de la tabla materia
        const [result] = await connection.query('DELETE FROM materia WHERE id = ? OR codigo = ?', [id, id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Materia no encontrada.' });
        }

        res.json({
            success: true,
            message: 'Materia, calificaciones, objetivos y tabla dinámica eliminados correctamente.'
        });

    } catch (err) {
        console.error('Error al eliminar materia:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al eliminar la materia.' });
    }
});

// Nuevo endpoint para listar asignaturas basándose estrictamente en las tablas físicas de calificaciones
/*
app.get('/api/materias-por-tablas', async(req, res) => {
    try {
        const cedulaAsesor = req.session && req.session.usuario ? (req.session.usuario.cedula || req.session.usuario.id) :
            (req.session && req.session.cedula ? req.session.cedula : null);
        const semestreFiltro = req.query.semestre;

        if (!cedulaAsesor || !semestreFiltro) {
            return res.status(400).json({ success: false, message: 'Faltan parámetros de sesión o semestre.' });
        }

        const connection = db.promise();

        // Patrón estricto para buscar únicamente tablas con el formato: calificaciones_%_cedula_semestre
        const patron = `calificaciones_%_${cedulaAsesor}_${semestreFiltro}`;
        const [tables] = await connection.query(`SHOW TABLES LIKE ?`, [patron]);

        const materiasEncontradas = [];
        const codigosProcesados = new Set();

        for (let row of tables) {
            const nombreTabla = Object.values(row)[0];
            const partes = nombreTabla.split('_');

            // Validamos estrictamente el formato de 4 partes: [calificaciones, codigo, cedula, semestre]
            if (partes.length >= 4 && partes[0] === 'calificaciones') {
                const codigoMateria = partes[1];
                const cedulaTabla = partes[2];
                const semestreTabla = partes[3];

                // Doble validación estricta de que la cédula y el semestre coincidan exactamente con la sesión y el formulario
                if (cedulaTabla === String(cedulaAsesor) && semestreTabla === String(semestreFiltro)) {
                    if (!codigosProcesados.has(codigoMateria)) {
                        codigosProcesados.add(codigoMateria);

                        // Consultar la descripción oficial en la tabla materia
                        const [materiaInfo] = await connection.query(
                            'SELECT descripcion, numobj, minaprueba FROM materia WHERE codigo = ?', [codigoMateria]
                        );

                        let descripcion = `Asignatura ${codigoMateria}`;
                        let numobj = 5;
                        let minaprueba = 9.5;

                        if (materiaInfo.length > 0) {
                            descripcion = materiaInfo[0].descripcion;
                            numobj = materiaInfo[0].numobj || 5;
                            minaprueba = materiaInfo[0].minaprueba || 9.5;
                        }

                        materiasEncontradas.push({
                            codigo: codigoMateria,
                            descripcion: descripcion,
                            numobj: numobj,
                            minaprueba: minaprueba,
                            cedula_asesor: cedulaTabla,
                            semestre: semestreTabla
                        });
                    }
                }
            }
        }

        // Ordenar las materias por código
        materiasEncontradas.sort((a, b) => String(a.codigo).localeCompare(String(b.codigo), undefined, {
            numeric: true,
            sensitivity: 'base'
        }));

        res.json({ success: true, data: materiasEncontradas });

    } catch (err) {
        console.error("Error al buscar materias por tablas físicas:", err);
        res.status(500).json({ success: false, message: 'Error interno del servidor.' });
    }
});

*/




// Endpoint para eliminar alumno
// Endpoint completo para buscar materias basándose estrictamente en las tablas físicas de calificaciones
app.get('/api/materias-por-tablas', async(req, res) => {
    try {
        const cedulaAsesor = req.session && req.session.usuario ? (req.session.usuario.cedula || req.session.usuario.id) :
            (req.session && req.session.cedula ? req.session.cedula : null);
        const semestreFiltro = req.query.semestre;

        console.log("Cédula detectada:", cedulaAsesor, "| Semestre recibido:", semestreFiltro);

        if (!cedulaAsesor || !semestreFiltro) {
            return res.status(401).json({ success: false, message: 'No autenticado o cédula no encontrada en sesión.' });
        }

        if (!semestreFiltro) {
            return res.status(400).json({ success: false, message: 'El semestre es requerido.' });
        }

        const connection = db.promise();

        // Traemos todas las tablas que comiencen con 'calificaciones_' para filtrarlas con seguridad en memoria
        const [allTables] = await connection.query(`SHOW TABLES LIKE 'calificaciones_%'`);

        const materiasEncontradas = [];
        const codigosProcesados = new Set();

        for (let row of allTables) {
            const nombreTabla = Object.values(row)[0];
            const partes = nombreTabla.split('_');

            // Formato esperado: [calificaciones, codigo, cedula, anio, periodo] o similar dependiendo de cuántos fragmentos tenga
            // Ejemplo: calificaciones_116_9858269_2026_2 -> partes[1]=116, partes[2]=9858269, partes[3]=2026, partes[4]=2
            if (partes.length >= 4 && partes[0] === 'calificaciones') {
                const codigoMateria = partes[1];
                const cedulaTabla = partes[2];

                // Unimos las últimas partes para reconstruir el semestre exacto (ej. "2026_2" o "2026-2")
                const semestreTabla = partes.slice(3).join('-');
                const semestreTablaBajo = partes.slice(3).join('_');

                // Validamos que coincidan estrictamente con la cédula y el semestre activo
                if (cedulaTabla === String(cedulaAsesor) &&
                    (semestreTabla === String(semestreFiltro) || semestreTablaBajo === String(semestreFiltro).replace('-', '_'))) {

                    if (!codigosProcesados.has(codigoMateria)) {
                        codigosProcesados.add(codigoMateria);

                        // Consultar la descripción oficial en la tabla materia
                        const [materiaInfo] = await connection.query(
                            'SELECT descripcion, numobj, minaprueba FROM materia WHERE codigo = ?', [codigoMateria]
                        );

                        let descripcion = `Asignatura ${codigoMateria}`;
                        let numobj = 5;
                        let minaprueba = 9.5;

                        if (materiaInfo.length > 0) {
                            descripcion = materiaInfo[0].descripcion;
                            numobj = materiaInfo[0].numobj || 5;
                            minaprueba = materiaInfo[0].minaprueba || 9.5;
                        }

                        materiasEncontradas.push({
                            codigo: codigoMateria,
                            descripcion: descripcion,
                            numobj: numobj,
                            minaprueba: minaprueba,
                            cedula_asesor: cedulaTabla,
                            semestre: semestreFiltro
                        });
                    }
                }
            }
        }

        // Ordenar las materias por código de forma numérica/alfabética
        materiasEncontradas.sort((a, b) => String(a.codigo).localeCompare(String(b.codigo), undefined, {
            numeric: true,
            sensitivity: 'base'
        }));

        res.json({ success: true, data: materiasEncontradas });

    } catch (err) {
        console.error("Error al buscar materias por tablas físicas:", err);
        res.status(500).json({ success: false, message: 'Error interno del servidor.' });
    }
});

/***alumnos para eliminar */
/*
// Endpoint para obtener la lista de alumnos ordenada para el combobox
app.get('/api/alumnos', (req, res) => {
    const query = 'SELECT id, cedula, nombre, codigo_carrera FROM alumno ORDER BY nombre ASC';
    db.query(query, (err, results) => {
        if (err) {
            console.error('❌ Error al obtener alumnos:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor al consultar alumnos.' });
        }
        res.json({ success: true, data: results });
    });
});



// ACTUALIZAR ALUMNO EXISTENTE (PUT)
app.put('/api/alumnos/:id', (req, res) => {
    const { id } = req.params;
    const { cedula, nombre, codigo_carrera, descripcion_carrera } = req.body;

    if (!cedula || !cedula.trim() || !nombre || !nombre.trim() || !codigo_carrera || !codigo_carrera.trim()) {
        return res.status(400).json({
            success: false,
            message: 'Todos los campos son obligatorios.'
        });
    }

    const cedulaLimpia = cedula.trim();

    db.query('SELECT id FROM alumno WHERE cedula = ? AND id != ?', [cedulaLimpia, id], (err, existente) => {
        if (err) {
            console.error('Error al verificar duplicado en UPDATE:', err);
            return res.status(500).json({ success: false, message: 'Error interno del servidor.' });
        }

        if (existente.length > 0) {
            return res.status(400).json({
                success: false,
                message: `La cédula ${cedulaLimpia} pertenece a otro alumno.`
            });
        }

        const sqlUpdate = 'UPDATE alumno SET cedula = ?, nombre = ?, codigo_carrera = ?, descripcion_carrera = ? WHERE id = ?';
        db.query(sqlUpdate, [cedulaLimpia, nombre.trim(), codigo_carrera.trim(), (descripcion_carrera || '').trim(), id], (err, result) => {
            if (err) {
                console.error('Error al actualizar alumno:', err);
                return res.status(500).json({ success: false, message: 'Error al actualizar los datos en la base de datos.' });
            }

            if (result.affectedRows === 0) {
                return res.status(404).json({ success: false, message: 'Alumno no encontrado.' });
            }

            res.json({
                success: true,
                message: 'Alumno actualizado correctamente.'
            });
        });
    });
});

*/

// ==========================================
// MÓDULO DE ALUMNOS (API)
// ==========================================

// 1. Obtener todos los alumnos registrados
/*
app.get('/api/alumnos', async(req, res) => {
    try {
        const connection = db.promise();
        const [rows] = await connection.query('SELECT * FROM alumno ORDER BY id DESC');
        res.json({ success: true, data: rows });
    } catch (err) {
        console.error("Error al obtener alumnos:", err);
        res.status(500).json({ success: false, message: 'Error interno del servidor al obtener alumnos.' });
    }
});

// 2. Registrar un nuevo alumno
app.post('/api/alumnos', async(req, res) => {
    try {
        const { cedula, nombre, codigo_carrera, descripcion_carrera } = req.body;

        if (!cedula || !nombre || !codigo_carrera) {
            return res.status(400).json({ success: false, message: 'Faltan campos obligatorios.' });
        }

        const connection = db.promise();

        // Verificar si la cédula ya existe
        const [existing] = await connection.query('SELECT id FROM alumnos WHERE cedula = ?', [cedula]);
        if (existing.length > 0) {
            return res.json({ success: false, message: 'La cédula ya se encuentra registrada.' });
        }

        const query = 'INSERT INTO alumno (cedula, nombre, codigo_carrera, descripcion_carrera) VALUES (?, ?, ?, ?)';
        const [result] = await connection.query(query, [cedula, nombre, codigo_carrera, descripcion_carrera || '']);

        res.json({ success: true, message: 'Alumno registrado correctamente.', id: result.insertId });
    } catch (err) {
        console.error("Error al registrar alumno:", err);
        res.status(500).json({ success: false, message: 'Error interno del servidor al registrar alumno.' });
    }
});

// 3. Actualizar un alumno existente
app.put('/api/alumnos/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const { cedula, nombre, codigo_carrera, descripcion_carrera } = req.body;

        if (!cedula || !nombre || !codigo_carrera) {
            return res.status(400).json({ success: false, message: 'Faltan campos obligatorios.' });
        }

        const connection = db.promise();

        // Verificar si la cédula ya pertenece a otro registro diferente
        const [existing] = await connection.query('SELECT id FROM alumno WHERE cedula = ? AND id != ?', [cedula, id]);
        if (existing.length > 0) {
            return res.json({ success: false, message: 'La cédula ya está asignada a otro alumno.' });
        }

        const query = 'UPDATE alumno SET cedula = ?, nombre = ?, codigo_carrera = ?, descripcion_carrera = ? WHERE id = ?';
        const [result] = await connection.query(query, [cedula, nombre, codigo_carrera, descripcion_carrera || '', id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Alumno no encontrado.' });
        }

        res.json({ success: true, message: 'Alumno actualizado correctamente.' });
    } catch (err) {
        console.error("Error al actualizar alumno:", err);
        res.status(500).json({ success: false, message: 'Error interno del servidor al actualizar alumno.' });
    }
});

// 4. Eliminar un alumno
app.delete('/api/alumnos/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const connection = db.promise();

        // Opcional: puedes validar aquí si el alumno tiene registros dependientes en otras tablas antes de borrar
        const [result] = await connection.query('DELETE FROM alumno WHERE id = ?', [id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Alumno no encontrado.' });
        }

        res.json({ success: true, message: 'Alumno eliminado correctamente.' });
    } catch (err) {
        console.error("Error al eliminar alumno:", err);
        // Manejo de error si hay restricciones de llave foránea (registros asociados)
        if (err.code === 'ER_ROW_IS_REFERENCED_2' || err.errno === 1451) {
            return res.json({
                success: false,
                errorCode: 'REGISTROS_ASOCIADOS',
                message: 'El alumno tiene registros asociados.'
            });
        }
        res.status(500).json({ success: false, message: 'Error interno del servidor al eliminar alumno.' });
    }
});

*/

// ==========================================
// MÓDULO DE ALUMNOS (Tabla física: alumno)
// ==========================================

// Ruta para servir la vista de alumnos
app.get('/alumno', (req, res) => {
    res.sendFile(__dirname + '/views/alumno.html'); // Ajusta la ruta según donde tengas guardado tu archivo HTML
});



// 1. Obtener todos los alumnos registrados
app.get('/api/alumnos', async(req, res) => {
    try {
        const connection = db.promise();
        const [rows] = await connection.query('SELECT * FROM alumno ORDER BY cedula ASC');
        res.json({ success: true, data: rows });
    } catch (err) {
        console.error("Error al obtener alumnos:", err);
        res.status(500).json({ success: false, message: 'Error interno del servidor al obtener alumnos.' });
    }
});

// 2. Registrar un nuevo alumno
app.post('/api/alumnos', async(req, res) => {
    try {
        const { cedula, nombre, codigo_carrera, descripcion_carrera } = req.body;

        if (!cedula || !nombre || !codigo_carrera) {
            return res.status(400).json({ success: false, message: 'Faltan campos obligatorios.' });
        }

        const connection = db.promise();

        // Verificar si la cédula ya existe en la tabla alumno
        const [existing] = await connection.query('SELECT id FROM alumno WHERE cedula = ?', [cedula]);
        if (existing.length > 0) {
            return res.json({ success: false, message: 'La cédula ya se encuentra registrada.' });
        }

        const query = 'INSERT INTO alumno (cedula, nombre, codigo_carrera, descripcion_carrera) VALUES (?, ?, ?, ?)';
        const [result] = await connection.query(query, [cedula, nombre, codigo_carrera, descripcion_carrera || '']);

        res.json({ success: true, message: 'Alumno registrado correctamente.', id: result.insertId });
    } catch (err) {
        console.error("Error al registrar alumno:", err);
        res.status(500).json({ success: false, message: 'Error interno del servidor al registrar alumno.' });
    }
});

// 3. Actualizar un alumno existente
app.put('/api/alumnos/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const { cedula, nombre, codigo_carrera, descripcion_carrera } = req.body;

        if (!cedula || !nombre || !codigo_carrera) {
            return res.status(400).json({ success: false, message: 'Faltan campos obligatorios.' });
        }

        const connection = db.promise();

        // Verificar si la cédula ya pertenece a otro registro diferente
        const [existing] = await connection.query('SELECT id FROM alumno WHERE cedula = ? AND id != ?', [cedula, id]);
        if (existing.length > 0) {
            return res.json({ success: false, message: 'La cédula ya está asignada a otro alumno.' });
        }

        const query = 'UPDATE alumno SET cedula = ?, nombre = ?, codigo_carrera = ?, descripcion_carrera = ? WHERE id = ?';
        const [result] = await connection.query(query, [cedula, nombre, codigo_carrera, descripcion_carrera || '', id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Alumno no encontrado.' });
        }

        res.json({ success: true, message: 'Alumno actualizado correctamente.' });
    } catch (err) {
        console.error("Error al actualizar alumno:", err);
        res.status(500).json({ success: false, message: 'Error interno del servidor al actualizar alumno.' });
    }
});

// 4. Eliminar un alumno
app.delete('/api/alumnos/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const connection = db.promise();

        const [result] = await connection.query('DELETE FROM alumno WHERE id = ?', [id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Alumno no encontrado.' });
        }

        res.json({ success: true, message: 'Alumno eliminado correctamente.' });
    } catch (err) {
        console.error("Error al eliminar alumno:", err);
        if (err.code === 'ER_ROW_IS_REFERENCED_2' || err.errno === 1451) {
            return res.json({
                success: false,
                errorCode: 'REGISTROS_ASOCIADOS',
                message: 'El alumno tiene registros asociados.'
            });
        }
        res.status(500).json({ success: false, message: 'Error interno del servidor al eliminar alumno.' });
    }
});





// ==========================================
// API DE TAREAS
// ==========================================

app.get('/tarea', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'tarea.html'));
});

app.get('/api/tareas', (req, res) => {
    const query = 'SELECT * FROM tarea ORDER BY id ASC';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error al obtener tareas:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor' });
        }
        res.json(results);
    });
});

app.post('/api/tareas', (req, res) => {
    const { codigo, descripcion } = req.body;
    const query = 'INSERT INTO tarea (codigo, descripcion) VALUES (?, ?)';

    db.query(query, [codigo, descripcion], (err, result) => {
        if (err) {
            console.error('Error al crear tarea:', err);
            return res.status(500).json({ success: false, message: 'Error al registrar la tarea' });
        }
        res.json({ success: true, message: 'Tarea creada con éxito', id: result.insertId });
    });
});

app.put('/api/tareas/:id', (req, res) => {
    const { id } = req.params;
    const { codigo, descripcion } = req.body;
    const query = 'UPDATE tarea SET codigo = ?, descripcion = ? WHERE id = ?';

    db.query(query, [codigo, descripcion, id], (err, result) => {
        if (err) {
            console.error('Error al actualizar tarea:', err);
            return res.status(500).json({ success: false, message: 'Error al actualizar la tarea' });
        }
        res.json({ success: true, message: 'Tarea actualizada con éxito' });
    });
});

app.delete('/api/tareas/:id', (req, res) => {
    const { id } = req.params;
    const query = 'DELETE FROM tarea WHERE id = ?';

    db.query(query, [id], (err, result) => {
        if (err) {
            console.error('Error al eliminar tarea:', err);
            return res.status(500).json({ success: false, message: 'Error al eliminar la tarea' });
        }
        res.json({ success: true, message: 'Tarea eliminada con éxito' });
    });
});


// ==========================================
// RUTAS PARA EL MÓDULO DE ASESORÍAS
// ==========================================

app.get('/asesoria', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'asesoria.html'));
});

app.get('/api/control_asesoria', (req, res) => {
    const query = 'SELECT * FROM control_asesoria ORDER BY id DESC';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error al obtener asesorías:', err);
            return res.status(500).json({ success: false, error: err.message });
        }
        res.json({ success: true, data: results });
    });
});
app.post('/api/control_asesoria', (req, res) => {
    const {
        cedula_alumno,
        nombre_alumno,
        codigo_carrera,
        tipo_asesoria,
        codigo_materia,
        semestre, // 👈 Capturar semestre
        cedula_asesor,
        nombre_asesor
    } = req.body;

    const checkQuery = `
        SELECT id FROM control_asesoria 
        WHERE cedula_alumno = ? 
        AND nombre_alumno = ?
        AND codigo_materia = ? 
        AND tipo_asesoria = ?
        AND semestre = ?
        AND DATE(fecha_hora) = CURDATE()
    `;

    db.query(checkQuery, [cedula_alumno, nombre_alumno, codigo_materia, tipo_asesoria, semestre], (err, results) => {
        if (err) {
            console.error('Error al verificar duplicado:', err);
            return res.status(500).json({ success: false, message: 'Error interno del servidor' });
        }

        if (results.length > 0) {
            return res.status(200).json({
                success: false,
                error_code: 'DUPLICATED',
                message: 'Ya existe una asesoría registrada para este alumno en esta materia y semestre hoy.'
            });
        }

        const insertQuery = `
            INSERT INTO control_asesoria 
            (cedula_alumno, nombre_alumno, codigo_carrera, tipo_asesoria, codigo_materia, semestre, cedula_asesor, nombre_asesor, fecha_hora) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())
        `;

        db.query(insertQuery, [
            cedula_alumno,
            nombre_alumno,
            codigo_carrera,
            tipo_asesoria,
            codigo_materia,
            semestre, // 👈 Incluir en los valores
            cedula_asesor,
            nombre_asesor
        ], (err, result) => {
            if (err) {
                console.error('Error al guardar asesoría:', err);
                return res.status(500).json({ success: false, message: err.message });
            }
            res.json({ success: true, id: result.insertId });
        });
    });
});


app.put('/api/control_asesoria/:id', (req, res) => {
    const id = req.params.id;
    const {
        cedula_alumno,
        nombre_alumno,
        codigo_carrera,
        tipo_asesoria,
        codigo_materia,
        semestre // 👈 Capturar semestre
    } = req.body;

    const updateQuery = `
        UPDATE control_asesoria 
        SET cedula_alumno = ?, nombre_alumno = ?, codigo_carrera = ?, tipo_asesoria = ?, codigo_materia = ?, semestre = ?
        WHERE id = ?
    `;

    db.query(updateQuery, [
        cedula_alumno,
        nombre_alumno,
        codigo_carrera,
        tipo_asesoria,
        codigo_materia,
        semestre, // 👈 Incluir en los valores
        id
    ], (err, result) => {
        if (err) {
            console.error('Error al actualizar asesoría:', err);
            return res.status(500).json({ success: false, message: err.message });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Registro de asesoría no encontrado.' });
        }

        res.json({ success: true, message: 'Asesoría actualizada correctamente.' });
    });
});





app.delete('/api/control_asesoria/:id', (req, res) => {
    const id = req.params.id;
    const deleteQuery = 'DELETE FROM control_asesoria WHERE id = ?';

    db.query(deleteQuery, [id], (err, result) => {
        if (err) {
            console.error('Error al eliminar asesoría:', err);
            return res.status(500).json({ success: false, message: err.message });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Registro de asesoría no encontrado.' });
        }

        res.json({ success: true, message: 'Asesoría eliminada correctamente.' });
    });
});


app.get('/api/control_correcciones', async(req, res) => {
    try {
        const [rows] = await db.promise().query(`
            SELECT 
                cc.id,
                cc.cedula_alumno,
                cc.nombre_alumno,
                cc.codigo_carrera,
                cc.codigo_materia,
                cc.cedula_asesor,
                cc.nombre_asesor,
                cc.fecha,
                cc.semestre, -- 👈 Asegúrate de incluir esto aquí
                MAX(a.descripcion_carrera) AS descripcion_carrera,
                COALESCE(t.codigo, cc.tipo_correccion, '') AS tipo_correccion,
                COALESCE(t.descripcion, 'Sin clasificar') AS descripcion_tarea
            FROM control_correcciones cc
            LEFT JOIN alumno a ON TRIM(cc.codigo_carrera) COLLATE utf8mb4_general_ci = TRIM(a.codigo_carrera) COLLATE utf8mb4_general_ci
            LEFT JOIN tarea t ON TRIM(cc.tipo_correccion) COLLATE utf8mb4_general_ci = TRIM(t.codigo) COLLATE utf8mb4_general_ci 
                              OR TRIM(cc.tipo_correccion) COLLATE utf8mb4_general_ci = CAST(t.id AS CHAR) COLLATE utf8mb4_general_ci
            GROUP BY cc.id
            ORDER BY cc.fecha DESC
        `);
        res.json({ success: true, data: rows });
    } catch (err) {
        console.error('Error al obtener control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al consultar los registros' });
    }
});
app.post('/api/control_correcciones', async(req, res) => {
    try {
        const {
            cedula_alumno,
            nombre_alumno,
            codigo_carrera,
            codigo_materia,
            tipo_correccion,
            semestre, // 👈 Capturar el semestre enviado desde el formulario
            cedula_asesor,
            nombre_asesor,
            fecha
        } = req.body;

        if (!cedula_alumno || !codigo_materia || !tipo_correccion || !semestre || !cedula_asesor) {
            return res.status(400).json({
                success: false,
                message: 'Faltan campos obligatorios por completar (incluyendo el semestre).'
            });
        }

        const fechaRegistro = fecha ? new Date(fecha) : new Date();

        const query = `
            INSERT INTO control_correcciones 
            (cedula_alumno, nombre_alumno, codigo_carrera, codigo_materia, tipo_correccion, semestre, cedula_asesor, nombre_asesor, fecha) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        `;

        await db.promise().query(query, [
            cedula_alumno,
            nombre_alumno,
            codigo_carrera,
            codigo_materia,
            tipo_correccion,
            semestre, // 👈 Incluir el semestre aquí
            cedula_asesor,
            nombre_asesor,
            fechaRegistro
        ]);

        res.json({ success: true, message: 'Corrección registrada exitosamente' });
    } catch (err) {
        console.error('Error al insertar en control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al guardar la corrección' });
    }
});







app.get('/api/control_correcciones', async(req, res) => {
    try {
        const [rows] = await db.promise().query(`
            SELECT 
                cc.id,
                cc.cedula_alumno,
                cc.nombre_alumno,
                cc.codigo_carrera,
                cc.codigo_materia,
                cc.cedula_asesor,
                cc.nombre_asesor,
                cc.fecha,
                cc.semestre, -- 👈 Asegúrate de que esta línea esté presente
                MAX(a.descripcion_carrera) AS descripcion_carrera,
                COALESCE(t.codigo, cc.tipo_correccion, '') AS tipo_correccion,
                COALESCE(t.descripcion, 'Sin clasificar') AS descripcion_tarea
            FROM control_correcciones cc
            LEFT JOIN alumno a ON TRIM(cc.codigo_carrera) COLLATE utf8mb4_general_ci = TRIM(a.codigo_carrera) COLLATE utf8mb4_general_ci
            LEFT JOIN tarea t ON TRIM(cc.tipo_correccion) COLLATE utf8mb4_general_ci = TRIM(t.codigo) COLLATE utf8mb4_general_ci 
                              OR TRIM(cc.tipo_correccion) COLLATE utf8mb4_general_ci = CAST(t.id AS CHAR) COLLATE utf8mb4_general_ci
            GROUP BY cc.id
            ORDER BY cc.fecha DESC
        `);
        res.json({ success: true, data: rows });
    } catch (err) {
        console.error('Error al obtener control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al consultar los registros' });
    }
});


// ==========================================
// API PARA EL REPORTE DE CONTROL DE ASESORÍAS
// ==========================================

app.get('/reporasesoria', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'reporasesoria.html'));
});

app.get('/api/controlasesoria', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado. Inicie sesión.' });
    }

    const cedulaAsesorSesion = req.session.usuario.cedula;
    let { fecha_desde, fecha_hasta } = req.query;

    let query = 'SELECT id, cedula_alumno,nombre_alumno, codigo_carrera, tipo_asesoria, codigo_materia, fecha_hora FROM control_asesoria WHERE cedula_asesor = ?';
    let params = [cedulaAsesorSesion];

    if (fecha_desde && fecha_hasta) {
        query += ' AND DATE(fecha_hora) BETWEEN ? AND ?';
        params.push(fecha_desde, fecha_hasta);
    }

    query += ' ORDER BY id ASC';

    db.query(query, params, (err, results) => {
        if (err) {
            console.error('Error al obtener datos de control_asesoria:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor al consultar control_asesoria' });
        }
        res.json({ success: true, data: results });
    });
});

// ==========================================
// API PARA EL REPORTE DE CONTROL DE CORRECCIONES
// ==========================================

app.get('/reporcorrecciones', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'reporcorrecciones.html'));
});

app.get('/api/reporcorrecciones', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado. Inicie sesión.' });
    }

    const cedulaAsesorSesion = req.session.usuario.cedula;
    const { fecha_desde, fecha_hasta } = req.query;

    let query = `
        SELECT id, cedula_alumno, nombre_alumno, codigo_carrera, codigo_materia, tipo_correccion, fecha 
        FROM control_correcciones 
        WHERE cedula_asesor = ?
    `;
    let params = [cedulaAsesorSesion];

    if (fecha_desde && fecha_hasta && fecha_desde.trim() !== '' && fecha_hasta.trim() !== '') {
        query += ` AND DATE(fecha) BETWEEN ? AND ?`;
        params.push(fecha_desde, fecha_hasta);
    }

    query += ` ORDER BY id ASC`;

    db.query(query, params, (err, results) => {
        if (err) {
            console.error('Error al obtener datos de control_correcciones:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor al consultar control_correcciones' });
        }
        res.json({ success: true, data: results });
    });
});


app.put('/api/control_correcciones/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const {
            cedula_alumno,
            nombre_alumno,
            codigo_carrera,
            codigo_materia,
            tipo_correccion,
            semestre, // 👈 Capturar el semestre al editar
            cedula_asesor,
            nombre_asesor,
            fecha
        } = req.body;

        const query = `
            UPDATE control_correcciones 
            SET cedula_alumno = ?, nombre_alumno = ?, codigo_carrera = ?, codigo_materia = ?, tipo_correccion = ?, semestre = ?, cedula_asesor = ?, nombre_asesor = ?, fecha = ? 
            WHERE id = ?
        `;

        await db.promise().execute(query, [
            cedula_alumno,
            nombre_alumno,
            codigo_carrera,
            codigo_materia,
            tipo_correccion,
            semestre, // 👈 Incluir el semestre en la actualización
            cedula_asesor,
            nombre_asesor,
            fecha,
            id
        ]);

        res.json({ success: true, message: 'Corrección actualizada con éxito' });
    } catch (error) {
        console.error("Error al actualizar la corrección:", error);
        res.status(500).json({ success: false, message: error.message });
    }
});


// Ruta DELETE para eliminar un registro de corrección por su ID
app.delete('/api/control_correcciones/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const query = `DELETE FROM control_correcciones WHERE id = ?`;
        await db.promise().execute(query, [id]);

        res.json({ success: true, message: 'Registro eliminado correctamente' });
    } catch (error) {
        console.error("Error al eliminar la corrección:", error);
        res.status(500).json({ success: false, message: error.message });
    }
});

// ==========================================
// RUTAS PARA EL MÓDULO DE CALIFICACIONES Y REGISTRO DINÁMICO
// ==========================================

app.get('/calificaciones', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'calificaciones.html'));
});

// 2. REGISTRAR ALUMNO EN LA TABLA DINÁMICA
app.post('/api/calificaciones-alumnos', async(req, res) => {
    const { calificacion_codigo, id, nombre_alumno, cedula_alumno, semestre, objetivos } = req.body;
    const cedulaAsesor = req.session && req.session.usuario ? req.session.usuario.cedula : null;

    if (!cedulaAsesor) {
        return res.status(401).json({ success: false, message: 'No se pudo identificar la cédula del asesor en la sesión.' });
    }

    if (!calificacion_codigo || !cedula_alumno || !semestre) {
        return res.status(400).json({ success: false, message: 'Faltan datos obligatorios para registrar la calificación.' });
    }

    try {
        const codigoClean = calificacion_codigo.replace(/[^a-zA-Z0-9_]/g, '_');
        const cedulaClean = String(cedulaAsesor).replace(/[^a-zA-Z0-9_]/g, '_');
        const semestreClean = semestre.replace(/[^a-zA-Z0-9_]/g, '_');
        const nombreTabla = `calificaciones_${codigoClean}_${cedulaClean}_${semestreClean}`;

        let sumaNotaFinal = 0;
        let columnasDinamicas = [];
        let valoresDinamicos = [];

        if (objetivos) {
            if (Array.isArray(objetivos)) {
                objetivos.forEach((val, index) => {
                    const nombreObj = `obj${index + 1}`;
                    columnasDinamicas.push(nombreObj);
                    let valNumerico = parseFloat(val) || 0;
                    valoresDinamicos.push(valNumerico);
                    sumaNotaFinal += valNumerico;
                });
            } else if (typeof objetivos === 'object') {
                for (const [key, val] of Object.entries(objetivos)) {
                    columnasDinamicas.push(key);
                    let valNumerico = parseFloat(val) || 0;
                    valoresDinamicos.push(valNumerico);
                    sumaNotaFinal += valNumerico;
                }
            }
        }

        let sqlCols = ['id', 'nombre_alumno', 'cedula_alumno', 'cedula_asesor', 'semestre'];
        let sqlValues = [id, nombre_alumno, cedula_alumno, cedulaAsesor, semestre];

        columnasDinamicas.forEach((col, index) => {
            sqlCols.push(col);
            sqlValues.push(valoresDinamicos[index]);
        });

        sqlCols.push('nota_final');
        sqlValues.push(sumaNotaFinal);

        const placeholders = sqlCols.map(() => '?').join(', ');
        const queryFinal = `INSERT INTO \`${nombreTabla}\` (${sqlCols.join(', ')}) VALUES (${placeholders})`;

        await db.promise().query(queryFinal, sqlValues);

        res.json({
            success: true,
            message: `Calificaciones guardadas exitosamente.`,
            nota_final: sumaNotaFinal
        });

    } catch (err) {
        console.error(`Error al registrar calificaciones dinámicas:`, err);
        if (err.code === 'ER_DUP_ENTRY') {
            return res.status(400).json({ success: false, message: 'El alumno ya se encuentra registrado en esta asignatura.' });
        }
        if (err.code === 'ER_NO_SUCH_TABLE') {
            return res.status(400).json({ success: false, message: `La tabla de calificaciones para este semestre no existe.` });
        }
        res.status(500).json({ success: false, message: err.message });
    }
});






// 3. ACTUALIZAR OBJETIVOS DEL ALUMNO
app.put('/api/calificaciones-alumnos/objetivos', async(req, res) => {
    const { calificacion_codigo, cedula_alumno, semestre, objetivos, nota_final, nota_final_letra } = req.body;
    const cedulaAsesor = req.session && req.session.usuario ? req.session.usuario.cedula : null;

    if (!cedulaAsesor || !calificacion_codigo || !cedula_alumno || !semestre) {
        return res.status(400).json({ success: false, message: 'Faltan datos obligatorios para actualizar.' });
    }

    try {
        const connection = db.promise();
        const codigoClean = calificacion_codigo.replace(/[^a-zA-Z0-9_]/g, '_');
        const cedulaClean = String(cedulaAsesor).replace(/[^a-zA-Z0-9_]/g, '_');
        const semestreClean = semestre.replace(/[^a-zA-Z0-9_]/g, '_');
        const nombreTabla = `calificaciones_${codigoClean}_${cedulaClean}_${semestreClean}`;

        const [materiaRows] = await connection.query(
            'SELECT numobj FROM materia WHERE codigo = ?', [calificacion_codigo]
        );

        if (materiaRows.length === 0) {
            return res.status(404).json({ success: false, message: 'No se encontró la materia.' });
        }

        const totalObjetivos = parseInt(materiaRows[0].numobj) || 0;
        let camposSet = [];
        let valoresSet = [];

        for (let i = 1; i <= totalObjetivos; i++) {
            const nombreObj = `obj${i}`;
            camposSet.push(`\`${nombreObj}\` = ?`);

            let valNumerico = 0;
            if (objetivos) {
                if (Array.isArray(objetivos) && objetivos[i - 1] !== undefined) {
                    valNumerico = parseFloat(objetivos[i - 1]) || 0;
                } else if (typeof objetivos === 'object' && objetivos[nombreObj] !== undefined) {
                    valNumerico = parseFloat(objetivos[nombreObj]) || 0;
                }
            }
            valoresSet.push(valNumerico);
        }

        camposSet.push('`nota_final` = ?');
        valoresSet.push(parseFloat(nota_final) || 0);

        camposSet.push('`nota_final_letra` = ?');
        valoresSet.push(nota_final_letra || '');

        valoresSet.push(cedula_alumno);

        const queryUpdate = `UPDATE \`${nombreTabla}\` SET ${camposSet.join(', ')} WHERE cedula_alumno = ?`;
        const [resultado] = await connection.query(queryUpdate, valoresSet);

        if (resultado.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'No se encontró el registro del alumno.' });
        }

        res.json({ success: true, message: 'Calificaciones actualizadas correctamente.' });

    } catch (err) {
        console.error('Error al actualizar los objetivos:', err);
        res.status(500).json({ success: false, message: err.message });
    }
});

/*Sesión de usuario*/



app.get('/api/materias-objetivos/:codigoMateria', async(req, res) => {
    const { codigoMateria } = req.params;

    try {
        const connection = db.promise();
        const [materiaRows] = await connection.query(
            'SELECT id, codigo, descripcion, numobj, minaprueba FROM materia WHERE codigo = ?', [codigoMateria]
        );

        if (materiaRows.length === 0) {
            return res.status(404).json({ success: false, message: 'Materia no encontrada en la base de datos.' });
        }

        const materia = materiaRows[0];
        res.json({
            success: true,
            numobj: parseInt(materia.numobj) || 0,
            descripcion: materia.descripcion,
            minaprueba: materia.minaprueba
        });

    } catch (err) {
        console.error('Error al obtener los objetivos de la materia:', err);
        res.status(500).json({ success: false, message: err.message });
    }
});

app.delete('/api/calificaciones-alumnos/:codigoMateria/:cedulaAlumno', async(req, res) => {
    const { codigoMateria, cedulaAlumno } = req.params;
    const semestreSeleccionado = req.query.semestre;
    const cedulaAsesor = req.session && req.session.usuario ? (req.session.usuario.cedula || req.session.usuario.id) : null;

    if (!codigoMateria || !cedulaAlumno || !semestreSeleccionado || !cedulaAsesor) {
        return res.status(400).json({ success: false, message: 'Faltan parámetros obligatorios para la eliminación.' });
    }

    try {
        const connection = db.promise();
        const codigoClean = codigoMateria.replace(/[^a-zA-Z0-9_]/g, '_');
        const cedulaClean = String(cedulaAsesor).replace(/[^a-zA-Z0-9_]/g, '_');
        const semestreClean = semestreSeleccionado.replace(/[^a-zA-Z0-9_]/g, '_');

        // Apunta estrictamente a la tabla dinámica del asesor y semestre actual
        const nombreTabla = `calificaciones_${codigoClean}_${cedulaClean}_${semestreClean}`;

        const queryDelete = `DELETE FROM \`${nombreTabla}\` WHERE cedula_alumno = ?`;
        const [resultado] = await connection.query(queryDelete, [cedulaAlumno]);

        if (resultado.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'No se encontró el registro del alumno en esta tabla.' });
        }

        res.json({ success: true, message: 'Alumno eliminado de la materia correctamente.' });

    } catch (err) {
        console.error('Error al eliminar alumno:', err);
        res.status(500).json({ success: false, message: err.message });
    }
});


app.get('/api/objetivos-materia/:codigo', async(req, res) => {
    try {
        const { codigo } = req.params;
        const query = 'SELECT id, materia_codigo, nro_objetivo, peso FROM objetivo_materia WHERE materia_codigo = ? ORDER BY nro_objetivo ASC';
        const [rows] = await db.promise().query(query, [codigo]);
        res.json({ success: true, data: rows });
    } catch (error) {
        console.error("Error en endpoint de objetivos:", error);
        res.status(500).json({ success: false, message: error.message });
    }
});

app.post('/api/calcular-definitiva', async(req, res) => {
    try {
        const { codigo_materia, peso_acumulado } = req.body;
        const query = 'SELECT calificacion_definitiva FROM calificaciones WHERE cod_materia = ? AND peso_acumulado = ? LIMIT 1';
        const [rows] = await db.promise().query(query, [codigo_materia, peso_acumulado]);

        if (rows.length > 0) {
            res.json({ success: true, calificacion_definitiva: rows[0].calificacion_definitiva });
        } else {
            res.json({ success: true, calificacion_definitiva: 0 });
        }
    } catch (error) {
        console.error("Error al buscar la calificación definitiva:", error);
        res.status(500).json({ success: false, message: error.message });
    }
});

app.get('/reporcalificaciones', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'reporcalificaciones.html'));
});




// 1. OBTENER CALIFICACIONES DE LA TABLA DINÁMICA DEL ASESOR Y SEMESTRE
app.get('/api/calificaciones/:codigoMateria', (req, res) => {
    const { codigoMateria } = req.params;
    const semestreSeleccionado = req.query.semestre;

    if (!semestreSeleccionado) {
        return res.json({ success: false, message: "Debe seleccionar un semestre." });
    }

    if (!req.session || !req.session.usuario || !req.session.usuario.cedula) {
        return res.status(401).json({ success: false, message: "No autorizado o sesión expirada." });
    }

    const cedulaAsesor = req.session.usuario.cedula;
    const codigoClean = codigoMateria.replace(/[^a-zA-Z0-9_]/g, '_');
    const cedulaClean = String(cedulaAsesor).replace(/[^a-zA-Z0-9_]/g, '_');
    const semestreClean = semestreSeleccionado.replace(/[^a-zA-Z0-9_]/g, '_');

    const nombreTabla = `calificaciones_${codigoClean}_${cedulaClean}_${semestreClean}`;
    const query = `SELECT * FROM \`${nombreTabla}\``;

    db.query(query, (err, results) => {
        if (err) {
            if (err.code === 'ER_NO_SUCH_TABLE') {
                return res.json({ success: true, data: [] });
            }
            return res.status(500).json({ success: false, message: err.message });
        }
        res.json({ success: true, data: results });
    });
});


// ==========================================
// RUTA Y CRUD COMPLETO PARA EL MÓDULO TIPO DE ASESORÍA
// ==========================================

app.get('/tipo_asesoria', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'tipo_asesoria.html'));
});

app.get('/api/tipo_asesoria', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const sql = 'SELECT * FROM tipoasesoria ORDER BY id DESC';
    db.query(sql, (err, results) => {
        if (err) {
            console.error('❌ Error al consultar tipoasesoria:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor' });
        }
        res.json({ success: true, data: results });
    });
});

app.post('/api/tipo_asesoria', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { codigo_ase, descripcion_asesoria } = req.body;
    if (!codigo_ase || !descripcion_asesoria) {
        return res.status(400).json({ success: false, message: 'Faltan datos obligatorios' });
    }

    const sql = 'INSERT INTO tipoasesoria (codigo_ase, descripcion_asesoria) VALUES (?, ?)';
    db.query(sql, [codigo_ase, descripcion_asesoria], (err, result) => {
        if (err) {
            console.error('❌ Error al insertar en tipoasesoria:', err);
            return res.status(500).json({ success: false, message: 'Error al guardar el registro' });
        }
        res.json({ success: true, message: 'Tipo de asesoría guardado exitosamente', id: result.insertId });
    });
});

app.put('/api/tipo_asesoria/:id', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { id } = req.params;
    const { codigo_ase, descripcion_asesoria } = req.body;
    const sql = 'UPDATE tipoasesoria SET codigo_ase = ?, descripcion_asesoria = ? WHERE id = ?';
    db.query(sql, [codigo_ase, descripcion_asesoria, id], (err, result) => {
        if (err) {
            console.error('❌ Error al actualizar tipoasesoria:', err);
            return res.status(500).json({ success: false, message: 'Error al actualizar' });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Tipo de asesoría no encontrado' });
        }
        res.json({ success: true, message: 'Tipo de asesoría actualizado exitosamente' });
    });
});

app.delete('/api/tipo_asesoria/:id', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { id } = req.params;
    const sql = 'DELETE FROM tipoasesoria WHERE id = ?';
    db.query(sql, [id], (err, result) => {
        if (err) {
            console.error('❌ Error al eliminar tipoasesoria:', err);
            return res.status(500).json({ success: false, message: 'Error al eliminar' });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Tipo de asesoría no encontrado' });
        }
        res.json({ success: true, message: 'Tipo de asesoría eliminado exitosamente' });
    });
});

// ==========================================
// RUTA Y CRUD COMPLETO PARA EL MÓDULO CORRECCIONES
// ==========================================

app.get('/correcciones', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'correcciones.html'));
});

app.get('/correcciones.html', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'correcciones.html'));
});

app.get('/api/correcciones', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    try {
        const [rows] = await db.promise().query('SELECT * FROM correcciones ORDER BY id DESC');
        res.json({ success: true, data: rows });
    } catch (err) {
        console.error('❌ Error al obtener correcciones:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al consultar correcciones.' });
    }
});

app.post('/api/correcciones', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { codigo, descripcion } = req.body;
    if (!codigo || !descripcion) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios.' });
    }

    try {
        const sql = 'INSERT INTO correcciones (codigo, descripcion) VALUES (?, ?)';
        const [result] = await db.promise().query(sql, [codigo, descripcion]);
        res.json({ success: true, message: 'Corrección registrada exitosamente.', id: result.insertId });
    } catch (err) {
        console.error('❌ Error al registrar corrección:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor: ' + err.message });
    }
});

app.put('/api/correcciones/:id', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { id } = req.params;
    const { codigo, descripcion } = req.body;

    try {
        const sql = 'UPDATE correcciones SET codigo = ?, descripcion = ? WHERE id = ?';
        const [result] = await db.promise().query(sql, [codigo, descripcion, id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Corrección no encontrada.' });
        }
        res.json({ success: true, message: 'Corrección actualizada correctamente.' });
    } catch (err) {
        console.error('❌ Error al actualizar corrección:', err);
        res.status(500).json({ success: false, message: 'Error al actualizar: ' + err.message });
    }
});

app.delete('/api/correcciones/:id', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { id } = req.params;

    try {
        const [result] = await db.promise().query('DELETE FROM correcciones WHERE id = ?', [id]);
        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Corrección no encontrada.' });
        }
        res.json({ success: true, message: 'Corrección eliminada correctamente.' });
    } catch (err) {
        console.error('❌ Error al eliminar corrección:', err);
        res.status(500).json({ success: false, message: 'Error al eliminar: ' + err.message });
    }
});

// Ruta para servir la vista del reporte consolidado
app.get('/reporconsolidado', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'reporconsolidado.html'));
});


app.use('/api/db', dbAdminRoutes);


// --- Ruta de prueba ---
app.get('/', (req, res) => {
    res.send('Servidor API Asesores UNA funcionando.');
});

// ==========================================
// RUTA DE VISTA PARA GESTIÓN DE MATERIAS
// ==========================================



app.get('/control_materia', (req, res) => {
    // Valida si el usuario tiene sesión activa usando 'usuario'
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }

    res.sendFile(path.join(__dirname, 'views', 'control_materia.html'));
});

// Ruta para la vista HTML de control de materias
app.get('/control_materia', (req, res) => {
    // Valida si el usuario tiene sesión activa usando 'usuario'
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'control_materia.html'));
});


// ==========================================
// ENDPOINTS API PARA LA TABLA 'materia_una' (MYSQL - CALLBACKS)
// ==========================================

// 1. OBTENER TODAS LAS MATERIAS
/*
app.get('/api/materiauna', (req, res) => {
    //const query = 'SELECT id, codigo, descripcion FROM materia_una';
    const query = 'SELECT id, codigo, descripcion FROM materia_una ORDER BY codigo ASC';

    pool.query(query, (err, results) => {
        if (err) {
            console.error("❌ Error al obtener materias de MySQL:", err);
            return res.status(500).json({ success: false, message: "Error en el servidor" });
        }
        res.json({ success: true, data: results });
    });
});
*/

// 1. OBTENER TODAS LAS MATERIAS (Incluyendo la cédula del asesor)
app.get('/api/materiauna', (req, res) => {
    const query = 'SELECT id, codigo, descripcion, cedula_asesor FROM materia_una ORDER BY codigo ASC';

    pool.query(query, (err, results) => {
        if (err) {
            console.error("❌ Error al obtener materias de MySQL:", err);
            return res.status(500).json({ success: false, message: "Error en el servidor" });
        }
        res.json({ success: true, data: results });
    });
});

/*

// 2. REGISTRAR NUEVA MATERIA (Con validación de código duplicado)
app.post('/api/materiauna', (req, res) => {
    const { codigo, descripcion } = req.body;

    if (!codigo || !descripcion) {
        return res.status(400).json({ success: false, message: 'El código y la descripción son obligatorios.' });
    }

    // Verificar si el código ya existe
    pool.query('SELECT id FROM materia_una WHERE codigo = ?', [codigo], (err, existing) => {
        if (err) {
            console.error('❌ Error al verificar código duplicado:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor' });
        }

        if (existing.length > 0) {
            return res.status(400).json({
                success: false,
                message: `El código de materia "${codigo}" ya se encuentra registrado en la base de datos.`
            });
        }

        // Insertar la nueva materia
        pool.query('INSERT INTO materia_una (codigo, descripcion) VALUES (?, ?)', [codigo, descripcion], (err, result) => {
            if (err) {
                console.error('❌ Error al registrar materia en MySQL:', err);
                return res.status(500).json({ success: false, message: 'Error interno al registrar la materia.' });
            }

            res.json({
                success: true,
                message: 'Materia registrada exitosamente',
                insertId: result.insertId
            });
        });
    });
});


// 3. ACTUALIZAR MATERIA EXISTENTE
app.put('/api/materiauna/:id', (req, res) => {
    const { id } = req.params;
    const { codigo, descripcion } = req.body;

    if (!codigo || !descripcion) {
        return res.status(400).json({ success: false, message: 'El código y la descripción son obligatorios.' });
    }

    // Verificar si otro registro diferente ya está usando el código
    pool.query('SELECT id FROM materia_una WHERE codigo = ? AND id != ?', [codigo, id], (err, existing) => {
        if (err) {
            console.error('❌ Error al verificar código duplicado en actualización:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor' });
        }

        if (existing.length > 0) {
            return res.status(400).json({
                success: false,
                message: `El código "${codigo}" ya pertenece a otra materia registrada.`
            });
        }

        // Ejecutar actualización
        pool.query('UPDATE materia_una SET codigo = ?, descripcion = ? WHERE id = ?', [codigo, descripcion, id], (err, result) => {
            if (err) {
                // <-- AQUÍ ESTÁ EL CAMBIO CLAVE PARA VER EL ERROR EN CONSOLA -->
                console.error('❌ ERROR REAL DE MYSQL AL ACTUALIZAR:', err);
                return res.status(500).json({ success: false, message: 'Error en BD: ' + err.message });
            }

            if (result.affectedRows === 0) {
                return res.status(404).json({ success: false, message: 'No se encontró la materia a actualizar.' });
            }

            res.json({ success: true, message: 'Materia actualizada exitosamente' });
        });
    });
});
*/

// REGISTRAR NUEVA MATERIA (POST)
app.post('/api/materiauna', (req, res) => {
    const { codigo, descripcion, cedula_asesor } = req.body;
    const query = 'INSERT INTO materia_una (codigo, descripcion, cedula_asesor) VALUES (?, ?, ?)';

    pool.query(query, [codigo, descripcion, cedula_asesor || null], (err, result) => {
        if (err) {
            console.error("❌ Error al insertar materia:", err);
            return res.status(500).json({ success: false, message: "Error en el servidor al registrar la materia." });
        }
        res.json({ success: true, message: "Materia registrada exitosamente", id: result.insertId });
    });
});

// ACTUALIZAR MATERIA (PUT)
app.put('/api/materiauna/:id', (req, res) => {
    const { id } = req.params;
    const { codigo, descripcion, cedula_asesor } = req.body;
    const query = 'UPDATE materia_una SET codigo = ?, descripcion = ?, cedula_asesor = ? WHERE id = ?';

    pool.query(query, [codigo, descripcion, cedula_asesor || null, id], (err, result) => {
        if (err) {
            console.error("❌ Error al actualizar materia:", err);
            return res.status(500).json({ success: false, message: "Error en el servidor al actualizar la materia." });
        }
        res.json({ success: true, message: "Materia actualizada exitosamente" });
    });
});











// 4. ELIMINAR MATERIA
app.delete('/api/materiauna/:id', (req, res) => {
    const { id } = req.params;

    pool.query('DELETE FROM materia_una WHERE id = ?', [id], (err, result) => {
        if (err) {
            console.error('❌ Error al eliminar materia en MySQL:', err);
            return res.status(500).json({ success: false, message: 'Error interno al eliminar la materia.' });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'No se encontró la materia a eliminar.' });
        }

        res.json({ success: true, message: 'Materia eliminada exitosamente' });
    });
});




// ==========================================
// RUTA PARA SERVIR LA INTERFAZ DE ADMIN DB
// ==========================================
app.get('/admin_db', (req, res) => {
    // IMPORTANTE: Primero debes proteger esta ruta.
    // Descomenta el middleware de autenticación de admin que tengas.
    // Ejemplo: if (!req.session.usuario || req.session.usuario.rol !== 'admin') return res.redirect('/');

    // Asumiendo que admin_db.html está en la carpeta 'views'
    res.sendFile(path.join(__dirname, 'views', 'admin_db.html'));
});

// ... (más abajo deben estar las rutas de la API que ya creamos)
app.use('/api/db', dbAdminRoutes);


// Ruta para manejar el cierre de sesión
// ==========================================
// RUTA DE CIERRE DE SESIÓN (LOGOUT)
// ==========================================

app.get('/logout', (req, res) => {
    req.session.destroy((err) => {
        if (err) {
            console.error('❌ Error al destruir la sesión:', err);
        }
        // Limpiar la cookie de sesión configurada en express-session
        res.clearCookie('session_cookie_id');
        // Redirigir al login
        res.redirect('/');
    });
});

// ==========================================
// ENDPOINT: Reporte de Actividades (Definitivo)
// ==========================================
app.get('/api/reporte_actividades', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const cedulaAsesorSesion = req.session.usuario.cedula;
    let { inicio, fin } = req.query;

    if (!inicio || !fin) {
        return res.status(400).json({ success: false, message: 'Debe proporcionar una fecha de inicio y fin.' });
    }

    function normalizarFecha(fechaStr) {
        if (!fechaStr) return '';
        if (fechaStr.includes('/')) {
            const p = fechaStr.split('/');
            if (p.length === 3) {
                return `${p[2]}-${p[1]}-${p[0]}`;
            }
        }
        return fechaStr;
    }

    inicio = normalizarFecha(inicio);
    fin = normalizarFecha(fin);

    const queryAsesorias = `
        SELECT tipo_asesoria, COUNT(*) AS cantidad 
        FROM control_asesoria 
        WHERE TRIM(cedula_asesor) = TRIM(?) AND DATE(fecha_hora) BETWEEN ? AND ? 
        GROUP BY tipo_asesoria
    `;

    const queryCorrecciones = `
        SELECT tipo_correccion, COUNT(*) AS cantidad 
        FROM control_correcciones 
        WHERE TRIM(cedula_asesor) = TRIM(?) AND DATE(fecha) BETWEEN ? AND ? 
        GROUP BY tipo_correccion
    `;

    // Obtenemos TODOS los tipos de corrección históricos del asesor para fijar las columnas
    const queryTiposCorrecciones = `
        SELECT DISTINCT tipo_correccion 
        FROM control_correcciones 
        WHERE TRIM(cedula_asesor) = TRIM(?)
    `;

    const queryTiposAsesorias = `
        SELECT DISTINCT tipo_asesoria 
        FROM control_asesoria 
        WHERE TRIM(cedula_asesor) = TRIM(?) AND DATE(fecha_hora) BETWEEN ? AND ?
    `;

    db.query(queryAsesorias, [cedulaAsesorSesion, inicio, fin], (err, asesoriasResult) => {
        if (err) {
            console.error('Error asesorías:', err);
            return res.status(500).json({ success: false, message: err.message });
        }

        db.query(queryCorrecciones, [cedulaAsesorSesion, inicio, fin], (err2, correccionesResult) => {
            if (err2) {
                console.error('Error correcciones:', err2);
                return res.status(500).json({ success: false, message: err2.message });
            }

            db.query(queryTiposCorrecciones, [cedulaAsesorSesion], (errTiposCorr, tiposCorreccionesResult) => {
                if (errTiposCorr) {
                    console.error('Error tipos correcciones:', errTiposCorr);
                    return res.status(500).json({ success: false, message: errTiposCorr.message });
                }

                let dynamicCorreccionesCases = tiposCorreccionesResult.map(t => {
                    const tipo = t.tipo_correccion;
                    return `COALESCE(SUM(CASE WHEN UPPER(cc.tipo_correccion) = UPPER('${tipo}') THEN 1 ELSE 0 END), 0) AS \`${tipo}\``;
                }).join(', ');

                // Query directa optimizada con el LEFT JOIN original que sí arrojaba los totales correctos
                const queryPorAsignaturaCorrecciones = dynamicCorreccionesCases ? `
                    SELECT 
                        ac.asignatura AS codigo_materia,
                        ac.cantidad_alumno,
                        ${dynamicCorreccionesCases}
                    FROM asesor_carrera ac
                    LEFT JOIN control_correcciones cc ON TRIM(cc.codigo_materia) = TRIM(ac.asignatura) 
                         AND TRIM(cc.cedula_asesor) = TRIM(?) 
                         AND DATE(cc.fecha) BETWEEN ? AND ?
                    WHERE TRIM(ac.asesor_cedula) = TRIM(?)
                    GROUP BY ac.asignatura, ac.cantidad_alumno
                    ORDER BY ac.asignatura ASC
                ` : `
                    SELECT 
                        ac.asignatura AS codigo_materia,
                        ac.cantidad_alumno
                    FROM asesor_carrera ac
                    WHERE TRIM(ac.asesor_cedula) = TRIM(?)
                    ORDER BY ac.asignatura ASC
                `;

                const paramsPorAsignatura = dynamicCorreccionesCases ? [cedulaAsesorSesion, inicio, fin, cedulaAsesorSesion] : [cedulaAsesorSesion];

                db.query(queryPorAsignaturaCorrecciones, paramsPorAsignatura, (err3, porAsignaturaResult) => {
                    if (err3) {
                        console.error('Error por asignatura correcciones:', err3);
                        return res.status(500).json({ success: false, message: err3.message });
                    }

                    db.query(queryTiposAsesorias, [cedulaAsesorSesion, inicio, fin], (err4, tiposAsesoriasResult) => {
                        if (err4) {
                            console.error('Error tipos asesorías:', err4);
                            return res.status(500).json({ success: false, message: err4.message });
                        }

                        let dynamicCases = tiposAsesoriasResult.map(t => {
                            const tipo = t.tipo_asesoria;
                            return `SUM(CASE WHEN tipo_asesoria = '${tipo}' THEN 1 ELSE 0 END) AS \`${tipo}\``;
                        }).join(', ');

                        const queryAsesoriasPorAsignatura = dynamicCases ?
                            `SELECT codigo_materia, ${dynamicCases} FROM control_asesoria WHERE TRIM(cedula_asesor) = TRIM(?) AND DATE(fecha_hora) BETWEEN ? AND ? GROUP BY codigo_materia` :
                            `SELECT codigo_materia FROM control_asesoria WHERE TRIM(cedula_asesor) = TRIM(?) AND DATE(fecha_hora) BETWEEN ? AND ? GROUP BY codigo_materia`;

                        db.query(queryAsesoriasPorAsignatura, [cedulaAsesorSesion, inicio, fin], (err5, asesoriasPorAsignaturaResult) => {
                            if (err5) {
                                console.error('Error asesorías por asignatura:', err5);
                                return res.status(500).json({ success: false, message: err5.message });
                            }

                            res.json({
                                success: true,
                                asesorias: asesoriasResult,
                                correcciones: correccionesResult,
                                por_asignatura: porAsignaturaResult,
                                tipos_correcciones_definidos: tiposCorreccionesResult,
                                asesorias_por_asignatura: asesoriasPorAsignaturaResult,
                                tipos_asesorias_definidos: tiposAsesoriasResult
                            });
                        });
                    });
                });
            });
        });
    });
});




app.get('/api/asesorcarrera', (req, res) => {
    // Usamos DISTINCT para evitar filas idénticas repetidas a nivel de base de datos
    const query = `
        SELECT DISTINCT 
            ac.id, 
            ac.asesor_cedula, 
            ac.carrera, 
            ac.asignatura, 
            ac.cantidad_alumno, 
            ac.semestre, 
            m.descripcion AS asignatura_descripcion 
        FROM asesor_carrera ac
        LEFT JOIN materia_una m ON ac.asignatura = m.codigo
        ORDER BY ac.asignatura ASC
    `;
    db.query(query, (err, results) => {
        if (err) {
            console.error('❌ Error al obtener asesor_carrera:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor al consultar los registros.' });
        }
        res.json({ success: true, data: results });
    });
});
// 2. CREAR UN NUEVO REGISTRO EN ASESOR_CARRERA
app.post('/api/asesorcarrera', (req, res) => {
    const { asesor_cedula, carrera, asignatura, cantidad_alumno, semestre } = req.body;

    if (!asesor_cedula || !carrera || !asignatura || !cantidad_alumno || !semestre) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios por completar.' });
    }

    // Validar si la asignatura ya está registrada para el mismo semestre
    db.query('SELECT id FROM asesor_carrera WHERE asignatura = ? AND semestre = ?', [asignatura, semestre], (err, duplicado) => {
        if (err) {
            console.error('❌ Error al verificar duplicados:', err);
            return res.status(500).json({ success: false, message: 'Error interno en el servidor.' });
        }

        if (duplicado.length > 0) {
            return res.status(400).json({
                success: false,
                message: `La asignatura ya fue registrada para ese semestre.`
            });
        }

        // Verificar que la asignatura exista en materia_una
        db.query('SELECT codigo FROM materia_una WHERE codigo = ?', [asignatura], (err, materiaExiste) => {
            if (err) {
                console.error('❌ Error al verificar asignatura:', err);
                return res.status(500).json({ success: false, message: 'Error interno en el servidor.' });
            }

            if (materiaExiste.length === 0) {
                return res.status(400).json({ success: false, message: 'La asignatura seleccionada no existe en la tabla materia_una.' });
            }

            const insertQuery = `
                INSERT INTO asesor_carrera (asesor_cedula, carrera, asignatura, cantidad_alumno, semestre) 
                VALUES (?, ?, ?, ?, ?)
            `;

            db.query(insertQuery, [asesor_cedula, carrera, asignatura, cantidad_alumno, semestre], (err, result) => {
                if (err) {
                    console.error('❌ Error al guardar en asesor_carrera:', err);
                    return res.status(500).json({ success: false, message: 'Error al registrar los datos en la base de datos.' });
                }

                res.status(201).json({
                    success: true,
                    message: 'Registro guardado exitosamente.',
                    id: result.insertId
                });
            });
        });
    });
});







// 2.1. ACTUALIZAR REGISTRO EXISTENTE (PUT)
app.put('/api/asesorcarrera/:id', (req, res) => {
    const { id } = req.params;
    const { carrera, asignatura, cantidad_alumno, semestre } = req.body;

    if (!carrera || !asignatura || !cantidad_alumno || !semestre) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios.' });
    }

    db.query('SELECT id FROM asesor_carrera WHERE asignatura = ? AND semestre = ? AND id != ?', [asignatura, semestre, id], (err, duplicado) => {
        if (err) {
            console.error('❌ Error al verificar duplicado en edición:', err);
            return res.status(500).json({ success: false, message: 'Error interno en el servidor.' });
        }

        if (duplicado.length > 0) {
            return res.status(400).json({
                success: false,
                message: `La asignatura ya fue registrada para ese semestre.`
            });
        }

        const updateQuery = `
            UPDATE asesor_carrera 
            SET carrera = ?, asignatura = ?, cantidad_alumno = ?, semestre = ? 
            WHERE id = ?
        `;

        db.query(updateQuery, [carrera, asignatura, cantidad_alumno, semestre, id], (err, result) => {
            if (err) {
                console.error('❌ Error al actualizar asesor_carrera:', err);
                return res.status(500).json({ success: false, message: 'Error al actualizar los datos.' });
            }

            if (result.affectedRows === 0) {
                return res.status(404).json({ success: false, message: 'Registro no encontrado.' });
            }

            res.json({ success: true, message: 'Registro actualizado correctamente.' });
        });
    });
});

// 3. ELIMINAR UN REGISTRO
app.delete('/api/asesorcarrera/:id', (req, res) => {
    const { id } = req.params;
    db.query('DELETE FROM asesor_carrera WHERE id = ?', [id], (err, result) => {
        if (err) {
            console.error('❌ Error al eliminar:', err);
            return res.status(500).json({ success: false, message: 'Error al intentar eliminar el registro.' });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'El registro no fue encontrado.' });
        }
        res.json({ success: true, message: 'Registro eliminado correctamente.' });
    });
});

//ASESOR CARRERA

app.get('/asesor_carrera', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'asesor_carrera.html'));
});

app.post('/api/guardar_acumulado_asesorias', (req, res) => {
    console.log("📥 Datos recibidos:", req.body);

    const { periodo, cedula, TP, TSP, TEG, PROY, EGRU, ELI, PRE, VT } = req.body;

    if (!cedula || !periodo) {
        return res.status(400).json({
            success: false,
            message: 'Faltan datos obligatorios (cédula o período).'
        });
    }

    // 10 columnas exactas
    const query = `
        INSERT INTO acumuladotaase (periodo, cedula, TP, TSP, TEG, PROY, EGRU, ELI, PRE, VT)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE 
            TP = VALUES(TP),
            TSP = VALUES(TSP),
            TEG = VALUES(TEG),
            PROY = VALUES(PROY),
            EGRU = VALUES(EGRU),
            ELI = VALUES(ELI),
            PRE = VALUES(PRE),
            VT = VALUES(VT)
    `;

    // 10 valores exactos correspondientes a las 10 interrogaciones (?)
    const values = [
        periodo,
        cedula,
        TP || 0,
        TSP || 0,
        TEG || 0,
        PROY || 0,
        EGRU || 0,
        ELI || 0,
        PRE || 0,
        VT || 0
    ];

    db.query(query, values, (err, result) => {
        if (err) {
            console.error('❌ Error en MySQL:', err);
            return res.status(500).json({ success: false, message: err.message });
        }

        console.log('✅ Acumulado guardado correctamente.');
        res.json({ success: true, message: 'Guardado exitosamente.' });
    });
});



app.get('/api/obtener_acumulado_anterior', (req, res) => {
    const { cedula, periodo } = req.query; // período actual, ej: "2026-10"

    if (!cedula || !periodo) {
        return res.status(400).json({ success: false, message: 'Faltan parámetros (cédula o período).' });
    }

    const year = periodo.split('-')[0];
    const primerMesAnio = `${year}-01`;

    // Consultamos agrupando por período para obtener el desglose mes por mes
    const query = `
        SELECT 
            periodo,
            SUM(TP) AS TP, 
            SUM(TSP) AS TSP, 
            SUM(TEG) AS TEG, 
            SUM(PROY) AS PROY, 
            SUM(EGRU) AS EGRU, 
            SUM(ELI) AS ELI, 
            SUM(PRE) AS PRE, 
            SUM(VT) AS VT 
        FROM acumuladotaase 
        WHERE cedula = ? AND periodo >= ? AND periodo < ?
        GROUP BY periodo
        ORDER BY periodo ASC
    `;

    db.query(query, [cedula, primerMesAnio, periodo], (err, results) => {
        if (err) {
            console.error('❌ Error al consultar valores acumulados mes a mes:', err);
            return res.status(500).json({ success: false, message: err.message });
        }

        res.json({ success: true, data: results || [] });
    });
});
// Inicialización del servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, '0.0.0.0', () => {
    console.log(`🚀 Servidor ejecutándose en el puerto ${PORT}`);
});