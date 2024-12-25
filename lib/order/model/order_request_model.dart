import 'package:snapkart_project/order/model/order_product_item_model.dart';
import 'package:snapkart_project/profile/model/shipping_address_model.dart';

class OrderRequest {
  List<OrderProductItem> items;
  ShippingAddress shippingAddress;

  OrderRequest({
    required this.items,
    required this.shippingAddress,
  });

  // Factory method to create an object from JSON
  factory OrderRequest.fromJson(Map<String, dynamic> json) {
    return OrderRequest(
      items: (json['items'] as List<dynamic>)
          .map((item) => OrderProductItem.fromJson(item))
          .toList(),
      shippingAddress: ShippingAddress.fromJson(json['shippingAddress']),
    );
  }

  // Method to convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'shippingAddress': shippingAddress.toJson(),
    };
  }
}