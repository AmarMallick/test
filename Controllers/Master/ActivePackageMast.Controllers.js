const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.active_package_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_cat_id = req.body.cat_id;
    let in_pkt_id = req.body.pkt_id;
    let in_act_date = req.body.act_date;
    let in_exp_date = req.body.exp_date;
    let in_total_ad = req.body.total_ad;
    let in_use_ad = req.body.use_ad;
    let in_ava_ad = req.body.ava_ad;
    let in_is_active = req.body.is_active;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    try {
      connection.query(
        "call sp_active_package_mast_save(?,?,?,?,?,?,?,?,?)",
        [
          in_cat_id,
          in_pkt_id,
          in_act_date,
          in_exp_date,
          in_total_ad,
          in_use_ad,
          in_ava_ad,
          in_is_active,
          in_user_id,
        ],
        (err, result) => {
          if (err) {
            res.json({ success: 0, data: err });
          } else {
            res.json({ success: 1, data: result[0] });
          }
        }
      );
    } catch (err) {
      res.json({ success: 0, data: err });
    }
  });
};

exports.active_package_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_is_active = req.body.is_active;
    try {
      connection.query(
        "call sp_active_package_mast_fill(?,?)",
        [in_user_id, in_is_active],
        (err, result) => {
          if (err) {
            res.json({ success: 0, data: err });
          } else {
            res.json({ success: 1, data: result[0] });
          }
        }
      );
    } catch (err) {
      res.json({ success: 0, data: err });
    }
  });
};
