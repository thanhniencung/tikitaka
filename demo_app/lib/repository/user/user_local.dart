import 'package:demo_app/model/user.dart';

abstract class UserLocal {
  void cacheUser(UserModel user) {}
}

class UserLocalImpl implements UserLocal {
  @override
  void cacheUser(UserModel user) {
    // Trực tiếp xủ lý chi tiết với database Sqlite
  }
}
