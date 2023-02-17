abstract class ProductService {
  void login() {}
  void register() {}
}

class ProductServiceImpl implements ProductService {
  @override
  void login() {
    // Trực tiếp xủ lý chi tiết call api login
  }

  @override
  void register() {}
}
