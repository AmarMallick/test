var express = require('express');
var router = express.Router();
var  _commVehicleInventoryMast= require('../../Controllers/Master/CommVehicleInventoryMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/vehicle_inventory_mast_fill',fbAuth,_commVehicleInventoryMast.vehicle_inventory_mast_fill)
router.post('/vehicle_inventory_mast_save',fbAuth,_commVehicleInventoryMast.vehicle_inventory_mast_save)
router.post('/vehicle_inventory_mast_delete',_commVehicleInventoryMast.vehicle_inventory_mast_delete)

module.exports = router;