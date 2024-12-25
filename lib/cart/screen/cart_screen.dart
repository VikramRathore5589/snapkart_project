import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/cart/model/cart_item_model.dart';
import 'package:snapkart_project/cart/model/cart_model.dart';
import 'package:snapkart_project/cart/provider/cart_provider.dart';
import 'package:snapkart_project/order/model/order_request_model.dart';
import 'package:snapkart_project/order/model/order_product_item_model.dart';
import 'package:snapkart_project/order/provider/order_provider.dart';
import 'package:snapkart_project/order/screen/add_shipping_addree_screen.dart';
import 'package:snapkart_project/order/screen/order_screen.dart';
import 'package:snapkart_project/product/model/product_model.dart';
import 'package:snapkart_project/profile/model/shipping_address_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();

    fetchCartItems();
  }

  Future fetchCartItems() async {
    CartProvider cartProvider =
        Provider.of<CartProvider>(context, listen: false);
    await cartProvider.fetchCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderScreen(),
                    ));
              },
              child: Text('View Order'))
        ],
        centerTitle: true,
      ),
      body: Consumer<CartProvider>(builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return LayoutBuilder(builder: (context, constraint) {
            bool isWeb = constraint.maxWidth > 600;
            if (isWeb) {
              return
                Column(
                  children: [
                    ListView.builder(shrinkWrap: true,
                        itemCount: provider.cartResponse!.items!.length,
                        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //     crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          CartItems cartItems =
                              provider.cartResponse!.items![index];
                          return Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      leading: ClipOval(
                                        child: Image.network(
                                          cartItems.product!.image ??
                                              'https://via.placeholder.com/150',
                                          height: 50,
                                          width: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: Text(cartItems.product!.name ?? ''),
                                      subtitle:
                                          Text(cartItems.product!.stock.toString()),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            int qty = cartItems.quantity ?? 0;
                                            qty--;
                                            cartItems.quantity = qty;

                                            provider.updateCartQuantity(CartModel(
                                                productId:
                                                    cartItems.product!.id ?? '',
                                                quantity: qty));
                                          },
                                          icon: const Icon(Icons.remove)),
                                      Text(cartItems.quantity.toString()),
                                      IconButton(
                                          onPressed: () {
                                            int qty = cartItems.quantity ?? 0;
                                            qty++;
                                            cartItems.quantity = qty;
                                            provider.updateCartQuantity(CartModel(
                                                productId:
                                                    cartItems.product!.id ?? '',
                                                quantity: qty));
                                          },
                                          icon: const Icon(Icons.add)),
                                    ],
                                  ),

                                ],
                              )
                          );
                        }),Spacer(), ElevatedButton(
                        onPressed: () async{
                          await placeOrder(context, provider);
                        }, child: Text('Place Order'))
                  ],
                );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Subtotal:${provider.cartResponse?.subtotal?.toString()}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Total Discount: ${provider.cartResponse?.totalDiscount?.toString()}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.cartResponse?.items?.length ?? 0,
                      itemBuilder: (context, index) {
                        CartItems cartItems =
                            provider.cartResponse!.items![index];
                        return GestureDetector(
                          onLongPress: () {
                            CartProvider cartProvider =
                                Provider.of<CartProvider>(context,
                                    listen: false);
                            cartProvider
                                .deleteCartItem(cartItems.product?.id ?? '');
                          },
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      child: Text(
                                          cartItems.product!.stock.toString()),
                                      radius: 25,
                                    ),
                                    title: Text(
                                      ' ${cartItems.product?.name?.toString() ?? '0.0'}',
                                    ),
                                    subtitle: Text(
                                      'Discount:${cartItems.product?.discountAmount?.toString() ?? '0.0'}',
                                    ),
                                    trailing: Text(
                                      'Stock: ${cartItems.product?.price?.toString() ?? '0'}',
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            int qty = cartItems.quantity ?? 0;
                                            qty--;
                                            cartItems.quantity = qty;

                                            provider.updateCartQuantity(
                                                CartModel(
                                                    productId:
                                                        cartItems.product!.id ??
                                                            '',
                                                    quantity: qty));
                                          },
                                          icon: const Icon(Icons.remove)),
                                      Text(cartItems.quantity.toString()),
                                      IconButton(
                                          onPressed: () {
                                            int qty = cartItems.quantity ?? 0;
                                            qty++;
                                            cartItems.quantity = qty;
                                            provider.updateCartQuantity(
                                                CartModel(
                                                    productId:
                                                        cartItems.product!.id ??
                                                            '',
                                                    quantity: qty));
                                          },
                                          icon: const Icon(Icons.add)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await placeOrder(context, provider);
                      },
                      child: const Text('Place Order'))
                ],
              );
            }
          });
        }
      }),
    );
  }

  Future<void> placeOrder(BuildContext context, CartProvider provider) async {
    ShippingAddress? shippingAddress =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddShippingAddressScreen();
    }));
    if (shippingAddress != null) {
      List<CartItems> cartItems = provider.cartResponse!.items ?? [];
      List<OrderProductItem> orderProductItemList = [];
      for (int i = 0; i < cartItems.length; i++) {
        CartItems cartItem = cartItems[i];
        ProductModel? productModel = cartItem.product;
        if (productModel != null) {
          OrderProductItem orderProductItem = OrderProductItem(
              product: productModel.id!,
              name: productModel.name ?? '',
              quantity: cartItem.quantity ?? 0,
              price: productModel.price,
              discountAmount: productModel.discountAmount ?? 0,
              totalPrice: provider.cartResponse!.subtotal ?? 0);
          orderProductItemList.add(orderProductItem);
        }
      }

      OrderRequest orderRequest = OrderRequest(
          items: orderProductItemList, shippingAddress: shippingAddress);
      if (context.mounted) {
        OrderProvider orderProvider =
            Provider.of<OrderProvider>(context, listen: false);
        await orderProvider.placeOrder(orderRequest);
        if (orderProvider.errorMsg == null) {
          provider.clearCart();
          provider.fetchCartItems();
        }
      }
    }
  }
}
