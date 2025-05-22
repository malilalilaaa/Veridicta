import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
// import 'package:open_court/responsive/responsive.dart';
import 'package:open_court/services/auth_services.dart';
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
      final email = data.email;
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
      final email = data.email ?? '';
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
        child: Stack(
          children: [
            FlutterLogin(
              onLogin: signinUser,
              onRecoverPassword: _passwordReset,
              onSignup: signupUser,
              theme: LoginTheme(
                pageColorLight: const Color.fromARGB(255, 209, 217, 226),
                pageColorDark: Colors.white,
                primaryColor: Pallete.mainfont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
