import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/product/model/product_model.dart';
import 'package:snapkart_project/product/provider/product_provider.dart';
import 'package:snapkart_project/product/screen/product_detail_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    productProvider.fetchProduct();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Product Screen')),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
              itemCount: provider.productList.length,
              itemBuilder: (context, index) {
                ProductModel product = provider.productList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(product: product),
                        ));
                  },
                  child: Card(
                    elevation: 1,
                    child: ListTile(
                      title: Text(product.name ?? 'No product name'),
                      subtitle: Text(" Rs.${product.price.toString()}"),
                      trailing: Text(product.description ?? 'No category'),
                      // leading: Text(product.iV.toString()),
                      leading: Image.network(product.image??''),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
