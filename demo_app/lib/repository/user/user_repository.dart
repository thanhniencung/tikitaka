import 'package:demo_app/model/user.dart';
import 'package:demo_app/repository/user/user_local.dart';
import 'package:demo_app/repository/user/user_service.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class UserRepo {
  signUpUser(
      {required BuildContext context,
      required String email,
      required String password}) {}
  loginUser(
      {required BuildContext context,
      required String email,
      required String password}) {}
}

class UserRepositoryImpl implements UserRepo {
  final userServiceProvider = Provider<UserRepo>((ref) => UserRepositoryImpl());
  final UserServiceImpl userServiceImpl = UserServiceImpl();
  signUpUser(
      {required BuildContext context,
      required String email,
      required String password}) {
    return userServiceImpl.signUpUser(
        context: context, email: email, password: password);
  }

  loginUser(
      {required BuildContext context,
      required String email,
      required String password}) {
    return userServiceImpl.loginUser(
        context: context, email: email, password: password);
  }
}
