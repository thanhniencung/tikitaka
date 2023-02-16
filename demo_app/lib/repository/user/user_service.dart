import 'dart:async';
import 'dart:convert';

import 'package:demo_app/network/tikitaka_client.dart';
import 'package:demo_app/shared/constant/app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../model/user.dart';
import '../../shared/constant/error.dart';

abstract class UserService {
  Future<Response>? signUpUser({
    required User user,
  }) {}

  Future<Response>? loginUser({
    required User user,
  }) {}
}

class UserServiceImpl implements UserService {
  @override
  Future<Response> signUpUser({
    required User user,
  }) async {
    return await TikiClient().dioInstance().post(
          '/users/register',
          data: user.toJson(),
        );
  }

  @override
  Future<Response> loginUser({
    required User user,
  }) async {
    return await TikiClient().dioInstance().post(
          '/auth/login',
          data: user.toJson(),
        );
  }
}
