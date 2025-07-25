import 'package:mobx/mobx.dart';
import 'dart:math';

part 'user_list_store.g.dart';

class UserListStore = _UserListStore with _$UserListStore;

abstract class _UserListStore with Store {
  @observable
  ObservableList<String> names = ObservableList.of(['Ana', 'Bruno','Caio']);

  @action
  void addRandomName() {
    final randomNames = ['Davi','Enzo','Fernando','Gustavo'];
    final random = Random();
    final randomIndex = random.nextInt(randomNames.length);
    names.add(randomNames[randomIndex]);
  }
}