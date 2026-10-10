const fs = require('fs');
const mysql = require('mysql2');

// Configura tus datos de conexión de Aiven aquí
const dbConfig = {
    host: 'cldeltaasesores-asesores.e.aivencloud.com',
    port: 11660,
    user: 'avnadmin',
    password: 'AVNS_e2mpxQqkLCVqVxbcfyj', // Tu contraseña real
    database: 'defaultdb',
    multipleStatements: true,
    ssl: {
        rejectUnauthorized: false
    }
};

const sqlFilePath = 'C:\\Users\\almaMater1\\Documents\\Proyectos\\cldeltaasesores\\asesores.sql';

console.log('Leyendo el archivo SQL...');
if (!fs.existsSync(sqlFilePath)) {
    console.error(`❌ Error: No se encontró el archivo en la ruta: ${sqlFilePath}`);
    process.exit(1);
}

const fileContent = fs.readFileSync(sqlFilePath, 'utf8');

// Instrucciones para limpiar restricciones y asegurar una importación limpia
const sqlContent = `
    SET SESSION sql_require_primary_key = OFF;
    DROP DATABASE IF EXISTS defaultdb;
    CREATE DATABASE defaultdb;
    USE defaultdb;
    ${fileContent}
`;

console.log('Conectando a Aiven...');
const connection = mysql.createConnection(dbConfig);

connection.connect((err) => {
    if (err) {
        console.error('❌ Error al conectar a la base de datos:', err.message);
        return;
    }
    console.log('✅ Conectado exitosamente. Limpiando y subiendo la base de datos...');

    connection.query(sqlContent, (error, results) => {
        if (error) {
            console.error('❌ Error al ejecutar el script SQL:', error.message);
        } else {
            console.log('🎉 ¡Base de datos subida, limpia y restaurada con éxito!');
        }
        
        connection.end();
    });
});