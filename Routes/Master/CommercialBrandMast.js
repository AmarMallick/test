var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _commercialBrandMast= require('../../Controllers/Master/CommercialBrandMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/commercial_brand_mast_fill',fbAuth,_commercialBrandMast.commercial_brand_mast_fill)
router.post('/commercial_brand_mast_save',fbAuth,_commercialBrandMast.commercial_brand_mast_save)
router.post('/commercial_brand_mast_delete',fbAuth,_commercialBrandMast.commercial_brand_mast_delete)

module.exports = router;