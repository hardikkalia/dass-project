const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const signInRouter = express.Router();
const jwt = require("jsonwebtoken");
const twilioClient = require("../features/otp/twilioconfig");
const generateOTP=require("../features/otp/otpgenerator");

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
    const otp = generateOTP();
    await twilioClient.messages.create({
      body: `Your OTP is: ${otp}`,
      from: "",
      to: phone,
    });

    res.status(200).json({ msg: "OTP sent successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = signInRouter;
