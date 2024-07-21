import 'package:flutter/material.dart';

class CategorySelection extends StatelessWidget {
  const CategorySelection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      left: 30,
      top: 407,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CategoryItem(
            text: "인기",
            selected: true,
          ),
          CategoryItem(
            text: "샌드위치",
          ),
          CategoryItem(
            text: "샐러드",
          ),
          CategoryItem(
            text: "베이커리",
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String text;
  final bool selected;

  const CategoryItem({required this.text, this.selected = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: ShapeDecoration(
        color: selected ? const Color(0xFFFF6838) : const Color(0xFFFAFAFA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: selected
            ? const [
                BoxShadow(
                  color: Color(0x30FF6838),
                  blurRadius: 15,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                )
              ]
            : null,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: selected ? Colors.white : const Color(0xFF302F3C),
          fontSize: 13.50,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w800,
          height: 0,
        ),
      ),
    );
  }
}
