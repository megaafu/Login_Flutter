import '../../iterator/repository/repository.dart';
import '../../iterator/state/auth_state.dart';
import '../models/user.dart';
import '../models/user_authenticate.dart';
import '../service/auth_service.dart';
import '../service/storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Storage storage;
  final AuthService authService;
  AuthRepositoryImpl({required this.authService, required this.storage});
  @override
  Future<AuthState> login(UserAuthenticate userAuthenticate) async {
    try {
      final userResponse = await authService.login(userAuthenticate);
      storage.addToken(userResponse.token);
      return LoggedState();
    } catch (e) {
      return ErrorState(e.toString());
    }
  }

  @override
  Future<AuthState> register(User user) async {
    try {
      final userResponse = await authService.register(user);
      storage.addToken(userResponse.token);
      return RegisteredState();
    } catch (e) {
      return ErrorState(e.toString());
    }
  }

  @override
  Future<AuthState> logout() async {
    try {
      String? token = await storage.getToken('token');
      if (token != null) await authService.logout(token);
      return LoggedOutState();
    } catch (e) {
      return ErrorState(e.toString());
    }
  }
}
