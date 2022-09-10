var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _packagePriceMast= require('../../Controllers/Master/PackagePriceMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/package_price_mast_fill',fbAuth,_packagePriceMast.package_price_mast_fill)
router.post('/package_price_mast_save',fbAuth,_packagePriceMast.package_price_mast_save)
router.post('/package_price_mast_delete',fbAuth,_packagePriceMast.package_price_mast_delete)

module.exports = router;