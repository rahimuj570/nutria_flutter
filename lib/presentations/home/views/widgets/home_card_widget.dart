import 'package:flutter/material.dart';
import 'package:neutria/app/const_colors.dart';

class HomeCardWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imgPath;
  const HomeCardWidget({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: .w500)),
            SizedBox(height: 3),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: 12,
                color: ConstColors.lightGreyTextColor,
                fontWeight: .w400,
              ),
            ),
            SizedBox(height: 20),
            Image.asset(imgPath),
          ],
        ),
      ),
    );
  }
}
