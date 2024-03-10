const express = require("express");
const User = require("../models/user");
const bcryptjs = require("bcryptjs");
const signUpRouter = express.Router();

signUpRouter.post("/api/signup", async (req, res) => {
  try {
    console.log(req.body);

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
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = signUpRouter;
