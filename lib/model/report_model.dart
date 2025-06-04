class ReportDetails {
  final String id;
  final String reportId;
  final String status;
  final DateTime createdAt;
  final String title;
  final String description;
  final String location;

  ReportDetails({
    required this.id,
    required this.reportId,
    required this.status,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.location,
  });

  factory ReportDetails.fromJson(Map<String, dynamic> json) {
    return ReportDetails(
      id: json['id'],
      reportId: json['reportId'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      title: json['title'],
      description: json['description'],
      location: json['location'],
    );
  }
}
