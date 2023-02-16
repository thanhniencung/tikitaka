// ignore_for_file: use_build_context_synchronously

import 'package:demo_app/repository/user/user_repository.dart';
import 'package:flutter/material.dart';

import '../../shared/constant/error.dart';
import '../home/myhomepage.dart';

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
      if (userRepo.signUpUser(
          context: context, email: email, password: password)) {
        return showSnackBar(
            context, "Đăng ký Tài Khoản  thành công, hãy đăng nhập ");
      } else {
        showSnackBar(
            context, 'Server quá tải vui lòng thử lại sau ít phút nữa nha');
      }
    } catch (e) {
      showSnackBar(
          context, 'Server quá tải vui lòng thử lại sau ít phút nữa nhé');
    }
  }

  loginUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      // ignore: use_build_context_synchronously
      if (await userRepo.loginUser(
          context: context, email: email, password: password)) {
        // ignore: use_build_context_synchronously
        showSnackBar(context, "Đăng nhập thành công");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(email: email, password: password),
          ),
        );
      } else {
        showSnackBar(context,
            'Server quá tải vui lòng đăng nhập lại sau ít phút nữa nha');
      }
    } catch (e) {
      showSnackBar(
          context, 'Server quá tải vui lòng đăng nhạp lại sau ít phút nữa nhé');
    }
  }
}
