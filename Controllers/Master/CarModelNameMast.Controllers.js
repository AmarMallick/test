const connection = require("../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.car_model_name_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_brand_id = req.body.brand_id;
    try {
      connection.query(
        "call sp_car_model_name_mast_fill(?)",
        [in_brand_id],
        (err, result) => {
          if (err) {
            res.status(500).json({ success: 0, data: err });
          } else {
            res.status(200).json({ success: 1, data: result[0] });
          }
        }
      );
    } catch (err) {
      res.status(500).json({ success: 0, data: err });
    }
  });
};

exports.car_model_name_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;
    let in_name = req.body.name;
    let in_brand_id = req.body.brand_id;

    try {
      if (!in_id) {
        res.status(400).json({ messaage: "enter id" });
      } else if (!in_name) {
        res.status(400).json({ messaage: "enter name" });
      } else if (!in_brand_id) {
        res.status(400).json({ messaage: "enter brand_id" });
      } else {
        connection.query(
          "call sp_car_model_name_mast_save(?,?,?)",
          [in_id, in_name, in_brand_id],
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

exports.car_model_name_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;

    try {
      if (!in_id) {
        res.status(500).json({ message: "enter id" });
      } else {
        connection.query(
          "call sp_car_model_name_mast_delete(?)",
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
