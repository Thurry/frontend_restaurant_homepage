import 'package:flutter/material.dart';
import 'thuury_restaurant/restaurant_background.dart';
import 'thuury_restaurant/restaurant_category.dart';
import 'thuury_restaurant/restaurant_infoBox.dart';
import 'thuury_restaurant/restaurant_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RestaurantHomePage(),
    );
  }
}

class RestaurantHomePage extends StatelessWidget {
  const RestaurantHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
      ),
      body: const Stack(
        children: [
          // Background Image
          BackgroundImage(),
          // Category Selection
          CategorySelection(),
          // Restaurant Info Box
          RestaurantInfoBox(),
          // Menu Items
          Positioned(
            left: 30,
            top: 600,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  MenuItem(
                    imageUrl: 'https://via.placeholder.com/150',
                    name: 'Item 1',
                    description: 'Delicious food item 1',
                    price: '\$10',
                  ),
                  MenuItem(
                    imageUrl: 'https://via.placeholder.com/150',
                    name: 'Item 2',
                    description: 'Delicious food item 2',
                    price: '\$20',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
