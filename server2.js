const express = require('express');
const mysql = require('mysql2');
require('dotenv').config();
const path = require('path');
const fs = require('fs');
const cors = require('cors');
const session = require('express-session');

const app = express();

// ==========================================
// 1. MIDDLEWARES GLOBALES Y SESIÓN (¡DEBEN IR PRIMERO!)
// ==========================================
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(session({
    secret: 'asesores_una_clave_secreta_2026',
    resave: false,
    saveUninitialized: false,
    cookie: { secure: false } // false para entorno local HTTP en XAMPP
}));

// ==========================================
// 2. CONFIGURACIÓN DE CONEXIÓN DUAL INTELIGENTE
// ==========================================
const isProduction = process.env.NODE_ENV === 'production';

const dbHost = isProduction ? process.env.MYSQLHOST : (process.env.DB_HOST || 'localhost');
const dbUser = isProduction ? process.env.MYSQLUSER : (process.env.DB_USER || 'root');
const dbPassword = isProduction ? process.env.MYSQLPASSWORD : (process.env.DB_PASSWORD !== undefined ? process.env.DB_PASSWORD : '');
const dbName = isProduction ? (process.env.MYSQLDATABASE || 'asesores') : (process.env.DB_NAME || 'asesores');
const dbPort = Number(isProduction ? (process.env.MYSQLPORT || 4000) : (process.env.DB_PORT || 3306));

const poolConfig = {
    host: dbHost,
    user: dbUser,
    password: dbPassword,
    database: dbName,
    port: dbPort,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
    connectTimeout: 10000,
    ...(isProduction && {
        ssl: {
            rejectUnauthorized: false
        }
    })
};

// Creamos el pool estándar compatible con callbacks y promesas
const pool = mysql.createPool(poolConfig);

const db = {
    query: (...args) => pool.query(...args),
    execute: (...args) => pool.execute(...args),
    getConnection: (cb) => pool.getConnection(cb),
    promise: () => pool.promise()
};

// Prueba de conexión al arrancar
pool.getConnection((err, connection) => {
    if (err) {
        console.error('❌ ERROR de conexión a la base de datos:', err.message);
        if (!isProduction && err.code === 'ECONNREFUSED') {
            console.error('💡 Consejo: Asegúrate de tener encendido MySQL en el panel de XAMPP.');
        }
    } else {
        if (isProduction) {
            console.log(`✅ [PRODUCCIÓN] Conectado exitosamente a TiDB Cloud ☁️ [Host: ${dbHost}]`);
        } else {
            console.log(`✅ [DESARROLLO LOCAL] Conectado exitosamente a XAMPP 🏠 [Host: ${dbHost}:${dbPort}]`);
        }
        connection.release();
    }
});

module.exports = db;

// Importar rutas secundarias si las usas
const dbAdminRoutes = require('./routes/db_admin.routes');
app.use('/api/db', dbAdminRoutes);

// ==========================================
// 3. RUTAS Y CONTROLADORES DE LA APLICACIÓN
// ==========================================

app.get('/', (req, res) => {
    if (req.session && req.session.usuario) {
        return res.redirect('/dashboard');
    }
    res.sendFile(path.join(__dirname, 'views', 'login.html'));
});

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

app.get('/api/user-session', (req, res) => {
    if (req.session && req.session.usuario) {
        res.json({ authenticated: true, user: req.session.usuario });
    } else {
        res.json({ authenticated: false });
    }
});

app.get('/api/sesion-usuario', (req, res) => {
    if (req.session && req.session.usuario) {
        res.json({ success: true, nombre: req.session.usuario.nombre || req.session.usuario });
    } else {
        res.json({ success: false, nombre: 'Invitado' });
    }
});

app.get('/dashboard', (req, res) => {
    if (!req.session || !req.session.usuario) {
        return res.redirect('/');
    }
    res.sendFile(path.join(__dirname, 'views', 'dashboard.html'));
});

// ... (El resto de tus rutas de asesores, materias, alumnos, etc., continúan aquí abajo de manera idéntica)

// ==========================================
// INICIALIZACIÓN DEL SERVIDOR
// ==========================================
const PORT = process.env.PORT || 3000;
app.listen(PORT, '0.0.0.0', () => {
    console.log(`🚀 Servidor ejecutándose en el puerto ${PORT}`);
});