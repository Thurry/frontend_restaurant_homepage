import 'package:flutter/material.dart';
import 'package:thurry/thuury_restaurant/menulist_view.dart';
import 'thuury_restaurant/background.dart';
import 'thuury_restaurant/category_view.dart';
import 'thuury_restaurant/infobox.dart';
import 'thuury_restaurant/shoppingcart_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thurry_RestaurantPage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RestaurantHomePage(),
    );
  }
}

class RestaurantHomePage extends StatefulWidget {
  const RestaurantHomePage({super.key});

  @override
  _RestaurantHomePageState createState() => _RestaurantHomePageState();
}

class _RestaurantHomePageState extends State<RestaurantHomePage> {
  int selectedCategoryId = 1;

  void onCategorySelected(int categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Shoppingcart(),
          // Background Image
          const BackgroundImage(),
          // Category Selection
          CategoryView(onCategorySelected: onCategorySelected),
          // Restaurant Info Box
          const RestaurantInfoBox(),
          // Menu Items
          MenuList(selectedCategoryId: selectedCategoryId),
        ],
      ),
    );
  }
}
