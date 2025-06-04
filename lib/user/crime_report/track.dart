import 'package:flutter/material.dart';
import 'package:open_court/widgets/crime_report/report_tracker.dart';
// Make sure the path is correct

class TrackReportPage extends StatelessWidget {
  const TrackReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Track Report'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: ReportTrackerPage(), // ⬅️ Must return a widget
          ),
        ),
      ),
    );
  }
}
