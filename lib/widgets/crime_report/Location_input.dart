import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationInput extends StatefulWidget {
  final String value;
  final Function(String) onChanged;
  final Function(double? lat, double? lng)? onCoordinatesChange;

  const LocationInput({
    super.key,
    required this.value,
    required this.onChanged,
    this.onCoordinatesChange,
  });

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  bool isGettingLocation = false;
  String? locationError;

  Future<void> getLocation() async {
    setState(() {
      isGettingLocation = true;
      locationError = null;
    });

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception("Location services are disabled.");
      }

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

      widget.onChanged('${position.latitude}, ${position.longitude}');
      widget.onCoordinatesChange?.call(position.latitude, position.longitude);
    } catch (e) {
      setState(() {
        locationError = e.toString();
      });
    } finally {
      setState(() {
        isGettingLocation = false;
      });
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
              controller: TextEditingController(text: widget.value),
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                hintText: 'Enter location or use pin',
                filled: true,
                fillColor: Colors.black54,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 16,
                ),
                hintStyle: const TextStyle(color: Colors.white54),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: IconButton(
                icon:
                    isGettingLocation
                        ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                        : const Icon(
                          Icons.my_location,
                          color: Colors.lightBlue,
                        ),
                onPressed: isGettingLocation ? null : getLocation,
                tooltip: 'Get current location',
              ),
            ),
          ],
        ),
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
