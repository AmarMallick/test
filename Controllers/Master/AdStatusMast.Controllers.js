const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.ad_status_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    try {
      connection.query("call sp_ad_status_mast_fill()", (err, result) => {
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

exports.ad_status_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_ad_status_id = req.body.ad_status_id;
    let in_ad_status = req.body.ad_status;
    let in_ad_status_message = req.body.ad_status_message;
    let in_ad_status_filter_name = req.body.ad_status_filter_name;

    try {
      if (!in_ad_status_id) {
        res.status(400).json({ mesaage: "enter in_ad_status_id" });
      } else if (!in_ad_status) {
        res.status(400).json({ mesaage: "enter in_ad_status" });
      } else if (!in_ad_status_message) {
        res.status(400).json({ mesaage: "enter in_ad_status_message" });
      } else if (!in_ad_status_filter_name) {
        res.status(400).json({ mesaage: "enter in_ad_status_filter_name" });
      } else {
        connection.query(
          "call sp_ad_status_mast_save(?,?,?,?)",
          [
            in_ad_status_id,
            in_ad_status,
            in_ad_status_message,
            in_ad_status_filter_name,
          ],
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

exports.ad_status_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_ad_status_id = req.body.ad_status_id;

    try {
      if (!in_ad_status_id) {
        res.status(400).json({ message: "ennter ad_status_id" });
      } else {
        connection.query(
          "call sp_ad_status_mast_delete(?)",
          [in_ad_status_id],
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
