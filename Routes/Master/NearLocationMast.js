var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _NearLocationMast= require('../../Controllers/Master/NearLocationMast.Controllers');


router.post('/near_by_location_data',_NearLocationMast.near_by_location_data)


module.exports = router;