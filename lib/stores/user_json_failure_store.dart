import 'package:mobx/mobx.dart';
import '/user_json_failure/user_json_failure.dart';
import '/user_json_failure/i_user_service.dart';

part 'user_json_failure_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final IUserService userService;

  _UserStoreBase(this.userService);

  @observable
  ObservableList<User> users = ObservableList<User>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchUsers() async {
    isLoading = true;
    errorMessage = null;
    try {
      final data = await userService.getUsers();
      users = ObservableList.of(data);
    } catch (e) {
      errorMessage = "Erro ao buscar usuários: $e";
    } finally {
      isLoading = false;
    }
  }
}
