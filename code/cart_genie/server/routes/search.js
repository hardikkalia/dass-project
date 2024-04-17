const express = require("express");
const router = express.Router();
const User = require("../models/user");



router.get("/api/filter", auth, async (req, res) => {
  try {
    const queryParams = req.query;
    const userId = req.user;
    const query = createQuery(queryParams);
    const user = await User.findById(userId).populate({
      path: "orders",
      matchQ: query,
    });

    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    res.json(user.orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = router;