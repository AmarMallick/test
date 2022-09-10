const mysql = require('mysql2');
require('dotenv').config()


const connection = mysql.createConnection({
	host : "database-bsapp.ccq5ubwddrjp.ap-south-1.rds.amazonaws.com",//process.env.HOST,
	user : "admin",//'root',
	password : "Global12$",//process.env.PASSWORD,
	database : "BSApp",//process.env.DATABASE,
	port: 3306
});

connection.connect((err) => {
    if(err) throw err;
    console.log('Connected to MySQL Server!');
});
module.exports = connection;