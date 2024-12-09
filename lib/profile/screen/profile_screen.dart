import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/auth/provider/auth_provider.dart';
import 'package:snapkart_project/auth/screen/log_in_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Profile Screen')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: IconButton(
                  onPressed: () {
                    AuthProvider authProvider =
                        Provider.of<AuthProvider>(context, listen: false);
                    authProvider.logOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogInScreen(),
                        ));
                  },
                  icon: const Icon(Icons.logout)))
        ],
      ),
    );
  }
}
