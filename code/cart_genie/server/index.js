// Import from packages
const express = require("express");
const mongoose = require("mongoose");
const bodyParser = require("body-parser");

//Import from files
const signUpRouter = require("./routes/signup.js");
const signInRouter = require("./routes/signin.js");
const profileRouter = require("./routes/profile.js");
const messageRouter = require("./routes/messages.js");
const filterRouter = require("./routes/filter.js");

// Init
const PORT = 3000;
const app = express();
const DB =
  // "mongodb+srv://@cluster0.uhu8czi.mongodb.net/";
  "mongodb+srv://hardik:webcaptive%403%21tH@cluster0.uhu8czi.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
// Middleware
app.use(express.json());
app.use(signUpRouter);
app.use(signInRouter);
app.use(profileRouter);
app.use(messageRouter);
app.use(filterRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connected Successfully");
  })
  .catch((e) => console.log(e));

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at port ${PORT}`);
});
