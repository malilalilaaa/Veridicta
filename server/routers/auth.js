const express = require('express');
const authRouter = express.Router();
const bcrypt = require('bcryptjs');
const User = require('../models/user');
const jwt = require("jsonwebtoken");

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

authRouter.post("/api/signin", async (req, res) => {
    try {
        const { email, password } = req.body;

        const existingUser = await User.findOne({ email });
        if (!existingUser) {
            return res.status(400).json({ msg: "User does not exist" });
        }

        const isMatch = await bcrypt.compare(password, existingUser.password);
        if (!isMatch) {
            return res.status(400).json({ msg: "Invalid Password" });
        }

        const token = jwt.sign({ id: existingUser._id }, "passwordKey");

        res.json({ token, user: existingUser });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

module.exports = authRouter;