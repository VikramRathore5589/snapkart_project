import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:snapkart_project/cart/model/cart_model.dart';
import 'package:snapkart_project/cart/model/cart_response_model.dart';
import 'package:snapkart_project/core/api_endpoints_url.dart';
import 'package:snapkart_project/core/storage_helper/storage_helper_class.dart';

class CartApiService {
  Future<bool> addToCart(CartModel cartModel) async {
    String? token = await StorageHelper.getToken();
    String url = ApiUrl.addToCartUrl;
    Response response = await http
        .post(Uri.parse(url), body: jsonEncode(cartModel.toJson()), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'
    });
    if (response.statusCode == 201) {
      return true;
    }
    throw 'Something Went Wrong';
  }

  Future<CartResponse> fetchCartItems() async {
    String? token = await StorageHelper.getToken();
    String url = ApiUrl.fetchCartItemsUrl;
    Response response = await http.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy',
    });
    if (response.statusCode == 200) {
      String body = response.body;
      final decode = jsonDecode(body);
      return CartResponse.fromJson(decode);
    }
    if (response.statusCode == 404) {
      throw 'Cart is Empty! Please add Item to Cart';
    } else {
      String body = response.body;
      final decode = jsonDecode(body);
      String error =
          decode['message'] ?? 'Something went wrong Unable to fetch cart Item';
      throw error;
    }
  }

  Future<bool> updateCartQuantity(CartModel cartModel) async {
    String? token = await StorageHelper.getToken();
    String url = ApiUrl.updateCartUrl;
    Response response = await http
        .put(Uri.parse(url), body: jsonEncode(cartModel.toJson()), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'
    });
    if (response.statusCode == 200) {
      return true;
    }
    throw 'Something went Wrong and unable to updaate cart item Quantity';
  }

  Future<bool> deleteCartItem(String id) async {
    String? token = await StorageHelper.getToken();
    String url = "${ApiUrl.deleteCartItemUrl}$id";
    Response response = await http.delete(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
      'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'
    });
    if (response.statusCode == 200) {
      return true;
    }
    throw 'Something went wrong and unable to delete this cart Item';
  }

  Future<bool> clearCart() async {
    String? token = await StorageHelper.getToken();
    String url = ApiUrl.clearCartUrl;
    Response response = await http.delete(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
      'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'
    });
    if (response.statusCode == 200) {
      return true;
    }
    throw 'Something went wrong Unable to clear cart';
  }
}
