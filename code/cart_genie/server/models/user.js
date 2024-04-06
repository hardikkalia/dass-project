const mongoose = require("mongoose");
const userSchema = mongoose.Schema({
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
      // validate: {
      //   validator: (value) => {
      //     const re = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
      //     return value.match(re);
      //   },
      //   message: "Please enter a valid password",
      // },
    },
});

const User = mongoose.model("User", userSchema);
module.exports = User;
