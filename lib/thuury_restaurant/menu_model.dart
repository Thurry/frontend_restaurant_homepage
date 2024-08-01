import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String price;
  final int categoryId;
  final int maxQuantity;

  const MenuItem({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    this.maxQuantity = 5,
    super.key,
  });

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  int quantity = 0; // 초기 수량

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 520.0,
        decoration: ShapeDecoration(
          color: const Color(0xFFEFF2F5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 2),
                    child: Image.network(
                      widget.imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover, // 이미지 비율 유지
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: const TextStyle(
                            color: Color(0xFF302F3C),
                            fontSize: 25,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8), // 이름과 설명 사이 간격 줄임
                        Text(
                          widget.description,
                          style: const TextStyle(
                            color: Color(0xFF302F3C),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12), // 텍스트와 버튼 사이의 여백 줄임
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove,
                                color: Color(0xFFFF6838)),
                            onPressed: () {
                              if (quantity > 0) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                          ),
                          Text(
                            '$quantity',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon:
                                const Icon(Icons.add, color: Color(0xFFFF6838)),
                            onPressed: () {
                              if (quantity < widget.maxQuantity) {
                                setState(() {
                                  quantity++;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10), // 수량 버튼과 장바구니 버튼 사이의 여백
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6838),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (quantity > 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${widget.name} ($quantity 개)가 장바구니에 추가되었습니다!',
                                  style: const TextStyle(
                                    color: Colors.black, // 텍스트 색상 변경
                                  ),
                                ),
                                backgroundColor:
                                    const Color(0xFFFFE4C4), // 연한 주황색 배경
                                duration: const Duration(seconds: 2),
                              ),
                            );
                            // 수량 초기화
                            setState(() {
                              quantity = 0;
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  '미쓰떠리하게도 아무것도 담지 않으셨어요',
                                  style: TextStyle(
                                    color: Colors.black, // 텍스트 색상 변경
                                  ),
                                ),
                                backgroundColor: Color(0xFFFFE4C4), // 연한 주황색 배경
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        child: const Text(
                          '장바구니 담기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 메뉴 아이템 목록
List<MenuItem> menuItems = [
  const MenuItem(
    imageUrl: 'https://via.placeholder.com/150',
    name: '아이템 1',
    description: '설명 1',
    price: '\$10',
    categoryId: 1,
  ),
  const MenuItem(
    imageUrl: 'https://via.placeholder.com/150',
    name: '아이템 2',
    description: '설명 2',
    price: '\$20',
    categoryId: 2,
  ),
  const MenuItem(
    imageUrl: 'https://via.placeholder.com/150',
    name: '아이템 3',
    description: '설명 3',
    price: '\$20',
    categoryId: 3,
  ),
  const MenuItem(
    imageUrl: 'https://via.placeholder.com/150',
    name: '아이템 4',
    description: '설명 4',
    price: '\$20',
    categoryId: 1,
  ),
  const MenuItem(
    imageUrl: 'https://via.placeholder.com/150',
    name: '아이템 5',
    description: '설명 5',
    price: '\$20',
    categoryId: 4,
  ),
  const MenuItem(
    imageUrl: 'https://via.placeholder.com/150',
    name: '아이템 6',
    description: '설명 6',
    price: '\$30',
    categoryId: 4,
  ),
];
