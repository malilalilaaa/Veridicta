import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:url_launcher/url_launcher.dart';

class Report_Center extends StatelessWidget {
  const Report_Center({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Secure & Anonymous Reporting Tag
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.lock_outline, color: Colors.cyan, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'Secure & Anonymous Reporting',
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Main Heading
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                      fontFamily: 'Montserrat',
                    ),
                    children: [
                      TextSpan(
                        text: 'Report Incident.\n',
                        style: TextStyle(color: Pallete.searchBarBorder),
                      ),
                      TextSpan(
                        text: 'Protect Identity.',
                        style: TextStyle(color: Pallete.sideNav), // light blue
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Description
                const Text(
                  'Make your community safer without compromising your safety. Our advanced encryption ensures your identity remains completely anonymous.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Pallete.icon,
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 28),

                // Buttons
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Pallete.submitButton,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Make Anonymous Report',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 40,
          right: 20,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red.withOpacity(0.1),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.red.shade300),
              ),
            ),
            onPressed: () async {
              final Uri phoneUri = Uri(scheme: 'tel', path: '999');
              if (await canLaunchUrl(phoneUri)) {
                await launchUrl(phoneUri);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Could not launch phone dialer'),
                  ),
                );
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.circle, size: 8, color: Colors.red),
                SizedBox(width: 6),
                Text(
                  'Emergency: 999',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
