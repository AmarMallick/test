var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _propertyFurnishingMast= require('../../Controllers/Master/PropertyFurnishingMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/property_furnishing_mast_fill',fbAuth,_propertyFurnishingMast.property_furnishing_mast_fill)
router.post('/property_furnishing_mast_save',fbAuth,_propertyFurnishingMast.property_furnishing_mast_save)
router.post('/property_furnishing_mast_delete',fbAuth,_propertyFurnishingMast.property_furnishing_mast_delete)

module.exports = router;
