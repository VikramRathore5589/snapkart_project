import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Util {
  static void flutterToast(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static AppBar appBar( String name) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart, color: Colors.white),
          const SizedBox(width: 10),
           Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      centerTitle: true,
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            print("Search icon pressed");
          },
        ),
      ],
    );
  }
}
