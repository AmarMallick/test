require("firebase/auth");
const firebase = require('firebase')
const admin = require('firebase-admin')
const serviceAccount = require("./service_account.json");

var firebaseConfig = {
    apiKey: "AIzaSyAU4sObYX2NzuDfSww7EHMg_wUZXyZz-vQ",
    authDomain: "auth-4e430.firebaseapp.com",
    projectId: "auth-4e430",
    storageBucket: "auth-4e430.appspot.com",
    messagingSenderId: "598996135622",
    appId: "1:598996135622:web:d06404cf50244b0101f1c7",
    measurementId: "G-JECPL1FB7Q"
};
firebase.initializeApp(firebaseConfig);
admin.initializeApp({
    credential: admin.credential.cert(serviceAccount),
    databaseURL: "https://auth-4e430-default-rtdb.firebaseio.com/"
});

module.exports = { firebase, admin };