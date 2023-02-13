import 'package:demo_app/model/user.dart';

abstract class UserLocal {
  void cacheUser(User user) {}
}

class UserLocalImpl implements UserLocal {
  @override
  void cacheUser(User user) {
    // Trực tiếp xủ lý chi tiết với database Sqlite
  }
}
