var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _officeListedByMast= require('../../Controllers/Master/OfficeListedByMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/office_listed_by_mast_fill',fbAuth,_officeListedByMast.office_listed_by_mast_fill)
router.post('/office_listed_by_mast_save',fbAuth,_officeListedByMast.office_listed_by_mast_save)
router.post('/office_listed_by_mast_delete',fbAuth,_officeListedByMast.office_listed_by_mast_delete)

module.exports = router;