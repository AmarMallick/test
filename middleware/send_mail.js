const nodemailer = require('nodemailer');

let transporter = nodemailer.createTransport({
    host: 'smtp.gmail.com',
    port: 587,
    auth: {
        user: process.env.GMAIL_USERNAME,
        pass: process.env.GMAIL_PASSWORD
    }
});

exports.sendMail = (email_id, otp) => {
    let mailDetails = {
        from: 'mrgrouptechnology0@gmail.com',
        to: email_id,
        subject: 'OTP for email verification',
        text: 'Your OTP is : ' + otp
    };
    let success = true;
    transporter.sendMail(mailDetails, function(error, info){
        if (error) {
            success = false;
        }
    });
    return success;
}