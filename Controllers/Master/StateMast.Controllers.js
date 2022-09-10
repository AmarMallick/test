const connection = require("../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.state_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    try {
      connection.query("call sp_state_mast_fill()", (err, result) => {
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

exports.state_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;
    let in_state_name = req.body.state_name;

    try {
      if (!in_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else if (!in_state_name) {
        res.status(400).json({ data: [{ message: "Enter state_name " }] });
      } else {
        connection.query(
          "call sp_state_mast_save(?,?)",
          [in_id, in_state_name],
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

exports.state_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;

    try {
      if (!in_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else {
        connection.query(
          "call sp_state_mast_delete(?)",
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
