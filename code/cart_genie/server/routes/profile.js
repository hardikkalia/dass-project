const express = require("express");
const User = require("../models/user");
const profileRouter = express.Router();
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");

profileRouter.post("/api/profile/edit/name",auth, async (req,res)=>{
    try {
        console.log(req.body);
        const {id, name}=req.body;
        const user=await User.findById(id);
        if(!user){
            return res.status(400).json({msg:'User not found!'});
        }
        console.log(user);
        user.name=name;
        user=await user.save();
        res.json(user);
    }
    catch(e){
        res.status(500).json({ error: e.message });
    }
});

module.exports=profileRouter;
