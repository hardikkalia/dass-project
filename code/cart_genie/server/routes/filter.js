const express = require("express");
const filterRouter = express.Router();
const User = require("../models/user");
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");
// const filterRouter = require("./filter");
const generateFilterString = require("../features/filter/createquery");

filterRouter.post("/api/filter", auth, async (req, res) => {
  try {
    console.log("hi from filter js");
    const userId = req.user;
    console.log(req.body);
    const queryParams=req.body["queryParams"];
    console.log(queryParams);
    // const query = createQuery(req.body["queryParams"]);
    // console.log(query);
    User.findById(userId)
      .then((user) => {
        if (!user) {
          // Handle case where user doesn't exist
          console.log("User Not found");
          res.status(404).json({message:"User not found"})
        }
        
        const filterString = generateFilterString(queryParams["start"], queryParams["end"], queryParams["company"], queryParams["status"], queryParams["ordertype"]);
        console.log(filterString)
        const filteredOrders = user.orders.filter(
          (order) => eval(filterString)
        );

        // Do something with amazonOrders, like return or log them
        console.log(filteredOrders);
        res.json(filteredOrders);
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
