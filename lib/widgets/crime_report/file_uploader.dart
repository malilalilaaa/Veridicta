import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileUploaderWidget extends StatefulWidget {
  const FileUploaderWidget({
    super.key,
    required void Function(Map<String, dynamic> data) onComplete,
  });

  @override
  State<FileUploaderWidget> createState() => _FileUploaderWidgetState();
}

class _FileUploaderWidgetState extends State<FileUploaderWidget> {
  List<PlatformFile> _files = [];

  Future<void> _pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        _files = result.files;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Attach Evidence (Optional)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: _pickFiles,
                child: Center(
                  child: Text(
                    'Drop files here or click to upload',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              if (_files.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      _files.map((file) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            file.name,
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        );
                      }).toList(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
