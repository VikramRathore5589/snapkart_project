import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snapkart_project/core/app_util.dart';
import 'package:snapkart_project/order/model/order_model.dart';
import 'package:snapkart_project/order/model/order_status_model.dart';
import 'package:snapkart_project/order/provider/order_provider.dart';
import 'package:snapkart_project/order/screen/order_detail_screen.dart';

import '../../profile/model/shipping_address_model.dart';
import '../model/string_order_status_model.dart';

class OrderCard extends StatefulWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  String? selectedOrderStatus;

  @override
  void initState() {
    super.initState();

    selectedOrderStatus = widget.order.orderStatus;
  }

  String formatShippingAddress(ShippingAddress address) {
    return 'Street:\n${address.street}\n'
        'City:\n${address.city}\n'
        'State:\n${address.state}\n '
        'Postal Code:\n${address.postalCode}\n'
        'Country:\n${address.country}\n';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Status:',
                  style: TextStyle(fontSize: 16),
                ),
                DropdownButton(
                  value: selectedOrderStatus,
                  items: orderStatusList.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (value) async {
                    try {
                      OrderProvider orderProvider =
                          Provider.of<OrderProvider>(context, listen: false);
                      await orderProvider.updateOrderStatus(
                        ChangeOrderStatus(
                          orderId: widget.order.orderNumber,
                          orderStatus: value!,
                        ),
                      );

                      setState(() {
                        selectedOrderStatus = value;
                      });
                    } catch (error) {
                      Util.flutterToast(error.toString());
                    }
                  },
                ),
              ],
            ),
            Text(
              'Order Number: ${widget.order.orderNumber}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'User: ${widget.order.user}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.blue,
                      ),
                      Text(
                        'Shipping Address:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    formatShippingAddress(widget.order.shippingAddress),
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Date: ${widget.order.createdAt.toString()}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OrderDetailScreen(products: widget.order.items),
                  ),
                );
              },
              child: const Text('View detail'),
            ),
          ],
        ),
      ),
    );
  }
}
