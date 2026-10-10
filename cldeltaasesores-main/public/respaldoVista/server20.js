const express = require('express');
const mysql = require('mysql2');
const session = express.session ? require('express-session') : require('express-session'); // Mantenido según tu estructura
const path = require('path');

const app = express();

const PORT = process.env.PORT || 3000;

// Configuración de Middlewares
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));
app.use('/views', express.static(path.join(__dirname, 'views')));



//const express = require('express');
const router = express.Router();
// Asumiendo que tienes una función para conectar a la DB, ej: db.query
const db = require('../config/db'); // Ajusta tu ruta de conexión





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

// Conexión a la Base de Datos MySQL
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'asesores'
});

db.connect((err) => {
    if (err) {
        console.error('❌ Error al conectar a la base de datos MySQL:', err.message);
        return;
    }
    console.log('✅ Conectado exitosamente a la base de datos MySQL (asesores).');
});

// ==========================================
// RUTAS Y ENDPOINTS DE AUTENTICACIÓN
// ==========================================

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'login.html'));
});

app.post('/api/login', (req, res) => {
    const { usuario, clave } = req.body;
    const sql = 'SELECT * FROM asesor WHERE usuario = ? AND clave = ?';

    db.query(sql, [usuario, clave], (err, results) => {
        if (err) {
            console.error('❌ Error en el login:', err.message);
            return res.status(500).json({ success: false, message: 'Error en el servidor' });
        }

        if (results.length > 0) {
            const user = results[0];

            req.session.usuario = {
                cedula: user.cedula,
                id: user.id,
                nombre: user.nombre || user.usuario,
                usuario: user.usuario,
                esAdmin: user.esAdmin || false
            };

            return res.json({ success: true, message: 'Autenticación exitosa' });
        } else {
            return res.status(401).json({ success: false, message: 'Usuario o contraseña incorrectos' });
        }
    });
});

app.get('/api/user-session', (req, res) => {
    if (req.session && req.session.usuario) {
        return res.json({
            authenticated: true,
            user: req.session.usuario
        });
    }
    res.json({ authenticated: false });
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
// RUTAS API: MÓDULO DE MATERIAS (materia.html)
// ==============================================================================



// Ruta para servir la vista HTML del módulo de materias
app.get('/materia', (req, res) => {
    // Verificar si el usuario ha iniciado sesión antes de mostrar la página
    if (!req.session || !req.session.usuario) {
        return res.redirect('/login'); // Cambia '/login' por tu ruta de acceso si es distinta
    }

    // Envía el archivo materia.html (asegúrate de que esté dentro de tu carpeta 'public' o ajusta la ruta)
    res.sendFile(path.join(__dirname, 'views', 'materia.html'));
});
/**Nuevas correecionea */

// ==============================================================================
// RUTAS API: MÓDULO DE MATERIAS (Corregido sin error de getConnection)
// ==============================================================================

// 1. RUTA API: LEER DATOS (GET)
app.get('/api/materias', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    try {
        const [materias] = await db.promise().query('SELECT * FROM materia ORDER BY descripcion ASC');
        const materiasCompletas = [];

        for (let mat of materias) {
            const [objetivos] = await db.promise().query(
                'SELECT nro_objetivo, peso FROM objetivo_materia WHERE materia_codigo = ? ORDER BY nro_objetivo ASC', [mat.codigo]
            );

            const [calificaciones] = await db.promise().query(
                'SELECT peso_acumulado, calificacion_definitiva AS calificacion FROM calificaciones WHERE cod_materia = ? ORDER BY peso_acumulado ASC', [mat.codigo]
            );

            materiasCompletas.push({
                codigo: mat.codigo,
                descripcion: mat.descripcion,
                numobj: mat.numobj,
                minaprueba: parseFloat(mat.minaprueba) || 0,
                objetivos: objetivos.map(o => ({
                    nro_objetivo: o.nro_objetivo,
                    peso: parseFloat(o.peso) || 0
                })),
                calificaciones: calificaciones.map(c => ({
                    peso_acumulado: parseFloat(c.peso_acumulado) || 0,
                    calificacion: parseFloat(c.calificacion) || 0
                }))
            });
        }

        res.json({ success: true, data: materiasCompletas });

    } catch (err) {
        console.error('❌ Error al leer materias:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al consultar materias.' });
    }
});

// 2. RUTA PARA CREAR NUEVA MATERIA (POST)
app.post('/api/materias', async(req, res) => {
    const { codigo, descripcion, numobj, minaprueba, objetivos, calificaciones } = req.body;

    if (!codigo || !descripcion || !numobj || !minaprueba) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios básicos.' });
    }

    try {
        // A. Insertar en tabla 'materia'
        await db.promise().query(
            'INSERT INTO materia (codigo, descripcion, numobj, minaprueba) VALUES (?, ?, ?, ?)', [codigo, descripcion, numobj, minaprueba]
        );

        // B. Insertar en tabla 'objetivo_materia'
        if (Array.isArray(objetivos) && objetivos.length > 0) {
            for (let obj of objetivos) {
                await db.promise().query(
                    'INSERT INTO objetivo_materia (materia_codigo, nro_objetivo, peso) VALUES (?, ?, ?)', [codigo, obj.nro_objetivo, obj.peso]
                );
            }
        }

        // C. Insertar en tabla 'calificaciones'
        if (Array.isArray(calificaciones) && calificaciones.length > 0) {
            for (let cal of calificaciones) {
                await db.promise().query(
                    'INSERT INTO calificaciones (cod_materia, peso_acumulado, calificacion_definitiva) VALUES (?, ?, ?)', [codigo, cal.peso_acumulado, cal.calificacion]
                );
            }
        }

        // D. Crear la tabla dinámica de notas específica para la materia
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

        await db.promise().query(sqlCrearTablaEspecifica);

        res.json({ success: true, message: 'Materia registrada y estructura de notas creada exitosamente.' });

    } catch (err) {
        console.error("❌ Error al registrar materia:", err);

        if (err.code === 'ER_DUP_ENTRY') {
            return res.json({ success: false, message: 'Ya existe una materia con ese código.' });
        }

        res.status(500).json({ success: false, message: 'Error en el servidor al registrar la materia: ' + err.message });
    }
});

// 3. RUTA PARA OBTENER EL CATÁLOGO DE MATERIAS (PARA EL COMBOBOX)
app.get('/api/catalogo-materias', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    try {
        const [materias] = await db.promise().query('SELECT codigo, descripcion FROM materia_una ORDER BY codigo ASC');
        res.json({ success: true, data: materias });
    } catch (err) {
        console.error('❌ Error al obtener el catálogo de materias:', err);
        res.status(500).json({ success: false, message: 'Error al cargar el catálogo.' });
    }
});

// Ruta para EDITAR materia existente (PUT)
app.put('/api/materias/:codigoOriginal', async(req, res) => {
    const { codigoOriginal } = req.params;
    const { codigo, descripcion, numobj, minaprueba, objetivos, calificaciones } = req.body;

    if (!descripcion || !numobj || !minaprueba) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios.' });
    }

    try {
        // 1. Actualizar datos básicos en tabla 'materia'
        await db.promise().query(
            'UPDATE materia SET codigo = ?, descripcion = ?, numobj = ?, minaprueba = ? WHERE codigo = ?', [codigo, descripcion, numobj, minaprueba, codigoOriginal]
        );

        // 2. Sincronizar Objetivos (borrar anteriores y reinsertar nuevos)
        await db.promise().query('DELETE FROM objetivo_materia WHERE materia_codigo = ?', [codigo]);

        if (Array.isArray(objetivos)) {
            for (let obj of objetivos) {
                await db.promise().query(
                    'INSERT INTO objetivo_materia (materia_codigo, nro_objetivo, peso) VALUES (?, ?, ?)', [codigo, obj.nro_objetivo, obj.peso]
                );
            }
        }

        // 3. Sincronizar Calificaciones (borrar anteriores y reinsertar nuevos)
        await db.promise().query('DELETE FROM calificaciones WHERE cod_materia = ?', [codigo]);

        if (Array.isArray(calificaciones)) {
            for (let cal of calificaciones) {
                await db.promise().query(
                    'INSERT INTO calificaciones (cod_materia, peso_acumulado, calificacion_definitiva) VALUES (?, ?, ?)', [codigo, cal.peso_acumulado, cal.calificacion]
                );
            }
        }

        res.json({ success: true, message: 'Materia y sus relaciones actualizadas correctamente.' });

    } catch (err) {
        console.error("❌ Error al actualizar materia:", err);
        res.status(500).json({ success: false, message: 'Error al actualizar la materia: ' + err.message });
    }
});

// Ruta para ELIMINAR materia y toda su estructura asociada (DELETE)
app.delete('/api/materias/:codigo', async(req, res) => {
    const materiaCodigo = req.params.codigo;

    try {
        // 1. Borrar registros relacionados en objetivo_materia
        await db.promise().query('DELETE FROM objetivo_materia WHERE materia_codigo = ?', [materiaCodigo]);

        // 2. Borrar registros relacionados en calificaciones
        await db.promise().query('DELETE FROM calificaciones WHERE cod_materia = ?', [materiaCodigo]);

        // 3. Borrar la materia principal
        const [result] = await db.promise().query('DELETE FROM materia WHERE codigo = ?', [materiaCodigo]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Materia no encontrada.' });
        }

        // 4. Eliminar la tabla dinámica de notas específica de la materia (ej. calificacion_107)
        const nombreTablaLimpio = `calificacion_${materiaCodigo.replace(/[^a-zA-Z0-9_]/g, '_')}`;
        await db.promise().query(`DROP TABLE IF EXISTS \`${nombreTablaLimpio}\``);

        res.json({ success: true, message: 'Materia, sus relaciones y su tabla dinámica de notas fueron eliminadas por completo.' });

    } catch (err) {
        console.error('❌ Error al eliminar materia y sus tablas:', err);
        res.status(500).json({ success: false, message: 'Error al eliminar la materia: ' + err.message });
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
    const query = 'SELECT id, cedula, nombre, codigo_carrera FROM alumno ORDER BY id DESC';
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

app.post('/api/alumnos', (req, res) => {
    const { cedula, nombre, codigo_carrera } = req.body;
    const query = 'INSERT INTO alumno (cedula, nombre, codigo_carrera) VALUES (?, ?, ?)';

    db.query(query, [cedula, nombre, codigo_carrera], (err, result) => {
        if (err) {
            console.error("Error al registrar alumno:", err);
            if (err.code === 'ER_DUP_ENTRY') {
                return res.status(400).json({ success: false, message: 'La cédula ya se encuentra registrada en el sistema.' });
            }
            return res.status(500).json({ success: false, message: err.message });
        }
        res.json({ success: true, id: result.insertId, message: 'Alumno registrado correctamente' });
    });
});

app.put('/api/alumnos/:id', (req, res) => {
    const { id } = req.params;
    const { cedula, nombre, codigo_carrera } = req.body;
    const query = 'UPDATE alumno SET cedula = ?, nombre = ?, codigo_carrera = ? WHERE id = ?';

    db.query(query, [cedula, nombre, codigo_carrera, id], (err, result) => {
        if (err) {
            console.error('Error al actualizar alumno:', err);
            if (err.code === 'ER_DUP_ENTRY') {
                return res.status(400).json({ success: false, message: 'La cédula ya pertenece a otro alumno registrado.' });
            }
            return res.status(500).json({ success: false, message: err.message });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Alumno no encontrado' });
        }
        res.json({ success: true, message: 'Alumno actualizado correctamente' });
    });
});

app.delete('/api/alumnos/:id', (req, res) => {
    const { id } = req.params;
    const query = 'DELETE FROM alumno WHERE id = ?';

    db.query(query, [id], (err, result) => {
        if (err) {
            console.error('Error al eliminar alumno:', err);
            return res.status(500).json({ success: false, message: err.message });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Alumno no encontrado' });
        }
        res.json({ success: true, message: 'Alumno eliminado correctamente' });
    });
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
        AND codigo_materia = ? 
        AND tipo_asesoria = ?
        AND DATE(fecha_hora) = CURDATE()
    `;

    db.query(checkQuery, [cedula_alumno, codigo_materia, tipo_asesoria], (err, results) => {
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

    let query = 'SELECT id, cedula_alumno, codigo_carrera, tipo_asesoria, codigo_materia, fecha_hora FROM control_asesoria WHERE cedula_asesor = ?';
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

// NUEVO ENDPOINT: Actualizar las notas de los objetivos y la calificación final de un alumno
app.put('/api/calificaciones-alumnos/objetivos', async(req, res) => {
    const { calificacion_codigo, cedula_alumno, objetivos, nota_final, nota_final_letra } = req.body;

    if (!calificacion_codigo || !cedula_alumno) {
        return res.status(400).json({ success: false, message: 'Faltan datos obligatorios para actualizar.' });
    }

    try {
        const codigoLimpio = calificacion_codigo.replace(/[^a-zA-Z0-9_]/g, '');
        const nombreTabla = `calificacion_${codigoLimpio}`;

        let camposSet = [];
        let valoresSet = [];

        if (objetivos && typeof objetivos === 'object') {
            for (const [key, val] of Object.entries(objetivos)) {
                camposSet.push(`\`${key}\` = ?`);
                valoresSet.push(parseFloat(val) || 0);
            }
        }

        camposSet.push('`nota_final` = ?');
        valoresSet.push(parseFloat(nota_final) || 0);

        camposSet.push('`nota_final_letra` = ?');
        valoresSet.push(nota_final_letra || '');

        valoresSet.push(cedula_alumno);

        const queryUpdate = `UPDATE \`${nombreTabla}\` SET ${camposSet.join(', ')} WHERE cedula_alumno = ?`;

        const [resultado] = await db.promise().query(queryUpdate, valoresSet);

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




// ENDPOINT: Actualizar las notas de los objetivos y la calificación final de un alumno
app.put('/api/calificaciones-alumnos/objetivos', async(req, res) => {
    const { calificacion_codigo, cedula_alumno, objetivos, nota_final, nota_final_letra } = req.body;

    if (!calificacion_codigo || !cedula_alumno) {
        return res.status(400).json({ success: false, message: 'Faltan datos obligatorios para actualizar.' });
    }

    try {
        const connection = db.promise();
        const codigoLimpio = calificacion_codigo.replace(/[^a-zA-Z0-9_]/g, '');
        const nombreTabla = `calificacion_${codigoLimpio}`;

        // 1. Consultar el número de objetivos (numobj) de la materia en la base de datos
        const [materiaRows] = await connection.query(
            'SELECT numobj FROM materia WHERE codigo = ?', [calificacion_codigo]
        );

        if (materiaRows.length === 0) {
            return res.status(404).json({ success: false, message: 'No se encontró la materia para verificar sus objetivos.' });
        }

        const totalObjetivos = parseInt(materiaRows[0].numobj) || 0;

        let camposSet = [];
        let valoresSet = [];

        // 2. Generar dinámicamente las columnas obj1, obj2... hasta numobj basándose en la BD
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

        // 3. Añadir nota final y letra
        camposSet.push('`nota_final` = ?');
        valoresSet.push(parseFloat(nota_final) || 0);

        camposSet.push('`nota_final_letra` = ?');
        valoresSet.push(nota_final_letra || '');

        // 4. Agregar la cédula del alumno para el WHERE
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
app.get('/api/sesion-usuario', (req, res) => {
    if (req.session && req.session.usuario) {
        res.json({ success: true, nombre: req.session.usuario.nombre || req.session.usuario });
    } else {
        res.json({ success: false, nombre: 'Invitado' });
    }
});

// Endpoint para obtener únicamente el número de objetivos de la materia desde su código
app.get('/api/materias-objetivos/:codigoMateria', async(req, res) => {
    const { codigoMateria } = req.params;

    try {
        const connection = db.promise();

        // Consultar la tabla materia usando el código para obtener el numobj
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


// ENDPOINT: Eliminar al alumno y su fila de la tabla calificacion_(codigo materia)
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
        console.log("Buscando objetivos para el código de materia en MySQL:", codigo);

        const query = 'SELECT id, materia_codigo, nro_objetivo, peso FROM objetivo_materia WHERE materia_codigo = ? ORDER BY nro_objetivo ASC';

        // Agregamos .promise() para que acepte async/await
        const [rows] = await db.promise().query(query, [codigo]);

        console.log("Filas encontradas en MySQL:", rows);
        res.json({ success: true, data: rows });
    } catch (error) {
        console.error("Error en endpoint de objetivos:", error);
        res.status(500).json({ success: false, message: error.message });
    }
});

app.post('/api/calcular-definitiva', async(req, res) => {
    try {
        const { codigo_materia, peso_acumulado } = req.body;
        console.log("Calculando definitiva para materia:", codigo_materia, "con peso acumulado:", peso_acumulado);

        // Consultamos la tabla 'calificaciones' usando el código de materia y el peso acumulado
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

// Ruta para el Reporte de Calificaciones
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
// API: GESTIÓN DE TIPO DE ASESORÍA
// ==========================================

// Ruta para servir la página HTML (Vista)
app.get('/tipo_asesoria', (req, res) => {
    // Verificación de sesión (asumiendo uso de express-session)
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    // Asegúrate de que el archivo 'tipo_asesoria.html' esté en la carpeta 'views'
    res.sendFile(path.join(__dirname, 'views', 'tipo_asesoria.html'));
});

// --- CORRECCIÓN AQUÍ: La API debe ser una ruta GET separada ---

// 1. API: Obtener todos los tipos (JSON)
app.get('/api/tipo_asesoria', (req, res) => {
    // ¡Ahora está dentro de la ruta y usa la variable 'db' correctamente!
    const sql = 'SELECT * FROM tipoasesoria ORDER BY id DESC';

    db.query(sql, (err, results) => {
        if (err) {
            console.error('❌ Error al consultar tipoasesoria:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor al consultar la base de datos' });
        }
        // La estructura que espera tu JS en el cliente es: { success: true, data: [...] }
        res.json({ success: true, data: results });
    });
});


// 2. API: Crear nuevo tipo
app.post('/api/tipo_asesoria', (req, res) => {
    const { codigo_ase, descripcion_asesoria } = req.body;

    if (!codigo_ase || !descripcion_asesoria) {
        return res.status(400).json({ success: false, message: 'Faltan datos obligatorios (código o descripción)' });
    }

    // Verificar duplicados por código
    const checkSql = 'SELECT id FROM tipoasesoria WHERE codigo_ase = ?';
    db.query(checkSql, [codigo_ase], (err, results) => {
        if (err) {
            console.error('❌ Error al verificar duplicado:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor al verificar duplicados' });
        }

        if (results.length > 0) {
            // El frontend espera este error_code específico para mostrar la alerta de "Atención"
            return res.json({ success: false, error_code: 'DUPLICATED', message: 'Ya existe un tipo de asesoría con este código' });
        }

        // Insertar nuevo registro
        const sql = 'INSERT INTO tipoasesoria (codigo_ase, descripcion_asesoria) VALUES (?, ?)';
        db.query(sql, [codigo_ase, descripcion_asesoria], (err, result) => {
            if (err) {
                console.error('❌ Error al insertar en tipoasesoria:', err);
                return res.status(500).json({ success: false, message: 'Error al guardar el nuevo tipo de asesoría' });
            }
            res.json({ success: true, message: 'Tipo de asesoría guardado exitosamente' });
        });
    });
});

// 3. API: Editar tipo existente
app.put('/api/tipo_asesoria/:id', (req, res) => {
    const { id } = req.params;
    const { codigo_ase, descripcion_asesoria } = req.body;

    if (!codigo_ase || !descripcion_asesoria) {
        return res.status(400).json({ success: false, message: 'Faltan datos para actualizar' });
    }

    const sql = 'UPDATE tipoasesoria SET codigo_ase = ?, descripcion_asesoria = ? WHERE id = ?';
    db.query(sql, [codigo_ase, descripcion_asesoria, id], (err, result) => {
        if (err) {
            console.error('❌ Error al actualizar tipoasesoria:', err);
            return res.status(500).json({ success: false, message: 'Error al actualizar el tipo de asesoría' });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'No se encontró el registro para actualizar' });
        }

        res.json({ success: true, message: 'Tipo de asesoría actualizado exitosamente' });
    });
});

// 4. API: Eliminar tipo
app.delete('/api/tipo_asesoria/:id', (req, res) => {
    const { id } = req.params;

    // NOTA DE INTEGRIDAD: Idealmente, antes de borrar, deberías verificar
    // en la tabla 'control_asesoria' si este tipo está siendo usado por alguna asesoría.
    // Si lo borras y está en uso, podrías romper la integridad referencial histórica.

    const sql = 'DELETE FROM tipoasesoria WHERE id = ?';
    db.query(sql, [id], (err, result) => {
        if (err) {
            console.error('❌ Error al eliminar de tipoasesoria:', err);
            return res.status(500).json({ success: false, message: 'Error al eliminar el tipo de asesoría' });
        }

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'No se encontró el registro para eliminar' });
        }

        res.json({ success: true, message: 'Tipo de asesoría eliminado exitosamente' });
    });
});
/*
// Ruta para servir el módulo de Control de Trabajos (TP/PTG)
app.get('/control_tptsptg.html', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'control_tptsptg.html')); // Ajusta la ruta 'public' según la carpeta donde guardes tus vistas
});

// ==============================================================================
// RUTAS API: MÓDULO CONTROL DE TRABAJOS (TP / PTG)
// ==============================================================================

// A. LEER REGISTROS (GET)
app.get('/api/control-correcciones', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    try {
        const [rows] = await db.promise().query('SELECT * FROM control_correcciones ORDER BY fecha DESC');
        res.json(rows);
    } catch (err) {
        console.error('❌ Error al obtener control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al consultar los registros.' });
    }
});

// B. CREAR NUEVO REGISTRO (POST)
app.post('/api/control-correcciones', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { fecha, cedula_alumno, nombre_alumno, carrera, tipo_correccion, codigo_materia, cedula_asesor, nombre_asesor } = req.body;

    if (!fecha || !cedula_alumno || !nombre_alumno || !tipo_correccion || !codigo_materia) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios.' });
    }

    try {
        await db.promise().query(
            `INSERT INTO control_correcciones (fecha, cedula_alumno, nombre_alumno, carrera, tipo_correccion, codigo_materia, cedula_asesor, nombre_asesor) 
             VALUES (?, ?, ?, ?, ?, ?, ?, ?)`, [fecha, cedula_alumno, nombre_alumno, carrera || '', tipo_correccion, codigo_materia, cedula_asesor || '', nombre_asesor || '']
        );
        res.json({ success: true, message: 'Trabajo registrado exitosamente.' });
    } catch (err) {
        console.error('❌ Error al insertar en control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error al registrar el trabajo: ' + err.message });
    }
});

// C. ACTUALIZAR REGISTRO (PUT)
app.put('/api/control-correcciones/:id', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { id } = req.params;
    const { fecha, cedula_alumno, nombre_alumno, carrera, tipo_correccion, codigo_materia, cedula_asesor, nombre_asesor } = req.body;

    try {
        await db.promise().query(
            `UPDATE control_correcciones 
             SET fecha = ?, cedula_alumno = ?, nombre_alumno = ?, carrera = ?, tipo_correccion = ?, codigo_materia = ?, cedula_asesor = ?, nombre_asesor = ? 
             WHERE id = ?`, [fecha, cedula_alumno, nombre_alumno, carrera || '', tipo_correccion, codigo_materia, cedula_asesor || '', nombre_asesor || '', id]
        );
        res.json({ success: true, message: 'Registro actualizado correctamente.' });
    } catch (err) {
        console.error('❌ Error al actualizar control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error al actualizar el registro: ' + err.message });
    }
});

// D. ELIMINAR REGISTRO (DELETE)
app.delete('/api/control-correcciones/:id', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { id } = req.params;

    try {
        const [result] = await db.promise().query('DELETE FROM control_correcciones WHERE id = ?', [id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Registro no encontrado.' });
        }

        res.json({ success: true, message: 'Registro eliminado correctamente.' });
    } catch (err) {
        console.error('❌ Error al eliminar control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error al eliminar el registro: ' + err.message });
    }
});

// Ruta para obtener la sesión del usuario actual (Asesor)
app.get('/api/current-user', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No hay sesión activa' });
    }
    // Devuelve los datos almacenados en sesión (ajusta las propiedades según tu estructura de login)
    res.json({
        cedula: req.session.cedula || req.session.usuario,
        nombre: req.session.nombre || req.session.nombre_completo || req.session.usuario
    });
});

// Ruta para buscar un alumno por su cédula
app.get('/api/alumnos/:cedula', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }
    const { cedula } = req.params;
    try {
        const [rows] = await db.promise().query('SELECT * FROM alumno WHERE cedula = ?', [cedula]);
        if (rows.length === 0) {
            return res.status(404).json({ success: false, message: 'Alumno no encontrado' });
        }
        res.json(rows[0]);
    } catch (err) {
        console.error('❌ Error al buscar alumno:', err);
        res.status(500).json({ success: false, message: err.message });
    }
});

// Ruta para obtener la lista de carreras (para el combobox)
app.get('/api/carreras', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }
    try {
        // Ajusta el nombre de la tabla y columnas si difieren en tu base de datos (ej. 'carrera')
        const [rows] = await db.promise().query('SELECT codigo, descripcion FROM carrera');
        res.json(rows);
    } catch (err) {
        console.error('❌ Error al obtener carreras:', err);
        res.status(500).json({ success: false, message: err.message });
    }
});
*/
/*
// Ruta para servir el módulo de Control de Trabajos (TP/PTG)
app.get('/control_tptsptg.html', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'control_tptsptg.html'));
});

// ==============================================================================
// RUTAS API: MÓDULO CONTROL DE TRABAJOS (TP / PTG)
// ==============================================================================

// A. LEER REGISTROS (GET)
app.get('/api/control-correcciones', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    try {
        const [rows] = await db.promise().query('SELECT * FROM control_correcciones ORDER BY fecha DESC');
        res.json(rows);
    } catch (err) {
        console.error('❌ Error al obtener control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al consultar los registros.' });
    }
});

// B. CREAR NUEVO REGISTRO (POST)
app.post('/api/control-correcciones', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { fecha, cedula_alumno, nombre_alumno, carrera, tipo_correccion, codigo_materia, cedula_asesor, nombre_asesor } = req.body;

    if (!fecha || !cedula_alumno || !nombre_alumno || !tipo_correccion || !codigo_materia) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios.' });
    }

    try {
        await db.promise().query(
            `INSERT INTO control_correcciones (fecha, cedula_alumno, nombre_alumno, carrera, tipo_correccion, codigo_materia, cedula_asesor, nombre_asesor) 
             VALUES (?, ?, ?, ?, ?, ?, ?, ?)`, [fecha, cedula_alumno, nombre_alumno, carrera || '', tipo_correccion, codigo_materia, cedula_asesor || '', nombre_asesor || '']
        );
        res.json({ success: true, message: 'Trabajo registrado exitosamente.' });
    } catch (err) {
        console.error('❌ Error al insertar en control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error al registrar el trabajo: ' + err.message });
    }
});

// C. ACTUALIZAR REGISTRO (PUT)
app.put('/api/control-correcciones/:id', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { id } = req.params;
    const { fecha, cedula_alumno, nombre_alumno, carrera, tipo_correccion, codigo_materia, cedula_asesor, nombre_asesor } = req.body;

    try {
        await db.promise().query(
            `UPDATE control_correcciones 
             SET fecha = ?, cedula_alumno = ?, nombre_alumno = ?, carrera = ?, tipo_correccion = ?, codigo_materia = ?, cedula_asesor = ?, nombre_asesor = ? 
             WHERE id = ?`, [fecha, cedula_alumno, nombre_alumno, carrera || '', tipo_correccion, codigo_materia, cedula_asesor || '', nombre_asesor || '', id]
        );
        res.json({ success: true, message: 'Registro actualizado correctamente.' });
    } catch (err) {
        console.error('❌ Error al actualizar control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error al actualizar el registro: ' + err.message });
    }
});

// D. ELIMINAR REGISTRO (DELETE)
app.delete('/api/control-correcciones/:id', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { id } = req.params;

    try {
        const [result] = await db.promise().query('DELETE FROM control_correcciones WHERE id = ?', [id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Registro no encontrado.' });
        }

        res.json({ success: true, message: 'Registro eliminado correctamente.' });
    } catch (err) {
        console.error('❌ Error al eliminar control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error al eliminar el registro: ' + err.message });
    }
});

// Ruta para obtener la sesión del usuario actual (Asesor)
app.get('/api/current-user', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No hay sesión activa' });
    }
    res.json({
        cedula: req.session.cedula || req.session.usuario,
        nombre: req.session.nombre || req.session.nombre_completo || req.session.usuario
    });
});

// Ruta para buscar un alumno por su cédula
app.get('/api/alumnos/:cedula', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }
    const { cedula } = req.params;
    try {
        const [rows] = await db.promise().query('SELECT * FROM alumno WHERE cedula = ?', [cedula]);
        if (rows.length === 0) {
            return res.status(404).json({ success: false, message: 'Alumno no encontrado' });
        }
        res.json(rows[0]);
    } catch (err) {
        console.error('❌ Error al buscar alumno:', err);
        res.status(500).json({ success: false, message: err.message });
    }
});

// Ruta para obtener la lista de carreras (para el combobox)
/*
app.get('/api/carreras', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }
    try {
        const [rows] = await db.promise().query('SELECT codigo, descripcion FROM carrera');
        res.json(rows);
    } catch (err) {
        console.error('❌ Error al obtener carreras:', err);
        res.status(500).json({ success: false, message: err.message });
    }
});
*/
/*
// Ruta para obtener la lista de carreras (con codigo y nombre_carrera)
app.get('/api/carreras', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }
    try {
        const [rows] = await db.promise().query('SELECT codigo, nombre_carrera FROM carrera');
        res.json(rows);
    } catch (err) {
        console.error('❌ Error al obtener carreras:', err);
        res.status(500).json({ success: false, message: err.message });
    }
});

// Ruta para obtener la lista de carreras (con codigo y nombre_carrera)
app.get('/api/carreras', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }
    try {
        const [rows] = await db.promise().query('SELECT codigo, nombre_carrera FROM carrera');
        res.json(rows);
    } catch (err) {
        console.error('❌ Error al obtener carreras:', err);
        res.status(500).json({ success: false, message: err.message });
    }
});
// Ruta para obtener la lista de materias desde materia_una (para el combobox)
app.get('/api/materias-una', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }
    try {
        const [rows] = await db.promise().query('SELECT codigo, descripcion FROM materia_una');
        res.json(rows);
    } catch (err) {
        console.error('❌ Error al obtener materia_una:', err);
        res.status(500).json({ success: false, message: err.message });
    }
});
*/

// Ruta para servir el módulo de Control de Trabajos (TP/PTG)
app.get('/control_tptsptg.html', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'control_tptsptg.html'));
});

// ==============================================================================
// RUTAS API: MÓDULO CONTROL DE TRABAJOS (TP / PTG)
// ==============================================================================

// A. LEER REGISTROS (GET)
app.get('/api/control-correcciones', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    try {
        const [rows] = await db.promise().query('SELECT * FROM control_correcciones ORDER BY fecha DESC');
        res.json(rows);
    } catch (err) {
        console.error('❌ Error al obtener control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al consultar los registros.' });
    }
});

// B. CREAR NUEVO REGISTRO (POST)
app.post('/api/control-correcciones', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { fecha, cedula_alumno, nombre_alumno, carrera, tipo_correccion, codigo_materia, cedula_asesor, nombre_asesor } = req.body;

    if (!fecha || !cedula_alumno || !nombre_alumno || !tipo_correccion || !codigo_materia) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios.' });
    }

    try {
        await db.promise().query(
            `INSERT INTO control_correcciones (fecha, cedula_alumno, nombre_alumno, carrera, tipo_correccion, codigo_materia, cedula_asesor, nombre_asesor) 
             VALUES (?, ?, ?, ?, ?, ?, ?, ?)`, [fecha, cedula_alumno, nombre_alumno, carrera || '', tipo_correccion, codigo_materia, cedula_asesor || '', nombre_asesor || '']
        );
        res.json({ success: true, message: 'Trabajo registrado exitosamente.' });
    } catch (err) {
        console.error('❌ Error al insertar en control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error al registrar el trabajo: ' + err.message });
    }
});

// C. ACTUALIZAR REGISTRO (PUT)
app.put('/api/control-correcciones/:id', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { id } = req.params;
    const { fecha, cedula_alumno, nombre_alumno, carrera, tipo_correccion, codigo_materia, cedula_asesor, nombre_asesor } = req.body;

    try {
        await db.promise().query(
            `UPDATE control_correcciones 
             SET fecha = ?, cedula_alumno = ?, nombre_alumno = ?, carrera = ?, tipo_correccion = ?, codigo_materia = ?, cedula_asesor = ?, nombre_asesor = ? 
             WHERE id = ?`, [fecha, cedula_alumno, nombre_alumno, carrera || '', tipo_correccion, codigo_materia, cedula_asesor || '', nombre_asesor || '', id]
        );
        res.json({ success: true, message: 'Registro actualizado correctamente.' });
    } catch (err) {
        console.error('❌ Error al actualizar control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error al actualizar el registro: ' + err.message });
    }
});

// D. ELIMINAR REGISTRO (DELETE)
app.delete('/api/control-correcciones/:id', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }

    const { id } = req.params;

    try {
        const [result] = await db.promise().query('DELETE FROM control_correcciones WHERE id = ?', [id]);

        if (result.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'Registro no encontrado.' });
        }

        res.json({ success: true, message: 'Registro eliminado correctamente.' });
    } catch (err) {
        console.error('❌ Error al eliminar control_correcciones:', err);
        res.status(500).json({ success: false, message: 'Error al eliminar el registro: ' + err.message });
    }
});

// Ruta para obtener la sesión del usuario actual (Asesor)
app.get('/api/current-user', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No hay sesión activa' });
    }
    res.json({
        cedula: req.session.cedula || req.session.usuario,
        nombre: req.session.nombre || req.session.nombre_completo || req.session.usuario
    });
});
/*
// Ruta para buscar un alumno por su cédula
app.get('/api/alumnos/:cedula', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }
    const { cedula } = req.params;
    try {
        const [rows] = await db.promise().query('SELECT * FROM alumno WHERE cedula = ?', [cedula]);
        if (rows.length === 0) {
            return res.status(404).json({ success: false, message: 'Alumno no encontrado' });
        }
        res.json(rows[0]);
    } catch (err) {
        console.error('❌ Error al buscar alumno:', err);
        res.status(500).json({ success: false, message: err.message });
    }
});

app.get('/api/carreras', async (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }
    try {
        const [rows] = await db.promise().query('SELECT codigo, nombre_carrera FROM carrera');
        res.json(rows);
    } catch (err) {
        console.error('❌ Error al obtener carreras:', err);
        res.status(500).json({ success: false, message: err.message });
    }
});
// Ruta para obtener la lista de materias desde materia_una (para el combobox)
app.get('/api/materias-una', async(req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado' });
    }
    try {
        const [rows] = await db.promise().query('SELECT codigo, descripcion FROM materia_una');
        res.json(rows);
    } catch (err) {
        console.error('❌ Error al obtener materia_una:', err);
        res.status(500).json({ success: false, message: err.message });
    }
});
*/
//Desde aqui
// Archivo: routes/api.js (o donde tengas tus rutas)
// ==========================================
// NUEVO ENDPOINT: Alumnos Completos + Carrera
// ==========================================
router.get('/alumnos-completos', async(req, res) => {
    try {
        // Consulta SQL que une la tabla de alumnos con la de carreras.
        // Ajusta los nombres de las tablas y columnas según tu base de datos real.
        const query = `
            SELECT 
                a.id, 
                a.cedula, 
                a.nombre, 
                c.codigo AS codigo_carrera, 
                c.nombre_carrera AS descripcion_carrera
            FROM 
                alumnos a
            LEFT JOIN 
                carreras c ON a.id_carrera = c.id
            ORDER BY 
                a.cedula ASC;
        `;

        // Ejecutar consulta (ejemplo usando pg o mysql2)
        const result = await db.query(query);

        // Devolver el resultado directamente como un array JSON
        res.json(result.rows || result[0]);
    } catch (error) {
        console.error('Error al obtener alumnos completos:', error);
        res.status(500).json({ success: false, message: 'Error interno del servidor' });
    }
});

// ==========================================
// ENDPOINT EXISTENTE: Materias UNA (Todas)
// ==========================================
router.get('/materias-una', async(req, res) => {
    try {
        // Esta consulta debe devolver TODAS las materias UNA.
        // IMPORTANTE: Debe incluir el 'codigo_carrera' para que el navegador
        // pueda filtrar por carrera más tarde.
        const query = `
            SELECT 
                codigo, 
                descripcion, 
                codigo_carrera
            FROM 
                materias_una
            ORDER BY 
                descripcion ASC;
        `;

        const result = await db.query(query);

        // Devolver el array de materias plano
        res.json(result.rows || result[0]);
    } catch (error) {
        console.error('Error al obtener materias UNA:', error);
        res.status(500).json({ success: false, message: 'Error interno del servidor' });
    }
});

module.exports = router;

// ==========================================
// 1. Endpoint para obtener los alumnos con sus datos y carrera
// ==========================================
app.get('/api/alumnos-completos', async(req, res) => {
    try {
        // Ajusta la consulta según el nombre real de tus tablas y campos en la base de datos
        const query = `
            SELECT 
                id, 
                cedula, 
                nombre, 
                codigo_carrera, 
                descripcion_carrera 
            FROM 
                alumnos 
            ORDER BY 
                cedula ASC;
        `;

        const resultado = await pool.query(query); // O db.query según tu conexión (pg, mysql, etc.)
        res.json(resultado.rows || resultado);
    } catch (error) {
        console.error('Error al obtener alumnos completos:', error);
        res.status(500).json({ success: false, message: 'Error interno del servidor' });
    }
});

// ==========================================
// 2. Endpoint para obtener todas las materias con su código de carrera
// ==========================================
app.get('/api/materias-una', async(req, res) => {
    try {
        // Es indispensable que devuelva 'codigo_carrera' para que el filtro en el cliente funcione
        const query = `
            SELECT 
                codigo, 
                descripcion, 
                codigo_carrera 
            FROM 
                materia 
            ORDER BY 
                descripcion ASC;
        `;

        const resultado = await pool.query(query);
        res.json(resultado.rows || resultado);
    } catch (error) {
        console.error('Error al obtener materias UNA:', error);
        res.status(500).json({ success: false, message: 'Error interno del servidor' });
    }
});


// Iniciar Servidor
app.listen(PORT, () => {
    console.log(`🚀 Servidor ejecutándose en http://localhost:${PORT}`);
});