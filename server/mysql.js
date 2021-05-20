const mysql = require('mysql');

var pool = mysql.createPool({
    "user":process.env.mysql_User,
    "password":process.env.mysql_password,
    "database":  process.env.mysql_database,
    "host":process.env.mysql_host,
    "port":process.env.mysql_port

});
exports.pool = pool;