var express = require('express');
var router = express.Router();
const fbAuth = require("../../middleware/fbAuth")

var  _alltableData = require('../../Controllers/Master/getDropDownData.Controllers');

router.post('/get_all_table_data',_alltableData.getDroupDown)

module.exports = router;