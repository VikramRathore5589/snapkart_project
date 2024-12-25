import 'package:flutter/material.dart';
import 'package:snapkart_project/order/model/order_product_item_model.dart';

class OrderDetailScreen extends StatelessWidget {
  final List<OrderProductItem> products;

  const OrderDetailScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Product Quantity
                  Text(
                    'Quantity: ${product.quantity}',
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 4),

                  // Product Price
                  Text(
                    'Price: ₹${product.price.toString()}',
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 4),

                  // Discount Amount
                  Text(
                    'Discount: ₹${product.discountAmount.toString()}',
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  const SizedBox(height: 4),

                  // Total Price
                  Text(
                    'Total Price: ₹${product.totalPrice}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
