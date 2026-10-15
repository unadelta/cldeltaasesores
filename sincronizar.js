const mysql = require('mysql2/promise');
const fs = require('fs');
require('dotenv').config();

async function sincronizarSeguro() {
    if (!fs.existsSync('backup_local.json')) {
        console.error("❌ No se encontró 'backup_local.json'. Ejecuta 'node fase1.js' primero.");
        return;
    }

    const datosTablas = JSON.parse(fs.readFileSync('backup_local.json', 'utf8'));

    // Priorizamos estrictamente las credenciales MYSQL* de TiDB Cloud del .env
    const dbHost = process.env.MYSQLHOST || process.env.DB_HOST;
    const dbUser = process.env.MYSQLUSER || process.env.DB_USER;
    const dbPassword = process.env.MYSQLPASSWORD !== undefined ? process.env.MYSQLPASSWORD : process.env.DB_PASSWORD;
    const dbName = process.env.MYSQLDATABASE || process.env.DB_NAME || 'asesores';
    const dbPort = Number(process.env.MYSQLPORT || process.env.DB_PORT || 4000);

    console.log(`🔌 Conectando de forma segura (SSL) a TiDB Cloud [Host: ${dbHost} \vert{} User:${dbUser}]...`);

    const conn = await mysql.createConnection({
        host: dbHost,
        user: dbUser,
        password: dbPassword ? dbPassword.trim() : '',
        database: dbName,
        port: dbPort,
        charset: 'utf8mb4_general_ci',
        ssl: {
            rejectUnauthorized: false
        },
        multipleStatements: true
    });

    try {
        console.log("🧹 Desactivando restricciones y actualizando tablas remotas...");
        await conn.query('SET FOREIGN_KEY_CHECKS = 0;');

        for (const item of datosTablas) {
            console.log(`-> Procesando tabla: ${item.tableName}`);

            // Asegurar estructura
            if (item.createSql) {
                try {
                    await conn.query(item.createSql);
                } catch (e) {
                    // Ignora si ya existe
                }
            }

            // Vaciar datos viejos en la nube de forma segura
            await conn.query(`TRUNCATE TABLE \`${item.tableName}\``).catch(async() => {
                await conn.query(`DELETE FROM \`${item.tableName}\``);
            });

            // Insertar registros nuevos del respaldo local
            if (item.dataRows && item.dataRows.length > 0) {
                let insertados = 0;
                for (const dataRow of item.dataRows) {
                    const keys = Object.keys(dataRow);
                    const columns = keys.map(c => `\`${c}\``).join(', ');

                    const values = keys.map(k => {
                        let val = dataRow[k];
                        if (val === null || val === undefined) return 'NULL';
                        if (typeof val === 'number') return val;
                        if (typeof val === 'boolean') return val ? 1 : 0;
                        if (val instanceof Date) return `'${val.toISOString().slice(0, 19).replace('T', ' ')}'`;
                        if (Buffer.isBuffer(val)) return `x'${val.toString('hex')}'`;
                        return `'${String(val).replace(/\\/g, '\\\\').replace(/'/g, "''")}'`;
                    }).join(', ');

                    const insertQuery = `INSERT INTO \`${item.tableName}\` (${columns}) VALUES (${values})`;
                    await conn.query(insertQuery);
                    insertados++;
                }
                console.log(`   ✅ ${insertados} registros sincronizados en ${item.tableName}.`);
            } else {
                console.log(`   ℹ️ La tabla ${item.tableName} está vacía.`);
            }
        }

        await conn.query('SET FOREIGN_KEY_CHECKS = 1;');
        await conn.end();
        console.log("\n🎉 ¡Sincronización segura completa con éxito en TiDB Cloud!");

    } catch (error) {
        await conn.query('SET FOREIGN_KEY_CHECKS = 1;').catch(() => {});
        await conn.end().catch(() => {});
        console.error("❌ Error durante la sincronización:", error);
    }
}

sincronizarSeguro();