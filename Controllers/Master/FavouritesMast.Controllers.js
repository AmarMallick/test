const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.favourites_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_limit = req.body.limit;
    let in_page_no = req.body.page_no;
    try {
      connection.query(
        "call sp_favourites_mast_fill(?,?,?)",
        [in_user_id, in_limit, in_page_no],
        (err, result) => {
          if (err) {
            res.status(500).json({ success: 0, data: err });
          } else {
            let all_pages = result[0][0]
              ? result[0][0].total_count / in_limit
              : 0;
            let pages = (
              result[0][0] ? result[0][0].total_count % in_limit == 0 : 0
            )
              ? 0
              : 1;
            let total_page =
              in_page_no > parseInt(all_pages) + pages || in_page_no == 0
                ? 0
                : parseInt(all_pages) + pages;
            res
              .status(200)
              .json({
                success: 1,
                total_pages: total_page,
                total_results: result[0][0] ? result[0][0].total_count : 0,
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

exports.favourites_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_fav_id = req.body.fav_id;
    let in_inventory_id = req.body.inventory_id;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_inventory_code = req.body.inventory_code;
    let in_inventory_type = req.body.inventory_type;

    try {
      if (!in_fav_id) {
        res.status(400).json({ data: [{ message: "Enter fav_id " }] });
      } else if (!in_inventory_id) {
        res.status(400).json({ data: [{ message: "Enter inventory_id " }] });
      } else if (!in_user_id) {
        res.status(400).json({ data: [{ message: "Enter user_id " }] });
      } else if (!in_inventory_code) {
        res.status(400).json({ data: [{ message: "Enter inventory_code " }] });
      } else if (!in_inventory_type) {
        res.status(400).json({ data: [{ message: "Enter inventory_type " }] });
      } else {
        connection.query(
          "call sp_favourites_mast_save(?,?,?,?,?)",
          [
            in_fav_id,
            in_inventory_id,
            in_user_id,
            in_inventory_code,
            in_inventory_type,
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

exports.favourites_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_fav_id = req.body.fav_id;

    try {
      if (!in_fav_id) {
        res.status(400).json({ data: [{ message: "Enter fav_id " }] });
      } else {
        connection.query(
          "call sp_favourites_mast_delete(?)",
          [in_fav_id],
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
