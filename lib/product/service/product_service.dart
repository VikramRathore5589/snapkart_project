import 'dart:convert';

import 'package:http/http.dart';
import 'package:snapkart_project/core/api_endpoints_url.dart';
import 'package:snapkart_project/product/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<ProductModel>> fetchProduct() async {
    String url = ApiUrl.fetchProductUrl;
    Response response = await http.get(Uri.parse(url),
        headers: {'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'});
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.body);
      final finalResult=result.map((e)=> ProductModel.fromJson(e)).toList();
      return finalResult;
      // List<ProductModel> productList = [];
      // for (int item = 0; item < result.length; item++) {
      //   final map = result[item];
      //   ProductModel productModel = ProductModel.fromJson(map);
      //   productList.add(productModel);
      // }

    } else {
      throw 'Unable to fetch product';
    }
  }
}
