const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.salary_period_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    try {
      connection.query("call sp_salary_period_mast_fill()", (err, result) => {
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

exports.salary_period_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_s_p_id = req.body.s_p_id;
    let in_s_p_name = req.body.s_p_name;

    try {
      if (!in_s_p_id) {
        res.status(400).json({ data: [{ message: "Enter s_p_id " }] });
      } else if (!in_s_p_name) {
        res.status(400).json({ data: [{ message: "Enter s_p_name " }] });
      } else {
        connection.query(
          "call sp_salary_period_mast_save(?,?)",
          [in_s_p_id, in_s_p_name],
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

exports.salary_period_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_s_p_id = req.body.s_p_id;

    try {
      if (!in_s_p_id) {
        res.status(400).json({ data: [{ message: "Enter s_p_id " }] });
      } else {
        connection.query(
          "call sp_salary_period_mast_delete(?)",
          [in_s_p_id],
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
