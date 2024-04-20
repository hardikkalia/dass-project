const express = require("express");
const filterRouter = express.Router();
const User = require("../models/user");
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");
const generateFilterString = require("../features/filter/createquery");

filterRouter.post("/api/filter", auth, async (req, res) => {
  try {
    const userId = req.user;
    const queryParams = req.body["queryParams"];
    User.findById(userId)
      .then((user) => {
        if (!user) {
          res.status(404).json({ message: "User not found" });
        }

        const filterString = generateFilterString(
          queryParams["start"],
          queryParams["end"],
          queryParams["company"],
          queryParams["status"],
          queryParams["ordertype"]
        );
        const filteredOrders = user.orders.filter((order) =>
          eval(filterString)
        );

        res.json(filteredOrders);
      })
      .catch((error) => {
        res.status(404).json({ message: error });
      });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = filterRouter;
