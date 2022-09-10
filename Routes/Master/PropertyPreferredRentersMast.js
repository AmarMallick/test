
var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _propertyPreferredRentersMast= require('../../Controllers/Master/PropertyPreferredRentersMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/property_preferred_renters_mast_fill',fbAuth,_propertyPreferredRentersMast.property_preferred_renters_mast_fill)
router.post('/property_preferred_renters_mast_save',fbAuth,_propertyPreferredRentersMast.property_preferred_renters_mast_save)
router.post('/property_preferred_renters_mast_delete',fbAuth,_propertyPreferredRentersMast.property_preferred_renters_mast_delete)

module.exports = router;