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

app.get('/api/materias', async(req, res) => {
    try {
        const connection = db.promise();
        const [materias] = await connection.query('SELECT codigo, descripcion, numobj, minaprueba FROM materia ORDER BY descripcion ASC');
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
    const { codigo, descripcion, numobj, minaprueba, objetivos, calificaciones } = req.body;

    if (!codigo || !descripcion || !numobj || !minaprueba) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios básicos.' });
    }

    try {
        const connection = db.promise();
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

        const nombreTablaLimpio = `calificacion_${codigo.replace(/[^a-zA-Z0-9_]/g, '_')}`;
        let columnasObjetivosSql = '';
        const cantidadObjetivos = parseInt(numobj) || 0;
        for (let i = 1; i <= cantidadObjetivos; i++) {
            columnasObjetivosSql += `, obj${i} DECIMAL(5,2) DEFAULT 0.00`;
        }

        const sqlCrearTablaEspecifica = `
            CREATE TABLE IF NOT EXISTS \`${nombreTablaLimpio}\` (
                id INT AUTO_INCREMENT PRIMARY KEY,
                nombre_alumno VARCHAR(150) NOT NULL,
                cedula_alumno VARCHAR(30) NOT NULL,
                cedula_asesor VARCHAR(30) NOT NULL
                ${columnasObjetivosSql},
                nota_final DECIMAL(5,2) DEFAULT 0.00,
                nota_final_letra VARCHAR(10) DEFAULT '',
                semestre VARCHAR(50) DEFAULT ''
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        `;

        await connection.query(sqlCrearTablaEspecifica);

        res.json({ success: true, message: 'Materia registrada y su tabla de notas específica fue creada exitosamente.' });
    } catch (err) {
        console.error("Error al registrar materia y crear su tabla:", err);
        res.status(500).json({ success: false, message: 'Error al registrar la materia o crear su estructura en la base de datos.' });
    }
});

app.put('/api/materias/:codigoOriginal', async(req, res) => {
    const { codigoOriginal } = req.params;
    const { codigo, descripcion, numobj, minaprueba, objetivos, calificaciones } = req.body;

    if (!descripcion || !numobj || !minaprueba) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios básicos.' });
    }

    try {
        const connection = db.promise();
        await connection.query(
            'UPDATE materia SET codigo = ?, descripcion = ?, numobj = ?, minaprueba = ? WHERE codigo = ?', [codigo, descripcion, numobj, minaprueba, codigoOriginal]
        );

        await connection.query('DELETE FROM objetivo_materia WHERE materia_codigo = ?', [codigoOriginal]);
        await connection.query('DELETE FROM objetivo_materia WHERE materia_codigo = ?', [codigo]);

        if (Array.isArray(objetivos)) {
            for (let obj of objetivos) {
                await connection.query(
                    'INSERT INTO objetivo_materia (materia_codigo, nro_objetivo, peso) VALUES (?, ?, ?)', [codigo, obj.nro_objetivo, obj.peso]
                );
            }
        }

        await connection.query('DELETE FROM calificaciones WHERE cod_materia = ?', [codigoOriginal]);
        await connection.query('DELETE FROM calificaciones WHERE cod_materia = ?', [codigo]);

        if (Array.isArray(calificaciones)) {
            for (let cal of calificaciones) {
                await connection.query(
                    'INSERT INTO calificaciones (cod_materia, peso_acumulado, calificacion_definitiva) VALUES (?, ?, ?)', [codigo, cal.peso_acumulado, cal.calificacion]
                );
            }
        }

        res.json({ success: true, message: 'Materia y sus relaciones actualizadas exitosamente.' });
    } catch (err) {
        console.error("Error al actualizar materia:", err);
        res.status(500).json({ success: false, message: 'Error al actualizar la materia en la base de datos.' });
    }
});

app.delete('/api/materias/:codigo', async(req, res) => {
    const materiaCodigo = req.params.codigo;
    try {
        const connection = db.promise();
        await connection.beginTransaction();

        await connection.query('DELETE FROM objetivo_materia WHERE materia_codigo = ?', [materiaCodigo]);
        await connection.query('DELETE FROM calificaciones WHERE cod_materia = ?', [materiaCodigo]);
        await connection.query('DELETE FROM materia WHERE codigo = ?', [materiaCodigo]);

        await connection.commit();

        res.json({ success: true, message: 'Materia y sus registros asociados eliminados correctamente.' });
    } catch (err) {
        console.error('Error al eliminar materia:', err);
        res.status(500).json({ success: false, message: 'Error al eliminar la materia de la base de datos.' });
    }
});

app.get('/api/materia_una', async(req, res) => {
    try {
        const [rows] = await db.promise().query('SELECT id, codigo, descripcion FROM materia_una');
        res.json({ success: true, data: rows });
    } catch (err) {
        console.error('Error al obtener materias:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor' });
    }
});



// ==========================================
// RUTAS PARA EL MÓDULO DE ALUMNOS
// ==========================================

app.get('/alumno', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'alumno.html'));
});

app.get('/api/alumnos', (req, res) => {
    const query = 'SELECT id, cedula, nombre, codigo_carrera,descripcion_carrera FROM alumno ORDER BY cedula ASC';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error al obtener alumnos:', err);
            return res.status(500).json({ success: false, error: err.message });
        }
        res.json({ success: true, data: results });
    });
});

app.get('/api/alumnos/buscar/:cedula', (req, res) => {
    const cedulaBusqueda = decodeURIComponent(req.params.cedula);
    const query = `
        SELECT a.id, a.cedula, a.nombre, a.codigo_carrera, c.nombre_carrera AS descripcion_carrera
        FROM alumno a
        LEFT JOIN carrera c ON a.codigo_carrera = c.codigo
        WHERE a.cedula = ?
    `;
    db.query(query, [cedulaBusqueda], (err, results) => {
        if (err) {
            console.error('Error al buscar alumno por cédula:', err);
            return res.status(500).json({ success: false, error: err.message });
        }
        if (results.length > 0) {
            res.json({ success: true, data: results[0] });
        } else {
            res.json({ success: false, data: null });
        }
    });
});


// ==========================================
// RUTAS PARA EL MÓDULO DE ALUMNOS (CALLBACKS - TABLA: alumno)
// ==========================================

// BUSCAR ALUMNO POR CÉDULA
app.get('/api/alumnos/buscar/:cedula', (req, res) => {
    const cedulaBusqueda = decodeURIComponent(req.params.cedula);
    const query = `
        SELECT a.id, a.cedula, a.nombre, a.codigo_carrera, c.nombre_carrera AS descripcion_carrera
        FROM alumno a
        LEFT JOIN carrera c ON a.codigo_carrera = c.codigo
        WHERE a.cedula = ?
    `;
    db.query(query, [cedulaBusqueda], (err, results) => {
        if (err) {
            console.error('Error al buscar alumno por cédula:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor.' });
        }
        if (results.length > 0) {
            res.json({ success: true, data: results[0] });
        } else {
            res.json({ success: false, data: null, message: 'Alumno no encontrado.' });
        }
    });
});

// REGISTRAR NUEVO ALUMNO (POST)
app.post('/api/alumnos', (req, res) => {
    const { cedula, nombre, codigo_carrera, descripcion_carrera } = req.body;

    if (!cedula || !cedula.trim() || !nombre || !nombre.trim() || !codigo_carrera || !codigo_carrera.trim()) {
        return res.status(400).json({
            success: false,
            message: 'Todos los campos son obligatorios.'
        });
    }

    const cedulaLimpia = cedula.trim();

    db.query('SELECT id FROM alumno WHERE cedula = ?', [cedulaLimpia], (err, existente) => {
        if (err) {
            console.error('Error al verificar duplicado:', err);
            return res.status(500).json({ success: false, message: 'Error interno del servidor.' });
        }

        if (existente.length > 0) {
            return res.status(400).json({
                success: false,
                message: `La cédula ${cedulaLimpia} ya se encuentra registrada.`
            });
        }

        const sqlInsert = 'INSERT INTO alumno (cedula, nombre, codigo_carrera, descripcion_carrera) VALUES (?, ?, ?, ?)';
        db.query(sqlInsert, [cedulaLimpia, nombre.trim(), codigo_carrera.trim(), (descripcion_carrera || '').trim()], (err, result) => {
            if (err) {
                console.error('Error al insertar alumno:', err);
                return res.status(500).json({ success: false, message: 'Error al registrar el alumno en la base de datos.' });
            }

            res.json({
                success: true,
                id: result.insertId,
                message: 'Alumno registrado con éxito.'
            });
        });
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

// Endpoint para eliminar alumno
app.delete('/api/alumnos/:id', async(req, res) => {
    const alumnoId = req.params.id;

    try {
        try {
            const [calificaciones] = await db.promise().query(
                'SELECT COUNT(*) as total FROM calificaciones WHERE alumno_id = ?', [alumnoId]
            );
            if (calificaciones[0].total > 0) {
                return res.status(400).json({
                    success: false,
                    errorCode: 'REGISTROS_ASOCIADOS',
                    message: 'El alumno tiene registros asociados y no puede ser eliminado.'
                });
            }
        } catch (e) {}

        const [resultadoEliminacion] = await db.promise().query(
            'DELETE FROM alumno WHERE id = ?', [alumnoId]
        );

        if (resultadoEliminacion.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Alumno no encontrado.' });
        }

        res.json({ success: true, message: 'Alumno eliminado exitosamente.' });

    } catch (error) {
        console.error('Error crítico al eliminar alumno:', error);
        res.status(500).json({ success: false, message: 'Error interno del servidor.' });
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

// RUTA CORRECCIONES

app.get('/api/control_correcciones', async(req, res) => {
    try {
        const [rows] = await db.promise().query(`
            SELECT cc.*, MAX(a.descripcion_carrera) AS descripcion_carrera 
            FROM control_correcciones cc
            LEFT JOIN alumno a ON cc.codigo_carrera = a.codigo_carrera
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
        cedula_asesor,
        nombre_asesor
    } = req.body;

    const checkQuery = `
        SELECT id FROM control_asesoria 
        WHERE cedula_alumno = ? 
        AND nombre_alumno = ?
        AND codigo_materia = ? 
        AND tipo_asesoria = ?
        AND DATE(fecha_hora) = CURDATE()
    `;

    db.query(checkQuery, [cedula_alumno, nombre_alumno, codigo_materia, tipo_asesoria], (err, results) => {
        if (err) {
            console.error('Error al verificar duplicado:', err);
            return res.status(500).json({ success: false, message: 'Error interno del servidor' });
        }

        if (results.length > 0) {
            return res.status(200).json({
                success: false,
                error_code: 'DUPLICATED',
                message: 'Ya existe una asesoría registrada para este alumno en esta materia hoy.'
            });
        }

        const insertQuery = `
            INSERT INTO control_asesoria 
            (cedula_alumno, nombre_alumno, codigo_carrera, tipo_asesoria, codigo_materia, cedula_asesor, nombre_asesor, fecha_hora) 
            VALUES (?, ?, ?, ?, ?, ?, ?, NOW())
        `;

        db.query(insertQuery, [
            cedula_alumno,
            nombre_alumno,
            codigo_carrera,
            tipo_asesoria,
            codigo_materia,
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
        codigo_materia
    } = req.body;

    const updateQuery = `
        UPDATE control_asesoria 
        SET cedula_alumno = ?, nombre_alumno = ?, codigo_carrera = ?, tipo_asesoria = ?, codigo_materia = ?
        WHERE id = ?
    `;

    db.query(updateQuery, [
        cedula_alumno,
        nombre_alumno,
        codigo_carrera,
        tipo_asesoria,
        codigo_materia,
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

// Ruta para registrar una nueva corrección
app.post('/api/control_correcciones', async(req, res) => {
    try {
        const {
            cedula_alumno,
            nombre_alumno,
            codigo_carrera,
            codigo_materia,
            tipo_correccion,
            cedula_asesor,
            nombre_asesor,
            fecha
        } = req.body;

        if (!cedula_alumno || !codigo_materia || !tipo_correccion || !cedula_asesor) {
            return res.status(400).json({
                success: false,
                message: 'Faltan campos obligatorios por completar.'
            });
        }

        const fechaRegistro = fecha ? new Date(fecha) : new Date();

        const query = `
            INSERT INTO control_correcciones 
            (cedula_alumno, nombre_alumno, codigo_carrera, codigo_materia, tipo_correccion, cedula_asesor, nombre_asesor, fecha) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        `;

        await db.promise().query(query, [
            cedula_alumno,
            nombre_alumno,
            codigo_carrera,
            codigo_materia,
            tipo_correccion,
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

// Ruta PUT para actualizar una corrección existente por su ID
app.put('/api/control_correcciones/:id', async(req, res) => {
    try {
        const { id } = req.params;
        const {
            cedula_alumno,
            nombre_alumno,
            codigo_carrera,
            codigo_materia,
            tipo_correccion,
            cedula_asesor,
            nombre_asesor,
            fecha
        } = req.body;

        const query = `
            UPDATE control_correcciones 
            SET cedula_alumno = ?, nombre_alumno = ?, codigo_carrera = ?, codigo_materia = ?, tipo_correccion = ?, cedula_asesor = ?, nombre_asesor = ?, fecha = ? 
            WHERE id = ?
        `;

        await db.promise().execute(query, [
            cedula_alumno,
            nombre_alumno,
            codigo_carrera,
            codigo_materia,
            tipo_correccion,
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

app.post('/api/calificaciones-alumnos', async(req, res) => {
    const { calificacion_codigo, id, nombre_alumno, cedula_alumno, semestre, objetivos } = req.body;
    const cedula_asesor = req.session && req.session.usuario ? (req.session.usuario.cedula || req.session.usuario.id) : 'S/N';

    if (!calificacion_codigo || !cedula_alumno) {
        return res.status(400).json({ success: false, message: 'Faltan datos obligatorios para registrar la calificación.' });
    }

    try {
        const codigoLimpio = calificacion_codigo.replace(/[^a-zA-Z0-9_]/g, '');
        const nombreTabla = `calificacion_${codigoLimpio}`;

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
        let sqlValues = [id, nombre_alumno, cedula_alumno, cedula_asesor, semestre];

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
            message: `Calificaciones guardadas exitosamente en ${nombreTabla}.`,
            nota_final: sumaNotaFinal
        });

    } catch (err) {
        console.error(`Error al registrar calificaciones dinámicas:`, err);
        if (err.code === 'ER_DUP_ENTRY') {
            return res.status(400).json({ success: false, message: 'El alumno ya se encuentra registrado con calificaciones en esta materia.' });
        }
        if (err.code === 'ER_NO_SUCH_TABLE') {
            return res.status(400).json({ success: false, message: `La tabla ${nombreTabla} no existe en la base de datos.` });
        }
        res.status(500).json({ success: false, message: err.message });
    }
});

app.put('/api/calificaciones-alumnos/objetivos', async(req, res) => {
    const { calificacion_codigo, cedula_alumno, objetivos, nota_final, nota_final_letra } = req.body;

    if (!calificacion_codigo || !cedula_alumno) {
        return res.status(400).json({ success: false, message: 'Faltan datos obligatorios para actualizar.' });
    }

    try {
        const connection = db.promise();
        const codigoLimpio = calificacion_codigo.replace(/[^a-zA-Z0-9_]/g, '');
        const nombreTabla = `calificacion_${codigoLimpio}`;

        const [materiaRows] = await connection.query(
            'SELECT numobj FROM materia WHERE codigo = ?', [calificacion_codigo]
        );

        if (materiaRows.length === 0) {
            return res.status(404).json({ success: false, message: 'No se encontró la materia para verificar sus objetivos.' });
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
            return res.status(404).json({ success: false, message: 'No se encontró el registro del alumno para actualizar.' });
        }

        res.json({
            success: true,
            message: 'Calificaciones de objetivos actualizadas correctamente.'
        });

    } catch (err) {
        console.error('Error al actualizar los objetivos del alumno:', err);
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

    if (!codigoMateria || !cedulaAlumno) {
        return res.status(400).json({ success: false, message: 'Faltan parámetros para la eliminación.' });
    }

    try {
        const connection = db.promise();
        const codigoLimpio = codigoMateria.replace(/[^a-zA-Z0-9_]/g, '');
        const nombreTabla = `calificacion_${codigoLimpio}`;

        const queryDelete = `DELETE FROM \`${nombreTabla}\` WHERE cedula_alumno = ?`;
        const [resultado] = await connection.query(queryDelete, [cedulaAlumno]);

        if (resultado.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'No se encontró el registro del alumno en esta materia.' });
        }

        res.json({
            success: true,
            message: 'Fila del alumno eliminada correctamente de la materia.'
        });

    } catch (err) {
        console.error('Error al eliminar fila del alumno:', err);
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

app.get('/api/calificaciones/:codigoMateria', (req, res) => {
    const { codigoMateria } = req.params;
    const semestreSeleccionado = req.query.semestre;

    if (!semestreSeleccionado) {
        return res.json({ success: false, message: "Debe seleccionar un semestre." });
    }

    const codigoLimpio = codigoMateria.replace(/[^a-zA-Z0-9_]/g, '');
    const nombreTabla = `calificacion_${codigoLimpio}`;
    const query = `SELECT * FROM ?? WHERE semestre = ?`;

    db.query(query, [nombreTabla, semestreSeleccionado], (err, results) => {
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

app.get('/api/reporte_actividades', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { inicio, fin } = req.query;
    if (!inicio || !fin) {
        return res.status(400).json({ success: false, message: 'Debe proporcionar una fecha de inicio y fin.' });
    }

    const queryAsesorias = `
        SELECT tipo_asesoria, COUNT(*) AS cantidad 
        FROM control_asesoria 
        WHERE DATE(fecha_hora) BETWEEN ? AND ? 
        GROUP BY tipo_asesoria
    `;

    const queryCorrecciones = `
        SELECT tipo_correccion, COUNT(*) AS cantidad 
        FROM control_correcciones 
        WHERE DATE(fecha) BETWEEN ? AND ? 
        GROUP BY tipo_correccion
    `;

    db.query(queryAsesorias, [inicio, fin], (err, asesoriasResult) => {
        if (err) {
            console.error('Error al generar reporte de asesorías:', err);
            return res.status(500).json({ success: false, message: err.message });
        }

        db.query(queryCorrecciones, [inicio, fin], (err2, correccionesResult) => {
            if (err2) {
                console.error('Error al generar reporte de correcciones:', err2);
                return res.status(500).json({ success: false, message: err2.message });
            }

            res.json({
                success: true,
                asesorias: asesoriasResult,
                correcciones: correccionesResult
            });
        });
    });
});



app.use('/api/db', dbAdminRoutes);

/*
// --- Ruta de prueba ---
app.get('/', (req, res) => {
    res.send('Servidor API Asesores UNA funcionando.');
});
*/
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
app.get('/api/materiauna', (req, res) => {
    const query = 'SELECT id, codigo, descripcion FROM materia_una';

    pool.query(query, (err, results) => {
        if (err) {
            console.error("❌ Error al obtener materias de MySQL:", err);
            return res.status(500).json({ success: false, message: "Error en el servidor" });
        }
        res.json({ success: true, data: results });
    });
});


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


// Inicialización del servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, '0.0.0.0', () => {
    console.log(`🚀 Servidor ejecutándose en el puerto ${PORT}`);
});