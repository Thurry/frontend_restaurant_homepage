import 'package:flutter/material.dart';
import 'menu_model.dart';

class MenuList extends StatelessWidget {
  final int selectedCategoryId;

  const MenuList({required this.selectedCategoryId, super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuItem> filteredItems = menuItems
        .where((item) => item.categoryId == selectedCategoryId)
        .toList();

    return Positioned(
      top: 430,
      left: 20,
      right: 20,
      bottom: 20,
      child: Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: filteredItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: filteredItems[index],
            );
          },
        ),
      ),
    );
  }
}
