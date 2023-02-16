import 'package:demo_app/model/user.dart';
import 'package:demo_app/repository/user/user_local.dart';
import 'package:demo_app/repository/user/user_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class UserRepo {
  login(String email, String password) {}
  register() {}
}

class UserRepositoryImpl implements UserRepo {
  final userServiceProvider = Provider<UserRepo>((ref) => UserRepositoryImpl());
  final userServiceImpl = UserServiceImpl();
  @override
  Future<bool> login(String email, String password) async {
    print('Đây là repository gọi lớp ở Service làm');
    bool isValidUser = await userServiceImpl.login(email, password);
    return isValidUser;
  }

  @override
  void register() {
    // TODO: implement register
  }
}
