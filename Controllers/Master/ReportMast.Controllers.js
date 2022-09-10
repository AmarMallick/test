const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.report_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    try {
      connection.query(
        "call sp_report_mast_fill(?)",
        [in_user_id],
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

exports.report_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_report_msg_id = req.body.report_msg_id;
    let in_comment = req.body.comment;

    try {
      if (!in_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else if (!in_user_id) {
        res.status(400).json({ data: [{ message: "Enter user_id " }] });
      } else if (!in_report_msg_id) {
        res.status(400).json({ data: [{ message: "Enter report_msg_id " }] });
      } else if (!in_comment) {
        res.status(400).json({ data: [{ message: "Enter comment " }] });
      } else {
        connection.query(
          "call sp_report_mast_save(?,?,?,?)",
          [in_id, in_user_id, in_report_msg_id, in_comment],
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
