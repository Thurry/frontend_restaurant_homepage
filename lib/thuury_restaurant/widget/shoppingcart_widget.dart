import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thurry/thuury_restaurant/model/cart_model.dart'; // CartModel import
import 'package:thurry/screens/cart_screen.dart'; // CartScreen import

class Shoppingcart extends StatelessWidget {
  const Shoppingcart({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CartScreen()),
        );
      },
      child: Column(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: ShapeDecoration(
              color: const Color(0xFFFAFAFA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19),
              ),
            ),
            child: Stack(
              children: [
                // Main icon
                const Center(
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.orange,
                    size: 35,
                  ),
                ),
                // Badge for item count
                Positioned(
                  right: -1,
                  top: 0,
                  child: Container(
                    width: 23, // Circle width
                    height: 20, // Circle height
                    decoration: const BoxDecoration(
                      color: Colors.red, // Circle color
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${cart.totalItems}', // Number of items
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
