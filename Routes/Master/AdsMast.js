var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _adsMast= require('../../Controllers/Master/AdsMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/ads_mast_fill',fbAuth,_adsMast.ads_mast_fill)
router.post('/ads_status_update',fbAuth,_adsMast.ads_status_update)
router.post('/ads_mast_delete',fbAuth,_adsMast.ads_mast_delete)
router.post('/likes',fbAuth,_adsMast.likes)
router.post('/views_count_mast_save',fbAuth,_adsMast.views_count_mast_save)
router.post('/views_count_mast_save_update',fbAuth,_adsMast.views_count_mast_save_update)



module.exports = router;