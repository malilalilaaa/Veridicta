// Flutter equivalent of the React ReportForm component
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:open_court/utils/Pallete.dart';
import 'package:open_court/widgets/crime_report/Location_input.dart';

class ReportForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onComplete;

  ReportForm({required this.onComplete});

  @override
  _ReportFormState createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  String incidentType = "";
  String specificType = "";
  String location = "";
  String title = "";
  String description = "";
  Uint8List? imageBytes;
  bool isAnalyzing = false;
  bool isSubmitting = false;
  double? latitude;
  double? longitude;

  final List<String> reportTypes = [
    "Theft",
    "Fire Outbreak",
    "Medical Emergency",
    "Natural Disaster",
    "Other",
  ];

  Future<void> handleImageUpload() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    setState(() => isAnalyzing = true);

    final bytes = await pickedFile.readAsBytes();
    final base64Image = base64Encode(bytes);

    try {
      final response = await http.post(
        Uri.parse("https://yourapi.com/api/analyze-image"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"image": "data:image/png;base64,$base64Image"}),
      );

      final data = jsonDecode(response.body);

      // Always set imageBytes so the image displays
      setState(() {
        imageBytes = bytes;
        if (data['title'] != null) title = data['title'];
        if (data['description'] != null) description = data['description'];
        if (data['reportType'] != null) specificType = data['reportType'];
      });
    } catch (e) {
      print("Error analyzing image: $e");
      // Still show the image even if analysis fails
      setState(() {
        imageBytes = bytes;
      });
    } finally {
      setState(() => isAnalyzing = false);
    }
  }

  String generateReportId() {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final random = Random.secure();
    final randomBytes = List.generate(16, (_) => random.nextInt(256));
    final combined = utf8.encode(timestamp + randomBytes.toString());
    return base64Url.encode(combined).substring(0, 16);
  }

  Future<void> handleSubmit() async {
    setState(() => isSubmitting = true);

    try {
      final reportData = {
        "reportId": generateReportId(),
        "type": incidentType ?? '',
        "specificType": specificType ?? '',
        "title": title ?? '',
        "description": description ?? '',
        "location": location ?? '',
        "latitude": latitude,
        "longitude": longitude,
        "image": imageBytes != null ? base64Encode(imageBytes!) : '',
        "status": "PENDING",
      };

      final response = await http.post(
        Uri.parse("https://yourapi.com/api/reports/create"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reportData),
      );

      final result = jsonDecode(response.body);
      if (response.statusCode != 200) throw Exception(result['error']);

      widget.onComplete(result);
    } catch (e) {
      print("Error submitting report: $e");
    } finally {
      setState(() => isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select Emergency Type"),
          SizedBox(height: 8),
          Row(
            children: [
              _buildTypeButton("EMERGENCY", Colors.red),
              SizedBox(width: 10),
              _buildTypeButton("NON_EMERGENCY", Colors.blue),
            ],
          ),
          SizedBox(height: 16),

          GestureDetector(
            onTap: handleImageUpload,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color:
                      Pallete
                          .searchBarBorder, // You can change the border color
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(
                  8.0,
                ), // Optional: rounded corners
              ),
              child:
                  imageBytes != null
                      ? Image.memory(imageBytes!, fit: BoxFit.cover)
                      : Center(child: Text("Tap to upload image")),
            ),
          ),
          if (isAnalyzing) Center(child: CircularProgressIndicator()),
          SizedBox(height: 16),
          LocationInput(
            value: location,
            onChanged: (val) => setState(() => location = val),
            onCoordinatesChange: (lat, lng) {
              setState(() {
                latitude = lat;
                longitude = lng;
              });
            },
            onComplete: (Map<String, dynamic> _) {},
          ),

          SizedBox(height: 16),
          // Move LocationInput here (below upload, above incident type)
          DropdownButtonFormField<String>(
            value: specificType.isNotEmpty ? specificType : null,
            items:
                reportTypes
                    .map(
                      (type) =>
                          DropdownMenuItem(value: type, child: Text(type)),
                    )
                    .toList(),
            onChanged: (val) => setState(() => specificType = val ?? ""),
            decoration: InputDecoration(labelText: "Incident Type"),
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(labelText: "Title"),
            onChanged: (val) => title = val,
          ),

          TextFormField(
            decoration: InputDecoration(labelText: "Description"),
            maxLines: 3,
            onChanged: (val) => description = val,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: isSubmitting ? null : handleSubmit,
            child:
                isSubmitting
                    ? CircularProgressIndicator()
                    : Text("Submit Report"),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeButton(String type, Color color) {
    final isSelected = incidentType == type;
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected ? color.withOpacity(0.8) : Colors.grey[800],
        ),
        onPressed: () => setState(() => incidentType = type),
        child: Column(
          children: [
            Icon(Icons.warning, color: isSelected ? Colors.white : color),
            Text(
              type,
              style: TextStyle(color: isSelected ? Colors.white : color),
            ),
          ],
        ),
      ),
    );
  }
}
