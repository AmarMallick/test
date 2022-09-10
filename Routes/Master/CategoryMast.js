var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _categoryMast= require('../../Controllers/Master/CategoryMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.get('/category_mast_fill',_categoryMast.category_mast_fill)
router.post('/category_mast_save',fbAuth,_categoryMast.category_mast_save)
router.post('/category_mast_delete',fbAuth,_categoryMast.category_mast_delete)
router.get('/main_category_menu_web',fbAuth,_categoryMast.main_category_menu_web)

module.exports = router;