import 'user_json.dart';

abstract class IUserService {
  Future<List<User>> getUsers();
}