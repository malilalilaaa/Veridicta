import 'package:flutter/material.dart';
import 'package:open_court/Auth%20Screens/Lawyer_verify/options.dart';
import 'package:open_court/info_screen/onboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      title: 'Open Court',
      home: SafeArea(child: Options()),
    );
  }
}
