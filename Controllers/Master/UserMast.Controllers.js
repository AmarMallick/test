const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const cloudinary = require("cloudinary").v2;
const multer = require("multer");
var { sendMail } = require("../../middleware/send_mail");

exports.user_mast_fill = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_login_id = userId;

    try {
      connection.query(
        "call sp_user_mast_fill(?)",
        [in_login_id],
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

exports.user_mast_save = async (req, res) => {
  const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, "uploads/");
    },
    filename: function (req, file, cb) {
      cb(null, file.originalname);
    },
  });

  const upload1 = multer({ storage: storage });
  var cpUpload = upload1.fields([{ name: "profile_picture_link" }]);
  await cpUpload(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_login_id = userId;
    let in_mobile_no = req.body.mobile_no;
    let in_mail_id = req.body.mail_id;
    let in_name = req.body.name;
    let in_bio_description = req.body.bio_description;
    var in_profile_picture_link;
    let in_mobile_cc_code = req.body.mobile_cc_code;
    let in_user_cat = req.body.user_cat;
    let in_password = req.body.password;
    let in_otp = req.body.otp;
    let in_is_verify = req.body.is_verify;

    if (req.body.profile_picture_link) {
      in_profile_picture_link = req.body.profile_picture_link;
    } else {
      if (req.files.profile_picture_link) {
        path = req.files.profile_picture_link[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_profile_picture_link = await result.url;
          }
        });
      }
    }

        try {
          if (!in_login_id) {
            res.status(400).json({ data: [{ message: "Enter login_id " }] });
          } else if (!in_mobile_no) {
            res.status(400).json({ data: [{ message: "Enter mobile_no " }] });
          } else if (!in_mail_id) {
            res.status(400).json({ data: [{ message: "Enter mail_id " }] });
          } else if (!in_name) {
            res.status(400).json({ data: [{ message: "Enter name " }] });
          } else if (!in_bio_description) {
            res
              .status(400)
              .json({ data: [{ message: "Enter bio_description " }] });
          } else if (!in_mobile_cc_code) {
            res
              .status(400)
              .json({ data: [{ message: "Enter mobile_cc_code " }] });
          } else if (!in_password) {
            res.status(400).json({ data: [{ message: "Enter password " }] });
          } else if (!in_user_cat) {
            res.status(400).json({ data: [{ message: "Enter user_cat " }] });
          } else if (!in_otp) {
            res.status(400).json({ data: [{ message: "Enter otp " }] });
          } else if (!in_is_verify) {
            res.status(400).json({ data: [{ message: "Enter is_verify " }] });
          } else {
            connection.query(
              "call sp_user_mast_save(?,?,?,?,?,?,?,?,?,?,?)",
              [
                in_login_id,
                in_mobile_no,
                in_mail_id,
                in_name,
                in_bio_description,
                in_profile_picture_link,
                in_mobile_cc_code,
                in_user_cat,
                in_password,
                in_otp,
                in_is_verify,
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
        } catch (err) {
          res.status(500).json({ success: 0, data: err });
        }
     
  });
};

exports.user_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_login_id = userId;

    try {
      if (!in_login_id) {
        res.status(400).json({ data: [{ message: "Enter login_id " }] });
      } else {
        connection.query(
          "call sp_user_mast_delete(?)",
          [in_login_id],
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

exports.send_otp = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_mobile_no = req.body.mobile_no;
    let in_mobile_cc_code = req.body.mobile_cc_code;
    let in_name = req.body.name ? req.body.name : "";
    let in_otp = Math.floor(1000 + Math.random() * 9000);

    if (in_mobile_no && in_mobile_cc_code) {
      connection.query(
        "call sp_send_otp(?,?,?,?)",
        [in_mobile_no, in_mobile_cc_code, in_name, in_otp],
        (err, result) => {
          if (err) {
            res.status(500).json({ success: 0, data: err });
          } else {
            res.status(200).json({ success: 1, data: result[0] });
          }
        }
      );
    } else
      res
        .status(400)
        .json({ data: "Mobile number ,name and cc code cannot be null" });
  });
};

exports.verify_otp = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_mobile_no = req.body.mobile_no;
    let in_mobile_cc_code = req.body.mobile_cc_code;
    let in_otp = req.body.otp;

    if (in_mobile_no && in_mobile_cc_code) {
      connection.query(
        "call sp_verify_otp(?,?,?)",
        [in_mobile_no, in_mobile_cc_code, in_otp],
        (err, result) => {
          if (err) {
            res.status(500).json({ success: 0, data: err });
          } else {
            if (result[0][0].MSG == "OTP NOT MATCH") {
              res.status(400).json({ data: "Otp is not match." });
            } else {
              res
                .status(200)
                .json({ success: 1, data: token, UserData: result[0] });
            }
          }
        }
      );
    } else
      res
        .status(400)
        .json({ data: "Mobile number and cc code cannot be null" });
  });
};

exports.send_email_otp = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_email = req.body.email;
    let in_otp = Math.floor(1000 + Math.random() * 9000);

    try {
      connection.query(
        "call sp_send_email_otp(?,?)",
        [in_email, in_otp],
        (err, result) => {
          if (err) {
            res.status(500).json({ success: 0, data: err });
          } else {
            let response = sendMail(in_email, in_otp);

            if (response) {
              res.status(200).json({ success: 1, data: result[0] });
            } else {
              res.status(400).json({ data: "failed to send the mail" });
            }
          }
        }
      );
    } catch (err) {
      res.status(500).json({ success: 0, data: err });
    }
  });
};

exports.verify_email_otp = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_email = req.body.email;
    let in_otp = req.body.otp;

    connection.query(
      "call sp_verify_email_otp(?,?)",
      [in_email, in_otp],
      (err, result) => {
        if (err) {
          res.status(500).json({ success: 0, data: err });
        } else {
          if (result[0][0].MSG == "OTP NOT MATCH") {
            res.status(400).json({ data: "Otp is not match." });
          } else {
            res
              .status(200)
              .json({ success: 1, data: "Otp match successfully!" });
          }
        }
      }
    );
  });
};

exports.forgot_password = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_mobile_no = req.body.mobile_no;
    let in_mobile_cc_code = req.body.mobile_cc_code;
    let in_email = req.body.email;
    let in_password = req.body.password;
    if (in_mobile_no == "") {
      in_mobile_no = "from_email";
    }
    connection.query(
      "call sp_forgot_password(?,?,?,?)",
      [in_mobile_no, in_mobile_cc_code, in_email, in_password],
      (err, result) => {
        if (err) {
          res.status(500).json({ success: 0, data: err });
        } else {
          if (result[0][0].MSG == "MOBILE NUMBER NOT EXIST") {
            res.status(400).json({ data: "Mobile number doesn't exist!" });
          } else if (result[0][0].MSG == "EMAIL ID NOT EXIST") {
            res.status(400).json({ data: "Email Id doesn't exist!" });
          } else {
            res
              .status(200)
              .json({ success: 1, data: "Your password update successfully!" });
          }
        }
      }
    );
  });
};

exports.rate_us_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_rate_id = req.body.rate_id;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_rate = req.body.rate;

    if (!in_rate_id) {
      res.status(400).json({ data: [{ message: "Enter rate_id " }] });
    } else if (!in_user_id) {
      res.status(400).json({ data: [{ message: "Enter user_id " }] });
    } else if (!in_rate) {
      res.status(400).json({ data: [{ message: "Enter rate " }] });
    } else {
      connection.query(
        "call sp_rate_us_mast_save(?,?,?)",
        [in_rate_id, in_user_id, in_rate],
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

exports.get_user_by_inventory_code = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    let in_inventory_code = req.body.inventory_code;

    connection.query(
      "call sp_get_user_by_inventory_code(?)",
      [in_inventory_code],
      (err, result) => {
        if (err) {
          res.status(500).json({ success: 0, data: err });
        } else {
          res.status(200).json({ success: 1, data: result[0] });
        }
      }
    );
  });
};

exports.count_active_ads = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_ad_status_id = req.body.ad_status_id;

    connection.query(
      "call sp_count_active_ads(?,?)",
      [in_user_id, in_ad_status_id],
      (err, result) => {
        if (err) {
          res.status(500).json({ success: 0, data: err });
        } else {
          res.status(200).json({ success: 1, data: result[0] });
        }
      }
    );
  });
};

exports.get_ad_details = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_ad_status_id = req.body.ad_status_id;

    connection.query(
      "call sp_get_ad_details(?,?)",
      [in_user_id, in_ad_status_id],
      (err, result) => {
        if (err) {
          res.status(500).json({ success: 0, data: err });
        } else {
          res.status(200).json({ success: 1, data: result[0] });
        }
      }
    );
  });
};

exports.login_sequence = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    connection.query("call sp_login_sequence()", (err, result) => {
      if (err) {
        res.status(500).json({ success: 0, data: err });
      } else {
        res.status(200).json({ success: 1, data: result[0] });
      }
    });
  });
};

exports.firebase_authentication = async (req, res) => {
  const storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, "uploads/");
    },
    filename: function (req, file, cb) {
      cb(null, file.originalname);
    },
  });
  const upload1 = multer({ storage: storage });
  var cpUpload = upload1.fields([{ name: "profile_picture_link" }]);
  await cpUpload(req, res, async (err) => {
    let in_mobile_no = req.body.mobile_no;
    let in_mail_id = req.body.mail_id;
    let in_name = req.body.name;
    let in_bio_description = req.body.bio_description;
    var in_profile_picture_link;
    let in_mobile_cc_code = req.body.mobile_cc_code;
    let in_user_cat = req.body.user_cat;
    let in_password = req.body.password;
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_firebase_auth_token = userId;

    if (req.body.profile_picture_link) {
      in_profile_picture_link = req.body.profile_picture_link;
    } else {
      if (req.files.profile_picture_link) {
        path = req.files.profile_picture_link[0].path;

        await cloudinary.uploader.upload(path, async (err, result) => {
          if (err) {
            res.status(400).json({ message: "IMAGE NOT UPLOADED!" });
          } else {
            const fs = require("fs");
            fs.unlinkSync(path);
            in_profile_picture_link = await result.url;
          }
        });
      }
    }

    try {
      if (!in_firebase_auth_token) {
        res
          .status(400)
          .json({ data: [{ message: "Enter firebase_auth_token " }] });
      } else {
        connection.query(
          "call sp_firebase_authentication(?,?,?,?,?,?,?,?,?)",
          [
            in_mobile_no,
            in_mail_id,
            in_name,
            in_bio_description,
            in_profile_picture_link,
            in_mobile_cc_code,
            in_user_cat,
            in_password,
            in_firebase_auth_token,
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
    } catch (err) {
      res.status(500).json({ success: 0, data: err });
    }
  });
};
