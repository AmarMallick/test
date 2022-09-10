const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.package_inventory_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    try {
      connection.query(
        "call sp_package_inventory_mast_fill(?)",
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

exports.package_inventory_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_inventory_code = req.body.inventory_code;
    let in_inventory_type = req.body.inventory_type;
    let in_purchase_ads_id = req.body.purchase_ads_id;
    // let in_IsMobile = req.body.IsMobile;

    try {
      if (!in_user_id) {
        res.status(400).json({ data: [{ message: "Enter user_id " }] });
      } else if (!in_inventory_code) {
        res.status(400).json({ data: [{ message: "Enter inventory_code " }] });
      } else if (!in_inventory_type) {
        res.status(400).json({ data: [{ message: "Enter inventory_type " }] });
      } else if (!in_purchase_ads_id) {
        res.status(400).json({ data: [{ message: "Enter purchase_ads_id " }] });
      } else {
        connection.query(
          "call sp_package_inventory_mast_save(?,?,?,?)",
          [
            in_user_id,
            in_inventory_code,
            in_inventory_type,
            in_purchase_ads_id,
          ],
          (err, result) => {
            if (err) {
              res.status(500).json({ success: 0, data: err });
            } else {
              if (result[0].length == 0) {
                res.status(201).json({ success: 1, data: result[1] });
              } else {
                res.status(201).json({ success: 1, data: result[0] });
              }
            }
          }
        );
      }
    } catch (err) {
      res.status(500).json({ success: 0, data: err });
    }
  });
};
