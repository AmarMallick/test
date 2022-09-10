const connection = require("../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.mobile_brand_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_brand_id = req.body.brand_id;
    try {
      connection.query("call sp_mobile_brand_mast_fill", (err, result) => {
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

exports.mobile_brand_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_brand_id = req.body.brand_id;
    let in_brand_name = req.body.brand_name;
    let in_device_mast_id = req.body.device_id;

    try {
      if (!in_brand_id) {
        res.status(400).json({ data: [{ message: "Enter brand_id " }] });
      } else if (!in_brand_name) {
        res
          .status(400)
          .json({ data: [{ message: "Select from brand_name " }] });
      } else if (!in_device_mast_id) {
        res.status(400).json({ data: [{ message: "Enter device_id" }] });
      } else {
        connection.query(
          "call sp_mobile_brand_mast_save(?,?,?)",
          [in_brand_id, in_brand_name, in_device_mast_id],
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

exports.mobile_brand_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_brand_id = req.body.brand_id;

    try {
      if (!in_brand_id) {
        res.status(400).json({ data: [{ message: "Enter brand_id " }] });
      } else {
        connection.query(
          "call sp_mobile_brand_mast_delete(?)",
          [in_brand_id],
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
