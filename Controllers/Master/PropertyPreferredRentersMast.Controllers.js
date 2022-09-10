const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.property_preferred_renters_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    try {
      connection.query(
        "call sp_property_preferred_renters_mast_fill()",
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

exports.property_preferred_renters_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_p_preferred_renters_id = req.body.p_preferred_renters_id;
    let in_p_preferred_renters_name = req.body.p_preferred_renters_name;

    try {
      if (!in_p_preferred_renters_id) {
        res
          .status(400)
          .json({ data: [{ message: "Enter p_preferred_renters_id " }] });
      } else if (!in_p_preferred_renters_name) {
        res
          .status(400)
          .json({ data: [{ message: "Enter p_preferred_renters_name " }] });
      } else {
        connection.query(
          "call sp_property_preferred_renters_mast_save(?,?)",
          [in_p_preferred_renters_id, in_p_preferred_renters_name],
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

exports.property_preferred_renters_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_p_preferred_renters_id = req.body.p_preferred_renters_id;

    try {
      if (!in_p_preferred_renters_id) {
        res
          .status(400)
          .json({ data: [{ message: "Enter p_preferred_renters_id " }] });
      } else {
        connection.query(
          "call sp_property_preferred_renters_mast_delete(?)",
          [in_p_preferred_renters_id],
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
