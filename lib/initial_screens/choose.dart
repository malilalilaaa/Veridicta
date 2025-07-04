import 'package:flutter/material.dart';
import 'package:open_court/user/Ai_assistant/ai_home.dart';
import 'package:open_court/user/Dashboard.dart';
import 'package:open_court/utils/Pallete.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: Pallete.bg),
        child: Padding(
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
      ),
    );
  }
}

class RoleButton extends StatelessWidget {
  final String title;
  const RoleButton({required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('$title button tapped');
        if (title == 'Lawyer') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Ai_Home()),
          );
        } else if (title == 'Civilian') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        }
      },
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Pallete.footer,
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
              color: Pallete.cardColor,
            ),
          ),
        ),
      ),
    );
  }
}
