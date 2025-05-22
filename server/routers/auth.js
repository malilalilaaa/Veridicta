const express = require('express');
const authRouter = express.Router();
const bcrypt = require('bcryptjs');
const User = require('../models/user');
const jwt = require("jsonwebtoken");
const auth = require("../middleware/auth");

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

        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({ msg: "User does not exist" });
        }

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ msg: "Invalid Password" });
        }

        const token = jwt.sign({ id: user._id }, "passwordKey");

        res.json({ token, ...user._doc });
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

authRouter.post("/tokenIsValid", async (req, res) => {
  try {
    const token = req.header("x-auth-token");
    if (!token) return res.json(false);
    const verified = jwt.verify(token, "passwordKey");
    if (!verified) return res.json(false);

    const user = await User.findById(verified.id);
    if (!user) return res.json(false);
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//user data getting
authRouter.get("/", auth, async (req, res) => {
    
    const user = await User.findById(req.user);
    res.json({...user._doc, token:req.token });
});
module.exports = authRouter;