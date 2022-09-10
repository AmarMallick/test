var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _userFollowersMast= require('../../Controllers/Master/UserFollowersMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/user_followers_mast_save',fbAuth,_userFollowersMast.user_followers_mast_save)
router.post('/user_followers_mast_delete',fbAuth,_userFollowersMast.user_followers_mast_delete)
router.post('/get_followers',fbAuth,_userFollowersMast.get_followers)
router.post('/get_following',fbAuth,_userFollowersMast.get_following)
router.post('/get_followers_count',fbAuth,_userFollowersMast.get_followers_count)
router.post('/get_following_count',fbAuth,_userFollowersMast.get_following_count)

module.exports = router;