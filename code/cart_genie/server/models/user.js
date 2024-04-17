const mongoose = require("mongoose");

const orderSchema = new mongoose.Schema({
  provided_order_id: { //order id mentioned in the 
    type: String,
    // required: true,
    index: true, 
    unique: true 
  },
  current_status: { //out for delivery, dispatched, delivered
    type: String,
    // required: true,
  },
  order_type: { //delivery or return
    type: String,
    // required: true,
  },
  full_messages: [{ //used to display detailed order info
    content: {
      type: String,
      // required: true,
    },
    date: {
      type: Date,
      // required: true,
    }
  }],
  company_name: {
    type: String,
    // required: true,
  }
});

const userSchema = new mongoose.Schema({
  user_ID:{
    // required: true,
    type: String,
  },
  name: {
    required: true,
    type: String,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },
  phone: {
    required: true,
    type: String,
    validate: {
      validator: (value) => {
        const re = /^[0-9]{10}$/;
        return value.match(re);
      },
      message: "Please enter a valid phone number",
    },
  },
  password: {
    required: true,
    type: String,
  },
  address: {
    type: String,
  },
  gender: {
    type: String,
  },
  age: {
    type: String,
  },
  orders: [orderSchema], // written seperately to improve readibilty 
  lastUpdates: {type: Date}
});

const User = mongoose.model("User", userSchema);

module.exports = User;
