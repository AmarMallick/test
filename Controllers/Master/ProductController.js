const fs = require("fs");
const pdf = require("pdf-creator-node");
const path = require("path");
const connection = require("./../../db/mysql");
const options = require("../../helper/options");
require("dotenv").config();
const productPdf = (req, res) => {
  try {
    const { id } = req.body;
    if (!id) {
      res.status(400).json({ success: 0, data: "inventory id is required" });
    }

    if (!req.body.category) {
      res.status(400).json({ success: 0, data: "Category is required" });
    }
    let category = req.body.category.toLowerCase().split(" ").join("_");
    let query = "";
    let selected_query = "";
    if (category == "mobile") {
      selected_query = `SELECT brd.brand_name as 'BRAND',mob.model_name as 'MODEL NAME',rm.value as 'RAM',ro.value as 'ROM',mob.mo_colour as 'COLOUR',mob.mo_front_camera as 'FRONT CAMERA', mob.mo_rear_camera as 'REAR CAMERA', mob.mo_battery as 'BATTERY',
      CASE WHEN mob.mo_bill = 1 THEN 'Yes' ELSE 'No' END as 'BILL', 
      CASE WHEN mob.mo_box = 1 THEN 'Yes' ELSE 'No' END as 'BOX', 
      CASE WHEN mob.mo_charger = 1 THEN 'Yes' ELSE 'No' END as 'CHARGER', 
      CASE WHEN mob.mo_headset = 1 THEN 'Yes' ELSE 'No' END as 'HEADSET', 
      mob.mo_warranty as 'WARRANTY', 
      CASE WHEN mob.insurance = 1 THEN 'Yes' ELSE 'No' END as 'INSURANCE', 
      mob.description as 'DESCRIPTION'
      from mobile_inventory_mast as mob
      left join mobile_brand_mast as brd on mob.brand_id = brd.brand_id
      left join mobile_ram_mast as rm on mob.mo_ram = rm.id
      left join mobile_rom_mast as ro on mob.mo_rom = ro.id
        where mob.mo_inventory_id = ${id};`;
      query = `SELECT mo.mo_inventory_id as id,mo.mo_title as title,mo.mo_colour as colour,mo.mo_price as price,mo.mo_picture_link_1 as product_pic,mo.description,um.name as uname,um.profile_picture_link as profile,um.created_at
                  FROM mobile_inventory_mast as mo
                  left join user_mast as um on mo.user_id = um.login_id
                  where mo.mo_inventory_id = ${id};`;
    } else if (category == "all") {
      query = `SELECT all.all_inventory_id as id,all.title,price,all.picture_link_1 as product_pic,all.description,um.name as uname,um.profile_picture_link as profile,um.created_at
                FROM all_inventory_mast  as all
                left join user_mast as um on all.user_id = um.login_id
                where all.all_inventory_id = ${id};`;
    } else if (category == "car_rent") {
      selected_query = `SELECT car_type.value as 'CAR TYPE', car_fuel.car_fuel_name as 'FUEL NAME'
        from car_rent_inventory_mast as car_rent
        left join car_type_mast as car_type on car_rent.c_car_type = car_type.id
        left join car_fuel_type_mast as car_fuel on car_rent.car_fuel_id = car_fuel.car_fuel_id
        where car_rent.car_rent_inventory_id = ${id};`;
      query = `SELECT c.car_rent_inventory_id as id,c.car_title as title,c.c_price as price,c.c_picture_link_1 as product_pic,c.c_description as description,um.name as uname,um.profile_picture_link as profile,um.created_at
                  FROM car_rent_inventory_mast as c 
                  left join user_mast as um on c.user_id = um.login_id
                  where c.car_rent_inventory_id = ${id};`;
    } else if (category == "car_sell") {
      selected_query = `SELECT brd.car_brand_name as 'BRAND', car_model.name as 'MODEL NAME', car_owner.name as 'OWNER NAME', car_reg.value as 'REGISTRATION', car_fuel.car_fuel_name as 'FUEL NAME'
        from car_sell_inventory_mast as car_sell
        left join car_brand_mast as brd on car_sell.car_brand_id = brd.car_brand_id
        left join car_model_name_mast as car_model on car_sell.car_model_name = car_model.id
        left join car_owner_mast as car_owner on car_sell.c_owner = car_owner.id
        left join car_registration_mast as car_reg on car_sell.c_registration = car_reg.id
        left join car_fuel_type_mast as car_fuel on car_sell.car_fuel_id = car_fuel.car_fuel_id
        where car_sell.car_sell_inventory_id = ${id};`;
      query = `SELECT c.car_sell_inventory_id as id,c.car_title as title,c.c_price as price,c.c_picture_link_1 as product_pic,c.c_colour as colour,c.i_description as description,um.name as uname,um.profile_picture_link as profile,um.created_at
                FROM car_sell_inventory_mast as c 
                left join user_mast as um on c.user_id = um.login_id
                where c.car_sell_inventory_id = ${id};`;
    } else if (category == "job") {
      selected_query = `SELECT job_type.j_type_name as 'JOB TYPE', pos_type.p_type_name as 'POSITION TYPE', sal.s_p_name as 'SALARY PERIOD'
        from job_inventory_mast as job
        left join job_type_mast as job_type on job.j_type_id = job_type.j_type_id
        left join position_type_mast as pos_type on job.p_type_id = pos_type.p_type_id
        left join salary_period_mast as sal on job.s_p_id = sal.s_p_id
        where job.job_inventory_id = ${id};`;
      query = `SELECT j.job_inventory_id as id,j.j_title as title,j.j_description as description,j.from_salary,j.to_salary,j.j_picture_link_1 as product_pic,um.name as uname,um.profile_picture_link as profile,um.created_at 
                FROM job_inventory_mast as j 
                left join user_mast as um on j.user_id = um.login_id
                where j.job_inventory_id = ${id};`;
    } else if (category == "office") {
      selected_query = `SELECT prty_type.p_type_name as 'PROPERTY TYPE', prty_fur.p_furnishing_name as 'PROPERTY FURNISHING', prty_car.p_car_parking_name as 'PROPERTY CAR PARKING NAME', prty_list.p_listed_by_name as 'PROPERTY LIST BY NAME'
        from office_inventory_mast as ofc
        left join property_type_mast as prty_type on ofc.p_type_id = prty_type.p_type_id
        left join property_furnishing_mast as prty_fur on ofc.p_furnishing_id = prty_fur.p_furnishing_id
        left join property_car_parking_mast as prty_car on ofc.p_car_parking_id = prty_car.p_car_parking_id
        left join property_listed_by_mast as prty_list on ofc.p_listed_by_id = prty_list.p_listed_by_id
        where ofc.office_inventory_id = ${id};`;
      query = `SELECT o.office_inventory_id as id,o.o_title as title,o.o_picture_link_1 as product_pic,o.o_price as price,o.o_description as description,um.name as uname,um.profile_picture_link as profile,um.created_at
                  FROM office_inventory_mast as o 
                  left join user_mast as um on o.user_id = um.login_id
                  where o.office_inventory_id = ${id};`;
    }
    // else if(category == "package") {
    //   selected_query = `SELECT pur_ads.price as 'PURCHASE PRICE'
    //     from package_inventory_mast as pkg
    //     left join purchase_ads_mast as pur_ads on pkg.purchase_ads_id = pur_ads.id
    //     where pkg.id = ${id};`;
    //   query = `SELECT * FROM package_inventory_mast where id = ${id};`;
    // }
    else if (category == "property") {
      selected_query = `SELECT prty_type.p_type_name as 'PROPERTY TYPE', prty_fur.p_furnishing_name as 'PROPERTY FURNISHING', prty_car.p_car_parking_name as 'PROPERTY CAR PARKING NAME', prty_list.p_listed_by_name as 'PROPERTY LIST BY NAME', prty_rent.p_preferred_renters_name as 'PROPERTY PREFERRED RENTER',prty_status.p_status_title as 'PROPERTY STATUS'
        from property_inventory_mast as prop
        left join property_type_mast as prty_type on prop.p_type_id = prty_type.p_type_id
        left join property_furnishing_mast as prty_fur on prop.p_furnishing_id = prty_fur.p_furnishing_id
        left join property_car_parking_mast as prty_car on prop.p_car_parking_id = prty_car.p_car_parking_id
        left join property_listed_by_mast as prty_list on prop.p_listed_by_id = prty_list.p_listed_by_id
        left join property_preferred_renters_mast as prty_rent on prop.p_preferred_renters_id = prty_rent.p_preferred_renters_id
        left join property_status_mast as prty_status on prop.p_status_id = prty_status.p_status_id
        where prop.property_inventory_id = ${id};`;
      query = `SELECT p.property_inventory_id as id,p.p_title as title,p.p_ptice as price,p.p_picture_link_1 as product_pic,p.p_description as description,um.name as uname,um.profile_picture_link as profile,um.created_at  
                    FROM property_inventory_mast as p
                    left join user_mast as um on p.user_id = um.login_id
                    where p.property_inventory_id = ${id};`;
    } else if (category == "vehicle") {
      selected_query = `SELECT vcle_type.v_type_name as 'VEHICLE NAME'
      from vehicle_inventory_mast as vcle
      left join vehicle_type_mast as vcle_type on vcle.v_type_id = vcle_type.v_type_id
      where vcle.vehicle_inventory_id = ${id};`;
      query = `SELECT v.vehicle_inventory_id as id,v.v_title as title,v.v_ptice as price,v.v_picture_link_1 as product_pic,v.v_description as description,um.name as uname,um.profile_picture_link as profile,um.created_at
      FROM vehicle_inventory_mast as v
      left join user_mast as um on v.user_id = um.login_id
      where v.vehicle_inventory_id = ${id};`;
    }
    if (selected_query != "" && query != "") {
      connection.query(query, (err, rest) => {
        if (err) {
          res.status(500).json({ success: 0, data: err });
        } else {
          connection.query(selected_query, (e, result) => {
            if (e) {
              res.status(500).json({ success: 0, data: e });
            } else {
              const html = fs.readFileSync(
                path.join(__dirname, "../../views/template.html"),
                "utf-8"
              );
              const filename = Math.random() + "_doc" + ".pdf";
              const obj = {
                allData: rest[0],
                selectedData: Object.entries(result[0]),
              };
              const document = {
                html: html,
                data: {
                  finalData: obj,
                },
                path: "./docs/" + filename,
              };
              pdf
                .create(document, options)
                .then((res) => {
                  console.log('res',res)
                })
                .catch((error) => {
                  res.status(500).json({ success: 0, data: error });
                });
              const filepath = `${process.env.PDF_URL}/docs/` + filename;
              res.status(200).json({ success: 1, path: filepath });
            }
          });
        }
      });
    } else {
      res.status(400).json({ success: 0, data: "Category data not found" });
    }
  } catch (err) {
    res.status(500).json({ success: 0, data: err });
  }
};

module.exports = {
  productPdf,
};
