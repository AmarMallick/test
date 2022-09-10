const { request } = require('http');
const multer = require('multer')
const cloudinary = require('cloudinary').v2;


exports.multipaleImage = async (req, res) => {
    const storage = multer.diskStorage({
        destination: function (req, file, cb) {
            cb(null, 'uploads/')
        },
        filename: function (req, file, cb) {

            cb(null, file.originalname)
        }

    })

    const upload = multer({ storage }).array('image', 10)
    await upload(req, res, async (err) => {
        if (err) {
            res.status(500).json({ success: 0, data: err })
        }

        var imageurls = [];
        for (var i = 0; i < req.files.length; i++) {
            const path = req.files[i].path
            await cloudinary.uploader.upload(path, (err, result) => {
                if (err) {
                    res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
                } else {
                    const fs = require('fs')
                    fs.unlinkSync(path)
                    const urls = {
                        "url": result.url,
                        "secure_url": result.secure_url
                    }
                    imageurls.push(urls)
                }
            })
        }
        res.status(200).json({  success: 1, data: imageurls })
    })
}
exports.singleImage = async (req, res) => {
    const storage = multer.diskStorage({
        destination: function (req, file, cb) {
            cb(null, 'uploads/')
        },
        filename: function (req, file, cb) {

            cb(null, file.originalname)
        }

    })

    const upload = multer({ storage }).single('image')
    upload(req, res, (err) => {
        if (err) {
            res.status(500).json({  success: 0, data: err })
        }


        const path = req.file.path
        
           
        cloudinary.uploader.upload(path, (err, result) => {
            if (err) {
                res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
            } else {
                const fs = require('fs')
                fs.unlinkSync(path)
                const urls = {
                    "url": result.url,
                    "secure_url": result.secure_url
                }
                res.status(200).json({  success: 1, data: urls })
            }
        })


    })
}