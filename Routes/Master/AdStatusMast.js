var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _adStatusMast= require('../../Controllers/Master/AdStatusMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/ad_status_mast_fill',fbAuth,_adStatusMast.ad_status_mast_fill)
router.post('/ad_status_mast_save',fbAuth,_adStatusMast.ad_status_mast_save)
router.post('/ad_status_mast_delete',fbAuth,_adStatusMast.ad_status_mast_delete)

module.exports = router;