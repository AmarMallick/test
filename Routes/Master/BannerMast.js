var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _bannerMast= require('../../Controllers/Master/BannerMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/banner_mast_fill',fbAuth,_bannerMast.banner_mast_fill)
router.post('/banner_mast_delete',fbAuth,_bannerMast.banner_mast_delete)
router.post('/banner_mast_save',fbAuth,_bannerMast.banner_mast_save)

module.exports = router;