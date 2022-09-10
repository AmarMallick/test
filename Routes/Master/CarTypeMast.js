var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _carTypeMast= require('../../Controllers/Master/CarTypeMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/car_type_mast_fill',fbAuth,_carTypeMast.car_type_mast_fill)
router.post('/car_type_mast_save',fbAuth,_carTypeMast.car_type_mast_save)
router.post('/car_type_mast_delete',fbAuth,_carTypeMast.car_type_mast_delete)

module.exports = router;