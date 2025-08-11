// routes/report.js
const express = require('express');
const router = express.Router();
const Report = require('../models/Report'); // Mongoose model

// Create new report
router.post('/', async (req, res) => {
  try {
    const { title, description, reporterId } = req.body;

    // Validation
    if (!title || !description || !reporterId) {
      return res.status(400).json({ message: 'Missing fields' });
    }

    const newReport = new Report({
      title,
      description,
      reporterId,
      createdAt: new Date(),
    });

    await newReport.save();

    res.status(201).json({ message: 'Report submitted successfully' });
  } catch (error) {
    console.error('Error saving report:', error);
    res.status(500).json({ message: 'Server error' });
  }
});

module.exports = router;
