const express = require("express");
const filterRouter = express.Router();
const User = require("../models/user");
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");
// const filterRouter = require("./filter");
const createQuery = require("../features/filter/createquery");

filterRouter.post("/api/filter", auth, async (req, res) => {
  try {
    console.log("hi from filter js");
    const userId = req.user;
    console.log(req.body);
    const query = createQuery(req.body["queryParams"]);
    console.log(query);
    User.findById(userId)
      .then((user) => {
        if (!user) {
          // Handle case where user doesn't exist
          console.log("User Not found");
          return [];
        }

        // Filter orders where company_name is Amazon
        const amazonOrders = user.orders.filter(
          (order) => order.company_name === "Amazon"
        );

        // Do something with amazonOrders, like return or log them
        console.log(amazonOrders);
        res.json(amazonOrders);
      })
      .catch((error) => {
        // Handle any errors
        console.error("Error:", error);
        // Return empty array or handle error as per your application logic
        return [];
      });
      
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = filterRouter;
