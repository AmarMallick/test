const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.commercial_type_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    try {
      connection.query("call sp_commercial_type_mast_fill()", (err, result) => {
        if (err) {
          res.json({ success: 0, data: err });
        } else {
          res.json({ success: 1, data: result[0] });
        }
      });
    } catch (err) {
      res.json({ success: 0, data: err });
    }
  });
};

exports.commercial_type_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;
    let in_name = req.body.name;

    try {
      connection.query(
        "call sp_commercial_type_mast_save(?,?)",
        [in_id, in_name],
        (err, result) => {
          if (err) {
            res.json({ success: 0, data: err });
          } else {
            res.json({ success: 1, data: result[0] });
          }
        }
      );
    } catch (err) {
      res.json({ success: 0, data: err });
    }
  });
};

exports.commercial_type_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;

    try {
      connection.query(
        "call sp_commercial_type_mast_delete(?)",
        [in_id],
        (err, result) => {
          if (err) {
            res.json({ success: 0, data: err });
          } else {
            res.json({ success: 1, data: result[0] });
          }
        }
      );
    } catch (err) {
      res.json({ success: 0, data: err });
    }
  });
};
