var express = require('express');
var router = express.Router();

var  _uploadImage= require('../../Controllers/Master/UploadImage.Controllers');

router.post('/multipaleImage',_uploadImage.multipaleImage)
router.post('/singleImage',_uploadImage.singleImage)
module.exports = router;