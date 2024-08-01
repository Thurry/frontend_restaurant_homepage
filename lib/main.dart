import 'package:flutter/material.dart';
import 'package:thurry/thuury_restaurant/menulist_view.dart';
import 'thuury_restaurant/background.dart';
import 'thuury_restaurant/category_view.dart';
import 'thuury_restaurant/infobox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thurry Restaurant',
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
  int selectedCategoryId = 1; // Default selected category
  final GlobalKey<MenuListState> _menuListKey = GlobalKey<MenuListState>();

  // Callback for when a category is selected
  void onCategorySelected(int categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
    });
    _menuListKey.currentState?.scrollToCategory(categoryId);
  }

  // Callback for when the category changes due to scrolling
  void onCategoryChanged(int categoryId) {
    if (selectedCategoryId != categoryId) {
      setState(() {
        selectedCategoryId = categoryId;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          const BackgroundImage(),
          Column(
            children: [
              const SizedBox(height: 200),
              const RestaurantInfoBox(),
              CategoryView(
                onCategorySelected: onCategorySelected,
                selectedCategoryId: selectedCategoryId,
              ),
              Expanded(
                child: MenuList(
                  key: _menuListKey,
                  onCategoryChanged: onCategoryChanged,
                  selectedCategoryId: selectedCategoryId,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
