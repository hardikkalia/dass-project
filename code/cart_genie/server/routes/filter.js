const express = require("express");
const filterRouter = express.Router();
const User = require("../models/user");
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");
// const filterRouter = require("./filter");
const createQuery=require("../features/filter/createquery");


filterRouter.post("/api/filter", auth, async (req, res) => {
  try {
    console.log("hi from filter js")
    const userId = req.user;
    console.log(req.body);
    const query = createQuery(req.body["queryParams"]);
    console.log(query);
    const user = await User.findById(userId).populate({
      path: "orders",
      matchQ: query,
    });
    console.log(user);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    res.json(user.orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = filterRouter;