const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");
const cloudinary = require("cloudinary").v2;

exports.all_inventory_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_all_inventory_code = req.body.all_inventory_code;
    let in_cat_id = req.body.cat_id;
    try {
      connection.query(
        "call sp_all_inventory_mast_fill(?,?)",
        [in_all_inventory_code, in_cat_id],
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

exports.all_inventory_mast_save = async (req, res) => {
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
    { name: "picture_link_1" },
    { name: "picture_link_2" },
    { name: "picture_link_3" },
    { name: "picture_link_4" },
    { name: "picture_link_5" },
    { name: "picture_link_6" },
    { name: "picture_link_7" },
    { name: "picture_link_8" },
    { name: "picture_link_9" },
    { name: "picture_link_10" },
  ]);
  await cpUpload(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_all_inventory_id = req.body.all_inventory_id;
    let in_user_id = userId;
    let in_inventory_type = "all";
    let in_cat_id = req.body.cat_id;
    let in_sub_cat_id = req.body.sub_cat_id;
    let in_title = req.body.title;
    let in_price = req.body.price;
    var in_picture_link_1;
    var in_picture_link_2;
    var in_picture_link_3;
    var in_picture_link_4;
    var in_picture_link_5;
    var in_picture_link_6;
    var in_picture_link_7;
    var in_picture_link_8;
    var in_picture_link_9;
    var in_picture_link_10;
    let in_show_mo_no = req.body.show_mo_no;
    let in_description = req.body.description;
    let in_location = req.body.location;
    let in_latitude = req.body.latitude;
    let in_longitude = req.body.longitude;
    let in_is_mobile = req.body.IsMobile;
    if (req.body.picture_link_1) {
      in_picture_link_1 = req.body.picture_link_1;
    } else {
      if (req.files.picture_link_1) {
        path = req.files.picture_link_1[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!", err: err });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_picture_link_1 = await result.url;
          }
        });
      }
    }
    if (req.body.picture_link_2) {
      in_picture_link_2 = req.body.picture_link_2;
    } else {
      if (req.files.picture_link_2) {
        path = req.files.picture_link_2[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!", err: err });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_picture_link_2 = await result.url;
          }
        });
      }
    }
    if (req.body.picture_link_3) {
      in_picture_link_3 = req.body.picture_link_3;
    } else {
      if (req.files.picture_link_3) {
        path = req.files.picture_link_3[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!", err: err });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_picture_link_3 = await result.url;
          }
        });
      }
    }
    if (req.body.picture_link_4) {
      in_picture_link_4 = req.body.picture_link_4;
    } else {
      if (req.files.picture_link_4) {
        path = req.files.picture_link_4[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!", err: err });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_picture_link_4 = await result.url;
          }
        });
      }
    }
    if (req.body.picture_link_5) {
      in_picture_link_5 = req.body.picture_link_5;
    } else {
      if (req.files.picture_link_5) {
        path = req.files.picture_link_5[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!", err: err });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_picture_link_5 = await result.url;
          }
        });
      }
      if (req.body.picture_link_6) {
        in_picture_link_6 = req.body.picture_link_6;
      } else {
      }
      if (req.files.picture_link_6) {
        path = req.files.picture_link_6[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!", err: err });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_picture_link_6 = await result.url;
          }
        });
      }
    }
    if (req.body.picture_link_7) {
      in_picture_link_7 = req.body.picture_link_7;
    } else {
      if (req.files.picture_link_7) {
        path = req.files.picture_link_7[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!", err: err });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_picture_link_7 = await result.url;
          }
        });
      }
      if (req.body.picture_link_8) {
        in_picture_link_8 = req.body.picture_link_8;
      } else {
      }
      if (req.files.picture_link_8) {
        path = req.files.picture_link_8[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!", err: err });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_picture_link_8 = await result.url;
          }
        });
      }
    }
    if (req.body.picture_link_9) {
      in_picture_link_9 = req.body.picture_link_9;
    } else {
      if (req.files.picture_link_9) {
        path = req.files.picture_link_9[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!", err: err });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_picture_link_9 = await result.url;
          }
        });
      }
    }
    if (req.body.picture_link_10) {
      in_picture_link_10 = req.body.picture_link_10;
    } else {
      if (req.files.picture_link_10) {
        path = req.files.picture_link_10[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!", err: err });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_picture_link_10 = await result.url;
          }
        });
      }
    }
    try {
      if (in_title == "") {
        res.status(400).json({ data: [{ message: "Enter title " }] });
      } else if (in_cat_id == "") {
        res.status(400).json({ data: [{ message: "Select category" }] });
      } else if (in_sub_cat_id == "") {
        res.status(400).json({ data: [{ message: "Select sub category " }] });
      } else if (in_price == "") {
        res.status(400).json({ data: [{ message: "Enter price " }] });
      } else if (in_location == "") {
        res.status(400).json({ data: [{ message: "Add a location " }] });
      } else if (
        in_picture_link_1 == undefined &&
        in_picture_link_2 == undefined &&
        in_picture_link_3 == undefined &&
        in_picture_link_4 == undefined &&
        in_picture_link_5 == undefined &&
        in_picture_link_6 == undefined &&
        in_picture_link_7 == undefined &&
        in_picture_link_8 == undefined &&
        in_picture_link_9 == undefined &&
        in_picture_link_10 == undefined
      ) {
        res
          .status(400)
          .json({ data: [{ message: "Upload at least one picture" }] });
      } else {
        connection.query(
          "call sp_all_inventory_mast_save(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
          [
            in_all_inventory_id,
            in_user_id,
            in_inventory_type,
            in_cat_id,
            in_sub_cat_id,
            in_title,
            in_price,
            in_picture_link_1,
            in_picture_link_2,
            in_picture_link_3,
            in_picture_link_4,
            in_picture_link_5,
            in_picture_link_6,
            in_picture_link_7,
            in_picture_link_8,
            in_picture_link_9,
            in_picture_link_10,
            in_show_mo_no,
            in_description,
            in_location,
            in_latitude,
            in_longitude,
          ],
          (err, result) => {
            if (err) {
              res.status(500).json({ data: err });
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

exports.all_inventory_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_all_inventory_id = req.body.all_inventory_id;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;

    try {
      if (!in_all_inventory_id) {
        res
          .status(400)
          .json({ data: [{ message: "Enter all_inventory_id " }] });
      }  else {
        connection.query(
          "call sp_all_inventory_mast_delete(?,?)",
          [in_all_inventory_id, in_user_id],
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
