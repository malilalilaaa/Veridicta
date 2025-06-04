import 'package:flutter/material.dart';
import 'package:open_court/model/report_model.dart';
import 'package:open_court/providers/report_provider.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:provider/provider.dart';

class ReportTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ReportProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Track Your Report')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Report ID',
                errorText: provider.error.isNotEmpty ? provider.error : null,
              ),
              onChanged: (value) => provider.reportId = value,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:
                  provider.loading
                      ? null
                      : () {
                        provider.fetchReportDetails();
                      },
              child:
                  provider.loading
                      ? const CircularProgressIndicator()
                      : const Text("Track Report"),
            ),
            const SizedBox(height: 24),
            if (provider.reportDetails != null)
              Expanded(
                child: ReportDetailsCard(details: provider.reportDetails!),
              ),
          ],
        ),
      ),
    );
  }
}

class ReportDetailsCard extends StatelessWidget {
  final ReportDetails details;

  const ReportDetailsCard({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Pallete.proButton,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _infoTile("Status", details.status),
            _infoTile("Report ID", details.reportId),
            _infoTile("Submitted On", details.createdAt.toLocal().toString()),
            _infoTile("Title", details.title),
            _infoTile("Location", details.location),
            _infoTile("Description", details.description),
          ],
        ),
      ),
    );
  }

  Widget _infoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title:", style: TextStyle(color: Pallete.icon)),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
