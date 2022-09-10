var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _autocomplete= require('../../Controllers/Master/AutocompleteMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');


router.post('/autocomplete',fbAuth,_autocomplete.autocomplete)
router.post('/autocomplete_title',fbAuth,_autocomplete.autocompleteTitle)


module.exports = router;