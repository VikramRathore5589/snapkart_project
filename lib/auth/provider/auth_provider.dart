import 'package:flutter/foundation.dart';
import 'package:snapkart_project/core/app_util.dart';
import 'package:snapkart_project/auth/model/auth_model.dart';
import 'package:snapkart_project/auth/service/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  AuthService authService;
  // bool isAuthenticated=true;

  AuthProvider(this.authService);

  Future signUp(AuthModel authModel) async {
    try {
      bool success = await authService.signUp(authModel);
      notifyListeners();
      if (success) {
         Util.flutterToast('Account Created successfully');
      }
    } catch (e) {
      // return false;
      Util.flutterToast(e.toString());
    }
  }

  Future logIn(AuthModel authModel) async {
    try {
      String token = await authService.logIn(authModel);
      print('Token: $token');
      if(token.isNotEmpty){
        return Util.flutterToast('Account logged in successfully');
      }
      notifyListeners();
    } catch (e) {
      Util.flutterToast(e.toString());
    }
  }
}
