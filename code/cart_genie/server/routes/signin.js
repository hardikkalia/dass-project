/** Route for handling the sign in functionality of the application.
 * 
 * We use a twilio server for verification.
 * email sign in receives http post request with json web token for authentication and relevant details
 * 
 * Twilio server function works in two stages. 
 * The /api/signin/phone/verify sends a request to twilio server to generate a otp and send it to 
 * the user. 
 * The /api/signin/phone/verify/submit sends the entered otp to the twilio service for verification
 * the /tokenValid route returns its responde.
 */


const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const signInRouter = express.Router();
const jwt = require("jsonwebtoken");
const twilioClient = require("../features/otp/twilioconfig");
// const generateOTP = require("../features/otp/otpgenerator");
const startVerify = require("../features/functions/start-verify");
const checkVerify = require("../features/functions/check-verify");
const auth = require("../middleware/auth");
const axios = require("axios");
// const signInRouter = require('express').Router();

// Replace 'your-twilio-function-url' with the actual URL of your deployed 'start-verify' Twilio Function
const START_VERIFY_URL =
  "https://otp-verify-cart-genie-3367-dev.twil.io/start-verify";
const CHECK_VERIFY_URL =
  "https://otp-verify-cart-genie-3367-dev.twil.io/check-verify";

signInRouter.post("/api/signin/email", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res.status(400).json({ msg: "User not found!" });
    }

    const isCorrect = await bcryptjs.compare(password, user.password);
    if (!isCorrect) {
      return res.status(400).json({ msg: "Incorrect Password." });
    }
    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

signInRouter.post("/api/signin/phone/verify", async (req, res) => {
  try {
    const { phone } = req.body;
    const user = await User.findOne({ phone });
    if (!user) {
      return res.status(400).json({ msg: "User not found!" });
    }

    // Call the start-verify Twilio Function
    const verifyResponse = await axios.post(START_VERIFY_URL, {
      to: "+91" + phone,
      channel: "sms",
    });
    if (!verifyResponse.data.success) {
      return res
        .status(400)
        .json({ msg: "Failed to send OTP", error: verifyResponse.data.error });
    }
    // If OTP sent successfully
    res.json({ msg: "OTP sent successfully. Please verify to continue." });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


signInRouter.post("/api/signin/phone/verify/submit", async (req, res) => {
  const { phone, code } = req.body;
  try {
    // Call the check-verify Twilio Function
    const checkResponse = await axios.post(CHECK_VERIFY_URL, {
      to: "+91"+phone,
      code,
    });
    if (checkResponse.data.success) {
      // Verification successful, proceed with sign-in
      const user = await User.findOne({ phone });
      const token = jwt.sign({ id: user._id }, "passwordKey");
      res.json({ token, ...user._doc });
    } else {
      // Verification failed
      res.status(400).json({ msg: "Incorrect OTP. Please try again." });
    }
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

signInRouter.post("/tokenValid", async (req, res) => {
  try {
    const token = req.header("auth-token");
    if (!token) return res.json(false);
    const isVerified = jwt.verify(token, "passwordKey");
    if (!isVerified) return res.json(false);
    const user = await User.findById(isVerified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

signInRouter.get("/", auth, async (req, res) => {
  const user = await User.findById(req.user);
  const modifiedLastUpdate = moment(user.lastUpdate).subtract(5, 'hours').subtract(30, 'minutes').format();
  user.lastUpdate = modifiedLastUpdate;
  res.json({ ...user._doc, token: req.token });
});

module.exports = signInRouter;
