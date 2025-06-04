import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';

class ReportSubmitted extends StatelessWidget {
  final Map<String, dynamic> data;
  final Function(Map<String, dynamic>) onComplete;

  const ReportSubmitted({
    Key? key,
    required this.data,
    required this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reportId = data['reportId']?.toString() ?? 'ERROR-ID-NOT-FOUND';

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 64,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Report Successfully Submitted',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Your report has been securely transmitted to law enforcement',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Pallete.proButton,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your Report ID',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Pallete.proButton,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        reportId,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Save this ID to check your report status or communicate securely with law enforcement',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushNamedAndRemoveUntil('/', (route) => false);
                },
                child: const Text(
                  'Return to Home',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
