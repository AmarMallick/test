const connection = require("../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.device_token_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    try {
      connection.query("select * from device_token_mast", (err, result) => {
        if (err) {
          res.status(500).json({ success: 0, data: err });
        } else {
          res.status(200).json({ success: 1, data: result });
        }
      });
    } catch (err) {
      res.status(500).json({ success: 0, data: err });
    }
  });
};

exports.device_token_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_device_token_id = req.body.id;
    let in_device_type = req.body.device_type;
    let in_device_unq_id = req.body.unq_id;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_device_token = req.body.device_token;

    try {
      if (!in_device_token_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else if (!in_device_type) {
        res.status(400).json({ data: [{ message: "Enter device_type " }] });
      } else if (!in_device_unq_id) {
        res.status(400).json({ data: [{ message: "Enter unq_id " }] });
      } else if (!in_user_id) {
        res.status(400).json({ data: [{ message: "Enter user_id " }] });
      } else if (!in_device_token) {
        res.status(400).json({ data: [{ message: "Enter user_token " }] });
      } else {
        connection.query(
          "call sp_device_token_mast_save(?,?,?,?,?)",
          [
            in_device_token_id,
            in_device_type,
            in_device_unq_id,
            in_user_id,
            in_device_token,
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

exports.device_token_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_device_token_id = req.body.id;

    try {
      if (!in_device_token_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else {
        connection.query(
          "call sp_device_token_mast_delete(?)",
          [in_device_token_id],
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

exports.notification_subscribe = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_device_token_id = req.body.device_token_id;
    let in_subscribe = req.body.subscribe;
    try {
      connection.query(
        "call sp_notification_subscribe(?,?)",
        [in_device_token_id, in_subscribe],
        (err, result) => {
          if (err) {
            res.status(500).json({ success: 0, data: err });
          } else {
            res.status(201).json({ success: 1, data: result[0] });
          }
        }
      );
    } catch (err) {
      res.status(500).json({ success: 0, data: err });
    }
  });
};
