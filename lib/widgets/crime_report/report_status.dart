import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportStatus extends StatelessWidget {
  final Map<String, dynamic> report;

  const ReportStatus({super.key, required this.report});

  Color getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'pending':
        return Colors.yellowAccent;
      case 'in progress':
        return Colors.lightBlueAccent;
      case 'resolved':
        return Colors.greenAccent;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = report['status'] ?? 'Pending Review';
    final reportId = report['reportId'] ?? 'N/A';
    final incidentType = report['incidentType'] ?? 'Unknown';
    final timestamp = report['timestamp'];
    final formattedDate =
        timestamp != null
            ? DateFormat.yMMMd().format(DateTime.parse(timestamp))
            : 'Unknown';
    final priority = report['analysis']?['priority'] ?? 'Unknown';
    final department = report['analysis']?['department'] ?? 'Unknown';
    final List<dynamic> timeline = report['timeline'] ?? [];

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade800.withOpacity(0.5)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with status and ID
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Report Status",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    status,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: getStatusColor(status),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Report ID",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  Text(
                    reportId,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Report Details Grid
          GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            childAspectRatio: 3.5,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: [
              _detailItem("Incident Type", incidentType),
              _detailItem("Submitted On", formattedDate),
              _detailItem("Priority Level", priority),
              _detailItem("Assigned Department", department),
            ],
          ),

          const SizedBox(height: 24),

          // Timeline
          const Text(
            "Timeline",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          ...timeline.map((event) {
            final desc = event['description'] ?? '';
            final time = event['timestamp'];
            final formattedTime =
                time != null
                    ? DateFormat.yMMMd().add_jm().format(DateTime.parse(time))
                    : 'Unknown';
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          desc,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          formattedTime,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _detailItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }
}
