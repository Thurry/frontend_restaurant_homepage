import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thurry/thuury_restaurant/model/cart_model.dart';

class MenuItem extends StatefulWidget {
  final String imageAssetPath; // 이미지 경로
  final String name;
  final String description;
  final double price;
  final int categoryId;
  final int maxQuantity;

  const MenuItem({
    required this.imageAssetPath, // 필수 매개변수로 변경
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
    final cart = Provider.of<CartModel>(context);

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
                    child: Image.asset(
                      widget.imageAssetPath, // 로컬 이미지 사용
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
                        // Display name and price together
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            // Price displayed next to name
                            Text(
                              '(\$${widget.price.toStringAsFixed(2)})',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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

              // Quantity adjustment and add to cart button section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Quantity adjustment buttons
                  Row(
                    children: [
                      IconButton(
                        icon:
                            const Icon(Icons.remove, color: Color(0xFFFF6838)),
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
                        icon: const Icon(Icons.add, color: Color(0xFFFF6838)),
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

                  // Add to cart button
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
                        // 장바구니에 항목 추가
                        cart.addItem(CartItem(
                          name: widget.name,
                          price: widget.price,
                          quantity: quantity,
                        ));

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
        ),
      ),
    );
  }
}

// 메뉴 아이템 목록
List<MenuItem> menuItems = [
  const MenuItem(
    imageAssetPath: 'assets/images/thurry_logo1.jpeg',
    name: '꽈배기',
    description: 'ㅈㄴ 맛있는 꽈배기 ㄹㅇ 나만 먹는다',
    price: 10.0,
    categoryId: 1,
  ),
  const MenuItem(
    imageAssetPath: 'assets/images/thurry_logo1.jpeg',
    name: '초코 케이크',
    description: '두바이 초콜릿보다 맛있진 않을듯',
    price: 20.0,
    categoryId: 2,
  ),
  const MenuItem(
    imageAssetPath: 'assets/images/thurry_logo1.jpeg',
    name: '아이스크림 케이크',
    description: '베스킨라빈스 떠리! 원!',
    price: 20.0,
    categoryId: 2,
  ),
  const MenuItem(
    imageAssetPath: 'assets/images/thurry_logo1.jpeg',
    name: '튜나 샌드위치',
    description: '고태우는 참치 알레르기가 있다',
    price: 20.0,
    categoryId: 3,
  ),
  const MenuItem(
    imageAssetPath: 'assets/images/thurry_logo1.jpeg',
    name: '베이컨 토스트',
    description: '베이컨 먹고 싶당..',
    price: 20.0,
    categoryId: 3,
  ),
  const MenuItem(
    imageAssetPath: 'assets/images/thurry_logo1.jpeg',
    name: '스콘',
    description: '스콘이 왜 스콘인지 아세요?',
    price: 20.0,
    categoryId: 4,
  ),
  const MenuItem(
    imageAssetPath: 'assets/images/thurry_logo1.jpeg',
    name: '쿠키',
    description: '태우가 만든 쿠키',
    price: 30.0,
    categoryId: 4,
  ),
];
