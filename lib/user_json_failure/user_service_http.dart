import 'dart:convert';
import 'package:http/http.dart' as http;

import 'user_json_failure.dart';
import 'i_user_service.dart';

class UserServiceHttp implements IUserService {
  final http.Client client;

  UserServiceHttp({http.Client? client})
      : client = client ?? http.Client();

  @override
  Future<List<User>> getUsers() async {
    final response = await client.get(
      Uri.parse('https://errojsonplaceholder.typicode.com/users'),
      headers: {
        'User-Agent': 'FlutterApp/1.0',
        'Accept': 'application/json',
      },
    );

    print("Status code: ${response.statusCode}");
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}