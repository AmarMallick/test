const connection = require("../../db/mysql");
const multer = require("multer");

const jwt = require("jsonwebtoken");

exports.near_by_location_category_data = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_cat_id = req.body.cat_id;
    let in_sub_cat_id = req.body.sub_cat_id;
    let in_limit = req.body.limit;
    let in_page_no = req.body.page_no;
    let in_latitude = req.body.latitude;
    let in_longitude = req.body.longitude;
    let in_price_from = req.body.price_from;
    let in_price_to = req.body.price_to;
    let in_brand_id = req.body.brand_id;
    let in_job_salary_from = req.body.job_salary_from;
    let in_job_salary_to = req.body.job_salary_to;
    let in_distance_from = req.body.distance_from;
    let in_distance_to = req.body.distance_to;
    let in_distance_sorting = req.body.distance_sorting;
    let in_date_sorting = req.body.date_sorting;
    let in_price_sorting = req.body.price_sorting;
    let in_sponser_near_by_location_category =
      req.body.sponser_near_by_location_category;

    if (in_price_from == "") {
      in_price_from = 0;
    }
    if (in_price_to == "") {
      in_price_to = 0;
    }
    if (in_job_salary_from == "") {
      in_job_salary_from = 0;
    }
    if (in_job_salary_to == "") {
      in_job_salary_to = 0;
    }

    try {
      connection.query(
        "call sp_near_by_location_category_data(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        [
          in_cat_id,
          in_sub_cat_id,
          in_limit,
          in_page_no,
          in_latitude,
          in_longitude,
          in_price_from,
          in_price_to,
          in_brand_id,
          in_job_salary_from,
          in_job_salary_to,
          in_distance_from,
          in_distance_to,
          in_distance_sorting,
          in_date_sorting,
          in_price_sorting,
          in_sponser_near_by_location_category,
        ],
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
            res.status(201).json({
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

exports.product_detail = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_inventory_code = req.body.inventory_code;
    let in_cat_id = req.body.cat_id;

    try {
      connection.query(
        "call sp_product_detail(?,?)",
        [in_inventory_code, in_cat_id],
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
