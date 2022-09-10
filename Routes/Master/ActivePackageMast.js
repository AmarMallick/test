var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _activePackageMast= require('../../Controllers/Master/ActivePackageMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/active_package_mast_save', fbAuth, _activePackageMast.active_package_mast_save);
router.post('/active_package_mast_fill', fbAuth, _activePackageMast.active_package_mast_fill);

module.exports = router;