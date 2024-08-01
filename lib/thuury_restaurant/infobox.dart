import 'package:flutter/material.dart';
import 'package:thurry/thuury_restaurant/info_widget.dart';

class RestaurantInfoBox extends StatelessWidget {
  const RestaurantInfoBox({super.key});

  //static const String boxIconUrl = "https://via.placeholder.com/27x26";
  static const String logoUrl =
      "https://via.placeholder.com/100"; // 원 안에 들어갈 로고 이미지 URL

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '박근원의 심야식당',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'ESC 오늘의 메뉴는?',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InfoItem(
                icon: null,
                box: 8,
              ),
              InfoItem(
                icon: null,
                hour: 8,
                minute: 00,
              ),
              InfoItem(
                icon: null,
                review: 4.856,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
