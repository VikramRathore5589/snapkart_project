import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/auth/provider/auth_provider.dart';
import 'package:snapkart_project/auth/screen/log_in_screen.dart';
import 'package:snapkart_project/auth/screen/sign_up_screen.dart';
import 'package:snapkart_project/auth/service/auth_service.dart';
import 'package:snapkart_project/category/provider/category_provider.dart';
import 'package:snapkart_project/category/screen/category_screen.dart';
import 'package:snapkart_project/dash_board_screen/dashboard_screen.dart';
import 'package:snapkart_project/product/provider/product_provider.dart';
import 'package:snapkart_project/product/service/product_service.dart';

import 'category/service/category_service.dart';

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
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(CategoryService()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DashboardScreen(),
      ),
    );
  }
}
