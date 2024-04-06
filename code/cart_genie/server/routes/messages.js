const express = require("express");
const userAllMessages = require("../models/user_messages");
const messageRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");
const bcryptjs = require("bcryptjs");

messageRouter.post("/api/messages", auth, async(req, res)=>{
    try{
        
    }
    catch(e){

    }
});

messageRouter.get()


module.exports(messageRouter)