var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _All_InventoryMast= require('../../Controllers/Master/All_InventoryMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/all_inventory_mast_fill',fbAuth,_All_InventoryMast.all_inventory_mast_fill)
router.post('/all_inventory_mast_save',fbAuth,_All_InventoryMast.all_inventory_mast_save)
router.post('/all_inventory_mast_delete',fbAuth,_All_InventoryMast.all_inventory_mast_delete)

module.exports = router;