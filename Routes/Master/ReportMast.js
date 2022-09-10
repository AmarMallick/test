var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _reportMast= require('../../Controllers/Master/ReportMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/report_mast_fill',fbAuth,_reportMast.report_mast_fill)
router.post('/report_mast_save',fbAuth,_reportMast.report_mast_save)

module.exports = router;