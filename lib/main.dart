import 'package:flutter/material.dart';
import 'package:open_court/providers/user_provider.dart';
import 'package:open_court/services/login_signup/auth_services.dart';
import 'package:open_court/splash/onboard.dart';
import 'package:provider/provider.dart';
import 'package:open_court/user/Auth%20Screens/user_login.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
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
      theme: ThemeData(fontFamily: 'Montserrat'),
      title: 'Veridicta',
      home: Onboard(),

      // Provider.of<UserProvider>(context).user.token.isEmpty
      //     ? const Login()
      //     : Onboard(),
    );
  }
}
