import 'package:demo_app/model/user.dart';

abstract class ProductLocal {
  void cacheUser(User user) {}
}

class ProductLocalImpl implements ProductLocal {
  @override
  void cacheUser(User user) {
    // Trực tiếp xủ lý chi tiết với database Sqlite
  }
}
