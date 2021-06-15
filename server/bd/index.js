const  Pool  = require("pg").Pool;

const pool = new Pool({
  user: 'hnumlhelujncdi',
  host: 'ec2-52-23-40-80.compute-1.amazonaws.com',
  database: 'd93m0cuvmcq0qr',
  password: 'f4971297d32afd135980f6e3784712f3d39c4a7c49e98ae3a99dc384256134d3',
  port: 5432,
  ssl: { rejectUnauthorized: false }
  // user: 'postgres',
  // host: 'localhost',
  // database: 'db_pharmaoff',
  // password: 'root',
  // port: 5432,
});

pool
  .connect()
  .then(client => {
    console.log('Banco conectado!');
    client.release();
  })
  .catch(err => console.log(err));

exports.query = (text, param) => pool.query(text, param);