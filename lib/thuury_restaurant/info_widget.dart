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
      textContent = "정보 없음";
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFFF6838), // 주황색 경계선
          width: 1.0, // 경계선 두께
        ),
        borderRadius: BorderRadius.circular(5), // 둥근 모서리
      ),
      padding: const EdgeInsets.all(8.0), // 내부 여백
      child: Row(
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
      ),
    );
  }
}
