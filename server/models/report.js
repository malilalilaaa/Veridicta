const mongoose = require('mongoose');

const reportSchema = new mongoose.Schema({
  title: String,
  description: String,
  reporterId: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
  createdAt: Date
});

module.exports = mongoose.model('Report', reportSchema);
