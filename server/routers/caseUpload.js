// routes/caseUpload.js
const express = require('express');
const Case = require('../models/Case');
const router = express.Router();

router.post('/', async (req, res) => {
  try {
    const { title, summary, topic, verdict, date, pdfUrl } = req.body;

    const legalCase = new Case({
      title,
      summary,
      topic,
      verdict,
      date,
      pdfUrl // should look like "/uploads/marbury.pdf"
    });

    await legalCase.save();
    res.status(201).json({ message: 'Case saved successfully' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Saving failed' });
  }
});

module.exports = router;
