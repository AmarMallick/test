const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.ads_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_limit = req.body.limit;
    let in_page_no = req.body.page_no;
    let in_ad_status = req.body.ad_status;

    try {
      connection.query(
        "call sp_ads_mast_fill(?,?,?,?)",
        [in_user_id, in_limit, in_page_no, in_ad_status],
        (err, result) => {
          if (err) {
            res.status(500).json({ success: 0, data: err });
          } else {
            let all_pages = result[0][0]
              ? result[0][0].total_record > 0
                ? result[0][0].total_record / in_limit
                : 0
              : 0;
            let pages = result[0][0]
              ? (
                  result[0][0].total_record > 0
                    ? result[0][0].total_record % in_limit == 0
                    : 0
                )
                ? 0
                : 1
              : 0;
            let total_page =
              in_page_no > parseInt(all_pages) + pages || in_page_no == 0
                ? 0
                : parseInt(all_pages) + pages;
            res.status(200).json({
              success: 1,
              total_pages: total_page,
              total_results: result[0][0]
                ? result[0][0].total_record > 0
                  ? result[0][0].total_record
                  : 0
                : 0,
              current_page: parseInt(in_page_no),
              data: result[0],
            });
          }
        }
      );
    } catch (err) {
      res.status(500).json({ success: 0, data: err });
    }
  });
};

exports.ads_status_update = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_ads_id = req.body.ads_id;
    let in_ad_status_id = req.body.ad_status_id;
    try {
      connection.query(
        "call sp_ads_status_update(?,?)",
        [in_ads_id, in_ad_status_id],
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

exports.ads_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_ads_id = req.body.ads_id;

    try {
      if (!in_ads_id) {
        res.status(400).json({ message: "enter asd_is!" });
      } else {
        connection.query(
          "call sp_ads_mast_delete(?)",
          [in_ads_id],
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

exports.likes = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_ads_id = req.body.ads_id;
    let in_likes = req.body.likes;
    try {
      connection.query(
        "call sp_likes(?,?)",
        [in_ads_id, in_likes],
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

exports.views_count_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_ads_id = req.body.ads_id;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;

    try {
      if (!in_ads_id) {
        res.status(400).json({ message: "enter asd_is!" });
      }else {
        connection.query(
          "call sp_views_count_mast_save(?,?)",
          [in_ads_id, in_user_id],
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
exports.views_count_mast_save_update = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    try {
      connection.query(
        "call sp_job_ad_status_mast_save_update()",
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
