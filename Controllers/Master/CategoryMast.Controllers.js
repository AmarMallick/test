const connection = require("./../../db/mysql");
const cloudinary = require("cloudinary").v2;
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.category_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    connection.query("SELECT * FROM category_mast ", (err, result) => {
      if (err) {
        res.status(500).json({ success: 0, data: err });
      } else {
        res.status(200).json({ success: 1, data: result });
      }
    });
  });
};

exports.category_mast_save = async (req, res) => {
  const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, "uploads/");
    },
    filename: function (req, file, cb) {
      cb(null, file.originalname);
    },
  });

  const upload1 = multer({ storage: storage });
  var cpUpload = upload1.fields([{ name: "cat_picture_link" }]);
  await cpUpload(req, res, async (err) => {
    let in_id = req.body.id;
    let in_cat_name = req.body.cat_name;
    var in_cat_picture_link;

    if (req.body.cat_picture_link) {
      in_cat_picture_link = req.body.cat_picture_link;
    } else {
      if (req.files.cat_picture_link) {
        path = req.files.cat_picture_link[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_cat_picture_link = await result.url;
          }
        });
      }
    }

    try {
      if (!in_cat_name) {
        res.status(400).json({ messaage: "enter cat_name" });
      } else {
        if (!in_id) {
          connection.query(
            "INSERT INTO category_mast (cat_name,cat_picture_link,created_at) VALUES (?,?,?)",
            [in_cat_name, in_cat_picture_link, new Date()],
            (err, result) => {
              if (err) {
                res.status(500).json({ success: 0, data: err });
              } else {
                console.log(result);
                if (result.insertId) {
                  connection.query(
                    "select * from category_mast where id =?",
                    [result.insertId],
                    (e, r) => {
                      if (e) {
                        res.status(500).json({ success: 0, data: e });
                      } else {
                        res.status(201).json({ success: 1, data: r[0] });
                      }
                    }
                  );
                }
              }
            }
          );
        } else {
          connection.query(
            "select id from category_mast where id =?",
            [in_id],
            (err, result) => {
              if (err) {
                res.status(500).json({ success: 0, data: err });
              } else {
                if (result.length > 0) {
                  connection.query(
                    "UPDATE category_mast SET cat_name = ?,cat_picture_link = ?,modified_at = ? WHERE id = ?",
                    [in_cat_name, in_cat_picture_link, new Date(), in_id],
                    (error, rest) => {
                      if (error) {
                        res.status(500).json({ success: 0, data: error });
                      } else {
                        connection.query(
                          "select * from category_mast where id =?",
                          [in_id],
                          (e, r) => {
                            if (e) {
                              res.status(500).json({ success: 0, data: e });
                            } else {
                              res.status(201).json({ success: 1, data: r[0] });
                            }
                          }
                        );
                      }
                    }
                  );
                }
              }
            }
          );
        }
      }
    } catch (err) {
      console.log("eeee", err);
      res.status(500).json({ success: 0, data: err });
    }
  });
};

exports.category_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_id = req.body.id;

    try {
      if (!in_id) {
        res.status(500).json({ messaage: "enter id" });
      } else {
        connection.query(
          "call sp_category_mast_delete(?)",
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

exports.main_category_menu_web = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    try {
      let sql = `SELECT SCM.id, SCM.cat_id, CM.cat_name, CM.cat_picture_link, CM.created_at, CM.modified_at, SCM.sub_cat_name
                                    FROM category_mast CM
                                    LEFT JOIN sub_category_mast SCM ON SCM.cat_id = CM.id`;
      connection.query(sql, (err, result) => {
        if (err) {
          res.status(500).json({ success: 0, data: err });
        } else {
          let cat_list = [];
          for (let i = 0; i < result.length; i++) {
            if (
              cat_list.length == 0 ||
              cat_list[cat_list.length - 1].id != result[i].cat_id
            ) {
              cat_list.push({
                id: result[i].cat_id,
                cat_name: result[i].cat_name,
                cat_picture_link: result[i].cat_picture_link,
                created_at: result[i].created_at,
                modified_at: result[i].modified_at,
                sub_category_list: [],
              });
            }
            if (result[i].id) {
              cat_list[cat_list.length - 1].sub_category_list.push({
                sub_cat_id: result[i].id,
                cat_id: result[i].cat_id,
                sub_cat_name: result[i].sub_cat_name,
                cat_name: result[i].cat_name,
              });
            }
          }
          res.status(200).json({ success: 1, data: cat_list });
        }
      });
    } catch (err) {
      res.status(500).json({ success: 0, data: err });
    }
  });
};
