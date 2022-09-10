const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.sub_category_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_cat_id = req.query.cat_id;
    let query = `SELECT SCM.id as sub_cat_id,SCM.cat_id,SCM.sub_cat_name,CM.cat_name
	                    FROM sub_category_mast SCM  
                        LEFT JOIN category_mast CM  ON  SCM.cat_id = CM.id  
                        where CM.id  = ?`;
    connection.query(query, [in_cat_id], (err, result) => {
      if (err) {
        res.status(500).json({ success: 0, data: err });
      } else {
        res.status(200).json({ success: 1, data: result });
      }
    });
  });
};

exports.sub_category_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;
    let in_cat_id = req.body.cat_id;
    let in_sub_cat_name = req.body.sub_cat_name;
    try {
      if (!in_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else if (!in_cat_id) {
        res.status(400).json({ data: [{ message: "Enter cat_id " }] });
      } else if (!in_sub_cat_name) {
        res.status(400).json({ data: [{ message: "Enter sub_cat_name " }] });
      } else {
        connection.query(
          "call sp_sub_category_mast_save(?,?,?)",
          [in_id, in_cat_id, in_sub_cat_name],
          (err, result) => {
            if (err) {
              res.status(500).json({ success: 0, data: err });
            } else {
              res.status(201).json({ success: 1, data: result[0] });
            }
          }
        );
      }
    } catch (err) {
      res.status(500).json({ success: 0, data: err });
    }
  });
};

exports.sub_category_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;

    try {
      if (!in_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else {
        connection.query(
          "call sp_sub_category_mast_delete(?)",
          [in_id],
          (err, result) => {
            if (err) {
              res.status(500).json({ success: 0, data: err });
            } else {
              res.status(200).json({ success: 1, data: result[0] });
            }
          }
        );
      }
    } catch (err) {
      res.status(500).json({ success: 0, data: err });
    }
  });
};
