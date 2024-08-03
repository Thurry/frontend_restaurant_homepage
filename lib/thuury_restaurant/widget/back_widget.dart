import 'package:flutter/material.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // BackButton이 눌렸을 때 MapScreen으로 이동
        Navigator.pushNamed(context, '/map');
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: ShapeDecoration(
          color: const Color(0xFFFAFAFA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        child: const Stack(
          children: [
            // Main icon
            Center(
              child: Icon(
                Icons.arrow_back_outlined,
                color: Colors.orange,
                size: 35,
              ),
            ),
            // Badge for item count
          ],
        ),
      ),
    );
  }
}
