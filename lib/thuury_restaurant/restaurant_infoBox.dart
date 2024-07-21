import 'package:flutter/material.dart';
import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http; // For HTTP requests

class RestaurantInfoBox extends StatefulWidget {
  const RestaurantInfoBox({super.key});

  @override
  _RestaurantInfoBoxState createState() => _RestaurantInfoBoxState();
}

class _RestaurantInfoBoxState extends State<RestaurantInfoBox> {
  late String name;
  late String openTime;
  late String rating;
  late String boxCount;
  static const String boxIconUrl = "https://via.placeholder.com/27x26";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchRestaurantInfo();
  }

  Future<void> fetchRestaurantInfo() async {
    final response =
        await http.get(Uri.parse('https://yourapi.com/restaurant/1'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        name = data['name'];
        openTime = data['openTime'];
        rating = data['rating'];
        boxCount = data['boxCount'];
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load restaurant info');
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Positioned(
            left: 30,
            top: 166,
            child: Container(
              width: 354,
              height: 181,
              decoration: ShapeDecoration(
                color: const Color(0xFFFAFAFA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF302F3C),
                      fontSize: 28,
                      fontFamily: 'Playfair Display',
                      fontWeight: FontWeight.w900,
                      height: 0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InfoItem(
                        icon: boxIconUrl,
                        text: "$boxCount Box",
                      ),
                      InfoItem(
                        icon: null,
                        text: "⏰ $openTime",
                      ),
                      InfoItem(
                        icon: null,
                        text: rating,
                      ),
                    ],
                  ),
                ],
              ),
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
            height: 0,
          ),
        ),
      ],
    );
  }
}
