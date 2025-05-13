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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'email': email, 'token': token, 'password': password};
  }
}
