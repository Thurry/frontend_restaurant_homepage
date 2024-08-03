// reservation_screen.dart
import 'package:flutter/material.dart';
import 'map_screen.dart';

class ReservationScreen extends StatelessWidget {
  final Map<String, dynamic> reservationDetails;

  const ReservationScreen({super.key, required this.reservationDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('예약내역'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Image.asset(
                          reservationDetails['storeImageUrl'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reservationDetails['storeName'],
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(reservationDetails['storeAddress']),
                              const SizedBox(height: 4.0),
                              Text(reservationDetails['storeDistance']),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Text('예약자명: ${reservationDetails['customerName']}'),
                    Text('가게 연락처: ${reservationDetails['storeContact']}'),
                    Text('픽업 시간: ${reservationDetails['pickupTime']}'),
                    Text('예약 메뉴: ${reservationDetails['reservationMenu']}'),
                    const SizedBox(height: 16.0),
                    const Text(
                      '환경 보호를 위해 음식을 구매해주셔서 감사합니다.',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      '미스떠리 박스에는 다양한 맛의 베이글이 랜덤으로 포함되어 있습니다. 맛있고 즐거운 시간 되세요!',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Image.asset(
                      'assets/images/barcode.jpg', // 경로를 직접 참조
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                    Center(
                      child: Text(
                        'Order ID: ${reservationDetails['orderId']}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // 지도로 가게 찾기 로직을 여기에 추가하세요.
                  Navigator.pushNamed(context, '/map');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 15.0,
                  ),
                ),
                child: const Text(
                  '다른 매장 찾기',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
