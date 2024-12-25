import 'package:flutter/material.dart';
import 'package:snapkart_project/core/app_util.dart';
import 'package:snapkart_project/order/model/order_model.dart';
import 'package:snapkart_project/order/model/order_request_model.dart';
import 'package:snapkart_project/order/model/order_response_model.dart';
import 'package:snapkart_project/order/model/order_status_model.dart';
import 'package:snapkart_project/order/service/order_api_service.dart';

class OrderProvider extends ChangeNotifier {
  OrderProvider(this.orderApiService);

  List<Order> orderList = [];

  OrderApiService orderApiService;
  bool isLoading = false;
  String? errorMsg;

  Future placeOrder(OrderRequest orderRequest) async {
    try {
      errorMsg = null;
      isLoading = true;
      bool isSuccess = await orderApiService.placeOrder(orderRequest);
      if (isSuccess) {
        Util.flutterToast('Place order successfully');
        notifyListeners();
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      errorMsg = e.toString();
      Util.flutterToast(errorMsg!);
    }
    notifyListeners();
  }

  Future fetchOrders() async {
    try {
      errorMsg = null;
      isLoading = true;
      OrderResponse orderResponse = await orderApiService.fetchOrders();
      orderList = orderResponse.orders ?? [];
      notifyListeners();
      isLoading = false;
    } catch (e) {
      isLoading = false;
      errorMsg = e.toString();
      Util.flutterToast(errorMsg!);
    }
    notifyListeners();
  }

  Future updateOrderStatus(ChangeOrderStatus changeOrderStatus, ) async {
    try {
      errorMsg = null;
      isLoading = true;
      bool isSuccess =
          await orderApiService.updateOrderStatus(changeOrderStatus);
      notifyListeners();
      if (isSuccess) {
        Util.flutterToast('Order Status Updated successfully');
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      errorMsg = e.toString();
      Util.flutterToast(errorMsg!);
    }
    notifyListeners();
  }
}
