var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _rejectedReasonsMast= require('../../Controllers/Master/RejectedReasonsMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/rejected_reasons_mast_fill',fbAuth,_rejectedReasonsMast.rejected_reasons_mast_fill)
router.post('/rejected_reasons_mast_save',fbAuth,_rejectedReasonsMast.rejected_reasons_mast_save)
router.post('/rejected_reasons_mast_delete',fbAuth,_rejectedReasonsMast.rejected_reasons_mast_delete)

module.exports = router;