const express = require('express');
const router = express.Router();
const path = require('path');
const fs = require('fs');
const multer = require('multer');
const moment = require('moment');
const mysql = require('mysql2/promise');

// Ajusta esta ruta si tu archivo de configuración de base de datos está en otra carpeta
const dbConfig = require('../config/db');

// Configuración de Multer para la subida temporal de archivos SQL (Actualizaciones)
const uploadDir = path.join(process.cwd(), 'public', 'uploads');
if (!fs.existsSync(uploadDir)) {
    fs.mkdirSync(uploadDir, { recursive: true });
}

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, uploadDir);
    },
    filename: (req, file, cb) => {
        cb(null, `update_${Date.now()}${path.extname(file.originalname)}`);
    }
});
const upload = multer({ storage: storage });

// ==========================================
// RUTA 1: Generar y Descargar Respaldo (Nativo y Robusto)
// ==========================================
router.get('/respaldo', async(req, res) => {
    let connection;
    try {
        const dateStr = moment().format('YYYY-MM-DD_HH-mm');
        const fileName = `backup_asesores_${dateStr}.sql`;

        // Usar ruta absoluta segura basada en process.cwd() para Railway
        const backupDir = path.join(process.cwd(), 'public', 'respaldo');
        const fullPath = path.join(backupDir, fileName);

        if (!fs.existsSync(backupDir)) {
            fs.mkdirSync(backupDir, { recursive: true });
        }

        // Conectarnos usando mysql2/promise con soporte SSL para Railway
        connection = await mysql.createConnection({
            host: dbConfig.host,
            port: Number(dbConfig.port),
            user: dbConfig.user,
            password: dbConfig.password,
            database: dbConfig.database,
            ssl: { rejectUnauthorized: false }
        });

        let sqlDump = `-- Respaldo de Base de Datos: ${dbConfig.database}\n`;
        sqlDump += `-- Fecha: ${moment().format('YYYY-MM-DD HH:mm:ss')}\n\n`;
        sqlDump += `SET FOREIGN_KEY_CHECKS=0;\n\n`;

        // Obtener todas las tablas de la base de datos
        const [tablesRows] = await connection.query('SHOW TABLES');
        const tableKeyName = Object.keys(tablesRows[0])[0];

        for (const row of tablesRows) {
            const tableName = row[tableKeyName];

            // Estructura de la tabla
            const [createTableRows] = await connection.query(`SHOW CREATE TABLE \`${tableName}\``);
            sqlDump += `DROP TABLE IF EXISTS \`${tableName}\`;\n`;
            sqlDump += `${createTableRows[0]['Create Table']};\n\n`;

            // Datos de la tabla
            const [dataRows] = await connection.query(`SELECT * FROM \`${tableName}\``);
            if (dataRows.length > 0) {
                for (const dataRow of dataRows) {
                    const columns = Object.keys(dataRow).map(c => `\`${c}\``).join(', ');
                    const values = Object.values(dataRow).map(val => {
                        if (val === null) return 'NULL';
                        if (typeof val === 'number') return val;
                        if (val instanceof Date) return `'${moment(val).format('YYYY-MM-DD HH:mm:ss')}'`;
                        return `'${String(val).replace(/'/g, "''").replace(/\\/g, "\\\\")}'`;
                    }).join(', ');

                    sqlDump += `INSERT INTO \`${tableName}\` (${columns}) VALUES (${values});\n`;
                }
                sqlDump += `\n`;
            }
        }

        sqlDump += `SET FOREIGN_KEY_CHECKS=1;\n`;

        // Escribir el archivo físico en la ruta absoluta
        fs.writeFileSync(fullPath, sqlDump, 'utf8');
        await connection.end();

        console.log(`Respaldo nativo creado exitosamente en: ${fullPath}`);

        // Forzar descarga en el navegador del cliente
        res.download(fullPath, fileName, (err) => {
            if (err) console.error('Error en descarga:', err);

            // Limpieza: Eliminar archivo temporal después de la descarga
            fs.unlink(fullPath, (unlinkErr) => {
                if (unlinkErr) console.error('Error al eliminar respaldo temporal:', unlinkErr);
            });
        });

    } catch (error) {
        if (connection) await connection.end().catch(() => {});
        console.error('Error crítico al generar respaldo nativo:', error);
        res.status(500).json({
            success: false,
            message: 'Error al generar respaldo.',
            error: error.message
        });
    }
});
// ==========================================
// RUTA 2: Sincronización por Sentencias (Filtrado Inteligente)
// ==========================================
router.post('/update', upload.single('sqlFile'), async(req, res) => {
    if (!req.file) {
        return res.status(400).json({ success: false, message: 'No se subió archivo.' });
    }

    const uploadedFilePath = req.file.path;
    const originalName = req.file.originalname;

    console.log(`Procesando archivo SQL instrucción por instrucción: ${originalName}`);

    let connection;
    try {
        const sqlContent = fs.readFileSync(uploadedFilePath, 'utf8');

        // 1. Dividir el archivo SQL instrucción por instrucción usando el punto y coma (;)
        const statements = sqlContent.split(';');
        const cleanStatements = [];

        for (let stmt of statements) {
            const trimmed = stmt.trim();
            if (!trimmed) continue;

            const upper = trimmed.toUpperCase();

            // 2. Descartar cualquier sentencia que tenga relación con crear, borrar o bloquear tablas
            if (
                upper.includes('CREATE TABLE') ||
                upper.includes('DROP TABLE') ||
                upper.includes('LOCK TABLES') ||
                upper.includes('UNLOCK TABLES')
            ) {
                continue; // Se omite esta sentencia para proteger las tablas existentes
            }

            // 3. Transformar INSERT INTO en INSERT IGNORE INTO para evitar duplicados y sumar registros
            let processedStmt = trimmed;
            if (upper.startsWith('INSERT INTO')) {
                processedStmt = processedStmt.replace(/INSERT INTO/gi, 'INSERT IGNORE INTO');
            }

            cleanStatements.push(processedStmt);
        }

        // Volver a unir las sentencias limpias
        const finalSql = cleanStatements.join(';\n') + ';';

        // 4. Conectarnos a la base de datos
        connection = await mysql.createConnection({
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

        // 5. Ejecutar exclusivamente las sentencias de datos puras
        await connection.query(finalSql);
        await connection.end();

        // Limpieza del archivo temporal
        fs.unlink(uploadedFilePath, (unlinkErr) => {
            if (unlinkErr) console.error('Error al eliminar archivo temporal:', unlinkErr);
        });

        console.log('Sincronización de datos completada exitosamente.');
        res.json({
            success: true,
            message: `El archivo "${originalName}" se procesó e integró correctamente en las tablas existentes.`
        });

    } catch (error) {
        console.error(`Error en la sincronización SQL: ${error}`);

        if (connection) await connection.end().catch(() => {});

        if (fs.existsSync(uploadedFilePath)) {
            fs.unlinkSync(uploadedFilePath);
        }

        res.status(500).json({
            success: false,
            message: 'Error al procesar la sincronización de datos.',
            error: error.message
        });
    }
});
module.exports = router;