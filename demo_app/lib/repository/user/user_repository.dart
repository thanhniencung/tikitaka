import 'dart:async';

import 'package:demo_app/repository/user/user_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../model/user.dart';

abstract class UserRepo {
  Future<User>? signUpUser({
    required User user,
  }) {}
  Future<User>? loginUser({
    required User user,
  }) {}
}

class UserRepositoryImpl implements UserRepo {
  final UserServiceImpl _userServiceImpl;

  UserRepositoryImpl({required UserServiceImpl userServiceImpl})
      : _userServiceImpl = userServiceImpl;

  @override
  Future<User>? signUpUser({
    required User user,
  }) async {
    var completer = Completer<User>();
    try {
      var response = await _userServiceImpl.signUpUser(user: user);
      print(response.data);
      completer.complete(User());
    } on DioError catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }

  @override
  Future<User>? loginUser({
    required User user,
  }) async {
    var completer = Completer<User>();
    try {
      var response = await _userServiceImpl.loginUser(user: user);
      print(response.data);
    } on DioError catch (e) {
      completer.completeError(e);
    }
    return completer.future;
  }
}
