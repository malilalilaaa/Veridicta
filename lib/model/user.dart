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

  Map<String, dynamic> toMap() {
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

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  factory User.fromJsonString(String source) =>
      User.fromMap(json.decode(source));
}
