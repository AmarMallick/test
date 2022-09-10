const { firebase, admin } = require('../config/fbConfig');

module.exports = (req, res, next) => {
    if(req.header('Authorization')){
        const token = req.header('Authorization').replace('Bearer', '').trim()
        var user = firebase.auth().currentUser;
        if (user) {
            admin.auth().verifyIdToken(token)
            .then(function (decodedToken) {
                if(decodedToken.uid === user.uid)
                {
                    req.user = user.uid
                    return next()
                }
            }).catch(function (error) {
                //Handle error
            });
        } else {
            res.status(500).json({ success: 0, data: "There is no current user." });
        }

    }else{
        res.status(500).json({ success: 0, data: "Token required" });
    }
};
