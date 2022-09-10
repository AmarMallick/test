
var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _propertyCarParkingMast= require('../../Controllers/Master/PropertyCarParkingMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/property_car_parking_mast_fill',fbAuth,_propertyCarParkingMast.property_car_parking_mast_fill)
router.post('/property_car_parking_mast_save',fbAuth,_propertyCarParkingMast.property_car_parking_mast_save)
router.post('/property_car_parking_mast_delete',fbAuth,_propertyCarParkingMast.property_car_parking_mast_delete)

module.exports = router;