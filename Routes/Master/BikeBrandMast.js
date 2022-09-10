var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _bikeBrandMast= require('../../Controllers/Master/BikeBrandMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/bike_brand_mast_fill',fbAuth,_bikeBrandMast.bike_brand_mast_fill)
router.post('/bike_brand_mast_save',fbAuth,_bikeBrandMast.bike_brand_mast_save)
router.post('/bike_brand_mast_delete',fbAuth,_bikeBrandMast.bike_brand_mast_delete)

module.exports = router;