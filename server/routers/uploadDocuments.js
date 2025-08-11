const express = require('express');
const router = express.Router();
const DocumentUpload = require('../models/upload');

router.post('/upload-documents', async (req, res) => {
  try {
    const { barCertificate, license, uploadedAt } = req.body;

    const newDoc = new DocumentUpload({
      barCertificate,
      license,
      uploadedAt: uploadedAt || new Date()
    });

    await newDoc.save();
    res.status(200).json({ message: 'Documents uploaded successfully' });

  } catch (error) {
    console.error('Upload error:', error);
    res.status(500).json({ error: 'Something went wrong uploading the documents.' });
  }
});

module.exports = router;
