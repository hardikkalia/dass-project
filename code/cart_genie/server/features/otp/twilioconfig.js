 const Twilio = require('twilio');

 const accountSid = 'AC3ba918c0e97e76e16e878a77438d5fb9';
 const authToken = '6e20cb6b151bb63c47bde28f17ca5b2f';

 const twilioClient = new Twilio(accountSid, authToken);

 module.exports = twilioClient;
