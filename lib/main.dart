import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/auth/provider/auth_provider.dart';
import 'package:snapkart_project/auth/screen/log_in_screen.dart';
import 'package:snapkart_project/auth/service/auth_service.dart';
import 'package:snapkart_project/dash_board_screen/dashboard_screen.dart';
import 'package:snapkart_project/product/provider/product_provider.dart';
import 'package:snapkart_project/product/service/product_service.dart';

void main() {
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    // AuthService authService = AuthService();
    // ProductService productService=ProductService();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(AuthService()),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(ProductService()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DashboardScreen(),
      ),
    );
  }
}
