import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thurry/thuury_restaurant/shoppingcart_widget.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  Future<String> fetchImageUrl() async {
    final response = await http.get(Uri.parse(
        'https://cdn.pixabay.com/photo/2017/12/10/13/37/christmas-3009949_1280.jpg'));

    if (response.statusCode == 200) {
      // 여기에서는 이미지를 포함하는 URL을 직접 반환합니다.
      // final data = json.decode(response.body);
      // return data['imageUrl'];
      return 'https://cdn.pixabay.com/photo/2017/12/10/13/37/christmas-3009949_1280.jpg';
    } else {
      throw Exception('Failed to load image URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchImageUrl(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || !snapshot.hasData) {
          return const Center(child: Text('이미지 로딩 오류'));
        } else {
          return Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 450,
                  height: 258,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(snapshot.data ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Positioned(right: 20, top: 50, child: Shoppingcart()),
            ],
          );
        }
      },
    );
  }
}
