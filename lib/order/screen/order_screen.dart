import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/order/provider/order_provider.dart';
import 'package:snapkart_project/order/screen/order_detail_screen.dart';
import 'package:snapkart_project/profile/model/shipping_address_model.dart';

import '../model/string_order_status_model.dart';
import '../widget/order_card_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future fetchOrders() async {
    OrderProvider orderProvider =
    Provider.of<OrderProvider>(context, listen: false);
    await orderProvider.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Consumer<OrderProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.orderList.length,
            itemBuilder: (context, index) {
              final order = provider.orderList[index];
              return OrderCard(order: order);
            },
          );
        },
      ),
    );
  }
}

