import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:open_court/utils/Pallete.dart';

import '../Auth Screens/Login.dart';

class Onboard extends StatefulWidget {
  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "animation": "assets/report.json",
      "title": "Report Crime",
      "description": "Easily report crimes around you.",
    },
    {
      "animation": "assets/lottie/1.json",
      "title": "Know Your Rights",
      "description": "Learn about your legal rights.",
    },
    {
      "animation": "assets/lottie/2.json",
      "title": "Get Legal Aid",
      "description": "Find the right legal support.",
    },
    {
      "animation": "assets/lottie/3.json",
      "title": "Get Pro-bono Help",
      "description": "Access free legal aid.",
    },
  ];

  void _goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.bg,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button at the top-right corner
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: _goToLogin,
                child: const Text(
                  "Skip",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        onboardingData[index]['animation']!,
                        width: 300,
                        height: 300,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        onboardingData[index]['title']!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          onboardingData[index]['description']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child:
                  _currentIndex == onboardingData.length - 1
                      ? ElevatedButton(
                        onPressed: _goToLogin,
                        child: const Text("Get Started"),
                      )
                      : ElevatedButton(
                        onPressed: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: const Text("Next"),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
