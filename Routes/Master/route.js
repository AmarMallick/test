const express = require('express');
const router = express.Router();
const {verifyToken} =require('../../middleware/tokan_verify')

const fbAuth = require("../../middleware/fbAuth")

const userController = require("../../Controllers/Master/userController")
router.post("/login",userController.login)
router.get("/isAuth",userController.isAuth)
router.get('/users',fbAuth,userController.userGet)
router.post('/auth/edit',fbAuth,userController.userUpdate)
router.post('/firebase/notification',fbAuth,userController.userNotification)

const quickboxController = require("../../Controllers/Master/ChatController")
router.post("/quickbox-register",fbAuth,quickboxController.quickBoxUser);

const productController = require("../../Controllers/Master/ProductController")
router.post("/product/pdf",productController.productPdf);

module.exports = router;

