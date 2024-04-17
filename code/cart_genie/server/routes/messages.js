const express = require("express");
const UserAllMessages = require("../models/user_messages");
const messageRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");
const bcryptjs = require("bcryptjs");
const extractOrderInfo = require("../processing/processing");
const User = require("../models/user");

messageRouter.post("/api/messages", auth, async (req, res) => {
  try {
    // console.log(hi1);
    // const token = req.header("auth-token");
    // const isVerified = jwt.verify(token, "passwordKey");
    // req.user = isVerified.id;
    const lastUpdate = req.body["lastUpdate"];
    const messages = JSON.parse(req.body["messages"]);
    // console.log(messages);
    const processedMessages = [];
    messages.forEach((msg) => {
      const { content, date, sender } = msg;
      const { orderNumber, orderStatus, companyName } =
        extractOrderInfo(content);
      if (
        !(orderNumber == null && orderStatus == null && companyName == null)
      ) {
        processedMessages.push({
          orderNumber,
          orderStatus,
          companyName,
          date,
          sender,
          content,
        });
      }
    });
    console.log(processedMessages);
    // Add the processed messages, last update, and userID to the request body
    // req.body = { processedMessages, lastUpdate, userId: req.user };
    // Forward the request to the /api/messages/submit route
    // messageRouter.handle(req, res, "/api/messages/submit");

    console.log(req.user);
    const user = await User.findById(req.user);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    user.orders.push(
      ...processedMessages.map((processedMessage) => ({
        provided_order_id: processedMessage.orderNumber,
        current_status: processedMessage.orderStatus,
        order_type: processedMessage.orderType, // Assuming it's a delivery order
        full_messages: [
          {
            content: processedMessage.content,
            date: processedMessage.date,
          },
        ],
        company_name: processedMessage.companyName,
      }))
    );
    user.last_update = lastUpdate;

    await user.save();

    res.json({ message: "Orders updated successfully" });
  } catch (e) {
    console.log(e.message);
    res.status(500).json({ error: e.message });
  }
});

messageRouter.post("/api/messages/submit", auth, async (req, res) => {
  try {
    const { processedMessages, lastUpdate, userId } = req.body;
    console.log(processedMessages);
    // Find the user document
    const user = await User.findById(userId);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    // Update the user's orders and lastUpdate
    user.orders.push(
      ...processedMessages.map((processedMessage) => ({
        provided_order_id: processedMessage.orderNumber,
        current_status: processedMessage.orderStatus,
        order_type: processedMessage.orderType, // Assuming it's a delivery order
        full_messages: [
          {
            content: processedMessage.content,
            date: processedMessage.date,
          },
        ],
        company_name: processedMessage.companyName,
      }))
    );
    user.last_update = lastUpdate;

    // Save the updated user document
    await user.save();

    res.json({ message: "Orders updated successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

messageRouter.get("/api/messages/retrieve", auth, async (req, res) => {
  try {
    const userID = req.user;
    const user = await User.findById(userID);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    const orders = user.orders;
    console.log(orders);
    res.json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = messageRouter;
