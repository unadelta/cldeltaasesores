const express = require('express');
const router = express.Router();
const path = require('path');
const fs = require('fs');
const multer = require('multer');
const moment = require('moment');

// --- IMPORTACIONES CLAVE QUE FALTABAN ---
const mysqldump = require('mysqldump');
const mysql = require('mysql2/promise');

// const adminAuthMiddleware = require('../middlewares/adminAuth'); // IMPLEMENTAR ESTO

// Configuración de Multer para guardar temporalmente el archivo SQL subido
const upload = multer({
    dest: 'uploads/',
    limits: { fileSize: 10 * 1024 * 1024 } // Limitar a 10MB por seguridad
});


// --- CONFIGURACIÓN DB (Soporte para variables de Railway y locales) ---
const dbConfig = {
    host: process.env.DB_HOST || process.env.MYSQLHOST || 'localhost',
    user: process.env.DB_USER || process.env.MYSQLUSER || 'root',
    password: process.env.DB_PASSWORD || process.env.MYSQLPASSWORD || '',
    database: process.env.DB_NAME || process.env.MYSQLDATABASE || 'asesores',
    port: process.env.DB_PORT || process.env.MYSQLPORT || 3306
};

// Middleware para asegurar que solo el admin acceda a estas rutas
// router.use(adminAuthMiddleware); 


// ==========================================
// RUTA 1: Generar y Descargar Respaldo (Sin comandos del sistema, apto para Railway)
// ==========================================
router.get('/respaldo', async(req, res) => {
    try {
        const dateStr = moment().format('YYYY-MM-DD_HH-mm');
        const fileName = `backup_asesores_${dateStr}.sql`;

        // Carpeta respaldo dentro de public
        const backupDir = path.join(__dirname, '../../public/respaldo');
        const fullPath = path.join(backupDir, fileName);

        // Crear la carpeta automáticamente si no existe
        if (!fs.existsSync(backupDir)) {
            fs.mkdirSync(backupDir, { recursive: true });
        }

        // Generar respaldo usando la librería mysqldump y SSL para Railway
        const dumpResult = await mysqldump({
            connection: {
                host: dbConfig.host,
                port: Number(dbConfig.port),
                user: dbConfig.user,
                password: dbConfig.password,
                database: dbConfig.database,
                ssl: {
                    rejectUnauthorized: false
                }
            },
        });

        // Guardar el contenido SQL en el archivo físico
        fs.writeFileSync(fullPath, dumpResult.dump.sql);
        console.log(`Respaldo creado en: ${fullPath}`);

        // Forzar descarga en el navegador del cliente
        res.download(fullPath, fileName, (err) => {
            if (err) {
                console.error('Error en descarga:', err);
            }

            // Limpieza: Eliminar archivo temporal de la carpeta public/respaldo después de la descarga
            fs.unlink(fullPath, (unlinkErr) => {
                if (unlinkErr) console.error('Error al eliminar respaldo temporal:', unlinkErr);
                else console.log('Respaldo temporal eliminado de public/respaldo.');
            });
        });

    } catch (error) {
        console.error('Error crítico al generar respaldo:', error);
        res.status(500).json({
            success: false,
            message: 'Error al generar respaldo.',
            error: error.message
        });
    }
});


// ==========================================
// RUTA 2: Ejecutar Update desde archivo SQL
// ==========================================
router.post('/update', upload.single('sqlFile'), async(req, res) => {
    if (!req.file) {
        return res.status(400).json({ success: false, message: 'No se subió archivo.' });
    }

    const uploadedFilePath = req.file.path;
    const originalName = req.file.originalname;

    console.log(`Iniciando actualización de DB con archivo: ${originalName}`);

    try {
        const sqlContent = fs.readFileSync(uploadedFilePath, 'utf8');

        // Conexión usando mysql2 con soporte SSL y múltiples sentencias permitidas
        const connection = await mysql.createConnection({
            host: dbConfig.host,
            port: Number(dbConfig.port),
            user: dbConfig.user,
            password: dbConfig.password,
            database: dbConfig.database,
            multipleStatements: true,
            ssl: {
                rejectUnauthorized: false
            }
        });

        await connection.query(sqlContent);
        await connection.end();

        // Limpieza: Eliminar archivo subido temporalmente
        fs.unlink(uploadedFilePath, (unlinkErr) => {
            if (unlinkErr) console.error('Error al eliminar archivo de update temporal:', unlinkErr);
        });

        console.log('Actualización de DB completada exitosamente.');
        res.json({
            success: true,
            message: `El archivo "${originalName}" se ejecutó correctamente en la base de datos.`
        });

    } catch (error) {
        console.error(`Error ejecutando update SQL: ${error}`);

        // Limpiar archivo temporal en caso de error
        if (fs.existsSync(uploadedFilePath)) {
            fs.unlinkSync(uploadedFilePath);
        }

        res.status(500).json({
            success: false,
            message: 'Error crítico al ejecutar el script SQL.',
            error: error.message
        });
    }
});

module.exports = router;