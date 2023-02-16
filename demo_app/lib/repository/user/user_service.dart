import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class UserService {
  login(String email, String password) {}
  void register() {}
  Future<List<UserModel>>? fechUsers() {
    return null;
  }
}

class UserServiceImpl implements UserService {
  final userServiceProvider = Provider<UserService>((ref) => UserServiceImpl());
  @override
  Future<List<UserModel>> fechUsers() async {
    var url = Uri.parse(
        'https://ozeapp-5f71c-default-rtdb.firebaseio.com/users.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<UserModel> users = [];
      data.forEach((key, value) {
        UserModel user = UserModel(
          id: key,
          username: value['username'],
          password: value['password'],
        );

        users.add(user);
      });
      return users;
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  @override
  Future<bool> login(String email, String password) async {
    final userService = UserServiceImpl();
    List<UserModel>? users;
    users = await userService.fechUsers();
    print("Đang làm ở lớp service");
    try {
      bool isValidUser = users
          .where((user) => user.username == email && user.password == password)
          .isNotEmpty;
      return isValidUser;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  @override
  void register() {}
}
