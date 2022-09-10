var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _commercialTypeMast= require('../../Controllers/Master/CommercialTypeMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/commercial_type_mast_fill',fbAuth,_commercialTypeMast.commercial_type_mast_fill)
router.post('/commercial_type_mast_save',fbAuth,_commercialTypeMast.commercial_type_mast_save)
router.post('/commercial_type_mast_delete',fbAuth,_commercialTypeMast.commercial_type_mast_delete)

module.exports = router;