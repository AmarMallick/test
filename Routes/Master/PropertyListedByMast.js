
var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _propertyListedByMast= require('../../Controllers/Master/PropertyListedByMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/property_listed_by_mast_fill',fbAuth,_propertyListedByMast.property_listed_by_mast_fill)
router.post('/property_listed_by_mast_save',fbAuth,_propertyListedByMast.property_listed_by_mast_save)
router.post('/property_listed_by_mast_delete',fbAuth,_propertyListedByMast.property_listed_by_mast_delete)

module.exports = router;