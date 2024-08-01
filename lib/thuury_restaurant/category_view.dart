import 'package:flutter/material.dart';
import 'category_model.dart';

class CategoryView extends StatefulWidget {
  final Function(int) onCategorySelected;

  const CategoryView({required this.onCategorySelected, super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 390),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.onCategorySelected(categoryData[index].id);
                  for (int i = 0; i < categoryData.length; i++) {
                    categoryData[i].active = (i == selectedIndex);
                  }
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: categoryData[index].active
                      ? const Color(0xFFFF6838)
                      : const Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: categoryData[index].active
                      ? [
                          const BoxShadow(
                            color: Color(0x30FF6838),
                            blurRadius: 15,
                            offset: Offset(0, 3),
                            spreadRadius: 0,
                          )
                        ]
                      : [],
                ),
                child: Text(
                  categoryData[index].name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: categoryData[index].active
                        ? Colors.white
                        : const Color(0xFF302F3C),
                    fontSize: 13.50,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
