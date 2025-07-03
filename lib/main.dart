import 'package:flutter/material.dart';
import 'package:open_court/providers/report_provider.dart';
import 'package:open_court/providers/user_provider.dart';
import 'package:open_court/services/login_signup/auth_services.dart';
import 'package:open_court/user/Ai_assistant/ai_home.dart';
import 'package:open_court/user/Hire_lawyer/lawyer_homescreen.dart';
import 'package:open_court/user/Hire_lawyer/lawyer_profile.dart';
import 'package:open_court/user/crime_report/report_home.dart';
import 'package:open_court/user/crime_report/submit_report.dart';
import 'package:open_court/utils/Pallete.dart';
import 'package:provider/provider.dart';

import 'user/crime_report/track.dart'; // Import your track.dart file here

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReportProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
          accentColor: Pallete.footer,
        ),
        textTheme: ThemeData.light().textTheme,
      ),
      title: 'Veridicta',
      home: Ai_Home(),

      // Provider.of<UserProvider>(context).user.token.isEmpty
      //     ? const Login()
      //     : Onboard(),
    );
  }
}
