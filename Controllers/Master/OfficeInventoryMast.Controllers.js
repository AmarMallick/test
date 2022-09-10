const connection = require("../../db/mysql");
const cloudinary = require("cloudinary").v2;
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.office_inventory_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_office_inventory_code = req.body.office_inventory_code;
    let in_cat_id = req.body.cat_id;
    try {
      connection.query(
        "call sp_office_inventory_mast_fill(?,?)",
        [in_office_inventory_code, in_cat_id],
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

exports.office_inventory_mast_save = async (req, res) => {
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
    { name: "o_picture_link_1" },
    { name: "o_picture_link_2" },
    { name: "o_picture_link_3" },
    { name: "o_picture_link_4" },
    { name: "o_picture_link_5" },
    { name: "o_picture_link_6" },
    { name: "o_picture_link_7" },
    { name: "o_picture_link_8" },
    { name: "o_picture_link_9" },
    { name: "o_picture_link_10" },
  ]);
  await cpUpload(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_office_inventory_id = req.body.office_inventory_id;
    let in_user_id = userId;
    let in_o_title = req.body.o_title;
    let in_p_type_id = req.body.p_type_id;
    let in_p_name = req.body.p_name;
    let in_cabin = req.body.cabin;
    let in_washroom = req.body.washroom;
    let in_o_sq_ft = req.body.o_sq_ft;
    let in_o_price = req.body.o_price;
    var in_o_picture_link_1;
    var in_o_picture_link_2;
    var in_o_picture_link_3;
    var in_o_picture_link_4;
    var in_o_picture_link_5;
    var in_o_picture_link_6;
    var in_o_picture_link_7;
    var in_o_picture_link_8;
    var in_o_picture_link_9;
    var in_o_picture_link_10;
    let in_p_furnishing_id = req.body.p_furnishing_id;
    let in_p_car_parking_id = req.body.p_car_parking_id;
    let in_o_sup_builtup_area = req.body.o_sup_builtup_area;
    let in_o_carpet_area = req.body.o_carpet_area;
    let in_p_listed_by_id = req.body.p_listed_by_id;
    let in_employee_capacity = req.body.employee_capacity;
    let in_o_maintenance = req.body.o_maintenance;
    let in_o_show_mo_no = req.body.o_show_mo_no;
    let in_o_description = req.body.o_description;
    let in_o_location = req.body.o_location;
    let in_latitude = req.body.latitude;
    let in_longitude = req.body.longitude;
    let in_cat_id = req.body.cat_id;
    let in_sub_cat_id = req.body.sub_cat_id;

    if (req.body.o_picture_link_1) {
      in_o_picture_link_1 = req.body.o_picture_link_1;
    } else {
      if (req.files.o_picture_link_1) {
        path = req.files.o_picture_link_1[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_o_picture_link_1 = await result.url;
          }
        });
      }
    }
    if (req.body.o_picture_link_2) {
      in_o_picture_link_2 = req.body.o_picture_link_2;
    } else {
      if (req.files.o_picture_link_2) {
        path = req.files.o_picture_link_2[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_o_picture_link_2 = await result.url;
          }
        });
      }
    }
    if (req.body.o_picture_link_3) {
      in_o_picture_link_3 = req.body.o_picture_link_3;
    } else {
      if (req.files.o_picture_link_3) {
        path = req.files.o_picture_link_3[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_o_picture_link_3 = await result.url;
          }
        });
      }
    }
    if (req.body.o_picture_link_4) {
      in_o_picture_link_4 = req.body.o_picture_link_4;
    } else {
      if (req.files.o_picture_link_4) {
        path = req.files.o_picture_link_4[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_o_picture_link_4 = await result.url;
          }
        });
      }
    }
    if (req.body.o_picture_link_5) {
      in_o_picture_link_5 = req.body.o_picture_link_5;
    } else {
      if (req.files.o_picture_link_5) {
        path = req.files.o_picture_link_5[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_o_picture_link_5 = await result.url;
          }
        });
      }
      if (req.body.o_picture_link_6) {
        in_o_picture_link_6 = req.body.o_picture_link_6;
      } else {
      }
      if (req.files.o_picture_link_6) {
        path = req.files.o_picture_link_6[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_o_picture_link_6 = await result.url;
          }
        });
      }
    }
    if (req.body.o_picture_link_7) {
      in_o_picture_link_7 = req.body.o_picture_link_7;
    } else {
      if (req.files.o_picture_link_7) {
        path = req.files.o_picture_link_7[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_o_picture_link_7 = await result.url;
          }
        });
      }
      if (req.body.o_picture_link_8) {
        in_o_picture_link_8 = req.body.o_picture_link_8;
      } else {
      }
      if (req.files.o_picture_link_8) {
        path = req.files.o_picture_link_8[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_o_picture_link_8 = await result.url;
          }
        });
      }
    }
    if (req.body.o_picture_link_9) {
      in_o_picture_link_9 = req.body.o_picture_link_9;
    } else {
      if (req.files.o_picture_link_9) {
        path = req.files.o_picture_link_9[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_o_picture_link_9 = await result.url;
          }
        });
      }
    }
    if (req.body.o_picture_link_10) {
      in_o_picture_link_10 = req.body.o_picture_link_10;
    } else {
      if (req.files.o_picture_link_10) {
        path = req.files.o_picture_link_10[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_o_picture_link_10 = await result.url;
          }
        });
      }
    }

    try {
      if (in_o_title == "") {
        res.status(400).json({ data: [{ message: "Enter title " }] });
      } else if (in_p_type_id == null) {
        res.status(400).json({ data: [{ message: "Select type " }] });
      } else if (in_o_price == null) {
        res.status(400).json({ data: [{ message: "Enter price " }] });
      } else if (in_o_location == "") {
        res.status(400).json({ data: [{ message: "Add a location " }] });
      } else if (in_cat_id == null) {
        res.status(400).json({ data: [{ message: "Enter category" }] });
      } else if (in_sub_cat_id == null) {
        res.status(400).json({ data: [{ message: "Enter sub category" }] });
      } else if (
        in_o_picture_link_1 == undefined &&
        in_o_picture_link_2 == undefined &&
        in_o_picture_link_3 == undefined &&
        in_o_picture_link_4 == undefined &&
        in_o_picture_link_5 == undefined &&
        in_o_picture_link_6 == undefined &&
        in_o_picture_link_7 == undefined &&
        in_o_picture_link_8 == undefined &&
        in_o_picture_link_9 == undefined &&
        in_o_picture_link_10 == undefined
      ) {
        res
          .status(400)
          .json({ data: [{ message: "Upload at least one picture" }] });
      } else {
        connection.query(
          "call sp_office_inventory_mast_save(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
          [
            in_office_inventory_id,
            in_user_id,
            in_o_title,
            in_p_type_id,
            in_p_name,
            in_cabin,
            in_washroom,
            in_o_sq_ft,
            in_o_price,
            in_o_picture_link_1,
            in_o_picture_link_2,
            in_o_picture_link_3,
            in_o_picture_link_4,
            in_o_picture_link_5,
            in_o_picture_link_6,
            in_o_picture_link_7,
            in_o_picture_link_8,
            in_o_picture_link_9,
            in_o_picture_link_10,
            in_p_furnishing_id,
            in_p_car_parking_id,
            in_o_sup_builtup_area,
            in_o_carpet_area,
            in_p_listed_by_id,
            in_employee_capacity,
            in_o_maintenance,
            in_o_show_mo_no,
            in_o_description,
            in_o_location,
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

exports.office_inventory_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_office_inventory_id = req.body.office_inventory_id;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;

    try {
      if (!in_office_inventory_id) {
        res
          .status(400)
          .json({ data: [{ message: "Enter office_inventory_id " }] });
      } else if (!in_user_id) {
        res.status(400).json({ data: [{ message: "Select user_id " }] });
      } else {
        connection.query(
          "call sp_office_inventory_mast_delete(?,?)",
          [in_office_inventory_id, in_user_id],
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
