const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const signInRouter = express.Router();
const jwt = require("jsonwebtoken");

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

signInRouter.post("/api/signin/phone", async (req, res) => {
  try {
  } catch (e) {}
});

module.exports = signInRouter;
