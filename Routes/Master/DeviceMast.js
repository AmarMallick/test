var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _deviceMast= require('../../Controllers/Master/DeviceMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.get('/device_mast_fill',fbAuth,_deviceMast.device_mast_fill)
router.post('/device_mast_save',fbAuth,_deviceMast.device_mast_save)
router.post('/device_mast_delete',fbAuth,_deviceMast.device_mast_delete)

module.exports = router;