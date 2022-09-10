var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _carFuelTypeMast= require('../../Controllers/Master/CarFuelTypeMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/car_fuel_type_mast_fill',fbAuth,_carFuelTypeMast.car_fuel_type_mast_fill)
router.post('/car_fuel_type_mast_save',fbAuth,_carFuelTypeMast.car_fuel_type_mast_save)
router.post('/car_fuel_type_mast_delete',fbAuth,_carFuelTypeMast.car_fuel_type_mast_delete)

module.exports = router;