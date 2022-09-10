var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _bikeInventoryMast= require('../../Controllers/Master/BikeInventoryMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/bike_inventory_mast_fill',fbAuth,_bikeInventoryMast.bike_inventory_mast_fill)
router.post('/bike_inventory_mast_save',fbAuth,_bikeInventoryMast.bike_inventory_mast_save)
router.post('/bike_inventory_mast_delete',fbAuth,_bikeInventoryMast.bike_inventory_mast_delete)

module.exports = router;