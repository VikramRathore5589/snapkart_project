import 'package:flutter/material.dart';
import 'package:snapkart_project/core/app_util.dart';
import 'package:snapkart_project/product/model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Util.appBar('Product Detail'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product.name ?? 'No Name',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                "Price: Rs. ${product.price?.toString() ?? 'No price'}",
                style: const TextStyle(fontSize: 18, color: Colors.green),
              ),
              const SizedBox(height: 16),
              Text(
                "Category: ${product.category ?? 'No Category'}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                "Description: ${product.description ?? 'No Description'}",
                style: const TextStyle(fontSize: 16),
              ),
              const Spacer(),
              Text(
                "Version: ${product.iV?.toString() ?? 'No IV'}",
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
