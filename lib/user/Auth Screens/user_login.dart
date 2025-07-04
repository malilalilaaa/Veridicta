import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:open_court/services/login_signup/auth_services.dart';
import 'package:open_court/utils/Pallete.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  Duration get loadingTime => const Duration(microseconds: 3000);

  Future<String?> signinUser(LoginData data) async {
    try {
      final email = data.name;
      final password = data.password;
      if (email.isEmpty || password.isEmpty) {
        return 'Email and password are required.';
      }

      authService.signInUser(
        context: context,
        email: email,
        password: password,
      );
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> _passwordReset(String data) {
    return Future.delayed(loadingTime).then((value) => null);
  }

  Future<String?> signupUser(SignupData data) async {
    try {
      final email = data.name ?? '';
      final password = data.password ?? '';
      if (email.isEmpty || password.isEmpty) {
        return 'Email and password are required.';
      }
      authService.signUpUser(
        context: context,
        email: email,
        password: password,
      );
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: Pallete.bg, // Your custom background gradient
        ),
        child: FlutterLogin(
          onLogin: signinUser,
          onRecoverPassword: _passwordReset,
          onSignup: signupUser,
          theme: LoginTheme(
            pageColorLight: Colors.transparent,
            pageColorDark: Colors.transparent,
            primaryColor: Colors.indigo, // Bold and visible color
            cardTheme: const CardTheme(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            buttonTheme: const LoginButtonTheme(
              backgroundColor: Color(0xFF4468A0),
              highlightColor: Colors.white,
              splashColor: Colors.white54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              elevation: 4.0,
            ),
            textFieldStyle: const TextStyle(color: Colors.black),
            inputTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Color(0xFFF0F0F5),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
            ),
            titleStyle: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
