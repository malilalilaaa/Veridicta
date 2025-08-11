const mongoose = require('mongoose');

const documentUploadSchema = new mongoose.Schema({
  barCertificate: { type: String, required: true }, 
  license: { type: String, required: true },        
  uploadedAt: { type: Date, default: Date.now }
});

module.exports = mongoose.model('DocumentUpload', documentUploadSchema);
