import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/auth_module.dart';
import 'pages/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];

  @override
  void routes(RouteManager r) {
    r.redirect('/', to: '/auth/login');
    r.module('/auth', module: AuthModule());
    r.module('/home', module: HomeModule());
  }
}
