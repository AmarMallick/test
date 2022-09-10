var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _propertyInventoryRentMast= require('../../Controllers/Master/PropertyInventoryRentMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/property_inventory_rent_mast_fill',fbAuth,_propertyInventoryRentMast.property_inventory_rent_mast_fill)
router.post('/property_inventory_rent_mast_save',fbAuth,_propertyInventoryRentMast.property_inventory_rent_mast_save)
router.post('/property_inventory_rent_mast_delete',fbAuth,_propertyInventoryRentMast.property_inventory_rent_mast_delete)

module.exports = router;