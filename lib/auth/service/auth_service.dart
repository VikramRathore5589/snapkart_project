import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:snapkart_project/core/api_endpoints_url.dart';
import 'package:snapkart_project/auth/model/auth_model.dart';

class AuthService {
  Future<bool> signUp(AuthModel authModel) async {
    String url = ApiUrl.signUpUrl;
    final encode = jsonEncode(authModel.toJson());
    // print(encode);
    Response response = await http.post(Uri.parse(url),
        body: encode, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      // print('Sign up successful: ${response.body}');
      return true;
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<String> logIn(AuthModel authModel) async {
    String url = ApiUrl.loginUrl;
    final encode = jsonEncode(authModel.toJson());
    Response response = await http.post(Uri.parse(url),
        body: encode, headers: {'Content-Type': 'application/json'});
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      // print('Sign up successful: ${response.body}');
      String data = response.body;
      final map = jsonDecode(data);
      String token = map['token'];
      return token;
    } else {
      throw Exception('Something went wrong');
    }
  }
}
