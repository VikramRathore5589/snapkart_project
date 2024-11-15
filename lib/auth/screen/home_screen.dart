import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String username;
  final String password;

  const HomeScreen({Key? key, required this.username, required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, $username!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Text(
              'Your password: $password',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
