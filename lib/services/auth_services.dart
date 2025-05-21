import 'dart:math';

import 'package:flutter/material.dart';
import 'package:open_court/model/user.dart';
import 'package:open_court/utils/constants.dart';
import 'package:open_court/utils/utils.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(id: '', email: email, password: password, token: '');
      http.Response res = await http.post(
        Uri.parse('${Constants.uri}/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(e.toString(), context);
        },
      );
    } catch (e) {}
  }
}
