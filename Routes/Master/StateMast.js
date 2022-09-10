var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _stateMast= require('../../Controllers/Master/StateMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/state_mast_fill',fbAuth,_stateMast.state_mast_fill)
router.post('/state_mast_save',fbAuth,_stateMast.state_mast_save)
router.post('/state_mast_delete',fbAuth,_stateMast.state_mast_delete)

module.exports = router;