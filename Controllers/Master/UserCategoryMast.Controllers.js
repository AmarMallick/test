const connection = require('./../../db/mysql')
const jwt = require("jsonwebtoken")
const multer = require('multer')

exports.user_category_mast_fill = async (req, res) => {
    var form = multer().array([]);
    await form(req, res, async (err) => {
        try {
            connection.query('call sp_user_category_mast_fill()', (err, result) => {
                if (err) {
                    res.status(500).json({ success: 0, data: err })
                } else {
                    res.status(200).json({ success: 1, data: result[0] })
                }
            });
        } catch (err) {
            res.status(500).json({ success: 0, data: err })
        }
    });
}

exports.user_category_mast_save = async (req, res) => {
    var form = multer().array([]);
    await form(req, res, async (err) => {
        let in_cat_id = req.body.cat_id;
        let in_cat_name = req.body.cat_name;



                try {
                    if (!in_cat_name) {
                        res.status(400).json({ data: [{ message: "Enter cat_name " }] })
                    } else if (!in_cat_id) {
                        res.status(400).json({ data: [{ message: "Enter cat_id " }] })
                    } else {
                        connection.query('call sp_user_category_mast_save(?,?)', [in_cat_id, in_cat_name], (err, result) => {
                            if (err) {
                                res.status(500).json({ success: 0, data: err })
                            } else {
                                res.status(201).json({ success: 1, data: result[0] })
                            }
                        });
                    }
                } catch (err) {
                    res.status(500).json({ success: 0, data: err })
                }
          
    });
}

exports.user_category_mast_delete = async (req, res) => {
    var form = multer().array([]);
    await form(req, res, async (err) => {
        let in_cat_id = req.body.cat_id;


                try {
                    if (!in_cat_id) {
                        res.status(400).json({ data: [{ message: "Enter cat_id " }] })
                    } else {
                        connection.query('call sp_user_category_mast_delete(?)', [in_cat_id], (err, result) => {
                            if (err) {
                                res.status(500).json({ success: 0, data: err })
                            } else {
                                res.status(200).json({ success: 1, data: result[0] })
                            }
                        });
                    }
                } catch (err) {
                    res.status(500).json({ success: 0, data: err })
                }
         
    });
}
