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
    resave: false,
    saveUninitialized: false,
    cookie: { secure: false }
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

// Ruta raíz: Muestra la pantalla de Login
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'views', 'login.html'));
});

// POST: Procesar el inicio de sesión con tabla 'asesor' (campos: usuario y clave)
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

            // Guardamos la sesión con los datos del asesor
            req.session.usuario = {
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
    // Valida que exista sesión antes de mostrar el dashboard (opcional, puedes quitar el if si prefieres acceso libre temporal)
    if (!req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'dashboard.html'));
});


// ==========================================
// RUTA Y CRUD COMPLETO PARA EL MÓDULO ASESORES
// ==========================================

// 1. Ruta para visualizar la vista asesor.html (con validación de sesión)
app.get('/asesor', (req, res) => {
    if (!req.session || !req.session.user) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'asesor.html'));
});

// 2. Obtener todos los asesores (Read)
app.get('/api/asesores', (req, res) => {
    const sql = 'SELECT * FROM asesor';
    db.query(sql, (err, results) => {
        if (err) {
            console.error('Error al obtener asesores:', err);
            return res.status(500).json({ success: false, message: 'Error en el servidor al consultar asesores' });
        }
        res.json({ success: true, data: results });
    });
});

// 3. Crear un nuevo asesor (Create)
app.post('/api/asesores', (req, res) => {
    const { usuario, clave, nombre, email } = req.body;
    const sql = 'INSERT INTO asesor (usuario, clave, nombre, email) VALUES (?, ?, ?, ?)';
    db.query(sql, [usuario, clave, nombre, email], (err, result) => {
        if (err) {
            console.error('Error al crear asesor:', err);
            return res.status(500).json({ success: false, message: 'Error al registrar el asesor en la base de datos' });
        }
        res.json({ success: true, message: 'Asesor registrado exitosamente', id: result.insertId });
    });
});

// 4. Actualizar un asesor existente (Update)
app.put('/api/asesores/:id', (req, res) => {
    const { id } = req.params;
    const { usuario, clave, nombre, email } = req.body;
    const sql = 'UPDATE asesor SET usuario = ?, clave = ?, nombre = ?, email = ? WHERE id = ?';
    db.query(sql, [usuario, clave, nombre, email, id], (err, result) => {
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



// Iniciar Servidor
app.listen(PORT, () => {
    console.log(`🚀 Servidor ejecutándose en http://localhost:${PORT}`);
});