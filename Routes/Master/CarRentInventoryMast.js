var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _carRentInventoryMast= require('../../Controllers/Master/CarRentInventoryMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/car_rent_inventory_mast_fill',fbAuth,_carRentInventoryMast.car_rent_inventory_mast_fill)
router.post('/car_rent_inventory_mast_save',fbAuth,_carRentInventoryMast.car_rent_inventory_mast_save)
router.post('/car_rent_inventory_mast_delete',fbAuth,_carRentInventoryMast.car_rent_inventory_mast_delete)

module.exports = router;