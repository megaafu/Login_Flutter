import 'dart:convert';

class UserAuthenticate {
  final String email;
  final String password;

  UserAuthenticate({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  static UserAuthenticate fromMap(Map<String, dynamic> map) {
    return UserAuthenticate(email: map['email'], password: map['password']);
  }

  String toJson() => json.encode(toMap());

  static UserAuthenticate fromJson(String source) =>
      fromMap(json.decode(source));
}
