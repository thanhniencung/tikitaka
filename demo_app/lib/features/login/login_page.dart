import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../repository/user/user_repository.dart';
import '../../repository/user/user_service.dart';
import 'login_controller.dart';

final userServiceImpl = UserServiceImpl();
final userRepositoryImpl = UserRepositoryImpl(userServiceImpl: userServiceImpl);
final loginProvider = Provider(
  (ref) => LoginController(
    userRepositoryImpl: userRepositoryImpl,
  ),
);

class LoginPage extends ConsumerWidget {
  final tecEmail = TextEditingController();
  final tecPass = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginController controller = ref.watch(loginProvider);

    handleClickRegisterButton() async {
      controller.handleLogin(
        email: tecEmail.text,
        password: tecPass.text,
      );
    }

    handleClickLoginButton() async {
      controller.handleLogin(
        email: tecEmail.text,
        password: tecPass.text,
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: tecEmail,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                TextField(
                  controller: tecEmail,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: handleClickRegisterButton,
            child: const Text('signUpUser'),
          ),
          ElevatedButton(
            onPressed: handleClickLoginButton,
            child: const Text('signInUser'),
          ),
        ],
      ),
    );
  }
}
