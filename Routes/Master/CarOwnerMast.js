var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _carOwnerMast= require('../../Controllers/Master/CarOwnerMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/car_owner_mast_fill',fbAuth,_carOwnerMast.car_owner_mast_fill)
router.post('/car_owner_mast_save',fbAuth,_carOwnerMast.car_owner_mast_save)
router.post('/car_owner_mast_delete',fbAuth,_carOwnerMast.car_owner_mast_delete)

module.exports = router;