import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/auth/provider/auth_provider.dart';
import 'package:snapkart_project/auth/service/auth_service.dart';
import 'package:snapkart_project/cart/provider/cart_provider.dart';
import 'package:snapkart_project/cart/service/cart_api_service.dart';
import 'package:snapkart_project/category/provider/category_provider.dart';
import 'package:snapkart_project/order/provider/order_provider.dart';
import 'package:snapkart_project/order/service/order_api_service.dart';
import 'package:snapkart_project/product/provider/product_provider.dart';
import 'package:snapkart_project/product/service/product_service.dart';
import 'package:snapkart_project/splash/provider/splash_provider.dart';
import 'package:snapkart_project/splash/screen/splash_screen.dart';
import 'package:snapkart_project/welcome_screen/welcome_screen.dart';

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
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(CartApiService()),
        ),
        ChangeNotifierProvider(
          create: (context) => SplashProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(OrderApiService()),
        )
      ],
      child:
          MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}
