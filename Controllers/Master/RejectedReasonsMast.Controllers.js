const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.rejected_reasons_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_is_active = req.body.is_active;
    try {
      connection.query(
        "call sp_rejected_reasons_mast_fill(?)",
        [in_is_active],
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

exports.rejected_reasons_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_reject_id = req.body.reject_id;
    let in_resons = req.body.reason;
    let in_sequence_no = req.body.sequence_no;
    let in_is_active = req.body.is_active;

    try {
      if (!in_reject_id) {
        res.status(400).json({ data: [{ message: "Enter reject_id " }] });
      } else if (!in_resons) {
        res.status(400).json({ data: [{ message: "Enter resons " }] });
      } else if (!in_sequence_no) {
        res.status(400).json({ data: [{ message: "Enter sequence_no " }] });
      } else if (!in_is_active) {
        res.status(400).json({ data: [{ message: "Enter is_active " }] });
      } else {
        connection.query(
          "call sp_rejected_reasons_mast_save(?,?,?,?)",
          [in_reject_id, in_resons, in_sequence_no, in_is_active],
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

exports.rejected_reasons_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_reject_id = req.body.reject_id;

    try {
      if (!in_reject_id) {
        res.status(400).json({ data: [{ message: "Enter reject_id " }] });
      } else {
        connection.query(
          "call sp_rejected_reasons_mast_delete(?)",
          [in_reject_id],
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
