const fs = require('fs');
const mysql = require('mysql2');

// Copia los datos exactos que ves en las variables de tu panel de Railway
const connection = mysql.createConnection({
    host: 'mysql.railway.internal ', // Si estás ejecutando esto localmente, idealmente usa el host público que te de Railway o hazlo desde la terminal de Railway si la app está ahí
    user: 'root',
    password: 'ceNYMAPloXlKxDRDmUgVYQHeCVsWWEzJ',
    database: 'railway',
    port: 3306,
    multipleStatements: true
});

const sql = fs.readFileSync('./asesores.sql', 'utf8');

connection.query(sql, (err, results) => {
    if (err) {
        console.error("Error en la migración:", err);
    } else {
        console.log("¡Tablas y cotejamiento aplicados con éxito!");
    }
    connection.end();
});