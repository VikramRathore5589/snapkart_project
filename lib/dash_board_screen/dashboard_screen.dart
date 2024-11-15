import 'package:flutter/material.dart';
import 'package:snapkart_project/cart/screen/cart_screen.dart';
import 'package:snapkart_project/category/screen/category_screen.dart';
import 'package:snapkart_project/product/screen/product_screen.dart';
import 'package:snapkart_project/profile/screen/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    ProductScreen(),
    CategoryScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
          items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_outlined),
            label: 'Product'),
        BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined), label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined), label: 'Profile')
      ],onTap: (index){
          setState(() {
            currentIndex=index;

          });
      },),body: screens[currentIndex],
    );
  }
}
