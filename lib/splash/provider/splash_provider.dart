import 'package:flutter/cupertino.dart';
import 'package:snapkart_project/core/storage_helper/storage_helper_class.dart';

class SplashProvider extends ChangeNotifier {


  Future<bool> checkLoggedIn() async {
    bool isLoggedIn = false;
    String? token = await StorageHelper.getToken();
    if (token != null) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
    return isLoggedIn;
  }
}
