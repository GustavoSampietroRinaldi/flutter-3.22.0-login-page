import 'package:flutter_modular/flutter_modular.dart';
import '../pages/user_list_page.dart';
import '../stores/user_list_store.dart';

class UserListModule extends Module {

  @override
  void binds(Injector i) {
    i.addLazySingleton(UserListStore.new);
  }
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => UserListPage());
  }

}