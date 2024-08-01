import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String? icon;
  final int? box;
  final double? review;
  final int? hour;
  final int? minute;

  // 생성자
  const InfoItem({
    this.icon,
    this.box,
    this.review,
    this.hour,
    this.minute,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String textContent = '';

    if (box != null) {
      textContent = "🎁 $box Box";
    } else if (review != null) {
      textContent = "⭐️ ${review!.toStringAsFixed(2)}";
    } else if (hour != null && minute != null) {
      textContent =
          "⏰ ${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
    } else {
      textContent = "No Data Available";
    }

    return Row(
      children: [
        if (icon != null) Image.network(icon!, width: 27, height: 26),
        const SizedBox(width: 5),
        Text(
          textContent,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xFF302F3C),
            fontSize: 13.50,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
