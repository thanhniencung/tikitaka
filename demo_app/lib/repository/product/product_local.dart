import 'package:demo_app/model/user.dart';

abstract class ProductLocal {
  void cacheUser(UserModel user) {}
}

class ProductLocalImpl implements ProductLocal {
  @override
  void cacheUser(UserModel user) {
    // Trực tiếp xủ lý chi tiết với database Sqlite
  }
}
