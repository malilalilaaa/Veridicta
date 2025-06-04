import 'package:flutter/material.dart';
import 'package:open_court/model/report_model.dart';

class ReportProvider with ChangeNotifier {
  String reportId = '';
  String error = '';
  bool loading = false;
  ReportDetails? reportDetails;

  Future<void> fetchReportDetails() async {
    error = '';
    reportDetails = null;
    loading = true;
    notifyListeners();

    if (reportId.trim().isEmpty) {
      error = 'Please enter a report ID';
      loading = false;
      notifyListeners();
      return;
    }

    try {
      // Replace this with your actual API call
      final response = await Future.delayed(const Duration(seconds: 2), () {
        return {
          "id": "123",
          "reportId": reportId,
          "status": "Pending",
          "createdAt": DateTime.now().toIso8601String(),
          "title": "Missing Bicycle",
          "description": "A red bicycle was stolen from my house.",
          "location": "Dhaka",
        };
      });

      reportDetails = ReportDetails.fromJson(response);
    } catch (e) {
      error = 'Unable to find report. Please check the ID and try again.';
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
