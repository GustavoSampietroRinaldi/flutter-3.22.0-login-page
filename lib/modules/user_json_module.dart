import 'package:flutter_modular/flutter_modular.dart';
import '../pages/user_json_page.dart';
import '../stores/user_json_store.dart';
import '../user_json/user_service_http.dart';
import '../user_json/i_user_service.dart';

class UserJsonModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<IUserService>(() => UserServiceHttp());
    i.addLazySingleton(UserStore.new);
  }
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => UserJsonPage());
  }

}