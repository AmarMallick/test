var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _yearMast= require('../../Controllers/Master/YearMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/year_mast_fill',fbAuth,_yearMast.year_mast_fill)
router.post('/year_mast_save',fbAuth,_yearMast.year_mast_save)
router.post('/year_mast_delete',fbAuth,_yearMast.year_mast_delete)

module.exports = router;