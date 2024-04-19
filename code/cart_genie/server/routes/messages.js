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
    const lastUpdate = req.body["lastUpdate"];
    const messages = JSON.parse(req.body["messages"]);
    // console.log(messages);
    const processedMessages = [];
    messages.forEach((msg) => {
      const { content, date, sender } = msg;
      const { orderNumber, orderStatus, companyName, orderType } =
        extractOrderInfo(content);
      if (
        !(orderNumber == null && orderStatus == null && companyName == null)
      ) {
        processedMessages.push({
          orderNumber,
          orderStatus,
          orderType,
          companyName,
          date,
          sender,
          content,
        });
      }
    });
    console.log(processedMessages);

    console.log(req.user);
    const user = await User.findById(req.user);
    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    // user.orders.push(
    //   ...processedMessages.map((processedMessage) => ({
    //     productId: processedMessage.orderNumber,
    //     current_status: processedMessage.orderStatus,
    //     order_type: processedMessage.orderType, // Assuming it's a delivery order
    //     full_messages: [
    //       {
    //         content: processedMessage.content,
    //         date: processedMessage.date,
    //       },
    //     ],
    //     company_name: processedMessage.companyName,
    //     // lastUpdate:processedMessage.date,
    //   }))
    // );
    processedMessages.forEach((processedMessage) => {
      // Check if an order with the same productId and company_name already exists
      const existingOrderIndex = user.orders.findIndex(
        (order) =>
          order.productId === processedMessage.orderNumber &&
          order.company_name === processedMessage.companyName
      );

      if (existingOrderIndex !== -1) {
        // If the order exists, push the message to its full_messages array
        user.orders[existingOrderIndex].full_messages.push({
          content: processedMessage.content,
          date: processedMessage.date,
        });
        user.orders[existingOrderIndex].current_status = processedMessage.orderStatus;
      } else {
        // If the order doesn't exist, create a new order object and push it to user.orders
        user.orders.push({
          productId: processedMessage.orderNumber,
          current_status: processedMessage.orderStatus,
          order_type: processedMessage.orderType, // Assuming it's a delivery order
          full_messages: [
            {
              content: processedMessage.content,
              date: processedMessage.date,
            },
          ],
          company_name: processedMessage.companyName,
        });
      }
    });
    user.lastUpdate = lastUpdate;
    user.lastUpdate = lastUpdate;
    console.log(lastUpdate);
    await user.save();

    res.json({ message: "Orders updated successfully" });
  } catch (e) {
    console.log(e.message);
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
