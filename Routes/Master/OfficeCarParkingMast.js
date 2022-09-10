var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _officeCarParkingMast= require('../../Controllers/Master/OfficeCarParkingMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/office_car_parking_mast_fill',fbAuth,_officeCarParkingMast.office_car_parking_mast_fill)
router.post('/office_car_parking_mast_save',fbAuth,_officeCarParkingMast.office_car_parking_mast_save)
router.post('/office_car_parking_mast_delete',fbAuth,_officeCarParkingMast.office_car_parking_mast_delete)

module.exports = router;