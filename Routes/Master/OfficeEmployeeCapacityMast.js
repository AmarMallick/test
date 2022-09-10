var express = require('express');
var router = express.Router();
var {verifyToken} =require('../../middleware/tokan_verify')

var  _officeEmployeeCapacityMast= require('../../Controllers/Master/OfficeEmployeeCapacityMast.Controllers');
const fbAuth = require('../../middleware/fbAuth');

router.post('/office_employee_capacity_mast_fill',fbAuth,_officeEmployeeCapacityMast.office_employee_capacity_mast_fill)
router.post('/office_employee_capacity_mast_save',fbAuth,_officeEmployeeCapacityMast.office_employee_capacity_mast_save)
router.post('/office_employee_capacity_mast_delete',fbAuth,_officeEmployeeCapacityMast.office_employee_capacity_mast_delete)

module.exports = router;