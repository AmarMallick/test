var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _ShowCategoryDataMast= require('../../Controllers/Master/ShowCategoryDataMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');


router.post('/near_by_location_category_data',fbAuth,_ShowCategoryDataMast.near_by_location_category_data)
router.post('/product_detail',fbAuth,_ShowCategoryDataMast.product_detail)


module.exports = router;