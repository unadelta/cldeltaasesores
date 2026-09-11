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
// RUTA DEL DASHBOARD Y MÓDULOS PRINCIPALES
// ==========================================

app.get('/dashboard', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'dashboard.html'));
});

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

// ==========================================
// RUTAS Y LÓGICA PARA EL MÓDULO DE MATERIAS
// ==========================================

app.get('/materia', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'materia.html'));
});

app.get('/api/materias', async(req, res) => {
    try {
        const connection = await db.promise();
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

app.post('/api/materias', async(req, res) => {
    const { codigo, descripcion, numobj, minaprueba, objetivos, calificaciones } = req.body;

    if (!codigo || !descripcion || !numobj || !minaprueba) {
        return res.status(400).json({ success: false, message: 'Faltan campos obligatorios básicos.' });
    }

    try {
        await db.promise().query(
            'INSERT INTO materia (codigo, descripcion, numobj, minaprueba) VALUES (?, ?, ?, ?)', [codigo, descripcion, numobj, minaprueba]
        );

        if (Array.isArray(objetivos) && objetivos.length > 0) {
            for (let obj of objetivos) {
                await db.promise().query(
                    'INSERT INTO objetivo_materia (materia_codigo, nro_objetivo, peso) VALUES (?, ?, ?)', [codigo, obj.nro_objetivo, obj.peso]
                );
            }
        }

        if (Array.isArray(calificaciones) && calificaciones.length > 0) {
            for (let cal of calificaciones) {
                await db.promise().query(
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
                nota_final_letra VARCHAR(50) DEFAULT '',
                semestre VARCHAR(50) DEFAULT ''
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        `;

        await db.promise().query(sqlCrearTablaEspecifica);

        res.json({ success: true, message: 'Materia registrada y su tabla de notas específica fue creada exitosamente.' });
    } catch (err) {
        console.error("Error al registrar materia y crear su tabla:", err);
        res.status(500).json({ success: false, message: 'Error al registrar la materia o crear su estructura en la base de datos.' });
    }
});

// ==========================================
// MÓDULO DE ALUMNOS
// ==========================================

app.get('/alumno', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'alumno.html'));
});

app.get('/api/alumnos', (req, res) => {
    const query = 'SELECT id, cedula, nombre, codigo_carrera, descripcion_carrera FROM alumno ORDER BY id DESC';
    db.query(query, (err, results) => {
        if (err) {
            console.error('Error al obtener alumnos:', err);
            return res.status(500).json({ success: false, error: err.message });
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

app.get('/api/sesion-usuario', (req, res) => {
    if (req.session && req.session.usuario) {
        res.json({ success: true, nombre: req.session.usuario.nombre || req.session.usuario });
    } else {
        res.json({ success: false, nombre: 'Invitado' });
    }
});








// Iniciar Servidor
app.listen(PORT, () => {
    console.log(`🚀 Servidor ejecutándose en http://localhost:${PORT}`);
});