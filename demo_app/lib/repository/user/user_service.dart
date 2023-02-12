abstract class UserService {
  void login() {}
  void register() {}
}

class UserServiceImpl implements UserService {
  @override
  void login() {
    // Trực tiếp xủ lý chi tiết call api login
  }

  @override
  void register() {}
}
