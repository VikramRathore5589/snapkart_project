import 'package:snapkart_project/order/model/order_product_item_model.dart';
import 'package:snapkart_project/profile/model/shipping_address_model.dart';

class Order {
  ShippingAddress shippingAddress;
  String id;
  String orderNumber;
  String user;
  List<OrderProductItem> items;
  String orderStatus;
  DateTime createdAt;
  DateTime updatedAt;
  int version;

  Order({
    required this.shippingAddress,
    required this.id,
    required this.orderNumber,
    required this.user,
    required this.items,
    required this.orderStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      shippingAddress: ShippingAddress.fromJson(json['shippingAddress']),
      id: json['_id'],
      orderNumber: json['orderNumber'],
      user: json['user'],
      items: (json['items'] as List<dynamic>)
          .map((item) => OrderProductItem.fromJson(item))
          .toList(),
      orderStatus: json['orderStatus'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shippingAddress': shippingAddress.toJson(),
      '_id': id,
      'orderNumber': orderNumber,
      'user': user,
      'items': items.map((item) => item.toJson()).toList(),
      'orderStatus': orderStatus,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': version,
    };
  }
}
