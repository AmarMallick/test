const connection = require("../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.device_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    try {
      connection.query("select *  from device_mast", (err, result) => {
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

exports.device_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_device_id = req.body.id;
    let in_device_name = req.body.name;

    try {
      if (!in_device_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else if (!in_device_name) {
        res.status(400).json({ data: [{ message: "Enter name " }] });
      } else {
        connection.query(
          "call sp_device_mast_save(?,?)",
          [in_device_id, in_device_name],
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

exports.device_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_device_id = req.body.id;

    try {
      if (!in_device_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else {
        connection.query(
          "call sp_device_mast_delete(?)",
          [in_device_id],
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
