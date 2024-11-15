import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/auth/provider/auth_provider.dart';
import 'package:snapkart_project/auth/screen/log_in_screen.dart';
import 'package:snapkart_project/auth/screen/sign_up_screen.dart';
import 'package:snapkart_project/auth/service/auth_service.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(authService),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LogInScreen(),
      ),
    );
  }
}
