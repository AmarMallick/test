const connection = require("./../../db/mysql");
const cloudinary = require("cloudinary").v2;
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.car_rent_inventory_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_car_rent_inventory_code = req.body.car_rent_inventory_code;
    let in_cat_id = req.body.cat_id;

    try {
      connection.query(
        "call sp_car_rent_inventory_mast_fill(?,?)",
        [in_car_rent_inventory_code, in_cat_id],
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

exports.car_rent_inventory_mast_save = async (req, res) => {
  const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, "uploads/");
    },
    filename: function (req, file, cb) {
      cb(null, file.originalname);
    },
  });

  const upload1 = multer({ storage: storage });
  var cpUpload = upload1.fields([
    { name: "c_picture_link_1" },
    { name: "c_picture_link_2" },
    { name: "c_picture_link_3" },
    { name: "c_picture_link_4" },
    { name: "c_picture_link_5" },
    { name: "c_picture_link_6" },
    { name: "c_picture_link_7" },
    { name: "c_picture_link_8" },
    { name: "c_picture_link_9" },
    { name: "c_picture_link_10" },
  ]);
  await cpUpload(req, res, async (err) => {
    let in_car_rent_inventory_id = req.body.car_rent_inventory_id;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_car_title = req.body.car_title;
    let in_c_price = req.body.c_price;
    var in_c_picture_link_1;
    var in_c_picture_link_2;
    var in_c_picture_link_3;
    var in_c_picture_link_4;
    var in_c_picture_link_5;
    var in_c_picture_link_6;
    var in_c_picture_link_7;
    var in_c_picture_link_8;
    var in_c_picture_link_9;
    var in_c_picture_link_10;
    let in_c_km_limit = req.body.c_km_limit;
    let in_c_car_type = req.body.c_car_type;
    // let in_c_extra_charge = req.body.c_extra_charge;
    let in_c_extra_charge = 0;
    let in_c_per_day_charge = req.body.c_per_day_charge;
    let in_car_fuel_id = req.body.car_fuel_id;
    let in_c_with_fuel = req.body.c_with_fuel;
    let in_c_driver = req.body.c_driver;
    let in_c_transmission = req.body.c_transmission;
    let in_c_show_mo_no = req.body.c_show_mo_no;
    let in_c_description = req.body.c_description;
    let in_c_location = req.body.c_location;
    let in_latitude = req.body.latitude;
    let in_longitude = req.body.longitude;
    let in_cat_id = req.body.cat_id;
    let in_sub_cat_id = req.body.sub_cat_id;

    if (req.body.c_picture_link_1) {
      in_c_picture_link_1 = req.body.c_picture_link_1;
    } else {
      if (req.files.c_picture_link_1) {
        path = req.files.c_picture_link_1[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_c_picture_link_1 = await result.url;
          }
        });
      }
    }
    if (req.body.c_picture_link_2) {
      in_c_picture_link_2 = req.body.c_picture_link_2;
    } else {
      if (req.files.c_picture_link_2) {
        path = req.files.c_picture_link_2[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_c_picture_link_2 = await result.url;
          }
        });
      }
    }
    if (req.body.c_picture_link_3) {
      in_c_picture_link_3 = req.body.c_picture_link_3;
    } else {
      if (req.files.c_picture_link_3) {
        path = req.files.c_picture_link_3[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_c_picture_link_3 = await result.url;
          }
        });
      }
    }
    if (req.body.c_picture_link_4) {
      in_c_picture_link_4 = req.body.c_picture_link_4;
    } else {
      if (req.files.c_picture_link_4) {
        path = req.files.c_picture_link_4[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_c_picture_link_4 = await result.url;
          }
        });
      }
    }
    if (req.body.c_picture_link_5) {
      in_c_picture_link_5 = req.body.c_picture_link_5;
    } else {
      if (req.files.c_picture_link_5) {
        path = req.files.c_picture_link_5[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_c_picture_link_5 = await result.url;
          }
        });
      }
      if (req.body.c_picture_link_6) {
        in_c_picture_link_6 = req.body.c_picture_link_6;
      } else {
      }
      if (req.files.c_picture_link_6) {
        path = req.files.c_picture_link_6[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_c_picture_link_6 = await result.url;
          }
        });
      }
    }
    if (req.body.c_picture_link_7) {
      in_c_picture_link_7 = req.body.c_picture_link_7;
    } else {
      if (req.files.c_picture_link_7) {
        path = req.files.c_picture_link_7[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_c_picture_link_7 = await result.url;
          }
        });
      }
      if (req.body.c_picture_link_8) {
        in_c_picture_link_8 = req.body.c_picture_link_8;
      } else {
      }
      if (req.files.c_picture_link_8) {
        path = req.files.c_picture_link_8[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_c_picture_link_8 = await result.url;
          }
        });
      }
    }
    if (req.body.c_picture_link_9) {
      in_c_picture_link_9 = req.body.c_picture_link_9;
    } else {
      if (req.files.c_picture_link_9) {
        path = req.files.c_picture_link_9[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_c_picture_link_9 = await result.url;
          }
        });
      }
    }
    if (req.body.c_picture_link_10) {
      in_c_picture_link_10 = req.body.c_picture_link_10;
    } else {
      if (req.files.c_picture_link_10) {
        path = req.files.c_picture_link_10[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_c_picture_link_10 = await result.url;
          }
        });
      }
    }

    try {
      if (in_car_title == "") {
        res.status(400).json({ data: [{ message: "Enter title " }] });
      } else if (in_c_price == null) {
        res.status(400).json({ data: [{ message: "Enter price " }] });
      } else if (in_c_location == "") {
        res.status(400).json({ data: [{ message: "Add a location " }] });
      } else if (in_cat_id == null) {
        res.status(400).json({ data: [{ message: "Enter category" }] });
      } else if (in_sub_cat_id == null) {
        res.status(400).json({ data: [{ message: "Enter sub category" }] });
      } else if (
        in_c_picture_link_1 == undefined &&
        in_c_picture_link_2 == undefined &&
        in_c_picture_link_3 == undefined &&
        in_c_picture_link_4 == undefined &&
        in_c_picture_link_5 == undefined &&
        in_c_picture_link_6 == undefined &&
        in_c_picture_link_7 == undefined &&
        in_c_picture_link_8 == undefined &&
        in_c_picture_link_9 == undefined &&
        in_c_picture_link_10 == undefined
      ) {
        res
          .status(400)
          .json({ data: [{ message: "Upload at least one picture" }] });
      } else {
        connection.query(
          "call sp_car_rent_inventory_mast_save(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
          [
            in_car_rent_inventory_id,
            in_user_id,
            in_car_title,
            in_c_price,
            in_c_picture_link_1,
            in_c_picture_link_2,
            in_c_picture_link_3,
            in_c_picture_link_4,
            in_c_picture_link_5,
            in_c_picture_link_6,
            in_c_picture_link_7,
            in_c_picture_link_8,
            in_c_picture_link_9,
            in_c_picture_link_10,
            in_c_km_limit,
            in_c_car_type,
            in_c_extra_charge,
            in_c_per_day_charge,
            in_car_fuel_id,
            in_c_with_fuel,
            in_c_driver,
            in_c_transmission,
            in_c_show_mo_no,
            in_c_description,
            in_c_location,
            in_latitude,
            in_longitude,
            in_cat_id,
            in_sub_cat_id,
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

exports.car_rent_inventory_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_car_rent_inventory_id = req.body.car_rent_inventory_id;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;

    try {
      if (!in_car_rent_inventory_id) {
        res.status(400).json({ messaage: "enter car_rent_inventory_id" });
      } else if (!in_user_id) {
        res.status(400).json({ messaage: "enter user_id" });
      } else {
        connection.query(
          "call sp_car_rent_inventory_mast_delete(?,?)",
          [in_car_rent_inventory_id, in_user_id],
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
