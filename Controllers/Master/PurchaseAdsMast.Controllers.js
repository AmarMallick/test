const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.purchase_ads_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_user_id = req.body.user_id;
    let cat_id = req.body.cat_id;
    try {
      if (!cat_id) {
        res.status(400).json({ data: [{ message: "Enter category id " }] });
      } else {
        connection.query(
          "call sp_purchase_ads_mast_fill(?,?)",
          [in_user_id, cat_id],
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
exports.my_purchase_ads_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_user_id = req.body.user_id;
    let is_active = req.body.is_active;
    try {
      if (!is_active) {
        res
          .status(400)
          .json({ data: [{ message: "Enter category is_active " }] });
      } else {
        connection.query(
          "call sp_my_purchase_ads_mast_fill(?,?)",
          [in_user_id, is_active],
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

exports.purchase_ads_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_pkt_id = req.body.pkt_id;
    let in_price = req.body.price;
    let in_is_active = req.body.is_active;
    let in_total_ads = req.body.total_ads;
    let in_use_ads = req.body.use_ads;
    let in_ava_ads = req.body.ava_ads;

    try {
      if (!in_user_id) {
        res.status(400).json({ data: [{ message: "Enter user_id " }] });
      } else if (!in_pkt_id) {
        res.status(400).json({ data: [{ message: "Enter pkt_id " }] });
      } else if (!in_price) {
        res.status(400).json({ data: [{ message: "Enter price " }] });
      } else if (!in_is_active) {
        res.status(400).json({ data: [{ message: "Enter is_active " }] });
      } else if (!in_total_ads) {
        res.status(400).json({ data: [{ message: "Enter total_ads " }] });
      } else if (!in_use_ads) {
        res.status(400).json({ data: [{ message: "Enter use_ads " }] });
      } else if (!in_ava_ads) {
        res.status(400).json({ data: [{ message: "Enter ava_ads " }] });
      } else {
        connection.query(
          "call sp_purchase_ads_mast_save(?,?,?,?,?,?,?)",
          [
            in_user_id,
            in_pkt_id,
            in_price,
            in_is_active,
            in_total_ads,
            in_use_ads,
            in_ava_ads,
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

exports.purchase_ads_mast_update = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;
    let in_is_active = req.body.is_active;

    try {
      if (!in_id) {
        res.status(400).json({ data: [{ message: "Enter id" }] });
      } else if (!in_is_active) {
        res.status(400).json({ data: [{ message: "Enter is_active " }] });
      } else {
        connection.query(
          "call sp_purchase_ads_mast_update(?,?)",
          [in_id, in_is_active],
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

exports.job_purchase_ads_mast_update = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    try {
      connection.query(
        "call sp_job_purchase_ads_mast_save_update()",
        [],
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
