const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");
const cloudinary = require("cloudinary").v2;

exports.banner_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_from_date = req.body.from_date;
    let in_to_date = req.body.to_date;
    try {
      connection.query(
        "call sp_banner_mast_fill(?,?)",
        [in_from_date, in_to_date],
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

exports.banner_mast_save = async (req, res) => {
  const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, "uploads/");
    },
    filename: function (req, file, cb) {
      cb(null, file.originalname);
    },
  });

  const upload1 = multer({ storage: storage });
  var cpUpload = upload1.single("url");
  await cpUpload(req, res, async (err) => {
    let in_id = req.body.id;
    var in_url;
    let in_from_date = req.body.from_date;
    let in_to_date = req.body.to_date;
    let in_is_active = req.body.is_active;

    if (req.body.url) {
      in_url = req.body.url;
    } else {
      if (req.file) {
        console.log(req.file.path);
        path = req.file.path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.json({ message: "IMAGE NOT UPLOADED!", err: err });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_url = await result.url;
          }
        });
      }
    }

    try {
      if (!in_id) {
        res.status(500).json({ message: "enter id" });
      } else if (!in_url) {
        res.status(500).json({ message: "enter url" });
      } else if (!in_from_date) {
        res.status(500).json({ message: "enter from_date" });
      } else if (!in_to_date) {
        res.status(500).json({ message: "enter to_date" });
      } else if (!in_is_active) {
        res.status(500).json({ message: "enter is_active" });
      } else {
        connection.query(
          "call sp_banner_mast_save(?,?,?,?,?)",
          [in_id, in_url, in_from_date, in_to_date, in_is_active],
          (err, result) => {
            if (err) {
              res.status(500).json({ success: 0, data: err });
            } else {
              res.status(201).json({ success: 1, data: result[0] });
            }
          }
        );
      }
    } catch (err) {
      res.status(500).json({ success: 0, data: err });
    }
  });
};

exports.banner_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;

    try {
      if (!in_id) {
        res.status(400).json({ message: "enter id" });
      } else {
        connection.query(
          "call sp_banner_mast_delete(?)",
          [in_id],
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
