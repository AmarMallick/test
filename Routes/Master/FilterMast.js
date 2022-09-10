var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _filterMast= require('../../Controllers/Master/FilterMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/filter_mast_fill',fbAuth,_filterMast.filter_mast_fill)
router.post('/filter_mast_save',fbAuth,_filterMast.filter_mast_save)
router.post('/filter_mast_delete',fbAuth,_filterMast.filter_mast_delete)

module.exports = router;