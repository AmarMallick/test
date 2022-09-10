const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.car_brand_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_car_brand_id = req.body.car_brand_id;
    try {
      connection.query("call sp_car_brand_mast_fill", (err, result) => {
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

exports.car_brand_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_car_brand_id = req.body.car_brand_id;
    let in_car_brand_name = req.body.car_brand_name;
    try {
      if (!in_car_brand_id) {
        res.status(400).json({ message: "enter car_brand_id" });
      }
      if (!in_car_brand_name) {
        res.status(400).json({ message: "enter car_brand_name" });
      } else {
        connection.query(
          "call sp_car_brand_mast_save(?,?)",
          [in_car_brand_id, in_car_brand_name],
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

exports.car_brand_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_car_brand_id = req.body.car_brand_id;

    try {
      if (!in_car_brand_id) {
        res.status(500).json({ message: "enter car brand id" });
      } else {
        connection.query(
          "call sp_car_brand_mast_delete(?)",
          [in_car_brand_id],
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
