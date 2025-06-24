import 'package:flutter_modular/flutter_modular.dart';
import 'login/login_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void routes(RouteManager r) {
    r.module('/', module: LoginModule());
  }
}
