const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.job_type_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    try {
      connection.query("call sp_job_type_mast_fill()", (err, result) => {
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

exports.job_type_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_j_type_id = req.body.j_type_id;
    let in_j_type_name = req.body.j_type_name;

    try {
      if (!in_j_type_id) {
        res.status(400).json({ data: [{ message: "Enter j_type_id " }] });
      } else if (!in_j_type_name) {
        res
          .status(400)
          .json({ data: [{ message: "Select from j_type_name " }] });
      } else {
        connection.query(
          "call sp_job_type_mast_save(?,?)",
          [in_j_type_id, in_j_type_name],
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

exports.job_type_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_j_type_id = req.body.j_type_id;

    try {
      if (!in_j_type_id) {
        res.status(400).json({ data: [{ message: "Enter j_type_id " }] });
      } else {
        connection.query(
          "call sp_job_type_mast_delete(?)",
          [in_j_type_id],
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
