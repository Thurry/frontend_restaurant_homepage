import 'package:flutter/material.dart';
import 'package:thurry/thuury_restaurant/component/menulist_view.dart';
import 'thuury_restaurant/component/background.dart';
import 'thuury_restaurant/component/category_view.dart';
import 'thuury_restaurant/component/infobox.dart';
import 'thuury_restaurant/widget/shoppingcart_widget.dart';
import 'thuury_restaurant/widget/back_widget.dart';

class RestaurantHome extends StatefulWidget {
  const RestaurantHome({super.key});

  @override
  _RestaurantHomeState createState() => _RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHome> {
  int selectedCategoryId = 1; // Default selected category
  final GlobalKey<MenuListState> _menuListKey = GlobalKey<MenuListState>();

  // Callback for when a category is selected
  void onCategorySelected(int categoryId) {
    setState(() {
      selectedCategoryId = categoryId;
    });
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
          const Positioned(
            right: 20,
            top: 50,
            child: Shoppingcart(),
          ),
          const Positioned(
            left: 20,
            top: 50,
            child: BackWidget(),
          ),
        ],
      ),
    );
  }
}
