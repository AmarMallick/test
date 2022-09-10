const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const multer = require("multer");

exports.user_followers_mast_save = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_following_id = req.body.following_id;

    try {
      if (!in_user_id) {
        res.status(400).json({ data: [{ message: "Enter user_id " }] });
      } else if (!in_following_id) {
        res.status(400).json({ data: [{ message: "Enter following_id " }] });
      } else {
        connection.query(
          "call sp_user_followers_mast_save(?,?)",
          [in_user_id, in_following_id],
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

exports.user_followers_mast_delete = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;
    let in_following_id = req.body.following_id;

    try {
      if (!in_user_id) {
        res.status(400).json({ data: [{ message: "Enter user_id " }] });
      } else if (!in_following_id) {
        res.status(400).json({ data: [{ message: "Enter following_id " }] });
      } else {
        connection.query(
          "call sp_user_followers_mast_delete(?,?)",
          [in_user_id, in_following_id],
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

exports.get_followers_count = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;

    try {
      connection.query(
        "call sp_get_followers_count(?)",
        [in_user_id],
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

exports.get_following_count = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;

    try {
      connection.query(
        "call sp_get_following_count(?)",
        [in_user_id],
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

exports.get_followers = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;

    try {
      connection.query(
        "call sp_get_followers(?)",
        [in_user_id],
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

exports.get_following = async (req, res) => {
  var form = multer().array([]);
  await form(req, res, async (err) => {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    let in_user_id = userId;

    try {
      connection.query(
        "call sp_get_following(?)",
        [in_user_id],
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
