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
    // nextPage(BuildContext context) {
    //   Navigator.of(context).push(
    //     MaterialPageRoute(
    //       builder: (context) => MyHomePage(email: email, password: password),
    //     ),
    //   );
    // }

    void showSnackBar(BuildContext context, String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }

    signUpUser() async {
      final email = ref.read(emailProvider.notifier).state.trim();
      final password = ref.read(passwordProvider.notifier).state.trim();

      if (email.length < 6 || password.length < 6) {
        showSnackBar(
            context, 'Email and password should be at least 6 characters');
        return;
      }

      try {
        await loginController.signUpUser(
          context: context,
          email: email,
          password: password,
        );
      } catch (e) {
        showWarning(context);
      }
    }

    loginUser() async {
      final email = ref.read(emailProvider.notifier).state.trim();
      final password = ref.read(passwordProvider.notifier).state.trim();

      if (email.length < 6 || password.length < 6) {
        showSnackBar(
            context, 'Email and password should be at least 6 characters');
        return;
      }

      try {
        await loginController.loginUser(
          context: context,
          email: email,
          password: password,
        );
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
            child: const Text('signInUser'),
          ),
        ],
      ),
    );
  }
}
