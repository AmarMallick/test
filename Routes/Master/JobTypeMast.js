var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _jobTypeMast= require('../../Controllers/Master/JobTypeMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/job_type_mast_fill',fbAuth,_jobTypeMast.job_type_mast_fill)
router.post('/job_type_mast_save',fbAuth,_jobTypeMast.job_type_mast_save)
router.post('/job_type_mast_delete',fbAuth,_jobTypeMast.job_type_mast_delete)

module.exports = router;