import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:open_court/model/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(id: '', email: '', token: '', password: '');
  User get user => _user;
  void setUser(String user) {
    _user = User.fromJson(jsonDecode(user));
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
