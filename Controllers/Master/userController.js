const connection = require("./../../db/mysql");
const jwt = require("jsonwebtoken");
const { firebase,admin } = require("../../config/fbConfig");

const userGet = async (req, res) => {
  try {
    const userId = req.user;

    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    var sql = `SELECT * FROM user_mast WHERE user_id="${userId}"`;
    connection.query(sql, (err, result) => {
      if (err) {
        res.status(500).json({ success: 0, data: err });
      } else {
        if(result.length > 0){
          delete result[0].password;
          res.status(200).json({ success: 1, data: result[0] });
        }else{
          var sqlIns = "INSERT INTO user_mast (user_id) VALUES (?)";
          connection.query(sqlIns,[userId],(er, rest) => {
            if(er){
              res.status(500).json({ success: 0, data: er });
            }else{
              connection.query(sql, (error, resp) => {
                if(error){
                  res.status(500).json({ success: 0, data: er });
                }else{
                  if(resp.length > 0){
                    delete resp[0].password;
                    res.status(200).json({ success: 1, data: resp[0] });
                  }else{
                    res.status(500).json({ success: 0, data: "error while fatching data" });
                  }
                }
              })
            }
          })
        }
      }
    });
  } catch (err) {
    res.status(500).json({ success: 0, data: err });
  }
};

const login = (req, res) => {
  firebase
    .auth()
    .signInWithEmailAndPassword(req.body.email, req.body.password)
    .then(function () {
      firebase
        .auth()
        .currentUser.getIdToken(true)
        .then(function (idToken) {
          res.status(200).json({ success: 1, token: idToken });
        })
        .catch(function (error) {
          res.status(500).json({ success: 0, data: error });
        });
    })
    .catch(function (error) {
      //Handle error
      res.status(500).json({ success: 0, data: error });
    });
};

const isAuth = (req, res) => {
  var user = firebase.auth().currentUser;
  if (user) {
    user
      .getIdToken(true)
      .then(function (idToken) {
        res.status(200).json({ success: 1, token: idToken });
        res.end();
      })
      .catch(function (error) {
        // Handle error
      });
  } else {
    //Handle error
  }
};

const userUpdate = async (req, res) => {
  try {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    if (
      req.body.name &&
      req.body.email &&
      req.body.phone &&
      req.body.bio &&
      req.body.profile &&
      req.body.phone_cc_code &&
      req.body.is_facebook_linked &&
      req.body.is_google_linked
    ) {
      var sql = `UPDATE user_mast set name = "${req.body.name}",mail_id = "${req.body.email}", mobile_no = "${req.body.phone}", mobile_cc_code = "${req.body.phone_cc_code}", bio_description = "${req.body.bio}", profile_picture_link = "${req.body.profile}", is_facebook_linked = "${req.body.is_facebook_linked}", is_google_linked = "${req.body.is_google_linked}" WHERE user_id="${userId}"`;
      var updatedUser = `SELECT * FROM user_mast WHERE user_id="${userId}"`;
      connection.query(
        "select mail_id from user_mast where user_id=?",
        [userId],
        (error, data) => {
          if (error) {
            res.status(500).json({ success: 0, data: error });
          } else {
            if (data[0].mail_id != req.body.email) {
              connection.query(
                "select login_id,mail_id from user_mast where mail_id=?",
                [req.body.email],
                (er, dt) => {
                  if (dt.length == 1) {
                    res
                      .status(400)
                      .json({ data: [{ message: "Email already exist" }] });
                  } else {
                    connection.query(sql, (err) => {
                      if (err) {
                        res.status(500).json({ success: 0, data: err });
                      } else {
                        connection.query(updatedUser, (e, result) => {
                          if (e) {
                            res.status(500).json({ success: 0, data: e });
                          } else {
                            res.status(200).json({ success: 1, data: result });
                          }
                        });
                      }
                    });
                  }
                }
              );
            } else {
              connection.query(sql, (err) => {
                if (err) {
                  res.status(500).json({ success: 0, data: err });
                } else {
                  connection.query(updatedUser, (e, result) => {
                    if (e) {
                      res.status(500).json({ success: 0, data: e });
                    } else {
                      res.status(200).json({ success: 1, data: result });
                    }
                  });
                }
              });
            }
          }
        }
      );
    } else {
      res.status(500).json({ data: "Please provide all details" });
    }
  } catch (err) {
    res.status(500).json({ success: 0, data: err });
  }
};

const userNotification = (req, res) => {
  try {
    const userId = req.user;
    if (!userId && userId == undefined) {
      res.status(400).json({ data: [{ message: "Enexpacted token" }] });
    }
    if (req.body.registrationToken && req.body.message) {
        const notification_options = {
            priority: "high",
            timeToLive: 60 * 60 * 24
        };
      const registrationToken = req.body.registrationToken;
      const message = req.body.message;
      const options = notification_options;
      const payload = {
        'notification': {
          'title': `${userId} just logged an event`,
          'body': `${message}`,
        }, 
        // NOTE: The 'data' object is inside payload, not inside notification
        'data': { 
              'personSent': userId 
        }
      };
      admin
        .messaging()
        .sendToDevice(registrationToken,payload, options)
        .then((response) => {
          res.status(200).json({ success: 1, data: "Notification sent successfully" });
        })
        .catch((error) => {
          res.status(500).json({ success: 0, data: error });
        });
    } else {
      res.status(500).json({ data: "Please provide all details" });
    }
  } catch (err) {
    res.status(500).json({ success: 0, data: err });
  }
};

module.exports = {
  userGet,
  login,
  isAuth,
  userUpdate,
  userNotification,
};
