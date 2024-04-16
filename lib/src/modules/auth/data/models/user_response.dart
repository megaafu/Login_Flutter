import 'dart:convert';

class UserResponse {
  final String? message;
  final String token;
  UserResponse({
    this.message,
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'accessToken': token,
    };
  }

  static UserResponse fromMap(Map<String, dynamic> map) {
    return UserResponse(message: map['message'], token: map['accessToken']);
  }

  String toJson() => json.encode(toMap());

  static UserResponse fromJson(String source) => fromMap(json.decode(source));
}
