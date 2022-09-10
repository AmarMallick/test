var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _displayTypeMast= require('../../Controllers/Master/DisplayTypeMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.get('/display_type_mast_fill',fbAuth,_displayTypeMast.display_types_mast_fill)
router.post('/display_type_mast_save',fbAuth,_displayTypeMast.display_type_mast_save)
router.post('/display_type_mast_delete',fbAuth,_displayTypeMast.display_type_mast_delete)

module.exports = router;