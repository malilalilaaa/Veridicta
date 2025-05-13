const express = require('express');
const authRouter = express.Router();
const bcrypt = require('bcryptjs');
const User = require('../models/user');

authRouter.post("/api/Signup", async (req, res) => {
 try {
    const {email, password} = req.body;
    const existingUser = await User.findOne({ email  });
    if(existingUser) {
        return res.status(400).json({ msg: "User already exists"});
    }
    const hasedPassword = await bcrypt.hash(password, 8);
     let user = new User({
        email: email,
        password: hasedPassword,
    });
    user = await user.save();
    res.json(user);
 } catch (e) {
    res.status(500).json({ error: e.msg });
 }
});

authRouter.post("/api/Login", async (req, res) => {
    try {
        const {email, password} = req.body;
        const User = await User.findOne({ email  });
        if(!User) {
            return res.status(400).json({ msg: "User does not exist"});
        }
    const ismatch = await bcrypt.compare(password, User.password);
    if(!ismatch) {
        return res.status(400).json({msg : "Invalid Password"})
    }
    const token = jwt.sign({ id: User._id}, "passwordKey");
    res.json({ token, ...User._doc })
    } catch (e) {
        res.status(500).json({ error: e.msg})
    }
}) 
module.exports = authRouter;