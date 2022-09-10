var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _favouritesMast= require('../../Controllers/Master/FavouritesMast.Controllers');

router.post('/favourites_mast_fill',_favouritesMast.favourites_mast_fill)
router.post('/favourites_mast_save',verifyToken,_favouritesMast.favourites_mast_save)
router.post('/favourites_mast_delete',verifyToken,_favouritesMast.favourites_mast_delete)


module.exports = router;