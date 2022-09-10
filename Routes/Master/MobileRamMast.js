var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _mobileRamMast= require('../../Controllers/Master/MobileRamMast.Controlles');
const fbAuth = require('../../middleware/fbAuth');

router.post('/mobile_ram_mast_fill',fbAuth,_mobileRamMast.mobile_ram_mast_fill)
router.post('/mobile_ram_mast_save',fbAuth,_mobileRamMast.mobile_ram_mast_save)
router.post('/mobile_ram_mast_delete',fbAuth,_mobileRamMast.mobile_ram_mast_delete)

module.exports = router;