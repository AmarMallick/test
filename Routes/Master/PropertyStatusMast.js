
var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _PropertyStatusMast= require('../../Controllers/Master/PropertyStatusMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/property_status_mast_fill',fbAuth,_PropertyStatusMast.property_status_mast_fill)
router.post('/property_status_mast_save',fbAuth,_PropertyStatusMast.property_status_mast_save)
router.post('/property_status_mast_delete',fbAuth,_PropertyStatusMast.property_status_mast_delete)

module.exports = router;