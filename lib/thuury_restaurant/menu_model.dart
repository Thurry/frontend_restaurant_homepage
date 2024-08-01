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
  int quantity = 0; // Default quantity

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 520.0,
            height: 180, // 컨테이너 높이 조절
            decoration: ShapeDecoration(
              color: const Color(0xFFEFF2F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.start, // 컨테이너의 내부 요소를 상단 정렬
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 2), // 상단 여백 추가
                        child: Image.network(widget.imageUrl,
                            width: 100, height: 100), // 이미지
                      ),
                      const SizedBox(width: 33), // 이미지
                      // 이미지와 텍스트 사이 간격
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
                            const SizedBox(height: 15), // 이름과 설명 사이 간격 증가
                            Text(
                              widget.description,
                              style: const TextStyle(
                                color: Color(0xFF302F3C),
                                fontSize: 14, // 폰트 크기 조정
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon:
                            const Icon(Icons.remove, color: Color(0xFFFF6838)),
                        onPressed: () {
                          if (quantity > 0 && quantity <= widget.maxQuantity) {
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
                        icon: const Icon(Icons.add, color: Color(0xFFFF6838)),
                        onPressed: () {
                          if (quantity >= 0 && quantity < widget.maxQuantity) {
                            setState(() {
                              quantity++;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10), // 하단 여백
        ],
      ),
    );
  }
}
// 하단 여백

List<MenuItem> menuItems = [
  const MenuItem(
    imageUrl: 'https://via.placeholder.com/150',
    name: 'Item 1',
    description: 'Description 1',
    price: '\$10',
    categoryId: 1,
  ),
  const MenuItem(
    imageUrl: 'https://via.placeholder.com/150',
    name: 'Item 2',
    description: 'Description 2',
    price: '\$20',
    categoryId: 2,
  ),
  const MenuItem(
    imageUrl: 'https://via.placeholder.com/150',
    name: 'Item 3',
    description: 'Description 2',
    price: '\$20',
    categoryId: 3,
  ),
  const MenuItem(
    imageUrl: 'https://via.placeholder.com/150',
    name: 'Item 4',
    description: 'Description 2',
    price: '\$20',
    categoryId: 1,
  ),
  const MenuItem(
    imageUrl: 'https://via.placeholder.com/150',
    name: 'Item 4',
    description: 'Description 2',
    price: '\$20',
    categoryId: 4,
  ),
];
