const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routers/auth');
const cors = require('cors');


const PORT = process.env.PORT || 3000;
const app = express();
app.use(cors({ origin: '*' }));
app.use(express.json());
app.use(authRouter);
  
const DB = ""


mongoose.connect(DB)
.then(() => {
    console.log("Connected to MongoDB");
})
.catch((err) => {
    console.log(err);
});
app.listen(PORT, "0.0.0.0", () => {console.log(`connected at port ${PORT}`)});
