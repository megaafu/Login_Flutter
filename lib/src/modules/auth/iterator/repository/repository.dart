import '../../data/models/user.dart';
import '../../data/models/user_authenticate.dart';
import '../state/auth_state.dart';

abstract interface class AuthRepository {
  Future<AuthState> login(UserAuthenticate userAuthenticate);
  Future<AuthState> register(User user);
  Future<AuthState> logout();
}

