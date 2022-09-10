const connection = require("./../../db/mysql");
const cloudinary = require("cloudinary").v2;
const multer = require("multer");
const jwt = require("jsonwebtoken");

exports.job_inventory_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_job_inventory_code = req.body.job_inventory_code;
    let in_cat_id = req.body.cat_id;
    try {
      connection.query(
        "call sp_job_inventory_mast_fill(?,?)",
        [in_job_inventory_code, in_cat_id],
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

exports.job_inventory_mast_save = async (req, res) => {
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
    { name: "j_picture_link_1" },
    { name: "j_picture_link_2" },
    { name: "j_picture_link_3" },
    { name: "j_picture_link_4" },
    { name: "j_picture_link_5" },
    { name: "j_picture_link_6" },
    { name: "j_picture_link_7" },
    { name: "j_picture_link_8" },
    { name: "j_picture_link_9" },
    { name: "j_picture_link_10" },
  ]);
  await cpUpload(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_job_inventory_id = req.body.job_inventory_id;
    let in_user_id = userId;
    let in_j_title = req.body.j_title;
    let in_from_salary = req.body.from_salary;
    let in_to_salary = req.body.to_salary;
    var in_j_picture_link_1;
    var in_j_picture_link_2;
    var in_j_picture_link_3;
    var in_j_picture_link_4;
    var in_j_picture_link_5;
    var in_j_picture_link_6;
    var in_j_picture_link_7;
    var in_j_picture_link_8;
    var in_j_picture_link_9;
    var in_j_picture_link_10;
    let in_j_type_id = req.body.j_type_id;
    let in_s_p_id = req.body.s_p_id;
    let in_p_type_id = req.body.p_type_id;
    let in_j_designation = req.body.j_designation;
    let in_j_show_mo_no = req.body.j_show_mo_no;
    let in_j_description = req.body.j_description;
    let in_j_location = req.body.j_location;
    let in_latitude = req.body.latitude;
    let in_longitude = req.body.longitude;
    let in_cat_id = req.body.cat_id;
    let in_sub_cat_id = req.body.sub_cat_id;

    if (req.body.j_picture_link_1) {
      in_j_picture_link_1 = req.body.j_picture_link_1;
    } else {
      if (req.files.j_picture_link_1) {
        path = req.files.j_picture_link_1[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_j_picture_link_1 = await result.url;
          }
        });
      }
    }
    if (req.body.j_picture_link_2) {
      in_j_picture_link_2 = req.body.j_picture_link_2;
    } else {
      if (req.files.j_picture_link_2) {
        path = req.files.j_picture_link_2[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_j_picture_link_2 = await result.url;
          }
        });
      }
    }
    if (req.body.j_picture_link_3) {
      in_j_picture_link_3 = req.body.j_picture_link_3;
    } else {
      if (req.files.j_picture_link_3) {
        path = req.files.j_picture_link_3[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_j_picture_link_3 = await result.url;
          }
        });
      }
    }
    if (req.body.j_picture_link_4) {
      in_j_picture_link_4 = req.body.j_picture_link_4;
    } else {
      if (req.files.j_picture_link_4) {
        path = req.files.j_picture_link_4[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_j_picture_link_4 = await result.url;
          }
        });
      }
    }
    if (req.body.j_picture_link_5) {
      in_j_picture_link_5 = req.body.j_picture_link_5;
    } else {
      if (req.files.j_picture_link_5) {
        path = req.files.j_picture_link_5[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_j_picture_link_5 = await result.url;
          }
        });
      }
      if (req.body.j_picture_link_6) {
        in_j_picture_link_6 = req.body.j_picture_link_6;
      } else {
      }
      if (req.files.j_picture_link_6) {
        path = req.files.j_picture_link_6[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_j_picture_link_6 = await result.url;
          }
        });
      }
    }
    if (req.body.j_picture_link_7) {
      in_j_picture_link_7 = req.body.j_picture_link_7;
    } else {
      if (req.files.j_picture_link_7) {
        path = req.files.j_picture_link_7[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_j_picture_link_7 = await result.url;
          }
        });
      }
      if (req.body.j_picture_link_8) {
        in_j_picture_link_8 = req.body.j_picture_link_8;
      } else {
      }
      if (req.files.j_picture_link_8) {
        path = req.files.j_picture_link_8[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_j_picture_link_8 = await result.url;
          }
        });
      }
    }
    if (req.body.j_picture_link_9) {
      in_j_picture_link_9 = req.body.j_picture_link_9;
    } else {
      if (req.files.j_picture_link_9) {
        path = req.files.j_picture_link_9[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_j_picture_link_9 = await result.url;
          }
        });
      }
    }
    if (req.body.j_picture_link_10) {
      in_j_picture_link_10 = req.body.j_picture_link_10;
    } else {
      if (req.files.j_picture_link_10) {
        path = req.files.j_picture_link_10[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_j_picture_link_10 = await result.url;
          }
        });
      }
    }

    try {
      if (in_j_title == "") {
        res.status(400).json({ data: [{ message: "Enter title " }] });
      } else if (in_from_salary == null) {
        res.status(400).json({ data: [{ message: "Select from salary " }] });
      } else if (in_to_salary == null) {
        res.status(400).json({ data: [{ message: "Select to salary " }] });
      } else if (in_j_type_id == null) {
        res.status(400).json({ data: [{ message: "Select job type  " }] });
      } else if (in_j_location == "") {
        res.status(400).json({ data: [{ message: " Add a location " }] });
      } else if (in_cat_id == null) {
        res.status(400).json({ data: [{ message: "Enter category" }] });
      } else if (in_sub_cat_id == null) {
        res.status(400).json({ data: [{ message: "Enter sub category" }] });
      } else if (
        in_j_picture_link_1 == undefined &&
        in_j_picture_link_2 == undefined &&
        in_j_picture_link_3 == undefined &&
        in_j_picture_link_4 == undefined &&
        in_j_picture_link_5 == undefined &&
        in_j_picture_link_6 == undefined &&
        in_j_picture_link_7 == undefined &&
        in_j_picture_link_8 == undefined &&
        in_j_picture_link_9 == undefined &&
        in_j_picture_link_10 == undefined
      ) {
        res
          .status(500)
          .json({ data: [{ message: "Upload at least one picture" }] });
      } else {
        connection.query(
          "call sp_job_inventory_mast_save(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
          [
            in_job_inventory_id,
            in_user_id,
            in_j_title,
            in_from_salary,
            in_to_salary,
            in_j_picture_link_1,
            in_j_picture_link_2,
            in_j_picture_link_3,
            in_j_picture_link_4,
            in_j_picture_link_5,
            in_j_picture_link_6,
            in_j_picture_link_7,
            in_j_picture_link_8,
            in_j_picture_link_9,
            in_j_picture_link_10,
            in_j_type_id,
            in_s_p_id,
            in_p_type_id,
            in_j_designation,
            in_j_show_mo_no,
            in_j_description,
            in_j_location,
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

exports.job_inventory_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_job_inventory_id = req.body.job_inventory_id;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;

    try {
      if (!in_job_inventory_id) {
        res
          .status(400)
          .json({ data: [{ message: "Enter job_inventory_id " }] });
      } else if (!in_user_id) {
        res.status(400).json({ data: [{ message: "Select from user_id " }] });
      } else {
        connection.query(
          "call sp_job_inventory_mast_delete(?,?)",
          [in_job_inventory_id, in_user_id],
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
