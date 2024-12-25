import 'order_model.dart';

class OrdersList {
  List<Order> orders;

  OrdersList({required this.orders});

  factory OrdersList.fromJson(Map<String, dynamic> json) {
    return OrdersList(
      orders: (json['orders'] as List<dynamic>)
          .map((order) => Order.fromJson(order))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'orders': orders.map((order) => order.toJson()).toList(),
    };
  }
}
