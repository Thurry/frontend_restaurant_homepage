import 'package:flutter/material.dart';

class RestaurantInfoBox extends StatelessWidget {
  const RestaurantInfoBox({super.key});

  //static const String boxIconUrl = "https://via.placeholder.com/27x26";
  static const String logoUrl =
      "https://via.placeholder.com/100"; // 원 안에 들어갈 로고 이미지 URL

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 정보 박스
          Positioned(
            top: 170, // 배경 이미지와 겹치게 위치 조정
            child: Container(
              width: 354,
              height: 200,
              decoration: ShapeDecoration(
                color: const Color(0xFFFAFAFA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20), // 원형 이미지와 텍스트 간격 조정
                  Text(
                    'Restaurant Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF302F3C),
                      fontSize: 28,
                      fontFamily: 'Playfair Display',
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(height: 20), // 텍스트와 아이템 간격 조정
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfoItem(
                        icon: null,
                        text: "🎁 8 Box",
                      ),
                      InfoItem(
                        icon: null,
                        text: "⏰ 8:00 PM",
                      ),
                      InfoItem(
                        icon: null,
                        text: "⭐️   4.8",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // 원형 이미지
          Positioned(
            top: 120, // 정보 박스와 겹치게 위치 조정
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(logoUrl), // 원형으로 표시할 이미지 URL
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoItem extends StatelessWidget {
  final String? icon;
  final String text;

  const InfoItem({this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) Image.network(icon!, width: 27, height: 26),
        const SizedBox(width: 5),
        Text(
          text,
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
