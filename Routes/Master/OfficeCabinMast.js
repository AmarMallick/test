var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _officeCabinMast= require('../../Controllers/Master/OfficeCabinMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/office_cabin_mast_fill',fbAuth,_officeCabinMast.office_cabin_mast_fill)
router.post('/office_cabin_mast_save',fbAuth,_officeCabinMast.office_cabin_mast_save)
router.post('/office_cabin_mast_delete',fbAuth,_officeCabinMast.office_cabin_mast_delete)

module.exports = router;