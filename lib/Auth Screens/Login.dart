import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:open_court/utils/Pallete.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Duration get loadingTime => const Duration(microseconds: 3000);

  Future<String?> _authUsers(LoginData data) {
    return Future.delayed(loadingTime).then((value) => null);
  }

  Future<String?> _passwordReset(String data) {
    return Future.delayed(loadingTime).then((value) => null);
  }

  Future<String?> _signup(SignupData data) {
    return Future.delayed(loadingTime).then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // FlutterLogin widget with transparent background
          FlutterLogin(
            onLogin: _authUsers,
            onRecoverPassword: _passwordReset,
            onSignup: _signup,
            theme: LoginTheme(
              pageColorLight: const Color.fromARGB(255, 209, 217, 226),
              pageColorDark: Pallete.bg,
              primaryColor: Pallete.mainfont,
            ),
          ),
        ],
      ),
    );
  }
}
