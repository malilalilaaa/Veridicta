// ignore_for_file: unused_local_variable

import 'dart:convert';

class User {
  final String id;
  final String email;
  final String token;
  final String password;

  User({
    required this.id,
    required this.email,
    required this.token,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'token': token, 'password': password};
  }

  factory User.fromJson(Map<String, dynamic> map) {
    final data = map.cast<String, dynamic>();
    return User(
      id: map['_id'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      password: map['password'] ?? '',
    );
  }
  String toJsonString() => json.encode(toJson());
  factory User.fromJsonString(String source) =>
      User.fromJson(json.decode(source));
}
