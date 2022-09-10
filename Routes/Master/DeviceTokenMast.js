var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _deviceTokenMast= require('../../Controllers/Master/DeviceTokenMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.get('/device_token_mast_fill',fbAuth,_deviceTokenMast.device_token_mast_fill)
router.post('/device_token_mast_save',fbAuth,_deviceTokenMast.device_token_mast_save)
router.post('/device_token_mast_delete',fbAuth,_deviceTokenMast.device_token_mast_delete)
router.post('/notification_subscribe' ,fbAuth,_deviceTokenMast.notification_subscribe)

module.exports = router;