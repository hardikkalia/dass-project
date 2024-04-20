/**Route for handling the signup functionality in the application.
 * 
 * Receives a post request with json web token for authentication.
 * Attempts to find a user with existing email and phone in the database.
 * If found then returns error.
 * 
 * Phone verification through twilio server works in two steps. 
 * The /api/signup/verify sends a request to twilio server to send an OTP for verification.
 * 
 * The /api/signup/verify/submit validates the external 
 * Encrypts and stores password and user information in the database
 */


const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const axios = require("axios");
const signUpRouter = express.Router();
const jwt = require("jsonwebtoken");
const START_VERIFY_URL =
  "https://otp-verify-cart-genie-3367-dev.twil.io/start-verify";
const CHECK_VERIFY_URL =
  "https://otp-verify-cart-genie-3367-dev.twil.io/check-verify";

signUpRouter.post("/api/signup", async (req, res) => {
  try {

    const { name, email, phone, password } = req.body;

    const existingEmail = await User.findOne({ email });
    const existingPhone = await User.findOne({ phone });

    if (existingEmail && existingPhone) {
      return res.status(400).json({ msg: "Account already exists!" });
    } else if (existingEmail) {
      return res
        .status(400)
        .json({ msg: "An account with same email already exists!" });
    } else if (existingPhone) {
      return res
        .status(400)
        .json({ msg: "An account with same phone number already exists!" });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      name,
      email,
      password: hashedPassword,
      phone,
    });
    user = await user.save();
    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

signUpRouter.post("/api/signup/verify", async (req, res) => {
  try {
    const { email, phone } = req.body;

    const existingEmail = await User.findOne({ email });
    const existingPhone = await User.findOne({ phone });

    if (existingEmail && existingPhone) {
      return res.status(400).json({ msg: "Account already exists!" });
    } else if (existingEmail) {
      return res
        .status(400)
        .json({ msg: "An account with same email already exists!" });
    } else if (existingPhone) {
      return res
        .status(400)
        .json({ msg: "An account with same phone number already exists!" });
    }

    const verifyResponse = await axios.post(START_VERIFY_URL, {
      to: "+91" + phone,
      channel: "sms",
    });

    if (!verifyResponse.data.success) {
      return res
        .status(400)
        .json({ msg: "Failed to send OTP", error: verifyResponse.data.error });
    }

    res.json({ msg: "OTP sent successfully. Please verify to continue." });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

signUpRouter.post("/api/signup/verify/submit", async (req, res) => {
  const { name, phone, email, password, code } = req.body;

  try {
    // Call the check-verify Twilio Function
    const checkResponse = await axios.post(CHECK_VERIFY_URL, {
      to: "+91" + phone,
      code,
    });

    if (!checkResponse.data.success) {
      res.status(400).json({ msg: "Incorrect OTP. Please try again." });
    }

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      name,
      email,
      password: hashedPassword,
      phone,
    });
    user = await user.save();
    const token = jwt.sign({ id: user._id }, "passwordKey");
    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = signUpRouter;
