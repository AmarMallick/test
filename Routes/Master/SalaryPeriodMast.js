var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _salaryPeriodMast= require('../../Controllers/Master/SalaryPeriodMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/salary_period_mast_fill',fbAuth,_salaryPeriodMast.salary_period_mast_fill)
router.post('/salary_period_mast_save',fbAuth,_salaryPeriodMast.salary_period_mast_save)
router.post('/salary_period_mast_delete',fbAuth,_salaryPeriodMast.salary_period_mast_delete)

module.exports = router;