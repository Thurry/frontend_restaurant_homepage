import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  Widget buildClassCard(BuildContext context, String className,
      String description, String route) {
    return Container(
      width: double.infinity, // 버튼을 가로로 꽉 채우기
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3), // 그림자 위치 조정
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    className,
                    style: const TextStyle(
                      fontFamily: 'Pretendard',
                      color: Colors.black, // 텍스트 검은색
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: <Color>[
                          Colors.red,
                          Color.fromARGB(255, 255, 136, 0)
                        ],
                      ).createShader(bounds);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    description,
                    style: const TextStyle(
                      fontFamily: 'Pretendard',
                      color: Colors.grey, // 작은 회색 글씨
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "어떤 목적으로 떠리를 사용하시나요?",
          style: TextStyle(
              fontFamily: 'Pretendard',
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Color.fromARGB(255, 255, 136, 0)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // 전체 패딩 추가
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildClassCard(context, '일반 이용자', '저렴하게 구매하고 싶어요', '/map'),
            const SizedBox(height: 28),
            buildClassCard(
                context, '가게 사용자', '남은 음식을 판매하고 싶어요', '/storeregister'),
          ],
        ),
      ),
    );
  }
}
