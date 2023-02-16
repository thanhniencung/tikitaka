import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends ConsumerWidget {
  final String email;
  final String password;
  const MyHomePage({super.key, required this.email, required this.password});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
              child: Text("W E L C O M E   T O   C O M E B A C K"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text(
                    'Hello',
                    style: TextStyle(
                        fontSize: 30,
                        color: Color.fromARGB(255, 39, 168, 233),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  email,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Logout'),
            ),
            Text("Your password is : $password"),
            ElevatedButton.icon(
              label: const Text('Đổi mật khẩu'),
              icon: const Icon(Icons.change_circle_sharp),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
