var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _propertyInventorySellMast= require('../../Controllers/Master/PropertyInventorySellMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/property_inventory_sell_mast_fill',fbAuth,_propertyInventorySellMast.property_inventory_sell_mast_fill)
router.post('/property_inventory_sell_mast_save',fbAuth,_propertyInventorySellMast.property_inventory_sell_mast_save)
router.post('/property_inventory_sell_mast_delete',fbAuth,_propertyInventorySellMast.property_inventory_sell_mast_delete)

module.exports = router;