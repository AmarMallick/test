const connection = require("../../db/mysql");
const multer = require("multer");

const jwt = require("jsonwebtoken");

exports.autocomplete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_searchtxt = req.body.searchtxt;
    let in_limit = req.body.limit;
    let in_page_no = req.body.page_no;

    try {
      connection.query(
        "call sp_autocomplete(?,?,?)",
        [in_searchtxt, in_limit, in_page_no],
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

            res.status(200).json({
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

exports.autocompleteTitle = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_searchtxt = req.body.searchtxt;
    let in_limit = req.body.limit;
    let in_page_no = req.body.page_no;

    try {
      connection.query(
        "call sp_autocomplete_title(?,?,?)",
        [in_searchtxt, in_limit, in_page_no],
        (err, result) => {
          if (err) {
            res.status(500).json({ success: 0, data: err });
          } else {
            let all_pages =
              result[0].length > 0 ? result[0].length / in_limit : 0;
            let pages = (
              result[0].length > 0 ? result[0].length % in_limit == 0 : 0
            )
              ? 0
              : 1;
            let total_page =
              in_page_no > parseInt(all_pages) + pages || in_page_no == 0
                ? 0
                : parseInt(all_pages) + pages;

            res.status(200).json({
              success: 1,
              total_pages: total_page,
              total_results: result[0].length,
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
