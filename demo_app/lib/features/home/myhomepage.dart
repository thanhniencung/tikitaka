import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../shared/widget/my_button.dart';
import '../../shared/widget/my_textfield.dart';
import '../login/login_controller.dart';

class MyHomePage extends ConsumerWidget {
  final String email;
  final String password;
  MyHomePage({super.key, required this.email, required this.password});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text("W E L C O M E   T O   C O M E B A C K"))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Logout'),
            ),
            Text("Your password is : " + password),
            ElevatedButton.icon(
              label: Text('Đổi mật khẩu'),
              icon: Icon(Icons.change_circle_sharp),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
