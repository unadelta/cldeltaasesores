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

// Configuración de la Sesión (Actualizada para persistir en navegación)
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


// Ruta raíz: Muestra la pantalla de Login original 
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

            // Se mantiene la estructura 'usuario' original, pero agregamos la 'cedula'
            req.session.usuario = {
                cedula: user.cedula, // <--- Aquí incluimos la cédula
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


// Endpoint para verificar la sesión activa
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

// 1. Ruta para visualizar la vista asesor.html
app.get('/asesor', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'asesor.html'));
});

// 2. Obtener todos los asesores (Read)
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

// 3. Crear un nuevo asesor (Create) - CON VALIDACIÓN DE DUPLICADOS
app.post('/api/asesores', (req, res) => {
    const { cedula, usuario, clave, nombre, email, rol_id } = req.body;

    // Primero verificamos si ya existe la cédula o el usuario
    const sqlVerificar = 'SELECT * FROM asesor WHERE cedula = ? OR usuario = ?';
    db.query(sqlVerificar, [cedula, usuario], (err, results) => {
        if (err) {
            console.error('Error al verificar duplicados:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor' });
        }

        if (results.length > 0) {
            // Evaluamos qué fue lo que se repitió para dar un mensaje exacto
            const existeCedula = results.some(row => row.cedula === cedula);
            const mensaje = existeCedula ?
                'Ya existe un asesor registrado con esta cédula.' :
                'El nombre de usuario ya está en uso. Elija otro.';

            return res.status(400).json({ success: false, message: mensaje });
        }

        // Si no existe, procedemos a insertar (incluyendo cédula y rol_id)
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

// 4. Actualizar un asesor existente (Update)
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

// 5. Eliminar un asesor (Delete)
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

// 1. Ruta para visualizar la vista carrera.html
app.get('/carrera', (req, res) => {
    if (!req.session || (!req.session.usuario && !req.session.user)) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'carrera.html'));
});

// 1.1 Ruta API auxiliar para verificar la sesión desde el frontend de carrera.html
app.get('/api/user-session', (req, res) => {
    if (req.session && (req.session.usuario || req.session.user)) {
        const userData = req.session.usuario || req.session.user;
        // Asegura que devuelva un objeto con la estructura que el frontend lee
        const nombreUsuario = typeof userData === 'object' ? (userData.nombre || userData.username || 'Usuario') : userData;
        res.json({
            authenticated: true,
            user: { nombre: nombreUsuario }
        });
    } else {
        res.json({ authenticated: false });
    }
});

// 2. Obtener todas las carreras (Read - Ordenadas de forma ascendente)
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

// 3. Crear una nueva carrera (Create)
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

// 4. Actualizar una carrera existente (Update)
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

// 5. Eliminar una carrera (Delete)
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
// RUTAS Y LÓGICA PARA EL MÓDULO DE MATERIAS (CRUD COMPLETO + OBJETIVOS)
// ==============================================================================

// 1. Ruta para servir la vista HTML de gestión de materias
app.get('/materia', (req, res) => {
    // Validación de sesión: Solo permite el acceso si el usuario está logueado
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'materia.html'));
});

// 2. Endpoint API para obtener todas las materias con sus objetivos asociados
app.get('/api/materias', (req, res) => {
    const sql = `
        SELECT 
            m.codigo, 
            m.descripcion, 
            m.numobj, 
            m.minaprueba,
            om.nro_objetivo,
            om.peso
        FROM materia m
        LEFT JOIN objetivo_materia om ON m.codigo = om.materia_codigo
        ORDER BY m.descripcion ASC, om.nro_objetivo ASC
    `;

    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error al obtener materias:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor al consultar materias' });
        }

        const materiasMap = {};

        results.forEach(row => {
            if (!materiasMap[row.codigo]) {
                materiasMap[row.codigo] = {
                    codigo: row.codigo,
                    descripcion: row.descripcion,
                    numobj: row.numobj,
                    minaprueba: row.minaprueba,
                    objetivos: []
                };
            }

            if (row.nro_objetivo !== null) {
                materiasMap[row.codigo].objetivos.push({
                    nro_objetivo: row.nro_objetivo,
                    peso: row.peso
                });
            }
        });

        const materiasFinal = Object.values(materiasMap);
        res.json({ success: true, data: materiasFinal });
    });
});

// 3. Endpoint API para verificar si ya existe un código de materia antes de registrar
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

// 4. Endpoint API para registrar una nueva materia (Crear)
app.post('/api/materias', (req, res) => {
    const { codigo, descripcion, numobj, minaprueba, objetivos } = req.body;

    db.beginTransaction(err => {
        if (err) {
            console.error('Error al iniciar transacción:', err);
            return res.status(500).json({ success: false, message: 'Error al iniciar el registro' });
        }

        const sqlMateria = 'INSERT INTO materia (codigo, descripcion, numobj, minaprueba) VALUES (?, ?, ?, ?)';
        db.query(sqlMateria, [codigo, descripcion, numobj, minaprueba], (err, resultMateria) => {
            if (err) {
                return db.rollback(() => {
                    console.error('Error al insertar en materia:', err);
                    res.status(500).json({ success: false, message: 'Error al registrar los datos básicos de la materia' });
                });
            }

            if (objetivos && objetivos.length > 0) {
                const valoresObjetivos = objetivos.map(obj => [codigo, obj.nro_objetivo, obj.peso]);
                const sqlObjetivos = 'INSERT INTO objetivo_materia (materia_codigo, nro_objetivo, peso) VALUES ?';

                db.query(sqlObjetivos, [valoresObjetivos], (err, resultObj) => {
                    if (err) {
                        return db.rollback(() => {
                            console.error('Error al insertar en objetivo_materia:', err);
                            res.status(500).json({ success: false, message: 'Error al registrar los pesos de los objetivos' });
                        });
                    }

                    db.commit(err => {
                        if (err) {
                            return db.rollback(() => {
                                console.error('Error al confirmar transacción:', err);
                                res.status(500).json({ success: false, message: 'Error al finalizar el registro' });
                            });
                        }
                        res.json({ success: true, message: 'Materia y objetivos registrados correctamente' });
                    });
                });
            } else {
                db.commit(err => {
                    if (err) {
                        return db.rollback(() => {
                            console.error('Error al confirmar transacción vacía:', err);
                            res.status(500).json({ success: false, message: 'Error al finalizar el registro' });
                        });
                    }
                    res.json({ success: true, message: 'Materia registrada correctamente (sin objetivos)' });
                });
            }
        });
    });
});

// 5. Endpoint API para actualizar una materia existente (Actualizar - PUT)
app.put('/api/materias/:codigoOriginal', async(req, res) => {
    const { codigoOriginal } = req.params;
    const { codigo, descripcion, numobj, minaprueba, objetivos, calificaciones } = req.body;

    if (!descripcion || !numobj || !minaprueba) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios básicos.' });
    }

    const connection = await db.promise();
    try {
        await connection.beginTransaction();

        // A. Actualizar datos principales de la materia
        await connection.query(
            'UPDATE materia SET codigo = ?, descripcion = ?, numobj = ?, minaprueba = ? WHERE codigo = ?', [codigo, descripcion, numobj, minaprueba, codigoOriginal]
        );

        // B. Borrar objetivos anteriores asociados para reinsertar los actualizados
        await connection.query('DELETE FROM objetivo_materia WHERE materia_codigo = ?', [codigo]);

        if (Array.isArray(objetivos) && objetivos.length > 0) {
            for (let obj of objetivos) {
                await connection.query(
                    'INSERT INTO objetivo_materia (materia_codigo, nro_objetivo, peso) VALUES (?, ?, ?)', [codigo, obj.nro_objetivo, obj.peso]
                );
            }
        }

        // C. Borrar escala de calificaciones anterior para reinsertar la actualizada (si aplica)
        await connection.query('DELETE FROM escala_calificaciones WHERE codigo_materia = ?', [codigo]);

        if (Array.isArray(calificaciones) && calificaciones.length > 0) {
            for (let cal of calificaciones) {
                await connection.query(
                    'INSERT INTO escala_calificaciones (codigo_materia, peso_acumulado, calificacion) VALUES (?, ?, ?)', [codigo, cal.peso_acumulado, cal.calificacion]
                );
            }
        }

        await connection.commit();
        res.json({ success: true, message: 'Materia actualizada exitosamente.' });
    } catch (err) {
        await connection.rollback();
        console.error("Error al actualizar materia:", err);
        res.status(500).json({ success: false, message: 'Error al actualizar la materia en la base de datos.' });
    }
});

// 6. Endpoint API para eliminar una materia (Eliminar)
app.delete('/api/materias/:codigo', (req, res) => {
    const materiaCodigo = req.params.codigo;

    db.beginTransaction(err => {
        if (err) return res.status(500).json({ success: false, message: 'Error al iniciar eliminación' });

        const sqlDelObjetivos = 'DELETE FROM objetivo_materia WHERE materia_codigo = ?';
        db.query(sqlDelObjetivos, [materiaCodigo], (err, resultObj) => {
            if (err) {
                return db.rollback(() => {
                    console.error('Error al eliminar objetivos asociados:', err);
                    res.status(500).json({ success: false, message: 'Error al eliminar los objetivos de la materia' });
                });
            }

            const sqlDelMateria = 'DELETE FROM materia WHERE codigo = ?';
            db.query(sqlDelMateria, [materiaCodigo], (err, resultMateria) => {
                if (err) {
                    return db.rollback(() => {
                        console.error('Error al eliminar materia:', err);
                        res.status(500).json({ success: false, message: 'Error al eliminar el registro principal de la materia' });
                    });
                }

                db.commit(err => {
                    if (err) {
                        return db.rollback(() => {
                            console.error('Error al confirmar eliminación:', err);
                            res.status(500).json({ success: false, message: 'Error al finalizar la eliminación' });
                        });
                    }
                    res.json({ success: true, message: 'Materia y sus objetivos eliminados correctamente' });
                });
            });
        });
    });
});
// 2. ACTUALIZAR UNA MATERIA EXISTENTE (PUT)
app.put('/api/materias/:codigoOriginal', async(req, res) => {
    const { codigoOriginal } = req.params;
    const { codigo, descripcion, numobj, minaprueba, objetivos, calificaciones } = req.body;

    if (!descripcion || !numobj || !minaprueba) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios básicos.' });
    }

    const connection = await db.promise();
    try {
        await connection.beginTransaction();

        // A. Actualizar datos principales de la materia
        await connection.query(
            'UPDATE materia SET codigo = ?, descripcion = ?, numobj = ?, minaprueba = ? WHERE codigo = ?', [codigo, descripcion, numobj, minaprueba, codigoOriginal]
        );

        // B. Borrar objetivos anteriores asociados para reinsertar los actualizados
        await connection.query('DELETE FROM objetivo_materia WHERE materia_codigo = ?', [codigo]);

        if (Array.isArray(objetivos) && objetivos.length > 0) {
            for (let obj of objetivos) {
                await connection.query(
                    'INSERT INTO objetivo_materia (materia_codigo, nro_objetivo, peso) VALUES (?, ?, ?)', [codigo, obj.nro_objetivo, obj.peso]
                );
            }
        }

        // C. Borrar escala de calificaciones anterior para reinsertar la actualizada
        await connection.query('DELETE FROM escala_calificaciones WHERE codigo_materia = ?', [codigo]);

        if (Array.isArray(calificaciones) && calificaciones.length > 0) {
            for (let cal of calificaciones) {
                await connection.query(
                    'INSERT INTO escala_calificaciones (codigo_materia, peso_acumulado, calificacion) VALUES (?, ?, ?)', [codigo, cal.peso_acumulado, cal.calificacion]
                );
            }
        }

        await connection.commit();
        res.json({ success: true, message: 'Materia actualizada exitosamente.' });
    } catch (err) {
        await connection.rollback();
        console.error("Error al actualizar materia:", err);
        res.status(500).json({ success: false, message: 'Error al actualizar la materia en la base de datos.' });
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

// 3. CORRECCIÓN: Se agrega "/buscar/" para evitar conflicto con /api/alumnos/:id
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
    res.sendFile(__dirname + '/views/tarea.html'); // Ajusta la ruta '/public/' según dónde tengas guardado tu archivo HTML
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

// 1. Ruta para servir la vista de asesoría
app.get('/asesoria', (req, res) => {
    // Asegúrate de que el archivo asesoria.html esté en la carpeta 'views'
    res.sendFile(path.join(__dirname, 'views', 'asesoria.html'));
});

// 2. Ruta para buscar un alumno específico por su cédula
// Esta es la ruta que usa el botón "Buscar" en el modal
app.get('/api/alumnos/:cedula', (req, res) => {
    const { cedula } = req.params;

    // Asumimos que tienes una tabla llamada 'alumno' y otra 'carrera' (opcional, si haces un JOIN)
    // Ajusta los nombres de la tabla y las columnas si en tu base de datos se llaman diferente.
    const query = `
        SELECT a.cedula, a.nombre, a.codigo_carrera, c.descripcion_carrera
        FROM alumno a
        LEFT JOIN carrera c ON a.codigo_carrera = c.codigo_carrera
        WHERE a.cedula = ?
    `;

    db.query(query, [cedula], (err, results) => {
        if (err) {
            console.error('Error al buscar alumno:', err);
            return res.status(500).json({ success: false, error: err.message });
        }

        if (results.length > 0) {
            res.json({ success: true, data: results[0] });
        } else {
            res.json({ success: false, data: null }); // No se encontró el alumno
        }
    });
});

// 3. Ruta para obtener todas las asesorías registradas (Para llenar la tabla)
app.get('/api/control_asesoria', (req, res) => {
    // Trae las asesorías ordenadas desde la más reciente
    const query = 'SELECT * FROM control_asesoria ORDER BY id DESC';

    db.query(query, (err, results) => {
        if (err) {
            console.error('Error al obtener asesorías:', err);
            return res.status(500).json({ success: false, error: err.message });
        }
        res.json({ success: true, data: results });
    });
});

// 4. Ruta para guardar una nueva asesoría en la base de datos


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

    // Se utiliza NOW() de MySQL para guardar la fecha y hora exacta del servidor
    const query = `
        INSERT INTO control_asesoria 
        (cedula_alumno, nombre_alumno, codigo_carrera, tipo_asesoria, codigo_materia, cedula_asesor, nombre_asesor, fecha_hora) 
        VALUES (?, ?, ?, ?, ?, ?, ?, NOW())
    `;

    db.query(query, [
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



// 4. Ruta para guardar una nueva asesoría en la base de datos
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

    // 1. Primero verificamos si ya existe un registro similar
    // Ajusta esta lógica según tus reglas de negocio. 
    // Aquí verificamos si este alumno ya tiene una asesoría de este tipo/materia hoy.
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

        // Si results.length > 0, significa que ya existe una asesoría igual hoy
        if (results.length > 0) {
            return res.status(200).json({
                success: false,
                error_code: 'DUPLICATED',
                message: 'Ya existe una asesoría registrada para este alumno en esta materia hoy.'
            });
        }

        // 2. Si no existe, procedemos a insertar
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
    // Asegúrate de que el archivo asesoria.html esté en la carpeta 'views'
    res.sendFile(path.join(__dirname, 'views', 'reporasesoria.html'));
});



app.get('/api/controlasesoria', (req, res) => {
    // CORRECCIÓN: Usamos req.session.usuario en lugar de req.session.user
    if (!req.session || !req.session.usuario) {
        return res.status(401).json({ success: false, message: 'No autorizado. Inicie sesión.' });
    }

    const cedulaAsesorSesion = req.session.usuario.cedula;
    let { fecha_desde, fecha_hasta } = req.query;

    console.log("--- FILTRO REPORTE ASESORÍAS ---");
    console.log("Cédula Asesor Sesión:", cedulaAsesorSesion);
    console.log("Fecha Desde:", fecha_desde);
    console.log("Fecha Hasta:", fecha_hasta);

    // NOTA: Si en tu tabla control_asesoria el campo se llama 'cedula_asesor', déjalo así. 
    // Si se llama 'cedula', cámbialo en la consulta SQL.
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
        console.log(`Registros encontrados para este asesor: ${results.length}`);
        res.json({ success: true, data: results });
    });
});

// ==========================================
// RUTAS DE MATERIAS (server.js o rutas de Express)
// ==========================================
const router = express.Router();



// 1. OBTENER TODAS LAS MATERIAS CON SUS OBJETIVOS Y ESCALAS
router.get('/api/materias', async(req, res) => {
    try {
        // Ejemplo usando una base de datos SQL (ajusta según tu conexión y ORM/driver como mysql2, pg, etc.)
        // Primero obtenemos todas las materias
        const [materias] = await db.query('SELECT codigo, descripcion, numobj, minaprueba FROM materias');

        // Para cada materia, buscamos sus objetivos y su escala de calificaciones asociada
        const materiasCompletas = await Promise.all(materias.map(async(materia) => {
            const [objetivos] = await db.query('SELECT nro_objetivo, peso FROM objetivos_materia WHERE codigo_materia = ?', [materia.codigo]);
            const [calificaciones] = await db.query('SELECT peso_acumulado, calificacion FROM escala_calificaciones WHERE codigo_materia = ?', [materia.codigo]);

            return {
                ...materia,
                objetivos,
                calificaciones
            };
        }));

        res.json({
            success: true,
            data: materiasCompletas
        });
    } catch (err) {
        console.error("Error al obtener materias:", err);
        res.status(500).json({ success: false, message: 'Error interno del servidor' });
    }
});

// 2. CREAR / GUARDAR UNA NUEVA MATERIA COMPLETA (Con objetivos y escala)
router.post('/api/materias', async(req, res) => {
    const { codigo, descripcion, numobj, minaprueba, objetivos, calificaciones } = req.body;

    // Validación básica
    if (!codigo || !descripcion || !numobj || !minaprueba) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios básicos.' });
    }

    // Usamos transacciones si tu base de datos lo soporta para asegurar integridad
    const connection = await db.getConnection(); // Asumiendo pool de conexiones
    try {
        await connection.beginTransaction();

        // A. Insertar la materia principal
        await connection.query(
            'INSERT INTO materias (codigo, descripcion, numobj, minaprueba) VALUES (?, ?, ?, ?)', [codigo, descripcion, numobj, minaprueba]
        );

        // B. Insertar los objetivos de la materia
        if (Array.isArray(objetivos)) {
            for (let obj of objetivos) {
                await connection.query(
                    'INSERT INTO objetivos_materia (codigo_materia, nro_objetivo, peso) VALUES (?, ?, ?)', [codigo, obj.nro_objetivo, obj.peso]
                );
            }
        }

        // C. Insertar la escala de calificaciones
        if (Array.isArray(calificaciones)) {
            for (let cal of calificaciones) {
                await connection.query(
                    'INSERT INTO escala_calificaciones (codigo_materia, peso_acumulado, calificacion) VALUES (?, ?, ?)', [codigo, cal.peso_acumulado, cal.calificacion]
                );
            }
        }

        await connection.commit();
        connection.release();

        res.json({ success: true, message: 'Materia guardada exitosamente.' });
    } catch (err) {
        await connection.rollback();
        connection.release();
        console.error("Error al guardar materia:", err);

        // Manejar error común de llave primaria duplicada (código ya existe)
        if (err.code === 'ER_DUP_ENTRY') {
            return res.status(400).json({ success: false, message: 'El código de materia ya existe en el sistema.' });
        }

        res.status(500).json({ success: false, message: 'Error al registrar la materia en la base de datos.' });
    }
});

// 3. ELIMINAR UNA MATERIA (Por código)
router.delete('/api/materias/:codigo', async(req, res) => {
    const { codigo } = req.params;

    try {
        // Gracias a las llaves foráneas con ON DELETE CASCADE en tu base de datos, 
        // al borrar la materia se deberían borrar sus objetivos y escalas automáticamente.
        const [resultado] = await db.query('DELETE FROM materias WHERE codigo = ?', [codigo]);

        if (resultado.affectedRows === 0) {
            return res.status(404).json({ success: false, message: 'La materia no fue encontrada.' });
        }

        res.json({ success: true, message: 'Materia eliminada correctamente.' });
    } catch (err) {
        console.error("Error al eliminar materia:", err);
        res.status(500).json({ success: false, message: 'Error interno al intentar eliminar.' });
    }
});

module.exports = router;







// Iniciar Servidor
app.listen(PORT, () => {
    console.log(`🚀 Servidor ejecutándose en http://localhost:${PORT}`);
});