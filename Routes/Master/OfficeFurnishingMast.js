var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _officeFurnishingMast= require('../../Controllers/Master/OfficeFurnishingMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/office_furnishing_mast_fill',fbAuth,_officeFurnishingMast.office_furnishing_mast_fill)
router.post('/office_furnishing_mast_save',fbAuth,_officeFurnishingMast.office_furnishing_mast_save)
router.post('/office_furnishing_mast_delete',fbAuth,_officeFurnishingMast.office_furnishing_mast_delete)

module.exports = router;