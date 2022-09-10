var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _propertyTypeMast= require('../../Controllers/Master/PropertyTypeMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/property_type_mast_fill',fbAuth,_propertyTypeMast.property_type_mast_fill)
router.post('/property_type_mast_save',fbAuth,_propertyTypeMast.property_type_mast_save)
router.post('/property_type_mast_delete',fbAuth,_propertyTypeMast.property_type_mast_delete)

module.exports = router;