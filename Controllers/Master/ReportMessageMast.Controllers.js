const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.report_message_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_type = req.body.type;

    try {
      connection.query(
        "call sp_report_message_mast_fill(?)",
        [in_type],
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

exports.report_message_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;
    let in_report_msg = req.body.report_msg;
    let in_type = req.body.type;

    try {
      if (!in_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else if (!in_report_msg) {
        res.status(400).json({ data: [{ message: "Enter report_msg " }] });
      } else if (!in_type) {
        res.status(400).json({ data: [{ message: "Enter type " }] });
      } else {
        connection.query(
          "call sp_report_message_mast_save(?,?,?)",
          [in_id, in_report_msg, in_type],
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

exports.report_message_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;

    try {
      if (!in_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else {
        connection.query(
          "call sp_report_message_mast_delete(?)",
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
