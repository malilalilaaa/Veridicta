import 'package:flutter/material.dart';
import 'package:open_court/main.dart';
import 'package:open_court/model/user.dart';
import 'package:open_court/providers/user_provider.dart';
import 'package:open_court/utils/constants.dart';
import 'package:open_court/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../providers/user_provider.dart' show UserProvider;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(id: '', email: email, password: password, token: '');
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signup'),
        body: jsonEncode(user.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            'Account created! Login with the same email and password.',
            context,
          );
        },
      );
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      final navigator = Navigator.of(context);

      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signin'),
        body: jsonEncode({'email': email, 'password': password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print('🔍 Full response body: ${res.body}');
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          userProvider.setUser(res.body);

          try {
            final decoded = jsonDecode(res.body);
            final token = decoded['token'];

            if (token != null && token is String && token.isNotEmpty) {
              await prefs.setString('x-auth-token', token);
            } else {
              print('⚠️ Warning: token missing or invalid in response.');
            }
          } catch (e) {
            print('❌ Error decoding token: $e');
          }

          navigator.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MyApp()),
            (route) => false,
          );
        },
      );
    } catch (e) {
      showSnackBar(e.toString(), context);
    }
  }
}
