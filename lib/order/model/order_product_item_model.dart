// ShippingAddress Model

import 'package:snapkart_project/profile/model/shipping_address_model.dart';

class OrderProductItem {
  String product;
  String name;
  int quantity;
  num? price;
  num discountAmount;
  int totalPrice;
  String? id;

  OrderProductItem({
    required this.product,
    required this.name,
    required this.quantity,
    required this.price,
    required this.discountAmount,
    required this.totalPrice,
     this.id,
  });

  factory OrderProductItem.fromJson(Map<String, dynamic> json) {
    return OrderProductItem(
      product: json['product'],
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'] as num,
      discountAmount: json['discountAmount'] as num,
      totalPrice: json['totalPrice'],
      id: json['_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'name': name,
      'quantity': quantity,
      'price': price,
      'discountAmount': discountAmount,
      'totalPrice': totalPrice,
      '_id': id,
    };
  }
}

// Order Model
