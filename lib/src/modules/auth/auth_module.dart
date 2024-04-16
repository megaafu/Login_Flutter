import 'package:flutter_modular/flutter_modular.dart';
import 'package:simpleapp/src/modules/auth/ui/pages/login_page.dart';

import 'data/service/storage.dart';
import 'data/repository/repository.dart';
import 'data/service/auth_service.dart';
import 'iterator/controller/auth_controller.dart';
import 'iterator/repository/repository.dart';
import 'ui/pages/register_page.dart';

class AuthModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(AuthService.new);
    i.addSingleton(Storage.new);
    i.add<AuthRepository>(AuthRepositoryImpl.new);
    i.addSingleton(AuthController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/login',
      child: (context) => LoginPage(
        controller: Modular.get<AuthController>(),
      ),
    );
    r.child(
      '/register',
      child: (context) => RegisterPage(
        controller: Modular.get<AuthController>(),
      ),
    );
  }
}
