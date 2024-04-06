const mongoose = require("mongoose");

const messageSchema = new mongoose.Schema({
  content: { type: String, required: true },
  date: { type: Date, required: true },
  sender: { type: String, required: true },
});

const userAllMessagesSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true }, // Assuming you have a User model to reference
  messages: [messageSchema],
  number_of_messages: { type: Number, required: true, default: 0 },
  last_update: { type: Date, required: true },
});

const UserAllMessages = mongoose.model(
  "UserAllMessages",
  userAllMessagesSchema
);

module.exports = UserAllMessages;
