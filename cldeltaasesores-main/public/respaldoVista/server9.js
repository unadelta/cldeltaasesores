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
/*
app.get('/api/calificaciones/:codigoMateria', (req, res) => {
    const { codigoMateria } = req.params;
    const codigoLimpio = codigoMateria.replace(/[^a-zA-Z0-9_]/g, '');
    const nombreTabla = `calificacion_${codigoLimpio}`;
    const query = `SELECT * FROM ??`;

    db.query(query, [nombreTabla], (err, results) => {
        if (err) {
            if (err.code === 'ER_NO_SUCH_TABLE') {
                return res.json({ success: true, data: [] });
            }
            return res.status(500).json({ success: false, message: err.message });
        }
        res.json({ success: true, data: results });
    });
});
*/
/*
// ENDPOINT CORREGIDO: Actualizar las notas de los objetivos y la calificación final de un alumno
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

        // Verificamos si los objetivos vienen como objeto o arreglo y armamos las columnas obj1, obj2, etc.
        if (objetivos) {
            if (Array.isArray(objetivos)) {
                objetivos.forEach((val, index) => {
                    const nombreObj = `obj${index + 1}`;
                    camposSet.push(`\`${nombreObj}\` = ?`);
                    valoresSet.push(parseFloat(val) || 0);
                });
            } else if (typeof objetivos === 'object') {
                for (const [key, val] of Object.entries(objetivos)) {
                    // Aseguramos que la clave tenga el formato correcto (ej. obj1, obj2)
                    const nombreObj = key.startsWith('obj') ? key : `obj${key}`;
                    camposSet.push(`\`${nombreObj}\` = ?`);
                    valoresSet.push(parseFloat(val) || 0);
                }
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



/*
// ENDPOINT CORREGIDO: Actualiza obteniendo el numobj directamente desde la tabla materia
app.put('/api/calificaciones-alumnos/objetivos', async(req, res) => {
    const { calificacion_codigo, cedula_alumno, objetivos, nota_final, nota_final_letra } = req.body;

    if (!calificacion_codigo || !cedula_alumno) {
        return res.status(400).json({ success: false, message: 'Faltan datos obligatorios para actualizar.' });
    }

    try {
        const connection = db.promise();
        const codigoLimpio = calificacion_codigo.replace(/[^a-zA-Z0-9_]/g, '');
        const nombreTabla = `calificacion_${codigoLimpio}`;

        // 1. Consultar automáticamente el número de objetivos (numobj) de la materia en la base de datos
        const [materiaRows] = await connection.query(
            'SELECT numobj FROM materia WHERE codigo = ?', [calificacion_codigo]
        );

        if (materiaRows.length === 0) {
            return res.status(404).json({ success: false, message: 'No se encontró la materia para verificar sus objetivos.' });
        }

        const totalObjetivos = parseInt(materiaRows[0].numobj) || 0;

        let camposSet = [];
        let valoresSet = [];

        // 2. Generar y asignar dinámicamente basándonos estrictamente en el numobj de la materia
        for (let i = 1; i <= totalObjetivos; i++) {
            const nombreObj = `obj${i}`;
            camposSet.push(`\`${nombreObj}\` = ?`);

            // Extraer el valor del objetivo enviado desde el frontend (ya sea por objeto o array)
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

        // 3. Agregar nota final y letra
        camposSet.push('`nota_final` = ?');
        valoresSet.push(parseFloat(nota_final) || 0);

        camposSet.push('`nota_final_letra` = ?');
        valoresSet.push(nota_final_letra || '');

        // 4. Agregar la cédula del alumno para la cláusula WHERE
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
// NUEVO ENDPOINT: Obtener detalle y notas de los objetivos específicos de un alumno en la materia
app.get('/api/calificaciones-detalle/:codigoMateria/:cedulaAlumno', (req, res) => {
    const { codigoMateria, cedulaAlumno } = req.params;
    const codigoLimpio = codigoMateria.replace(/[^a-zA-Z0-9_]/g, '');
    const nombreTabla = `calificacion_${codigoLimpio}`;

    const query = `SELECT * FROM \`${nombreTabla}\` WHERE cedula_alumno = ? LIMIT 1`;

    db.query(query, [cedulaAlumno], (err, results) => {
        if (err) {
            if (err.code === 'ER_NO_SUCH_TABLE') {
                return res.json({ success: true, data: null });
            }
            return res.status(500).json({ success: false, message: err.message });
        }

        if (results.length > 0) {
            res.json({ success: true, data: results[0] });
        } else {
            res.json({ success: true, data: null });
        }
    });
});
*/

/*
// ENDPOINT CORREGIDO Y SEGURO: Actualizar las notas de los objetivos y la calificación final
app.put('/api/calificaciones-alumnos/objetivos', async(req, res) => {
    const { calificacion_codigo, cedula_alumno, objetivos, nota_final, nota_final_letra } = req.body;

    if (!calificacion_codigo || !cedula_alumno) {
        return res.status(400).json({ success: false, message: 'Faltan datos obligatorios para actualizar.' });
    }

    try {
        const connection = db.promise();
        const codigoLimpio = calificacion_codigo.replace(/[^a-zA-Z0-9_]/g, '');
        const nombreTabla = `calificacion_${codigoLimpio}`;

        // 1. Consultar automáticamente el número de objetivos (numobj) de la materia usando el código limpio o original
        const [materiaRows] = await connection.query(
            'SELECT numobj FROM materia WHERE codigo = ?', [calificacion_codigo]
        );

        if (materiaRows.length === 0) {
            return res.status(404).json({ success: false, message: 'No se encontró la materia para verificar sus objetivos.' });
        }

        const totalObjetivos = parseInt(materiaRows[0].numobj) || 0;

        let camposSet = [];
        let valoresSet = [];

        // 2. Generar dinámicamente las columnas obj1, obj2... hasta numobj
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

*/




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
/*
app.get('/api/calificaciones/:codigoMateria', async(req, res) => {
    const codigoMateria = req.params.codigoMateria;
    const semestreSeleccionado = req.query.semestre; // Semestre que viene del combobox

    // <-- INSTRUCCIONES DE DEPURACIÓN EN CONSOLA -->
    console.log("--- PETICIÓN RECIBIDA EN /api/calificaciones ---");
    console.log("Código de Materia recibido (Params):", codigoMateria);
    console.log("Semestre recibido (Query):", semestreSeleccionado);

    try {
        if (!semestreSeleccionado) {
            console.log("Error: El semestre llegó vacío o indefinido.");
            return res.json({ success: false, message: "Debe seleccionar un semestre." });
        }

        const query = `
            SELECT * FROM calificaciones_${codigoMateria} 
            WHERE semestre = ?
        `;

        console.log("Ejecutando Query:", query, "con valor:", semestreSeleccionado);

        const [rows] = await pool.query(query, [semestreSeleccionado]);

        console.log(`Registros encontrados en la BD: ${rows.length}`);
        res.json({ success: true, data: rows });
    } catch (error) {
        console.error("Error detallado al consultar calificaciones:", error);
        res.status(500).json({ success: false, message: "Error en el servidor de base de datos" });
    }
});
*/
/*
app.get('/api/calificaciones/:codigoMateria', async(req, res) => {
    const codigoMateria = req.params.codigoMateria;
    const semestreSeleccionado = req.query.semestre; // <-- Aquí se recibe el "2026-2" del frontend

    try {
        const query = `SELECT * FROM calificaciones_${codigoMateria} WHERE semestre = ?`;
        const [rows] = await pool.query(query, [semestreSeleccionado]);
        res.json({ success: true, data: rows });
    } catch (error) {
        res.status(500).json({ success: false, message: "Error en el servidor" });
    }
});
*/

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
// Iniciar Servidor
app.listen(PORT, () => {
    console.log(`🚀 Servidor ejecutándose en http://localhost:${PORT}`);
});