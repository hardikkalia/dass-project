const mongoose = require("mongoose");

const messageSchema = new mongoose.Schema({
  content: { type: String },
  date: { type: Date },
  sender: { type: String },
});

const userAllMessagesSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: "User", required: true }, // Assuming you have a User model to reference
  messages: [messageSchema],
  number_of_messages: { type: Number, default: 0 },
  last_update: { type: Date },
});

const UserAllMessages = mongoose.model(
  "UserAllMessages",
  userAllMessagesSchema
);

module.exports = UserAllMessages;
