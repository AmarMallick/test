var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _vehicelTypeMast= require('../../Controllers/Master/VehicelTypeMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/vehicle_type_mast_fill',fbAuth,_vehicelTypeMast.vehicle_type_mast_fill)
router.post('/vehicle_type_mast_save',fbAuth,_vehicelTypeMast.vehicle_type_mast_save)
router.post('/vehicle_type_mast_delete',fbAuth,_vehicelTypeMast.vehicle_type_mast_delete)

module.exports = router;