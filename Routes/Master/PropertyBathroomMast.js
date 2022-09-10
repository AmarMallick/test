var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _propertyBathroomMast= require('../../Controllers/Master/PropertyBathroomMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/property_bathroom_mast_fill',fbAuth,_propertyBathroomMast.property_bathroom_mast_fill)
router.post('/property_bathroom_mast_save',fbAuth,_propertyBathroomMast.property_bathroom_mast_save)
router.post('/property_bathroom_mast_delete',fbAuth,_propertyBathroomMast.property_bathroom_mast_delete)

module.exports = router;