import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:thurry/thuury_restaurant/shoppingcart_widget.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  Future<String> fetchImageUrl() async {
    final response = await http.get(Uri.parse(
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR83p7OhsY9UCzjGt6l0zkc8p_idlcosgHjgg&s'));

    if (response.statusCode == 200) {
      // 여기에서는 이미지를 포함하는 URL을 직접 반환합니다.
      // final data = json.decode(response.body);
      // return data['imageUrl'];
      return 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR83p7OhsY9UCzjGt6l0zkc8p_idlcosgHjgg&s';
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
          return const Center(child: Text('이미지 로딩 오류')); //Thurry귀여운걸로 해야함
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
