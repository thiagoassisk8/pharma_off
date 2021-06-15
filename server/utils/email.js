const nodemailer = require('nodemailer');

const sendEmail = async options => {
  const transporter = nodemailer.createTransport({
    service: 'Gmail',
    secure: true,
    auth: {
      user: 'pharmaoff3@gmail.com',
      pass: 'tcc40028922',
    },
  });

  const mailOptions = {
    from: 'PharmaOFF <pharmaoff3@gmail.com>',
    to: options.email,
    subject: options.subject,
    text: options.message,
  };

  await transporter.sendMail(mailOptions);
};

module.exports = sendEmail;
