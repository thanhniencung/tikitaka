// ignore_for_file: use_build_context_synchronously

import 'package:demo_app/model/user.dart';
import 'package:demo_app/repository/user/user_repository.dart';
import 'package:flutter/material.dart';

import '../../shared/constant/error.dart';
import '../home/myhomepage.dart';

class LoginController extends ChangeNotifier {
  final UserRepositoryImpl _userRepositoryImpl;

  LoginController({required UserRepositoryImpl userRepositoryImpl})
      : _userRepositoryImpl = userRepositoryImpl;

  handleRegister({
    required String email,
    required String password,
  }) {
    print("handleRegister");
    _userRepositoryImpl.signUpUser(
        user: User(
      email: email,
      password: password,
    ));
    // validate email, password
    if (email.length < 6 || password.length < 6) {}
  }

  handleLogin({
    required String email,
    required String password,
  }) {
    print("handleLogin");
    // validate email, password
    _userRepositoryImpl.loginUser(
        user: User(
      email: email,
      password: password,
    ));
  }
}
