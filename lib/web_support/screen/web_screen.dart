import 'package:flutter/material.dart';
import 'package:snapkart_project/product/screen/product_screen.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Snap kart',
      //     style: TextStyle(fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SingleChildScrollView(
               scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'Spick-Android',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: Text('Home')),
                  TextButton(onPressed: () {}, child: Text('Products')),
                  TextButton(onPressed: () {}, child: Text('Category')),
                  TextButton(onPressed: () {}, child: Text('Contact us')),
                  SizedBox(
                    width: 50,
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.shopping_cart_rounded)),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.account_circle_outlined)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
