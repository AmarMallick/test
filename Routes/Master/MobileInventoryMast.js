var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _mobileInventoryMast= require('../../Controllers/Master/MobileInventoryMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/mobile_inventory_mast_fill',fbAuth,_mobileInventoryMast.mobile_inventory_mast_fill)
router.post('/mobile_inventory_mast_save',fbAuth,_mobileInventoryMast.mobile_inventory_mast_save)
router.post('/mobile_inventory_mast_delete',fbAuth,_mobileInventoryMast.mobile_inventory_mast_delete)

module.exports = router;