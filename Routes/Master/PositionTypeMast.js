var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _positionTypeMast= require('../../Controllers/Master/PositionTypeMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/work_type_mast_fill',fbAuth,_positionTypeMast.position_type_mast_fill)
router.post('/work_type_mast_save',fbAuth,_positionTypeMast.position_type_mast_save)
router.post('/work_type_mast_delete',fbAuth,_positionTypeMast.position_type_mast_delete)

module.exports = router;