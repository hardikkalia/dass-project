const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const axios = require('axios');
const signUpRouter = express.Router();
const START_VERIFY_URL = 'https://otp-verify-cart-genie-3367-dev.twil.io/start-verify'
const CHECK_VERIFY_URL = 'https://otp-verify-cart-genie-3367-dev.twil.io/check-verify'

signUpRouter.post("/api/signup", async (req, res) => {
  try {
    // console.log(req.body);

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

    //otp verify status code 401
    const verifyResponse = await axios.post(START_VERIFY_URL, { to:"+91"+phone, channel: 'sms' });
    if (!verifyResponse.data.success) {
      return res.status(400).json({ msg: "Failed to send OTP", error: verifyResponse.data.error });
    }

    // If OTP sent successfully
    res.status(200).json({ msg: "OTP sent successfully. Please verify to continue." });

    const hashedPassword = await bcryptjs.hash(password, 8);

    let user = new User({
      name,
      email,
      password: hashedPassword,
      phone,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = signUpRouter;
