const connection = require("../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.car_type_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;
    try {
      connection.query("call sp_car_type_mast_fill()", (err, result) => {
        if (err) {
          res.status(500).json({ success: 0, data: err });
        } else {
          res.status(200).json({ success: 1, data: result[0] });
        }
      });
    } catch (err) {
      res.status(500).json({ success: 0, data: err });
    }
  });
};

exports.car_type_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;
    let in_value = req.body.value;

    try {
      if (!in_id) {
        res.status(400).json({ messaage: "enter id" });
      } else if (!in_value) {
        res.status(400).json({ messaage: "enter value" });
      } else {
        connection.query(
          "call sp_car_type_mast_save(?,?)",
          [in_id, in_value],
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

exports.car_type_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;

    try {
      if (!in_id) {
        res.status(400).json({ messaage: "enter id" });
      } else {
        connection.query(
          "call sp_car_type_mast_delete(?)",
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
