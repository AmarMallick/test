const connection = require("../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.dynamic_field_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_display_type_id = req.body.display_type_id;
    let in_cat_id = req.body.cat_id;
    try {
      connection.query(
        "call sp_dynamic_field_mast_fill(?,?)",
        [in_display_type_id, in_cat_id],
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

exports.dynamic_field_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;
    let in_db_field = req.body.db_field;
    let in_display_name = req.body.display_name;
    let in_display_type_id = req.body.display_type_id;
    let in_cat_id = req.body.cat_id;
    let in_sequence = req.body.sequence;
    let in_icon = req.body.icon;
    let in_is_active = req.body.is_active;

    try {
      if (!in_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else if (!in_db_field) {
        res.status(400).json({ data: [{ message: "Enter db_field " }] });
      } else if (!in_display_name) {
        res.status(400).json({ data: [{ message: "Enter display_name " }] });
      } else if (!in_display_type_id) {
        res.status(400).json({ data: [{ message: "Enter display_type_id " }] });
      } else if (!in_cat_id) {
        res.status(400).json({ data: [{ message: "Enter cat_id " }] });
      } else if (!in_sequence) {
        res.status(400).json({ data: [{ message: "Enter sequence " }] });
      } else if (!in_is_active) {
        res.status(400).json({ data: [{ message: "Enter is_active " }] });
      } else {
        connection.query(
          "call sp_dynamic_field_mast_save(?,?,?,?,?,?,?,?)",
          [
            in_id,
            in_db_field,
            in_display_name,
            in_display_type_id,
            in_cat_id,
            in_sequence,
            in_icon,
            in_is_active,
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

exports.dynamic_field_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;

    try {
      if (!in_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else {
        connection.query(
          "call sp_dynamic_field_mast_delete(?)",
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
