import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:snapkart_project/core/api_endpoints_url.dart';
import 'package:snapkart_project/core/storage_helper/storage_helper_class.dart';
import 'package:snapkart_project/order/model/order_request_model.dart';
import 'package:snapkart_project/order/model/order_response_model.dart';
import 'package:snapkart_project/order/model/order_status_model.dart';

class OrderApiService {
  Future<bool> placeOrder(OrderRequest orderRequest) async {
    String? token = await StorageHelper.getToken();
    String url = ApiUrl.placeOrderUrl;
    Response response = await http.post(
      Uri.parse(url),
      body: jsonEncode(
        orderRequest.toJson(),
      ),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'
      },
    );
    if (response.statusCode == 201) {
      return true;
    }
    throw 'Something went wrong to place order Api ';
  }

  Future<OrderResponse> fetchOrders() async {
    String? token = await StorageHelper.getToken();
    String url = ApiUrl.fetchOrders;
    Response response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'
      },
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      OrderResponse orderResponse = OrderResponse.fromJson(json);
      return orderResponse;
    }
    throw 'Unable to fetch Orders';
  }

  Future<bool> updateOrderStatus(
      ChangeOrderStatus changeOrderStatus) async {
    String? token = await StorageHelper.getToken();
    String url = "${ApiUrl.updateOrderStatusUrl(changeOrderStatus.orderId)}";
    Response response = await http
        .put(Uri.parse(url), body: jsonEncode(changeOrderStatus.toJson()), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      'x-api-key': 'aihfj--qwnkqwr--jlkqwnjqw--jnkqwjnqwy'
    });
    if (response.statusCode == 200) {
      return true;
    }
    throw 'Something went wrong to update order status';
  }
}
