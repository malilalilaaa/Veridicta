const mongoose = require('mongoose');

const caseSchema = new mongoose.Schema({
    title: {
        type: String,
        required: true,
    },
    summary: String,
    topic: String,
    verdict: String,
    date: Date,
    pdfUrl: String,
});

module.exports = mongoose.model('Case', caseSchema);