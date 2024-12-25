import 'package:flutter/material.dart';
import 'package:snapkart_project/cart/screen/cart_screen.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Snap kart',
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: 'Explore',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic)),
                    TextSpan(text: ' '),
                    TextSpan(
                        text: 'Plus',
                        style: TextStyle(
                            color: Colors.cyan,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic))
                  ])),
            ],
          ),

          const SizedBox(width: 25),

          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.4,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search for Products, Brands and More',
              ),
            ),
          ),

          const SizedBox(width: 25),

          SizedBox(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.2,
            child: const Row(
              children: [
                Icon(Icons.account_circle_outlined),
                SizedBox(width: 5),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Login To your Account',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart),
            ),
          ),

          const SizedBox(width: 10),

          const Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
