import 'package:flutter_modular/flutter_modular.dart';
import 'login_module.dart';
import 'user_list_module.dart';
import 'user_json_module.dart';
import 'user_json_failure_module.dart';


class AppModule extends Module {

  @override
  void routes(RouteManager r) {
    r.module('/', module: LoginModule());
    r.module('/user_list', module: UserListModule());
    r.module('/user_json', module: UserJsonModule());
    r.module('/user_json_failure', module: UserJsonFailureModule());
  }
}