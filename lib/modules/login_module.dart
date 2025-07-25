import 'package:flutter_modular/flutter_modular.dart';
import '../pages/login_page.dart';
import '../stores/login_store.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(LoginStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const LoginPage());
  }
}
