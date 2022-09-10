var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _userMast= require('../../Controllers/Master/UserMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/user_mast_save',fbAuth,_userMast.user_mast_save)
router.post('/user_mast_delete',fbAuth,_userMast.user_mast_delete)
router.post('/user_mast_fill',fbAuth,_userMast.user_mast_fill)
router.post('/send_otp',_userMast.send_otp)
router.post('/verify_otp',_userMast.verify_otp)
router.post('/send_email_otp',_userMast.send_email_otp)
router.post('/verify_email_otp',_userMast.verify_email_otp)
router.post('/forgot_password',_userMast.forgot_password)
router.post('/rate_us_mast_save',fbAuth,_userMast.rate_us_mast_save)
router.post('/get_user_by_inventory_code', _userMast.get_user_by_inventory_code)
router.post('/count_active_ads',_userMast.count_active_ads)
router.post('/get_ad_details',_userMast.get_ad_details)
router.post('/login_sequence',_userMast.login_sequence)
router.post('/firebase_authentication',fbAuth,_userMast.firebase_authentication)

module.exports = router;