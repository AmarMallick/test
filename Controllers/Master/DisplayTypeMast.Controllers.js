const connection = require("../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.display_types_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    try {
      connection.query("SELECT * FROM display_type_mast", (err, result) => {
        if (err) {
          res.status(500).json({ success: 0, data: err });
        } else {
          res.status(200).json({ success: 1, data: result });
        }
      });
    } catch (err) {
      res.status(500).json({ success: 0, data: err });
    }
  });
};

exports.display_type_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_display_type_id = req.body.id;

    try {
      if (!in_display_type_id) {
        res.status(400).json({ data: [{ message: "Enter display_type_id " }] });
      } else {
        connection.query(
          "call sp_display_type_mast_delete(?)",
          [in_display_type_id],
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

exports.display_type_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_display_type_id = req.body.id;
    let in_display_type_type = req.body.display_type_type;

    try {
      if (!in_display_type_id) {
        res.status(400).json({ data: [{ message: "Enter display_type_id " }] });
      } else if (!in_display_type_type) {
        res
          .status(400)
          .json({ data: [{ message: "Enter display_type_type " }] });
      } else {
        connection.query(
          "call sp_dispaly_type_mast_save(?,?)",
          [in_display_type_id, in_display_type_type],
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
