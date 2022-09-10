const connection = require("./../../db/mysql");
const cloudinary = require("cloudinary").v2;
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.mobile_inventory_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_mo_inventory_code = req.body.mo_inventory_code;
    let in_cat_id = req.body.cat_id;

    try {
      connection.query(
        "call sp_mobile_inventory_mast_fill(?,?)",
        [in_mo_inventory_code, in_cat_id],
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

exports.mobile_inventory_mast_save = async (req, res) => {
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
    { name: "mo_picture_link_1" },
    { name: "mo_picture_link_2" },
    { name: "mo_picture_link_3" },
    { name: "mo_picture_link_4" },
    { name: "mo_picture_link_5" },
    { name: "mo_picture_link_6" },
    { name: "mo_picture_link_7" },
    { name: "mo_picture_link_8" },
    { name: "mo_picture_link_9" },
    { name: "mo_picture_link_10" },
  ]);
  await cpUpload(req, res, async (err) => {
    let in_mo_inventory_id = req.body.mo_inventory_id;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_mo_title = req.body.mo_title;
    let in_brand_id = req.body.brand_id;
    let in_model_name = req.body.model_name;
    let in_mo_ram = req.body.mo_ram;
    let in_mo_rom = req.body.mo_rom;
    let in_mo_colour = req.body.mo_colour;
    let in_mo_price = req.body.mo_price;
    var in_mo_picture_link_1;
    var in_mo_picture_link_2;
    var in_mo_picture_link_3;
    var in_mo_picture_link_4;
    var in_mo_picture_link_5;
    var in_mo_picture_link_6;
    var in_mo_picture_link_7;
    var in_mo_picture_link_8;
    var in_mo_picture_link_9;
    var in_mo_picture_link_10;
    let in_mo_front_camera = req.body.mo_front_camera;
    let in_mo_rear_camera = req.body.mo_rear_camera;
    let in_mo_battery = req.body.mo_battery;
    let in_mo_bill = req.body.mo_bill;
    let in_mo_box = req.body.mo_box;
    let in_mo_charger = req.body.mo_charger;
    let in_mo_headset = req.body.mo_headset;
    let in_mo_warranty = req.body.mo_warranty;
    let in_insurance = req.body.insurance;
    let in_show_mobile_no = req.body.show_mo_no;
    let in_description = req.body.description;
    let in_location = req.body.location;
    let in_latitude = req.body.latitude;
    let in_longitude = req.body.longitude;
    let in_cat_id = req.body.cat_id;
    let in_sub_cat_id = req.body.sub_cat_id;
    let in_device_mast_id = req.body.device_id;

    if (req.body.mo_picture_link_1) {
      in_mo_picture_link_1 = req.body.mo_picture_link_1;
    } else {
      if (req.files.mo_picture_link_1) {
        path = req.files.mo_picture_link_1[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_mo_picture_link_1 = await result.url;
          }
        });
      }
    }
    if (req.body.mo_picture_link_2) {
      in_mo_picture_link_2 = req.body.mo_picture_link_2;
    } else {
      if (req.files.mo_picture_link_2) {
        path = req.files.mo_picture_link_2[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_mo_picture_link_2 = await result.url;
          }
        });
      }
    }
    if (req.body.mo_picture_link_3) {
      in_mo_picture_link_3 = req.body.mo_picture_link_3;
    } else {
      if (req.files.mo_picture_link_3) {
        path = req.files.mo_picture_link_3[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_mo_picture_link_3 = await result.url;
          }
        });
      }
    }
    if (req.body.mo_picture_link_4) {
      in_mo_picture_link_4 = req.body.mo_picture_link_4;
    } else {
      if (req.files.mo_picture_link_4) {
        path = req.files.mo_picture_link_4[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_mo_picture_link_4 = await result.url;
          }
        });
      }
    }
    if (req.body.mo_picture_link_5) {
      in_mo_picture_link_5 = req.body.mo_picture_link_5;
    } else {
      if (req.files.mo_picture_link_5) {
        path = req.files.mo_picture_link_5[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_mo_picture_link_5 = await result.url;
          }
        });
      }
      if (req.body.mo_picture_link_6) {
        in_mo_picture_link_6 = req.body.mo_picture_link_6;
      } else {
      }
      if (req.files.mo_picture_link_6) {
        path = req.files.mo_picture_link_6[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_mo_picture_link_6 = await result.url;
          }
        });
      }
    }
    if (req.body.mo_picture_link_7) {
      in_mo_picture_link_7 = req.body.mo_picture_link_7;
    } else {
      if (req.files.mo_picture_link_7) {
        path = req.files.mo_picture_link_7[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_mo_picture_link_7 = await result.url;
          }
        });
      }
      if (req.body.mo_picture_link_8) {
        in_mo_picture_link_8 = req.body.mo_picture_link_8;
      } else {
      }
      if (req.files.mo_picture_link_8) {
        path = req.files.mo_picture_link_8[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_mo_picture_link_8 = await result.url;
          }
        });
      }
    }
    if (req.body.mo_picture_link_9) {
      in_mo_picture_link_9 = req.body.mo_picture_link_9;
    } else {
      if (req.files.mo_picture_link_9) {
        path = req.files.mo_picture_link_9[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_mo_picture_link_9 = await result.url;
          }
        });
      }
    }
    if (req.body.mo_picture_link_10) {
      in_mo_picture_link_10 = req.body.mo_picture_link_10;
    } else {
      if (req.files.mo_picture_link_10) {
        path = req.files.mo_picture_link_10[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_mo_picture_link_10 = await result.url;
          }
        });
      }
    }

        try {
          if (!in_device_mast_id) {
            res.status(400).json({ data: [{ message: "Enter device_id" }] });
            return;
          }
          if (in_device_mast_id == 1) {
            if (!in_mo_rom) {
              res.status(400).json({ data: [{ message: "Select ROM " }] });
              return;
            }
            if (!in_mo_colour) {
              res.status(400).json({ data: [{ message: "Select Colour" }] });
              return;
            }
          }
          if (
            in_device_mast_id == 3 ||
            in_device_mast_id == 4 ||
            in_device_mast_id == 5 ||
            in_device_mast_id == 6 ||
            in_device_mast_id == 7
          ) {
            if (!in_mo_ram) {
              res.status(400).json({ data: [{ message: "Select RAM" }] });
              return;
            }
            if (!in_mo_rom) {
              res.status(400).json({ data: [{ message: "Select ROM" }] });
              return;
            }
            if (!in_mo_colour) {
              res.status(400).json({ data: [{ message: "Enter colour" }] });
              return;
            }
          }
          if (in_device_mast_id == 8) {
            if (!in_mo_colour) {
              res.status(400).json({ data: [{ message: "Enter colour" }] });
              return;
            }
          }

          if (!in_mo_title) {
            res.status(400).json({ data: [{ message: "Enter title" }] });
          } else if (!in_brand_id) {
            res.status(400).json({ data: [{ message: "Select brand" }] });
          } else if (!in_model_name) {
            res.status(400).json({ data: [{ message: "Enter model name" }] });
          } else if (!in_mo_price) {
            res.status(400).json({ data: [{ message: "Enter price" }] });
          } else if (!in_location) {
            res.status(400).json({ data: [{ message: "Add a location" }] });
          } else if (!in_cat_id) {
            res.status(400).json({ data: [{ message: "Enter category" }] });
          } else if (!in_sub_cat_id) {
            res.status(400).json({ data: [{ message: "Enter sub category" }] });
          }
          // else if (!in_IsMobile) {
          //     res.status(400).json({ data: [{ message: "Enter IsMobile" }] })
          // }
          else if (
            in_mo_picture_link_1 == undefined &&
            in_mo_picture_link_2 == undefined &&
            in_mo_picture_link_3 == undefined &&
            in_mo_picture_link_4 == undefined &&
            in_mo_picture_link_5 == undefined &&
            in_mo_picture_link_6 == undefined &&
            in_mo_picture_link_7 == undefined &&
            in_mo_picture_link_8 == undefined &&
            in_mo_picture_link_9 == undefined &&
            in_mo_picture_link_10 == undefined
          ) {
            res
              .status(400)
              .json({ data: [{ message: "Upload at least one picture" }] });
          } else {
            connection.query(
              "call sp_mobile_inventory_mast_save(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
              [
                in_mo_inventory_id,
                in_user_id,
                in_mo_title,
                in_brand_id,
                in_model_name,
                in_mo_ram,
                in_mo_rom,
                in_mo_colour,
                in_mo_price,
                in_mo_picture_link_1,
                in_mo_picture_link_2,
                in_mo_picture_link_3,
                in_mo_picture_link_4,
                in_mo_picture_link_5,
                in_mo_picture_link_6,
                in_mo_picture_link_7,
                in_mo_picture_link_8,
                in_mo_picture_link_9,
                in_mo_picture_link_10,
                in_mo_front_camera,
                in_mo_rear_camera,
                in_mo_battery,
                in_mo_bill,
                in_mo_box,
                in_mo_charger,
                in_mo_headset,
                in_mo_warranty,
                in_insurance,
                in_show_mobile_no,
                in_description,
                in_location,
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

exports.mobile_inventory_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_mo_inventory_id = req.body.mo_inventory_id;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;

    try {
      if (!in_mo_inventory_id) {
        res.status(400).json({ data: [{ message: "Enter mo_inventory_id" }] });
      } else if (!in_user_id) {
        res.status(400).json({ data: [{ message: "Enter user_id" }] });
      } else {
        connection.query(
          "call sp_mobile_inventory_mast_delete(?,?)",
          [in_mo_inventory_id, in_user_id],
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
  1;
};
