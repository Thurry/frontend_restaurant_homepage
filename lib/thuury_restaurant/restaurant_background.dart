import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  Future<String> fetchImageUrl() async {
    final response = await http.get(Uri.parse('서버url'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['imageUrl'];
    } else {
      throw Exception('Failed to load image URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchImageUrl(),
      builder: (context, snapshot) {
        /*if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('이미지 로딩 오류'));
        } else*/
        {
          return Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 414,
                  height: 258,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(snapshot.data!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 414,
                  height: 258,
                  decoration: const BoxDecoration(
                    color: Color(0x662F2E3C),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
