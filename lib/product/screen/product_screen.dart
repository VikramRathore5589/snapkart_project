import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/core/app_util.dart';
import 'package:snapkart_project/product/model/product_model.dart';
import 'package:snapkart_project/product/provider/product_provider.dart';
import 'package:snapkart_project/product/screen/product_detail_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context,listen: false);
    productProvider.fetchProduct();

    return Scaffold(
      appBar: Util.appBar('Products'),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.productList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: provider.productList.length,
              itemBuilder: (context, index) {
                ProductModel product = provider.productList[index];
                return GestureDetector(
                  // onLongPress: () {
                  //   provider.deleteProduct(product.sId);
                  // },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(product: product),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 1,
                    child: ListTile(
                      leading: CircleAvatar(radius: 20,child: Text(product.stock.toString()),),
                      title: Text(product.name ?? 'No product name'),
                      subtitle: Text(" Rs.${product.price.toString()}"),
                      trailing: Text(product.discountAmount.toString(),style: TextStyle(fontSize: 15),),

                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
