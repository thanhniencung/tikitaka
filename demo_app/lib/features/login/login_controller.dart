import 'package:demo_app/repository/user/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/user.dart';
import '../../repository/user/user_service.dart';

abstract class LoginController {
  login(String email, String password);
}

class LoginControllerImpl extends ChangeNotifier implements LoginController {
  final userRepo = UserRepositoryImpl();
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String email, String password) async {
    print("Đây là controller gọi lớp Repository làm");
    try {
      bool isValidUser = await userRepo.login(email, password);
      if (isValidUser) {
        _isLoggedIn = true;
        notifyListeners();
      } else {
        _isLoggedIn = false;
        notifyListeners();
      }
    } catch (e) {
      _isLoggedIn = false;
      notifyListeners();
      throw Exception(e.toString());
    } finally {}
  }
}
