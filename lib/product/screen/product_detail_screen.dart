import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/cart/model/cart_model.dart';
import 'package:snapkart_project/cart/model/cart_response_model.dart';
import 'package:snapkart_project/cart/provider/cart_provider.dart';
import 'package:snapkart_project/cart/service/cart_api_service.dart';
import 'package:snapkart_project/core/app_util.dart';
import 'package:snapkart_project/core/ui_helper/ui_helper.dart';
import 'package:snapkart_project/product/model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

   ProductDetailScreen({super.key, required this.product});

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
                "Category: ${product.categoryId ?? 'No Category'}",
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                "Description: ${product.description ?? 'No Description'}",
                style: const TextStyle(fontSize: 16),
              ),Spacer(),ElevatedButton(onPressed: ()async{
                CartProvider cartProvider=Provider.of<CartProvider>(context,listen: false);
              CartModel cartModel=CartModel(productId: product.id??'', quantity: 1);
               await cartProvider.addToCart(cartModel);
              }, child: Text('Add to Cart'))

            ],
          ),
        ),
      ),
    );
  }
}
