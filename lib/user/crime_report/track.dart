import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:open_court/widgets/crime_report/report_tracker.dart';

class TrackReportPage extends StatelessWidget {
  const TrackReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Track Report')),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(gradient: Pallete.bg),
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: ReportTrackerPage(), // ⬅️ Must return a widget
            ),
          ),
        ),
      ),
    );
  }
}
