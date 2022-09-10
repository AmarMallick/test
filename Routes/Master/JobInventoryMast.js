var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _jobInventoryMast= require('../../Controllers/Master/JobInventoryMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/job_inventory_mast_fill',fbAuth,_jobInventoryMast.job_inventory_mast_fill)
router.post('/job_inventory_mast_save',fbAuth,_jobInventoryMast.job_inventory_mast_save)
router.post('/job_inventory_mast_delete',fbAuth,_jobInventoryMast.job_inventory_mast_delete)

module.exports = router;