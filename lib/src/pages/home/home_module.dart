import 'package:flutter_modular/flutter_modular.dart';

import '../../modules/auth/auth_module.dart';
import 'ui/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];

  @override
  void routes(RouteManager r) {
    r.child('/page', child: (_) => const HomePage());
  }
}
