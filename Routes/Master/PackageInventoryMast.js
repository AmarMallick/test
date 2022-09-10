var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _packageInventoryMast= require('../../Controllers/Master/PackageInventoryMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/package_inventory_mast_fill',fbAuth,_packageInventoryMast.package_inventory_mast_fill)
router.post('/package_inventory_mast_save',fbAuth,_packageInventoryMast.package_inventory_mast_save)

module.exports = router;