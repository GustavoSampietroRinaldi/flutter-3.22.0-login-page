import 'user_json_failure.dart';

abstract class IUserService {
  Future<List<User>> getUsers();
}