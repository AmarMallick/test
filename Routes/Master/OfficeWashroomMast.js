var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _officeWashroomMast= require('../../Controllers/Master/OfficeWashroomMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/office_washroom_mast_fill',fbAuth,_officeWashroomMast.office_washroom_mast_fill)
router.post('/office_washroom_mast_save',fbAuth,_officeWashroomMast.office_washroom_mast_save)
router.post('/office_washroom_mast_delete',fbAuth,_officeWashroomMast.office_washroom_mast_delete)

module.exports = router;