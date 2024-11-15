import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Util {
  static void flutterToast(String message) {
    Fluttertoast.showToast(msg: message);
  }
}
