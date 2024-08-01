import 'package:flutter/material.dart';

class MenuItem extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String price;
  final int categoryId;

  const MenuItem({
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
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
            width: 167.17,
            height: 250,
            decoration: ShapeDecoration(
              color: const Color(0xFFEFF2F5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.network(widget.imageUrl, width: 153, height: 126),
                const SizedBox(height: 8),
                Text(
                  widget.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF302F3C),
                    fontSize: 18,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF302F3C),
                    fontSize: 7.60,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, color: Color(0xFFFF6838)),
                      onPressed: () {
                        if (quantity > 0) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                    ),
                    Text(
                      widget.price,
                      style: const TextStyle(
                        color: Color(0xFFFF6838),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Color(0xFFFF6838)),
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
        ],
      ),
    );
  }
}

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
];
