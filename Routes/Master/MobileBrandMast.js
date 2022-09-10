var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _mobileBrandMast= require('../../Controllers/Master/MobileBrandMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/mobile_brand_mast_fill',fbAuth,_mobileBrandMast.mobile_brand_mast_fill)
router.post('/mobile_brand_mast_save',fbAuth,_mobileBrandMast.mobile_brand_mast_save)
router.post('/mobile_brand_mast_delete',fbAuth,_mobileBrandMast.mobile_brand_mast_delete)

module.exports = router;