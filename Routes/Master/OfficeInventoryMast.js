
var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _officeInventoryMast= require('../../Controllers/Master/OfficeInventoryMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/office_inventory_mast_fill',fbAuth,_officeInventoryMast.office_inventory_mast_fill)
router.post('/office_inventory_mast_save',fbAuth,_officeInventoryMast.office_inventory_mast_save)
router.post('/office_inventory_mast_delete',fbAuth,_officeInventoryMast.office_inventory_mast_delete)

module.exports = router;