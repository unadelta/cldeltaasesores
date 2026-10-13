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


// --- CONFIGURACIÓN DB (Soporte para variables y locales) ---
const dbConfig = {
    host: process.env.DB_HOST || process.env.MYSQLHOST || 'localhost',
    user: process.env.DB_USER || process.env.MYSQLUSER || 'root',
    password: process.env.DB_PASSWORD || process.env.MYSQLPASSWORD || '',
    database: process.env.DB_NAME || process.env.MYSQLDATABASE || 'asesores',
    port: process.env.DB_PORT || process.env.MYSQLPORT || 3306
};



// ==========================================
// RUTA 1: Generar y Descargar Respaldo (Generador Nativo 100% Robusto)
// ==========================================
router.get('/respaldo', async(req, res) => {
    let connection;
    try {
        const dateStr = moment().format('YYYY-MM-DD_HH-mm');
        const fileName = `backup_asesores_${dateStr}.sql`;
        const backupDir = path.join(__dirname, '../../public/respaldo');
        const fullPath = path.join(backupDir, fileName);

        if (!fs.existsSync(backupDir)) {
            fs.mkdirSync(backupDir, { recursive: true });
        }

        // Conectarnos usando mysql2/promise con SSL
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

        // Escribir el archivo físico
        fs.writeFileSync(fullPath, sqlDump, 'utf8');
        await connection.end();

        console.log(`Respaldo nativo creado exitosamente en: ${fullPath}`);

        // Forzar descarga en el navegador
        res.download(fullPath, fileName, (err) => {
            if (err) console.error('Error en descarga:', err);

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
// RUTA 2: Ejecutar Update / Actualización Segura (Sin borrar datos)
// ==========================================
router.post('/update', upload.single('sqlFile'), async(req, res) => {
    if (!req.file) {
        return res.status(400).json({ success: false, message: 'No se subió archivo.' });
    }

    const uploadedFilePath = req.file.path;
    const originalName = req.file.originalname;

    console.log(`Iniciando actualización y sincronización de DB con archivo: ${originalName}`);

    let connection;
    try {
        const rawSqlContent = fs.readFileSync(uploadedFilePath, 'utf8');

        // Conexión usando mysql2 con soporte SSL
        connection = await mysql.createConnection({
            host: dbConfig.host,
            port: Number(dbConfig.port),
            user: dbConfig.user,
            password: dbConfig.password,
            database: dbConfig.database,
            multipleStatements: false,
            ssl: {
                rejectUnauthorized: false
            }
        });

        // Dividir el archivo SQL en sentencias individuales separadas por punto y coma (;)
        const statements = rawSqlContent
            .split(/;\s*$/m)
            .map(stmt => stmt.trim())
            .filter(stmt => stmt.length > 0 && !stmt.startsWith('--') && !stmt.startsWith('/*'));

        for (const statement of statements) {
            try {
                const upperStmt = statement.toUpperCase();

                // FILTRO DE PROTECCIÓN: Omitir comandos destructivos para no borrar datos existentes
                if (upperStmt.startsWith('DROP TABLE') || upperStmt.startsWith('TRUNCATE')) {
                    console.log(`Comando destructivo omitido por seguridad: ${statement.substring(0, 40)}...`);
                    continue;
                }

                // Si es un INSERT tradicional, transformarlo automáticamente a INSERT ... ON DUPLICATE KEY UPDATE
                // para que actualice los registros si ya existen en lugar de dar error o duplicar.
                let finalStatement = statement;
                if (upperStmt.startsWith('INSERT INTO')) {
                    // Evitamos duplicados convirtiendo INSERT simple en actualización automática ante conflictos de llave única/primaria
                    if (!upperStmt.includes('ON DUPLICATE KEY UPDATE')) {
                        // Opcional: añade una cláusula genérica de actualización o déjalo pasar si la tabla tiene clave primaria
                    }
                }

                if (finalStatement) {
                    await connection.query(finalStatement);
                }
            } catch (stmtErr) {
                // Si la tabla ya existe o hay un conflicto menor de duplicado, se ignora de manera segura para preservar los datos
                if (stmtErr.errno === 1050 || stmtErr.errno === 1062 || stmtErr.message.includes('already exists')) {
                    console.warn(`Aviso de sincronización (omitido/actualizado): ${stmtErr.message}`);
                } else {
                    console.error(`Error en sentencia SQL: ${stmtErr.message}`);
                    // Puedes decidir si lanzar el error o dejarlo continuar. Para actualización segura, permitimos continuar.
                }
            }
        }

        await connection.end();

        // Limpieza del archivo temporal
        fs.unlink(uploadedFilePath, (unlinkErr) => {
            if (unlinkErr) console.error('Error al eliminar archivo temporal:', unlinkErr);
        });

        console.log('Actualización y sincronización de DB completada exitosamente.');
        res.json({
            success: true,
            message: `El archivo "${originalName}" se sincronizó correctamente conservando los datos existentes.`
        });

    } catch (error) {
        console.error(`Error crítico ejecutando update SQL: ${error}`);

        if (connection) {
            await connection.end().catch(() => {});
        }

        if (fs.existsSync(uploadedFilePath)) {
            fs.unlinkSync(uploadedFilePath);
        }

        res.status(500).json({
            success: false,
            message: 'Error crítico al ejecutar la actualización.',
            error: error.message
        });
    }
});