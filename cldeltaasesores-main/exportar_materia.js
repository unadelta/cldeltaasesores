const mysql = require('mysql2');
const fs = require('fs');
require('dotenv').config();

// Configuración de la conexión utilizando las mismas variables de tu entorno
const pool = mysql.createPool({
    host: process.env.MYSQLHOST || process.env.DB_HOST || 'localhost',
    user: process.env.MYSQLUSER || process.env.DB_USER || 'root',
    password: process.env.MYSQLPASSWORD !== undefined ? process.env.MYSQLPASSWORD : (process.env.DB_PASSWORD || ''),
    database: process.env.MYSQLDATABASE || process.env.DB_NAME || 'asesores',
    port: process.env.MYSQLPORT || process.env.DB_PORT || 3306
});

const db = pool.promise();

async function exportarMaterias() {
    try {
        console.log('⏳ Conectando a la base de datos y consultando la tabla "materia_una"...');

        // Consultar todas las materias ordenadas por código
        const [rows] = await db.query('SELECT id, codigo, descripcion FROM materia_una ORDER BY codigo ASC');

        if (rows.length === 0) {
            console.log('⚠️ No se encontraron registros en la tabla materia_una.');
            process.exit(0);
        }

        // 1. Guardar en formato JSON (ideal para respaldos o procesamiento web)
        const rutaJson = './materias_exportadas.json';
        fs.writeFileSync(rutaJson, JSON.stringify(rows, null, 4), 'utf-8');
        console.log(`✅ Archivo JSON generado exitosamente: ${rutaJson}`);

        // 2. Guardar en formato de texto plano legible (Código - Descripción)
        const rutaTxt = './materias_exportadas.txt';
        let contenidoTxt = `=== LISTADO DE MATERIAS (materia_una) ===\n`;
        contenidoTxt += `Total de registros: ${rows.length}\n`;
        contenidoTxt += `=========================================\n\n`;

        rows.forEach((materia, index) => {
            contenidoTxt += `${index + 1}. [Código: ${materia.codigo}] - ${materia.descripcion}\n`;
        });

        fs.writeFileSync(rutaTxt, contenidoTxt, 'utf-8');
        console.log(`✅ Archivo de texto generado exitosamente: ${rutaTxt}`);

    } catch (error) {
        console.error('❌ Error durante la exportación:', error.message);
    } finally {
        // Cerrar el pool de conexiones al terminar
        pool.end();
    }
}

exportarMaterias();