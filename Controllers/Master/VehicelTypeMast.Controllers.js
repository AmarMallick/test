const connection = require("../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.vehicle_type_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_v_type_id = req.body.v_type_id;

    try {
      connection.query(
        "call sp_vehicle_type_mast_fill(?)",
        [in_v_type_id],
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

exports.vehicle_type_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_v_type_id = req.body.v_type_id;
    let in_v_type_name = req.body.v_type_name;

    try {
      if (!in_v_type_id) {
        res.status(400).json({ data: [{ message: "Enter v_type_id " }] });
      } else if (!in_v_type_name) {
        res.status(400).json({ data: [{ message: "Enter v_type_name " }] });
      } else {
        connection.query(
          "call sp_vehicle_type_mast_save(?,?)",
          [in_v_type_id, in_v_type_name],
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

exports.vehicle_type_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_v_type_id = req.body.v_type_id;

    try {
      if (!in_v_type_id) {
        res.status(400).json({ data: [{ message: "Enter v_type_id " }] });
      } else {
        connection.query(
          "call sp_vehicle_type_mast_delete(?)",
          [in_v_type_id],
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
