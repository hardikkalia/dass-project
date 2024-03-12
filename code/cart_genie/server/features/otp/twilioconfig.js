const Twilio = require('twilio');

const accountSid = '';
const authToken = '';

const twilioClient = new Twilio(accountSid, authToken);

module.exports = twilioClient;