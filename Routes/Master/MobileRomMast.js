var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _mobileRomMast= require('../../Controllers/Master/MobileRomMast.Controlles');
const fbAuth = require('../../middleware/fbAuth');

router.post('/mobile_rom_mast_fill',fbAuth,_mobileRomMast.mobile_rom_mast_fill)
router.post('/mobile_rom_mast_save',fbAuth,_mobileRomMast.mobile_rom_mast_save)
router.post('/mobile_rom_mast_delete',fbAuth,_mobileRomMast.mobile_rom_mast_delete)

module.exports = router;