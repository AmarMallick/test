var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _subCategoryMast= require('../../Controllers/Master/SubCategoryMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.get('/sub_category_mast_fill',_subCategoryMast.sub_category_mast_fill)
router.post('/sub_category_mast_save',fbAuth,_subCategoryMast.sub_category_mast_save)
router.post('/sub_category_mast_delete',fbAuth,_subCategoryMast.sub_category_mast_delete)


module.exports = router;