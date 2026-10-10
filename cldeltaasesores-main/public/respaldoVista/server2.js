const express = require('express');
const mysql = require('mysql2');
const session = require('express-session');
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

// Conexión a la Base de Datos MySQL (para consultas simples y callbacks)
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'asesores'
});

// Usar pool para las operaciones async/await (necesario para los endpoints de materias)
const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'asesores',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
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
        return res.json({ authenticated: true, user: req.session.usuario });
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
            const mensaje = existeCedula ? 'Ya existe un asesor registrado con esta cédula.' : 'El nombre de usuario ya está en uso. Elija otro.';
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
// RUTAS Y LÓGICA PARA EL MÓDULO DE MATERIAS (CORREGIDAS CON POOL Y NUEVOS PESOS)
// ==============================================================================

app.get('/materia', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'materia.html'));
});

// --- CORREGIDO: Endpoint GET para listar materias (Soporte para pesos individuales) ---
app.get('/api/materias', async(req, res) => {
    let connection;
    try {
        // 1. Obtener conexión del pool
        connection = await pool.getConnection();

        // Consultas SQL modificadas: Se ha eliminado 'minaprueba' y se usan nombres de columna correctos
        // 2. Consultar Materias
        const [materias] = await connection.query('SELECT codigo, descripcion, numobj FROM materia ORDER BY descripcion ASC');

        // 3. Consultar Objetivos (Individuales)
        const [objetivos] = await connection.query('SELECT materia_codigo, nro_objetivo, peso FROM objetivo_materia ORDER BY materia_codigo ASC, nro_objetivo ASC');

        // 4. Consultar Calificaciones (Rangos de peso acumulado)
        const [calificaciones] = await connection.query('SELECT cod_materia, peso_acu_min, peso_acu_max, calificacion_definitiva FROM calificaciones ORDER BY cod_materia ASC, peso_acu_min ASC');

        // Unir los datos en el servidor para enviar una estructura completa
        const materiasFinal = materias.map(mat => {
            // Filtrar objetivos y calificaciones correspondientes a esta materia
            const objetivosDeMateria = objetivos.filter(obj => obj.materia_codigo === mat.codigo);
            const calificacionesDeMateria = calificaciones.filter(cal => cal.cod_materia === mat.codigo);

            return {
                ...mat, // Incluye codigo, descripcion, numobj
                objetivos: objetivosDeMateria.map(o => ({
                    nro_objetivo: o.nro_objetivo,
                    peso: parseFloat(o.peso) || 0 // Asegurar que sea número
                })),
                calificaciones: calificacionesDeMateria.map(c => ({
                    peso_acu_min: parseFloat(c.peso_acu_min) || 0,
                    peso_acu_max: parseFloat(c.peso_acu_max) || 0,
                    calificacion: c.calificacion_definitiva
                }))
            };
        });

        res.json({ success: true, data: materiasFinal });

    } catch (err) {
        console.error('Error al obtener materias:', err);
        res.status(500).json({ success: false, message: 'Error en el servidor al consultar materias' });

    } finally {
        // 5. Liberar conexión siempre
        if (connection) connection.release();
    }
});

// --- CORREGIDO: Endpoint POST para registrar materia (Sin 'minaprueba', usa pool) ---
app.post('/api/materias', async(req, res) => {
    // MODIFICACIÓN: Eliminado 'minaprueba' del destructuring
    const { codigo, descripcion, numobj, objetivos, calificaciones } = req.body;

    // MODIFICACIÓN: Eliminado 'minaprueba' de la validación
    if (!codigo || !descripcion || !numobj) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios básicos (código, descripción, numobj).' });
    }

    let connection;
    try {
        connection = await pool.getConnection();
        await connection.beginTransaction();

        // 1. Insertar Materia
        // MODIFICACIÓN: Consulta INSERT simplificada. Se eliminó 'minaprueba' de los campos y VALUES.
        await connection.query(
            'INSERT INTO materia (codigo, descripcion, numobj) VALUES (?, ?, ?)', [codigo, descripcion, numobj]
        );

        // 2. Insertar objetivos (con peso individual)
        if (Array.isArray(objetivos) && objetivos.length > 0) {
            for (let obj of objetivos) {
                await connection.query(
                    'INSERT INTO objetivo_materia (materia_codigo, nro_objetivo, peso) VALUES (?, ?, ?)', [codigo, obj.nro_objetivo, obj.peso]
                );
            }
        }

        // 3. Insertar calificaciones (usando rangos de peso acumulado)
        if (Array.isArray(calificaciones) && calificaciones.length > 0) {
            for (let cal of calificaciones) {
                await connection.query(
                    'INSERT INTO calificaciones (cod_materia, peso_acu_min, peso_acu_max, calificacion_definitiva) VALUES (?, ?, ?, ?)', [codigo, cal.peso_acu_min, cal.peso_acu_max, cal.calificacion]
                );
            }
        }

        // 4. Crear tabla específica de notas para la materia (dinámica)
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
        await connection.commit();

        res.json({ success: true, message: 'Materia registrada exitosamente.' });
    } catch (err) {
        if (connection) await connection.rollback();
        console.error("Error al registrar materia:", err);
        if (err.code === 'ER_DUP_ENTRY') {
            return res.status(400).json({ success: false, message: 'Ya existe una materia con este código.' });
        }
        res.status(500).json({ success: false, message: 'Error al registrar la materia en la base de datos.' });
    } finally {
        if (connection) connection.release();
    }
});

// --- CORREGIDO: Endpoint PUT para actualizar materia (Soporte para nuevos pesos, usa pool) ---
app.put('/api/materias/:codigoOriginal', async(req, res) => {
    const { codigoOriginal } = req.params;
    // MODIFICACIÓN: Eliminado 'minaprueba' del destructuring
    const { codigo, descripcion, numobj, objetivos, calificaciones } = req.body;

    // MODIFICACIÓN: Eliminado 'minaprueba' de la validación
    if (!descripcion || !numobj) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios básicos (descripción, numobj).' });
    }

    let connection;
    try {
        connection = await pool.getConnection();
        await connection.beginTransaction();

        // 1. Actualizar datos básicos de la materia
        // MODIFICACIÓN: Consulta UPDATE simplificada. Se eliminó 'minaprueba = ?'.
        await connection.query(
            'UPDATE materia SET codigo = ?, descripcion = ?, numobj = ? WHERE codigo = ?', [codigo, descripcion, numobj, codigoOriginal]
        );

        // 2. Sincronizar Objetivos (se usa materia_codigo)
        // Primero eliminamos los objetivos antiguos
        await connection.query('DELETE FROM objetivo_materia WHERE materia_codigo = ?', [codigoOriginal]);
        // Si el código cambió, por seguridad limpiamos también por el nuevo código
        if (codigo !== codigoOriginal) {
            await connection.query('DELETE FROM objetivo_materia WHERE materia_codigo = ?', [codigo]);
        }

        // Luego insertamos los nuevos objetivos
        if (Array.isArray(objetivos)) {
            for (let obj of objetivos) {
                await connection.query(
                    'INSERT INTO objetivo_materia (materia_codigo, nro_objetivo, peso) VALUES (?, ?, ?)', [codigo, obj.nro_objetivo, obj.peso]
                );
            }
        }

        // 3. Sincronizar Calificaciones (se usa cod_materia)
        // Primero eliminamos las calificaciones antiguas
        await connection.query('DELETE FROM calificaciones WHERE cod_materia = ?', [codigoOriginal]);
        if (codigo !== codigoOriginal) {
            await connection.query('DELETE FROM calificaciones WHERE cod_materia = ?', [codigo]);
        }

        // Luego insertamos las nuevas calificaciones
        if (Array.isArray(calificaciones)) {
            for (let cal of calificaciones) {
                await connection.query(
                    'INSERT INTO calificaciones (cod_materia, peso_acu_min, peso_acu_max, calificacion_definitiva) VALUES (?, ?, ?, ?)', [codigo, cal.peso_acu_min, cal.peso_acu_max, cal.calificacion]
                );
            }
        }

        // NOTA: No intentamos renombrar la tabla dinámica aquí para mantener la integridad de los datos históricos.
        // Si se cambia el código, se crea una nueva tabla la primera vez que se intente insertar notas.

        await connection.commit();

        res.json({ success: true, message: 'Materia y sus relaciones actualizadas exitosamente.' });
    } catch (err) {
        if (connection) await connection.rollback();
        console.error("Error al actualizar materia:", err);
        if (err.code === 'ER_DUP_ENTRY') {
            return res.status(400).json({ success: false, message: 'El nuevo código de materia ya está en uso.' });
        }
        res.status(500).json({ success: false, message: 'Error al actualizar la materia en la base de datos.' });
    } finally {
        if (connection) connection.release();
    }
});

// --- CORREGIDO: Endpoint DELETE para eliminar materia ---
app.delete('/api/materias/:codigo', async(req, res) => {
    const materiaCodigo = req.params.codigo;
    let connection;
    try {
        connection = await pool.getConnection();
        await connection.beginTransaction();

        // Eliminar relaciones
        await connection.query('DELETE FROM objetivo_materia WHERE materia_codigo = ?', [materiaCodigo]);
        await connection.query('DELETE FROM calificaciones WHERE cod_materia = ?', [materiaCodigo]);
        // Eliminar materia
        await connection.query('DELETE FROM materia WHERE codigo = ?', [materiaCodigo]);

        // Opcional: No eliminamos la tabla dinámica 'calificacion_XXX' para preservar historial.

        await connection.commit();

        res.json({ success: true, message: 'Materia y sus registros asociados eliminados correctamente.' });
    } catch (err) {
        if (connection) await connection.rollback();
        console.error('Error al eliminar materia:', err);
        res.status(500).json({ success: false, message: 'Error al eliminar la materia de la base de datos.' });
    } finally {
        if (connection) connection.release();
    }
});


// ==========================================
// RUTAS PARA EL MÓDULO DE ALUMNOS (CORREGIDAS)
// ==========================================

// 1. Servir la vista de alumno
app.get('/alumno', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'alumno.html'));
});

// 2. Obtener todos los alumnos ordenados por ID
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

// 3. CORRECCIÓN: Se agrega "/buscar/" para evitar conflicto con /api/alumnos/:cedula
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

// 4. Registrar un nuevo alumno
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

// 5. Actualizar un alumno existente por su ID
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

// 6. Eliminar un alumno por su ID
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

// Ruta para servir la vista de Tareas
app.get('/tarea', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'tarea.html'));
});

// 1. OBTENER TODAS LAS TAREAS
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

// 2. CREAR NUEVA TAREA
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

// 3. ACTUALIZAR TAREA
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

// 4. ELIMINAR TAREA
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

app.get('/tipo_asesoria', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'tipo_asesoria.html'));
});

app.get('/api/tipo_asesoria', (req, res) => {
    const query = 'SELECT * FROM tipoasesoria ORDER BY id ASC';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error al obtener tipos de asesoría:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor' });
        }
        res.json({ success: true, data: results });
    });
});

// 3. Ruta para obtener todas las asesorías registradas (Para llenar la tabla)
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

// 4. Ruta para guardar una nueva asesoría (CON VALIDACIÓN DE DUPLICADOS)
app.post('/api/control_asesoria', (req, res) => {
    const { cedula_alumno, nombre_alumno, codigo_carrera, tipo_asesoria, codigo_materia, cedula_asesor, nombre_asesor } = req.body;

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

        db.query(insertQuery, [cedula_alumno, nombre_alumno, codigo_carrera, tipo_asesoria, codigo_materia, cedula_asesor, nombre_asesor], (err, result) => {
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
    // CORRECCIÓN: Usamos req.session.usuario en lugar de req.session.user
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado. Inicie sesión.' });
    }

    const cedulaAsesorSesion = req.session.usuario.cedula;
    const { fecha_desde, fecha_hasta } = req.query;

    // NOTA: Se asume que la columna en BD es 'cedula_asesor'.
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

// Iniciar Servidor
app.listen(PORT, () => {
    console.log(`🚀 Servidor ejecutándose en http://localhost:${PORT}`);
});