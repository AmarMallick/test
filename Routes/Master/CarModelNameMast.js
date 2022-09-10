var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _carModelNameMast= require('../../Controllers/Master/CarModelNameMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/car_model_name_mast_fill',fbAuth,_carModelNameMast.car_model_name_mast_fill)
router.post('/car_model_name_mast_save',fbAuth,_carModelNameMast.car_model_name_mast_save)
router.post('/car_model_name_mast_delete',fbAuth,_carModelNameMast.car_model_name_mast_delete)

module.exports = router;