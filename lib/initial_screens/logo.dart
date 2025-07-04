import 'package:flutter/material.dart';
import 'package:open_court/utils/Pallete.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: Pallete.bg),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo.png', height: 350),
              // SizedBox(height: 20),
              Image.asset('assets/logo_name.png', height: 3),
            ],
          ),
        ),
      ),
    );
  }
}
