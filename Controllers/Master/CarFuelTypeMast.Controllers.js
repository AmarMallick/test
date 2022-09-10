const connection = require("../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.car_fuel_type_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_car_fuel_id = req.body.car_fuel_id;
    try {
      connection.query("call sp_car_fuel_type_mast_fill()", (err, result) => {
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

exports.car_fuel_type_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_car_fuel_id = req.body.car_fuel_id;
    let in_car_fuel_name = req.body.car_fuel_name;

    try {
      if (!in_car_fuel_id) {
        res.status(400).json({ messaage: "enter car_fuel_id" });
      } else if (!in_car_fuel_name) {
        res.status(400).json({ messaage: "enter car_fuel_name" });
      } else {
        connection.query(
          "call sp_car_fuel_type_mast_save(?,?)",
          [in_car_fuel_id, in_car_fuel_name],
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

exports.car_fuel_type_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_car_fuel_id = req.body.car_fuel_id;

    try {
      if (!in_car_fuel_id) {
        res.status(400).json({ message: "enter car_fuel_id " });
      } else {
        connection.query(
          "call sp_car_fuel_type_mast_delete(?)",
          [in_car_fuel_id],
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
