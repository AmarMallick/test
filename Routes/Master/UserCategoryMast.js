var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _userCategoryMast= require('../../Controllers/Master/UserCategoryMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/user_category_mast_fill',fbAuth,_userCategoryMast.user_category_mast_fill)
router.post('/user_category_mast_save',fbAuth,_userCategoryMast.user_category_mast_save)
router.post('/user_category_mast_delete',fbAuth,_userCategoryMast.user_category_mast_delete)


module.exports = router;