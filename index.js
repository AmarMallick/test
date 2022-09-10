require('dotenv').config()

const express = require('express')
const bodyparser = require('body-parser');
const cors = require('cors');
const cloudinary = require('cloudinary').v2;
const multer = require('multer')
const upload =multer()
const mysql = require('mysql2');
const path = require('path');

cloudinary.config({
  cloud_name: process.env.CLOUD_NAME,
  api_key: process.env.API_KEY,
  api_secret: process.env.API_SECRET
});

const port = process.env.PORT || '3000';

var app = express();

var routes = require('./routes')

app.use(cors());

// app.use(express.static(path.join(__dirname, 'public')));
app.use('/docs', express.static(path.join(__dirname, 'docs')));
app.use(express.static(__dirname+'/public'));

app.use(bodyparser.json({ limit: '20mb' }));
app.use(bodyparser.urlencoded({ extended: true, limit: '20mb', parameterLimit: 20 }));


app.use('/api', routes)
app.use(upload.array())

app.get('/', (req, res) => {
  res.send('Welcome To BSApp new update V.12.08.2022.5.16')
})


app.listen(port, () => {
  console.log(`listening at http://localhost:${port}`)
})
