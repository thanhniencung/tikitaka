import 'package:demo_app/features/home/myhomepage.dart';
import 'package:demo_app/shared/constant/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../shared/constant/error.dart';

abstract class UserService {
  signUpUser({
    required BuildContext context,
    required String email,
    required String password,
  }) {}
  loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) {}
}

class UserServiceImpl implements UserService {
  final userServiceProvider = Provider<UserService>((ref) => UserServiceImpl());
  // @override
  // Future<List<UserModel>> fechUsers() async {
  //   var url = Uri.parse(
  //       'https://ozeapp-5f71c-default-rtdb.firebaseio.com/users.json');
  //   var response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = json.decode(response.body);
  //     List<UserModel> users = [];
  //     data.forEach((key, value) {
  //       UserModel user = UserModel(
  //         id: key,
  //         username: value['username'],
  //         password: value['password'],
  //       );

  //       users.add(user);
  //     });
  //     return users;
  //   } else {
  //     throw Exception('Failed to fetch users');
  //   }
  // }

  // @override
  // Future<bool> login(String email, String password) async {
  //   final userService = UserServiceImpl();
  //   List<UserModel>? users;
  //   users = await userService.fechUsers();
  //   print("Đang làm ở lớp service");
  //   try {
  //     bool isValidUser = users
  //         .where((user) => user.username == email && user.password == password)
  //         .isNotEmpty;
  //     return isValidUser;
  //   } catch (e) {
  //     print('Error: $e');
  //     return false;
  //   }
  // }

  // @override
  // void register() {}

  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        email: email,
        password: password,
      );
      http.Response res = await http.post(
        Uri.parse('${App.baseUrl}/users/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, "Đăng ký Tài Khoản  thành công, hãy đăng nhập ");
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('${App.baseUrl}auth/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          showSnackBar(context, "đăng nhập thành công");

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MyHomePage(email: email, password: password),
            ),
          );
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
