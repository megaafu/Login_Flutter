import 'dart:convert';

class User {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  User({
    required this.email,
    required this.name,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'c_password': confirmPassword
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
        name: map['name'],
        email: map['email'],
        password: map['password'],
        confirmPassword: map['c_password']);
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));
}
