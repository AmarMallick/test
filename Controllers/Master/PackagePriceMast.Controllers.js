const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.package_price_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_cat_id = req.body.cat_id;
    try {
      connection.query(
        "call sp_package_price_mast_fill(?)",
        [in_cat_id],
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

exports.package_price_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;
    let in_package_days = req.body.package_days;
    let in_total_ads = req.body.total_ads;
    let in_package_price = req.body.package_price;
    let in_cat_id = req.body.cat_id;
    let in_message = req.body.message;
    let in_total_month = req.body.total_month;

    try {
      if (!in_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else if (!in_package_days) {
        res.status(400).json({ data: [{ message: "Enter package_days " }] });
      } else if (!in_total_ads) {
        res.status(400).json({ data: [{ message: "Enter total_ads " }] });
      } else if (!in_package_price) {
        res.status(400).json({ data: [{ message: "Enter package_price " }] });
      } else if (!in_cat_id) {
        res.status(400).json({ data: [{ message: "Enter cat_id " }] });
      } else if (!in_total_month) {
        res.status(400).json({ data: [{ message: "Enter total_month " }] });
      } else {
        connection.query(
          "call sp_package_price_mast_save(?,?,?,?,?,?,?)",
          [
            in_id,
            in_package_days,
            in_total_ads,
            in_package_price,
            in_cat_id,
            in_message,
            in_total_month,
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

exports.package_price_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;

    try {
      if (!in_id) {
        res.status(400).json({ data: [{ message: "Enter id " }] });
      } else {
        connection.query(
          "call sp_package_price_mast_delete(?)",
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
