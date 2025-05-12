const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
    email: {
        required: true,
        type:String,
        trim: true,
        validate: {validator: (value) =>{
            const re = /^([a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+)$/;
            return value.match(re);
        },
    message: "Invalid email address",
},
    }, password: {
        required:true,
        type: String,
    }
});
const User = mongoose.model('User', userSchema);
module.exports = User;