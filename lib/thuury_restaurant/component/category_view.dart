import 'package:flutter/material.dart';
import '../model/category_model.dart';

class CategoryView extends StatelessWidget {
  final Function(int) onCategorySelected;
  final int selectedCategoryId;

  const CategoryView({
    required this.onCategorySelected,
    required this.selectedCategoryId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category.id == selectedCategoryId;

          // Define different colors for selected and non-selected states
          final backgroundColor = isSelected ? Colors.orange : Colors.white;
          final textColor = isSelected ? Colors.white : Colors.black;

          return GestureDetector(
            onTap: () {
              onCategorySelected(category.id);
            },
            child: Container(
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: backgroundColor, // Use the color based on selection
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  category.name,
                  style: TextStyle(
                    color: textColor, // Use the text color based on selection
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
