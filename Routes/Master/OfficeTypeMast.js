var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _officeTypeMast= require('../../Controllers/Master/OfficeTypeMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/office_type_mast_fill',fbAuth,_officeTypeMast.office_type_mast_fill)
router.post('/office_type_mast_save',fbAuth,_officeTypeMast.office_type_mast_save)
router.post('/office_type_mast_delete',fbAuth,_officeTypeMast.office_type_mast_delete)

module.exports = router;