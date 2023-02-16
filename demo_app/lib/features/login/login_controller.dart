import 'package:demo_app/repository/user/user_repository.dart';
import 'package:flutter/material.dart';

abstract class LoginController {
  signUpUser(
      {required BuildContext context,
      required String email,
      required String password});
  loginUser(
      {required BuildContext context,
      required String email,
      required String password});
}

class LoginControllerImpl extends ChangeNotifier implements LoginController {
  final userRepo = UserRepositoryImpl();

  signUpUser(
      {required BuildContext context,
      required String email,
      required String password}) {
    try {
      return userRepo.signUpUser(
          context: context, email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }

  loginUser(
      {required BuildContext context,
      required String email,
      required String password}) {
    try {
      return userRepo.loginUser(
          context: context, email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }
}
