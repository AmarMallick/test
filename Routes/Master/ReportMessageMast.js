var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _reportMessageMast= require('../../Controllers/Master/ReportMessageMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/report_message_mast_fill',fbAuth,_reportMessageMast.report_message_mast_fill)
router.post('/report_message_mast_delete',fbAuth,_reportMessageMast.report_message_mast_delete)
router.post('/report_message_mast_save',fbAuth,_reportMessageMast.report_message_mast_save)

module.exports = router;