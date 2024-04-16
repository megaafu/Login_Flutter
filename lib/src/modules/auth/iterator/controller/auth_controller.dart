import 'package:flutter/material.dart';

import '../../data/models/user.dart';
import '../../data/models/user_authenticate.dart';
import '../repository/repository.dart';
import '../state/auth_state.dart';

class AuthController extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthState state = InitState();

  AuthController(this.authRepository);

  Future<void> register(User user) async {
    state = LoadingState();
    notifyListeners();

    state = await authRepository.register(user);
    notifyListeners();
  }

  Future<void> login(UserAuthenticate userAuthenticate) async {
    state = LoadingState();
    notifyListeners();

    state = await authRepository.login(userAuthenticate);
    notifyListeners();
  }

  Future<void> logout(UserAuthenticate userAuthenticate) async {
    state = LoadingState();
    notifyListeners();

    state = await authRepository.logout();
    notifyListeners();
  }
}
