import 'package:http/http.dart' as http;

import '../models/user.dart';
import '../models/user_authenticate.dart';
import '../models/user_response.dart';

class AuthService {
  Future<UserResponse> login(UserAuthenticate userAuthenticate) async {
    var url = Uri.parse('https://helpless-insect-20.telebit.io/api/auth/login');
    var response = await http.post(
      url,
      body: userAuthenticate.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return UserResponse.fromJson(response.body);
    } else {
      throw Exception();
    }
  }

  Future<UserResponse> register(User user) async {
    var url =
        Uri.parse('https://helpless-insect-20.telebit.io/api/auth/register');
    var response = await http.post(
      url,
      body: user.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 201) {
      return UserResponse.fromJson(response.body);
    } else {
      throw Exception();
    }
  }

  Future<void> logout(String token) async {
    var url =
        Uri.parse('https://helpless-insect-20.telebit.io/api/auth/logout');
    await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
  }
}
