var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _carBrandMast= require('../../Controllers/Master/CarBrandMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/car_brand_mast_fill',fbAuth,_carBrandMast.car_brand_mast_fill)
router.post('/car_brand_mast_save',fbAuth,_carBrandMast.car_brand_mast_save)
router.post('/car_brand_mast_delete',fbAuth,_carBrandMast.car_brand_mast_delete)

module.exports = router;