import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:open_court/widgets/crime_report/report_wizard.dart';

class SubmitReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Positioned.fill(
            child: Container(decoration: BoxDecoration(gradient: Pallete.bg)),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.cyan.shade900.withOpacity(0.2),
                        border: Border.all(color: Colors.cyan.shade200),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.lock_outline, color: Colors.cyan),
                          SizedBox(width: 8),
                          Text(
                            'Secure & Anonymous',
                            style: TextStyle(color: Colors.cyan),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      'Submit Anonymous Report',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Your safety is our priority. All submissions are encrypted and anonymized.',
                      style: TextStyle(color: Colors.grey[400]),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    ReportWizard(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Pallete.footer,
    );
  }
}
