const express = require("express");
const User = require("../models/user");
const profileRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");
const bcryptjs = require("bcryptjs");

profileRouter.post("/api/profile/edit/name", auth, async (req, res) => {
  try {
    const { id, name } = req.body;
    const user = await User.findById(id);
    if (!user) {
      return res.status(400).json({ msg: "User not found!" });
    }
    user.name = name;
    const newUser = await user.save();
    res.json(newUser);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

profileRouter.post("/api/profile/edit/email", auth, async (req, res) => {
  try {
    const { id, email } = req.body;
    // console.log(req);
    const user = await User.findById(id);
    if (!user) {
      return res.status(400).json({ msg: "User not found!" });
    }
    user.email = email;
    const newUser = await user.save();
    // console.log(user)
    res.json(newUser);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

profileRouter.post("/api/profile/edit/password", auth, async (req, res) => {
  try {
    // const { id, password } = req.body;
    const { id, oldPassword, newPassword } = req.body; 

    const user = await User.findById(id);
    if (!user) {
      return res.status(400).json({ msg: "User not found!" });
    }

    const isCorrect = await bcryptjs.compare(oldPassword, user.password);
    if (!isCorrect) {
      return res.status(400).json({ msg: "Incorrect Password." });
    }
    const hashedPassword = await bcryptjs.hash(newPassword, 8);

    user.password = hashedPassword;
    const newUser = await user.save();

    res.json(newUser);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
module.exports = profileRouter;
