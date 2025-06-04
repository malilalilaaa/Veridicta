import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  final String value;
  final Function(String) onChanged;
  final Function(double? lat, double? lng)? onCoordinatesChange;

  const LocationInput({
    super.key,
    required this.value,
    required this.onChanged,
    this.onCoordinatesChange,
    required void Function(Map<String, dynamic> data) onComplete,
  });

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  bool isGettingLocation = false;
  String? locationError;
  List<String> suggestions = [];

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.value;
    if (widget.value.isEmpty) {
      getLocation();
    }
  }

  @override
  void didUpdateWidget(LocationInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Only update if the value changed and it's not the same as the controller's text
    if (widget.value != oldWidget.value && widget.value != _controller.text) {
      _controller.text = widget.value;
    }
  }

  Future<void> getLocation() async {
    setState(() {
      isGettingLocation = true;
      locationError = null;
    });

    try {
      print('Starting getLocation');
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) throw Exception("Location services are disabled.");

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception("Location permission denied.");
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception("Location permissions are permanently denied.");
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      print('Got position: ${position.latitude}, ${position.longitude}');

      final address = await getAddressFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (address != null) {
        print('Fetched address: $address');
        _controller.text = address;
        widget.onChanged(address);
      }

      widget.onCoordinatesChange?.call(position.latitude, position.longitude);
    } catch (e) {
      print('Location error: $e');
      setState(() {
        locationError = e.toString();
      });
    } finally {
      setState(() {
        isGettingLocation = false;
      });
    }
  }

  Future<String?> getAddressFromCoordinates(double lat, double lng) async {
    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/reverse?format=json&lat=$lat&lon=$lng',
    );

    try {
      final response = await http.get(
        url,
        headers: {'User-Agent': 'flutter-app'},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['display_name'];
      }
    } catch (e) {
      print('Reverse geocoding error: $e');
    }

    return null;
  }

  Future<List<String>> fetchLocationSuggestions(String query) async {
    final url = Uri.parse('https://photon.komoot.io/api/?q=$query');

    try {
      final response = await http.get(url);
      final data = jsonDecode(response.body);
      final features = data['features'] as List;
      return features.map((item) {
        final name = item['properties']['name'] ?? '';
        final city = item['properties']['city'] ?? '';
        final country = item['properties']['country'] ?? '';
        return [name, city, country].where((s) => s.isNotEmpty).join(', ');
      }).toList();
    } catch (e) {
      print("Autocomplete error: $e");
      return [];
    }
  }

  void onTextChanged(String text) async {
    widget.onChanged(text);
    if (text.length > 2) {
      final results = await fetchLocationSuggestions(text);
      setState(() => suggestions = results);
    } else {
      setState(() => suggestions = []);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            TextField(
              controller: _controller,
              onChanged: onTextChanged,
              decoration: InputDecoration(
                hintText: 'Enter location or use pin',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: (_controller.text.length > 40) ? 8 : 16,
                ),
                hintStyle: const TextStyle(color: Colors.white54),
              ),
              style: const TextStyle(color: Colors.black),
            ),
            // Positioned(
            //   right: 8,
            //   top: 8,
            //   child: IconButton(
            //     icon:
            //         isGettingLocation
            //             ? const SizedBox(
            //               width: 20,
            //               height: 20,
            //               child: CircularProgressIndicator(strokeWidth: 2),
            //             )
            //             : const Icon(
            //               Icons.my_location,
            //               color: Colors.lightBlue,
            //             ),
            //     onPressed: isGettingLocation ? null : getLocation,
            //     tooltip: 'Get current location',
            //   ),
            // ),
          ],
        ),
        if (suggestions.isNotEmpty)
          ...suggestions.map((s) {
            return ListTile(
              title: Text(s, style: const TextStyle(color: Colors.white)),
              tileColor: Colors.black45,
              onTap: () {
                _controller.text = s;
                widget.onChanged(s);
                setState(() => suggestions = []);
              },
            );
          }).toList(),
        if (locationError != null) ...[
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.error, color: Colors.red, size: 16),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  locationError!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
