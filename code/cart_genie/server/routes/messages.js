const express = require("express");
const UserAllMessages = require("../models/user_messages");
const messageRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");
const bcryptjs = require("bcryptjs");
const extractOrderInfo = require("../processing/processing");
const User = require("../models/user"); // Assuming you have a 'User' model

messageRouter.post("/api/messages", auth, async (req, res) => {
  try {
    const token = req.header("auth-token");
    const isVerified = jwt.verify(token, "passwordKey");
    req.user = isVerified.id;
    const { lastUpdate, messages } = req.body;
    const processedMessages = [];
    messages.forEach(msg => {
      const { content, date, sender } = msg;
      const { orderNumber, orderStatus, companyName } = extractOrderInfo(content);
      processedMessages.push({ orderNumber, orderStatus, companyName, date, sender });
    });

    // Add the processed messages, last update, and userID to the request body
    req.body = { processedMessages, lastUpdate, userId: req.user };

    // Forward the request to the /api/messages/submit route
    req.method = "POST";
    messageRouter.handle(req, res, "/api/messages/submit");
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

messageRouter.post("/api/messages/submit", auth, async (req, res) => {
  try {
    const { processedMessages, lastUpdate, userId } = req.body;

    // Find the user document
    const user = await User.findById(userId);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    // Update the user's orders and lastUpdate
    user.orders.push(...processedMessages.map(processedMessage => ({
      provided_order_id: processedMessage.orderNumber,
      current_status: processedMessage.orderStatus,
      order_type: processedMessage.orderType, // Assuming it's a delivery order
      full_messages: [
        {
          content: processedMessage.content,
          date: processedMessage.date
        }
      ],
      company_name: processedMessage.companyName
    })));
    user.last_update = lastUpdate;

    // Save the updated user document
    await user.save();

    res.json({ message: "Orders updated successfully" });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = messageRouter;