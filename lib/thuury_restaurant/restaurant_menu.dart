import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String price;

  const MenuItem({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 167.17,
      height: 240,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: ShapeDecoration(
        color: const Color(0xFFEFF2F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(imageUrl, width: 153, height: 126),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF302F3C),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w800,
              height: 0,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF302F3C),
              fontSize: 7.60,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            price,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFFF6838),
              fontSize: 18,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w800,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
