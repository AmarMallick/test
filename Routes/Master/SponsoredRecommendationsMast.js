var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _stateMast= require('../../Controllers/Master/SponsoredRecommendadtionsMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/sponsored_recommendations_list',fbAuth,_stateMast.sponsored_recommendations_list)

module.exports = router;