// Import from packages
const express = require("express");
const mongoose = require("mongoose");

//Import from files
const signUpRouter = require("./routes/signup.js");

// Init
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://hardik:webcaptive%403%21tH@cluster0.rjbrbkt.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";

// Middleware
app.use(express.json())
app.use(signUpRouter);

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connected Successfully");
  })
  .catch((e) => console.log(e));

app.listen(PORT,"0.0.0.0", () => {
  console.log(`Connected at port ${PORT}`);
});
