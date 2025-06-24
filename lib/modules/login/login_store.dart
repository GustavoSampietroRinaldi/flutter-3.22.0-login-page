import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool passwordVisible = false;

  @observable
  bool isLoading = false;

  @computed
  bool get isEmailValid => email.contains('@') && email.contains('.com');

  @computed
  bool get isPasswordValid => password.isNotEmpty;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid;

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void togglePasswordVisibility() {
    passwordVisible = !passwordVisible;
  }

  @action
  Future<void> login() async {
    if (!isFormValid) return;
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading = false;
  }
}
