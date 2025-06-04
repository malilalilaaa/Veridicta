import 'package:flutter/material.dart';
import 'Location_input.dart';
import 'report_form.dart';
import 'file_uploader.dart';
import 'report_form_completed.dart';

class ReportWizard extends StatefulWidget {
  @override
  _ReportWizardState createState() => _ReportWizardState();
}

class _ReportWizardState extends State<ReportWizard> {
  int currentStep = 1;
  Map<String, dynamic> reportData = {};

  void handleStepComplete(Map<String, dynamic> data) {
    setState(() {
      data.forEach((key, value) {
        reportData[key] = value ?? '';
      });
      if (currentStep < 4) {
        currentStep++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IndexedStack(
        index: currentStep - 1,
        children: [
          ReportForm(onComplete: handleStepComplete),
          FileUploaderWidget(onComplete: handleStepComplete),
          LocationInput(
            onComplete: handleStepComplete,
            value: reportData['location'] ?? '',
            onChanged: (val) {
              setState(() {
                reportData['location'] = val;
              });
            },
          ),
          ReportSubmitted(data: reportData, onComplete: handleStepComplete),
        ],
      ),
    );
  }
}
