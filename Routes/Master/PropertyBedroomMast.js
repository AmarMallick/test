var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _propertyBedroomMast= require('../../Controllers/Master/PropertyBedroomMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/property_bedroom_mast_fill',fbAuth,_propertyBedroomMast.property_bedroom_mast_fill)
router.post('/property_bedroom_mast_save',fbAuth,_propertyBedroomMast.property_bedroom_mast_save)
router.post('/property_bedroom_mast_delete',fbAuth,_propertyBedroomMast.property_bedroom_mast_delete)

module.exports = router;