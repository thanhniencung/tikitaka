import 'package:demo_app/model/user.dart';
import 'package:demo_app/repository/user/user_local.dart';
import 'package:demo_app/repository/user/user_service.dart';

abstract class UserRepo {
  void login() {}
  void register() {}
}

class UserRepository implements UserRepo {
  late UserServiceImpl userServiceImpl;
  late UserLocalImpl userLocalImpl;

  @override
  void login() {
    userLocalImpl.cacheUser(User());
    userServiceImpl.login();
  }

  @override
  void register() {
    // TODO: implement register
  }
}
