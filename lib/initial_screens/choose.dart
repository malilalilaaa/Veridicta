import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Choose Role'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[100],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoleButton(title: 'Lawyer'),
            const SizedBox(height: 20),
            RoleButton(title: 'Civilian'),
          ],
        ),
      ),
    );
  }
}

class RoleButton extends StatelessWidget {
  final String title;
  const RoleButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle button tap
        debugPrint('$title button tapped');
      },
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          gradient: Pallete.bg,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
