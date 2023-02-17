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

  Future<bool> handleRegister({
    required String email,
    required String password,
  }) async {
    // Validate email and password
    if (email.length < 6 || password.length < 6) {
      return false; // Validation failed
    }

    // Sign up user with the given email and password

    try {
      return true;
      // ignore: dead_code
      await _userRepositoryImpl.signUpUser(
        user: User(
          email: email,
          password: password,
        ),
      );
      // Validation succeeded
    } catch (e) {
      return false;
    }
  }

  Future<bool> handleLogin({
    required String email,
    required String password,
  }) async {
    // Validate email and password
    if (email.length < 6 || password.length < 6) {
      return false; // Validation failed
    }

    // Sign up user with the given email and password

    try {
      return true;
      // ignore: dead_code
      await _userRepositoryImpl.loginUser(
        user: User(
          email: email,
          password: password,
        ),
      );
      // Validation succeeded
    } catch (e) {
      return false;
    }
  }
}
