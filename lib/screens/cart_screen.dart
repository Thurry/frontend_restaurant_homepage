import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thurry/thuury_restaurant/model/cart_model.dart';
import 'reservation_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '장바구니',
          style: TextStyle(
              fontFamily: 'Pretendard',
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final item = cart.items[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  '\$${item.price.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  if (item.quantity > 1) {
                                    cart.updateItemQuantity(
                                        item, item.quantity - 1);
                                  } else {
                                    cart.removeItem(item);
                                  }
                                },
                              ),
                              Text(
                                '${item.quantity}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  cart.updateItemQuantity(
                                      item, item.quantity + 1);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Text(
                    'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      // 결제하기 버튼 클릭 시 장바구니 비우기
                      cart.clearCart();

                      // ReservationScreen으로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReservationScreen(
                            reservationDetails: {
                              'storeName': '성심담의 아들 고태우',
                              'storeAddress': '경기도 가평 제니 펜션',
                              'storeDistance': '대성리역 1번 출구에서 3670m',
                              'storeImageUrl':
                                  'assets/images/reservation.jpg', // 가게 이미지 URL을 여기에 추가하세요.
                              'customerName': '강민규',
                              'storeContact': '0789-091-172',
                              'pickupTime': '20:00 - 05/08/2024',
                              'reservationMenu': cart.items
                                  .map((item) =>
                                      '${item.name} ${item.quantity}개')
                                  .join(', '),
                              'barcodeImageUrl':
                                  'assets/images/barcode.jpg', // 바코드 이미지 URL을 여기에 추가하세요.
                              'orderId': '9877 6789 5432',
                            },
                          ),
                        ),
                      ).then((_) {
                        // 예약 화면에서 돌아올 때도 장바구니 비우기 확인 (옵션)
                        cart.clearCart();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 15.0,
                      ),
                    ),
                    child: const Text(
                      '결제하기',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
