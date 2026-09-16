const express = require('express');
const router = express.Router();
const { exec } = require('child_process');
const path = require('path');
const fs = require('fs');
const multer = require('multer');
const moment = require('moment');
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
// RUTA 1: Generar y Descargar Respaldo
// ==========================================
router.get('/respaldo', (req, res) => {
    const dateStr = moment().format('YYYY-MM-DD_HH-mm');
    const fileName = `backup_asesores_${dateStr}.sql`;
    const backupDir = path.join(__dirname, '../../temp_backups'); // Carpeta temporal segura
    const fullPath = path.join(backupDir, fileName);

    // Crear carpeta si no existe
    if (!fs.existsSync(backupDir)) {
        fs.mkdirSync(backupDir, { recursive: true });
    }

    // Comando mysqldump (Requiere mysql-client instalado en el server)
    // Se usa --skip-comments para un archivo más limpio y --set-charset
    const command = `mysqldump -h ${dbConfig.host} -P ${dbConfig.port} -u ${dbConfig.user} -p"${dbConfig.password}" --single-transaction --routines ${dbConfig.database} > "${fullPath}"`;

    exec(command, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error de respaldo: ${error}`);
            return res.status(500).json({ success: false, message: 'Error al generar respaldo.', error: stderr });
        }

        console.log(`Respaldo creado en: ${fullPath}`);

        // Forzar descarga
        res.download(fullPath, fileName, (err) => {
            if (err) {
                console.error('Error en descarga:', err);
            }

            // Limpieza: Eliminar archivo temporal después de la descarga
            fs.unlink(fullPath, (unlinkErr) => {
                if (unlinkErr) console.error('Error al eliminar respaldo temporal:', unlinkErr);
                else console.log('Respaldo temporal eliminado.');
            });
        });
    });
});


// ==========================================
// RUTA 2: Ejecutar Update desde archivo SQL
// ==========================================
router.post('/update', upload.single('sqlFile'), (req, res) => {
    if (!req.file) {
        return res.status(400).json({ success: false, message: 'No se subió archivo.' });
    }

    const uploadedFilePath = req.file.path;
    const originalName = req.file.originalname;

    console.log(`Iniciando actualización de DB con archivo: ${originalName}`);

    // Comando para importar el SQL usando el cliente mysql
    // mysql -u user -p'pass' db_name < ruta_archivo.sql
    const command = `mysql -h ${dbConfig.host} -P ${dbConfig.port} -u ${dbConfig.user} -p"${dbConfig.password}" ${dbConfig.database} < "${uploadedFilePath}"`;

    exec(command, (error, stdout, stderr) => {

        // Limpieza: Eliminar archivo subido inmediatamente
        fs.unlink(uploadedFilePath, (unlinkErr) => {
            if (unlinkErr) console.error('Error al eliminar archivo de update temporal:', unlinkErr);
        });

        if (error) {
            console.error(`Error ejecutando update SQL: ${error}`);
            // El stderr contendrá el error de sintaxis SQL específico
            return res.status(500).json({
                success: false,
                message: 'Error crítico al ejecutar el script SQL.',
                error: stderr // Esto es vital para que el admin sepa qué falló
            });
        }

        console.log('Actualización de DB completada exitosamente.');
        res.json({
            success: true,
            message: `El archivo "${originalName}" se ejecutó correctamente en la base de datos.`
        });
    });
});

module.exports = router;