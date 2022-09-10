var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _carSell_InventoryMast= require('../../Controllers/Master/CarSell_InventoryMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/car_sell_inventory_mast_fill',fbAuth,_carSell_InventoryMast.car_sell_inventory_mast_fill)
router.post('/car_sell_inventory_mast_save',fbAuth,_carSell_InventoryMast.car_sell_inventory_mast_save)
router.post('/car_sell_inventory_mast_delete',fbAuth,_carSell_InventoryMast.car_sell_inventory_mast_delete)

module.exports = router;