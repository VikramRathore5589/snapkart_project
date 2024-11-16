import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:snapkart_project/category/model/category_model.dart';
import 'package:snapkart_project/core/api_endpoints_url.dart';

class CategoryService {
  Future<List<CategoryModel>> getAllCategory() async {
    String url = ApiUrl.getCategoryUrl;
    Response response = await http.get(Uri.parse(url),
        headers: {'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'});
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(
        response.body,
      );
      final finalResult = result.map((e) => CategoryModel.fromJson(e)).toList();
      return finalResult;
    } else {
      throw 'Something went wrong';
    }
  }
}
