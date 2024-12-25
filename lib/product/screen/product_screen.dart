import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/cart/screen/cart_screen.dart';
import 'package:snapkart_project/category/screen/category_screen.dart';
import 'package:snapkart_project/core/app_util.dart';
import 'package:snapkart_project/product/model/product_model.dart';
import 'package:snapkart_project/product/provider/product_provider.dart';
import 'package:snapkart_project/product/screen/product_detail_screen.dart';
import 'package:snapkart_project/web/web_app_bar.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    productProvider.fetchProduct();

    return Scaffold(
      body: Consumer<ProductProvider>(builder: (context, provider, child) {
        return LayoutBuilder(builder: (context, constraint) {
          bool isWeb = constraint.maxWidth > 600;
          if (isWeb) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                children: [
                  const WebAppBar(),
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 250,
                          child: Drawer(
                            child: Column(
                              children: [
                                const DrawerHeader(child: Text('Profile')),
                                buildListTile(context, () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const CategoryScreen(),
                                    ),
                                  );
                                }, const Icon(Icons.category, size: 20),
                                    'Categories'),
                                buildListTile(context, () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CartScreen(),
                                    ),
                                  );
                                },
                                    const Icon(Icons.shopping_cart_rounded,
                                        size: 20),
                                    'Carts'),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GridView.builder(
                            itemCount: provider.productList.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 3,
                                    mainAxisSpacing: 3),
                            itemBuilder: (context, index) {
                              ProductModel productModel =
                                  provider.productList[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailScreen(
                                          product: productModel),
                                    ),
                                  );
                                },
                                child: Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              productModel.image ??
                                                  'https://via.placeholder.com/150',
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        productModel.name ?? 'No name found',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Price: ₹${productModel.price.toString()}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          productModel.description ??
                                              'No description',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Scaffold(
              appBar: Util.appBar('Products'),
              body: ListView.builder(
                itemCount: provider.productList.length,
                itemBuilder: (context, index) {
                  ProductModel pInfo = provider.productList[index];
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailScreen(product: pInfo),
                          ),
                        );
                      },
                      leading: Image.network(
                          pInfo.image ?? 'https://via.placeholder.com/150'),
                      title: Text(pInfo.name ?? 'No name found'),
                      subtitle: Text("₹${pInfo.price.toString()}"),
                      trailing: Column(
                        children: [
                          const Text('Stock'),
                          Text(pInfo.stock.toString()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        });
      }),
    );
  }

  ListTile buildListTile(BuildContext context, VoidCallback callback,
      Icon leadingIcon, String titleText) {
    return ListTile(
      onTap: () {
        callback();
      },
      leading: leadingIcon,
      title: Text(titleText),
      trailing: const Icon(
        Icons.arrow_forward_ios_sharp,
        size: 15,
      ),
    );
  }
}
