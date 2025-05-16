import 'package:flutter/material.dart';
import 'package:open_court/providers/user_provider.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      title: 'Veridicta',
      home: const Login(),
    );
  }
}
