const connection = require("../../db/mysql");
const multer = require("multer");

const jwt = require("jsonwebtoken");

exports.near_by_location_data = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_latitude = req.body.latitude;
    let in_longitude = req.body.longitude;
    let in_from = req.body.from;
    let in_to = req.body.to;
    let in_limit = req.body.limit;
    let in_page_no = req.body.page_no;
    let in_sponser_near_by_location = req.body.sponser_near_by_location;

    try {
      connection.query(
        "call sp_near_by_location_data(?,?,?,?,?,?,?)",
        [
          in_latitude,
          in_longitude,
          in_from,
          in_to,
          in_limit,
          in_page_no,
          in_sponser_near_by_location,
        ],
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
            res
              .status(200)
              .json({
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
