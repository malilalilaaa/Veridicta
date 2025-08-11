// routes/caseSearch.js
const express = require('express');
const Case = require('../models/Case');
const router = express.Router();

router.get('/', async (req, res) => {
  try {
    let { q } = req.query;

    // If q is undefined or not a string, set default
    if (typeof q !== 'string') {
      q = '';
    }

    const results = await Case.find({
      $or: [
        { title: { $regex: q, $options: 'i' } },
        { summary: { $regex: q, $options: 'i' } },
        { topic: { $regex: q, $options: 'i' } },
        { verdict: { $regex: q, $options: 'i' } }
      ]
    }).limit(10);

    res.json(results);
  } catch (err) {
    console.error('Search error:', err);
    res.status(500).json({ error: 'Search failed' });
  }
});

module.exports = router;
