var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _carRegistrationMast= require('../../Controllers/Master/CarRegistrationMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/car_registration_mast_fill',fbAuth,_carRegistrationMast.car_registration_mast_fill)
router.post('/car_registration_mast_save',fbAuth,_carRegistrationMast.car_registration_mast_save)
router.post('/car_registration_mast_delete',fbAuth,_carRegistrationMast.car_registration_mast_delete)

module.exports = router;