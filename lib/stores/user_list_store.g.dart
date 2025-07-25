// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserListStore on _UserListStore, Store {
  late final _$namesAtom = Atom(name: '_UserListStore.names', context: context);

  @override
  ObservableList<String> get names {
    _$namesAtom.reportRead();
    return super.names;
  }

  @override
  set names(ObservableList<String> value) {
    _$namesAtom.reportWrite(value, super.names, () {
      super.names = value;
    });
  }

  late final _$_UserListStoreActionController =
      ActionController(name: '_UserListStore', context: context);

  @override
  void addRandomName() {
    final _$actionInfo = _$_UserListStoreActionController.startAction(
        name: '_UserListStore.addRandomName');
    try {
      return super.addRandomName();
    } finally {
      _$_UserListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
names: ${names}
    ''';
  }
}
