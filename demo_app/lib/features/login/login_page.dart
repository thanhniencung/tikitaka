import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../repository/user/user_repository.dart';
import '../../repository/user/user_service.dart';
import '../home/myhomepage.dart';
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

    Future<void> handleClickRegisterButton() async {
      String email = tecEmail.text;
      String password = tecPass.text;

      // Call handleRegister function in the controller with email and password parameters
      Future<bool> isValid =
          controller.handleRegister(email: email, password: password);

      // Check the result of the validation and display it on the screen
      if (await isValid) {
        Fluttertoast.showToast(
          msg: "Registration successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        // Navigate to a new page or perform some other action upon successful validation
      } else {
        Fluttertoast.showToast(
          msg: "Email and password must be at least 6 characters long.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    }

    handleClickLoginButton() async {
      String email = tecEmail.text;
      String password = tecPass.text;

      // Call handleRegister function in the controller with email and password parameters
      Future<bool> isValid =
          controller.handleLogin(email: email, password: password);

      // Check the result of the validation and display it on the screen
      if (await isValid) {
        Fluttertoast.showToast(
          msg: "Login successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(email: email, password: password),
          ),
        );
        // Navigate to a new page or perform some other action upon successful validation
      } else {
        Fluttertoast.showToast(
          msg: "Email and password must be at least 6 characters long.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
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
                  controller: tecPass,
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
            child: const Text('Register'),
          ),
          ElevatedButton(
            onPressed: handleClickLoginButton,
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
