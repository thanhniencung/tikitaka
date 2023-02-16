import 'package:demo_app/features/home/myhomepage.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'login_controller.dart';

final loginControllerProvider =
    ChangeNotifierProvider((ref) => LoginControllerImpl());
final emailProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  bool validatePassword(String password) {
    if (password.isEmpty || password.length < 6) {
      return false;
    }
    return true;
  }

  showWarning(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (context) {
        return AlertDialog(
          title: const Text('Warning'),
          content: const Text('Incorrect username or password!!!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.read(emailProvider.notifier).state.trim();
    final password = ref.read(passwordProvider.notifier).state.trim();
    final loginController = ref.watch(loginControllerProvider);
    nextPage(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MyHomePage(email: email, password: password),
        ),
      );
    }

    signUpUser() async {
      try {
        await loginController.signUpUser(
            context: context, email: email, password: password);
      } catch (e) {
        showWarning(context);
      }
    }
    loginUser() async {
      try {
        await loginController.loginUser(
            context: context, email: email, password: password);
      } catch (e) {
        showWarning(context);
      }
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              onChanged: (value) =>
                  ref.read(emailProvider.notifier).state = value,
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
                  onChanged: (value) =>
                      ref.read(passwordProvider.notifier).state = value,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: signUpUser,
            child: const Text('signUpUser'),
          ),
          ElevatedButton(
            onPressed: loginUser,
            child: const Text('signUpUser'),
          ),
        ],
      ),
    );
  }
}
