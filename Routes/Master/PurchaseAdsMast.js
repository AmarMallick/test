var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _purchaseAdsMast= require('../../Controllers/Master/PurchaseAdsMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/purchase_ads_mast_fill',fbAuth,_purchaseAdsMast.purchase_ads_mast_fill)
router.post('/my_purchase_ads_mast_fill',fbAuth,_purchaseAdsMast.my_purchase_ads_mast_fill)
router.post('/purchase_ads_mast_save',fbAuth,_purchaseAdsMast.purchase_ads_mast_save)
router.post('/purchase_ads_mast_update',fbAuth,_purchaseAdsMast.purchase_ads_mast_update)
router.post('/job_purchase_ads_mast_update',fbAuth,_purchaseAdsMast.job_purchase_ads_mast_update)

module.exports = router;