const connection = require("./../../db/mysql");
const multer = require("multer");
const jwt = require("jsonwebtoken");

exports.filter_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_cat_id = req.body.cat_id;
    let in_sub_cat_id = req.body.sub_cat_id;
    try {
      connection.query(
        "call sp_filter_mast_fill(?,?)",
        [in_cat_id, in_sub_cat_id],
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

exports.filter_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_f_id = req.body.f_id;
    let in_cat_id = req.body.cat_id;
    let in_sub_cat_id = req.body.sub_cat_id;
    let in_from_price = req.body.from_price;
    let in_to_price = req.body.to_price;
    let in_from_distance = req.body.from_distance;
    let in_to_distance = req.body.to_distance;
    let in_publish_date = req.body.publish_date;
    let in_m_brand_id = req.body.m_brand_id;
    let in_p_type_id = req.body.p_type_id;
    let in_p_bedroom = req.body.p_bedroom;
    let in_p_bathroom = req.body.p_bathroom;
    let in_p_status_id = req.body.p_status_id;
    let in_car_brand = req.body.car_brand;
    let in_car_year = req.body.car_year;
    let in_car_kms = req.body.car_kms;
    let in_v_type_id = req.body.v_type_id;
    let in_j_type_id = req.body.j_type_id;
    let in_j_position_type_id = req.body.j_position_type_id;
    let in_j_s_period_id = req.body.j_s_period_id;
    let in_from_salary = req.body.from_salary;
    let in_to_salary = req.body.to_salary;
    let in_budget = req.body.budget;

    if (!in_f_id) {
      res.status(400).json({ data: [{ message: "Enter f_id " }] });
    } else if (!in_cat_id) {
      res.status(400).json({ data: [{ message: "Enter cat_id " }] });
    } else if (!in_sub_cat_id) {
      res.status(400).json({ data: [{ message: "Enter sub_cat_id " }] });
    } else if (!in_from_price) {
      res.status(400).json({ data: [{ message: "Enter from_price " }] });
    } else if (!in_to_price) {
      res.status(400).json({ data: [{ message: "Enter to_price " }] });
    } else if (!in_from_distance) {
      res.status(400).json({ data: [{ message: "Enter from_distance " }] });
    } else if (!in_to_distance) {
      res.status(400).json({ data: [{ message: "Enter to_distance " }] });
    } else if (!in_publish_date) {
      res.status(400).json({ data: [{ message: "Enter publish_date " }] });
    } else if (!in_m_brand_id) {
      res.status(400).json({ data: [{ message: "Enter m_brand_id " }] });
    } else if (!in_p_type_id) {
      res.status(400).json({ data: [{ message: "Enter p_type_id " }] });
    } else if (!in_p_bedroom) {
      res.status(400).json({ data: [{ message: "Enter p_bedroom " }] });
    } else if (!in_p_bathroom) {
      res.status(400).json({ data: [{ message: "Enter p_bathroom " }] });
    } else if (!in_p_status_id) {
      res.status(400).json({ data: [{ message: "Enter p_status_id " }] });
    } else if (!in_car_brand) {
      res.status(400).json({ data: [{ message: "Enter car_brand " }] });
    } else if (!in_car_year) {
      res.status(400).json({ data: [{ message: "Enter car_year " }] });
    } else if (!in_car_kms) {
      res.status(400).json({ data: [{ message: "Enter car_kms " }] });
    } else if (!in_v_type_id) {
      res.status(400).json({ data: [{ message: "Enter v_type_id " }] });
    } else if (!in_j_type_id) {
      res.status(400).json({ data: [{ message: "Enter j_type_id " }] });
    } else if (!in_j_position_type_id) {
      res
        .status(400)
        .json({ data: [{ message: "Enter j_position_type_id " }] });
    } else if (!in_j_s_period_id) {
      res.status(400).json({ data: [{ message: "Enter j_s_period_id " }] });
    } else if (!in_from_salary) {
      res.status(400).json({ data: [{ message: "Enter from_salary " }] });
    } else if (!in_to_salary) {
      res.status(400).json({ data: [{ message: "Enter to_salary " }] });
    } else if (!in_budget) {
      res.status(400).json({ data: [{ message: "Enter budget " }] });
    } else {
      connection.query(
        "call sp_filter_mast_save(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        [
          in_f_id,
          in_cat_id,
          in_sub_cat_id,
          in_from_price,
          in_to_price,
          in_from_distance,
          in_to_distance,
          in_publish_date,
          in_m_brand_id,
          in_p_type_id,
          in_p_bedroom,
          in_p_bathroom,
          in_p_status_id,
          in_car_brand,
          in_car_year,
          in_car_kms,
          in_v_type_id,
          in_j_type_id,
          in_j_position_type_id,
          in_j_s_period_id,
          in_from_salary,
          in_to_salary,
          in_budget,
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
  });
};

exports.filter_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_f_id = req.body.f_id;

    try {
      if (!in_f_id) {
        res.status(400).json({ data: [{ message: "Enter f_id " }] });
      } else {
        connection.query(
          "call sp_filter_mast_delete(?)",
          [in_f_id],
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
