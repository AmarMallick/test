var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _dynamicFieldMast= require('../../Controllers/Master/DynamicFieldMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/dynamic_field_mast_fill',fbAuth,_dynamicFieldMast.dynamic_field_mast_fill)
router.post('/dynamic_field_mast_save',fbAuth,_dynamicFieldMast.dynamic_field_mast_save)
router.post('/dynamic_field_mast_delete',fbAuth,_dynamicFieldMast.dynamic_field_mast_delete)

module.exports = router;